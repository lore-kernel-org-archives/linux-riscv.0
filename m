Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D313C388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:14:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC3022242
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQjuWdL5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MflQefai";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="MqXqtq1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC3022242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=7JLJHffjQfl2D/fZT+9/c8A9In/B/yBgl9o3abfO6Ww=; b=sQjuWdL5+cAglpYdqpvo62XGc
	mQL0kDkGED4BfbvKb+SaDB6uuKWoxCBA13LC++M8PKLGa50kP+em7JIODeBKutBqmpKiK/H5KGKpG
	04Kml9yz54HptchwTLIEVQzyuTOcYDpyD8MJazKt7Axggt1LhBB1kpvF8Aw5QuNsj+vC7jPIRD+Lp
	wOkeLX8AWroJeohVt5vHPb6QwOTxNvAUMU4qadVdbTgPzHr2Ci9cY/oHC4T1Vtkudt9euU7WqgXGI
	xaIhO+lquKkWDKwXa/0eko2dHXK773tyAPMGRrDYlujTtwKV9Mb+l7mzM+HKppzZYdhWPk+UaMpe+
	tedBUB/cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfu4Z-0005At-GE; Fri, 20 Nov 2020 00:14:43 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfu4S-0005AP-Kq
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 00:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605831276; x=1637367276;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=DWqHMYOR5v2QzLQkqQbSWigLLC3KZdOwTLTfFAKdYMw=;
 b=MflQefai0ctqfDzGboHtyyhT/crOfa52K+PihyyzidHuVJaNjDHoLnHI
 sqQu4svmFyFEdY1u8YhwkiNjxlMmE5TByfaLwDtu8MhqdJIqp4VMbOjO+
 DENbMlv6Y89X/HbB4eJj2uYPb/hobSJ5docB6/qtzauTou2Le5NYRIUac
 vsFPAboZTl7NO5SJKSUrUpuA3YYHDs6zVousLvXYLd1cKDqI+9EXIwFai
 yeEPkRDKa3rG3ZNcsy1WfjDCTVSC+XfOdi7jtaDOaqd5tLk6L0hJuAeTG
 0Jn3qd6UGIom/0BheVrdRk3O5mOJcRgsoAe1Szg7xyYCPK75K9FAdVxlZ A==;
IronPort-SDR: r/li1cdAXnwFjln/68UOnEwm6QkziHuGI7FYanaP0dGcuMOddL/dPfbIVNCtStTLhAj63+1iEv
 CeaYwS5Jt56KMC824AHLM3gcCk94To8f2ZtG0HewONi9n5kTdy6K/kZsadTzWdsDYY5cpguvL1
 6dK+6cNB9u3g7lQqT3y1IVML4GRXFPX88jH5desHI/AgK1Wo3AV3JJAEBpQFYpScgUjPYb/LGs
 KWwbzU2if0b8duzsq4xYHsZ2qCk6afMpL2yHWW9ETONrlf16ZMN2ei3lAeJkAkqLBKdNwv/uzO
 sBo=
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; d="scan'208";a="154234601"
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2020 08:14:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd12dtq+gg6Yvm8YeMGjeNpNwqUDbSI4uv/6015oqF6ODR2nXY3ivWBWOTmI5o6fySY8Dx+K6GbySoPULSFa1bY9Yrt5o2OJRPyAjUW9cJrKP64hayzDFN5fJLwex7c1Gg646+TWxOgxsc+fckdJzHpXFM/m5b2GwnLDsBpGPAYBA7aTHOYOO0nNACs+wJRSzKJIJFnuzvAV4KoCAus6fQPQeiEnQsgWiX7Czs+V4Yv60j/5LyBNDS8ms8ShErikEim3zfCZmhQJs9ruF9CI1EAXsC+MIsWQqC8c+azqKxYjUP8xgYy4zMU2IQKT7vWpnScGGJmGMDlB+YdlZDSqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwGZj4WBhx9Mzn/a+fibMiuw+KWB0yLx3oyEjOEUwus=;
 b=ZE8I0O6SWUHain3QKezkssGbKwI4mDmAl6kxiGdzCPRy3KOZ06i1VvDQkgeIVRrMKwCWEIsjD2neyEZaIJjUCQrWDDLSw52O7b+TgbidpHwRYqfErABSJzCGbKSH0tPweBgq7vPVDOGqrLY9fg5v/BWSnIUy5ShEE7wY8gqk9WnK5QQTxlj9r6963E1QhQeO4Z8Oir5rAsSCp/6XycJVYRLSDhHqXuGs8NOOmNsWYqvz5JLurU+ncJOrPKFP8WRLKA7aMpKAVE2lcNrpeXgJxsTtS/BnFOo/Fg2XQwph4kQL3DkszC+E0qS/zLqHJqldp8fiLqHEQKFG/73HQGrPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwGZj4WBhx9Mzn/a+fibMiuw+KWB0yLx3oyEjOEUwus=;
 b=MqXqtq1D8rQvEGZBOj6ydLApDOkQs7QOxWVifnG4jddHLsRk6BXSZXbK4FB0f6aiOMG6laseP/yP5alX6tnnfRN3crQJ0kdlmHwcAfuVQ1b9m1NxjWZayrtYo5i/GJ8qg5Tj7ienSvUHF4nGsPbzJtmS0JI2L0hfYtu5cLfb5yI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6640.namprd04.prod.outlook.com (2603:10b6:208:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 20 Nov
 2020 00:14:34 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 00:14:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Thread-Topic: [PATCH 3/6] dt-bindings: add bindings for polarfire soc mailbox
Thread-Index: AQHWvpYlg1eQTGzU9kGCCfZeZuAWhw==
Date: Fri, 20 Nov 2020 00:14:34 +0000
Message-ID: <BL0PR04MB6514991EB7AC9B0139BEF513E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201119170432.18447-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:752d:4d55:43bb:285f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 39b6c78a-357e-43be-1951-08d88ce9425c
x-ms-traffictypediagnostic: MN2PR04MB6640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6640FDA8D999C7F1856DC1E2E7FF0@MN2PR04MB6640.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aGIhAVgEHX3tm1cW/21wv5uTqDrU+7KWeJNu5BIzI4OJXMTPdA8LBC6nLnA+j4VigmO2TrO0cTpRogCIz7sBGnI3GT3HiD2Ch0xYYIHr3tANxtFrwxY38hj5jtDGP05LgaH8hFVJ/N9sMQAE4IRtLDy3mtpHNbgewBH3VI2JLZi4818gwWJVIfaUjyM/oCnuqpe3om15z/ueVSyhXnd5g8VAtcsCIR6BXOP84NRkKRNyeO6ltLd5/5Vn66R+vQwKvhzUoDf8k5UPGqiiBT1rprBZccpTQEEhLYX1KY1dkfZqllOL3RHMpyXTNwrDaLlQl1PqeIt8bftMXIIw+bTZ8hpzI3vS9bMQjb9cDPLipmnyk2IAZfVryFmR8LCI9s7CVgPwPe09KAX8KnwJjbUcJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(2906002)(66446008)(71200400001)(66946007)(91956017)(4326008)(83380400001)(5660300002)(54906003)(186003)(86362001)(66476007)(110136005)(66556008)(53546011)(7416002)(33656002)(64756008)(8936002)(6506007)(478600001)(7696005)(8676002)(76116006)(55016002)(316002)(9686003)(15650500001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HugFg3TXHAU3PyoykmqDd8mEURoNjWUG0yG5CcP6nCZimoZx46Pu/KMj8INcwG77ymMWzxqUqWt+grk0z3/zIJDUwDWtMn+pV55gnEGFrExQhwg1xsiXdVP97sQPEXktU2aPfjbL6ruyw0CSGi5rXZjAnPqCZg/Jp5Dno4yxTVTKQ8KzDIT7etftC7bFNBgZtMeCfasfLR4ut/S+6HlG3OUwCQu1UD02s/WF8La/BVwaJYaZ3R8TLaVEknYutLlBTDpK1xHMZCUxKl6HV5bzkJx8QOSjqzQg0OQghiSV2raWQEZksRGgRtDbuKPHmqAoI+yv9Q1GVMotPHe/wFmn7faQYZ0Xg2FOVks/QZlmUZmEwuQ1LDOJVmAdMGMaDzhHyYjEEE7b5itBm3ZAC5CkahXZMfnljL5yRas+uvVryV4Z66CElYE1JMLsB4dbzIwt9wpySP/nNrDlDwGI0doYy9OSTqpqzfj69KnAVQiyBRmMG4xnuo8Ya+oibLAxK1ghN3EfRK0Ol/DextBYx5NdEmvIB2O72Rrsf2mjbaG1ZZCsoahyePzLsUIASQjQQTFN0XOoR406/7bDALdqs/psCMgr+5uPXxxntqxr00x1pIP7Y3XfOqIyJEyhutnGB9ben6a13Dw4nwUGEjylO0Mgy8JT10vUEKfZgLlGZMq4DAJ32bdJxVxRG4mjM/52nFJQM9KLvyMa9VA22sW92HO82w==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b6c78a-357e-43be-1951-08d88ce9425c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 00:14:34.0570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDnYlp4s24JJQ1hbt4pTFx+1LxJXT3e9S0xN+xN2cgj0bjCKhQ+3pq6+KGSqqup+RJS5qpNVAYb5CXkZwVEo9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_191436_910763_89BB2D80 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: "cyril.jean@microchip.com" <cyril.jean@microchip.com>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "daire.mcnamara@microchip.com" <daire.mcnamara@microchip.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 "lewis.hanly@microchip.com" <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/20 2:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../mailbox/microchip,mpfs-mailbox.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> new file mode 100644
> index 000000000000..5d6ccaa13dc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS mss mailbox controller
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-mailbox # PolarFire
> +
> +  reg:
> +    items:
> +      - description: mailbox data registers
> +      - description: mailbox int registers
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-parent

This one is not listed as a property above.
Did you run "make dt_binding_check" ?

> +  - interrupts
> +  - "#mbox-cells"
> +
> +unevaluatedProperties: false
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mailbox@37020000 {
> +      compatible = "microchip,polarfire-soc-mailbox";
> +      reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318c 0x0 0x40>;
> +      interrupt-parent = <&L1>;
> +      interrupts = <96>;
> +      #mbox-cells = <1>;
> +    };
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
