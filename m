Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E19AC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X1mV7ADFZDEziNQmZsvQmYtjysILKeY80V2+GC67v7E=; b=I+4eftMf4Li5ZF
	IE5aNT2CmFHYvIYLLPL0hM8f3XXEh/S9EAYg1F2WiHVshxUg+RQGxrOh5E/k2BA+i4TgfJ54Wg6t/
	ZyoCD/T9xjXNfJaGISPMQ7eyS7noj6fIsvOKwql5HkaUmOaJeUbsjFpVfikLuu/GvRXYC5NZSLc9Z
	p18Hc2n0dwiSGBjRXvNwv48xhFXdd8uha6175XXVI6gIj2BEoYclaA3M5Q84jIEdsHBCPKcJCNBnQ
	X8OqA5yjSH59pzWx9Yu+aIcNeiepQRpIGF4VwSv9XFOv/lLSyMz6TjhvHP5kpe+OMLn4TMydM4aEr
	vWLyEq29l7stJLJu6Daw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2v3-00C3e1-Le; Wed, 21 Sep 2022 16:49:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2v0-00C3bD-RC
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:49:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id h130-20020a1c2188000000b003b4cadadce7so8204047wmh.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=RdNxjUT1Iwihmma6pljxet97EzfZHaVqcKftodv4caY=;
        b=RPEVVhA/vRIRNOuEYwYHgjEC3qLjcfP3x5evz6XTjIwL/kARoV3BYbhBoXPNSkgW1D
         9AnWxEkIHVWFNv5PXJigpZE+t/wSiahAC7dZEYv8AZD+DUbWfBRJ17FxpOO7lIbzuBVh
         td/HV2Fon1RJqla08K/IcE2LjJdaB4jZUegnLksMM0apQ8mV4PexaM/XTfsPk0h4VWCd
         IS+ifakg8nDnldGzWTnLECMgjfsOuXluwdtZ3DPBEGrJsWN34Lrl75OJZj0Zce1nHQMZ
         qP7hPWEIlW/OGc4lJ1oQNRie0J/bdvDDirlmjJTvo+i+lPhfE2N9NtZK1V2gWVd4RVwr
         seJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=RdNxjUT1Iwihmma6pljxet97EzfZHaVqcKftodv4caY=;
        b=gbzhppS+nSwrvJ/twh1VUwKJXF2LFskn7aJjpE1Bcamu641Ysp7MWBws+yLLvLNjXO
         R/ACfN7yLqlLBB5ESFg3zXExJu4s7d8ZJ8kyrPPBfVwGqxOS+i1rZEvxs3GUsJ7CG9Sw
         3kPIXbITDtix8mM08yr1yTsvljQvvrkCct2QkJVJfwk5j7VTritj5mEJVWL09BGX+1Cu
         7g9vKFD79WhDp3OCj+G8+RRV7BHpLSw2nuluCDxn2kKjId4C23a6HCMzlA/h1yWUrAj/
         PPZo1/636vk159v9Xi/weykF3bsmpPhJywpbi2vFaqT67CPmPIAUiTWBLS90M9nx7oOO
         Tx9A==
X-Gm-Message-State: ACrzQf3sPY2D0SACwcsG5Qx7U1T20eVFx13zdqyRoy335KFe8cwft6/G
	aIzjB/2iY6XFeMIdtkYB6+StTwfSEqKSgwPpT+LfcYZcUrjuLQ==
X-Google-Smtp-Source: AMsMyM4VIHs4G1awsBx+OjC3tOW2mzsVWUxHEA2MjLiBs4IVPBU8qtwH1dZHI5OtZi13U/FKkApa/rt9jUW4WG/zh7c=
X-Received: by 2002:a05:600c:410d:b0:3b4:9454:f894 with SMTP id
 j13-20020a05600c410d00b003b49454f894mr6439149wmi.111.1663778988316; Wed, 21
 Sep 2022 09:49:48 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:49:12 -0700
Message-ID: <CAM2SziUn=7x6Qs6MRkVESr8f=hrVCkeYg9x7oOPVJkhyZupkKw@mail.gmail.com>
Subject: [PATCH 11/17] riscv: signal: Report signal frame size to userspace
 via auxv
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094950_903241_156850F4 
X-CRM114-Status: GOOD (  15.05  )
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

The vector register belongs to the signal context. They need to be stored
and restored as entering and leaving the signal handler. According to the
V-extension specification, the maximum length of the vector registers can
be 2^(XLEN-1). Hence, if userspace refers to the MINSIGSTKSZ to create a
sigframe, it may not be enough. To resolve this problem, this patch refers
to the commit 94b07c1f8c39c
("arm64: signal: Report signal frame size to userspace via auxv") to enable
userspace to know the minimum required sigframe size through the auxiliary
vector and use it to allocate enough memory for signal context.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/elf.h         | 47 +++++++++++++++-------------
 arch/riscv/include/asm/processor.h   |  2 ++
 arch/riscv/include/uapi/asm/auxvec.h |  1 +
 arch/riscv/kernel/signal.c           |  8 +++++
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 14fc7342490b..df9047b619e8 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -77,28 +77,31 @@ extern unsigned long elf_hwcap;
 #define COMPAT_ELF_PLATFORM    (NULL)

 #ifdef CONFIG_MMU
-#define ARCH_DLINFO                                            \
-do {                                                           \
-       /*                                                      \
-        * Note that we add ulong after elf_addr_t because      \
-        * casting current->mm->context.vdso triggers a cast    \
-        * warning of cast from pointer to integer for          \
-        * COMPAT ELFCLASS32.                                   \
-        */                                                     \
-       NEW_AUX_ENT(AT_SYSINFO_EHDR,                            \
-               (elf_addr_t)(ulong)current->mm->context.vdso);  \
-       NEW_AUX_ENT(AT_L1I_CACHESIZE,                           \
-               get_cache_size(1, CACHE_TYPE_INST));            \
-       NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,                       \
-               get_cache_geometry(1, CACHE_TYPE_INST));        \
-       NEW_AUX_ENT(AT_L1D_CACHESIZE,                           \
-               get_cache_size(1, CACHE_TYPE_DATA));            \
-       NEW_AUX_ENT(AT_L1D_CACHEGEOMETRY,                       \
-               get_cache_geometry(1, CACHE_TYPE_DATA));        \
-       NEW_AUX_ENT(AT_L2_CACHESIZE,                            \
-               get_cache_size(2, CACHE_TYPE_UNIFIED));         \
-       NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,                        \
-               get_cache_geometry(2, CACHE_TYPE_UNIFIED));     \
+#define ARCH_DLINFO                                             \
+do {                                                            \
+       NEW_AUX_ENT(AT_SYSINFO_EHDR,                             \
+               (elf_addr_t)current->mm->context.vdso);          \
+       NEW_AUX_ENT(AT_L1I_CACHESIZE,                            \
+               get_cache_size(1, CACHE_TYPE_INST));             \
+       NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,                        \
+               get_cache_geometry(1, CACHE_TYPE_INST));         \
+       NEW_AUX_ENT(AT_L1D_CACHESIZE,                            \
+               get_cache_size(1, CACHE_TYPE_DATA));             \
+       NEW_AUX_ENT(AT_L1D_CACHEGEOMETRY,                        \
+               get_cache_geometry(1, CACHE_TYPE_DATA));         \
+       NEW_AUX_ENT(AT_L2_CACHESIZE,                             \
+               get_cache_size(2, CACHE_TYPE_UNIFIED));          \
+       NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,                         \
+               get_cache_geometry(2, CACHE_TYPE_UNIFIED));      \
+       /*                                                       \
+        * Should always be nonzero unless there's a kernel bug. \
+        * If we haven't determined a sensible value to give to  \
+        * userspace, omit the entry:                            \
+        */                                                      \
+       if (likely(signal_minsigstksz))                          \
+               NEW_AUX_ENT(AT_MINSIGSTKSZ, signal_minsigstksz); \
+       else                                                     \
+               NEW_AUX_ENT(AT_IGNORE, 0);                       \
 } while (0)
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
diff --git a/arch/riscv/include/asm/processor.h
b/arch/riscv/include/asm/processor.h
index 95917a2b24f9..a09141ecf6aa 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_PROCESSOR_H

 #include <linux/const.h>
+#include <linux/cache.h>

 #include <vdso/processor.h>

@@ -86,6 +87,7 @@ int riscv_of_parent_hartid(struct device_node *node,
unsigned long *hartid);
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct
task_struct *src);

+extern unsigned long signal_minsigstksz __ro_after_init;
 #endif /* __ASSEMBLY__ */

 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/uapi/asm/auxvec.h
b/arch/riscv/include/uapi/asm/auxvec.h
index 32c73ba1d531..6610d24e6662 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -33,5 +33,6 @@

 /* entries in ARCH_DLINFO */
 #define AT_VECTOR_SIZE_ARCH    7
+#define AT_MINSIGSTKSZ 51

 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 41d9a02c7098..fb1f5012416e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -478,8 +478,16 @@ asmlinkage __visible void do_notify_resume(struct
pt_regs *regs,
                resume_user_mode_work(regs);
 }

+unsigned long __ro_after_init signal_minsigstksz;
+
 void init_rt_signal_env(void);
 void __init init_rt_signal_env(void)
 {
        rvv_sc_size = sizeof(struct __sc_riscv_v_state) + riscv_vsize;
+       /*
+        * Determine the stack space required for guaranteed signal delivery.
+        * The signal_minsigstksz will be populated into the
AT_MINSIGSTKSZ entry
+        * in the auxiliary array at process startup.
+        */
+       signal_minsigstksz = cal_rt_frame_size();
 }
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
