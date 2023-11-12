Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EE2C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfeKG+2qVF+oPrEKz1ZaaLLfC1c2a6mIrMhMymFP9QQ=; b=V6UBJIUzOL7f/b
	/RyTZlgCeKkmYp/dTJ2zyItxAs9cob2F7M4rhkQ9KRa58wf3i+8xQUtzNy3TVHnWLYY4mx6Auy+np
	RX+U7+om7AuFWCMQTkGnBbZf9INKkuM881qzHPS3woJfiV+GY7o6uNbUH/7Y6ZhiIRKN02NAQcU0S
	yVkT/0Pggo52wzYZmdaThpIUOF4+NO0SiBfxWUfDkj9FCxOjYIxHDGnt76sdRfaWG7Pis50OkvMaC
	bVokqlSYvuSl1ifHlXLJkvKk97555ebQAAsg7aXHXUmMLMm8Pp6RaWseYzeqBBhHEXwJnkMVixXQe
	nYW6so64ibwgJpRblRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nQ-00BkgV-1K;
	Sun, 12 Nov 2023 06:18:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23nM-00Bkcu-26
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 502E7B80A2C;
	Sun, 12 Nov 2023 06:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E993CC433CA;
	Sun, 12 Nov 2023 06:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769886;
	bh=pCbLyhlTiTCPVyjC6F0x/RIOJUl3eHTLK6u1tDMFHiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CbhMDVf5Ls3HY7vX7w6FISj1kn1U4VVPGZX4dsUZKDlZoIDE6gN68LYCDykSmzwq/
	 HW0hrA9GMbmEYenBeVuylzxp0i40jlJS2sb74sRLRaQ7a28yqIyPj9pyIMqLEXwWdH
	 womA6+yJRG46rjsiYplmtxAQnB1q+T0g11SjcvYIFwMpeVdQxIM03g9v2CFzu3QD95
	 4kfemghrnDw8pcpdHOqG0p/JJMRLzSyTLGUTIt1gBNht3bc8n9RJ547lfMACGeRf9M
	 0cQcGwBytXmIbT0qepXitV/1fhx0YB7aPqbEHs86kXMbtwoNMJH7ZAyUeICU2LVS3C
	 QAYg6f/FQx6MQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 26/38] riscv: s64ilp32: Disable KVM
Date: Sun, 12 Nov 2023 01:15:02 -0500
Message-Id: <20231112061514.2306187-27-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221808_827105_EFDACA25 
X-CRM114-Status: UNSURE (   6.91  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Disable the KVM host feature for s64ilp32 first, and let's work on this
feature after the s64ilp32 main feature is merged.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index dfc237d7875b..3033fc1f7271 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -20,6 +20,7 @@ if VIRTUALIZATION
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
+	depends on !ARCH_RV64ILP32
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQFD
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
