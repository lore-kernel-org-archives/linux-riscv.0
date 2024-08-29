Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D4AC71159
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnEF+ZpASZxcKts1hga9tBCMCFXGnBoc2rq4O7U+luU=; b=p2snAjOXDGMtFz
	fnt+4V9m1xJgCa4PBx6px2vrwiXLzYcpOXMfyX/L4Y3mJILrhzcaDrNBHVUcqIY6WHKeaQpP6Zt6P
	l5bQqZbkV4qpznDr+/P3rGAV/eM+vMtWvIxg8GKNHx5FLQRrXW3/A2PUo66Y74s3yIYzanJb+lDJG
	M6uerpptCKSWctuZexg6jmku//KrIIZdpFKq48FyfZRMqnYvjX66/v/U9KvuBNIOZAAcK+H7R/3Tt
	k7Uh647XoNXEyn/rp2iocGUL8c0I7q+0NdnY/yFmJwcQ9V6ndLQI3YtJCnYXw+R00E8Ccln7IP2rF
	CxCqnqsYzdSO1ooAj0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTYH-000000003nc-1WFj;
	Thu, 29 Aug 2024 01:02:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY4-000000003eF-2tET
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:02:07 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-714186ce2f2so135287b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893324; x=1725498124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2DzaTFaQhCi8x+b8lScKZdT6wqGghcdZfo+S0TqwgI=;
        b=j30SlQeflP7fCwa+OkRJ77uHakQDcZgLwUi7XKUxDh+uSjtI9vWJ3yalH5od5WuFWZ
         xnaQ5S0rcxX/PVgOVzNeH0kdHarzylIEbwWkofuc9ETuXOc41vKyexpI3IkNnCRdDfea
         OIvTWjIMoAfUtphdPTqnCbUBDvhlU07OY8zk+CXcUPN/eDATs5btkpPwZrXXo6tSfVzj
         SeYzXfDk3buoTTBBlC7JHm6YHS0Vi/sEI2NbPSXLf/q3kaZCG1DyuSP8qhMvx7SgnbLl
         Ojxjk5Tby2oUaj87iYLuU2oVeqykkSzL3s4OMVZWfJfLBCO3+NgNKjCEb+oCXZexw3Do
         rmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893324; x=1725498124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2DzaTFaQhCi8x+b8lScKZdT6wqGghcdZfo+S0TqwgI=;
        b=C1MoN6pKHBYkRYjD1Qe3I8XhRmvY8nk1gnxyaUZAI7kbCRWzTzWLgBJZFWAR0Kyipm
         ANdsTvPbYOidsUEv4OYs3JznROKcmT8hUngWceWfR5ZCwWSGo19j7k77RGQJm7/OALXT
         lmOo6fc495aY6g+4Tdy4HsjBFpRsC4q8Z5m+9I/O5LL+ahKOIrA/oN4dUiCwoVNyRZUA
         NVLZW1Ob4zswSbdkeXiHHTW44e26ScJZv1A+nsiouGj1vT7QiNdO07RDfIn5HQTJX2Ts
         +ArNJdyZp/11CvJ9Y6FS9RqBAGUqk6NNDD5hzYFhnvK6qVlWIIu+l+1WE7Q44foNix9/
         e1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCW42DEuokwf8023c0w0cKavuEP45XHhLU24u/tMm5o8r5Z1PXB0CFKmFGbIJUMvAHiQCziQ0MxllYEA0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ3TxckMPUH23zl3+i4piHlCNAYRw/1JEg/huwfxU9Guv0pUTz
	9YchHUtIHi1qLjFrvWAJKfCUeRcaFgB7wK7S92KPxI+0pmb0Gl/NXEANBzQHVZk=
X-Google-Smtp-Source: AGHT+IEyh7NfQmaTixftnZaGL0dh72GRDf2NK4ZAJB5jBbRdIOg64cL/KbANa/7sfibaG7qR2QQ3aw==
X-Received: by 2002:a05:6a20:9c89:b0:1c3:a63a:cef2 with SMTP id adf61e73a8af0-1cce10161e3mr1027463637.28.1724893323584;
        Wed, 28 Aug 2024 18:02:03 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:02:03 -0700 (PDT)
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
Subject: [PATCH v4 06/10] riscv: Allow ptrace control of the tagged address ABI
Date: Wed, 28 Aug 2024 18:01:28 -0700
Message-ID: <20240829010151.2813377-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180204_756300_9BE7000D 
X-CRM114-Status: GOOD (  13.01  )
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
