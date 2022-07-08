Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF4CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9sRSDxjO/MixeLp44w9bMdQAFDpk5X9omU99zDptkQ=; b=JAqfXwipNpHlrV
	+qdn4+Wzi4AoZdFdp2SHbCJhXY2+BEHI7oUnhfy/dnYFwZXLJ6Yl3MGk1jPNUTlDnoWu8noDFFcwZ
	5q+LX3sw/m/zVSzjwPVRsxtaYniO1+F/zvwFsVc+lbjYvkh/xAdeLy53qK0atUyw4yEeZvykJY2lT
	VJhgFa8qjOHpjEzMQhH+RY/2KBqAstOot1p04l948YyP6lnb5tE2e2xMy23PuLAvZjUfxD7nrkVEI
	XrlILS06XdYNeMLaQ8/G3wr86fAB45O3nLbCpoBebe39Vy8XRAOWmbv1kkFSRacUibqycpltY8MKQ
	V2v8Vq2HXiFNgALWFaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9urB-005sE5-W0; Fri, 08 Jul 2022 20:45:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ur8-005sCx-5t; Fri, 08 Jul 2022 20:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657313143; x=1688849143;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VgO9MaUxmijwbj4ErfoEx1eZxF4iJcn2sE5GRcKqBic=;
  b=c3BKwlxLOewqMwulhOlMWHGeCJaIPS2sIecFC3HW+zDnMn04xtVtJWFR
   2Dc+Twad5FUGsKPqnP8kuVk0S1bL0ipbBa9tXGbPDTt6drieWAsrio9IO
   tp81JM3RZxGXgqRbBJ+zXhUt8Cp2a5ZvegFRL+tQY/oEspViSVnHTgG+/
   RKVwX8LWXvP0cTESby7iOb9FzwIOXJ+E6ms1x7XDiExX5pxU6jMNBnfvp
   dbtumSrdMjS1zX+xRFznEw1/lXdzvK9rPmFP29Tq+ZNU2i7Dtigw0H9a2
   XJx7jkgEK5n41gnpXvrf3wGz2I4Q6S8MAkKJXsMStIYW/n3v+tQe5I0Te
   A==;
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="171385617"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 13:45:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 13:45:37 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 13:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8KNlDc3cV0DLywCiVyl/SyfKCyx3S8+IcSaANy8uFecpMdFhEviZA05348HsrpenXIr9H3RH0L27MdBbswBw1wiR1hp2k3lNr8A1dYU1gMzfbfz1tt38IjHQBLD/m9c0ZcdyBDF+DdN4mmg3kLUclmkUiYllp0CxEz3RSELzUnDetsax/KIHMIzUuM4sxqvMwsC8Wzq+eS7k5RhkmP1mFoIZ5E+S5PAqo4H3mqEFzH9Z2DAxhZz/0ziNWkwK7fI3S8vWw76LhuggpnBZySrA3oRGGk0DN6gTf7DxkSMx/NY24+g7Jh0mslCjBsvfRVjoz8plZW9ugXNIra4NAeYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgO9MaUxmijwbj4ErfoEx1eZxF4iJcn2sE5GRcKqBic=;
 b=TVc3/IN4LELeqzIzUo/M+mwpKfvvK7Bz9gdawgINKQuTpUnefMDB+v1VwCTb4cRUMZIFtJIUDdUU3iafxcvAtoEoM5uk6Bqid19avLX2eaMf6ZfAGLXrmLJyq348Gyx12JtMUyrmTzQi8+pPhTEG/rtIqe7C1/lxY4I6EHX3BdzJtLH0oSWdPYes6taVX7SfamtEjcTJ3PGmKhlZQLLdStZOjLuqvex1W0ruH7hQ13U+f91gLJw9YmOl2ViUY2nXSuAxih0PPGNVgGbrMVG188/E0FfiQqJvIiCfu8a6DYOq+71e0i/45awEUDbHD+lu714urm62Dhlh7O2usryjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgO9MaUxmijwbj4ErfoEx1eZxF4iJcn2sE5GRcKqBic=;
 b=OoBAr6sP3QvKIwgHlbTm7QfOE6RvUCPsSdcz4hEVAakCGB01+Pryz2CL0ZHo2UrEIsDjtIboTJ0qYgfd3FOjyRzUn7E8zVFSYCifvTVgQbi+0z5lAkLZJB3KJZ2cStlCmP68QEwwhp+zBfco6pc4TuCTCrg6+RzISmNwrs8drjE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1519.namprd11.prod.outlook.com (2603:10b6:301:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 20:45:31 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 20:45:31 +0000
From: <Conor.Dooley@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <sudeep.holla@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>
CC: <Daire.McNamara@microchip.com>, <Conor.Dooley@microchip.com>,
	<niklas.cassel@wdc.com>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <zong.li@sifive.com>, <kernel@esmil.dk>,
	<hahnjo@hahnjo.de>, <guoren@kernel.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <heiko@sntech.de>, <philipp.tomsich@vrull.eu>,
	<robh@kernel.org>, <maz@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Thread-Topic: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Thread-Index: AQHYkwoSKn1B1/DCVEW+Ox2TaLu0fa108T4A
Date: Fri, 8 Jul 2022 20:45:31 +0000
Message-ID: <fb8534d9-baaa-2643-5119-602dfa5de758@microchip.com>
References: <20220708203342.256459-1-mail@conchuod.ie>
 <20220708203342.256459-2-mail@conchuod.ie>
In-Reply-To: <20220708203342.256459-2-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca800dab-611c-4873-9161-08da6122cc6c
x-ms-traffictypediagnostic: MWHPR11MB1519:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TY8PiGtaQ8s6C2Abq7oQ4aPuWpz5FXnxc1pURFpKbcAIWIEBclBKTBABgYPAGdAQ1w1FnF/b99c4d59S1m1+HtXcHAr7gWcabb8UX6BpCO0XWy1e4d8/yCGMuTNBJRDwBWRruYHDioa5/Nwe133ilOkJC4Z7+Gz87A1hZtaWPSpu8+2OBrYn/BOoGURAwuNTVPL/rAA8mTJl8AtxzkOCvbKL8fcOfGKFd9gFsq/oEPU1MNUibvFSGGGzzYmPKQyNwbH5vKVoM6ZizWHAJJlLpDxweUYcnqvbyFFLVxeJy6zDbY+bsjYx75bRkVsjEqufSk2F1iAFitZaNdG49kX99kTIfWBzUs2zTj9ucYVWI5FXFiAzudWQypsaxdx4d4el/UQrTZZTodSFUs+/nc/CwHMZTgeJKKTYv6X4S3YZ/QvCXNxOh6K/sXAfhRCWx0ms9uFLk+OkkHHRtpBaeXA0BUF+41OFY2K7UEUHx/nyA4tY+2kdSa5rg+VVqTB8okoUQ8ylBlDYZNaoWcNBHDOE8ZhmOwz7wIFXG0KXoeAD4rLhMAN360zP5iDGPb51md8azde+wTEMb5QOA0b8m/Zyo1e5pKA3bhCQluGL+vijZ1kxgpMNNxhJwPBzemt5I8EVDMW1Z9Y0+VL2YLAzOUKpskaVRY5VXP0u/U4Q5vjZCbH1TG+PxssU+aN8UbhptIx/+z/Xhz+rtCEilqT2Dxan0AuoBcoHVJWR/xkLDcYzOXcRTwPECfriLvDJGwaMyL7sbnDBRQtleKzSa1/2LBnY5wH7ftknWm9lvmYLSWrD7z2jxq1XL3Z0G0/Xl+F73rJZEL9HU3KoKsD+z+QQznDQUhsgKLj0Lu2ssPBM0O8WNJ8HdXPnUepjxxPC1N5l+sfG8BpoVDtfL1L66sv6nNSD6QvFu7RrGhyI8dtCaTyelJk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(39860400002)(396003)(136003)(8936002)(7416002)(5660300002)(31686004)(110136005)(83380400001)(2906002)(41300700001)(6486002)(966005)(36756003)(71200400001)(64756008)(4326008)(76116006)(54906003)(316002)(8676002)(478600001)(66946007)(66446008)(66476007)(91956017)(66556008)(53546011)(6506007)(2616005)(6512007)(26005)(186003)(38070700005)(122000001)(31696002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXVSNnN5T1VaSEkvMUhkVEYvdmdBYm9HL0xSQVBHQWxEaUFsU3F0dWg1cXlm?=
 =?utf-8?B?Tm9oZ2FkL3RFTVFQSnUxTDlrR2dhajFtK21ST0FieHd3UEhoRWVSLzd5dzdW?=
 =?utf-8?B?WFFsRUhSeG1TbFEydnBYejdvcXUyb2RvdjZpL1dCUGpobEVkQzAraVlQZ0hD?=
 =?utf-8?B?NnVzbStKdFZMZXhCUzdoYngraUJsZ05rb0xZWmNMR2FiYjFMaS8rTUQ5T09B?=
 =?utf-8?B?djM4RDdKNllMdHdpY0l3d1hSRFdady9UdEJYbVlTSjBWaktnSkc3Q0tURnc0?=
 =?utf-8?B?S3lFbTZJakN2Y09ibDdqQkt5SkZzMXZ4d01EYURVWThYblVMUjJQZFFmak5r?=
 =?utf-8?B?SEFXY2d2SjdDaG0wbnBBV0xiSDhUeEZyejVhc3hhVEZUQi9icTRaR2ovd3or?=
 =?utf-8?B?QXNSK3BuQzFlaVFyd1FZdDE4QXF5SGFkR3FYekhhUjl4TEdnbnBDbzRsbVJD?=
 =?utf-8?B?NDNRVHVlY0NiSHlHRVdYZXVIK3RjcUZvZWJLVnJNS0EvNURRaXAyczZrMTRl?=
 =?utf-8?B?RWJYWW1DaDlKZ0psTytYL2ZqckFQT0VpZFNSUnY0amRGZ1FTdmtNTmVSd0RU?=
 =?utf-8?B?dkZtaHBZSjBwRE9NQndHUzZiZi9QQUdmRVdST0xRK3JvMng0djJxd05PdVhi?=
 =?utf-8?B?TmxBL3ZLNmxkbjdzZDAzQTZJbHNMRXZncWlUbG9xVmNxa3NyS1JxRkp2eExE?=
 =?utf-8?B?bnZ5Y01FSS9jTlZGUHBNcnhtc1VmRytJSURkNWk2Ynowbk1TRjBHSlhGak5S?=
 =?utf-8?B?aE1VY0FVSGFQeno2TE5XYVlHOXJCek5pWDZQcTFSZDFNeWI5L0h0RlJpT2ZS?=
 =?utf-8?B?bGJmRmgzcVNPRDlZMzY3WEJQZlJhODA0cHVrbU96dFRCYVNVd3dvcGZpTG5F?=
 =?utf-8?B?RzRMOGp3Vkk0T2pVRmpYdnVIWTlXbFNMRGxESGJ1WnZkY0Z1ZkdtRzZNRUp2?=
 =?utf-8?B?azlvcVZkNUVoN3ZtUm1Fa3VQc0thcDNjMkovTDNpWnhKbmdQQ29mamt0cmhz?=
 =?utf-8?B?U1U4TDEwU1FPS2c2elZuNkFJd0U0dFFWbUozTFltNWxTNkdPZzQvSGtUR0ZY?=
 =?utf-8?B?clhteWQ2NmJYV1pGTXpXdkVzRkY1dGdaZGVsK3dVZldlVGhZRzArN1NuSmg1?=
 =?utf-8?B?bStjaG1FQ2xrVUl2MTZqWWZhYS9XVVVkVG05YzluVVY1dTk4SzBITi8xSGdm?=
 =?utf-8?B?QmJUMng5VElEZVpQSW5JVE5nYnhhQW9aVHFFb1BWQnAwVFRqZEVqeXZvaklM?=
 =?utf-8?B?S0U2Wlozc1JBcTM2YTRpSzdNQktyb2ZxV2pkQmwwWSswRElHY3lDb1hCYTdo?=
 =?utf-8?B?UmtCYjZnTEZtaEJXdWMrZkVyTjVtLytUdnRpWWRMTmI0TGd1ZHNQZjF3L01R?=
 =?utf-8?B?M3RTd3lzT1BVYmsxNDgrbGljd04yaG1pdUN0Mi9rb0JQQ0xxSFphOTREWWRw?=
 =?utf-8?B?eEpNbUVYTzZsSjJXQ3lIUXlxa0JrcDY4MXdMbVhPQmdzd3oxQWs5RWlpYXJJ?=
 =?utf-8?B?anJuYzFDUnRiZXkvYTc4WUZqMkU5WHhUOGQ3RThCd1dWdnoxWkxQUERJcVU3?=
 =?utf-8?B?MEVNcUtZL25ZSFA1ZW4xc1JRRXQzSG4wT1E0UWx3YXZzMmtaOUw4aDJ4L01M?=
 =?utf-8?B?V0hHYXhlS01mU2h6M0Jtdytiak5Ic095Wk85Ykkvc2s5dDFsUmlpYi9scFpQ?=
 =?utf-8?B?eHdLbEhIR2Z2RWRNUFdPdEprZVQyNm4rUXM2eVlyYWxSZVovQjdkbUx4cG9t?=
 =?utf-8?B?YWMxTTlub3N5VnIzQlloNlQ0WXdhcVl4YnArOTRlWHMyUHZCRUZHZlVSTzRr?=
 =?utf-8?B?a2dXbmlkZ0cxMjRGYUVMeStTYXZZNFllR2pwM0lUZCtYUlZCVEtCYVF1WXVa?=
 =?utf-8?B?T1JPSHRrSlFWam9IVHB5UU1yRTNSTlFVWVZUa3hDSXZDYjhabzNnWVhjUGQ3?=
 =?utf-8?B?SHZIaWZCZUkrMU9XMVBURGU1QTlUdWRBS0U3UmxwL1RXdzVVcUY1bFV0dnhy?=
 =?utf-8?B?NGJCMmpLZ1J4TFZHMVBIa0VuS296TzJqRHd1Y09IVVltNjNKb0dxTG9ybTBv?=
 =?utf-8?B?aTRLMGg5aVZnTG81d2FJUndxbHVJZ2VNUDVZUklwS0lwWWo1UnBIQnMyRnZt?=
 =?utf-8?B?SHYxS1BIb1p1cDRIbUdRL2syQ29pdXZuSEdLMFhKU1EwYmp0UUpQeldwSnRO?=
 =?utf-8?B?WFE9PQ==?=
Content-ID: <1E0A007B1AF02943BB1FE137E7D9B999@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca800dab-611c-4873-9161-08da6122cc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 20:45:31.2640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHzoHLkqYccOJtnsbGFvm9vHIWLIVEsohP/zBzF6ZEqGfk5onbbbqMyzWpZ6uGRk/bPJ55z0wH6c/xr5DpnaLlVIxqXWsi/zlFl5opc2udk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_134542_304069_93CF8457 
X-CRM114-Status: GOOD (  27.93  )
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



On 08/07/2022 21:33, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> arm64's method of defining a default cpu topology requires only minimal
> changes to apply to RISC-V also. The current arm64 implementation exits
> early in a uniprocessor configuration by reading MPIDR & claiming that
> uniprocessor can rely on the default values.
> 
> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> topology: Stop using MPIDR for topology information")', because the
> current code just assigns default values for multiprocessor systems.
> 
> With the MPIDR references removed, store_cpu_topolgy() can be moved to
> the common arch_topology code.
> 
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/arm64/kernel/topology.c | 40 ------------------------------------
>  drivers/base/arch_topology.c | 19 +++++++++++++++++
>  2 files changed, 19 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 869ffc4d4484..7889a00f5487 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -22,46 +22,6 @@
>  #include <asm/cputype.h>
>  #include <asm/topology.h>
>  
> -void store_cpu_topology(unsigned int cpuid)
> -{
> -	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> -	u64 mpidr;
> -
> -	if (cpuid_topo->package_id != -1)
> -		goto topology_populated;
> -
> -	mpidr = read_cpuid_mpidr();
> -
> -	/* Uniprocessor systems can rely on default topology values */
> -	if (mpidr & MPIDR_UP_BITMASK)
> -		return;
> -
> -	/*
> -	 * This would be the place to create cpu topology based on MPIDR.
> -	 *
> -	 * However, it cannot be trusted to depict the actual topology; some
> -	 * pieces of the architecture enforce an artificial cap on Aff0 values
> -	 * (e.g. GICv3's ICC_SGI1R_EL1 limits it to 15), leading to an
> -	 * artificial cycling of Aff1, Aff2 and Aff3 values. IOW, these end up
> -	 * having absolutely no relationship to the actual underlying system
> -	 * topology, and cannot be reasonably used as core / package ID.
> -	 *
> -	 * If the MT bit is set, Aff0 *could* be used to define a thread ID, but
> -	 * we still wouldn't be able to obtain a sane core ID. This means we
> -	 * need to entirely ignore MPIDR for any topology deduction.
> -	 */
> -	cpuid_topo->thread_id  = -1;
> -	cpuid_topo->core_id    = cpuid;
> -	cpuid_topo->package_id = cpu_to_node(cpuid);
> -
> -	pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
> -		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> -		 cpuid_topo->thread_id, mpidr);
> -
> -topology_populated:
> -	update_siblings_masks(cpuid);
> -}
> -
>  #ifdef CONFIG_ACPI
>  static bool __init acpi_cpu_is_threaded(int cpu)
>  {
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 441e14ac33a4..07e84c6ac5c2 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
>  	}
>  }
>  
> +void __weak store_cpu_topology(unsigned int cpuid)

Ahh crap, I forgot to remove the __weak.
I won't immediately respin since it is minor. I've pushed it (without
the __weak) to https://git.kernel.org/conor/h/arch-topo so it'll get
the lkp coverage.

Thanks,
Conor.

> +{
> +	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> +
> +	if (cpuid_topo->package_id != -1)
> +		goto topology_populated;
> +
> +	cpuid_topo->thread_id = -1;
> +	cpuid_topo->core_id = cpuid;
> +	cpuid_topo->package_id = cpu_to_node(cpuid);
> +
> +	pr_debug("CPU%u: package %d core %d thread %d\n",
> +		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> +		 cpuid_topo->thread_id);
> +
> +topology_populated:
> +	update_siblings_masks(cpuid);
> +}
> +
>  static void clear_cpu_topology(int cpu)
>  {
>  	struct cpu_topology *cpu_topo = &cpu_topology[cpu];
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
