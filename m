Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D3DC433E9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4126022516
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4126022516
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bmb7xPbLPsy3RSTZQuMiLQjYEoL88mm0gKakUHoTN6o=; b=n9iTc8R1YwBx6RHjhWIz9Xk3i
	CFowanmYHj/C1Ep8rR6O8Mxk7jI16KwDS10bfpbmlA+xslLcz8M6Ipq/4OCVC15sTr73E4/175zqs
	E/+0IXpOFH7OXfmE1Fzv5DJj5ql2N8NSG0Xs0r1dYYtQB5UVBMqKYEX7JeopRMD3TKkHauDUxM9QD
	vNU+3OeqVKvcebp7hIVWB312MdC6/hs0GSulLanItNCKPFIcktBD8hCGtTsvtcLdPd+AM8BVfjX44
	kWy5UDqFtvrsDKv6tR8YSXXpXBcfku5l6yK9sThjvcE9vWSd5JKKKoY2BlPmCEOkKdz+TBlNOFkdo
	aFBgNIgNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jsv-0003cb-4O; Mon, 18 Jan 2021 02:03:13 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jsr-0003Yc-Vz
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935389; x=1642471389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZzHJ95UHiDhalCyr0UWnRyqs9+D5T06N5O98Kg5LfU=;
 b=Ol0NErxQt4Kv7daU3WpsJR7beuNcNl2GcON4ElkbmuuSSIxhMdqzW4nL
 ybEYcsckYrTyIvj4kYOr1ZKAP/PegBa5Fj4nTyQaioRxISsBqPcemL2d7
 RhwrVff56/rqjLmCjWIaQt2REl/UMmrFEW6+XUfGc9x+Cb4FuSJWEJydg
 RJVjUDbgQ2+UGKJwN5R3h9bPQ0X6lvuYG3mwD+Gbe2AoCW5iXF3x0EiIf
 vfi/NxpvpZnMpmOVls4SCPDMUiwxEVJJdiN6QHdzAhXw2e9N1aeYf3Uhc
 JGp4xIXW/sz876FkSq5H7ti3TFAmvQlz5KCT6o/YEd2q0An6oqVjgOQni A==;
IronPort-SDR: tK3qt9mt/Ne5eiIhi0J4wBB9BiN/2gopizmG3kXxDXC5RZkuRyfO6qvc0VY2TwTNb9zLgOTdA8
 u2NAKdVDteaMI3JGks84UMqzmORqw4LiuWgay4n9LlD8PXOyYg3+7VXuqDcGhZaGxkqOfDPs3r
 DMpnYpg/TKBc+V7Db8AUIRY54ggsPBz+J9A2rJOhlp4q2kEV41tGOSTygD+UeVTuJa8TpcoKqS
 4HdH4yj62D1GKt7psR8y2Hi8UcVhQ4+IEWdUtXAR0yfX7Y7/roL8/lJSfC39d9q61Y1Er2IlJ8
 WEQ=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979906"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:09 +0800
IronPort-SDR: HaedhfFrwXnFXjw4MN0aqRDgNBPXcu1hOWm/egdhMqIs2RyPu1VKn7xIcin6noMTUkW3WzSHw9
 YOvSCUiIpC9dbaTD4R/KBfdHXncvii284ACbEd6sfw7qW/kWR8LrOCCc+1lxCk+9Ch6ZgFej4d
 Eeyw1R1GEIcIFkqB7PLACCk6iedyJ+ISKkN5hoICpgbqkO1BwCFV+cMzAManE/VPZrEhPzg3ge
 b8RjdIJ2y0TUn3Tua6rlkGoDcMqSGErHTtBnPlqne5MD83X+U9k2BKJM93rdgpVbpNLHBPOzmU
 7PgZTiMGzw7pwE284iP8c71s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:46 -0800
IronPort-SDR: AhhaL0xISz6q3rcLrB2C5pN5bHPQuTRu60cj+e7lbzM6Q2rrrxtALiK+bPgUY7wnCHEmcJVqR/
 fPaj5lO0c/tNav4ZN132Fr9o0ZQlxGXg5KBjKyaL8+ZR0zuN5zkinde/Hz0ZjkrdcwuxhRzW84
 FiE/yZdK5IrvylhPyoZPaA+O8oBojGOFB4LexpymYt1pmzUFK6H2zttAPY6lMdYtNxrbfk8Jtb
 Xxcd1/l+TFc0e4d9we2gB+1F/tUW2ZeEtBJdNfXC1Cokbay0vhN7mMckWS1zAII5VBh8DTD5AC
 N+M=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:09 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 07/17] dt-bindings: update sifive uart compatible string
Date: Mon, 18 Jan 2021 11:02:34 +0900
Message-Id: <20210118020244.103451-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210310_249991_F0EB74F8 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the compatible string "canaan,k210-uarths" to the sifive uart
bindings to indicate the use of this IP block in the Canaan Kendryte
K210 SoC.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 3ac5c7ff2758..5fa94dacbba9 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - sifive,fu540-c000-uart
           - sifive,fu740-c000-uart
+          - canaan,k210-uarths
       - const: sifive,uart0
 
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
