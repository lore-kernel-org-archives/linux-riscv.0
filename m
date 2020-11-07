Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CD0C4741F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F033208E4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGAfSL1j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ZyTMb/9x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F033208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dv8lLq6697Q8yJWWO7FeMpHN2hSsrYQnhvCT8oQsJM8=; b=AGAfSL1jV27wgcE7w+iHfP3JA
	5l8jJOXNLlWvLkdtSRJu76c+UKYLoLkSKmOFNd396uO7p7fQhXf/1XhgCe0J56hhQQrJSz8mOU+CZ
	KSWBuY9dSVDH4zgjpoPRo8m0X3pgac7xFLRUwBH41sZaWDvRXIlBxvU7i9AYRzgujd0zmZ9HX2T8d
	gJKdDDndP+tK8I0US76wFxZhjEGHfR63GNYDq6rjBeUG4HkjOCrkQ+IEiFgeUOVrcn9gSe9Eh0i2u
	oHY2wJ7+HrWr6nnI6/jxWuuFExTbpNNV/+yvLZRmS7aI75/b9VhtRqoq7dzRi9/dZi7gU32nEf1rM
	MweYDHx6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNi-00010j-FM; Sat, 07 Nov 2020 08:15:30 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNY-0000PH-6t
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736920; x=1636272920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mT3pTXQexT9Dgnt/dopD8ONmHSaoe0HrxwBKmVk9pvo=;
 b=ZyTMb/9xc8xYTOUlovTb2O+G5KLYGn+jnUCvbVNItPclbmUNh/feHtMt
 A4uvYqokqFch5fGAez2u6qh+qSXPMFW0rBfbhzCpw+JYCaV2HEYWaBhW6
 CIBlUmBdZlfmkP+sMu5lcnck1SRFzu+Pk1LKpgYP7b4BDB1ZDXyLX/0Ud
 Nhlmx3GiSNzGtTLDxNLYxhb7YHzud/Kz2R5SVQrIfxXvb8utKuKplDAHm
 762rZFne7nXcBiSZfQ/ezOaR4H2XyULAt7oZ3aBasQSVlXLY1VtcI7a+j
 Uq6QCr3UE5+bn7uOr9QJ8u/l5xFPHAWf+pb+Vto3TUkFPoWgCIU5bhXph g==;
IronPort-SDR: Gdr5rbQeNgiEvcIHgU+CNFThN3kWQQxeQOGEHtHnEP2UTU64SXsXRGBJ7amDAi37Y3H1PFpXpQ
 jlDPTii5d0/b/SO6Si74PSurjoV+xSOZN5YcoZoPGhCIm5okCYU+WqI15Pa+aPeiTFS+xvmfMJ
 M6kTDkiP8MD8pLdKthuAvPBdta4dJCA9aXPH8+1DmIoa+HMpZsyz54O9Ay+bxyRr0iVDgT8bhb
 rdfR7SLGeWRQzgHgoVtYxWrjb9q9QHR5r8B3H63qaU2CSaBfCck80UcnxyNR3qoEnM/xMu2NVi
 3+A=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079330"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:19 +0800
IronPort-SDR: wVfQb/fAoXRsVE6Grpi5056KYfq5TAdCegTVoJB91skCAMff+5to4tJKyMin44L+qy3b1dhv5n
 Ha/RpDnf9fYHIMC4YokfJc4FKa82dDx/DgTc80matHaDjXklI5vjnA0D6dBtX1YQ7RDA38Sn9L
 hMP7OwduvgGffLmBobUjlClkxplXf7VtGrLvj/hgW0ymrPscrSTlw0XkhfI4nO53OtF7wBNSbu
 X7/wqSj/ogvboiMqffwgMVdnLy7S5Sulbpb7oinnUnqV8lvqgE/c7w88oI1kohOkyJALLLRtqW
 N0z6ieVSWXsOM5sviMtFXTai
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:24 -0800
IronPort-SDR: nsSrpRMvEDvSs1TeA0fMTqHiFneFxHjZmLfdiZ87YpKj8Av1NoJkpTT29IXc4QkCHCdg6d+K/y
 zVGcDYrgUlDAfCTc+znMu3URNsQ3kk3ic6fmy40H5NFAj8SQwDDMBehX3TbPn8UYRGm+mzfuhQ
 DJC3TOp0zMejeMzCFqodVr59FKdboNmBIlVIJflbfggqVHWF6ocv7cwqJTb4YP+Ci2XKOErP8e
 NIeljGbMnfObFqEuZg9gln+SgXE+TnW8kID6vacvc37Da0BkapPZ9YbWTCsul4IYeM6yuSlmTt
 lAk=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:18 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 21/32] dt-bindings: Add Kendryte and Canaan vendor prefix
Date: Sat,  7 Nov 2020 17:14:09 +0900
Message-Id: <20201107081420.60325-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031520_464078_4EF02407 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to include
"Kendryte" and "canaan" as a vendor prefix for "Canaan Inc."

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..f53d4d8e7f2a 100644
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
@@ -537,6 +539,8 @@ patternProperties:
     description: Ka-Ro electronics GmbH
   "^keithkoep,.*":
     description: Keith & Koep GmbH
+  "^kendryte,.*":
+    description: Canaan, Inc.
   "^keymile,.*":
     description: Keymile GmbH
   "^khadas,.*":
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
