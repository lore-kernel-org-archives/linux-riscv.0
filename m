Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC247C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81DA42389B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81DA42389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=efaHDyu3xQLSqo6J33BipPxB1An+svPd90P9qsiGX6s=; b=gY0uvWLetfh+dyzgKBhC75P9u
	VaoFv4uUO0UlL/3HHhZhr6D7HmZ6w6eWX7yAZtWmqRFzY5lx7Rvqr2Zf1Mr++a9RWrrf6wMn3u7CJ
	u0eujAzfh7URjy5rQAGFRV2nqUko0clD+bkEpC3F3PD/rL7DlEpKWMGMqMQEGX5taUAR/CTsLnpOJ
	dThHbkyQyfkNIKeLENwmXrk0TRJnKg2ZFTSb0f+LmJMqQERtv5yt8BYjrcOb/H3CsKbREWpTUvLkm
	tc+AWzaRVeB2yvb+kcvZIwRrVoIh8R8IvfhnbAfvlbBSXZrhMJU/OS1vpNAmQuE0WjV35jTxQEvE1
	0z2caUj1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Piz-00036J-Fo; Fri, 15 Jan 2021 14:05:13 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Pic-0002tt-Dg
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719490; x=1642255490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Hey1gBLFBlTZ5G4DZApRpa+IynzpXO3Am42+Zc7r64=;
 b=ctVQO4pTAlDOFH/Xg1yfOnIOV/MxwAwqrC3rv4eAyia+nXM0JsiAYHev
 WHiHko3mQ7jKnPLh7SvzkAZyXo/O8JM6o1EohZHZBNo/KgypIjdUvE0C4
 UrRl4+Jq/Fp863MvUAW6nXk5wRqklajCEv1cVo77bmPSeznCUNgS4yCHZ
 IGTrTMXJqIcRDVLUnMoyZd3RwMQ1Ronz/XXCqEp3LOOdVzv+SNuAYdO0y
 xGNAFqP85BoAiTfL0rGSNUQPz/BsBeCkacW11AWxYsipnH3UhREAPZPoj
 DZTuf5102mRk4wNU++gUt4Qh/lELwvg6w9vDOwtc/2Nps3/uFRDb+GgD9 Q==;
IronPort-SDR: DDTOgDWXOEJPZeQNttQPtEFo/LVM+OXBhcbfAcD5wj5HW7nTmhqhf29xQWiuJt4R2hZo1Dkys0
 aU7iViCFi1Dv7k/UzPXCzmBEsuN5LAkrBbmJPzNVVlPvFQMAP/mv8z0+CjDC9GWvYHc6M4CaMD
 ZGrcksUP6AizbSloQp1huCYWTgTKmO2uuAfbPXQ3bK9XVVlXRHfA+MgpwgsEqPeSoayeVneaZ5
 JUf/vS9HfhQGh+lolathGBffOfgZjRauj48BUMfz9OJbsqlvoSAnmilnPrscO8/a0lnLuMhzBt
 Qvo=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955777"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:49 +0800
IronPort-SDR: mHcGtIcS+co8aWHSeNPPGa3MjBdD5D/WGnlHkFmmRFlNbX+P7LCy9HEdLEX5gaYJDYmzUqbN+4
 oFGLxZEKoti5Gva4cAShRTQmxRscs1VUyxBcaH71AeYMIVP1O8cNd60DHUg0AShYLMvlN1Y8pk
 2AVV4FBaANaL79061D2WHiQO/uoHaDrAtHPzu/7ZZp7sgOeNUNj1X5905oJS1ikVAgA0KWP6Pu
 kBzHzeF5vJXdXrEVlPvvo8gkgTUQ3teSnGwE0IVvsVPXH2JenbzTpCgxZ+UjrbYaB9/TBh+inl
 dZP06eGhlVmwBMNczFh5AD4u
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:31 -0800
IronPort-SDR: 07YQ9R4XlMpkoOR+DsPyg/KEDFXvGd1xFmU7Mjkeuj4dO5vcGvduSEHy2+O0aHQd/SczwDpv3c
 3aXFGn7aKJYerpf3MSL0Rf/B1KYGl+e3hUAOkKdSlms3I1N9aPOpBCeIQ/2Y8sbWVnn0baUbwB
 gOwwBFvuzUNqjfbfzRGcLlHLHs/ITDZ0CwuUucyO6/izphmv9LVkB7qybAsEWzzsFdR2RByLfG
 2YtPnXY4xEoiOoTz8x9+293gMkIIT8Tx25J1LCxdsSYzKBNgzWpzMiE8TqLv7j95vFZhAqwrJB
 irI=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:49 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 09/17] dt-bindings: update sifive serial
Date: Fri, 15 Jan 2021 23:03:44 +0900
Message-Id: <20210115140352.146941-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090450_655936_10280439 
X-CRM114-Status: UNSURE (   9.93  )
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
bindings as the Canaan Kendryte K210 includes a Sifive uart IP block for
the main serial console.

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
