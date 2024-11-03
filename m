Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53790E67807
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV4MNyYg9uTD+YypQEcPUCP/6zkzQxoFf7rhSlJ31/k=; b=YVWvrtIUeIvAlm
	kx49HUYysH8eqZRFTyKrZbPScAPUAWiJedmuJKIFI5ATTTVZVjpuDiF7XlO4qSL2zmdm+ScdidfbH
	xWQnEBcZHucNaowiTEZpte1f8zx7wthrv1rjoiYf/6sQD9tKJtCETa18oTXJYx8TPZ9vvC5N7fmjn
	o85jkckiRw2d3WuBKiAI1bQHvnr+wdTlK0Vluka7cf2qQB1jeKNWBZcpOo6xJnj2eQxvOQw3ROu73
	Mm5FohBgw6iZ8M6mMwfeviDExdhDImUK6rcO64IJiwp32wyLKeZf12YtwrcMcghH/eFoTITSAuxS0
	+qaDODCpqvsFk8F9agwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VPT-0000000B7mM-1Op8;
	Sun, 03 Nov 2024 07:52:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VNf-0000000B7Qi-3XnD
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 07:50:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso1907566b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 00:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730620239; x=1731225039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uizG+AQKjMiNSyY0/c5FnD4O0HivvPLaMjzCzg5Rho=;
        b=B5oIJC5874tyx8sLb6fYwBkljfDVSGmxa8CHnBXgebmLk7wUlxl7HszlFgFo+CrvMK
         m6deHrXE+9vHTJTJu4A+4vo9Fyihw5yWwMHoYIGkL287FKjkWg0XtfWqNvMgjBiRqCVs
         bhzIDJqtOT82mzpP1E6eR1u9H4iErPgfC8sDg/jvykOEdlWoHo2KifCe1dFCSJuz3D/p
         TFmzeF+KvTLBD6MvND+WIx4qgYlmxW1+3Xy3M2ZTvP5LyVUhypcx3zyWD2frgWGIyXz1
         qUkK7mDu1eZF1U077a+cUHp+5ZdpN3hya1PeJR1WUHEUh49TTbjdfe5jONDPlXPEKDh+
         z9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730620239; x=1731225039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uizG+AQKjMiNSyY0/c5FnD4O0HivvPLaMjzCzg5Rho=;
        b=ZbziMkSWedO92+gfqn1nvOD/xWLR9GJDMdsq2Cw6PiWMfwKKTZG1z5zAZvitF6yTnx
         5IRoz85hFiHOuGCjlL7w6EgU1GxtYm9bn7c5CuxV9JoFq8u5oHD0R/QxGlXM5E+YJ00I
         I5i4bNBYqrNKtl13RuECgDzf7bvM9eaVu811idqhNJ3UDh+cf1cIU2WsJeW4x/sWCe/P
         NeVW/iiN3JrQCWp/njdw2ib2K467Q4pP0dVWZRrMqPt911oxwFfAM5bdoW1ImHr7FuY9
         aIm3zGOl1KqAHt37AmHi1FhKWcRo2EAe7MjEzy8zAn1TK0aKE7dgwWUgEI/8aFguH+2e
         hfOg==
X-Forwarded-Encrypted: i=1; AJvYcCVSlKZtEi7+JL9zFoWj0EKvD9DBPhrkALsjouh3LC4gk2MTlZ9HZhxfF17MZNmsiYR2cYrsMtkuMIT1gA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhQL9ZN7B0yebnuO7apyCFH5GwpmGKTHqV/Gwm+LXi701ObysK
	xKsY6RPqAvkyon04whBEGGBd0B4/N8fyMy8nriRBtMHoShDGQk2B
X-Google-Smtp-Source: AGHT+IGBI9drJicN8m+V2yXjzCG8M+gsBBzp5RBPh4a3AqoLk36+eLE2uPD9/29r0ZVb+zZWxlwzMw==
X-Received: by 2002:a05:6a21:7101:b0:1d9:1c1e:239e with SMTP id adf61e73a8af0-1db91de3c85mr15691002637.28.1730620238824;
        Sun, 03 Nov 2024 00:50:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8936sm5276775b3a.5.2024.11.03.00.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:50:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
Date: Sun,  3 Nov 2024 15:49:56 +0800
Message-ID: <20241103074959.1135240-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103074959.1135240-1-inochiama@gmail.com>
References: <20241103074959.1135240-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_005039_906290_B81E8773 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Add parsing for Zfbmin, Zvfbfmin, Zvfbfwma ISA extension which
were ratified in 4dc23d62 ("Added Chapter title to BF16") of
the riscv-isa-manual.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/hwcap.h | 3 +++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 46d9de54179e..97657fb63af6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,9 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
+#define RISCV_ISA_EXT_ZFBFMIN		87
+#define RISCV_ISA_EXT_ZVFBFMIN		88
+#define RISCV_ISA_EXT_ZVFBFWMA		89
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a8eeaa9310c..1b286f5bc591 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -325,6 +325,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
+	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
 	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
@@ -357,6 +358,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
 	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
 	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
+	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
+	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
