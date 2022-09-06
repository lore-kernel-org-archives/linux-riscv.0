Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97468ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOKBDC7oP1HrtlJad+7en1wBPM6qTKDvpSy9H9j1qYw=; b=WrRVVpX8cE7j0V
	5/1NiqaM+BNKYKeCL6Nhl+lRp5sIZpYapWWL/vPXw0sCeHnqXSljezixZHb0bCMumShBzCe2LCY3w
	yNNJQu5qDgdPYoew9jZpEoEExOnvnWn87I1gQSV0C4gPIxs3TRSBAvRR6L6G12OpU7pfKVGHuC6Hf
	VVQuOQ/0IiNFwxcObhMcDhwqh/7XQt17DTUgNfIis/At156gsgLrXMFQREoi7CMb2CvXcMd3m9MTG
	VErNm0UilulXzgL+vVrgdr296UxvRdBHI/wcFzLgNnE8FHDwvkB76AdcLcIIzyAyxDDC16yX37uJ0
	++WOPUe2oNmd6JVrNusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXV2-00DECf-DW; Tue, 06 Sep 2022 12:16:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXUy-00DE8P-I5
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 12:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662466572; x=1694002572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ExSrrf0mbRwFo5I4/jBMU3+r1RT103/uTjl2hcr2spY=;
  b=xr4JivUYkox3mO4YnAIjHURqGLm9wfUqk79GRNdOUnPFmEMOEAlc+EGr
   MGzr9/a+tLZOjpwxMKIkDi7Gf9/vs0Ory91KhTF2aL87vbVYT2FafZxv+
   9g+ISNS9NDtAwfE4zl6SQkMtgrxJNUVjRgpeMQXAPm82Fz/W0zzzJNiru
   8vnNRMl15rUsPTaK9+v67RfhOE2q4NjybbT6V6wrKVxeA9YgUZdu7z6KD
   G0Q774huW7zQYjODFHKOlMfY77HHI19EVcpNT0TN3OLvO4N43rJAQsqZO
   7tMiOiVmUJixE06dYWIOL6h2bRyrcs4pW3ooAny04WG+WwPf2cpcqUHR+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="179198199"
X-URL-LookUp-ScanningError: 1
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 05:16:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 05:16:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 6 Sep 2022 05:16:05 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/3] dt-bindings: riscv: microchip: document the Aldec TySoM
Date: Tue, 6 Sep 2022 13:15:25 +0100
Message-ID: <20220906121525.3212705-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220906121525.3212705-1-conor.dooley@microchip.com>
References: <20220906121525.3212705-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_051612_683661_1472A8EA 
X-CRM114-Status: UNSURE (   5.85  )
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

The TySOM-M-MPFS250 is a compact SoC prototyping board featuring
a Microchip PolarFire SoC MPFS250T-FCG1152.

Link: https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m_mpfs250
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index ab0a64cd5386..0bd62924d3e4 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -27,6 +27,7 @@ properties:
 
       - items:
           - enum:
+              - aldec,tysom-m-mpfs250t
               - aries,m100pfsevp
               - microchip,mpfs-sev-kit
               - sundance,polarberry
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
