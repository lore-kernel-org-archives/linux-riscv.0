Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D08F30299
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIuk52pqHmd2Vg4JOSB03GxPNxy4S+YChED2HV8C7mc=; b=uWqwdGxLnaH9En
	6uRNcgJr7/OhM0pv7tx9IdT5D8JCC4T3tHFxCQO6CZoRHTUFydSf/tFGfjmvsI3vNClwAx95+5nvx
	hF5MUdS3AuHcTzzgCJ9+dWc1YP4x9Xg3yqYdk2UvRxRiqSrM28fkM10/bEzT9iE00zboymE8+9zD8
	B7yYlWuCzpRzaTLs2QJi6QsP93+1vN9Lzwtb6JDPdSVQqq5OXG5XXknnT7njAQEp2tpyBsur9+A9B
	wZbTQBThP4pS1mJoThWHAGZxoj4+ywF6m3cAsCKEDADzDo+D+yzk6YCeXIHFkJNoTkjwXxolfuPvS
	hf7Fm9tFe4iBE5AVtvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKi-000000033vn-1E0w;
	Mon, 16 Mar 2026 01:01:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKS-000000033qM-1xUR
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ae5636ab04so45062635ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622868; x=1774227668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=StWovg+q8KzraaaXWp89k3z4uIxWpIEQN51TBifyEaEZFT70m/MavH1Z3hGoAWGhLr
         +jfxx3I4Aphvde/STEULC82le3gzGuiBVkOL1akkkOmGUUoV8tWIFxQQScYph0b7Fuc7
         R+1smO4sYKwbAlvvDOVz7gPlxSmpjbC2noHkn3iB/BmnfFGagQhBwndB3+ya8WRDqTs0
         AkatrfPzPR/QJ2WY6QeeXeR26ct0qYmUi1O5NxK1mGkkKkkPRsneQeqlfjVqY/5Ojhub
         SHe8UhEWxNaxmtfbhPdERrZH7etI15GE5HqEbBftGj4hnSo2wT5Q6ZtELyPIgQhMstJd
         iWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622868; x=1774227668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=sVsUbs1sya8OMuzqi7ihWCYikWd98NB50NGb7/Z80IxhQ16sS8Mr2azKCOHeP35pUT
         D/pT+36sZOUFHRvdT4FawqIuKjGG6VUHzB7BWuvHdneaSY7JegD92lsSAxg0atPuC958
         NknhQzJCjVyJ0oSo5tyahFXXVtPKQx0eM1zw8eny1CohzUQbqo/E/GI3bAhEjk5Fk8yJ
         NitpqKqcPLqI5G0RVQZxhLW7y+roC7QaRHTOFvXCU2ofuF5BByfbFDt7faJHVGO8MDz2
         HJGHDZrMWMdRseEooyn743pbOlhBbbvGucueW7mi1RJtzE36tI6ZQSYjggIAnIITCmj+
         P1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHohvVNsjI5Wcd4Tjcd0O5in7OC3zF5cQnbrl7y15VG1EVXfHX3/PZtAn1Q0ZBhEbUSIaQyfnDeoDG5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxnkOianFN4ba5BoehtHw52ayEMZ0zPHIFYC3Xa+Q/wmBqDCfj
	qcMUYOB1cthb3an2WSP8tyq2x8Tsq5Z/fa8+Qom3YJ6eMrk//Eb6FzVyVNC0xA==
X-Gm-Gg: ATEYQzw215OnL7uqw89mx3bdTf09YdqwOdqpOoTe7IG9/VyOhjaAMGtq8yRuIO0HtRh
	Qr8raqJHBVe0DlDPR7hL9jduB5nnNWJMC6TR4danKtQI7liMXiyBifOWPuTYmhBhOEpOlkK+1cy
	bS0RUs40FBKpUdMl3C5WnwJTzqw60NQFMaP0sa5roysr2P5zQnk+rjMUXPT/cIA72AAmiIz1ufT
	Kir+cZ3BbavtbI//IqHbSTgRxXPA9is7XOWYhhGu1thQyRXxAE2yVU4WCY0j2U2gQ822QP/FaGN
	Y5kjRs9hE9ejm0EV/TJk04SMZrdv9CJXiN5e8YCTUDPpONXGCTZxCQjevcU/kDa33k+IprR5gri
	uHRBMOweyivhFXx82l7gfUvrhPy0HjxV03YEHbx6YOrmahPvrTjxbdPcBwZFw3hoxNRzePLaNj3
	QfQ0q1PsJORYaO2InozPwlTbqAkohUJJu5zQ==
X-Received: by 2002:a17:903:b8f:b0:2ae:4fc7:8053 with SMTP id d9443c01a7336-2aecac6c131mr104368395ad.46.1773622867648;
        Sun, 15 Mar 2026 18:01:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece839dffsm89559855ad.78.2026.03.15.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v10 2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Mon, 16 Mar 2026 09:00:38 +0800
Message-ID: <20260316010041.164360-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180108_745050_550F0773 
X-CRM114-Status: UNSURE (   8.85  )
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
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
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
