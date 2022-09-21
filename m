Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8EAC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7iSPZ9lhRC5+P91P3LqCeQponjwvV7lsnZcKxH9oaM=; b=Y6hMRD2sZEQlxm
	AtvfgpPwdtize7X73lr2h9znAS/DXybuT6xhcH3CVzgxRKPJ4aqyvNdW3AwgXJfgNJWy8oODF4CdV
	iGoRJCDGD4T+6VQZeiJnVn8QPXrvzOmQ2dYVpO55/SIjgdYyMH61WPOEeqY9xrCDCyP6lGphPDB9a
	kq54fORkvy59Wn68VgoYHd4i2OHC0f8j0wa3tQFzGCOnVxbJ6c9Talvcfm+78e/2atR1vp6mT3tJI
	z03U9YBb94rcU+waWlw7GwJwSi+9WBFn/XYGRRjjFxvQxEwjxNYyG8LmAKVV8ZJN8to9qyBrIkRMa
	zzwt6dbhJyRz383XQvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7cK-00CmGg-C9; Wed, 21 Sep 2022 21:50:52 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7cF-00CmD1-H4
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:50:50 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 78so7223951pgb.13
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+2Y/W36PtIBBFhLsRM7jN1P/q6NhH3hMDNv7n9pXDHw=;
        b=qCm1QFMAxTIfPcPUm4pzRx+jDvS7vMRzF6JW/wuRfu+wRhB/SOFquS8a2LWYrLuc9u
         AChH1XhIBzusCXwftsb3LPZlW4/5kbkfeJmTSTMgqt/5Zp94uzFCLVU10jKkGgVZ4erc
         aIoYPVajpNZkf5OZWmcMvbvFW6coRGbNimCk0QLTu/rPD03QD9h4WlrVzzcs6vQTEDfc
         pHSFPhogIqkNe2a/ATfPdYc5YA/4GAjAc3jbAB9Wq3e4MIfI8fNHLAr3MJEG5dbCZY7j
         OvBeSuENXhZRWI0XXRB4f81pipgdlva5Ws1d8lPZJmtWg7lApyyFn5AX9Ftn0ATSmPiA
         vFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+2Y/W36PtIBBFhLsRM7jN1P/q6NhH3hMDNv7n9pXDHw=;
        b=BzDcjts5BawRy5kH7vdbynu22NoDH19Zzg+2/E6iZi6t8zDVaT708gxWN/RxgE2uIe
         7FOiqsv8ojZdJ6djxCnZDdvOE52GfWEHNRU1dUMKnCiSOox1zXellmttuXKKfRTnj9uy
         1NW6+Hhl+LZwyP7OQMUoC3LRJ8cVInZtHU1M+N8AAFZkcfRE01X7/JUgh3Gl3IHPZ8wh
         qfai45qcWDvaAk8t65LQLnUiK1dAEr04PUPCuJ9tm2RAjNr648GXJg33iUV2tdumdR5J
         2WI8NahIK1X/umBlzgeWz8/Js5ZYEcW7wdmTwspgr0IFpoYy0g2Cj02bGG9x8adKz/93
         xrDA==
X-Gm-Message-State: ACrzQf0P2cZ7tR4Kup+GRz9kNhHeOorztVycIIz/qAhvqybbvSmVJHVE
	PyYWsuy7lRM+DVR6SpJilOuupg==
X-Google-Smtp-Source: AMsMyM6xihhqXZEV+L1F3aQGghgomWUQzsdYWKvtgiRAi5dEMTt8yQFXbNqYyV4J1EsPbbZpgDNCvA==
X-Received: by 2002:aa7:9107:0:b0:553:92a4:d930 with SMTP id 7-20020aa79107000000b0055392a4d930mr273417pfh.72.1663797044500;
        Wed, 21 Sep 2022 14:50:44 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:50:43 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Dao Lu <daolu@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Knight <nick.knight@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Changbin Du <changbin.du@intel.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Colin Cross <ccross@google.com>,
	Peter Collingbourne <pcc@google.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 09/17] riscv: Add ptrace vector support
Date: Wed, 21 Sep 2022 14:43:51 -0700
Message-Id: <20220921214439.1491510-9-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_145047_624270_CB854E1F 
X-CRM114-Status: GOOD (  23.18  )
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

From: Greentime Hu <greentime.hu@sifive.com>

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

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
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
+	REGSET_V,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -83,6 +86,64 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_VECTOR
+static int riscv_vr_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	struct __riscv_v_state *vstate = &target->thread.vstate;
+
+	/*
+	 * Ensure the vector registers have been saved to the memory before
+	 * copying them to membuf.
+	 */
+	if (target == current)
+		vstate_save(current, task_pt_regs(current));
+
+	/* Copy vector header from vstate. */
+	membuf_write(&to, vstate, RISCV_V_STATE_DATAP);
+	membuf_zero(&to, sizeof(void *));
+#if __riscv_xlen == 32
+	membuf_zero(&to, sizeof(__u32));
+#endif
+
+	/* Copy all the vector registers from vstate. */
+	return membuf_write(&to, vstate->datap, riscv_vsize);
+}
+
+static int riscv_vr_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret, size;
+	struct __riscv_v_state *vstate = &target->thread.vstate;
+
+	/* Copy rest of the vstate except datap and __padding. */
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
+				 RISCV_V_STATE_DATAP);
+	if (unlikely(ret))
+		return ret;
+
+	/* Skip copy datap. */
+	size = sizeof(vstate->datap);
+	count -= size;
+	ubuf += size;
+#if __riscv_xlen == 32
+	/* Skip copy _padding. */
+	size = sizeof(vstate->__padding);
+	count -= size;
+	ubuf += size;
+#endif
+
+	/* Copy all the vector registers. */
+	pos = 0;
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
+				 0, riscv_vsize);
+	return ret;
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
+	[REGSET_V] = {
+		.core_note_type = NT_RISCV_VECTOR,
+		.align = 16,
+		.n = (32 * RISCV_MAX_VLENB)/sizeof(__u32),
+		.size = sizeof(__u32),
+		.regset_get = riscv_vr_get,
+		.set = riscv_vr_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index c7b056af9ef0..5a5056c6a2a1 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -439,6 +439,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
