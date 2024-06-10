Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0B4C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKX++k3CNNHfyTaX+6HSD9mkaV0h9Exw629pNhydcrs=; b=clDBN14/P/py4j
	15N94tJ8/HnrPTjufUZO3GNtPJtO0oEqW2L+7h1MBbSBRwUWB3eCIAkdw4448x5SMwd2XpSEHiqFw
	/BWiu2ffZxdwaU4l6t1T5IWz2WxP8uZ/e9U/O5tGfb7x7Z3qYenaDJPn7Lq+O2slI0Ju/HuNspGiL
	bXi5fyQ704zXv476iXPHiJ4uQaWySp+suUgPFgGZzn6bhieU7gytyaDOoeyFiF+Idtt5NalIaO8tI
	g0luHI5Qn6J1WLLv6u96CYn51wn9Rd2vJhXHBVSKDMpUZQA3rW0CRhmmhG27VGlCbRMwUnD47LhfH
	j11BqPD3+h0TxkK6LXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwy-00000006jly-1010;
	Mon, 10 Jun 2024 22:57:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwn-00000006jbl-0Cq4
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:57:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70432d3406bso1631226b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060223; x=1718665023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=ZcfVATvsv/D0fdnlp8tkOSZ/uaNztWh2f4OBniXdIPDfu1HdRykCY4ZyIWhmHbhKEw
         yPwpD5jTbbvGji2tfWmwMfu0PsnvMRsrlyp3oFlWl5KCnKDk0Lf0cnSLco0oLTsdJR6A
         C0G44V4zg2k852tG+4FQK5Lee//jFSVhOwPF/hkupcxDvnfKQso6YywA+mWA06icDmqu
         KHPNWbZMn56HCiaP3CW6obuIxo8Sr5Ia7W/1YzjZi+cs0L9iuGUfLi/iHp66S5FZipib
         wbmYCCi/TcA9rcwqspNevWG6CrV9tD7PL+JDMfPUICDPK6OHzli8Z0N5qZ257lKVY3kt
         6cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060223; x=1718665023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=DzgWhTSuXngUvXIQoXlYTjE5UINMdNCw2abscKnPIdVJ9kEMXuRyixh/dchI1JK7TJ
         oqx1zAgPpdLwAY/9/uqofhuAEl/snpm53JcDdVGsVhDbjm0WpZPdwuU4E7zgwQM8DtvO
         Tw2YoDJXDeuFkU7magaFW+O+0gqtdsAcW5K+4n/2FHhc6aI2gX0UPM5B9SvCwa+cUdfC
         53YuYwGDEip7Tt2VzPuih0C8Oc/G8VnIqB3uKu7M6Vmmc9d6qWKiUMJFohIJ/y8xQlrx
         Bpyb4LP4ghf8utG167vmu5P9FGI+GJCAnGEPazsnE+RcJQrOkdxveCEXjCcqc9oR0oPc
         kzmA==
X-Gm-Message-State: AOJu0YxAs2u6vNqY0kg5lYOil5RCtMtn00C2azpsaP2ON0tJ7jMCd9yQ
	4DEccHKBSFnTn2A4TPW+JuhOKntgpgSx8Z0Uf+WUZqCwCToLfk0ohH3Hbz6O6jXSDnDH0NdawOg
	B
X-Google-Smtp-Source: AGHT+IGHP7Vn33T88cszM3LUffrozHG8DR1S+p11RV/y6ZETDFy2B2rN4r/73rgcpPV6ku2suByO7A==
X-Received: by 2002:a05:6a21:c8d:b0:1a9:c33f:224f with SMTP id adf61e73a8af0-1b2f97ef803mr9893327637.16.1718060223275;
        Mon, 10 Jun 2024 15:57:03 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:57:02 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:45 -0700
Subject: [PATCH v2 08/13] riscv: Add xtheadvector instruction definitions
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-8-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=prEpfyGoBPWgsGun1GkTQvqnn5XECHC920TL4iWb0IdoZGHgiwe8GZmlR5k5bfufL4prNo4Pk
 Kac3ZHNhlVMCZwS9+a5dArAuNrVV5GZdxwe+lZ/EDeQS9Z6r2kmFfIF
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155705_172561_70D437E8 
X-CRM114-Status: GOOD (  10.50  )
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
