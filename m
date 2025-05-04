Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B2EC369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwssTdnnwwSVhDrU6KnVPYr4aZ9yxEbOJl9YLkTb+5o=; b=VZcIVJiOqO/BI+
	bK2RUBkzH01vJ8axTCtGfOUrdic3IkxAxbW8bNNXwdWxo7G93Xl4L7TTwpKumDu/chf0R00c436ts
	mrHsTxXjLChmADPZP0b4Es3w+EYhxzUtUKLO8imhz3h8PY2gtjX0CLHxZbUUrv5/xs9DuKyj44kr4
	E+9Awkm2mG+YFDIJPUhu3PHL2t6TMW61pe36TI9dY29XUNPK4srhpVrKG9N/SkicyB/6h/k6kCS5a
	w1IoGMB2N8oSOWcDHE5EVpLKjGl+2RfNt1U6DfqS5riK62cd7Wo07E7N3OaGZkVEhvMZ5zIvdpbJh
	2KylPpfooFcBku98gfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrc-00000005CB1-3qww;
	Sun, 04 May 2025 10:46:28 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWra-00000005C9j-0xbr
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:46:27 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7c7913bab2cso379565785a.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355585; x=1746960385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luBGFn+jIcsRlGss1jEDVQja+DxK9mYI/muh+oug9tE=;
        b=ZJTKFRtOVCiPEBSpvshSVAQXo7hr3M2Q+c+/9AMbL6D/munQeZ+mId0UnyBW687n2l
         HpjMRg7ZO/nOmJ1p64W9MRq+hfAkCGYAU+/jVrnGRzYPydTZ5nYIvFkFe37K1MrFoepT
         k6l7VDyDWOkXIOHar430xRcc1AX9hr5J1dDaT87EVJmRHLiCumB+fQX0ITPoxpp77VpP
         R/FORjhkYrWT4aePTt70SqjO9Z6Z79Yo9wuuBilq5UjxOID8yyPc+pwpDga7vOT8T49j
         9Ca61K05DDNz5wjmKHCSzhgQ6H5dIlNjz6BnJLlK+HpJtjAa12CFT9IwAQsOuQfhz99b
         eCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355585; x=1746960385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luBGFn+jIcsRlGss1jEDVQja+DxK9mYI/muh+oug9tE=;
        b=EBRr+Cj6wQcOtlYbHQqv3Bk09T0BsiW7Sw3WNtZHOYBa3HNWkblZS7yawkRtjPbUaB
         wK+yG+NQ/5vGJfjWZT91ZSym/w95Joy1y6KzeGDxqzN3f4JLyf1WqsVum3UF+8gKOPQZ
         /eFKrfoLZfxAkIEga5f98MloWbatwqhyHmvmN6NNeA50PloOewUzSSKla2+G6O+nkgej
         Ty5EZvhYh1e8+xNu5gTdGAIMNk/HrnYfR/7xAbTL95QRk72SuTrLdWUKjIgn4nKcuMvY
         b6ogojaDbdgGApxDpHeve2IvPE6sVNC5cLCMq93BiIcb5P03DwyrAn0gCqLcRGUoUbY1
         vnwg==
X-Forwarded-Encrypted: i=1; AJvYcCXvbPS5CHsxxj7SQFe55WeG1tZR7XZoKi2qBQBRUQZ0q3B6Jf3kjBGHqJtQ7/BvKBNx2bWIoav0dldB/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuOyTeAPFiB+G5ZgzuZlX4e+RUBrgRYUaXAUajE1Pd0+SuyY0I
	vREtyIH2ZUa1+A4UpP6XgbKM/FIwE1StnMtcz3OErM/NTqh0710K
X-Gm-Gg: ASbGncshEtSfU4E/+2Z7WGLMGuUWRMiJV4MNFV/XkbAf8n1pw4dKEQHuNfV9vrJwkr3
	T+F8IGj/LzIT3Fi2dgW13EnG84TNqmk/AyXxYozCVxfsBoNr29yPndG6OM2uI2rvH39E1G9K0fU
	R/iGPq7bw2X5RPs2q67XI/CdXjPIcOEjO0npOuVJlbFHhRnjU2xgryWBtZDoE3VgDp0rIu4lVzf
	1sgaQmEgaO8QT004NsvPuDSxZql1kN4D/XcLup/D8wdAFQuZJrbGyFrMVHX3P70w2ltaJPyFKZQ
	Q1pqDHiJjdLlMOC9
X-Google-Smtp-Source: AGHT+IHc6JO110pytp4DT/Eq6cAK4dWSNom4k7fdULVNjvMMCHikTESlyYH63sW1mFS6wQgaea6AJw==
X-Received: by 2002:a05:620a:1aa8:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7cae3b0a352mr510352385a.53.1746355585056;
        Sun, 04 May 2025 03:46:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad242b587sm429752385a.77.2025.05.04.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] clk: sophgo: Add support for newly added precise compatible
Date: Sun,  4 May 2025 18:45:51 +0800
Message-ID: <20250504104553.1447819-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_034626_267063_56B736E0 
X-CRM114-Status: GOOD (  11.06  )
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

Add of device id definition for newly added precise compatible.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/clk-cv1800.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index e0c4dc347579..a4116ac1adcb 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1519,7 +1519,9 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1810_desc },
 	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
 	{ }
 };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
