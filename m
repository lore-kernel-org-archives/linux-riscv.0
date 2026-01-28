Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF70D35662
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnNGwYec7ogz/bXFO6q7oRCpgmd9dEXJbS3/0r6dppI=; b=LRIFTYP/QN95eA
	fPsCTOfpdcn6/46WaRTt/SNW6jaN5wpxk87BOBVBeQFjNJtYJaJQi9dK1garNURPjua73DG5MvAY6
	MbyGvUDth/HNSsUPt1IRbte3RjXuNPI03v5PM4ie1rcERlLpNOdvvb/gKlKukOvtM1Cx6sAisgfkl
	B6/9NBG1HHn1CGNB3hacE/C/d050WvyObz2CE9zX5oSBQIPlaTcljPHaiEmZkmhYzm22XEDlgwic9
	Snj1orgt2sqOSZyS9R8JNKjyUCwvCdibcT23v4Mvm3TFhzGsIi42ou4a6pCftNFqAIv1fsy2WkMy3
	J9OEr8DaN7JNCxkFQw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl003-0000000Fa8o-3wOf;
	Wed, 28 Jan 2026 07:30:03 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl001-0000000Fa7v-24RL
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 07:30:02 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so7012422eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769585400; x=1770190200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=JAEkgcWdbkoGJGL3E7igzZ0i8BRMHvMTjIoegVL0+VGVq3S+zDzeSLZ9kci1cDOFPU
         Z1PDvl4o1LTBzDMDQiXnpc74sDU2lTTG9hvNTGK6/GqE9NOpnSaY/fSByUi5Y8H5+YHF
         qjffIOECEL8JBD51kqSzsdB5Wjgdq4viNKDVbh+5Si7VRUl6hFzva48Z9whaLcvPASsv
         Ije+OwdSFhgzCJJ2AKC2JmjWVcl9N6z2f/+ikjvxul+fixsm/YfF1SsdubcMYBtmFVTF
         4rn7j+YnLFT3w+ITZRWBLMBL8lhc0q0H0au9NetE5X4l0uBkPxQT3Thp0DQcwksziCzK
         BdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769585400; x=1770190200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=KYuDRKkUpbTZD01PtNm0uIFR2tBYOCju79S0c/dHTxYT/8z13OHGYgp67zA+R4UtNc
         TlPrmM56GVRF38eDm/bBU7obIvl8w0+ubjLOnvhj7kOoF6qN2PXmjcBrP9sQwSBBgfAZ
         aXFdWx3qHnk0vGCke5kxIh57Rk2bSOfcg9Y0erR/URm9FaMelVpWDBxXkl1eiz2YH/WN
         cDHzx+MyFYw8zy4b28PsS8a6J+7PWXeZUBY+fvfQcQ/L/PGnNud1m/JAritGItm4hxir
         rO28gt/Dt0KbDwqaoCdw3Xj68KRpsvBCZiuHkhmgLkdaWZcxUIH6s+2Usz42DQhs0fy2
         VzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIHFA/uHd5Wb1iHGkmt67SOI/E/x4bU1LF+RYDRwy+RpW9FD4TJAKnImWKMW33u+i5yoRW+PGpsl3+bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwODbUOOqlYwOWEpS8EnREGI2TczzJgyLMw306j3eXp4B6Z+keF
	y+91wvWHYpIdcQwr05DuXd5aDygNj3hnyU3OGmbOK22g8M37fnqa3QEZ
X-Gm-Gg: AZuq6aL2QfUwCEOPNxT3OuSt3nv6eOkmVvHXAmOd+56xGlwv0ZSRXcC5N8ctcsxFi11
	W0acEfBeiDBf64AXmJX7cBrqJmFu7GPkbJTk5MMh8R8t8cpDonFUa4mtw2RJVObqpgMp0DXi11X
	eXSRqD4GlrjpsdfiecQDi9/4pE5zP9VRcrIAlEg8q3HysEXKyyKw+l4dVyFIFDjQuoWTA0phHCY
	5aAzS/w0jnxH8ri+Fjy7PlWvInSlpmM2Np3jP6f3GiMY3p6+0z/2UUKLXdusyie6lSAXhI9Nr6a
	jGh3CvbBY8f1PQelyljpj615DaNbV+mFdDXoiJdsXAjD+zbA+KCBvk1rQpiFXt74uyn0nsp5hsW
	f4qPcIAPG51TKyc6FUp9nbRHch9Zh2S0MEefZnx8xc8g9oBiXk2OXHKQ/RMib7kFuV49e6x+7xw
	c8q8DsmfVTEsPj2SeEjxlH
X-Received: by 2002:a05:7300:cc0e:b0:2ae:60f7:7f42 with SMTP id 5a478bee46e88-2b78d8df584mr2785650eec.11.1769585399859;
        Tue, 27 Jan 2026 23:29:59 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add66fsm1479966eec.28.2026.01.27.23.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed, 28 Jan 2026 15:29:28 +0800
Message-ID: <20260128072931.875041-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_233001_569342_A2DEC11D 
X-CRM114-Status: UNSURE (   9.44  )
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
index 8979a50b5507..54c7b1537ab9 100644
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
