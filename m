Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6548BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2148E23B23
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 05:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2148E23B23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xki+lMHp8WolsuteA9BC56bhXv3gkPt2Oy7lV9NUE8M=; b=YexmHKC6efSQqsAOY3sdv1H6M
	U+wbYBpFHRIrKnANuFq7Al6q10f4MlWKHLTpD8sSYGSJoYVQ6wwwTQRpfGrJJjxXdLw5+O975amx3
	s/hw+3eK4iK1T71uYc7ZFFYfrlirex3QFkon06tHhqC+KerVecRvLZMOSzM/HoKRh6cEx4OeJ4MOg
	H+ltPHqxIhnTA3alCOrJmLu3RMbK0b9H9sYd4/wXYL2PgsSHRnksdTWMuQHIBAi6S5YktzoVAZwL5
	vXRhzrX4KxGdY8RK7YjqglR/6aW5B+VVH7Fuc4ezOxH+Qg+NYMbrHQiQwDHTrfbf6QTnfV70jFpvq
	nHrcGUbQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kms8O-0007ug-Bn; Wed, 09 Dec 2020 05:35:28 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kms8L-0007os-LG
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 05:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607492341; x=1639028341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TxrkKxa9B/FbbF02pP19+yravWB9f2iZvayjqKxqkXQ=;
 b=WzvheXzlkduMrQbZ4Hms7EPBMK4W11AZz/Dk6OP/Hak3JNzwUnjPxllC
 6oEGrMrJu9OCjax8ZV6z0C/y8PJt8JmtkMh6aUM8eKO1L4Ouq8ppw9Eg4
 DVFIql+R/Q75PZdNfBMAyEQBWEgVAYc1+LYinPjkuOS1CmK8CYl4Ad5+U
 9oR/+yViM19p2pMbFFQ/Luk0ycBDZl1+roWuIsAsMBv3+pgdTpWYWS/hT
 SVdRbSyJE3DeRm27GMnMzxKdlLXm7+LNc8i4S3uw2T55r0MlrKsQBqVhi
 CZEU2S6eFj2q6G4beu6+EqPLMhpn0g1wupvTWwjHx7+ndl6RhQE7XCs9u w==;
IronPort-SDR: OusilKYuzGlWDb1pBj8d4OCUMejojixK9r23/uCNo9eX53E2onh2uMHPpznw3jY9ckdCbVrIeT
 hMi29hx6vTiV8cAa0hzssOUO3iHcpgHORA5scCFc6XctzA1mWf2gDVDiyK6AXU7rlDUJFzuecY
 +p0OzmFK5MjXUP6a+QLDI3BYYx2iJ5mzCFisw+4u84AzPdubuDS0D0VaGtB9e07GDYZSFLADLF
 sIB9AAk2RY6ShSAlxjJjEkm98oYVGG/TuLrpOVI7XljhZ/KZe0nctlRimRTfO1Hxal4vt3gn+/
 spU=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="258465531"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:39:00 +0800
IronPort-SDR: k+DpWC6dlfjXfRUYef9YpQDmQ1ruZns4ceFytks+rnVZGKfGJOKNb77rVCEHK6wS2E8htypzNh
 SD1pzHbFX/gWlBrHo1bqpU5vIDCfkMfDY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:20:51 -0800
IronPort-SDR: zKlNfBpUt0XZ5WXGViO15Km0ziS4/MVtN2v6nTqayqOvRVSS45/n1E1K4FpmyaWWRceOvVAQRt
 77Vs2ROhSlUw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:23 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v6 07/22] dt-bindings: Add Canaan vendor prefix
Date: Wed,  9 Dec 2020 14:34:51 +0900
Message-Id: <20201209053506.122582-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_003525_828463_C8320A7A 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
