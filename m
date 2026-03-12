Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B05103E2F0
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyqUFCsf/ZbF8orvENhaN3m/xXHAH3K7qGIoCv1m2J0=; b=4wJNhJ6Q3uEef/
	KhhjPNUrft89iZuccFDXWborrcI91bfYvySrLgsEtNhYQ2gxgRyL3q75pcuhSKwfxsKT4Hdkfl4AS
	FKe9QlChEZJcd154N31aCRgFtHtwwmRdkLAVmudDjUC9yRNwNXhKcYCxUYZYzVsYz/vEW5SRwW3ui
	NwrmMO26TDIACGO4uhOw86osl0gwN6wVtTk82IVUIp/J8lNk6pxPcZrhV0QMJvhDhiKUqN9Swr4pX
	0Q9EDr93kOna919qo42Eu3fOR0q+75RnDoEaIaLkS8sW2dK6jSZwPVvanE2lU5CNdoykiKIZtm4VJ
	cqXQFRB3NX77bRLLARVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Um2-0000000CzzI-3Ph9;
	Thu, 12 Mar 2026 01:23:38 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulz-0000000CzvH-12I0
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:37 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-89a05955720so6475716d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278614; x=1773883414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=mqwCybnOQDdrfyQp8pBbHFoAQXK8aEEDx5MXR2W2BCb7R1K0/6Pv6XUAqBYXsgcs8z
         Okel74IvadmaNG364Lc2wujbFbUQv2QRMEWHcpLcvwl4/PAR+yeGPXV0hGmq6dFRUcqW
         iXx5DAJ82Bu/X+uYUkXGHw0tQ0lCwKsDhGbQ1Ca6xSmWqClTokq/v/psGBv1WmtTcJOW
         G9MPD9eeELBO216UMTBSCWs47L78Ib/O2wcfTwAF/Cq97bBDLjxNJ5LdUUQMs/hRpJcV
         R3pfO/jRsBQsHsOaLlvnAKSzcZu1LL1urNBGdlYfVBa8sEBc5pnJpvs84GCQPmSZIDPV
         IFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278614; x=1773883414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=ZSVYyZIng289stzCRHia9v+NdkKNRURbNeAhJXFYYKQb4o0MKaAxLvd/shZciDwzo6
         ZqMR90HziRNFdrkEnm32YltCeZmFFZKmIXcPllSs35wFYVAjMjh3YInr0Vz7B9kMU2eB
         /nem78X8rNLEfmOJFzWWek7UCJthwpdJu9K+ydgpuwy3ZeONYU8D5UFneH2ElLGDEW3Z
         dATlqiPq8Bug2Zzqf+ErHCHfXoJk4wmOeGpCx9B+ZS5UJXYGNHDhOu+9VeIJ+dljkKN7
         UVHCwkRBxV5IsUrgL2fzt6NkaWVVZ+6XdJkoB6TNd+bsORpX+ZOrEL73bK/IjlRYp7lQ
         e+3w==
X-Forwarded-Encrypted: i=1; AJvYcCXGyFX6hfxXdu/Qf56CN/LJfRgUEvgirZoIBbhJ4P5U03OlgN8i8W1zDZvGDi+BBP15X+6RxO4m4154bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9uEhOcYdaxJEMpcqqFcgYlXYr9/4djfXSHb2IHzcL8n4RanRu
	OVhnYsLrfki8T35dw7Zhz1sFBCK3q1r+RfnfhxdmTiYekX5Q4fXG96aF
X-Gm-Gg: ATEYQzxvy1vlf3Y9q2OkI7pzSPTTDFdumv64O1ZG2CO+pOgYnrSOJQIsmKKehpDBSFO
	e3HWKfOJCvV+9CSY/6JR2qWN1ZSsOubJXLNBgDLa43YdwspU2887dy0Dx2AEa6Tl2Ch9HZd1PHk
	FieRs3IzxahcBabtQ8RA+W6gyQx8LQc9tWs9xqQ8NdHqhUCWfzCYUDPalbZQ7XMX6MxVEWR2i1M
	3kSM74BeWVsTxszbKL4AiAE1JZy0qahswH8GRA33ZBaPjpHTGKmf6lzBU5B7LPowLileJj+tEAs
	hOqCoB2Z//ef/lhuja7vX9iOWm+6YES7m/BYntMub7Exty8tZFHDu/3R0Nqs3dignUMvZnlLvbr
	AWcc16DrdvYS4kHrdnSuE58imTiTJbVY3xJPuGeyTMcJWjo1+k0MALr6kjfu0Hy/pvCnhLw8dxO
	ktShGJ/Nm7RzV+1QTWdP7VfoiJjqPDu35HBg==
X-Received: by 2002:a05:6214:2305:b0:89a:717:1e48 with SMTP id 6a1803df08f44-89a66ae1ce8mr61425926d6.58.1773278613817;
        Wed, 11 Mar 2026 18:23:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb4b3sm25165286d6.14.2026.03.11.18.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:33 -0700 (PDT)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
Date: Thu, 12 Mar 2026 09:22:26 +0800
Message-ID: <20260312012232.373713-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182335_318592_D0BBB0CD 
X-CRM114-Status: UNSURE (   8.81  )
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

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
