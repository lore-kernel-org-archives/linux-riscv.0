Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342BCD73EB4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 02:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnNGwYec7ogz/bXFO6q7oRCpgmd9dEXJbS3/0r6dppI=; b=TLW3tFhVvkTGJT
	Vpaxii3RYNDt3VkcOrTTZDq+tO2EbNIPYMrsRvN0EFUsc1ZdtL7tnWZwSbTovZUeddMog/jWwkEV+
	kklX9yDDSZEYcb0Tj/FLZPfz7QGkh5Xa3Nv+hqGQyDHL4+e/RFQjHarkK9ZNBbCn+pt4BDETL8Rc0
	taFVxpy+Ayw46yAsMqGAdWeJzXLsxdil9kE6iyj7sY8mhV3xwKDW1HTVjJSHKhhVW0w51Kzzx3inf
	hd9ZWevKzUW397PxM/ZrVWQWSMbjkpdWODCtok6kHx6BI3LHcgpeCm+TlWjqeZ5kpOa/mwYdgMBzS
	uiNxsl/TCA+cHp+oYHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleET-00000000tf1-00rA;
	Fri, 30 Jan 2026 02:27:37 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleEQ-00000000teI-2Svk
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 02:27:36 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b7c5db431cso995496eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 18:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769740053; x=1770344853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=LhT+KhlZ7jjSvIZE02ljlg3+qVbSiihHV92wSS+7YZ2Ji3uIkqXIeGtzMGRjqRT6Ee
         c8viBs5iEsxcyQS7mjy5L+4/b4Qqn5V4kzMF+J87hm696/9a0TxNhgJ89jbzK0bTn895
         as0I2oc0QjrrIkW2f7O5b3RBVVoTy1doqeHUDPf7XfS1DJ4mZvQzdQW7McY1ICxVhfLe
         bbNzJNIDNNtMqT02DlZjRiKGlfPzaxNMFU/cdYkyZQYlr43WvAYIVTQnssgF2cmjjLmf
         PAOHrEmlBrEKDLhbNjBw0ZUrxM0NX6h7jeCD7cSGz9YZrHCs0UJgZofm6hEGCLxg4/4L
         XGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740053; x=1770344853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=AMJyUMPvvWvkkSEzfNs2CTmy+jX1euaII9DtI562GLPZQTEAUSLx33dOA8jwtMOaA4
         WTPK2dMlDzfimdIdhKa99Vou84liS+A1dWgA/qGadTIoTQD1V7Ket3Uo/TunySz7918k
         D7F98OtjHR124tW2UoxDcjXbrhFaKGlQi07+9n+4oqePSWFrXbi0LveTCOfibiiN7shw
         FhIz2R4PKRcxslBTu9i0uNG8u+SY+cWb68+Q0WpXjlTd9qdadhXz1hS2ag28hP48Lwtg
         8bHKjU3Lnl3ZcQwNBhPKI9NEsQiVgDUFs1SZhQP0Pmm7IJjpx0OmjGJIdJby9OUgJyCP
         hc9g==
X-Forwarded-Encrypted: i=1; AJvYcCWih5EHZObM/R60TWvFkJ6WlrNFFsUIlP5cOFK+o/2VjHG/+8rBre6PA39/B8wHruBpi7fXTsybAenZiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmoYwiewyOa5RueH8AnKoJB8kE1xC6ddMlG1JFzm3JdfCuMnvL
	/NGtG1Y2kZ8FoweUzehS0aiSH4QZc7pj5Qbr566rA9tznxz4wmvbVD4l
X-Gm-Gg: AZuq6aJldT8fA+NBQdFVL0+pM9DoH7j5DkHUuPuWh2YclC3p0XRLceeI9Nbcz/wUM8g
	bn454+ix9maeoI/W7cT03/hQzbtHO6mcVC34dOAP6Z2pwYAJYaO9lgNFRXX4LTaHD3gRO0sobeq
	2xzl/KY2fd62dstQMMSzPQeBj/Cz9Pt8N1v9FN+AqDL+mrLBbkcW/M88Cm8KxE92rRjIiAVsmJf
	HN/swJX/5fXvDEH+gAY+CvcVY0wiNBRQOvHeOqPZGvm74sBZIDbHrRExAabmegtpgZ5jv0n/S/E
	uV/KJrZyfs4v8JBYvC0Rwki0mxvPleH6ac+x9BTyJNFGH114OrVGjB0bqZ4xoyNpO6i97yUGsWW
	zBw/jP+tIiaNqSs9r/JIDvAIgBT4nGHVWzPzRoVA9awf2OxQSouMgKbW0NIqZd0LlfwRrKTSfej
	NMZTxTeFlJ/A==
X-Received: by 2002:a05:7301:3e18:b0:2b7:4118:88aa with SMTP id 5a478bee46e88-2b7c890c90emr706190eec.35.1769740053090;
        Thu, 29 Jan 2026 18:27:33 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm9365628eec.6.2026.01.29.18.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:32 -0800 (PST)
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
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v4 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Fri, 30 Jan 2026 10:27:03 +0800
Message-ID: <20260130022705.1059214-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_182734_666193_3F8D6192 
X-CRM114-Status: UNSURE (   9.25  )
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
