Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB1E77179
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FCs85y4nHbZZL1EB6/VWrXXZy5mhGAE/gyN+wpJPcE=; b=CiQFcQI1Xw+HNj
	uhVi4bZdYBYttLTfVbNbSWx8duCmRfoUyhPz8Sog0sNkYTj4y3hOlB85pMoRgEYEycCWtyCFj/pFn
	FIbqlGTwtEvYF/UBQhQkgpRDwZJ2ugDA/xV6Hyu3AqfJvOaowMTUP+LHQPDACPuY6EqcpBEoeKK/z
	Af69xluxoh82YOyYTHc16AqD8VNejaSDJf2SwvuELQ6NxRgjF1h0xfQqP1TRH1KZ2DvXvnqKJ62Bd
	80mseTnC/szeoe9Dt0++ZohZydrd119LmROwH0Qzzzi0IsTVNZD3YOFaxVWxAEON+b91cxfgTtcKM
	hSjUIUs/sOgCH/uNvBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRNa-00000000f9H-0to5;
	Fri, 06 Dec 2024 05:59:54 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRN3-00000000exm-3e4F
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 05:59:22 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d8843c44cfso19795396d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 21:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733464760; x=1734069560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B2zlAfPxzGcJqLLkasGHOZWMqJHtz0wkkNYHD9NX98=;
        b=SMrWBv7/HiouOXmz1uPgA9efue3befVNpF6dPwXxF01olEIPZmTm/YXtx3UfLTQbcK
         vHssHpud2pkN7nNWJr24sAGMDqS5kCemfoRFdIY/gvRP6x4y+DS8wEQzcYx17JWm+W/2
         ktsLUATxkuJOYlZir10FDkbdr+ahhPigv/+wPN0KiwlstrORPGzRSWfnw5LDtu0EJ8wY
         Z9P23JD1NDyh7MB5+kCjB3cVLbAQ+CyjBeODYsAk8WiDUvjg/Fg3pG/k5IkQ2DiKRtPS
         eETdqVSDR+brr7gpo9XQYV7VzCVW7gGh1AxQUfBfhbJe2T7LIQQYCzDB3Vh5Du+XtKTX
         FczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733464760; x=1734069560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B2zlAfPxzGcJqLLkasGHOZWMqJHtz0wkkNYHD9NX98=;
        b=AkqVoPTJlGcD7hIWcvvLzN7Itgz3z8JMw0GDFF8wSsZIZrGNXy5v2mTYReTvD/fIzq
         87UgoMhryTvic6HW/Z+WzHpNYObeDI3QNTAXq92roBs2qYTb0XlnbVI+e2H5MA0dfeVe
         lPx8g6DzRivY+EsDRiCWlyQvXKTKDbdK8JpY4Fh/qY3fIizYtvsfC9qgKqfhvPhRRPCA
         dswBoE0GTjo1mbFLl1kVMWpoR2esGgqoCIndMp2Ih+rd5z+y1ecesLVoBNsPbZ2BZfGa
         YIct6yXuMCmz7dcQ3vY4apYvWtpNx6LuByGcI0PNhpW+QTWoEZZQhakGGI3ryTOE+17N
         5JdA==
X-Forwarded-Encrypted: i=1; AJvYcCVzPJc2RZqxISdCRcH8a4tngc5OIvyoYRlgZbTPz4LXelgFw+gwOCQHPaf3xFRiQbgKLEp874P8IrIbXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx55SLiw58qOUVfGkY9H0fcd08dmZzC1McwJ/00vVszE6oCGQ1R
	LMEOEcE/nDD4QFVgDd5SVqvJ/qherzbfe09iLf4zK8CrM6Ehu08b
X-Gm-Gg: ASbGnctkkScdr7VHZikbuwvKvKpKmVdF/r8eImGwM/9RpvhdbQ+dO4kGxV+Wqc9XBGt
	6Baldjr3ZQBDvu3RrrqX8CbCi5QyMDSakTIPSBiybcN+FazSZfgI/yZXc/w4ngl5R6tEcEPg9yu
	c013K8Yqf79p9T9cqoJPB1LS+dABk0SntNgpWjd90vHucdp4viqml33iGrU9aff4oL0gXMGPKew
	2LS/SuOoM1QXDSaaNSl4ROp7A==
X-Google-Smtp-Source: AGHT+IHSpUqq5Os4ifAgGNhdw5ThUTTLrj+Ai+/aRacSkXwVnOFqsvWmHLjVYLoRqjraOD4r+REhNw==
X-Received: by 2002:a05:6214:1bcf:b0:6d8:9dad:e14b with SMTP id 6a1803df08f44-6d8e70ca7a8mr25029446d6.13.1733464760713;
        Thu, 05 Dec 2024 21:59:20 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dac016cbsm15430616d6.117.2024.12.05.21.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 21:59:20 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/3] riscv: add ISA extension parsing for bfloat16 ISA extension
Date: Fri,  6 Dec 2024 13:58:28 +0800
Message-ID: <20241206055829.1059293-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206055829.1059293-1-inochiama@gmail.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_215921_904277_5E22AE57 
X-CRM114-Status: UNSURE (   9.31  )
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
index 869da082252a..14cc29f2a723 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,9 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_ZFBFMIN		94
+#define RISCV_ISA_EXT_ZVFBFMIN		95
+#define RISCV_ISA_EXT_ZVFBFWMA		96
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..5cfcab139568 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -341,6 +341,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
+	__RISCV_ISA_EXT_DATA(zfbfmin, RISCV_ISA_EXT_ZFBFMIN),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
 	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
@@ -373,6 +374,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
 	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
 	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
+	__RISCV_ISA_EXT_DATA(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN),
+	__RISCV_ISA_EXT_DATA(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
