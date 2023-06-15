Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E3EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MFoW3N1p23aVmGOMXiJKxS8tOlhrd+pJDRKyD7I+xoQ=; b=NIg7AHNcrvjJAn
	EaSmNO+qiHknTwwMA8zlq+xzKjMDhsF7QcfVYUhlvUQTEdJS5GZUInb8iXsBzD1aWbnROIpPru6gt
	xW1sWYrWuy+fYOs4yYa9BHIyGA1PmhmcbmPv5T0l/dc79579zk42QDPGosd4kY55ZL2RoglXGOz5u
	coF5aXZj0Il+neInVasI7+NtCMtpJdLFWSa8YGUotEkqSKKSmGOI0h4jQna/7Kc2S5gm/v41h1kR7
	Qzj4Ix9aqAqhUwjPX+13rIm39vqU3NZE1pXhJTWR9yUbQ3MLzP8jStGBZNNguTVX6cBS/hOu+9RSg
	jfumHKdoxYCIOXnvJORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vnQ-00GHE3-1o;
	Thu, 15 Jun 2023 22:50:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vnN-00GHDZ-2f
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 22:50:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 433BA6155E;
	Thu, 15 Jun 2023 22:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8338CC433C8;
	Thu, 15 Jun 2023 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686869424;
	bh=fzU2Asm/5j3/wDRwdzkINVCgJqFep0/BSzQFxsdoEYE=;
	h=From:To:Cc:Subject:Date:From;
	b=IM5ZAoHSBGTDNGZj+jgy0CX+hcBWh5WRApPaPWqYHQlM7bkYzEOMgJfW17H5VkyfS
	 bhe9LuouJ3DcyajyGRXmRPIunsGPmqFBGZiXcqfomnV2Uxt2STUElrBkpyHkC3M2Mo
	 2zJjtknAmYeMWRZ2QetT4ymvR/LUwkcSK1IUE7O06fxPV8SSxIBljhODgf6aqIRu8A
	 aeNXtVqDi2zQgStW9XJOAM7UCrTHfVa98TGhu6u8XVEujN0CLR0teCPmfOXtOqWm5Q
	 OjtbWcOYEqBvJEMk56K9B+4ZFP/TXHC+k194v91wSOTRcDQJ+ytIdhv5weuY+6dBuY
	 jO5j1j5/22p2Q==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
Date: Thu, 15 Jun 2023 23:50:13 +0100
Message-Id: <20230615-creamer-emu-ade0fa0bdb68@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=819; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=U0b7pnBllJDo0Zb3jnuhIw49ctLfLxSxrdnlxX7wcF0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCndUxfNX6ajFd8/I0Lz7dXFcw/ZB+u9k2MUrCs+w7ZZ0 exJ4/s9HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIoRzD/5rXOeZbFu3Ucpg8 pVI4z/Jo1369lWum/5wn7HeofcIjHSGGfwbbDptxTxW5WzX9ddC39/utw5hKpDYc442/7Ry/7qn +TBYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_155025_906067_2E21A931 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Do the various bits needed to drop the additionalProperties: true that
we currently have in riscv/cpu.yaml, to permit actually enforcing what
people put in cpus nodes.

Changes in v2:
- drop patches 2 -> 5, they're now standard in dt-schema

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  dt-bindings: riscv: cpus: add a ref the common cpu schema
  dt-bindings: riscv: cpus: switch to unevaluatedProperties: false

 Documentation/devicetree/bindings/riscv/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
