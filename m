Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF60ED262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnNGwYec7ogz/bXFO6q7oRCpgmd9dEXJbS3/0r6dppI=; b=hquukzONtx3gYR
	lL5kbBExy7f3vI2H2sKiXsIsDjEfBY4+f29Ch5Uyo7HmBCQ+vNNa/4HLaWv5/A0iFqOiZXc3Dzz4x
	S1IGvALVZVmhyh/FaBvCINp3Zwp/DWEap6k4h/JoCMBHw/0kQeMNbJNj1EdcQF7Hnxln9NWW0OM9D
	3V1IM3TXZadzg6FgWA26l3ghrtReVi1yJX64pZ0yu8U12pMqjs6ksjcF+/88eMwmD9+35eNMELGnr
	pe+s8jfi8C36GKeespfkTeloSbPlOawDHNB1ZuimzZCBQ3ZoWv+LXjuxNyF+GV14UFyv2ItJuRAIZ
	hTpsS30SeQuKkryjqkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPN-00000004zpN-2DqD;
	Wed, 21 Jan 2026 07:13:41 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSPK-00000004zoo-1oNa
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 07:13:40 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1233702afd3so8007352c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 23:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979617; x=1769584417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=TqHLZQS2M/beZx6v+QITqkN0QEbg6dHNokFuHRiXtGzX6avbIERObTyGIfPonItCWI
         hJp4ZzoqJev4ORyYt006OESp35SzEg19ksvbtty90vXNfnh3lVVjoCU20AEW2xmdFAAF
         cQCyLaDftKoQ5Mb1VpWHSVXEuWQLiv1V0aUYbXu4EoGHUnCl7wBzlAvGAX3nfEoNozz/
         bbkla+pruc3Ydj4TTPIWUgQnT1czCzu0TPgbLci8s3tpexznw4eB8x146CrBff1rC2Mp
         t+lQLe0axYSkqh7qyWTP1F1GyMOnmfm98ptC6a4JyJt6hD9MiZ7tQeyy8iUtXgL16+G9
         SVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979617; x=1769584417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=nnsMqqOlsVIBRKQtiurZ9rFj8BftratkKkzg8I6bSQFhOJ7ccsHQ6GVwmKmQxEtkld
         tJg7EDydMdTYvXU0zQg9PKqlLNY6Vqmy8Gvm6trSnHI2y55tNWxGqHoqt0cWcUiiZXK9
         46jikN6oPzT6cgZHLWVBhNvG3x7aLbn2JJbOxsfAdeGdNy+ButZPLB+lYjpIlel6wJ/9
         utTs4+ACJybggAVrP7cliVIMPrA5VIASFm816EvM0jGJmLeC5P0ROvznBNmWq/RQfXa+
         5G6VUzBCbBJCdkZoEjs9qrskiw3QA2VqzxZIlE24CpRHwqRKjRkLkHkC0RptAoVQhhpL
         dPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT/xdvL/EPZuOJBthvZXG5Hqlx1VqSbfKsNBeufkB+mJUAysMpd2SfaI6cK2W0ESARAvDVgdI7tnATGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeV7dKg4j2lhafha65mhhmY6FwgkQiqQt9d1AAhzUN9vL2XEWl
	3A/DBMukF7zRmdT8TA2jZEfmXSLJKpNaXXMrwBy6mE2oT8c+DljuzQPB
X-Gm-Gg: AZuq6aJgzINByGQG5MVT33V7SEphIdNargfGyRUuvpmHoWGhx8ZlQBogJgEt/s7AxZR
	jBHXW3hPNfc5W6cLH8Zqx51Z8L+cmg1saOd4lCY25lxA7QrJr0LeRf8dYqsvcngkaZjZS5N9CmB
	51iZ96yMBe6z34uZ1KzNwFn1s8E/p8Q3aAG7cdpO2n0t2PhBcMNN0xT61KXAuK0kqnIh3AAAwnc
	b2E8fnUqrA/arrDjm51EIg+2DTW5PVmKMXJVb8aCxvOfI09lKW5qof8InGUB4khFLPx7YaoG44O
	ihQMH99kRHquxJmbWzGrRdMlF58KWF8p7TROA0o2zNmi4X4Zt4nHb8/3iqVTTS77lhpOnuX/+o1
	6FtPQR7ocqYes7jnoCswN8GqOBM499HafPvkTawYy/rFcM1ukxAaLk6BoTtcRfUSsrMcW5NQI5v
	5WVWN7AAwdJw==
X-Received: by 2002:a05:7022:914:b0:11b:a514:b64f with SMTP id a92af1059eb24-1246a966afdmr2812178c88.13.1768979616484;
        Tue, 20 Jan 2026 23:13:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm22387219eec.32.2026.01.20.23.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:13:36 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v2 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed, 21 Jan 2026 15:13:10 +0800
Message-ID: <20260121071315.940130-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_231338_491464_F42F4848 
X-CRM114-Status: UNSURE (   9.91  )
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
