Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A24C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnEF+ZpASZxcKts1hga9tBCMCFXGnBoc2rq4O7U+luU=; b=dthWjy7vZCBZ7N
	GShfPCaec2hv+l2a1TI7100G5PgEv051nHdYRVLx105udd2ySAgJalufyscae421COD7Xm5y+5pp7
	p8EN3P7D4AprhZzkMdaP2mZy7+4IrXYQIGJkzisdO9DZ0nRxT4s6oU1K5IQYdGKhkPMOYK82s8aLX
	Q6CypF0L+X+nP7/BaApP01JwMWRQMTBo82me/5uSdJ7aIFBaPO1DYbBYTcvamKs81p1+IHjAv8uAV
	mzwOn/86uxDp0DlkTo0W+BtIosxncWhAPEWzKhtcO1xch2sqO7ETmFsOpEGF/OfeH27qq0YKgkhXg
	PbyTLAFtmkXIdOZjZXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99j-00000006CgC-1JHR;
	Wed, 14 Aug 2024 08:14:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99e-00000006CcK-0b5i
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fd9e70b592so49419655ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623289; x=1724228089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2DzaTFaQhCi8x+b8lScKZdT6wqGghcdZfo+S0TqwgI=;
        b=j5A4L0NhxyRiVO4xXbmd0AeDpTh7+G/cuVOHKeog8JHANQzgKu6ThTKmIUhWWmLFTQ
         1ar/EbRqiPAbSwv2CuBggAsSF6C4xXI+mI5r3+TUlpJav+4cxLlVngtJm9QxcGm9SkcT
         equ5ppfjKzYqeRwvz9m2bGqV7h4e2SmGE7E8ySd1dvonyatYmkZoAYe82eWPDKYOkaE4
         x1KO+SKP+FcczAal8JU5D8Vov9OqAT8l2R08Z2O8T095cY3iZ7Ixl0+qaGylxn2rd6ZK
         A/omwTp+P1yaNTGfu3ochSeEdquoxIgYOrZxAZios+1B3/UBBP/pQ8xy4uI3mIWfhkpq
         k3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623289; x=1724228089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2DzaTFaQhCi8x+b8lScKZdT6wqGghcdZfo+S0TqwgI=;
        b=IE+TH0YlCfvRhdUqSAsGHf5x0V7xzGyCqaN8llLAOI64+iWb+jff9DLSoisCJIS8c0
         E9aRNgRbFrNFHAJqUpAaHAGwlWI0K4mm/8G8uhODK1xzNoDGmmTfTMlT82QEjLUWlf/j
         c0sVc6qd+3tuX26GIHEeVozrD2/RnLBdR5fxpi3Zt/BYPp7linlvjCXG2az8McNO65pf
         67kNCgmjE6twz7gGcNBil1tF+Dhu/x1/k7hD3iIWC1hfCjjtdZNR+1Z1wD8dUhItSEbG
         TzZFqHYr8P5JqyD04h0BUVkJIsHLkKIUKDjX7gpR1A7ATNfXUfCMrdRroDQivJiHhxPc
         yzZA==
X-Forwarded-Encrypted: i=1; AJvYcCUPZeXB3SN73R0lrGcKxnX6kfZtKnPx3tdG8+UwXora3PTbJXAOxS3jUt7CHSgGvxWFt89OZNFPIdeMzTEHkRKTi2pvdvwFbvIPNIUgNRUO
X-Gm-Message-State: AOJu0YyBZxg+iVTAUsro/KlJB0VLO0f4mBtu0KL9P9OywxEdNY8hOrex
	j3DvCo5JSkJsfc8bT53q9NbybzD+s2fNjdELqR2U+l2xo6O5MFzDK2/4YUygmCA=
X-Google-Smtp-Source: AGHT+IG4BpTWLZpzwq2do52A6J/ucILAVlL+8y7ReGWNQMP5FXk9lgU5hgjgi8JsBgIzt6l8gEeC8g==
X-Received: by 2002:a17:903:244e:b0:1fd:93d2:fb67 with SMTP id d9443c01a7336-201d6520249mr20828995ad.52.1723623289265;
        Wed, 14 Aug 2024 01:14:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 06/10] riscv: Allow ptrace control of the tagged address ABI
Date: Wed, 14 Aug 2024 01:13:33 -0700
Message-ID: <20240814081437.956855-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011450_594485_81A57DAD 
X-CRM114-Status: GOOD (  12.81  )
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
index b54b313bcf07..9a32532d7264 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -448,6 +448,7 @@ typedef struct elf64_shdr {
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
