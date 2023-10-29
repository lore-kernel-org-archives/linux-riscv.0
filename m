Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA36C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 04:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGej5ON0T0SAUaSlkRrBKmqqF6meiOAA9A1xR2dOttU=; b=0GT1EmevYj55nA
	osMNPnZ8V9zV1higmd/zNYlDbskyjHnJKjzpr9Wuz65egTkLcghaCzmWZdSmspmFFk0Sqp67q6Zxt
	VQqZ2FkYkCvyHFM7/UlZvyMc2ZiUvHA6CwdBR2fMeypwrFibJWuD1VByO/Zcjk+kDap3gLOsdumg3
	w4vdWwmwr4PybtetQvt2XEfqMIq1Fcg0dmhvsI1w3q8hOiQBP9CoRS1pXMnSyG6t089VGk5Uz7eHn
	iXJp65/G++jWnbhf/CGRYnlJSnsXizVkb//uZp9xd4vke+Qb97ih7p2Lp1kOq4YEJo3ShBahrvB7m
	4klxX0uyBnm2vWpe1mJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOk-0018zc-2T;
	Sun, 29 Oct 2023 04:27:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxOX-0018tl-2k;
	Sun, 29 Oct 2023 04:27:27 +0000
Received: from localhost (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 87BFD6607340;
	Sun, 29 Oct 2023 04:27:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698553643;
	bh=4Ac1sglox319ZVY8QnDJ6GHvVijM8j/9ar97NnhyoHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9RmiofbNDogf+uRfHtS+0K95TOVfmqAfkEvxWAwnE/dhAKhpBy0KtWzjSQXD1w2u
	 foLopAjd7AESsMpHFRXmsiPu2JZ4DcYMLZ+ituDeDEuH3kJKchUVaKIg/YtjwgxTH/
	 +2477CasfBUls5EIXnwVF5u20RDEVMS+kq8HZbYzTNqiVLjvXMSbhIk1DYpt4k7C9i
	 Cjlbu6okC4jp5dRj0OGQpLvRZo8HQTx3yH+VHlIiIs8VypO8W10n1/vYNqne8iEVVL
	 aboZIrf6qfiqONkhYZVqypqVm0R5IgG53qO9JW8iAzmG2yY6phGyaX8YVja9l3JzbD
	 lcQpNxLbad60w==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 02/12] dt-bindings: net: starfive,jh7110-dwmac: Drop superfluous select
Date: Sun, 29 Oct 2023 06:27:02 +0200
Message-ID: <20231029042712.520010-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_212726_016101_5AD024C5 
X-CRM114-Status: UNSURE (   7.47  )
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

The usage of 'select' doesn't seem to have any influence on how this
binding schema is applied to the nodes, hence remove it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/net/starfive,jh7110-dwmac.yaml   | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 5e7cfbbebce6..cc3e1c6fc135 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -11,15 +11,6 @@ maintainers:
   - Emil Renner Berthing <kernel@esmil.dk>
   - Samin Guo <samin.guo@starfivetech.com>
 
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - starfive,jh7110-dwmac
-  required:
-    - compatible
-
 properties:
   compatible:
     items:
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
