Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44BBFEFB6B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkUKJpunOoU/e+m9nz7fyF5VsDefakWozLeeceAs6hE=; b=XJ/lVHZhvYZ0Qi
	0YvBG/TJ27twDTpa0wuK7OtDVvUOGr5/BRR4tu9tItxRPwYTSxj9Rb3jP4A33rLykUjK0LSo7MzfH
	peoicmHhEbM/wkAFsQbbnBIySO21ekUlitHdViiE3oYr8lJSxzLetT/C5id1RPtQ7iTiDQqkKlHTe
	R9UWyEr3vUqHF/879FpbF+oxCELPALjoF4mBdV7TmlnrM5sSehoW0IJFIS3FMjOAdBqSYhh7sSRs6
	fDJuLazMNobrBQeGD9uU2CE4Tb9d4tzMe8EkW+4jivXG89ras9qPcdRbKTOAU89yU4h3If8xusUZk
	fU2VizHb3c52DEQOe70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhH1-0000000Ggw1-0KSc;
	Wed, 04 Mar 2026 08:08:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGy-0000000Ggsl-0hE6
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:08:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-827336c0994so3865140b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611679; x=1773216479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=ZYg7XmWJOYt2r+2kD3c85HKWA+rfhH9t6FWQle9yzijek/iOUjrlUzxwp/8I6z7jz5
         hgTHisf3THH1RPCdGb9a9bl72lK7CuguU7vjfyCoIbHI03vz1eCK79kxw536nvp/dg9k
         IghzNBYuDgbw/k9zxE3OzMwm75TMDQ7QltaT4qBn7EST2QYpYmYU80QJPj/hs8Iuftbq
         mpYmufsdPn/iVMnU00l7kjj1El/Ywkod7mtqzXuMUcVFd9pL8S6yyUxUt8gmWkXktPbO
         uUwV+MagfbkIYZZzcllLiNZ+m380C/C3Afr9jq02s3AIgzKu0VWhPog1s7hGqhtrctZB
         iMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611679; x=1773216479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=UEEsGO/SE2PasUnlRm0Xbci94Icu8R8HJ8CgaOCHFn+oqww6rThoPHHXOrGAkT6LDN
         mMyyjinOToSCCp78TVPVyuuBwG2fZe7+Knv+VKAubhoVLeInEXTe0vXfldvHgCM92pHA
         k7XRrUiAxIppZNyH9FB22yBnICso+0nDbY1SjlPzTYoDsTTyZz4myALDfAmGz5kwLsaa
         XXbwjxdnbkTEVg0ufxPHPcCv77QXPcRSr+SbqoW+/IsmZvB69irxq0uDKCjlDHe0dr6X
         gnoYVo4CDDcx3bocYArMCHBeVCzxuWGZgv3zBoKwgSo81hFoK1tUPLqBw6iJJy2S6KK0
         fblw==
X-Forwarded-Encrypted: i=1; AJvYcCWBgnzmbfXZwq16ULa8bFnGqT2FueV4A2sMUlNekDRCfuDJpqzOvJ9V//KCnyM44XKw3jImJGmCSWDLGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcEcf/dgUTwV3Tf+4NSxXiHX1nD9NtQ1Bu1QEzs9cZhi7xt+Ug
	C+dTBvloqTayBJSDc6jqZU3DPWFtaWOvOKFwEX1ya+UuQxluVjy5hkJf
X-Gm-Gg: ATEYQzxPmXgnRdlFN/6c/n2ipNpPdfXmYs0p21f64sJNBOB4VGXEGmadxobNEotjrre
	ZCDPuvcU5dQGthSq9I2rx38fkcj99yMpf96Sf9MNQ+QjfXeBUTDJybSBiybszCUYdiqgpim+oqs
	oWINglv3+HlVLPy5yhvkqR4rKoNqWSBp/VMeymewGt5P0+vvNMegmdvAVJZThQqRXPzeLnZmOsU
	9lha/qRF1l0iHn9F6cE4bvLyLO5mUki2KSLlFP9v0Ckc5V9kR00peK9E8gyAxjW5x9PKR+dZBZy
	00fgLwR7cuXWaUIqHDfqsqn/oogHnQokz5GQu55QVGwkh2asiklc+vJhnuYkAMNFGuhU3nGBfQv
	Yi+sTVEfS9mFCE0VLX6prdbTz5UK72+RxVBPYtZynbjM2Yi62uhZNy8zX2JjY66sDR07uFJGvTT
	97OfCJhwEju4L+hEXyUANtNEk=
X-Received: by 2002:a17:90b:384f:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-359a6d2687cmr1265093a91.8.1772611679144;
        Wed, 04 Mar 2026 00:07:59 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm15592172a12.3.2026.03.04.00.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:58 -0800 (PST)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v7 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed,  4 Mar 2026 16:07:19 +0800
Message-ID: <20260304080721.1658224-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-1-inochiama@gmail.com>
References: <20260304080721.1658224-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000800_217501_0462A8B2 
X-CRM114-Status: UNSURE (   9.62  )
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
