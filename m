Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128EFC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 03:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FysVhXaxy4JUxuvt9y/7A28RtFyLbl7aOzmbPA5PcEE=; b=SaCjd+VxQh/afh
	R5BCF6Xv7rb8/rnfyFUymf7Ta5Q/mnQeclS9hG9PZ1cypGNeAAXAdSLWAKuwrERoWcIU7qegkTkm5
	jFEOOUpRFNgZM8rn1hYPLft+kAqUNLVJyhBjV0aawJBPSpb9WeR6wmfQqYQXvgpncEJsoVfbVnviR
	Za/BoZNqM/aKmz0aVjt2/GgG4J/KzogOejPtlIiNPajbCLiG8KwXhI3XsWlURR5R8MFdgQtouNY/0
	PYxKj/beTrNlGl6oeQEl77kP3UKDOG5SHDOFdmUo3tXIaZsa2eeExbJbDcVOdmDYAXKOhHYupJVlQ
	xQUBb60zuqp6w7lJ/RJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqTo-008ZTA-3y; Wed, 21 Sep 2022 03:32:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqT2-008Z3V-E6; Wed, 21 Sep 2022 03:32:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7DA3B82DA0;
	Wed, 21 Sep 2022 03:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C1FC43470;
	Wed, 21 Sep 2022 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663731125;
	bh=MxNuze7CJb1Pmp8L25+DA/brD4eP/MM76a60K8U4Mcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRxeTfpE+CmJ/UHg18U/YEKM1cdw9Nd3/ZrMO+2WFlPQcIVZmG+oLxSeOIhiqj56m
	 30PUkA8R4skrh/squVPaUW2yj1m6I8Fo5mLX3/pyuNyIY0OMQbhrQluBMmcoKAjmu2
	 Zp9XtC37CjSARm5j/qE2CdK2w6c/YsSL57SNs8KPW0ZFXTLDliXZx30woV5Knoc4aO
	 Y4fy+5wVX9wUM83y8byyhaKmtUaLVvmFLCg4E3MWPFgbYzy8ihHsV+AxJ4PVnE7ja0
	 e/nLwc2DtA6WcmfvtE/jt0kHwDO9FPdhe6hUBQ+s/2HzV96A/6IIm2nnsA3rIs9ogo
	 gnPzMokyo8yAA==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	palmer@rivosinc.com,
	heiko@sntech.de,
	liaochang1@huawei.com,
	jszhang@kernel.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V4 3/3] arch: crash: Remove duplicate declaration in smp.h
Date: Tue, 20 Sep 2022 23:31:34 -0400
Message-Id: <20220921033134.3133319-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220921033134.3133319-1-guoren@kernel.org>
References: <20220921033134.3133319-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_203208_631422_2306C40F 
X-CRM114-Status: GOOD (  12.14  )
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

Remove crash_smp_send_stop declarations in arm64, x86 asm/smp.h which
has been done in include/linux/smp.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 arch/arm64/include/asm/smp.h | 1 -
 arch/x86/include/asm/crash.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index fc55f5a57a06..a108ac93fd8f 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -141,7 +141,6 @@ static inline void cpu_panic_kernel(void)
  */
 bool cpus_are_stuck_in_kernel(void);
 
-extern void crash_smp_send_stop(void);
 extern bool smp_crash_stop_failed(void);
 extern void panic_smp_self_stop(void);
 
diff --git a/arch/x86/include/asm/crash.h b/arch/x86/include/asm/crash.h
index 8b6bd63530dc..6a9be4907c82 100644
--- a/arch/x86/include/asm/crash.h
+++ b/arch/x86/include/asm/crash.h
@@ -7,6 +7,5 @@ struct kimage;
 int crash_load_segments(struct kimage *image);
 int crash_setup_memmap_entries(struct kimage *image,
 		struct boot_params *params);
-void crash_smp_send_stop(void);
 
 #endif /* _ASM_X86_CRASH_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
