Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211FBC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 22:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ddqzmudMW9nTYux04eKuoP2YusOCI5EifbJCYcuqsY=; b=5DztnDEbOCH75H
	OZXWKApt8TrEJsciGLs2VvtiZ33is4XLwsMwYvMkOLmBKgwxaE34hOfw7yErYOv8jMQW+Lmn3YjW/
	2rfTvzoKYTvBcpvja4PtgT+CfWAhkcD/dQ8pHBYljUIm6hK+9BYyT/kAFB3wRoI/IhR4X+BGvbwPe
	cVj44r5MeQZ3+LhQ8s1SmlMFJg623QcwqL7/rAUCT0aksxqJeDf0d/eWBBNjLHGQHj9RqNkQpVms3
	/CaznZekgPVVpK/6VAxp+N3T/yZBEtbaShI/3vAkDEWu7Vg/oED8yyBWBOPBxYXPdL/Vv2rD+jxCb
	TWZVCn3LDmp5hG02VADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi15z-002QqG-BK; Mon, 10 Oct 2022 22:17:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi15v-002QnY-Ac
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 22:17:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DB8ADB810F7;
	Mon, 10 Oct 2022 22:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3E7C433D6;
	Mon, 10 Oct 2022 22:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665440267;
	bh=+rG3edh1LfLu4NPjq7trYNXfBvuyzPwY6P+xNrFeCDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L033EHXtZV6pSyHazpP7QADSzwEHLQWudEGBj9EUXgHK7hKl9vKXRoQHp5scu0MeS
	 JRkHrD7pb6ADP6fpZqCRV5JpQUSKLsZK9pathld7e1y+4p0RezRKLXr9sflLuN0Qx7
	 5kISPaLQjVE6u8ovn6gIzYPZYiJzFi2VkrucxQYqZvNdgHjjWnVN3e9CbgcRxZFKpx
	 9LPzyTYoJeIBh7K6hoDrAyOlLKa71XYqKjWdZfQMxYoW/Gn5Evk1hxwUvSpSwJTdIe
	 yjOvHTxkhUI1Mm3EcgId9XHfuL+n68aYhvammZKLTO2BfDhVgEEeftWWKLWvLse44R
	 S/DzHM4LeKwJg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL 1/2] MAINTAINERS: update polarfire soc clock binding
Date: Mon, 10 Oct 2022 23:17:04 +0100
Message-Id: <20221010221704.2161221-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010221704.2161221-1-conor@kernel.org>
References: <20221010221704.2161221-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_151755_537863_E957DF61 
X-CRM114-Status: GOOD (  11.49  )
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

The clock binding has been renamed and a new binding added for the
clock controllers in the FPGA fabric. Generalise the pattern to
cover both.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dc4a769216b..94cf47ea5f80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17645,7 +17645,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-F:	Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+F:	Documentation/devicetree/bindings/clock/microchip,mpfs*.yaml
 F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
