Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C8BC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC8SNeEQKm4fyl6DPhD9yxO4sYAc/5eHpADjOTa6ug4=; b=U0Z3BrvUr4k6Zf
	sGFN2f28vaXOLsY5zGSUQWq1aBZ0Nm0NLfnoEA9EkoaeaZlDj+BkELkxow8ypWzU3Dkxby+XKU4QK
	dU/Qfag+Od3/KNePab1AD3YXRyb9N58a3PkI4daLVwRavlIMGv5fpop4YOgjvN459qMkzqpnMyw8Z
	D3jGRZ0gYfMqmTMQ/dQrN/ItKXfyBmX/zEdTId6RRhX03pSiGV53sjTt9TaULXK8kvLv9bE1yyEQD
	LuGqaZLEL+Uxlf9qVtGvxyaVtDkzdqDljFMqlrSWG2C91Mxmu/S0SaB8yaLXTDr5RKFYdSc9sGsD6
	9iP4lmRSCgWCRrzZrPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszU-000000097lz-2fm0;
	Wed, 03 Jul 2024 05:57:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszQ-000000097hN-1jHh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-70aec66c936so145598b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986232; x=1720591032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=1rNoSnEnEU+UIzdtkQuzBE+H6myZFcTlI5VMY/Kp79RjeNpAYT+Qy02gkgSBsn9IUw
         r8OfST8gtWEJmSS096eYGCIx1VtZd/yNQhP6b5Qgk8401aH5NLlkZYaFlDbQbjUY5C50
         wgSZfzjqsc4b5ozRGwBEOuW6fuBMQSA7gMwPtM8a94z/W/ghDfYRm4ru3uqYEZD5hG01
         PV4WvHf5oEu6o7KxXvEXMbol2d/hO7o9h9uCcPKnQ6NR75IkU5J3+GbUI2jhDd9jdT2q
         BY+SUcC7IarRClo6E1WOiQtmL//K4c3uNeZHcTZz4jDDdG3Q6EWave2c85N30ZTGgt+v
         gKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986232; x=1720591032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=MWdISPsZYjcbVO5OtIcWE7yX23VTh4XfNl9i8o7oXTy0c0R5g7qUCUxpRlNL6jljbz
         AwlQx+Yas+ElqGHyZeO9CrKjJ0ZLezbkWP92Ahubu+4s7jK+RtlTREsJ/NCL5ltkK7oO
         tzPZ950NQO3Lr2QfoCz1wD8FhQZKxgzPm9K9eD4gj1MnYcW4rSsCYKDJ/R0jUMm5F1Tc
         /GK6JpbwnXBUrBj7lLvB1fQXmOJcWuibBQ7Um6DezyEteU4WKW15yj+lbjHAiSoz2++H
         zTeW7Kocm7sDjvW7H4Z9goEXFGlBxvbyIoLOK9aCTe6QVwFcGh8wV7GFb5yoDAe9mU4+
         oHbw==
X-Gm-Message-State: AOJu0YxMbJqsTSaRYo8Uf7qRFkd/eK8Gx31aEuJm9bzUmIjq2IRZq8YS
	+aSx9aAgf8Gi73FpNOPzJBzrgAdB2A+r1vltZpfJ2768ojPRiTTg224vI28o8hg=
X-Google-Smtp-Source: AGHT+IHpwFVutQV5bD0qc8ckbUJ1hgf68O54SV5uCNZDiu6Lj8fD2bIReshuqA93ROnVtsuvcW+iJA==
X-Received: by 2002:a05:6a00:3cc6:b0:706:aa2e:fc4d with SMTP id d2e1a72fcca58-70aaad6f9a9mr10699215b3a.16.1719986231828;
        Tue, 02 Jul 2024 22:57:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:28 -0700
Subject: [PATCH v4 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-8-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=8lywCVM8UEoyiTaUOO1WlkKStMLhnLjNmIQBfPGf3FufVm1Mqo69xHqmn0UTcpEmOyN0wJWKZ
 yoqNjk/xI5xCo2xZyqo6QIDXF3j3gh/7+S827QcaciEZ6fYpZRyr58A
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_225712_485642_E66C3116 
X-CRM114-Status: GOOD (  10.81  )
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

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
