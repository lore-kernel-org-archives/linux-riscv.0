Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EB5C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlu77GX9kUEk5/YSq9wJ5sPDbuPk9M/YMFXzdl5oWwI=; b=3kVwFZrpkwpEJe
	JBpcAGMJpbC4ktIuks0YGhGVBZh5ek+r2dbiRxnTIsWfLSMt8n6SmIZpMbJWAQAtcE6K7NVaJBTPm
	0Gm8+Jk6oiFczFZXdLm2ncQoorktV8N+48/ou0ciphloFB1wi22jIby7OKJam0/Qst4waOE7BAMxy
	DBm8SjW3UL75UM1s8Nz/X4Lgr18GYhGpiC+omgqlYIxZnzyPrLuG+fMMtgoqubL5gSUkDvpt674Ng
	0+L7bKiBGekMM4lKWSQfk53o1wlk43GtXLUd+w+xUQJHgqgZx0DBvyMNfLnhV/QtNmcSEYQfmc+hx
	98McAUBxT/sjGX1jktKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLfo-00000009Xdd-3vzf;
	Sun, 21 Apr 2024 01:07:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdn-00000009W0b-16x1
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:05:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed627829e6so3688850b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661510; x=1714266310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=N6QVkxN8N95BIPr5n6qxlwi+tdWt4CvFpqiT6DogeT7pzU3noByE0gX0W7u6osuV7z
         g2z8sPBTQCYMX/l4Ybs36ei81G0YXyzN7mERGtTLh+ol7bhmE4ZO3GcgN9uGgo0C2zSQ
         8DHfIZQkE487HJjwmPwHrwgRsNNVL5tLZjLfkwrnmuWTpANd+hU8K0TLTeHQAuRQtioH
         LPmYUrNZFvUX+GgcVokeONKlKnQRrVsem4PQEyZkXQWrv/Tt/vtd1O0WWqnw6x+8R2kF
         BJAVU3YZYBX/5sl5idF4ZaZQ5N8IpT71Pz/78essqAxzzYVLCM/odvb9jUU7xNRbanDd
         SwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661510; x=1714266310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=QdLl37DKgXGxCLXGHGKeALOrCQbHQnjZbCVtGhsfREhXPhVXwIJTWUffBUoBdCfIs/
         /5wjKwdf3Lwtl7XLxSsGu/iBJ+2Mx2Cs/ojCxToLNR8ELxsammXlEAIltMWjUaHD7M+Q
         X8i1VD8qJpYiezz4xY3VovdSo6E1J+kX2VDv1zIpErC9lQyMtTIPisatzfgMZq6eWL7K
         uFvbDtib6M5Ap4YCO384RKfxqYiPhglbgbLP/QRcgikRV7EyDxJI/aeh4SxXGWk7TPsI
         G62rf1V3+KkTNQXOet6xdOTT2LXIBSrysJtcGIf1RffrbFjUbKoZ1XXAjNx0U26qHu53
         9dSg==
X-Gm-Message-State: AOJu0YyWi+RxBuSiHJvdLc9hMq4utcc2LBwZrxgIBXSawKeqqDYd7Kn2
	5P2H9P3Uvu7v5ExHx+F2BF4aIgBD5qWGacyHEJz63154N3Rb6tkQLAtjouukAlI=
X-Google-Smtp-Source: AGHT+IHKFFwWOUNX34yfbtkNAA2sLpa34va32+rUsK/EqAZ0SRgYOjV+4xyTToafrWWlIRTNeQE9eA==
X-Received: by 2002:a05:6a20:561b:b0:1a9:3e7a:b0fc with SMTP id ir27-20020a056a20561b00b001a93e7ab0fcmr6650092pzc.51.1713661509732;
        Sat, 20 Apr 2024 18:05:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:44 -0700
Subject: [PATCH v3 12/17] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-12-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
 b=1kn8f9MgXWKJKmQlrV30BpZBvgJ52FS2fVV9itSClPiV/9gnAsAa8aFVH+g1I31umjB1dO4bk
 q2h7E0sCJbKDEMlRKHZpHo7aqc4t3bXxPYgHr6Zitugls9OvOjNuxGR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180511_938684_6C9EF9DD 
X-CRM114-Status: GOOD (  10.25  )
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
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 92eec729888d..6e3c85351f82 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -16,4 +16,30 @@
 
 extern const struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
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
