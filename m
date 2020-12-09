Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F56C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99CB723BC7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 13:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99CB723BC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hx1yEHVZvrLbMiGDs0W8LZHdml7kOwPqKmAeFsWfP/c=; b=bFguzZx+aIf0ozt/ZARidxCFw
	xr+0TK0yOjov3ZN0VzFJEnMAchRFplBKDJGJDyV1sX+nnHtL+RvUAxRkHcbAA0Oguso8/4X6KaWkb
	CH74tpPkVO+px0JtNHqEZCrNiQCcPWqn8w120oxxMCG7FXl/ui8/eh47RBVxjPht+N8qa5ETRb4ds
	eWIjzoddBt8D3zVSVgBbYfToJDIjc/p4xqPut7UizMMXSJ+iUYpVEghYkAcmuwhtBSh1ooycMeva9
	eM4LgDiZYtzHekHzqQgV8qWZDbYHt3Sj9JJ5EbRgNzyKv2yyMxgYbirzzdJwjsXFrajyjlbHaRjfN
	t7DqFujgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmz8t-0001Yn-Vh; Wed, 09 Dec 2020 13:04:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmz8p-0001Wq-VZ
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 13:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607519063; x=1639055063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=P6cdKIf6J3Sjbkovv9YjPeCYdVmSSKRAJ4HlEMmNDCs=;
 b=p/DtoWLiKFHPlL8Pq3aE+6oqcJy5MOHm5lyZfhPG3JEr9kBI3bNV8iH8
 0o6iyWSfyr9T8cLn7hs1mgytK04EU3e/YbsoISAwyrNPcQ9X9WMOz8cv/
 jPU4Trk9fOsiugWpAhZqnwBQWPDORhiIv7nF95XuoizI2iwL3urbx1+5A
 oqzYo0hPnRtnQE/vpUW4pA2chIj+rZ6iZYaqWD2U1eJjD6xh9pqfoeQLz
 /IBERQbomnkNwHP4ZiE3uaZzEZH2lSSJSgIUxgj2ZMyBJ5unB5R7I/0Gr
 Fg2eXGwcPbBSEq/OSu35wnFeFssSNMFg6FA4GgZ0PJgzJHXQmPKPid1R3 w==;
IronPort-SDR: D85279wlbtKwsgMbnckM6EJMxob2UCJPsIBQCPI5//ojOFlbb4sQCrmNjkCCY07+E+qqJy6EUZ
 SjgOZoZ6MqsB7d6RN1X5fYMtLhCbkhOjlyXV21hfmjE1+JFu5WJgtK+0D6SwJVwhHmHbPEE/qF
 WNhzlIsztmGHXQpIUKJx7OyX5Bus+3gG2q0kKFAaBZJF7kvsyw2m415BurTRR1wNnUFC/eJGLW
 7f3xShAP/9I0SbqLTxr6NHr5pdRw7LaYyhWslmfVCNYJXhYcM8FkUIIVlPs5gbmpIoCd7XVahn
 Sdc=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="102102705"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2020 06:04:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 06:04:22 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 06:04:16 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
Subject: [PATCH v3 6/8] dt-bindings: add documentation for sama7g5 gigabit
 ethernet interface
Date: Wed, 9 Dec 2020 15:03:37 +0200
Message-ID: <1607519019-19103-7-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_080424_192524_84602DEE 
X-CRM114-Status: GOOD (  10.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 yash.shah@sifive.com, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add documentation for SAMA7G5 gigabit ethernet interface.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 Documentation/devicetree/bindings/net/macb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 26543a4e15d5..e08c5a9d53da 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -17,6 +17,7 @@ Required properties:
   Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
   Use "sifive,fu540-c000-gem" for SiFive FU540-C000 SoC.
   Use "microchip,sama7g5-emac" for Microchip SAMA7G5 ethernet interface.
+  Use "microchip,sama7g5-gem" for Microchip SAMA7G5 gigabit ethernet interface.
   Or the generic form: "cdns,emac".
 - reg: Address and length of the register set for the device
 	For "sifive,fu540-c000-gem", second range is required to specify the
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
