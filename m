Return-Path: <SRS0=9tbA=M6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CABECDE42
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 00:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2117D21473
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 00:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K2mC9X2x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="D1OkQ00K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2117D21473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/GzayxOzqkMowxvhCRYVjU9YfDiccwp/K5DfhN2c3lo=; b=K2m
	C9X2xzaFleSMk0Dhkrble7yy1sMwipc6dAohuVAHvBfadmCfBreuwLuR+lQDAhoTsh/h3dLRNProL
	Mndk/eZkvliGo8SWSyzgQY7n4wZswUKoulNuoP2a7r5ufBTIeW+wFKA+HMG0BEbb5P+iPv6hr/6h5
	BM0tO3tKLIyo/YSikalfr3XvaJ1F+oKLErfmRoWvw8pYQRFViIRgcITDKzoV2cavS2o7MJ1nnVQLh
	jwx0GZHRXkKssmurrZo0Gfkx6YPncdC11xHQybvSWVbYq67ugPP2tcCA2kO8X6T5YWZWtEMKDywtb
	J+SmPY1lQtXDsByn2F0qqHeXl7dg/tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCwep-0003AS-0Q; Thu, 18 Oct 2018 00:59:23 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCwem-00039V-Gc
 for linux-riscv@lists.infradead.org; Thu, 18 Oct 2018 00:59:21 +0000
Received: by mail-pg1-x544.google.com with SMTP id g12-v6so13346264pgs.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Oct 2018 17:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=grq0lqwT7TFIVahkiJi3wmh+h2GYzX7/UWHwQlHJCYM=;
 b=D1OkQ00KogCaKGB4EJ7AQ7hxcZ/DfFcHwxi5ITlt4c25u8r9StEgtq936ESfOmYrM+
 hrY0FOSwo7LfEbBKB0qSK2zdoZPi6Y+z1xZUTV7M7G2ehN5RcjDDvme53Up6eZ8qYENM
 lTmPkGjk2N7KC7wG/Cvw073VfUvvT3oOP/j+Rwbq64qtwCIhmmvbfS5rRKHXwxMsNTIb
 IOWfaqUYBW1fGnjotZs8FBgdQ6+GxM9le0FSlpkL8eLvDFO303jdui89I4tPzv+AtNOv
 7CW6TF7yxiDIYCPKH9E/MbqxJdeolD6WklDR/StwPWBEM/rQq8ZI8PIORkSOGOcFcga3
 aIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=grq0lqwT7TFIVahkiJi3wmh+h2GYzX7/UWHwQlHJCYM=;
 b=PhGSAoFAICGU6S8WWNyD3ySb5yns6kBrACDFcm3fBmB5WfeUZiCEOz0ugvsip71Lrv
 sEn+cbx6G9A6xLKKKv966A4zEsItM1PUKXte4mfknqox1qM2XzKQNlTn61ucQ4TrJmHC
 ntJzhd1JZz8iSArGzTwclNLzVgqinlfPP1NKX90DFPLK4r9xRYFlhFJD2ZrWRuNaAtuG
 ONkp8bfcO/NQRJIhaRBLtFBK9WovFOCZKEf2L+6teOuPwS45GNYMsUJwb+RfE7gs8VFw
 GBYRFO/cyDZmQExjJF/nUgPHjVircxwfKJywVW1cq77tJ5PCPN3O/qDOwHTPTJDjCldG
 saMg==
X-Gm-Message-State: ABuFfoiTwzQNcTm/YnFuJs/3ftAYOFaR4cjHWawiAg0R33smI2mO1Rdq
 Ec/y2CtQpju5auzFck9sbZbyezhlv4w=
X-Google-Smtp-Source: ACcGV60P6qM/uKyNQeFHiYspTOsTc43QBsxMo3qFVRxmBkBjTWWRy37SLHJDq9+ROYFraFhbQlGBUQ==
X-Received: by 2002:a63:1342:: with SMTP id 2-v6mr26373128pgt.19.1539824349215; 
 Wed, 17 Oct 2018 17:59:09 -0700 (PDT)
Received: from rohan.internal.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g6-v6sm27528121pgf.33.2018.10.17.17.59.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Oct 2018 17:59:08 -0700 (PDT)
From: Jim Wilson <jimw@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH, v2] RISC-V: Add FP register ptrace support for gdb.
Date: Wed, 17 Oct 2018 17:59:05 -0700
Message-Id: <20181018005905.8100-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_175920_581946_B5C6BD5E 
X-CRM114-Status: GOOD (  11.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jim Wilson <jimw@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181018005905.A_5PO_lCsLh3EbTUKE-03KKWLp_tMiyFNL4eyWoLPEw@z>

Add a variable and a macro to describe FP registers, assuming only D is
supported.  FP code is conditional on CONFIG_FPU.  The FP regs and FCSR
are copied separately to avoid copying struct padding.  Tested by hand and
with the gdb testsuite.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/include/uapi/asm/elf.h |  3 ++
 arch/riscv/kernel/ptrace.c        | 52 +++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index 1e0dfc36aab9..644a00ce6e2e 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -19,7 +19,10 @@ typedef unsigned long elf_greg_t;
 typedef struct user_regs_struct elf_gregset_t;
 #define ELF_NGREG (sizeof(elf_gregset_t) / sizeof(elf_greg_t))
 
+/* We don't support f without d, or q.  */
+typedef __u64 elf_fpreg_t;
 typedef union __riscv_fp_state elf_fpregset_t;
+#define ELF_NFPREG (sizeof(struct __riscv_d_ext_state) / sizeof(elf_fpreg_t))
 
 #if __riscv_xlen == 64
 #define ELF_RISCV_R_SYM(r_info)		ELF64_R_SYM(r_info)
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..60f1e02eed36 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -28,6 +28,9 @@
 
 enum riscv_regset {
 	REGSET_X,
+#ifdef CONFIG_FPU
+	REGSET_F,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -54,6 +57,45 @@ static int riscv_gpr_set(struct task_struct *target,
 	return ret;
 }
 
+#ifdef CONFIG_FPU
+static int riscv_fpr_get(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 void *kbuf, void __user *ubuf)
+{
+	int ret;
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
+				  offsetof(struct __riscv_d_ext_state, fcsr));
+	if (!ret) {
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
+					  offsetof(struct __riscv_d_ext_state, fcsr) +
+					  sizeof(fstate->fcsr));
+	}
+
+	return ret;
+}
+
+static int riscv_fpr_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
+				 offsetof(struct __riscv_d_ext_state, fcsr));
+	if (!ret) {
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
+					 offsetof(struct __riscv_d_ext_state, fcsr) +
+					 sizeof(fstate->fcsr));
+	}
+
+	return ret;
+}
+#endif
 
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
@@ -64,6 +106,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.get = &riscv_gpr_get,
 		.set = &riscv_gpr_set,
 	},
+#ifdef CONFIG_FPU
+	[REGSET_F] = {
+		.core_note_type = NT_PRFPREG,
+		.n = ELF_NFPREG,
+		.size = sizeof(elf_fpreg_t),
+		.align = sizeof(elf_fpreg_t),
+		.get = &riscv_fpr_get,
+		.set = &riscv_fpr_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
-- 
2.19.0.rc0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
