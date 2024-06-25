Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6535EC30659
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cu9y+BrjxJhHJq8Y1qXY8RWIHrqKzhD536OpyowVgmE=; b=OcLuo8D1bwh7w9
	za6QRmwIFWzPhxYIkacUuRMZBeLgF1e146O1Bax4M+3RZhmJCRjeDc2VoK2WEEsYxarj0tqlMMYGP
	oSW4u6LKP/kheVxb4RvAeI3SDDP+mhBWYVjbVrjHHX0+q2RGvVBuhGcdJgl4bwkXvglLOTHibcpLr
	hSZ3X/drIfgQxwSpYppRXkQUTw+w+3cvfsKXwwK6BycNZPeS2v3w2HAyWjqqs9VBdkhQpw9oJ8/ex
	5Uh15kvTqRv2QGjMKQnJwAnKMi/9tBoJbZB2+HvhfhCI2N4Bf2ycIkMLt+uHX1ZxMK3f8guLedSux
	hTPmZxUiygLWF1kL5/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQJ-00000004VD5-24ZI;
	Tue, 25 Jun 2024 21:09:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQB-00000004V79-2Clo
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f9e2affc8cso36398835ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349786; x=1719954586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcVNJ1c0k9nGflpMj97RQ79v8JL+NQUn2VhiWagHpuA=;
        b=dNQUXlyPFZS5jAAVQn/uem1D12BNqcuWKDAPSxKC4oL7hFppGbO90ybb7fIIfPnpHN
         6Lchoh1z7dokrUw8CekxZGRybM6wXpPeYEDAnpBpaYxXoScbB9o2mxoYWEU0RoCmpD8Y
         D6uk5vUUAyaxUBlcC89EYpa3RNTEqAbMJYTTSgK27RGn/f6HrfrVNWOszja2DoBga3RW
         QUVr/3dtgHB7QpscvTWB7y0LlZAkBcOUEX0MyUG/Ito3kYx53JpTsFN/2SKJd5wuZyax
         Ph95fBqqupYTO7mWbTi41gwUs9rgyOGVIQH+iqUpJvDGQQUGsddOTP2UFy+ibg9zXeGt
         77JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349786; x=1719954586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcVNJ1c0k9nGflpMj97RQ79v8JL+NQUn2VhiWagHpuA=;
        b=rfGLvbNXu8k9N0J4JhpE8XHKmZkJjJ5/A9v5qTeKNFlfKczAHTjnQhuchez1zXCsaP
         pzZxppo6xUgSnXLXfrCIqBTR1XfDIZVkFyfyvGh0TeSi54GDj0gALytvsptFn7nYwTWS
         Kb5zSX9cXqjQ9K7iGRaAIeaPYE5ds2IZS+TgzpPpvcIlHcfDdaPBdamLkuIiHwm/5oh/
         Z0xiiYbgvBG4bx7Y/wVXyTCa2RVA9Yb8bgo/LW7uHZ223/ju11vs7WUzGhcI/3gPmcHC
         rRm+goj4rK4SOmZQgdaER2caPdaQayCr+E8Toyoh3hY0J6vCS0/VY8xEKQUO7FtCQeu/
         BSYw==
X-Forwarded-Encrypted: i=1; AJvYcCUX7Y0YZ2qbeK2inLqpW6HRKM13vQQfZ9rpjmrDIJAZ0VQv3h47VBvJcVORF+LNjcL5Qk/ir6O461WV0JWfVbj7Gv4vQyYAh8wV5iiNYgfE
X-Gm-Message-State: AOJu0Yw5iaNTVpjQhUpv5c3ywC342jI5NDHttEEV2oy/lZrtuh6kRKrn
	jKbE124JhSJW7NMAufT4D692sEL6JBTTVx7QJxwLWBSRZEwXoj7qRNuygG9qoZg=
X-Google-Smtp-Source: AGHT+IEkxpAQRQEVDc6TW5GfsE+EzweemTWIRBHDNXOU7XbbycmCakpPne7BxVO3PsXnE1O0ndqnMA==
X-Received: by 2002:a17:903:2291:b0:1f8:5a64:b466 with SMTP id d9443c01a7336-1fa23eceaedmr107096065ad.21.1719349786391;
        Tue, 25 Jun 2024 14:09:46 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:46 -0700 (PDT)
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
Subject: [PATCH v2 06/10] riscv: Allow ptrace control of the tagged address ABI
Date: Tue, 25 Jun 2024 14:09:17 -0700
Message-ID: <20240625210933.1620802-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140947_660926_11315391 
X-CRM114-Status: GOOD (  13.41  )
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
index 92731ff8c79a..f8ceecc562fe 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -28,6 +28,9 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_ISA_V
 	REGSET_V,
 #endif
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	REGSET_TAGGED_ADDR_CTRL,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -152,6 +155,35 @@ static int riscv_vr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
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
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
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
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
