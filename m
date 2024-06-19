Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C6C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsOetgX4B1dHMQySJb2beusFOIGO8p3th9fdZDbogM8=; b=fsPjpLWagx4J7H
	DtFSQV+SI6CYXNVxHEzajmDPCotQDz3+bfI82+nbcIz0tBjreRBUkRpx3UTer7FBq3MYDA3Ks0z1Q
	w4MVIboDPnPedyd9ggIa8Kx91Pah3EmuU7tNBIpSuRmN7a89fhvQtdhJRT2li57vvqoWFDNkqdv1h
	aQ88baLOR/flpO7jjOrQ/0aY8txTd1qayJVdAi7oM9kZyrbNlFZmwmtJC3uVo240J4ESIpu5IBAMe
	01usYM/w1mxTVgQSpbDZPemUEk3DICY5w1BL3pvOfSDTvYPCukR+H6+e8PBaDE92eQp70YiKcfxQ8
	wgC66tmwL1NwQ/1gna5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5Bj-0000000341b-12kt;
	Wed, 19 Jun 2024 23:58:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BO-000000033lU-2WIG
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f9cd92b146so150405ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841462; x=1719446262; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Px8N27AOqmnwl/KnT17601Vv0G3wj5EYnZpDzUGAj0Q=;
        b=HldIw/zk6Z2EL/YxP10jMLwFeiUH6fLYkFqPnXKcvlLXQj+Yc4PjHacbQTCzUzmegd
         F6t4q4v3aupORiY+5nth08AqBsF9OkLgSV90mLfK+oTPF2eF1vZEgOjt8eHdlFB6r5Oc
         +5DmSwDgnhVl4VfQvkMi6TeQYJGAqQOvbCu3HapDcx7iuSJUQx5SULo7qPiEZIQW9dy/
         CKCOuExG7ZnOUG9EcqXCICzdm7MsL+AmUNo1DOsGNxqXoYpMCUt7RL1k64H0SeOGHzQe
         A0KW6Ch/NfWhxtC4/I/wkVmeQ+vbUeHUY0tkPrnq2KaPAGTtY5vTroUAHnJrXaRBv0oH
         SScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841462; x=1719446262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Px8N27AOqmnwl/KnT17601Vv0G3wj5EYnZpDzUGAj0Q=;
        b=Hrgg+X4bdBAz1V/thySVQcseVg9kiejkPJ3r/zOdxe+eL4X6s5Rf9OJSX0LXWWXoys
         IrKzLa12sbyuCVrm8X+ORxAAV3wGbV18+IylwoZSBdnpL59j23maU4k+0h3peSiMlRS9
         vq2XjlP64WDXMch7ZTpJ8suf5Ndcf9r3Yr5kIOkAxQ3hQ0+4WPmmm+ylj6i6FOo/c1bz
         vyshGVAm3ks+c4hQxzQqg4GPRiQ+B3xdT0X3CgaOLMGjHP8RIvIxsjzJuLnbIG6pX2jt
         kQ0L7oEYUNyv4xvDys7gyDjD2rzPD3oT8Vp30SbGMavTyZ+VVZxgQuXkANcyUZqfS7lb
         gMsA==
X-Gm-Message-State: AOJu0YxwxL8PXFhy8WrYFnOlOXT6MpLOjPfHMZ+uzzm8QJI2b3tOk+vB
	N+YSIrRCdsteRfcZ0w1b2OsB41yvjpd60RnUiFkhm+ULIFYYiu6tOQfpag3tcSA=
X-Google-Smtp-Source: AGHT+IFURITgIHUXPIWfZmHbHQG5F2+TL0ewnmECwvcXqCwzHJzZyz8b56abtJ31GhWKd7wdcoVjcg==
X-Received: by 2002:a17:902:dac6:b0:1f6:fbc2:526f with SMTP id d9443c01a7336-1f9aa3e74a9mr33490725ad.32.1718841461778;
        Wed, 19 Jun 2024 16:57:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:21 -0700
Subject: [PATCH v3 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240619-xtheadvector-v3-8-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=xBHaFe7VLcuLpxsCjlsn/XmzjfLlJdrvGHOT1OyfrwA=;
 b=U7tzWwho/N+CYyjv6ycLZuv3v/0Gxvil3l+cEZQaFfxVErRfFZmSmrZhbTwGPZz2eqVP4HVTg
 hIdYdYDPg0oBDxYwrCdKYnpW+bmBtpNSw9zJjs1RETRdIys5x98rJY/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165742_804706_9741EACC 
X-CRM114-Status: GOOD (  10.94  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
