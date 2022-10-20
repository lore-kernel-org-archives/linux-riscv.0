Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD31C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+69hFC+XWCi4Dx2oYyBoynD49xjWhnCnNGF5MicohS0=; b=HMrN3RxneQl2VK
	dMx9fy2T0CfG0Jm0zTPqess2nktzRt3BVBf9Hk99bmDgphOHjN6mn2UbYUilCbIOr73vvGIdUPsdB
	35vrxYn0s9hTRp7HmeO89ZOxAaekcLx7CvmFPohvCZ9lJEnDiSPLtnd0UmIsYxf4s+mf3+rZfRJxq
	HzoIijMP6i9ja+BD7TvKNn55z0I8RRZ93VOu3Aw7yrUfimmoZ+18Nrj4+iLAMB3u2kVNkt/J1MwN0
	GopWxowxjYQIEEggwOrq3kSk2zZGnuPdf5rjBYp171QkKOIwU2zKGEA6SmIasJFq0UsdVrjWMHJRn
	CpY0kzHBAuzhiihwTDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWQN-00G3Ae-HM; Thu, 20 Oct 2022 14:21:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olW4y-00Fp2C-IU; Thu, 20 Oct 2022 13:59:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B916361B8F;
	Thu, 20 Oct 2022 13:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA2EC433C1;
	Thu, 20 Oct 2022 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666274363;
	bh=cwUkz84JsLM2TshjpD90WcMoj2koUKfkqasFe6OlzrE=;
	h=From:To:Cc:Subject:Date:From;
	b=Z18qUnteaysOgIqGlS+z5kP7aJ5dDxbm5nFwuo1Efxdv5npV4+l/ke2X0jFrDW8EB
	 49hKVpInnqxEb5e938QukCtM5cFU+ur7Kkd+/XlqzbBdCsr2jwQqBjeVCbBJcirFTX
	 s43KPm3ZwMMqZ72pnqOauprL4eGdyL2P8VYq1C4gY4dKqNQ5dDxbZvY7glZ7VWixU7
	 svTdhJ25DrXaZ77dOLvqqm9ws6cLamepysT4IxvIp5q9SPPtdpMBupGMXgUTS2XBvo
	 XYwKTM6yi6ITR/pi/B8ANoPxCQGGoQ9+VQD5syAhfNb/yXmEPZaSgfArVYt0fSmGou
	 vDoX1h8OED8Tg==
From: guoren@kernel.org
To: arnd@arndb.de,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	guoren@kernel.org
Cc: heiko@sntech.de,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] arch: crash: Remove duplicate declaration in smp.h
Date: Thu, 20 Oct 2022 09:59:13 -0400
Message-Id: <20221020135913.2850550-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_065924_670382_C69CD4B1 
X-CRM114-Status: GOOD (  11.99  )
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

Remove crash_smp_send_stop declarations in arm64, x86 asm/smp.h
which has been in include/linux/smp.h since 6f1f942cd5fb ("smp:
kernel/panic.c - silence warnings").

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
---

This patch is separated from the series [1] to let maintainer take
easily. It still needs a Acked-by from x86 side, hope it could be
soon done.

[1] https://lore.kernel.org/linux-riscv/20220921033134.3133319-1-guoren@kernel.org/
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
