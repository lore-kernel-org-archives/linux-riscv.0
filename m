Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4245C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 22:04:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6877D206D8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 22:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQ7Qo/4c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mqjOrpYi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="khPdQbFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6877D206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=uCO6VoiXldRh7B4awaK8QJkbIu9HGjbpmKDT745BDzU=; b=AQ7Qo/4cudgemktLQ4YyhTWqK
	Zyo9cmC4YdW+Lw1XuLtMtPH6M1CI9W7Vm9AKXBIqia76QpVmZQaZoT6kzCPgfSyK1WvJLVrmAoW95
	jGAYR00LnpqTbRQy2OHAiYVm+vwNdEmiSoeX48ivRe0a5JrLluFbFj+4Oy6s4k8eKrwdkAgGeVJoT
	9/WRBwFgT18sTGiGqzannJKHLHJ9ipBew83wX6/iyUjQ6JsQScJaaGjnNdDBu68Ug7lqbHZM8nCxn
	vkAlUcueqODOJKK78BK5KaqzipbvvwnMCaMMs7lXJuFCg00fv4B12Z3VP4J3Vjx1g8fNC9XfRWp2q
	0bHCGDqVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcFHC-0005sN-Uv; Mon, 09 Nov 2020 22:04:38 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcFHA-0005rQ-A0
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 22:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604959476; x=1636495476;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=VD/3TgT92z0Mvdo0ohstObVh1V+uxd8S0unKwOwngf4=;
 b=mqjOrpYisHIS0drpXpsyEVcnrFSo1d5rpaoZlienMqulTMbTsr1zsYlu
 uIjuyJFglHjXZg5SCvG7ti7H85So8DPtrH2x9eYcO4rbWyKBu/hvfAOhP
 /zM9ygbr9lUE0B8yi0VnneYcBVaXqaxqiuvW2sn44Kf5X+N0/G9NjDpJZ
 jDaAK96FWWXd+FRgVlMfkvZHeoyhf8pKSgFCY8gjvEmPWpTG/IaKT4vDW
 o3EBk7ppUBtJiDxpdGGMppmxe/pYdYDuBaL6VVbEYO17JuqsJBKELkibz
 hBLeuRlrZKniboErBjtdSAqkAeCEWUI2qwe6i+FBztPwfmihnU6OpZZPY w==;
IronPort-SDR: dJdJ66HiJZ24XfwUTFTY0MtpyWncoCQUX6os58dRroDpTA3+/mPu8N/VHGbGBnhCTeq3pZXm2y
 +gYdZ4spwl4eiD4RNuAYzb5PB/5wN/2+9vUYlQPIlcGh9OYv26sF8pkLsLP5iQ4YPC5YgcVMcp
 fSOQKl3EHlnrFbxhjk7f3WTs/9XqcBBFivkIR77NbIdrko2AI1eujPdl0SxHwcGfkr5W0Bp82/
 lw5QaarXWt3+hqAUjtBn4Nwe6PawGfbRI5xiv1lvQtDbFRpn0r89yhZDM3/Ppmnb0wyzFbmqmc
 jpc=
X-IronPort-AV: E=Sophos;i="5.77,464,1596470400"; d="scan'208";a="156702746"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 06:04:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7QJTV/LdhLAkKKFmn3WEhWtz5IeQQtRRK/r2ZCNHwaukTkt3Q+cN4C/sIS3Pn0Oia2trV2c9px5dq4Prd36vhg9SNA7sBE9hpXNzA1qNnbQQ+YJf7W1ukdtNuyjbKmkOhAKgkWxCPamDQVEB3hRyw1107cOkPqlpioX2dPtsDGgCADRQEOb+dneVKgNGefWvJb69A/7wrp4oak45vYy5cxxQC/4+DSlX9psv/v2/YNq7B34jQyLLkzZTBB17bmNgC2unbpUph/pWjikxx9r2sTtaGjA4h5o2GkatF3hE9vh2G+JlnHeTGv5FB+kuiP9dtc4MmygSCSyW7E5BSFK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxzEQ8DxEaDw9PIEtTYQYlKYoyp6eCRaBuMdgiDIEQc=;
 b=YUR4vfJLioYEVh0xiG/66aCufZCklbTAZjbpKKS8rzaLsIgAkOuUzyfBAeCJ7OrtbkPcpXr1sHOwMxK6ma5M+5Y2eEEJRxCjR/wYhGyX3C0Cu+IXt4+NZJT4MSctgIexHFPS4AlgfWgpfVsJc9R+3B6fk2qOyUHoXkkeKqAENoguGdqgk+EbCzrTWtwCdtl3ztPEytHLKumsUZ3k5zLdVzueyOTL7JSKBjEyKxeeuecWk2WpuLCtEV0hGWfhBvHvicD0oi6ZH6CPcFl4L6VqVVwhnmqpcnn0ecL59wgYXbFuIH+Et72kbH+ifSKNinFk6sKuQakOkY9I6orK0TLlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxzEQ8DxEaDw9PIEtTYQYlKYoyp6eCRaBuMdgiDIEQc=;
 b=khPdQbFNMHRGskrDkOn0tv8uNpub1tSPLmHI4AmAqTNHnvaQuadJwBoGxg0dD6j1XLwtW/LBG2YRKUCiL13n8IiWb8vyrOv4pgDX8ETqJeibO+NbH4lCDQe72Q8z5jyj2lXPiJ51r26Ng6+y+5WIk75a0W6C8//PEdQUQNAAiUI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB7071.namprd04.prod.outlook.com (2603:10b6:208:1ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 22:04:31 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 22:04:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 21/32] dt-bindings: Add Kendryte and Canaan vendor prefix
Thread-Topic: [PATCH 21/32] dt-bindings: Add Kendryte and Canaan vendor prefix
Thread-Index: AQHWtN4mKRuAhov4sUaXWKhVt6lq6g==
Date: Mon, 9 Nov 2020 22:04:31 +0000
Message-ID: <BL0PR04MB65141C58E049C324FF0BB27CE7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-22-damien.lemoal@wdc.com>
 <20201109220105.GA1830760@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:89bb:1cde:d92a:2dcb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 75e85513-bcd8-49e9-e27f-08d884fb6f4d
x-ms-traffictypediagnostic: MN2PR04MB7071:
x-microsoft-antispam-prvs: <MN2PR04MB707179A3222B5CE28C07E34FE7EA0@MN2PR04MB7071.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LuJh8fn1HbQ1A1M98y7CJPYMu+Z5HfCzYvc6Tk6EZh/otTzXoVOJ+hUyXjOkmze0P+0D3ROHSRCc2x+2JVLWJ+49/kMY5YQwlyklA5Ft6gUeQ3ZrNQTikASJIMV6eSNcf8rKnAhG9ey4QiHzNam7JrgkAxlJudVTASlzkmEMKqRYvfFXgBmkrDYmyGsdiQ2189U1zZXzTtBq2wy2XEY5AHlRaCVz73ezmkZHVi2p6Lx5JqX1iewO4yfTBkecEhAQwnnwmsLPhT97TgLcT/v+nlwEfMdmzd8z4ijJve0W8BRFZkmADkTaEO8CY7i2Wfxpc1RinFilFe++s+opUkL6xg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(6916009)(8676002)(91956017)(6506007)(8936002)(66446008)(4326008)(7696005)(186003)(53546011)(66556008)(66946007)(76116006)(86362001)(478600001)(64756008)(33656002)(71200400001)(54906003)(316002)(66476007)(7416002)(9686003)(55016002)(83380400001)(2906002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dgU7Y/o610oW6asaB45MjbUvomEFFSLobxf3GMdTjLNdncv4e5k+NWBE+rHI89saf5+coUkDKbd2hGXrJG4cZLU0hpj1YC7cVr0S/PmqhaDIVSLIjtl/gWt+EZ+vRuA95834nDazXeuCAL/lBc05aj77nKmn1RIH9uizXZA3XcYI3lQGMtlYmMsDywqGZyRaHEHI/ed/QzbrUuzPJvBqdcS5UdidZdTTmOIZ+tURu2CB4Bdr6Oz9qxD9rzKW+b2lIK6lVVWNRirasFWUVkRkRyqjaGbpIxl8ZyWJWCkLe+aLReb9ueydALT44BCitrhgMCWTq3yk76PujT8gSUCfDvdmCmW+qzvqKRBGSd0r2luQlWZImvD8FGR9QiqHn1zqdl0TLkYehX2LG9rMYfvqhFlobCeqI145Xwr3zUpgmGM+9wG2d63wBMn1vV16hng7CPdLJwwVzDTjvW7wYvbH+nGHiPqD0Uew2UaeNVV+7mtpjkfyu7jkE7LQelPULyOzZMc9Zo07zt0mTHbAYaFJJUc4803U+Y2g4oJeQ5JAxuGIsvDI7tPXv5UrRwexBuAgDQ0Pv9SWTQrP85mP8O3izfmSJCqxgNTv+O0uIO4WGaxb3dH5KweOIt4NuZ5jq0d4/dsgz9WIvFGyVbT9j3BbcL1KatiaB9xlAkKYAVm3X8x81tW8Di7vgdpPGb5ASdcLJULQIrZ4BG6RwqjBzyK+pQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e85513-bcd8-49e9-e27f-08d884fb6f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 22:04:31.0663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/sno/pW07BMfhstrdbgAK7m3rfxmgYwYQusavzILMPUCUHHbGYoy6dzMgKTrtxGfN60aJemd05r8zgtzTpkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_170436_513726_F6E8A45C 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/10 7:01, Rob Herring wrote:
> On Sat, Nov 07, 2020 at 05:14:09PM +0900, Damien Le Moal wrote:
>> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to include
>> "Kendryte" and "canaan" as a vendor prefix for "Canaan Inc."
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 2735be1a8470..f53d4d8e7f2a 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -179,6 +179,8 @@ patternProperties:
>>      description: CALAO Systems SAS
>>    "^calxeda,.*":
>>      description: Calxeda
>> +  "^canaan,.*":
>> +    description: Canaan, Inc.
>>    "^caninos,.*":
>>      description: Caninos Loucos Program
>>    "^capella,.*":
>> @@ -537,6 +539,8 @@ patternProperties:
>>      description: Ka-Ro electronics GmbH
>>    "^keithkoep,.*":
>>      description: Keith & Koep GmbH
>> +  "^kendryte,.*":
> 
> AFAICT, this is a marketing name for a series of SoCs? That's not a 
> vendor.

Correct. Sean pointed this out to me already. The vendor is "Canaan".
I will change in V2 all compatible strings to have the proper format starting
with the vendor, e.g. "canaan,kendryte-k210-..." or may be more simply "canaan,
k210-...".

> 
>> +    description: Canaan, Inc.
>>    "^keymile,.*":
>>      description: Keymile GmbH
>>    "^khadas,.*":
>> -- 
>> 2.28.0
>>
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
