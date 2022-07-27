Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A714C3F6B0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrmO/fdY2jgX/6CTMm36NSnpuf6Uc75GNqAYvCqzdLs=; b=WCQovqItY3ZNWl
	z34MBZOh9CqFF2kpwzGtPJpsyN431rGlRbPjVBu50QDU9Hb8i4WdStY36iCivzviGKpfdqcCWpV7I
	B09Rgo4e7GXIZq57FBxEiMU4m/6LpqJyL71KPY0nUnPxPJDaU1hjnPfyBJ60DwyFo5X9T3Lbixo3o
	rCNrAVNIpiB7Tv5dpgYTZNosz40PxIVr4syU9J5p4GBIEaNlLrNJz6LiHpg+ryjHa4oxF18/cMe5r
	yyc9KNjZ5dxfHeje8zL3ttKXptxWom3lgACpBUKyaFzx/6WlN4UVDD/K3sTT/YhgCAYCDyMcRVCPU
	z33cRf4GLUZWcKsG9z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgam-00DksP-Ik; Wed, 27 Jul 2022 12:56:48 +0000
Received: from mail-os0jpn01on2115.outbound.protection.outlook.com ([40.107.113.115] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgab-00Dkjk-E6
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENcTBDYsNvGdCqOcwLjdIVEUGaFyg8jVTRUkA40aF3GL06Spf79nZxE8SshA370krOEqcVCGpt4zzC9tsR3QeHyYxv3jB7MgtWE1l/l49xTyFSst/Rn6H2Ch45GM5hqII4J54T5Cr6M1UssCzJb00mOyYPajeDBCHFGjfrgWYqH1K7ydgr2C8BC3c87WHu/r5yYiJqgih/5QNbLAe1VuocXETdlEBm6LlzGp2zzQHBS7vP8KYoUDWrdaBwd6iQHnR23nkjsp9ty0cThv9sjY34WdwzUzZAn0Lq1ZD5VnundcWHLqI6TIIq2IfuWmByuoCBphZmjE0I7Y6YWYuPKdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRQzQYr3T/5M0EZ18a9ZRWUDWEo0jjhW+hRKPWsCuAY=;
 b=KXM1ffs7AkAhUVQ0/MOrzp+ebOpPMrA6MBhYJAraoaBM7D/uKGy2qV/0Jec70/BZY7kixNi81FNbdTYv1+h/4i9tXNJt17H4Bbbq3H5951aLnRBJX+oiSMkxa4Bjvn1IEq9waBuDFLBpCjncQqgwrBS07RKZk6JgtlYc/PoKBSVNXwNqmdWrLg6WqDFFrZMej1gZRiZDSDRJjzA+WEc7z2SPYMncUiEW00YYIslrGPsODLhTS0cYf+Pe04b7/0zYwOSQCeXHCfE0QD0R6JKwJUwmAQhDcfwwfEaaRzqDkxmizYjhP5I7WRYDa685uB3eOpy+8+mScpN5BWjB4yi74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRQzQYr3T/5M0EZ18a9ZRWUDWEo0jjhW+hRKPWsCuAY=;
 b=STEQrKppp6NNGnn9lNtfkx7faZEHfM/fLHVuS4c98yy6Gc3xuDYjYjT0h0wXxuQFHY7jmyJGgJUTEdvPp4ryDczxeaxwYCaZiHwnxUELdtuByWGyqxUM3Y17N7zXNNvSlM0400VYXGM9hmbWaJF8VL0zT7ydjuA1xncEPMO+GnU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3817.jpnprd01.prod.outlook.com (2603:1096:404:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 12:56:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%6]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:56:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Thread-Topic: [PATCH 4/6] dt-bindings: riscv: Add DT binding documentation for
 Renesas RZ/Five SoC and SMARC EVK
Thread-Index:  AQHYoRp+5i2kwB4v6Ue8zM4Y97KIiq2R6rqAgAADKoCAAA22gIAAAzUAgAAAzoCAABjHAIAAAfcAgAAJcsCAAAUegIAAAe3g
Date: Wed, 27 Jul 2022 12:56:28 +0000
Message-ID:  <OS0PR01MB5922FDF8CFFE44A611D3783886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <636e9214-4b36-e9a6-3c6b-b6edb944335e@linaro.org>
 <CA+V-a8sTw1qzuTeD2vb7RgDmmNdEP5qEcxXCjrFgkyrBrLrt5Q@mail.gmail.com>
 <e64cc15e-b31e-876d-b3cf-b60d255c495b@linaro.org>
 <CA+V-a8u1VW9xaj2KjySyMuegpisLVENO_6uJOpAFZGbKziYLYw@mail.gmail.com>
 <e31e0c1f-4755-704e-8428-93970877d8f5@linaro.org>
 <CA+V-a8sX=Frs_cds9MriauTFRvcZUNCvoeZ+SaC0GUpL7L6qhg@mail.gmail.com>
 <9f32a4a9-66b4-ba2e-1713-436103c2faf8@linaro.org>
 <OS0PR01MB5922763582B836DA45CDFF0886979@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
In-Reply-To: <80f08089-e3bb-983e-313b-45613364829e@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ba16b1e-9a5a-491e-6fb9-08da6fcf6c0a
x-ms-traffictypediagnostic: TY2PR01MB3817:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RBq/hD3Z1UhSHcoxpoTmjVN6C4dJK/az1v7QpNB9BGeo9IbtzIqJaW1Fh1UWyreAl4tS83pWr8QRgyyW1+Z/85exEHGz9jI/PxT9J/73FK6hPXcmh/t/iet0hsA8bLNQBaKuqXs17YXxjUL419PujetTasGZXAvKVS61xuHdjv9DktV9hJp4GJN7w1BJtWoCNH3vzqL1r5+nnMztR6x2R5EP8R18+dYLUZjIdplHTrZ1FxkovkyqoOtni/a26M776TFrM80KNXnkYLAHdAu/w8V+pm4I4QdHIJjiMRZfcaDd5S7IqT6Ptn0oWuvrJ9bnIejYG4GTnQXopJIEgbh/kh7fYLfVFrUK9oDO95QW8tLEdeZeDxtJRDuHHTRqWfu3yiPFvITtP2lT8VYrrj+L4TuBXMarFhx7GcaaBDNebKjbMFQmZQJg9ntHRF9xi/CMyL5Pe7tJ977RKr51NjtzzKqLc8IsIAcd/tsnpyZ6+MhcwU9rzczLT7twerA5t+G6vLQ2Nrlu2aviRy+HFYLICfEINypXsDjFT+f4EE8cg2XfbiIa3vlF7zcpdia44xwG1Is6JWEOpQ4cul21iFtbahJC0NYy+r+ikkhILrFSCACpquDwnhpVsZEvAERqKCjbLYInUWLAnDueuX6XxR+qGboyAEbNoqJzezsa2ZBfc08kFYRa9cZW/8/T5sMh44B37a7zLbrvf/VAo/E9XbCGZmEBxizruvHZAQwSKyjWVIDvmxONlQy3JhD6WfjfNsXYBbradMSQaj55MPhrpIvrduAFvYzzNWS3vyq4NJ1gICk9ip2gGfwURhBDv0X+e6bT
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(66946007)(66556008)(8676002)(64756008)(54906003)(66476007)(52536014)(4326008)(110136005)(66446008)(38070700005)(26005)(38100700002)(122000001)(9686003)(76116006)(53546011)(316002)(33656002)(7416002)(7696005)(6506007)(478600001)(71200400001)(2906002)(8936002)(83380400001)(55016003)(86362001)(5660300002)(186003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R3ZORFhGOVVUU3hDR2c4MFFYNWtBVVJoMFU0M29IUmI2WUhKb2dCdEM3MGRZ?=
 =?utf-8?B?SzJTdkVNVDVpbGFjMVg4dEEyUy9CdEh2MU5VUkFqNEVlQ0FQLzA1YWJVRUNu?=
 =?utf-8?B?YXA5RXdKc2FLTU5BY1FjN2VXOUlld2NWYm5GK1hCS0VUZ01CNFdXOWhYL1hl?=
 =?utf-8?B?a2R2djY5R3VncFpBQWxzUW5GZ21QUlo0K3VCcjVCOWhWNzR2d3Q1ZkxudzAz?=
 =?utf-8?B?OU9QMnordnlPYmdVOUpTRTRJNUkvZE9kMUIvSDdlZUdXTmFIcnFibXk0c3gw?=
 =?utf-8?B?QkREWXlCV2xyOFhlN1ZpS0RyeUYrcFc0c2IzM28yRThaZytMait6SUZSVVBN?=
 =?utf-8?B?bU1LazFzd1kyeG1kdXhGS25RZE5uOStmTktWS2RFUnJDNXozcjNVS0VJOTI2?=
 =?utf-8?B?c01YVWZLUHdibURjeWJ1ZHc5SmNkSlBtYVJXbkp3bHo3Q09qYkdJU1FrbTl3?=
 =?utf-8?B?N0xuN1RiL1MxV0ZpdnUzL0tBZ01DZXpyMk15VDJDOWVlRUd2N05UZ1hxZGxk?=
 =?utf-8?B?RmROQXgwUjNBSWpSRHFOVjNRTUNzR0QwNWlZcFNyUTROTnk1bCtmN25GTzUy?=
 =?utf-8?B?QnBiTHkydWw5a0s5dmEyVUM2QjBBRE40M2ZreTdldjc4VmlOODM3dFRDSWFy?=
 =?utf-8?B?K3VmRkc4UW1pTEN6Yld2RUJuSi84cFI3ZnhBZ09Dcnc5aEtTZ0Z3aG5Lejls?=
 =?utf-8?B?ODhxaXpoK1o1YVBBbmZ6UnJNV2dqVEZBakNxS3g5QWNhb1V2WE9BK0dvNXFH?=
 =?utf-8?B?QjZ4cGJsRVJNYVZrZGRDenRrd1dRMXNjd3NQR2Z0M1N2OUczNnViRnhrOTZN?=
 =?utf-8?B?aFQ4dDhvUUp3MmdrbWtJL2VPL1RTcTNDY3VtRHQ4cUJUeXNEb1ZpVmxwVzhQ?=
 =?utf-8?B?cjA4OWIzV1p1cGFOcmduVHRCLzRyR1o3ZXVOdXByNGFuL3R2OWg1V0NjdGdl?=
 =?utf-8?B?WitNT29zM1pkWU1IWUtHbFBsQ21KKzVqSmd5dGhpZno3bnNSYnQ3TTRZMUFo?=
 =?utf-8?B?bnVpSmxBTlV3UWR0TE9makord0N1ZVFHMGl5UUN3UEw2TmpDNUgrajFQWjhv?=
 =?utf-8?B?SEpxZDVWNk9GSWtrd1pDaWd5bU5wRW9TY2FTTWJIeDE2a3djUTNSUTdUY0dx?=
 =?utf-8?B?UkNjM3l6UUZOSWQ2S1QxYmVBS1JuWEZkMG92dFpBK3Q1aWV1RE9MWlBIeEU4?=
 =?utf-8?B?ZW1yVmNISUtrWWdSNHNKMjdHckJoMDNQaUE1NWluZTRsMGZiK1o2TDZJdGI0?=
 =?utf-8?B?ZmJYMjVCMzZ6TTN4REJhOGdER0dsNGNHWEFVYXRDTmJaU2lSRFkrS2JSUU41?=
 =?utf-8?B?UUd2RmlsM0Y4UVlPMUp6TXNQZlRibU5BcHRCZGNFb3M0VTdTSUlnRERxdWVk?=
 =?utf-8?B?ZWVhcWVRTWlHRzhweXdGakk1QW1nVlB4NjR3QVBnamxaWUMwaHpUT1JyV2VD?=
 =?utf-8?B?Q01EVUUvL2ZVbnVERzQ5WnhwSi9LNGdrZ0xmTnoxb3ViL0VvNkNuNG9JWWFm?=
 =?utf-8?B?Q3FTOGRoTnJpd1lxejAxYjladHFxWDFqWE8vUGxTT0w0TG95Ryt1Y0tpNitY?=
 =?utf-8?B?TWFmcDZHamlQU1h6TjNmY0MzR0JTSFZJSWg5MDhqVHJ4cG9MeHdpcHlZamZQ?=
 =?utf-8?B?RE4rMjR3dzZGcnB3WEh1Y1UyWEVzTzdhT0tKQ3hhc2xuK01yT2VUZUJPSlJM?=
 =?utf-8?B?TFNhNkN4ejR3eUFEVWE1My8zeUliSDRCUTRqSElEdkNiTXpsTE5CVHE0aDJ2?=
 =?utf-8?B?N3Zmb28zbDRtaXZldU5WbXJKSFBSU0dROVBWUjg1ZUZrbTF1RWVBN2hQTUwz?=
 =?utf-8?B?RFVLeHRXVW82VG8zRkpQSU5qdWl0aW5CRDA4YnhXYXhlTHFsK2psT1VpaUNF?=
 =?utf-8?B?b29pcFFHWGVTTU1EOWdNZmNERGNoM3E3RmphWGtCRGdGcmw1NExISU5wdGUy?=
 =?utf-8?B?RittbXRMVkxPcnM4TXBtMTNOdzg4V2duQjJOOHVwL0xBdTg0ck1vbEJLZkNZ?=
 =?utf-8?B?RWlQbGZoK1pabG9vSXVuUCttY3RvWHhDclh5WmVjM25KekFhemFFVVNXNi9m?=
 =?utf-8?B?T0VEOWFGWm9Ud0RjSlM3ZFhodk5BSmJTYmZucmFIZEkyQVFuK0ZPdzhwb2Vs?=
 =?utf-8?B?T1VVVGhpS3lrTzUzb3hYTlpDU2lHUVhtQWJmcGFvS3NySFVjWkltSmxpdjVh?=
 =?utf-8?B?N3c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba16b1e-9a5a-491e-6fb9-08da6fcf6c0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:56:28.7414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJUFNfOWdDpmnEVh6aGLQF9Iyt005yNehF7jrtwRNvOdWtu4gsIBtgNZkRxGFRCKauuCBjdg9iKtIi76O99ROUQZA4/oLioA5+020zmg1gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_055637_542336_F35CFCA6 
X-CRM114-Status: GOOD (  24.27  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: 27 July 2022 13:37
> To: Biju Das <biju.das.jz@bp.renesas.com>; Lad, Prabhakar
> <prabhakar.csengg@gmail.com>
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> Geert Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
> <magnus.damm@gmail.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Paul Walmsley
> <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Albert
> Ou <aou@eecs.berkeley.edu>; Anup Patel <anup@brainfault.org>; Linux-
> Renesas <linux-renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; linux-riscv
> <linux-riscv@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding
> documentation for Renesas RZ/Five SoC and SMARC EVK
> 
> On 27/07/2022 14:21, Biju Das wrote:
> > Hi,
> >
> >> Subject: Re: [PATCH 4/6] dt-bindings: riscv: Add DT binding
> >> documentation for Renesas RZ/Five SoC and SMARC EVK
> >>
> >> On 27/07/2022 13:37, Lad, Prabhakar wrote:
> >>>>>>
> >>>>> I did run the dtbs_check test as per your suggestion (below is the
> >>>>> log) and didn't see "no matching schema error"
> >>>>>
> >>>>
> >>>> So you do not see any errors at all. Then it does not work, does
> it?
> >>>>
> >>> Right I reverted my changes I can see it complaining, dtb_check
> >>> seems to have returned false positive in my case.
> >>>
> >>> What approach would you suggest to ignore the schema here?
> >>
> >> I don't think currently it would work with your approach. Instead,
> >> you should select here all SoCs which the schema should match.
> >>
> >> This leads to my previous concern - you use the same SoC compatible
> >> for two different architectures and different SoCs: ARMv8 and RISC-V.
> >
> > Or is it same SoC(R9A07G043) based on two different CPU architectures
> > (ARMv8 and RISC-V)
> 
> Then it is not the same SoC! Same means same, identical. CPU
> architecture is one of the major differences, which means it is not the
> same.

Family SoC(R9A07G043) is at top level. Then it has different SoCId for taking care of
differences for SoC based on ARMV8 and RISC-V which has separate compatible like
r9a07g043u11 and r9a07g043f01?

> 
> > Using same SoM and Carrier board?
> 
> It's like saying PC with x86 and ARMv8 board are the same because they
> both use same "PC chassis".

What I meant is board based on Family SoC(R9A07G043) that is either based on ARMv8 or
RISC-V cpu architecture.

Cheers,
Biju
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
