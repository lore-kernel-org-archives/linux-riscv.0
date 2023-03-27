Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E608C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YZMHgjYwv0yN8eFiB+c05zoIZAvDcdqtaF42gjZbhc=; b=4lCu0D6TB1Pttz
	d0FwN+XeTHU2AlzGqAJ4CkUIc/cB/r0WuUCr8CM9ogRDV/LHh6G/rlpwkJHxcUDvbqDWgtgQHnT/I
	hWeGGdOx3oILAtLu21yxI5+ozkkHrjmKKozHDCeVn8iaup3l2RqmrAPIi+pQIKNNBzSybRkWC3M1i
	mgNbdWnCj4VJ+At6fTBKLo/35L2MA6cWCG3rWU9GvBJn/htjFSVIAN/rdgqUNA450dsxAq9yyW8lh
	au9h5II71nLPt6NNH5SjCMQK7fyt2O+dNDVAOpwqB1d7FlnW/za2GkUiWbRRLWrv6tGabSQhZlDp/
	AStrbBR9+1YoZ7BUJs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3i-00BlcN-06;
	Mon, 27 Mar 2023 16:51:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3e-00BlKY-24
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so12396084pjp.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935858;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/CoWMWIQZXnMP/KNxBlY67PbYq9vDOHMJRCBoKpsrw=;
        b=YRmyxvdIyWINHT/pjNRSSGTLCp0/L9FT8pNxRFTmdJAfaxW9ljUGYnHytf0rmk//YF
         f4rpMahYmkxv0sx6EJNrh5ulnd5ZERYxIQKHit6cEqVaHz6FP2LINylBIN6O6IQmxZv5
         hq2NGZS+bJ8r7JmThbPkxS1SL6L65cQ3jy/9Iur3eb1oUcHxEppYw6NZ3xmbtYw+fYIo
         7N8xIPWxHb695zRQRthWYZZevxiIA/ACvGBMe8tXJJADhEZ1GFuntwTMdHIZ8bgvJHpQ
         s8x1pf69yQRqLM5AuuORPWDovfKq7lnD6dZ3tl0z0Eq0kqGlXrgbqk6Qzh8yPGELf/vo
         hEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935858;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/CoWMWIQZXnMP/KNxBlY67PbYq9vDOHMJRCBoKpsrw=;
        b=YsM9tA9Gh+sJLMuQF/QrvdwiHVP+C7no7xies40eAYSSe9m+OJJF8nKckYsx5QHhxp
         Oj2wL0XoOTaG4QmHGuqVCy6fpvq0G+ug6YquzhESYzZL5pQhsWoYC/5RF30Q4EcsAONJ
         p4y0xV/qoMmStcTpNjS0/rv+D+zft96oyCjBOLiYGvy5q2/S37/Y50pKuxv0ib+wvSBD
         qBWJySKyMGIMKcLfXv1RNeA16nRCXlHH+akhKxGKQRLqUXbcdQiRcmCdyz6CSPwtU1+4
         AMaHoQcP4OTUs/eeldyC15hM8WSoMhP5NnOv97LwV3qQUDTiJgUy4quC0dsdM3+0IaQK
         5tUg==
X-Gm-Message-State: AO0yUKWO+VGrsL1Y8PQR6/YZZ8dEU5qIAfhGyqTeMe+gTCfn6T0LTbaZ
	h0cJSd7+JjJDg9oDXiHGI51CYmHETFkzNrE8eFe4VNXqN40hIwn0jzfeJdk8Hu+nE1T0JjK68sx
	GTp+2d2MSaqU1hRkECFIeSsnYYw5TO0wlnq1+lB7EjU90Bzey+0Lv/wEWecKASJjxhYueZKUobp
	5FastI+2jT1T/7
X-Google-Smtp-Source: AK7set/9lp23oY0lwj5aw/dfQ9vRlbzt1nmJwFnW5gzGSiK8k4ewRE5VNaIcS7Cjd4Qypf9ugaN+ng==
X-Received: by 2002:a05:6a20:1aaf:b0:da:53ca:8f26 with SMTP id ci47-20020a056a201aaf00b000da53ca8f26mr9571774pzb.30.1679935857791;
        Mon, 27 Mar 2023 09:50:57 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:57 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Rolf Eike Beer <eb@emlix.com>,
	Qing Zhang <zhangqing@loongson.cn>
Subject: [PATCH -next v17 11/20] riscv: Add ptrace vector support
Date: Mon, 27 Mar 2023 16:49:31 +0000
Message-Id: <20230327164941.20491-12-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095058_701538_300D248F 
X-CRM114-Status: GOOD (  21.10  )
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
index 23c48b14a0e7..75e66c040b64 100644
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
+	membuf_zero(&to, sizeof(void *));
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
