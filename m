Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8097D2A55A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxTpqhqW93UKyrk7ImHvDwMdLwhhIkh+1WRsoqlSYO4=; b=BxP/rrsBiibRhV
	Bdw6om1/n59ZdF1uPkb3YzKwvai/1XkAE8svVj/qYRYg4Z0C7EGHph+0ZxbxXhGWczGafYsErEDfJ
	ilXlTiQOOA1zKaAzg5Ex4miW+MtRmZLFFJ2dv3NMXOsgHlO3Qja6Iy1A9idv6Ku7Ojn8B28aiXxdS
	dgPdRnetBK/M5gEFvEfCCP7CY2CxITHHMDh3d35WkKupD0R+h9Ae458vccGPP0JnueaI48cuLi57D
	LMKrD961O4obht95AmhfYAuCLZtGtX1JB2eQBCIpErnEessAEI91ABIg09OtarIhBYNUvhkeQIBkb
	Ch3XvAn59jLfD/2+LWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdM-0000000CwaZ-23qJ;
	Wed, 16 Oct 2024 20:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdJ-0000000CwZO-445W
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 20:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1uGi1aMTi7US+D+u4yTVB4/InTmfvX6ggJnfvqiu44I=; b=koJDEWgxNTrvwQHwHf+bRLHeOD
	7Our+Eans6H68mdfN+Bc1uqt7YOglL/eUsOYCz3UuE431m4W/GGhhobL7iK6kwvZPGzRrS8O9nkhW
	OacsdozcBQ5VWyFHh1sP94qH2xHo/P3MfT0ZZecfpp7h59WzSZvanxAzZ3EADus1xPpecjSuXoQX7
	Wr41GWeV1HxiLZsl/vowAEqLk0+yrrqSCQ0EDIGiK/GLyI+6wOV4cr4ouBpxkozrJ8HvUP45NwG+1
	TEHjSypKPAsqPtXCzzfhZguDx7igpgoESAErUmluyuIkqxXDx7tsBR+UylKlmoRd3ozOzsmhNeCZN
	qNrzYiDw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdC-00000006u6s-39Gl
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso176540a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110508; x=1729715308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uGi1aMTi7US+D+u4yTVB4/InTmfvX6ggJnfvqiu44I=;
        b=CCkG8uvhqxM4UrqWo0LSKo7pqVAMNo6yBrbgiVzapsZOOhyqH+IecVf5K0zBKLkRqQ
         F4co1ROr5jX1Pp7dFhyJRMCfCX1Gp7lfo6o3C3vpi1ls4g5UxhZEPv/St8Qihk/LpZci
         GT0H75gJIw7a9hENFZu2FVi52xw3Dwm8DNB91ZZFWJR8ZmV34U0xUzr+z86yy6Dr90P6
         qVWClkNLC4FMnAY7v41OOb2I2jAJT1sxnFZjpxZ7E62HA2igw9pL1rZcFMvvjax0tRs6
         CGPRzsIHzsay3pbIXIrdOAT5KLhPj46A+JXtXjcORj34obY1vLU7wjA3sfBq/nGhsf5a
         tPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110508; x=1729715308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uGi1aMTi7US+D+u4yTVB4/InTmfvX6ggJnfvqiu44I=;
        b=eS2x747dMl++MDorRF3tM2YFheIR85w9A2IOpy9ZgewvLVt/008HKmGENztlv7E14w
         6/CldlxwHAt3gLBM7kqX7CICmXcHQDCkdSIl1KgvU7C61ggOgWk4yv18GBPghyohZN+c
         k+XjE96Ad/oB75QQ9Vj60pH8qDYHoqfFqqHhkm6gOWQhwVU4axfLMB7jomAPeIWbAnbj
         FYPUb1ZNBgQLDAPn3Tza4+N6+m5DtBkSrHUXP9OakovIdvkiDJPHlR9reQB3NCd0K2FB
         EijI2dYvOI7T9s/esKz/MNrgFT9VtKk1yVS37CGJDa/8mZQWTj9d8OIezZuf/YZqqPit
         2BdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR6ebEAWLTyIF98R9SlBBrTE9WAkYXgKE1KIATfsKpUhS+i5uybIWk/m2NISCU25XZDaEOpvFsQHL8cw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4p+zgzcqNT/uRMWsTDmZ8WroeXCVx7ZaCLXZrUauYz62eGnpF
	8TdYJJPXS83YFab0Axtid6ixBeV0pGD5JT+EhG9dhRMd0R3s76apPpsK1NkBXxg=
X-Google-Smtp-Source: AGHT+IGSEnrSg4Mtd2QlgC0KM50/DbbUFup+f+Rpyjxlo7a/auHeGt420O/OiC9CP9awld5TXTH74g==
X-Received: by 2002:a17:90b:104d:b0:2cb:5aaf:c12e with SMTP id 98e67ed59e1d1-2e315371d8emr21626897a91.37.1729110508003;
        Wed, 16 Oct 2024 13:28:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 06/10] riscv: Allow ptrace control of the tagged address ABI
Date: Wed, 16 Oct 2024 13:27:47 -0700
Message-ID: <20241016202814.4061541-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_212831_131349_6738C609 
X-CRM114-Status: GOOD (  12.69  )
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

This allows a tracer to control the ABI of the tracee, as on arm64.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/kernel/ptrace.c | 42 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h   |  1 +
 2 files changed, 43 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 92731ff8c79a..ea67e9fb7a58 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -28,6 +28,9 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_ISA_V
 	REGSET_V,
 #endif
+#ifdef CONFIG_RISCV_ISA_SUPM
+	REGSET_TAGGED_ADDR_CTRL,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -152,6 +155,35 @@ static int riscv_vr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_ISA_SUPM
+static int tagged_addr_ctrl_get(struct task_struct *target,
+				const struct user_regset *regset,
+				struct membuf to)
+{
+	long ctrl = get_tagged_addr_ctrl(target);
+
+	if (IS_ERR_VALUE(ctrl))
+		return ctrl;
+
+	return membuf_write(&to, &ctrl, sizeof(ctrl));
+}
+
+static int tagged_addr_ctrl_set(struct task_struct *target,
+				const struct user_regset *regset,
+				unsigned int pos, unsigned int count,
+				const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	long ctrl;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
+	if (ret)
+		return ret;
+
+	return set_tagged_addr_ctrl(target, ctrl);
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -182,6 +214,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_vr_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_ISA_SUPM
+	[REGSET_TAGGED_ADDR_CTRL] = {
+		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
+		.n = 1,
+		.size = sizeof(long),
+		.align = sizeof(long),
+		.regset_get = tagged_addr_ctrl_get,
+		.set = tagged_addr_ctrl_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b9935988da5c..a920cf8934dc 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -450,6 +450,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
+#define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
