Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EDCC369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 02:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0EnX03A8Gg3nyfAOJOLo7v9sIlhVmwH4TxziYlyQHE=; b=XfPNG8Xw78NeNb
	OwO4JRH3qn0x2Rd6z9h+CeXE4nwd+jnjn+bK9BzXeZSpwDP7z6dA5otIYcjzGs6rh3/GgltlEgj2u
	s9J4Swz+9+JVepmQFx8NJTIcvkXxOTr9qKSYVVQJy/FWXqXgCMpnOaPuA/GAPd5/qhqT6jAYYCNFV
	ATldP6JvdL/nivsNNZiK8VWwXZitg3RulVxmUjhn/9vNDeNaxXn4AhXvKFPSrvAbaG9JC+ZT9aGiN
	Ci2PRMMHyTqsQk/ry3M2VrrTgyaksfMgLjeNBLAfPKFyVcZwa1iXsYa2Ji+GOMe6rEBuIItfJB+f3
	sveJx6xgVsrRx9pWqrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88o8-0000000Fmfq-2Fwt;
	Fri, 25 Apr 2025 02:28:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88o5-0000000Fmex-38wJ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 02:28:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3085f827538so2307700a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 19:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548129; x=1746152929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hpF1QYIR1QzmtFMnUvu7JqtGDUe3J84yW7wA0AOB8M=;
        b=UYjoeg3TePqE1L2qJnPQhU/6rPTRjePdn6zevvgFw/j5ll0LEwUlsWjogxpp2Qidvd
         QCKyLAVDN2UV53K9DsD3ztcJcTWoxsiV91MBo3nRkFsfWXYiOcTM+D4qd3RdzxyvWwjT
         i2TZzyNuPKzYM0azJfZ8fOwNJa8kAHnl6MPvXM4h5By77dAUVagtKUNSuNktCudlOTtR
         Hf5giH9jjYp6ju1TV610cPY4evUGb3Z4lLAIHOhPP06VpplURSOqd49Hc8Gm6T5Lzw8R
         C+7FyRgs8a5xSflnTJYu0HlKjjGUIFB9e603fLaLYV7wbkejMbaXPvQXX4LgVEfo7eWC
         1UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548129; x=1746152929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hpF1QYIR1QzmtFMnUvu7JqtGDUe3J84yW7wA0AOB8M=;
        b=wl4vaKCFaZcvP31t7IR60SxJK9dRUkrsP+uBnKy1AUPltSbCFZQEvWMiYu9jsG3cyT
         IHuF/2KvcMsGaML5F/vXDqdzRybjWsHoHqC3yCMizX7SD3lqG5LhgpfvyIIpJodb4zUs
         VwL5qXnBNOvkUm8l5FYGmTegwCtRNu6ndquypf3eryxU51+kWzby8W2Om3nVrUiEQbga
         mKPfibuyJ/Q7ThmAJLCsRvBzFTv7omlPHS35X1ol8ccdEFhFc0x8wqm4XCu856VdiZgG
         39cSzBHEZCYjUlYa7Qgg/frKWvGjMZj6RNotIiwRud0wepQXeR6NPWFhk2T/grjqH81a
         PhFg==
X-Forwarded-Encrypted: i=1; AJvYcCVC65Mla0HpkD7rjn74f5rjcdMN25WhwuGKu9j0qkYtISzNEAE6B+5Jf5FhV9BRPdE+8vWaEqmHst5ZxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvneKKuMAwx65dPBVHENWWjZlN5J/XftOUtrXgG/4+mD1/yDo3
	JxQRvf5OshaOBDzm+j1Htt5tbKkUMzoJO3oTXRevTVNZAFTtr8FI
X-Gm-Gg: ASbGncuDMEOOwfDAobGqcnbYo5yl1lGlC7v5LO/czTIjTjjw9Ap9DQc0dFll340Xa1h
	xIhFEB53siR85qWDRr3SEeSjWjN4xMtc88hOOcrEOlOyrXGHwlJK7yYmJqpDk8w7cTcA3Wf2gm/
	A8GIKwCGLAnkGvJ4EJEfn2ZIUO9LIqxsiUD3Q0zqWkhSsfgzZLS30Hlhgxl2hp08wbV2X2b4QCZ
	nawmDHNHKWZl2W682KL9QfuOrOBgWzrwka9zpofkxGd2QTOD1le8u2yXl8tWLVJIt6bKYQfu0F5
	X8R1sDZlZToNAYjygzNx+VSFlOZgB9zKK2Sue252Rjb8Dg==
X-Google-Smtp-Source: AGHT+IHhVh8/syiqQVm+l1KSae9zd6leTCYEp4C8rAUy2J15yHjmcGB7QJ+GZArGfhW+Imf3+BiCzQ==
X-Received: by 2002:a17:90b:2545:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-309f7ddfec7mr1289140a91.9.1745548128840;
        Thu, 24 Apr 2025 19:28:48 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:48 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 25 Apr 2025 10:28:13 +0800
Subject: [PATCH v6 2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
MIME-Version: 1.0
Message-Id: <20250425-sfg-spi-v6-2-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=1082;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ZmdPpnOZ86WV8AspiWmmzZXwyUoSGbTCqeZlZB1Dz/w=;
 b=gxD0ZGLEmhTB+UWLpRrBTOWrtsQ4OIQo4V7QCfO3+5juR/uiw842tItKKNNYO/cvyov+2Qhfd
 MmIQ/Uc6t0qDmYKN7Rmv47ERGvbISoFG18X+1DmWMDmxE6RYENOJLWT
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_192849_794046_D56C511C 
X-CRM114-Status: UNSURE (   8.34  )
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
index a43d2fb9942d85b1482a52782c0a97cd5c6edd99..53d00ca643b318a8e75b9b79dbc6bf63962fc3be 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -66,6 +66,7 @@ properties:
               - mscc,ocelot-spi
               - mscc,jaguar2-spi
               - renesas,rzn1-spi
+              - sophgo,sg2042-spi
               - thead,th1520-spi
           - const: snps,dw-apb-ssi
       - description: Intel Keem Bay SPI Controller

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
