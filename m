Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C9D0E6EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQis4rRa2Px4AIlnFNcCBxnNZcrwiN2ViNjIkmTII8M=; b=KwBT6NkNCHgKHd
	U3FWMhvy/t97R/BQxxnZMHpbt6pCS50gBCQ37peONfIB8EEPDfQ0FjBU0WpPtNo/+AFUD1N8Jd/bN
	y66ypSJ4f9gfyJbx9j4+TloBY2Zu+EPYyP+5jvPJIPJVBH8NavC3VG3NCRJGrqi7ClatR+1VywQZB
	XBENUFW7T14vsqm71xAic76D/2+sUy4mWaj0vDhxioGXJGqp++s28r+tphpdTKMJOt3zIBYFtcOzi
	O7cNF0hXPdLgOGXjLTEfBBNEI7eQtgWdptJlCBFV3XQ7IX/baXHzvI0m9YNj4mqoo+z5AC4sB9bky
	JnVDhcYm0UZYwUTz3ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2psE-00000006vds-1C7F;
	Mon, 21 Oct 2024 10:42:54 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pmQ-00000006uVQ-0VaZ;
	Mon, 21 Oct 2024 10:36:55 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so2938361b3a.1;
        Mon, 21 Oct 2024 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507013; x=1730111813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
        b=D7KuLUwK2AvwjqSb+bwXqA+qWw4qHFTOJMQeVtooSlVQa35MuUf+vAEyqIIfOy1Rx1
         lYf4g4hum7lE1d67yzsUjDgMqIXJpqJwVrileq3WR3O4RFcf0bn7EylBHoGMXlnzMVEU
         hHogH8lCkvEFVCdEnmGbH0KyBwu1poaO/9hRV7e1onpwqdYU4IkKsRXRwiu0b6uVSCfF
         t2PHW0qpe9rx6MRrC66QkGETvQna47MVXea4VNyuJ6aFZEA0hI5yXpAR26+VfkdAe/ic
         S4gZ+W6Epagi1/ykqHIjlUY0i0zMhV2ZL78GQw6m6qz0e0pjJWnVL00jnnZ6Pr3xKYFf
         sjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507013; x=1730111813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
        b=hEqATh7QO93L0Dd3F+mWqLukNnbFbJeJl+I3aSJEL8crtykaTaqN224WTV7QSKFgEA
         9NvUydKHm43eGFRIctBVNVaSmZ/i5BA8BXoyNYUFr0qe9aJOMV1yWftrQoYRvEFQAGIU
         ZNqa65oo33E3oL7L7ByXdoO8WiyRdS/Dg47k5NwxozUIwYnkQaAwHKyEhvWoRkxhRKx9
         2s6uk+5Kr/1Y1iLmgLXhZR48TCxJrBMWqIMWY5JhNacfUkXxzxbUqh3c1bfulb5a9Eo7
         IDnPMfjVN9YlvdiwzZIPyjSHJRNrVW/9cucM0T9p/QgC6Qc4rx6BCpIRZKbtlkMSon8i
         MF1A==
X-Forwarded-Encrypted: i=1; AJvYcCUOA3cQsGpc75WLM9/2Q8BfDHUVSj1baM2j4T1Ql8LlBVKABiZNahl6AQPEPDhB0QRZiMWy0Bmcw8JwOHA=@lists.infradead.org, AJvYcCWFcM606AbTZOkvZWJPBF+KfEq7/nn+BvoPOWvueD6CeibcS+7WCAB+OTgP4h2b0GcKRy7CKNZqkrzNsZBjqDW+@lists.infradead.org
X-Gm-Message-State: AOJu0YznMIGdn+48+oC6KSThkTOD/siXFjNOdeUx+nZBm6gyo05HUEsL
	9ykK1GjMUMNfd65mCNJxKp8x/yl4rzW62Ti2hHuVij+GIrgR7Ig/
X-Google-Smtp-Source: AGHT+IH92yYXC4eqDoteqMVnaKaZwnewH6U4taRuuS75GAekpZY3rtWoFcqSB+3PqyFf4WP9/QcVHw==
X-Received: by 2002:a05:6a00:23d1:b0:71e:6f63:f076 with SMTP id d2e1a72fcca58-71ea31927d8mr16089602b3a.5.1729507013033;
        Mon, 21 Oct 2024 03:36:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffc3sm2556008b3a.62.2024.10.21.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:36:52 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Mon, 21 Oct 2024 18:36:16 +0800
Message-ID: <20241021103617.653386-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021103617.653386-1-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_033654_320710_F680D628 
X-CRM114-Status: GOOD (  10.29  )
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..3c4e78b10dd6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -555,7 +555,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
 	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
 	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	    of_device_is_compatible(np, "snps,dwmac-5.20") ||
+	    of_device_is_compatible(np, "snps,dwmac-5.30a")) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
