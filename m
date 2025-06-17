Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D781C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbrCPpYqT52BydivFDzjrNzLDu93WHJvqqGECUbi02M=; b=wIMXy9im3M2Nc7
	NpGRs+MKXr/4+BOyduJ2IENLekXu9u2t4mefsvFg7+3xRbbqY3R0EiiMcviD7owmwHHNQ/o3z+azs
	NA2LRQa2HhqlHoX+g0OoAD5XFGeAahMUL+frl1IfiY5DIzHaYG8n73EDTV6hdHjP8+iQpkY/Gh9WJ
	lAwH5ESASSLN3eKM7vVhtnSLf+iVIqBbtk505nG/aK7+toHwJPQu1O0AsFjPdpjgJCxDMD58lbDOw
	lG4LemDsG5cMwCSP9sTr3onLw8WdmFmCf94RvjmCJDcnQo2U5XLCw7EyhsMqKLQIuc087d5qumuAE
	hrbaMvN1egC82FYJ+PaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQNi-00000006QDl-1W2f;
	Tue, 17 Jun 2025 07:05:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQLd-00000006Pqf-1lMf
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:03:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234bfe37cccso67991005ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143789; x=1750748589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUSaq5iVGlG0zdfVbYa1qB2wB2qIwASCB+SMQsH2sLk=;
        b=HinSbENVBU3Gpy4OL32mfngpitecRvRUY86H6+WfwOOTVQlwIVitSFY5bZ7QdiaD5/
         JUJwu8tw381yi9LU34lS+aDqJ5eXJPjNANPYb6EdR/DBOsg5xMeYUIz6hod7Xe8prrNj
         PweTN70lxBZ+JIWdjEiSlxgjg9FzcJ8FDHzQsX/CkVaUnB1rkec+uaUEfMjS487Ob2mx
         W8D98FEJTjy08soMZ8oM5lnNwV3p+ZnpDNt2/nI50MXi+AtMYpQoFMkWCz5PPitV02sM
         5nvkNvawNyvJ/WKWjHUT8pQFMXFeYNFKplqWERVvFN+WCbZ5weyHYWynuCu6yiHl2S1Z
         uuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143789; x=1750748589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUSaq5iVGlG0zdfVbYa1qB2wB2qIwASCB+SMQsH2sLk=;
        b=w/6aRG9EuwrM6kU+7JDRRLvyqKiBvvs3O6GI7MJiFSEVAhrq5hHBvBjaJvOz7xga1p
         YGQe6nLAD2YwRLERspACqrEzpPjf+9KM1BOJ4EfloIC7FIVycO1lX0tmbPwMbiSB3zrk
         SjwzCGX6tsxhC/K2nGDpHSHbNiJkUKwQSFru6Lj0ZMatVIm/Ip41JeeQnes+1zv0Zxmw
         mqb/p5m7kaa4wN+ceV3K38Tg3//PHcVYCncScJnWEhIcRwZwe44KvWvL7xzOTUg3G/Xb
         V7FeqsqmtSJxCTyjSlNcp0eachkbQ64DTfYeUR5r7dFGtyFKqTa9rByax/Kk7mfEBZcA
         1gTw==
X-Forwarded-Encrypted: i=1; AJvYcCVqOkYCPHfw05a42k4uj77i0i+m0Vp4rTzqSsC0qdY6WC9wCiFSZ7cJcTRl56lrCwsEfyOOI/Gi4PikVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvllfnDhYZQ/gfxzVseBWxXBjALUra3R9nWV3uirgTC4FfrILe
	4xeHAts7pUTd/jdfBeFvQvYGJQLrjhNkj22B97jDSFMO7QgJWdfeoGA1
X-Gm-Gg: ASbGncv+EFtynXy7RW+Q+ad0qcWzEOTndcTQHW3HJqTiTIJgxO2lx2PQSUJ0ctpGP/B
	KH02XAkwEZcYATa7AlQHzyxHgWnY7hirGVRi3a/P/XQzvDCOCU/tfyFwZu8H9FXwHvke63ZZNDF
	3O+48T6bG9tLOPxAJo3iZQlcA2B3wx3X8hsNSWhvrf/g+lEMegbKu+zT50QznjI5Q0HcQIhahik
	ITQGNTWpJS8Q5llhZYMTzF30UeP4DcAWWQP2Ior4IszKN0TynupGSlkfcvHr7vebJEwNVX09d/I
	BFF+LU6qr4ZbK+MzVOw7LXnvYnPQLxi8Coqyvt83EHfk81JMVEGX7n/aB6xBkrSuNVi5lVzH
X-Google-Smtp-Source: AGHT+IHcjeI1Rw+SykS8rTbHJZlwn3uGXgj/MA4H+sRjd8G3JU1s3lnpobaJkSb+cj1Dicl+oIhqlg==
X-Received: by 2002:a17:903:3d8d:b0:22f:c19c:810c with SMTP id d9443c01a7336-2366b19ec24mr124060485ad.51.1750143788808;
        Tue, 17 Jun 2025 00:03:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88bf6dsm73043555ad.4.2025.06.17.00.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:08 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/4] reset: simple: add support for Sophgo CV1800B
Date: Tue, 17 Jun 2025 15:01:40 +0800
Message-ID: <20250617070144.1149926-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_000309_526369_A8A0B663 
X-CRM114-Status: GOOD (  10.01  )
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
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
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
