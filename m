Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC63AECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HiqkRHWaIXYFi/h6+so7erk69hJVr/6FrjJH+sY0F0=; b=AYob1TTWABW9oL
	0d8SYqXIepVmWWBhXgvRf1DOVlL541BbizDKvPLz8LcGLVWm9IMdE1udzLxKNYt5bZ5gOyk4vwMZ1
	QE3XllVcCjzqZjZ32N7qvHTbPxfszwVIDvnZf/u6xy/K9Ew/lZBLFqfHYEbSOLgxnOSAJeP1yTYjh
	8B++lpcU8sw2Nx/RvJDwGIDlMqbaZWU3EfM0YpsrAG8voUudXGcqwSqvKE0oIjSF2VwrhES0hVJL7
	yqMta0E9Lj/ZIxk4f3d09MDmfT5eS2GoK7UABqV6aGF9fFXSI9Rfoj3mMWc8thXaRuQj1hvZgt1/w
	MUnDtGkq4cLpVbNV19gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2ub-00C3PT-Nl; Wed, 21 Sep 2022 16:49:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2uY-00C3Ju-BY
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:49:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bq9so10901173wrb.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=gqSubrlqj2HaC74aHL2k1nAHbEWi0zWIGWa6FjxCUv4=;
        b=1Oe5GFWBFxZ0m8tz7dwBUncAuUDhdLS9Cm/v+0waLu4MThjl+0JQLjCEyb+k+OesGH
         gvS2SpAK9cmJSsuC+aYp23/VJfLchg0mpgAZ4S5aAcN+/ly7ciIZ0Nlka+gn//DuQnY2
         a0+DQvUwvj6x6SUx2Wcr4GvA+6MlloQImgVakX2I5PVXgug/eg2bQozbxcYf4wzRjqej
         Clj0h4s2018JUn+kIiDob6QSKyxmZJ+bknUejti/q0zDYc41iMze6moT6GBMMlM6gVQa
         yE2WicxUR/NwLmWbjw1QxZtKqp52bb7emGnTYlduX1DEUmyzSZ1sXPLYttftHnmnaYb2
         GRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=gqSubrlqj2HaC74aHL2k1nAHbEWi0zWIGWa6FjxCUv4=;
        b=OkyDSd8k/hUD4gYjk/iHCCAyVp9nkbNApz8J3z/uUKithG4Diav4LeFy9G/yJMNJ7Q
         FoejsfNiDXmyu37zIlP7RyAXRhKecebZ5+kQ/Wf8ItmoPP21rBql35RTDFx0oSF4Jtfm
         +8Z0+OZ7wawlxRYl5N0TtlFhrEEve/KylUJETELONcdksrCIDu0QtZOIir5+MnVCpJ4E
         0WVg2D/Kd6TPpsFo9bCjrBz0+H3cMvfT+ONvqPmhW+gD2l+IjwuHj7VxZC2fuAKBLJi8
         JRa8GLNQ9PybBSw9kuyeTY1KztagRoK5ZtbrlxESvcAVl05BXrG63rHovXTnXiiiDxa4
         Hz6w==
X-Gm-Message-State: ACrzQf1hhaN1P0oUykFJkcg89SPq1uBZUSW3SHZEzYZojxYT/KbxU9z+
	zmhdCgxsb5zp9AVdGXMAoFYaC9DVBSFP+y6HVNKV2HRg98HBew==
X-Google-Smtp-Source: AMsMyM4WgQdXcSPCxGSFXzzMMjBk07N2VN8k1uzFowO0xmdYYrt7lvPi7S7Q8JTKwSX1fSjk97NQdzS7lnUUC5jS3s4=
X-Received: by 2002:a5d:588f:0:b0:22b:623:ad04 with SMTP id
 n15-20020a5d588f000000b0022b0623ad04mr8692524wrf.607.1663778954422; Wed, 21
 Sep 2022 09:49:14 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:48:38 -0700
Message-ID: <CAM2SziUMFKK+6Lo9AdFdRTjavf46WHcq+uRmvP9Av4T=aNw7hQ@mail.gmail.com>
Subject: [PATCH 09/17] riscv: Add ptrace vector support
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094922_418869_CDB135FE 
X-CRM114-Status: GOOD (  19.20  )
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

This patch adds ptrace support for riscv vector. The vector registers will
be saved in datap pointer of __riscv_v_state. This pointer will be set
right after the __riscv_v_state data structure then it will be put in ubuf
for ptrace system call to get or set. It will check if the datap got from
ubuf is set to the correct address or not when the ptrace system call is
trying to set the vector registers.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/ptrace.h |  6 +++
 arch/riscv/kernel/ptrace.c           | 71 ++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h
b/arch/riscv/include/uapi/asm/ptrace.h
index 6ee1ca2edfa7..2491875be80d 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -94,6 +94,12 @@ struct __riscv_v_state {
         */
 };

+/*
+ * According to spec: The number of bits in a single vector register,
+ * VLEN >= ELEN, which must be a power of 2, and must be no greater than
+ * 2^16 = 65536bits = 8192bytes
+ */
+#define RISCV_MAX_VLENB (8192)
 #endif /* __ASSEMBLY__ */

 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..cce459ff551d 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -27,6 +27,9 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
        REGSET_F,
 #endif
+#ifdef CONFIG_VECTOR
+       REGSET_V,
+#endif
 };

 static int riscv_gpr_get(struct task_struct *target,
@@ -83,6 +86,64 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif

+#ifdef CONFIG_VECTOR
+static int riscv_vr_get(struct task_struct *target,
+                       const struct user_regset *regset,
+                       struct membuf to)
+{
+       struct __riscv_v_state *vstate = &target->thread.vstate;
+
+       /*
+        * Ensure the vector registers have been saved to the memory before
+        * copying them to membuf.
+        */
+       if (target == current)
+               vstate_save(current, task_pt_regs(current));
+
+       /* Copy vector header from vstate. */
+       membuf_write(&to, vstate, RISCV_V_STATE_DATAP);
+       membuf_zero(&to, sizeof(void *));
+#if __riscv_xlen == 32
+       membuf_zero(&to, sizeof(__u32));
+#endif
+
+       /* Copy all the vector registers from vstate. */
+       return membuf_write(&to, vstate->datap, riscv_vsize);
+}
+
+static int riscv_vr_set(struct task_struct *target,
+                        const struct user_regset *regset,
+                        unsigned int pos, unsigned int count,
+                        const void *kbuf, const void __user *ubuf)
+{
+       int ret, size;
+       struct __riscv_v_state *vstate = &target->thread.vstate;
+
+       /* Copy rest of the vstate except datap and __padding. */
+       ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
+                                RISCV_V_STATE_DATAP);
+       if (unlikely(ret))
+               return ret;
+
+       /* Skip copy datap. */
+       size = sizeof(vstate->datap);
+       count -= size;
+       ubuf += size;
+#if __riscv_xlen == 32
+       /* Skip copy _padding. */
+       size = sizeof(vstate->__padding);
+       count -= size;
+       ubuf += size;
+#endif
+
+       /* Copy all the vector registers. */
+       pos = 0;
+       ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
+                                0, riscv_vsize);
+       return ret;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
        [REGSET_X] = {
                .core_note_type = NT_PRSTATUS,
@@ -102,6 +163,16 @@ static const struct user_regset riscv_user_regset[] = {
                .set = riscv_fpr_set,
        },
 #endif
+#ifdef CONFIG_VECTOR
+       [REGSET_V] = {
+               .core_note_type = NT_RISCV_VECTOR,
+               .align = 16,
+               .n = (32 * RISCV_MAX_VLENB)/sizeof(__u32),
+               .size = sizeof(__u32),
+               .regset_get = riscv_vr_get,
+               .set = riscv_vr_set,
+       },
+#endif
 };

 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index c7b056af9ef0..5a5056c6a2a1 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -439,6 +439,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP    0x800           /* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE        0x801           /* MIPS floating-point mode */
 #define NT_MIPS_MSA    0x802           /* MIPS SIMD registers */
+#define NT_RISCV_VECTOR        0x900           /* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG    0xa00   /* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR       0xa01   /* LoongArch control and
status registers */
 #define NT_LOONGARCH_LSX       0xa02   /* LoongArch Loongson SIMD
Extension registers */
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
