Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376B1C77B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwPSrtVrBk14F3qx7Jc27OgGdUuv6k4O4XIdgZV2BfY=; b=imcpw0QoNeL4DB
	oMXk/9e1VZGf4Najs6tw+8suPZlzPDeEDZjHu8dCOUUJ59ZG/o9q0/AQF8PhTlZw/FuFQCY8k+EgQ
	cPBrwkG8CslGM89yQSDnhOKahm63NNscqRHs6i35MuUrUQQOv69/Di63ma7m6cVL0IhlvUw+TVzjy
	Epu3B7fBHQfXRUpokz02UvPqX7Kd65OfBMmrGedGYqKnivV9QEBTFGlS36OwHQ2nvgF4XyaW6goVP
	3CywiutOms73UP5OsjMBRbNZ4CQR1osy12cgKnfbzB3ipzwcImTP029L15CoRaqHMm23ByDeoDf0E
	xuXHVPyvOwdY1hGRz2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqL-00A1yN-1S;
	Fri, 14 Apr 2023 16:00:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqI-00A1wb-0B
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id mq14-20020a17090b380e00b002472a2d9d6aso4422930pjb.5
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488005; x=1684080005;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a65b+du8aFNXXTEZ/EQ3wHPYPcrhTwtdey3aCUIWsNk=;
        b=XbvmyhijWNX+1F3ln8VlPekaqrwI4WWnOocEcmV4hs9e3sS0d1+GTH/js7q92+zeQG
         U+SDDtlxV18U9F4FtYcZA8LdpOUdM16K1joqjz/O3G4QNIlmJ7bzbWseTJtkxWTwopvT
         CvX6HM4r1ZQ2JSxoMdkSxr1U1ERS6ANfwvxRL7W2X9BDy57pDx5juUHDJZRmpzDvLsCF
         C/6aACkNzVJRha1t/uSoLGPuhUPC3nRJe5iZHXXV1NGQm2TEsJXT1dtz6TBiizVG3XWY
         2qA1y4YaBXtLYezq/hnSAp++CnLluylrEYuj+T6fiFpPh2onjEc82K7DxJuEbniRXUX6
         LuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488005; x=1684080005;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a65b+du8aFNXXTEZ/EQ3wHPYPcrhTwtdey3aCUIWsNk=;
        b=SdNqHGllKMTJLy0vczecKD2kpD4RS76TM7w3Yco4sg6xvLYsNVVRhlWU6y98oYq6BK
         8Rolx9l3OFmeHwIln/u+u1YjVq2pSMnt1JjQEuXfEZoShpiVh4Lk15zFzpYhslgUuzja
         L0Q4fghf30SNwV0LUZd3UsBIg72o31OOZrpvXNl1mesdzfkqTVfs5tGjse6qZywH32zK
         RQuZGz9ginCYufdAx+tga2SrUEqZfznOVimQEaj9baZljZAEUfhMw5i9ITdipM1L5vk7
         8ucofboitNn4LmDYKHVrtpN4tCsEbObQKiCQ1E+1ytGEAnBnodqLzcv+J4+9Kd16W/Zf
         kqag==
X-Gm-Message-State: AAQBX9c8tivkuQ7cGqxU113D1Syy8zg5wkKHveRz7K1qwJc2DtVuRnq/
	M4sJn8Qjb+OuOuXTHBwmL5U1/JRi7A8eV1LuPhPhR4dMnaBl98B6akw4p9L+vP6womMPrA1FX1C
	oJc4JFK9Vxeq/WmdjiARa0s0y54nXA+mZhmR1rb6z4W9fLSq9mwYSENlyP1Zy3FBvsK45uZMq0C
	xNco5tWkTOdNNw
X-Google-Smtp-Source: AKy350ZmWNEcmvKYQR8MAIFVjXFcQNcRkmcFcA0dLctILDIf6HCnMnKxM+m7tf8yQbqu2zMwWbUfeA==
X-Received: by 2002:a17:90a:b783:b0:23d:3fbe:2f7 with SMTP id m3-20020a17090ab78300b0023d3fbe02f7mr6167161pjr.20.1681488004860;
        Fri, 14 Apr 2023 09:00:04 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Qing Zhang <zhangqing@loongson.cn>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Rolf Eike Beer <eb@emlix.com>
Subject: [PATCH -next v18 11/20] riscv: Add ptrace vector support
Date: Fri, 14 Apr 2023 15:58:34 +0000
Message-Id: <20230414155843.12963-12-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090006_092899_128953C6 
X-CRM114-Status: GOOD (  21.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch adds ptrace support for riscv vector. The vector registers will
be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
right after the __riscv_v_ext_state data structure then it will be put in
ubuf for ptrace system call to get or set. It will check if the datap got
from ubuf is set to the correct address or not when the ptrace system call
is trying to set the vector registers.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v18:
 - Use sizeof(vstate->datap) instead of sizeof(void*) (Eike)

 arch/riscv/include/uapi/asm/ptrace.h |  7 +++
 arch/riscv/kernel/ptrace.c           | 70 ++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 586786d023c4..e8d127ec5cf7 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -94,6 +94,13 @@ struct __riscv_v_ext_state {
 	 */
 };
 
+/*
+ * According to spec: The number of bits in a single vector register,
+ * VLEN >= ELEN, which must be a power of 2, and must be no greater than
+ * 2^16 = 65536bits = 8192bytes
+ */
+#define RISCV_MAX_VLENB (8192)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 23c48b14a0e7..1d572cf3140f 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -7,6 +7,7 @@
  * Copied from arch/tile/kernel/ptrace.c
  */
 
+#include <asm/vector.h>
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
@@ -24,6 +25,9 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	REGSET_V,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -80,6 +84,61 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_ISA_V
+static int riscv_vr_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
+
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -EINVAL;
+
+	/*
+	 * Ensure the vector registers have been saved to the memory before
+	 * copying them to membuf.
+	 */
+	if (target == current)
+		riscv_v_vstate_save(current, task_pt_regs(current));
+
+	/* Copy vector header from vstate. */
+	membuf_write(&to, vstate, offsetof(struct __riscv_v_ext_state, datap));
+	membuf_zero(&to, sizeof(vstate->datap));
+
+	/* Copy all the vector registers from vstate. */
+	return membuf_write(&to, vstate->datap, riscv_v_vsize);
+}
+
+static int riscv_vr_set(struct task_struct *target,
+			const struct user_regset *regset,
+			unsigned int pos, unsigned int count,
+			const void *kbuf, const void __user *ubuf)
+{
+	int ret, size;
+	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
+
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -EINVAL;
+
+	/* Copy rest of the vstate except datap */
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
+				 offsetof(struct __riscv_v_ext_state, datap));
+	if (unlikely(ret))
+		return ret;
+
+	/* Skip copy datap. */
+	size = sizeof(vstate->datap);
+	count -= size;
+	ubuf += size;
+
+	/* Copy all the vector registers. */
+	pos = 0;
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
+				 0, riscv_v_vsize);
+	return ret;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -99,6 +158,17 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_ISA_V
+	[REGSET_V] = {
+		.core_note_type = NT_RISCV_VECTOR,
+		.align = 16,
+		.n = ((32 * RISCV_MAX_VLENB) +
+		      sizeof(struct __riscv_v_ext_state)) / sizeof(__u32),
+		.size = sizeof(__u32),
+		.regset_get = riscv_vr_get,
+		.set = riscv_vr_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index ac3da855fb19..7d8d9ae36615 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -440,6 +440,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
