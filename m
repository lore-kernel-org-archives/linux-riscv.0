Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAEAC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 00:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8510E23A9D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 00:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8510E23A9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=kwJD5NICUNr2gQiIRUZclR/CXCO7ayVXt/RIWf0WXvI=; b=X9yyY/1w+RCJBAXbn1+l32qDQ
	KTbn7XSlR2nxsmCfI+zm6V3dE6vMn1/ed2urVIEQpoO6y3eqDJ8U+Iixdlyf6pQ4JoKYFBzoerpsj
	WEA1PF8SmefYJy1G/uCgvQPsPP6wdrbHPogRl5nhU+pYS68TgBH0moo3nTMdaP+uqKBCan1ZpqQKa
	gLZiJ8UaSJpls/wuuuCARDZdVbOZUVnfVTQrh/6k1YNwo3u/6Ka2dzaTTulWCZnv9zL8DSQfGH7Iq
	h9VejhKjljR86pm5cbD08O1GzOXpla18IMN/a/VwU/Zx47PEuJFuOXbBhFr7nHQVjDL0VotjR/tRM
	GRqDS74sQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0D3O-00019r-EG; Fri, 15 Jan 2021 00:33:26 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0D3J-00018t-TJ
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 00:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610670801; x=1642206801;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=YwfoWqkXXMEMJn5En745BfP970xGbKepPZj0k8C6+XI=;
 b=cCwnUfZ7izaN4zVPJqIECepyOKsRzZA8+pWYt4A1B4HZGRgCyq6P5plD
 0FV+crsTjqnqGnLfrkZGEzxryY1TSOVRmKkzXUWwruFz7CLi5EBWBXxnb
 mWf9vqbWGvJXy8DW1v/ErqyLBsy7m3YloQLV4Dm9JInt7D3UYDNwp9ceX
 kPF8SKslKzTL7mqc0PaNmNG+zPA945fWlbTbIuq/kLOrsTXLza5GWTyem
 Q7OGX2fNw6owj0gTTiRsf7ooopLMyCTUYjPTAugcE1BvcMUREjjLalV2d
 0qeh2RCcQXPXXEDTAtr2yLjdgVlUyDI61Y888CdCDtyGb1Sl3CIfuDN7Q A==;
IronPort-SDR: o7F8+xGeJC5GMk7dFiPgc2zNRWp1+aW83Y5aZBJlE9Qcvj+piCd8Hq6JAyMv7Rqli4WwcH/Jrd
 EvKIMqUVfcMPUiPWgVhNSMeAbtTrsx8+WTJ8QqcEWV6I3J7hJs5wqVJgOZBcKlOo1nmjuXYrSY
 FbPR7Nh+1LX+A5r0JinRw9Gyj4vqcdBZWyojf8JyIK08Luky8itTkjlnmpPxvm41KC8+Tq+BOs
 qXFTowli/3GMZfTxe6wSYXUeB48YJWcQCgMiAXkYZ9t86JOc9stmFbmeC8ZlKh3m37kmwk+wvC
 2UI=
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; d="scan'208";a="161900608"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 08:33:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eV2OQp0CEvKhW+EChfUV16aDm+RcMzFk/pn/d0bFpbJ/11qA4TFf/NKnZOu39zkYIWpM6xHc179cKdOsWAiZmKuDwJMvKh1wXVLJ/WR+fvAwfF/JlKn+1vHWE2jVuu8d7YL0DhArtxDd1joN2WMT35xwI5cEiiU8/4M0t0LQsHojsuSE9HIWFeFj5TTB2lWd4/+fAK+R8Up9So4ZpbuMmr/HM344MtW3GoX9a5kJ8b+F6R7D0TqaZBUD8bjzO8E/s1RKIX+aifknRGJFPDOUZ63lzHpu736ZghmTs5a5pvKN+l0I0Q6w9c2LwrhG7LXCKZKKuJk1HLWdlA3PyzBQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcSEAfZZeKpX7w9dV0Z+XBwymwW6IowJDnL5/g/KN90=;
 b=iYMVYdB0ZmbeqIEZqX56ag/JW6+TSCXaofm0fYpBQDdFArmG/rqarDT/bz8zS4y9eyOOrSciWPf0sXxEwEoP1/X3GvV5gBqc7q0Y5geRxYwl2JgVpVnRlvY1dTB/PdfYmN3u5NhziLsV3G7+2Ca9YS5kzZucGWm5AguGXn30YWQCG2XmiXJ+eMx6UE6M9Sx0dfTaWZpM8g7VZ3fud7uzG16/OJyqJthDEktLmPSayU4VYHrEEuWoDyeFcxSeehVpoLRltnSy6IOpE4XHaRF5kd18FxczFfguOWf+xlWdY+LgRoTrFqC0HtGJU4++D3YBEYtp7k7vpQAL9tcdjpANyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcSEAfZZeKpX7w9dV0Z+XBwymwW6IowJDnL5/g/KN90=;
 b=aDKXMHv8cmufmWWEUj6e8HoRpltqlQ7/7hC49tXJTrTrFElcL/z9hOJ+N+QkwWj5heGdI9upgVuitNI2SAtLWBaZUKw56rDcQZSQUdgmycpCrEhFsP1kF3zS0rFi/LfkCWrU/sE8GQ/8H9AWAvCDDrbP+KHL0Fbz32ZpgOWUcEQ=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4738.namprd04.prod.outlook.com (2603:10b6:208:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 00:33:15 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 00:33:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Topic: [PATCH v11 03/10] riscv: Update Canaan Kendryte K210 device tree
Thread-Index: AQHW6H4ffzJIz+L53U2eOGwbaV2KdQ==
Date: Fri, 15 Jan 2021 00:33:15 +0000
Message-ID: <BL0PR04MB651404813AAFE779EB2972A6E7A70@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <mhng-b30be63a-5293-4d18-85cb-fb2c62b3188e@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8c78:be0:63f5:4b05]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d76f938-c8ee-4dd5-f850-08d8b8ed25b0
x-ms-traffictypediagnostic: BL0PR04MB4738:
x-microsoft-antispam-prvs: <BL0PR04MB47384276CF4C668AEBA21AF6E7A70@BL0PR04MB4738.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y3K0oRbnhzp9GUw5KyVRXMg1lsM1poZCceTDj3RBQxWAGFdLmCS3hREmWCMZHblrR39ToiRdIYcLFf2GMc0uW9DkiKRPOsGeKJWJzT+NBdfMbBZ/zT9+UHVq4EQ8e3xt+NOW4ZRxMarTtIpbO2oXdZ0pixRp+KVqK63vAwjyb7Lg59UaTwA3J8ccBbonxkJMyeswWrrv/MQqPh1OhhdGePmuejJwzPZ9FsTJZpskp+8Y82IhQyJOWZNR6wrE+usKRwAWQcH4GAtw74nVCqN6n64jZ04JK2nloSvpD8HNjluoKwYX1gepHBRUAQtEMC3P6EmdXmTnN+A1I4f06faCv1mXyXId3YyPC2KPC+7fad7Oos5sDRVTrDyObLpXAlIkyrxnSXzhEUnyk+7gaJqJtrNldYhwv9aEeoNGOsrVsd9owAzyj/wSV+p+JEr23vG4V3upd+MvSoRmpKXQx2SXPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(478600001)(7696005)(6916009)(966005)(66556008)(66476007)(64756008)(91956017)(4326008)(66946007)(83380400001)(76116006)(316002)(54906003)(9686003)(66446008)(52536014)(55016002)(8936002)(8676002)(53546011)(6506007)(86362001)(71200400001)(15650500001)(186003)(2906002)(33656002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sLWuohRpuzOLv4W4qmxoeOzReBKloSQSV5FtYlO5VkgBWVXJWIkRbQFm1/48?=
 =?us-ascii?Q?oWg1PXvfuG08lEPyeWKFNI/VuFkmgMKrShGiiAHTKudCLSuoJ14ajb5pd+6x?=
 =?us-ascii?Q?Kikf0/OXhtv9Dsttnot1e9rZoPmd9yEBanH9KEvlro3+UWadqVC5rHHOlRWx?=
 =?us-ascii?Q?Ayg6QBV8CBeVLdp45qceY7FfwddSTlMF3aF6N7h2D2HMM68y/0voeWmWlihH?=
 =?us-ascii?Q?BFyc3/9UXloqydrVqDGOShe0GYDuIP2WKoRL4TtwHnEMFUZhIAHMmKTZT0OL?=
 =?us-ascii?Q?IN58GjleDuZM2lbB4trPu79MZLDQV+vry56mwB9+4iJsNnQYIjDMWeDadkZ/?=
 =?us-ascii?Q?WCaacwR+wxM+kgI5GJ4dKtjChYzGMl0z9E5uNNfmt8LAW/GjZiwlAFy0bMwX?=
 =?us-ascii?Q?qtDGPsBcQuxXmSJ27UoPPdf6ILedumb6hcnqvNTZ/DPeZrkeJbrR62VHejXi?=
 =?us-ascii?Q?PxN8T9px/glTvuL6WVueNPYH9gjOGRmmQPo9iFmDI5tqItBohhQqRt2pNrgL?=
 =?us-ascii?Q?la1816Ry6MI5nWp8i1ZGDH9iO1rw2S4iFaz5PNgrzW/MnGoiDcsyx27smHQV?=
 =?us-ascii?Q?4NOFEc85fQ5NUWPkHV1ky50Zb6k+ZNI0L8d1W4HPdQelGifOQK6/f/4kVAU3?=
 =?us-ascii?Q?pyxrnaOQxIz7+f4++wUgk1zihFaMVC/a1g+kphKQ/OZzXm2Zos30Ll82w0Ic?=
 =?us-ascii?Q?nERpJVqin/W69cI4vLk8RRPgGX5RHq2vJGDMbytIXgDSfxYnWAahxCv5jpzC?=
 =?us-ascii?Q?1pbYn3yZMogAMIckezFtypxcDmuWvoYU+I3+6ul9J0cbQswPpC3MF9s+bXXw?=
 =?us-ascii?Q?VzeVEsygvE1WvUAv1R4R+lEUlgTqd6mUrqH75gy1dzfD9l6LCY+dyzMz2zlR?=
 =?us-ascii?Q?xp2/QoadG+bFrkklYbchyD4N/tkteD7QK2Dsq60xKRm9qNNSG3dyQB14kygm?=
 =?us-ascii?Q?AdVtNCjLdjZ8o3q+n/D1lXMb9Alf1U5kXQAJnRdZC2Ih4uQFOjv3t3jTR2Oq?=
 =?us-ascii?Q?cf4H0T6nRwM5CQtLWg9RPTOSSMRXBgTxKtzHoAq7M3lm6j1qQ39MxlgujRCW?=
 =?us-ascii?Q?EA9WKB+g?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d76f938-c8ee-4dd5-f850-08d8b8ed25b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 00:33:15.0626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8Xg2DOYqLMaMUCHb9pfYGKC07h7n/u/HvYMPkdmeM/TyBbp+GJ3nDCbZbf4YsxUhLFTUUUi8LHj8TESBMSO6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_193322_241364_30362C6D 
X-CRM114-Status: GOOD (  21.08  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/15 8:32, Palmer Dabbelt wrote:
> On Mon, 11 Jan 2021 16:58:41 PST (-0800), Damien Le Moal wrote:
>> Update the Canaan Kendryte K210 base device tree k210.dtsi to define
>> all peripherals of the SoC, their clocks and reset lines. The device
>> tree file k210.dts is renamed to k210_generic.dts and becomes the
>> default value selection of the SOC_CANAAN_K210_DTB_BUILTIN_SOURCE
>> configuration option. No device beside the serial console is defined by
>> this device tree. This makes this generic device tree suitable for use
>> with a builtin initramfs with all known K210 based boards.
>>
>> These changes result in the K210_CLK_ACLK clock ID to be unused and
>> removed from the dt-bindings k210-clk.h header file.
>>
>> Most updates to the k210.dtsi file come from Sean Anderson's work on
>> U-Boot support for the K210.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> ---
>>  arch/riscv/Kconfig.socs                     |   2 +-
>>  arch/riscv/boot/dts/canaan/k210.dts         |  23 -
>>  arch/riscv/boot/dts/canaan/k210.dtsi        | 551 +++++++++++++++++++-
>>  arch/riscv/boot/dts/canaan/k210_generic.dts |  46 ++
>>  include/dt-bindings/clock/k210-clk.h        |   1 -
>>  5 files changed, 573 insertions(+), 50 deletions(-)
>>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
> 
> [Snipping this to the relevant bits, in case you missed it before.]
> 
>> @@ -81,40 +107,515 @@ in0: oscillator {
>>  	soc {
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>> -		compatible = "kendryte,k210-soc", "simple-bus";
>> +		compatible = "canaan,k210-soc", "simple-bus";
>>  		ranges;
>>  		interrupt-parent = <&plic0>;
>>
>> -		sysctl: sysctl@50440000 {
>> -			compatible = "kendryte,k210-sysctl", "simple-mfd";
>> -			reg = <0x50440000 0x1000>;
>> -			#clock-cells = <1>;
>> +		debug0: debug@0 {
>> +			compatible = "canaan,k210-debug", "riscv,debug";
> 
> I'm still getting lots of warnings about undocumented DT compatible strings
> from checpatch.  Some of them might be in flight, but I don't see many of them
> (including both of these debug ones) having been defined anywhere.  We went
> through a whole process to sort out the SiFive DT naming conventions, I don't
> want to just circumvent that for the Canaan stuff by merging it as-is.
> 

As mentioned in my previous reply about this, I am aware of the warnings and I
am ignoring them. The reason is that I really would like to keep the DTs as-is,
describing all pieces of the SoC, even the nodes that do not have Linux support
yet. Doing so, we end up with what amounts to the best public documentation ever
 for this SoC and the boards as what is available publicly from the SoC and
boards vendors is not great (that is an understatement). All this information
was extracted from the Kendryte SDK and from board design CAD prints (available
from https://dl.sipeed.com/MAIX). Sean did most of that for the MAIX Bit board
and I added other boards and some corrections. I really do not wish anybody to
have to do this again to figure out the memory mapping, clocks, reset lines, and
pinctrl mapping. That was hard and painful.

Having these unsupported DT nodes around will also allow us to point to them for
people who want to start getting involved with risc-v & Linux and want a project
to start with. I see these boards as cheap hardware for hobbyist and educational
tools rather than production hardware. I am having a blast building a biped
walking robot with a MAIX Bit as the controller right now...

So unless you keep insisting, I would like to keep the DTs as they are. The
naming convention of all nodes in the DT is fine and follows the
"vendor,soc-function" pattern. All unsupported nodes are also marked with
"status = disabled;" so they do not cause any problem.

Thoughts ?

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
