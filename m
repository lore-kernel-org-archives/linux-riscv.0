Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A2EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKX++k3CNNHfyTaX+6HSD9mkaV0h9Exw629pNhydcrs=; b=W/PJQlHieYtF6+
	n1wrjEze3yfGFSjbF3RItoz8xUq6bEtAvN/plsky8TG51wkmUjvkMX4Yqf24rgefgv1iZvSVFxUAV
	qYjlshg3jZOl57qhJndzC04b9E/el1JRNw8jnVfQcrCq4Kezm+ciHxOKIvBXlt89X1CGKoVg6xoRw
	wIfydMGkOZSzoquZCioV1I9QyNzbWfyRsWcYURMXhsYmmP0dvjvOTo3JP1coce/MBUoOOm9vQxG4P
	2c7e9dncpWZjKCpQ/SqeCJW09jROVQMn5SXEhFiGqNNn5BLFR34M3lfjpUQ5kN0k6wEY4oMlYDaVU
	Q2Am7+RBEmiBMslhls6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xW4-0000000HXvP-1MRi;
	Fri, 03 May 2024 18:20:16 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUz-0000000HX56-43hR
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:23 +0000
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f450f43971so925b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760348; x=1715365148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=q+H8YrJcGBsNa7HLvjFazfJ4ucis4rncGZtoONBx+r6cBGouzxjB/2FDe/hQW8MoPW
         62jMrdhyqNHiOm77oCLHYpQKP26+evFKMna6kXQnnQ+54WgqcShdfj6YJrc7a0psSO1G
         d9ZNQlUiSbOfjn425NKAQX0fLhPW19pzsFeTrat1Cm965+5rkcd/6siYrGZwi2fxt3Qj
         ak+dtZxE3CDpaxB022oC8GFaQ1FqwYBLrdkfJtOvjr8SAJWRqAfrU17Kc6d17m0aiWK7
         BChlOYo8d4M0g1CsVgidw+w8d8DiT0v2968JH1T5Hho73NMF8eFMBoWxzo5CFyMPlUZp
         QFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760348; x=1715365148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=HxrLNdjYkXRuRaN9efLetQwG2+UzIpSwFTIGETKfUd+h7aiEAgDJyTsrqoUFVhuy1G
         u+NZYBAx0G2X7DCwP3cDiYmdhzEOu2mAX568D0ROZOlCKZAeGbzoUGiqZwNJu3w12An3
         U6Q7JhSKJJY6mRvnpsmD7bpd3qO5AfLQDeeehNsaRQk6F2XzKPg5c0DhHvInkwI1EXg7
         dXAFbhyKH9Xja6WM3tABpxm/wJZuGQmWu4DAYu2OCN9hyfOZ2f5tYT+mA5F7D9EQNmA8
         bUBLEzl7MpNHVS0H4h+/TpVKHSBz0oeoJ5iU0+Y9p4P9aP1TRBjEIo6mVTmMUA0ah57b
         btTQ==
X-Gm-Message-State: AOJu0YxGBwUScn8XOzaqt/SsJ3gMzL2LpPuOm8xUPl8/rtT/agn7P+K9
	be6+qeWeeB+66lkCnkGbkTbSfnCRfIuislVDhGAwcuEL0Mg7NX9KeNGUd0edQz0=
X-Google-Smtp-Source: AGHT+IFpd0GjwjtDFrGFdOgb28GX7E5A84WrU9nww/Fc6oikSNFplYSG78IpCN90Vvy5bJGvfi7P+Q==
X-Received: by 2002:a05:6a00:8c4:b0:6e6:89ad:1233 with SMTP id s4-20020a056a0008c400b006e689ad1233mr4026532pfu.2.1714760347890;
        Fri, 03 May 2024 11:19:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:27 -0700
Subject: [PATCH v6 12/17] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-12-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=Onr8XJTzFkGHOux99DIgUZXs1b9d+YcK226SmnBPnkCifc4zEA/CelPcAWTyhcOig7svSCUUI
 loL72CiVW4xBpDmLkunPNu4gWtqd89zT8YDIgri2Nv/sOqXqJzDCf47
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111910_359784_E85DC2DA 
X-CRM114-Status: GOOD (  10.59  )
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
