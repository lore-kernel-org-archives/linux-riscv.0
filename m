Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B22C04A95
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 16:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLA8E7Q/vVuvXayHapXg3ztCFPrsHQ2pIpoB1tujQXs=; b=LYNDsMuMVQq7ar
	cA5oRr2FMecOvHhQN2K2s1K77dhXKeK1ST+lFbMtYit0uvUMsiYT8OreaihdShMmmupsrwa2y3vwE
	963lO4BT+J2EDD+WxBwLl/3Ne7FslQ8FjsiSEk8hUq/k3QzGSVsSORTXSKc7+XM/mbUVertAhEHCa
	EXjB8fMUhMSZbl+Lqw6P0qDKHfTm9Ae205gD4/r5kKgGATONAiYZ+zn33bq3sZ1YSXn6WuCnqmk14
	+hPmCnaZWXOYWaFht36bPEeuvIfCBGWX9oa5YV8255zdvnqSx4rvNBPzz2LdHevmSiFgOLIxJPN77
	IdNRpiBw30xjMLlDBD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZf-00EwZ4-Sl; Sun, 25 Sep 2022 16:33:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZV-00EwQa-Nq; Sun, 25 Sep 2022 16:33:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2762B6132F;
	Sun, 25 Sep 2022 16:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837F4C433D6;
	Sun, 25 Sep 2022 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664123615;
	bh=RRltkuwJX7LP5kK/3k3rhHeIM5Hot3r7Dzu5sm7vQRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sjlJCcJV0QLRS/2I5WmZcRYy+Fq+ZGX664xoh7M7CFkrLCN2vCY45z/EooBFQ0YHV
	 u3Q29Vpvh/y/bGaGHTl3lEjVDZHm9SM9um6UV9VFdQX+M+x+7a2pWsRcHVcGmX2NWZ
	 tAQKB71huoS7KtZZGo55h0YFq0jgkE4fSbCL65Ult0LCuQUsBdWQnuxqmY6FBTlQ60
	 vyqHgyrCjH+LFlBCESK/PdDWZGw8TdMaJNx3WdCYjdglkV0dFYnQbjjeLnRRHwr812
	 5R1Fn1oGFDtim8kl0vRLzsK/bcwb1GxaVZ5dZRF9YlLR3jKZq4Y7tjt7O0lBMVAoDm
	 IDpCNxrnrIBEg==
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
Subject: [PATCH v3 3/3] riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
Date: Mon, 26 Sep 2022 00:24:00 +0800
Message-Id: <20220925162400.1606-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925162400.1606-1-jszhang@kernel.org>
References: <20220925162400.1606-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_093337_867518_36A00686 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Move POSIX CPU timer expiry and signal delivery into task context to
allow PREEMPT_RT setups to coexist with KVM.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 79e52441e18b..7a8134fd7ec9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -104,6 +104,7 @@ config RISCV
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_STACKPROTECTOR
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
