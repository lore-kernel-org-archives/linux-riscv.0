Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2865FD530E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkUKJpunOoU/e+m9nz7fyF5VsDefakWozLeeceAs6hE=; b=H9+HVPmUVIb9Lw
	GPDV0M3zey2vG5lFZAq6I0G27JbSRoQNXmpSLzz0NfYBz/HN48nnWCZ63Hb4y89YKgCfjR52duKce
	mvGH2/LayZQm5GtPNSIN/CYlOJK71B4vOqyQUTMqyPBZv3FGfz9z1TGia8/swCmuk7WMhfN2NQDI5
	Wi8vtkYewKxRJ+l0q4f246RQoTyOCcE7MsK4b5Frm35cuGB+ncZLC5pXDUDc6pF1AjHlkd0xq4N5S
	SB45lkdJGgWDtOcJY75yJgHoB4sXcGz23KPQ4cLfGktlAcUAgAoBsi7SYysiNRwYtvjCJX+R5Qybo
	QutdpiiZT8m3bVyjf4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjU-00000007vTo-1xTO;
	Fri, 27 Feb 2026 07:57:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjR-00000007vR6-2LIC
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 07:57:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad9f2ee29aso10845045ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 23:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179073; x=1772783873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=b13RbrBGGpZqlnPsRN0KgRzLjYVZRwlLKh/cKgUpDvguQM/UCjV2SnkTD86lTMqI4v
         5kf5rO+NUCZDtEDXb9UfxfdcguBCx6wye8fEUpVqJHUdTAp6H/WDGRE2mXJxGElYRaBU
         FYfDNk133LqF901YJjalXnVULCU+z9H/rXzwJeFBIasRSK3+XmCnZjkLoBPHaXi2HFL7
         i2WpN579+eNficCkmjma65f6E5FNeoIyvEH/8EpWeTlsK8UIMZG5VkXgqf/AMNoYcp8g
         fsz+E+vkhqEUjSuwWzgnDju0khLdpgHiZDTG6wFpc0uHMYa2e465d004ovWfBlCQ5s7I
         jDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179073; x=1772783873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=PRa8Hpvr0mkbbKY7sef5fS5PHrdn+IqICtYUL9sKFqS2/urNfew4I26znKC0KhmQrw
         Xv73ZU3cnbe+y+0n4NPZtbKmSpmoRpyYAI1x2Bbfxg5up5ZbpK7/yjVLdr3YXhGmM5Pq
         PYwEpWowK6V5rkRK1HwcW1JhTNqKX5KgMhAjkonD7ksmr50ktRrC5sasbohVTlwndUm+
         cOfInTKUXlx86FtGjFFpLCDZAV5CZyd0BCgsl+scAXdvcgvs5F/+oAkPaHRTmo2MqNj3
         IJIZhtYeNjqU/hPjwFlmiMD66qfgURWW/yjbP/Nno+8lAim864F5Sdjd13B4ibvvL3Fy
         /mbg==
X-Forwarded-Encrypted: i=1; AJvYcCWynFoD9EibWJRZ2MNxYUt75nej1Mm53fGoQzwdmps/05irnswAvGe7/uHenQQtFDXDiULsL8tqhWMktg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0VEPr1XOz5U/QFCsnhzZ+lbuhBmwrnqI7wChN4GJj22yQY8wC
	nF+KtptuIxEk8uivWnzXb3NHprEqR5fmqmoyf7Xl2n/jrXs71fW0SfMf
X-Gm-Gg: ATEYQzyi0TqOqF+honmfouIME5zRZMu/dl5dFk54/S7nl3Lac6QB6zipYFO14UO2ovC
	M0ewILq4KTLcUrabEj5hAs4GEIXaH20n2P1zpQsKoq6QH8JnQjVESD+1M0hdkE29T3QPVXLbn8y
	1f3AMRxF5IUlI2KLOsiQl5Vp2TKM1Rs17AeS6TlTvQOKeAe3pErew5PG+O8l020lVsswgynuOoy
	NfFuykJZUKF7ZFbuUlxh32HCRkqOMfhHtD+fD24s13lmRqnVWK3QsPn6crZGv+PMTXi4F4LA9Cy
	UIZ5DvbWO1yUmcVOkOoD/78RCB6tJUHJYXdQLwe3H6YgH+632Ol4GONrg28Rx9X9iYPHUqI97q5
	/nJqEKc4bq0eopkvNqU34NGnexj+qbcEerTyxrdcUyEYxZG/S11xdPz2HY7CLiNegL+j3mpnia9
	kefF7iZo4KeQuK7RTJawm/Jw==
X-Received: by 2002:a17:903:1b6b:b0:2aa:e817:1bd4 with SMTP id d9443c01a7336-2ae2e4b12cfmr20205135ad.37.1772179072569;
        Thu, 26 Feb 2026 23:57:52 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm47358095ad.46.2026.02.26.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:52 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v5 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Fri, 27 Feb 2026 15:57:16 +0800
Message-ID: <20260227075718.2243818-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_235753_612447_0DCF8AF1 
X-CRM114-Status: UNSURE (   9.26  )
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
