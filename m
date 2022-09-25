Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26EDC6FA8E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmtBobFiH7r+ProJaW79McZXMAzF1c91qTAisFHeB9o=; b=dSINCYmjeqCEGA
	/VfRk4+wgycUEzeypKTE+pMRMRcd5Tz8JXhMvnIAKyu/TVNYGY1bsYdr0+kN051hnbRBqi6t0dAuX
	bL4xFp3A2yZuV030si5FQArQ+8v2wetvZKtdwhHkM7xqT1uxi186J3NEqIA7AgDVUE78if6+fvYtD
	qJsdboO/yfEte6dZxkNqhqq3BZN4eTDl/SxWRnWABQz8UF0t0yJ5+vvemo5ntI+3e3lSHzIWld3vj
	S4B8EyD5K+mWIR57RioxflNZ125LP6fJfTjjxzmlyViASq+3fWDns/VxZHs0dkHsF5JQkdMEE52zK
	xEE4dmechR07iYlYAy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZX-00EwSK-Ms; Sun, 25 Sep 2022 16:33:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZR-00EwNf-PA; Sun, 25 Sep 2022 16:33:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5A49B8075E;
	Sun, 25 Sep 2022 16:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38BCC433D6;
	Sun, 25 Sep 2022 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664123610;
	bh=X2tPBwFu7XVmB6phIN9skedNXoCQvadtocOI5Ou7AtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPdRfvFtW0WRhW9C4udt05mWeCWMspx7nilWZiXVlW7y31giIEBECAHp1NmrSnOcI
	 u1b0R0S6CmsbijTb4AJBolW0v6gjmwjCELmXkr/169bervoD2kUf/qrk4Ezlyd0sdj
	 rlyx5Q/5TUP3I1D5Qgiq/Pa9XZCSkGWITBXIIbZTbTxLZKXSUYCqNz6+UdX02D7hU+
	 NlwHtkPRUzkTtXQUHlK0qrP+fFYoO7n479+nnBbn+tWp3hHH1xnnw/xf+mFe5CvF+n
	 TF1oXM+GP94ECdFAWSgasVpSsKUtMd3+D++TeScxKoDJPu5NS97pAOmSa7qDTPxfXL
	 mxGW5mEfWrZjg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 1/3] RISC-V: KVM: Record number of signal exits as a vCPU stat
Date: Mon, 26 Sep 2022 00:23:58 +0800
Message-Id: <20220925162400.1606-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925162400.1606-1-jszhang@kernel.org>
References: <20220925162400.1606-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_093333_979986_3CDDE0C9 
X-CRM114-Status: GOOD (  10.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Record a statistic indicating the number of times a vCPU has exited
due to a pending signal.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60c517e4d576..dbbf43d52623 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -67,6 +67,7 @@ struct kvm_vcpu_stat {
 	u64 mmio_exit_kernel;
 	u64 csr_exit_user;
 	u64 csr_exit_kernel;
+	u64 signal_exits;
 	u64 exits;
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..3da459fedc28 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -28,6 +28,7 @@ const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
 	STATS_DESC_COUNTER(VCPU, csr_exit_user),
 	STATS_DESC_COUNTER(VCPU, csr_exit_kernel),
+	STATS_DESC_COUNTER(VCPU, signal_exits),
 	STATS_DESC_COUNTER(VCPU, exits)
 };
 
@@ -973,6 +974,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (signal_pending(current)) {
 			ret = -EINTR;
 			run->exit_reason = KVM_EXIT_INTR;
+			++vcpu->stat.signal_exits;
 		}
 
 		/*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
