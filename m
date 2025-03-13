Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50443C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WEJ+oIzyOXN01KXat5XjIn2pJGmAopnuXbAO4JiDpI=; b=XpQcQZB2ytwt/4
	GI3V88pgT83Y0DZmsF8NagPmmLhVKEOqIwW5ZHpptn7Gja0/00c/yQ4Ytpe5z5kbh00n3Z3GNo3Ci
	+kmCRV8dhILZCQE60HLkjhJfSmtRjcyp6fOKSt5j0hV6qbYATRf1SCyL6/gio51fCwURgs7nCdaLT
	TwYwI8iB6tZGPNaQzLInPxWWqFZlIpS0S0CMU5BXTQi190LpuEuBdsPgxvsl0BjXb0Vv7DmnOc4pu
	Pl5Az4yT+BOw3wbTmnKlgwjni8hUVK+xTgIiP0TwQOfbKlkfDovuMe0A8/LQkToHhZlvzRx+SHPci
	POJA1fRIT6HisH9TuHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiM3-0000000BLrI-2lyX;
	Thu, 13 Mar 2025 13:12:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiM1-0000000BLqO-1ooI
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:12:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2239aa5da08so16723555ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871524; x=1742476324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioHnF4CSbRYwCOFInozClNxdEAsDMbHLiEMPDV5mWJ8=;
        b=LxHO7vPyHNvpmca0nDFALCF0unwMsIpJNtZtUPtoI4rC57e0b0N5XGAgZOQRxyCewp
         cbPlnMlqY2N6iRKU0fSlTkHyd+LtWxSgdXjEDd9Gw0oUVoYuOvFTZyhyJaOb/KXCUVGx
         EIYQUkzDZrY3sAyRzdQ3qx2K8LjszqXSUTR8ynWa2cFXbXmJRGXGZO4W/FyaCq6uCPUL
         QP3Rj5aJTQg4zMR1UiFbtLT1mlWUmw+szt3k8BW1iVJz7lxB2zNU5xJGMGJsnkoTzlxP
         8hsFcLjChjtIIYWE73tuLpKTxpdd8g2LPHuDr8lfqvJ7NqLFl2/GR8cSjYYDNtXwkZi7
         2Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871524; x=1742476324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioHnF4CSbRYwCOFInozClNxdEAsDMbHLiEMPDV5mWJ8=;
        b=rf9wPEoubZAQk5yhNzJ7sVO3hIwdC7jN6beQISuXx2KL8ygVNxvXZGWvcs/0WKmKyw
         GV63aBZbzixZON6VdmRJ37JVPNnTphi9CVrKdane2HaGq12EiuJWtKqOyKJNPJMF9MQz
         P781cUX1u4VeEd33Qk2LqfpN3G/zzvRujpHAMRGpTr9KWNndvRDepIEoRRKGU+oJnjHY
         0+iHYToTY+ZhhIdqufteECb5HLreHOzukBj30bedMR8OC6HhWVQlPf0hk9E/pzpjrBDc
         grpRCPiWTKqMjUCwK7aDoANx5HLzDXaYjAqy7ATLbIiqHUk125q6bAQ3aNAqLkAYJdrk
         8kWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2HRCKdDT8MNiQz4+920dQuP4H5vqOHgfNkGklQSwdLFl3/EXJ+5oTeo+Ki3l7Koqoz81sejE7RKzcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1WjNZZckUxYyp1A9s0KezXpJEf/C8CLTlsFb2sq+lCZtQrE3H
	ZK/cm1EnQUNR9I60NDJyibJ9lx26iyp1UYp2kfVjRl64NkBM2xHI
X-Gm-Gg: ASbGncuFjt2Qeg8BFY9tquxneyILc+7WnRkt9TvJG3DBtbqLm7Tg/Z1JnFxXe5Xhmfk
	+eJE7kGE1sQkcegAildbWsnKOGYGc0LhIGUkhKR1x3FWxZyyjMyYJy4vtPRMOoNsBObW4GU4dv+
	vWABc436k5Y2L45SA1uW4qDY/R3UPKsWdGVaqef4YSwsopF5pndo8qelfs5NfeK25dz02hhUKoI
	LMZ4vLFONqzBvzKwI6vSn10EFSVyt0l1GCr/orT//BDqbALE9XCGNVhtSLahRe68GKA1Vd/wZ4P
	4duEK+PwPn5BFG/FctNJcbCRnOj749UEhTU=
X-Google-Smtp-Source: AGHT+IH2Tw+QYfXY3WazHSYYhYEHi4iFK5Rz3wHX0nrqtQpHEZJOcKdnWkhmCHmNlfUvzg4HFsOddg==
X-Received: by 2002:a17:902:e80a:b0:224:6ee:ad with SMTP id d9443c01a7336-22428c01371mr410617775ad.44.1741871524191;
        Thu, 13 Mar 2025 06:12:04 -0700 (PDT)
Received: from [198.18.0.9] ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm12539615ad.116.2025.03.13.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:12:03 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Thu, 13 Mar 2025 21:11:49 +0800
Subject: [PATCH v3 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
MIME-Version: 1.0
Message-Id: <20250313-sfg-spi-v3-1-e686427314b2@gmail.com>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
In-Reply-To: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741871512; l=949;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=losN7+Xc5utDKmJ4z+1lgugBumic+UE1GU4OYTnTOco=;
 b=ndAuJNM+9Z0GCvopXpM8mOuezwgblTRngkyxWcXuEIrGOBWqA386LTSVTso8ktm5ASWERKBR2
 QOnejMyOqQdCTA3gURZiiSj9KkfobekfTyP2sNO3oT/NcCArQUd2yVc
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061205_479831_FE28BDF0 
X-CRM114-Status: UNSURE (   7.25  )
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

add compatible property to include "sophgo,sg2042-spi" for
the SOPHGO SG2042 SoC SPI Controller.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..33fb21267df2594e68419cfb980a40909868e337 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -92,6 +92,10 @@ properties:
         items:
           - const: thead,th1520-spi
           - const: snps,dw-apb-ssi
+      - description: SOPHGO SG2042 SoC SPI Controller
+        items:
+          - const: sophgo,sg2042-spi
+          - const: snps,dw-apb-ssi
 
   reg:
     minItems: 1

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
