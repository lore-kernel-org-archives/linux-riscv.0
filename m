Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FD5EB364A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 01:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkUKJpunOoU/e+m9nz7fyF5VsDefakWozLeeceAs6hE=; b=nT9PIwhT7YzNEa
	R4fti8ucTNw4PhGIu80Etun399P1niv4rCSFfIYsGV9voDyM67HTWoRCTfyx82IBDlbkcrSfi/FtT
	OeanNQUsXh8UkzrtUWq+MsN0pHoClRTS+rdQQyAioR7tHn0JiEmDrJ7SK59v3xZUP6ltuDlU3zZ7V
	8T2Uzunyjo4M5D4gaHxQOAGIfIUbal58nfSXwqTrkE3Qskt/85OvkoEg0OpXEDeEAfJWc5yJbEx/B
	KEUe8BJQ9K+eJ1iEXFs76aXWX7GMGj4uTeTl8T+8Er45M8cQ58n8dXzLtK6K7C53vlGfH95Ier21m
	u2/vNr5dGl3LCZvNYYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEH-0000000EJ6z-2hCa;
	Tue, 03 Mar 2026 01:07:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEF-0000000EJ58-0wL6
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 01:07:16 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82735a41920so1944467b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500034; x=1773104834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=ChEMjfzLNPQNjoZi3Mu89LlpYV146lcwdZ+Nk8FvEzjyTe33fqQFO71bjvQQ0jlkAL
         MPUmxpIYfDl+8y2cuAXIqqe+JYR04ovLF2qAPwkVbo7AxLN79N36uhgIqeDho0okRf41
         2yOa/Hyw0dVvh7HYOlRNPgylutfS4lfwoYOLjUhkIuYG7eYUR+hhDO6zODw/RKgMKXPk
         YVlHJyiNu3h4DaVGR6It5YUv5uT9yFnDOhYiPOF5CJid+FaYkutrY1e8NlKF3IEfwAhe
         rtTCyB0XUueKL5mkO06uQILvb08KjZ00FOjXE9nTEjVOih77yb446dJwA46pKN0GmHWG
         UX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500034; x=1773104834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=SqUfuGplWTIyJhaSiET+SnCWwZVX+3a+OT/8R1olSdwP4b/WFU4fZ9MkqQSb+cdPM6
         BSUWZW1HBaxpBMUbbvT59oc7eyKpsQARpaVMtx9cCS6YOnShXPyqZafs59vaBHohXFpS
         apcthz+wSsKSae4QfcbgciHx+a3A/L+7QLqyBIXzdii2+mi2OLG+LG5ayIiZAkQSy6PX
         C56lpa3fHvqchbSdr8G+zmM8LC0P1NT7HVj0P4BDjfKXoY4dWALeRALBidxvyc+JDv4Y
         zuM4tfIKnD79nC2ragagFDhUB7idGb8zFbxq+wvp9oSTdPOhGnu8VBdg+vBI3cSX2UhQ
         Ae5g==
X-Forwarded-Encrypted: i=1; AJvYcCUTF/RTPHmxuiJNX3SgE0gx9x2H7qzbXAQw8vlrMa/NdwH2ojOd6dZJsQZ/f32GPXqvm/XpQEzyo1qsIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznjZwzTNm4OWAZqTqg/x1W1qLW1XgPpsn2V0gRveLla7LpEp9w
	Nc0auFTNBEuKo+Fi7mh/IkSzUUQjUB8GkHtCVBgg17I7U2SiVdti6PUA
X-Gm-Gg: ATEYQzxXHy3az4INNvkLUAUa7vT4cIZudBI+G1N287T1bPTZ0S7UsHVnufIgTlVZX4L
	MWD+FuEqBZ4kuIQ1Hyend/REvf9V9VEN1SPWWyooUu5XCN1q4rUlrbykX2rKfyJnIRGiKrRceEi
	C/3zHnpWHbvAI+wlrcvHVPyihtDk8g9ng0Ychu2obeNvyOr8zxnU3y3WppgDXx0Atua+8k4T46V
	5M2syCVJvMuqG5vAjpAKcfvjXHClW/gavVEDmhVPJbPh4j+EHttihzZP088i3RX33yQMrfa0C61
	Xcc+Sl+8vpgxqeHJCwLgrADgK98zd4ScneTKX6rMJO+dn8vZC9m2KT0mC8JrI059lvxKrpMh6rP
	D4OxexUjhchGYMwuLNeqhODdRsfts8RuY8MGwfmmQXJMyzJkYJrECt2AHOHv/72SGnxNAqF2mGY
	a71V3bfXWU+9YiU8wIDt6JYQ==
X-Received: by 2002:a05:6a21:170b:b0:35f:b243:46cb with SMTP id adf61e73a8af0-395c3a1a5f3mr14011142637.12.1772500034381;
        Mon, 02 Mar 2026 17:07:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ef857sm12435059a12.7.2026.03.02.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:14 -0800 (PST)
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
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Tue,  3 Mar 2026 09:06:28 +0800
Message-ID: <20260303010630.567674-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303010630.567674-1-inochiama@gmail.com>
References: <20260303010630.567674-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170715_266904_14B72D2C 
X-CRM114-Status: UNSURE (   9.74  )
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
