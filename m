Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAABC19F4F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlu77GX9kUEk5/YSq9wJ5sPDbuPk9M/YMFXzdl5oWwI=; b=25rwv/gLtYQz/i
	HZ/yNsG+aU27/7MakXwAVdR1iRbNArvVNJzrGvjRmGKJFHhCBvUTV4J0wxNEnAD1OC/rWsjMiq6UP
	4EgzllI+dAX/PxIvOQUmVQ4UPS8Xhrtqvi0GQ47GRKnUmt45XhIpvlLoG1NEIy5YoLUiP9wgkDIHN
	zA5F7Vp4JVBizabhPe6AYeC01AuoPxQzZZcd5S9Q6C78Hn8jg1q7UGmaYKutmOn1s7EM9w4fpGrE+
	Tx9M+iASxzePCSaYv2JKV9zuXYbvtWXUcHTg0FMTu3wU6ZI8PvVfWkRerODyPHFQtByuRDxOEFZym
	OZ3HnPKtH2KwzRqFZlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TGG-0000000E6OE-1umR;
	Fri, 26 Apr 2024 21:37:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TFu-0000000E62q-1N00
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:37:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e8fce77bb2so20685545ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167436; x=1714772236; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=WZ3c04MhcuAGoEbzriFAp4Dsh0M31SxMTNr77xqz8Dc6z0z2G+vDEjgdDGFjAK3DM2
         8Lnp2y8OolkiDsZN29kCgl286Q/4Hjsoo/xIzOx7JCq+V4pIHFoyU5Rub0h+Q9+bRtFG
         v5NKCcWTPI6dfWDWCktsDTiEZ07Sfzu5ibhyCbpKsrq7oTGGSjbht9OgwZzjHHEYWUdn
         /tu2pa6009S+Wk0lA+6GaAGi/Cos+uhCKhlYrpPTjW96cIFpWV51sEHwvEQbwuQxC2Gs
         cM/2Jof6CwhfhK4jJTD1Cpm9+/HxH0SIpWy92BOIKo8ebR0F7piF8tLA5OF+woATznBC
         CNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167436; x=1714772236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=sLc1ljyxgl9Ct6J2sbeD/DpX97PTj4RKMlfresO3fcy7Y8ly3ibJar697XfWjW80eC
         AH5xTksJGls03ErAuGySnX4fq0c4Ebs279Fq6Yl6jHMlUPUUR9fPJjgif8sFDu5fKoz+
         yakrScUmcc4gmcO1vtHIHpr9eMmmO204UYFh4ti+tJhwIcsGMuHwlLzFQo8GtkfqG2HG
         4xl+TJW2664qt7sEmbhRuc+xjvoQMX0Tl49qPMg7USPhuNVo/w3R0DisdCJRh8tQ6kzT
         P5djAlsjTc4SkzG/BGaSB0nB45bPv6tiL+6PriP2ipDXG8vVhXH1lz1ZdQk77mRI1a6/
         4srQ==
X-Gm-Message-State: AOJu0Yz8U2la1ummuSM6O5WpMIM3ZKNqQbBlA1Tv7KgE0az4EGO5RLJg
	N+7tnsC2WzYa36+i6yjmxOPpdTeDpCjYKflKUPVni0jnrszU6lUH+xDAmsRmrfk=
X-Google-Smtp-Source: AGHT+IEmTz6F3urwdNc3upHPp7xuNjToyMXKR0+MXW/PS19so8SBqwqQD842Cobd1kOR7Dc18se9dw==
X-Received: by 2002:a17:903:1208:b0:1e3:dfdc:6972 with SMTP id l8-20020a170903120800b001e3dfdc6972mr5045246plh.9.1714167436618;
        Fri, 26 Apr 2024 14:37:16 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:06 -0700
Subject: [PATCH v4 11/16] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-11-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=1914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
 b=PCrymv44Z3fiRwZ4pYJZPOoFnaXXtTTpJLu/OUgNMcdouUs0msGnlr9zseM1KUD6drfrqa5Xy
 APyv+dooJWrBYOFJl5QFRlu8s4tC+mzcad1gaHapng5GB3Q7qMS3fwV
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_143718_456662_31D1A2CF 
X-CRM114-Status: GOOD (  10.26  )
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
