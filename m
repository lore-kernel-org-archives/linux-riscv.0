Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67C4C32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2xFOXxnwC/hJj6tW4y969ZbH2rL2zkS0sOjVaK3F4M=; b=4lK3nq+FfG3EwW
	duGutYgXKgXXj3qhZ7VG1IbFDE11VymM0Sskic0b+oZrUJH9lbD1hQgtTKgkcr9wFJyZ5S2wmGI3C
	KBAfRdnRiKBmtbO1ze1a7zVJtfIr7lgPfCzTqHArcNXVjXvDfyZ1d8fVqX5CTxwU9aPd3jUc9wxNO
	RaqS2+0e1ppgC66VEB/yGcXXidXrCuBl+pcNba8OMDUHztBobHVsAWDh5mkT+LnvcJsEQx3lyT4+8
	OXMmErj7Kc+tx6BcPWm2NMFgAihppZ9tXFccG/hLbwVKgiILfiJotI+sSzDtg0nAVjLU8Fntm7H3G
	3MmjIyG0/6uUyKeeHsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP170-007s9O-Ig; Fri, 19 Aug 2022 12:28:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP16x-007s1o-JN
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660912107; x=1692448107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FUtbXHH8kiRaqk1zOS5U2LUqUUmJtpAwGyEnqH6QJxI=;
  b=V4cUDLPObMmSacloVSoL3tDDw8qK5A7Ig6vyJagZ4QCWYMf/QU0LPs18
   PPB4eAu8V6GiSalcjbXTZGK613PYG6HV3kLXxR6MOI9e159SGn3qsdC/n
   R+zU8ZqcAUeoLibHEDJNE807vdnSDq2vpgAxHBibbfrK19bwfc9ETwg/9
   E/UY6nB/2h9oNa+QHRbVTriLqF62CXKxodHl5okPb29VDjRknaCjXOvce
   4rplQEueK7hK64SO12OxprbUekmy8+sREFynBSGR2kEelQhXEYKoyr5Ij
   2R9GWwBS+uIfwQxAyal5jXpj+qhnH9FlMPuLun0ULy/gYcom+JQ0wcoJR
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="109780591"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 05:28:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 05:28:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 05:28:17 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH 5/6] dt-bindings: riscv: microchip: document icicle reference design
Date: Fri, 19 Aug 2022 13:22:59 +0100
Message-ID: <20220819122259.183600-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819122259.183600-1-conor.dooley@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_052827_752264_C6BEB784 
X-CRM114-Status: UNSURE (   9.63  )
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

Add a new compatible for the icicle kit reference design's 22.09
release, which made some changes to the memory map - including adding
the ability to read the CCCs via the system controller bus. Technically
that was always possible, but the specific CC chosen could vary per
run of the synthesis tool. Hopefully this is the last reference design
version impacting the memory map.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 1aa7336a9672..928ce4d4e087 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - microchip,mpfs-icicle-kit
           - microchip,mpfs-icicle-reference-rtlv2203
+          - microchip,mpfs-icicle-reference-rtlv2209
           - sundance,polarberry
       - const: microchip,mpfs
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
