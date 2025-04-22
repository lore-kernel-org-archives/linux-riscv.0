Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE765C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 03:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Xen2WatFLziJAleYQwjbSFPIwIeGVgxN5K3QnhM1Us=; b=LOW271HSm7HZEj
	QuQukLKYQj9sf6ipjseYokcP2x/kqJSiFKVZJh93Ggnr7Rvmbw656Ag0deYXLvQexU7BGlH73Yy3a
	zjj6ylj3a7ScbPwT2dny4fYEUTDdKAbfM6MVSY9O6pO+yrZhOUIbw+ebhDAcMauH8rxFgalpGEAAz
	mehvn3TF84z33txnC0DcnsIlRgiMVeZmsNr1YRvpeWYLS2mtbcdSH76+dh9TsGAq0RjMIF11JJjgg
	rvHiIMUxJx8OmGwrhvLobDL9K3gmUgKf/9xdNCsRAP2y0Y3ZJyBVeLRhWdlQYWHaJt/7oVk6lsCE/
	jotWH4IK14XPn62S+Jpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u74fu-00000005k82-1ygp;
	Tue, 22 Apr 2025 03:51:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73MC-00000005c4z-2CTs
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 02:27:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22d95f0dda4so7647125ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 19:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288852; x=1745893652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmODs/cciVwnwfJ66cvNDc8q3VvAdEuctjXNgr1Nt0E=;
        b=BjVQy+3ZIkNdeA+bawrB/Sw6XqNdVALDYaLrCkuTCJHmS5UOtvrDipqjvh8HB2RKMl
         nTvPF+I+ZA+4mVSV5tj9zgVpWHyo+NcpWHiLNxMdPXj02ypu4hxyCAyjg0CqmTArhOug
         kN1c1tzRrBG7dlm4NS9IWR7cGB3w+hSNgo6mE63ylX/p5YmUL8RQ6ZfZ19Dxdnx6Vc7I
         owdkJal27z1zc84kOW882/1KfQNfXIhQdu5mjv8gqxuTeDpGSh1c3SnMlNYqaqsr0v+e
         vBS3XqgQcBXutP+S9ycMQvRJ33EqW7a4MH3DglAQtyIzjGCz8mCm8faTPnB44bz1DJlZ
         RlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288852; x=1745893652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmODs/cciVwnwfJ66cvNDc8q3VvAdEuctjXNgr1Nt0E=;
        b=SjPBA5daRxyAKt5vN+rFoA0NSmrSI1nwU2huJgEp6fEGM8UsnqkP9UF6iuACpe9UMw
         3o/cmRY6TF7TN7wptfi/wl3P8g8+ykz9PU2K0NUgm+dm4rDAfhs4V3SOQwxS3L3aCMmJ
         McNfbYUszZT7aVdLXYK0l71dw+l7o+FL328YAWzyi1ysIkoE+Tk0VhavA4T+BFJN12XE
         6E4PzlpTgumVgwbBHL0yazc15zLjXUdD9RwfYk0cQ110ZzetyRHUXceCyqlaLT8UTGjA
         Rn2sDkd9+ze3+9TZSCfV0miWkEZHVeRb3UzgU7DT8OPrTVZXe9cNZGiaJdwUl+LuN4vO
         VFMg==
X-Forwarded-Encrypted: i=1; AJvYcCXkiI8ZNQgofj523pfE+jSy/qrTWfUGq+5lktUO0GU9db0BnrAGTql0COHD9dSdrIj/MgLemrKPo0WaKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6+gaDZc2iLpreSAVds4UY45JMPokrN+Odcfw6zE3axQcJ8jT1
	C6hLGTLZ+FTsVGGU3FvddcjityQXHgZjX9CbCEXzMqeoXvK6yAFL
X-Gm-Gg: ASbGncsfcMfa73HVtZESOdQBdNrAyJkvpNEibbObaOeKK2F62lg6gSDlRwH8GvaRsFy
	RX7tR+LieH3ylCgijz9NthSvXE3o+Hyo83AkcLVqxKWl9syw6Hgk4o/zFbPn1C6W6fpamSL1Blt
	V3VHQYhNaQLLuX5Oi5UC/cY2N4cqSC1jAimxoaJHUEQ9w4Cmco5QEhVom5R8yORQEa4VA5bFByC
	5ALRfqbl284oOM8VjuiOTtHdsisyj4OUnRBi5g6ael04rNqSRLb+MmuhBmgdSR9zZ+tfdkKZDJT
	sxvFnkp8zNwIs5HNYsWLpGA4XkQ1yiK3XlynlZ5oMzv9UWOS
X-Google-Smtp-Source: AGHT+IGLEGWEeVyPyDR+wwWTFbq0oVcv8eF2ibjbH3ViryHv62o1TunCfyCqdUOPhJP1VvOrf1DOig==
X-Received: by 2002:a17:902:ea02:b0:224:c76:5e57 with SMTP id d9443c01a7336-22c53619897mr185730775ad.39.1745288851578;
        Mon, 21 Apr 2025 19:27:31 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:31 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 22 Apr 2025 10:27:09 +0800
Subject: [PATCH v5 2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
MIME-Version: 1.0
Message-Id: <20250422-sfg-spi-v5-2-c7f6554a94a0@gmail.com>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
In-Reply-To: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=1083;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ganoDYBx8hQBUMjZZ/y0o4Inc1qW5ojnaGmIwzuabG4=;
 b=ipoA2Z8SVi5C+lrmIzQZEsdCe2VqC+YO7vejgCp0oqomBR+RosewWbUQDu9EyO5R73jjrQsnV
 ScUl6G8cP6eAca4dFz1Mq+0GcLEcRFNBG3vhZcGbnNpxNXGog9Dcj/D
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_192732_566311_31A13C10 
X-CRM114-Status: UNSURE (   8.55  )
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

Sophgo SG2042 ships an SPI controller [1] compatible with the Synopsys
DW-SPI IP. Add SoC-specific compatible string and use the generic one
as fallback.

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst [1]

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index a43d2fb9942d85b1482a52782c0a97cd5c6edd99..d32380a2e5b18f61ed66715b4ac67c04fbda10ef 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -67,6 +67,7 @@ properties:
               - mscc,jaguar2-spi
               - renesas,rzn1-spi
               - thead,th1520-spi
+              - sophgo,sg2042-spi
           - const: snps,dw-apb-ssi
       - description: Intel Keem Bay SPI Controller
         const: intel,keembay-ssi

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
