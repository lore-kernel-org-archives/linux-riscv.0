Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5578C369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4LZQf4FiY3eW42LZiWFylGRc4yDzWgryW5L4NRV/FM=; b=Q8924VVjr5o+Kn
	QkYAcWMGO/0o/Jl0HFhz5NM535zeYnmItPkY8oDL7O3M1ZJAIj5zKwMy3Gf/VhPq1mNfIuTr/ZjZJ
	nHhN8LoyNWx+n4F40IAjKWjBR/GrC/xZ/7pvzXqmww/qfJ7TF/1PKUhx3Ltq3dvg9LAGT8FsltR/n
	ySCwafZiPXsx4gRKGE1lLY1+WjzryHZ7l5Ml4YToczv5Ls7GsaElDnOW4KPNs4mZyZq64ZxqGA3c6
	CvLbtOAh91fHwnAa5mQu27QbpIb+EGfnkvJsB6YHLbBUEoNtwhRspngZlKxJ9ikK0W0CAlO9pcRok
	Aiw9GLPFi0CMasxq/+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8F-0000000GX1m-1zho;
	Fri, 18 Apr 2025 14:55:55 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6c-0000000GWRA-1aSV
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 14:54:15 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-476a1acf61eso18432291cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988053; x=1745592853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=CFRr02JEUvA5+ENc1LzndbnfvM2EXVcoLiFceqR1Dc96U3idV1OCB+BH1p0z9So449
         mGiwokzmxqUlv4UUSVoMxWfz9pL1j0iV15g4CCWZKji+8CEICIaJKjC57ww8gB9Iu8lP
         DdENCJjuIS9W2BxXztTiVMoi30jXlpQTp4zVip6KWQLzA6+mlzkgUBYjL1dcVZRT7l27
         LGY+0/oJYKjzCya1ibhT5VxXIYMOJC4SMbF8UqNiMQHI0nZqiG47M9RXGx5heJega8A5
         EyYj79VEgX7549VpmEQHHnpmJcsswgi9f3RUf7KRuI4OqNm/MHyDJw9APYmB2WTyoObs
         FAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988053; x=1745592853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=XkEYSCN7CYjZdE2p8QvbRx/PenDPMTpJlB8cUDUJuuF0GZiz74w7AKKIp+KG8iBFmV
         YCoJCaqG3ypi6gEZzTMBFR84RZYf9a020GqmMyi00r8yQ/VY8WsVIYky+hOfufjxvDED
         ww41bQnoIDqInVatbiLqDVkitk4g8zAWiqsFpjvBEiS4Iy86tUjp5yn7ggqWG5oi+5Iv
         pbh4qHp80TSNkUsYK5eecEaFJhVfLXub/UtHPcz5yjKyolBAj9RDVmnQoM6ju69phb14
         wSefXiZUenMK3qGxRTuUDYk/OqE4lXUpWFrkZbH0P9L0pB8sD3jQyN5Xu1a94y2WkC5q
         9E5A==
X-Forwarded-Encrypted: i=1; AJvYcCXjpm70utTGnaURMtlRetercx+XPgbBqWpECoUN2gshzfUJMAJbe/XSR8S+Jcb/ZX9kj5VvLWKkoMoWwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKVBpyCbtuJ443mTGIjGecGnpxUiYcKtz+MpYc5GD5jaRLvMhb
	tjoltK8GqyZRGtUHrMDXSqcYtqyT5gvkWXk02CuQozv1dRZn7rQeJH3nvX07BI8=
X-Gm-Gg: ASbGnct2R02QvGVsH18rMHghDdU69pX55cZdsn3QfcA+5q4wtEb1fTvTXhRj363IP71
	hl/oKAi4byHGPGpiRzbSbN2tYSoyoTcUbyuefxZiQCy3oGp1nCK5pURK9HS62By4A7B/yXqvtoO
	4j0gQis9EXb5Ga8mIgNM2Jax6v1uESEVyInF0cDFCfX89nGDM8eSDJjgJEsOsx4aCNpyKgquOE6
	zK1Vv5CZuQWwMhaW6vb521+JDVf4nK74qKtrHz3CGG4T7zihORMMW1hEatU4PG5Wp5xLePvDKkl
	oFGPaVgzYHlDjgCtLCMGvRaQrXug/vpfRphFuxKihN9MeouWABFXefJFa1tY9g7+EMI3HgINSfb
	RkazFVTjTV36KBg==
X-Google-Smtp-Source: AGHT+IFZ0pFYNx2snWn3YpkMMZYSR9nF5fcb5GLtk7fhZ50PwkaLo1+AOy6UlMO++lE568O7vJ+T8g==
X-Received: by 2002:ac8:5f89:0:b0:477:4224:9607 with SMTP id d75a77b69052e-47aec3a6358mr42212621cf.12.1744988053257;
        Fri, 18 Apr 2025 07:54:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] clk: spacemit: make clocks optional
Date: Fri, 18 Apr 2025 09:53:57 -0500
Message-ID: <20250418145401.2603648-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075414_420908_9C083EA1 
X-CRM114-Status: GOOD (  11.73  )
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index ad5f41695f8db..dfc8aa60d4345 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1218,6 +1218,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1329,6 +1333,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
