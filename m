Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC2C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9WUGgiiZ8JN/exnW3ZBj3I7iX7hT5S4Wd8pXiViIhg=; b=ZW2+KRbOIlL4yy
	MyO+Au5lJ1wl6E7aLpNGOqVmC0pZs5/7EzKdyt9ZwK0js4/t42otrd+JVl1xbKcFrEeZEMOHr3hl4
	K9Fc19/G0C5OM3WWK2iYKxBjIsBdPnCLpQN8Gi/NHeMSfExcDQOGmKGcDgRt/XPUNoN/NMroNfEU0
	d614JZK8GVsgd4HDc4T7ZNd4Dio/+3fH1RJqo0x3lXLjsUSKmXkJFE7ew9ke3ezNhxAf+Hjs9Y4lx
	PW8F8Ni7vkYwZEyolvyy8YA3Sfbo8m5T7jnF8uY60Dl+H7meySQtCaOxEoXTpUhulEBU2yhjNMzXK
	UUT6vzWyiByqfKJZe2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMa-000000036Xs-0tUg;
	Sun, 08 Jun 2025 23:23:40 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMX-000000036Wd-2gko
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:23:38 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7cadc92771dso351451085a.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425016; x=1750029816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzlaTY0tHdKvyrCrJLv+ChjIQt2LAnmKHtpsPVtNlOI=;
        b=lHOJFUbl4hLosWNd73ppbqCLzYltHoFl6xY6WAal+Fu7j9mWAomVAg6GAh16lYz7wh
         GAxeGhBCdWAPrtrlD4ma6r5ER2/1h09m/YUpaCNIA7kFuvwoL7ziE4Xnrrzs73uNeSuC
         Yl5qxeeDdEEPtan2hv8yL4rKvC0iaXmtF3eqA88BPqEROZv+u3IHX9+7nUmmEeXes39t
         gKYlBN7mFVhkH+UgDVGVva96BQu0GU6hB7DxpMLs3np4fvm4oODNynwGYPaK8GrJ5TUJ
         pIrNIW7igJgR40MZUF77o1FAdNP045V6RwG1MX4nzTDtr5PlhhU1nRBC93IvZsvRNUVZ
         KyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425016; x=1750029816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzlaTY0tHdKvyrCrJLv+ChjIQt2LAnmKHtpsPVtNlOI=;
        b=Zo0zS/CJpmdEANc9LAxHGbzCO15nwIaVw/+Jki/ITEi6CYmQeEI/W2NRd34qkBBQqZ
         ANvwSZ4vEM6RdjofHpRCs2jWl40Jb5yMXwmhmjPIBSU7uWt5lhF6Dl66wHl+gLbEPQNA
         13olY9a5Kr6LrfjPzG1ETWewQvVsh7sGVZa8rmQWfWn8uzypFD4yzLmoEOwGkmAKwUYA
         cewVk9dXLPFwmSYyRRw4eKdakz5aAK4CgBOQiOEVnpLtOWHdNoF9Wxv2XzwqUKAQtv6x
         NN8qbkI06c4WdCfUNdMjvJoaleOiaPqOcTugL3V4h8/XyguOUF/MbBHkitSSlA3E436H
         mpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmEgV0MSitqxm1pE2ZZM9K/rph0jSUFss5nei5uTHJ9RE/8ExKWBJwIa1Bry/FdY7w9tbOtrB8hKeSwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbtK4fBOZYGa199/tp6TJnW64/re4809qQd6//OMhja0+bhXsx
	r0/gamGj44ippjK4iWPh6bydnCiJ8FStYsoKpvJgFEyvu1rQRO7vndEP
X-Gm-Gg: ASbGncsXNxSAOora1XGKGRScrDN3IlztnP9vBkNpj0D4OhBQRlyK9fivLWJ2hLvrLhM
	Bxy1YxUgtpZvQVHXzlJQK4WIsxFiZbPS9H0MPrShBqbGFTJcStcloT+D0zVnvUC/Gpsxc1LaG4s
	qT2Y4YTAwgXpNbBA4/3gTN9vy3K3XI9A1KaUeIUacHZsEY1De2X5/6Qy4Lot/h6KKFmYFcXHluj
	FXCD1w+6TqtjUrGvB5X6sGesav4OUzNAXcSnNs8u6H4/H1c0OhVuYkf+oMChsJcolV/7AOMHPSo
	BOzIrw20M2+WtS/2RKmbhX8YFTs=
X-Google-Smtp-Source: AGHT+IGjbwg1Bauz9LJ+K9RIr3N4RPJEfKPtO0PGQCVeGinq1IMDmYmAae0bHoznkVtegbGh0XJUbQ==
X-Received: by 2002:a05:620a:198f:b0:7d2:2673:883a with SMTP id af79cd13be357-7d229874d7cmr1953579185a.7.1749425016456;
        Sun, 08 Jun 2025 16:23:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250f64b80sm466522585a.23.2025.06.08.16.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
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
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/4] reset: simple: add support for Sophgo CV1800B
Date: Mon,  9 Jun 2025 07:22:08 +0800
Message-ID: <20250608232214.771855-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162337_678072_A7E9D823 
X-CRM114-Status: UNSURE (   9.87  )
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

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
