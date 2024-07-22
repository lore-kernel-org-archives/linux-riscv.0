Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0FCC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC8SNeEQKm4fyl6DPhD9yxO4sYAc/5eHpADjOTa6ug4=; b=cLjCDuPKbc4AJB
	zBT09/JOTeceVtzj8B15Dg7zX3/V+qyUesAqGz9yLT++lgag6SJ7KGoleW6DksTIPA+hP2uHeaMGy
	tMAn1p5+vhSpMPWDHQ6jMg0zlx3H648Z57dfb93iV1V/cNBigv6Dc2vp/Qu+j2Bfzse46KQR227yi
	yDr5dPrdCCILsBsJjyH21agZOiplOppu8110Xz1s1aWpN6Ifm5g1jNEvbiB/Yc7WoOMAZ8t2jjNc5
	aJGX0r4CcxAz+JzcXzoi2ADPT0dfRdO6YsOWTR48i5Vmo9LFryKliInQhZrl06sc2CxXw6cdsSLSK
	Sa+KAo1RGWjKExaXDzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW13H-0000000Afcx-05ho;
	Mon, 22 Jul 2024 21:58:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW136-0000000AfTu-2skc
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:58:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc49c1f3e5so35826165ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685508; x=1722290308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=V4jXJEma1C9E5Nog/gVaXt6AuAvZ0w2xl2xpxAI+s9H3+nY33WvDHgwshZSjxkhyA5
         FVXoIcrgfAIMlE2Dbqaqt4dIusYP4SRt4nlPkmRYTQq8+GA5hcLVTE1Hecvk5PvAO6CY
         YVGzcDK9Hsdr40bRUhJVo5pE7HfbBLYwpnuTMRofhznzy+MHushP7HRsRPbsPpbW9ebD
         WzASwYbIiKf9g6zIwrqgrHaZJnkrChh0BuDw8+cdAILH9+qOVcrjXbAaoIS8CSJA6erN
         yrKrnhIeuwi8SyFV0i7aeQanFaBElEfuvcIOgszyA05yXTTg4p9Z7sMJi6bXaCbk9CyP
         1RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685508; x=1722290308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=VmwsjZr5M/danTzlgYNA/YSI+pki5kUWMzKHtHLxfFaXFireuYpOPRyJfclZGF4jO3
         eUbJ8V7kOsjE/dvUDuG6rv7uwO+3HJLyxDm2oeWieZ6VMgCZZr4PwTr56r152SMz3yul
         7sR9DCOzQolR5XjUkaFovnVsPOVEKEXWIZu5V01gyjSQixCzM91OaWU/EiF6HJZXndCV
         QC7TqQLg8uqqkMNaR7pNQo4ejHdBriWHdKUERefTlbVMRkufIckYq2U8lS/5JUjBL6Ci
         PDWJ1hM+WABc55sF/ucfe6ewQm0M6yyos/Jz97pSVUwsMxoJ141O/9dxqJLd41Thbml+
         xG6w==
X-Gm-Message-State: AOJu0YyvPPAINcPV0eoAU8kvq/b7XMB7E2d8IA7jdWDQrpjcAPhuVGco
	3cwL4YCJRv3o1ANHO0r0fVPsog86WMvIAwtlPzJEC7e+uzZHmMiLw7JJdQw4U0Q=
X-Google-Smtp-Source: AGHT+IF2VUxYR/aRNToCR+5ZrcyCmNKV+sSs8BINBXokqocI6vx0Q1B7xy0Kb+PiYoFTmuhV9YSoTA==
X-Received: by 2002:a17:902:d510:b0:1fd:8eaf:eaa9 with SMTP id d9443c01a7336-1fd8eafeec5mr38070905ad.37.1721685508075;
        Mon, 22 Jul 2024 14:58:28 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:27 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:12 -0700
Subject: [PATCH v6 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240722-xtheadvector-v6-8-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=hqIK70baIF2TRsMNhma0nqEfic3E1nBlRr8r5IBs5B1G/V09ObAWM/kiUDmJLqlbsJt62gSOm
 TBKkN9dv4EhDg1McKFXFHMYxPuqxf1K2g39tmBh7oLjWZiqSN3Lw1vA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_145828_773399_AD58CAAD 
X-CRM114-Status: GOOD (  10.68  )
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
