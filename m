Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB33C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC8SNeEQKm4fyl6DPhD9yxO4sYAc/5eHpADjOTa6ug4=; b=I+XJxsr0qD4Pe9
	47Tou/ATAce0qzm3AC5hSdZZdgQe7AfchXUbBIvS9iIVErG2QOspAWfOFBdGhD6NvxoA0qoBb1mKQ
	GZOS0rJReF6bZg4uSb4PrTfRPZWR0y7d+BBTG8p7cNg1AQipsZWfAHVrGLZowfNh2To6OWRZT50AU
	AiIu7gwwC7IhjutfeiJKJrBCl6WuZVvsz5Uul/WhE3tojk9WZ/F1Ws2IZDrFuL9yDpyh3m2bmnu3Y
	R+MllFTKT9H5XoENPqUlMGOZeI69P0n4VHNxh2BRb7CFzzR50nSSumDBSakIvIu+JoWJ0lp9Jg9lE
	5D8SRbfg7vGNIsDQ+S4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpub-0000000HIbV-06au;
	Thu, 25 Jul 2024 04:17:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuO-0000000HIRJ-3jRF
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:16:57 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fdd6d81812so3843485ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881012; x=1722485812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=IA0Y8ge1hw3UIe0aN3FUIZnJ1lQ/CF9+fkmsczBNCjKt4DHDnpTjp/wIA4Ak9uinSD
         u/8QTON2Sf+4OpryVRIUGfZ+Lfk8f094Ef1y/EeSa8ntVCIuWx8MsH3XcHdqZY3KhoV5
         LXbVBjBj/GZ3yD2aKUNf+LpH2gUZwrVnoaBRJGg4MHQ8DMlTEZHYdn3Yp+XVB5oYmf+z
         iHZNFOeOtMHsn3JLVl/Ka8m4E9WUsLCnUwcDVgBh0av4cYtLqrR/vSMzXj3v5KXWVlzl
         5p8R6ui7pKc6TDyXs/lONcMciZXVunnLPIVjKsxdveIYUzb8HPtABd+C0pMGis9AevIp
         06fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881012; x=1722485812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=HIzXKGQARWRGCsENNAYqzr21mZ4bqY09XEC1LaPpfg6qtHyHcIKYXeUCQ2QenssvJz
         Y2i81L4TgkboQUjWk6hMJiFB3ggSSriXQEIfzSZB51JSMVRNzEWXg/26nrMasQdmZOig
         HN+dAofu9BTH9f9dDCtJdlMGKbMqn5MLgt/4ueQy6KqFcXtCZnKaiKHZISEqcr86bwh+
         Al/ZdjYY4gbxWNwyBgrWUEvVzWTi53D5cN18JY/Bb7R6II+JaAkkf6zIoy+2ckgqrU3x
         ZLoG4l4DCptjebAaH7SKCFFFJxunkr7G3eGVlGRFAsqm1QO5jxBdJ6w6vZYX1SwUI3VM
         rSDw==
X-Gm-Message-State: AOJu0YwvrHAf/CegvkWolpINapAb9wBWKYfikOlmFO3o5dXxQeq8tZBe
	Txibh2X7uLBTHFxscFe9NkQ1qqLWLj+SL5ynSTYgXKVfvMIUcekx/Giv9Urz6lZHFiCc7jVWplR
	5
X-Google-Smtp-Source: AGHT+IGj26mQhFBBxRuze7M5j21MWHUmj/ANBGUwLqcIOXRBKaz5XsFYjTYWSdee3PR4vzaTi58yPQ==
X-Received: by 2002:a17:902:d50d:b0:1fd:a1d2:c03b with SMTP id d9443c01a7336-1fed9393fadmr9160195ad.59.1721881012117;
        Wed, 24 Jul 2024 21:16:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:25 -0700
Subject: [PATCH v8 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v8-8-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=3w6Inm8iO4KPjHOv2h75OUPqUg1bl42bk+JmZA/zIjwc+Fx4JtS0VETElIWTpMgzY/aotZkuA
 2a4U6i8P91QA4OL53j6fTgQRlEi+6udHKjZne8b0V0IgG7i5ceAPSUo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211653_035953_5835984E 
X-CRM114-Status: GOOD (  10.65  )
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
