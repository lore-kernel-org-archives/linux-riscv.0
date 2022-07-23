Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4377DC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jul 2022 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vfHyy7f9RBhhDp1CyX+jXeUuHe3oXCNBPfRwcmEePk=; b=xE0ma4v4T6u36r
	JO0t0aQPxocT3b9GMalpRmax8ODRNgLvOJ1r3Vuj/bjwJ43OXYMPJjsDqRV+lWI4t7AYf3nAmPNm6
	QiyYpWHnyOLiyXZlvGmsLPhytLNyFaE2RAF9elY/uFEXa/2CtURJlR6Ci2DIkEH0SER1NzdTBkeIp
	yS3huphKszPYk4NNurBYQdAO2CPNG793sDJZNq7xbz/SOTywDsdJy1Ich5qAm+8XLKHDaGKq/HdVf
	5nvf3+H4LThD/1dWQcUtGQwC6VqVkDr1/rQxrSJattEM2ROogI2CQyNQF7km/4DFYv/rUTL0znVja
	iuEarfZDnxt9tixFH2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFDD4-0024dU-AY; Sat, 23 Jul 2022 11:22:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFDD0-0024Rw-Oh; Sat, 23 Jul 2022 11:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658575330; x=1690111330;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RWBJ/yRKSSe/VTxpK5BDsfaolB5mxrTy3U590x55QlU=;
  b=U60VHAAVwlGnuW1w+ojIG28mHCyUWhUxDoywQ+0k8+aw/KWm1Ge5SjIQ
   qvm90MM215rA2HeQmd7/vgxPEfhRZTr1M7JirUMOBgg0LYJTBVhKWLOzq
   EqEtSYQTul8FLKXa7fT2ZysuU19Ff015IVTeYQebMB71zgx1y4Qa9hb+T
   UasIEO3wK2p5v2s/7vxXKiwJyR7ffPDNn8/OhxXY1AAvm61nES76GsPLQ
   EP0O70PbjjG1evCtgsMtuOY/fHWsYZhUI82Bu9GLL2z+MNAg4FUTZhhzf
   7FN59/RTD5IIhTvcNd2F2IWOlp30q/0rYiEdmQiKI6JqYb50jIydPZtA6
   w==;
X-IronPort-AV: E=Sophos;i="5.93,188,1654585200"; 
   d="scan'208";a="183448109"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jul 2022 04:22:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 23 Jul 2022 04:22:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sat, 23 Jul 2022 04:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTezOVbuSg9JLKDPatMN1t9iiboPIqU/vfgtg60BW1K+jGsIDUm+3RPDxFbW+pEGmPCTc+ZfdITP8LpQfWU5Th7soYvu8IYPWRR3k7LRlnCvG7L8fPWBL/0AcZVhGSjCKaPg5aMHzBBruuV7v29ClTJbUSJLo56FopPaZAq3gY9ObfUgdABRUtkPOvYFPIS2eoh6ymttfmUP24qJYHMavWidYsPIQoUS/ysAwkRX1xwiaTHI06DvtPKhLi0eXDbk/CKLrJhCw7/NGueQy/9qzYD35CtIrBdbA5m9Hyqob8VglKITRh84MVWaL37hcO+5ZOg2iZk1cSsyhD4aAaSSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWBJ/yRKSSe/VTxpK5BDsfaolB5mxrTy3U590x55QlU=;
 b=UF65GkTSk+t3x3cTw/YqPZSUat6q/zL+1qd/VPtukm7wXOugL+b/kvZd8ck2VAPQm71P0yMvcbHYItgXAvNx89z+olfveTrIykcwPPoz3D10m0KWqlKbV8SovImTpNlTZXZSOLe4uY1na3Ahd/XfYcaUMF0lyu7lKtQKgq5EVNcvhdJbeb+LXsiA3ce15FHuHSwMQNSacGEfyAdtMyZ4jw0ycPEydH011UHjrfMF1lYs51OZv6Ipo1pYX+fe8e59L+bfSrECbkcCe6W/wtQOEuAHkD7c5yy8mK4dctxqj89sTNeXEHlfyXHttuZ62HxhQXN5BnBp5ATtWkjHSSBy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWBJ/yRKSSe/VTxpK5BDsfaolB5mxrTy3U590x55QlU=;
 b=PLlOyvAQitx6gCT9l710cMMTrBBKUpYe9g5Um31cEvKtFOLwCEWpqcuJhTCaGdXbuOaNu/lyJ7eSsOZLcAn7Bb86rR8iCEm4a76JjaCKOduIoDQEeBZRSq62s+uQfx4U5YAmLI/pbE5bYKZeVt+jsUHmHxZTONmk0k1PsBiIQCE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1453.namprd11.prod.outlook.com (2603:10b6:301:c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Sat, 23 Jul
 2022 11:22:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.018; Sat, 23 Jul 2022
 11:22:01 +0000
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
Subject: Re: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
Thread-Topic: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
Thread-Index: AQHYmHPj95q5mWrtS0GGLuvs3DXs0a2L2/OA
Date: Sat, 23 Jul 2022 11:22:01 +0000
Message-ID: <96972ad8-d146-3bc2-0e49-ffe88580bbee@microchip.com>
References: <20220715175155.3567243-1-mail@conchuod.ie>
In-Reply-To: <20220715175155.3567243-1-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce60f4fc-753e-40a9-7273-08da6c9d90a3
x-ms-traffictypediagnostic: MWHPR11MB1453:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fuOBE38tjAFCd+rJpty6ajEaPFP9Pppih3VpZKCF68Fp+emNIMcabDLvl0Pj6XlAEzpbvNoOuWPG/su7vV3hwRTQnHjUpbn39gnd6HgOF4AsFOoEM/+Ui/gZ/kyW7FnfGXOYpJN4oLJGu32l7PnBQlxDHGWZAuT//7iY0vh5F2riUXa2glpG4rzPBw616PCAV1hJG32JIpDTEFMQx3hm8GYD9TMmixYSQRD2Y5R/jK66fUdUCietz06z7zgW9TsIdI68kBxZkxYuawsuMm9h6uKK5xE7nTeEUSFVQDvaF5MwVpjO/hW1X1si1OiJJnxG8nLFa87WgLMfqo7b4BSCbVTnIxb4y6isgrAICnn5KRP6uSbHYe/aPcnP5z8KCfeqS/Q06uIxQ5RHr+iOkyURkLkm2uBo+HotoySwqkq4+Ao/TBJJ+8HlrsxhdCfTzpoFkqfPXOWOW3+yDi6GMSV+HZenbi80aQNu38pIZGDNcNeWIg6kn2M3v034sramiLahu6rfyvK+h6R3pxU4iMR0INcD51AiUgS2nrmLbpsl6BctVdYvTzeuUXZfW2MiAWKajNWXiAE16Tep6wK0DkMfRWqK4cdlXIKRJ4HWSuoBUmOT54YZBYn/ZBLV0sSG20XptsJAnb7RO7VaBwH8YWNd76LcC9fNZgwpq3U0vxT1S5bsLAXDOxCUKtnwPd3ZJTS2+f6JYfFx/en1/bPZG1L0ekej57xgM6okbhSzTeUErOapQfU/ehDVUn9OILnGcQyvP/lfA58LazIW2cyWppcPJcsXg6m7X91Iu3RY8hsPiHa3QHn0418gTMat9Nlh7YCqhlYrKJ5JctBsZ/IL707gQUOfSZ9n1eZQTCgbztT048gmP+6LpyyqeddCaOPIQtcEgrnccDRxShwH+VGja8bNFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(346002)(396003)(136003)(316002)(110136005)(41300700001)(36756003)(6486002)(966005)(478600001)(54906003)(122000001)(53546011)(66946007)(38100700002)(6512007)(6506007)(38070700005)(26005)(2616005)(186003)(8936002)(31686004)(2906002)(5660300002)(71200400001)(31696002)(7416002)(4326008)(76116006)(83380400001)(66476007)(8676002)(91956017)(64756008)(66556008)(86362001)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlR0MHY3UmRBbTlxUU5EUFl3eHpzWDI2bzdXZjR2TkNlTkEzQ2hTbWlCdmFQ?=
 =?utf-8?B?bXBsTlBHMXdBWDBOODBNNzJKWVJRQlVkenBoTGpsTEVKQ2xUdllzcGZRY3BK?=
 =?utf-8?B?MXdpNks0enZuYjJ4bEg3WGE0S1ZyVlZyVmtnSCtXVU9VQjRNWDN0bWNSc1J4?=
 =?utf-8?B?VXpWLzlBc1cvd1Vtd0gybW9PYVM0bC9lOXluN2xCYXgweGlYTDIzeGRmR2NS?=
 =?utf-8?B?c28rM0xoTS9OKzlOOS9XR3JTa0JMeElKYnI2QklBZHllR0V6YmJteEl4WnVi?=
 =?utf-8?B?TVRNVHlaVmp1UkxmNWdEUEp4KzAvMVI3akMrNHVmRWIrTVN6SlF4SDZtT2tp?=
 =?utf-8?B?Y1BoYzFMeEZxczIzelZ3bW0renBpOUFjN3BrY3RUenJZL1VoeDlJTjQwV3JF?=
 =?utf-8?B?ckZ6cmZUL0JxZHU1aldiMG9vRkZUZDRpSkFxTEg2bUVOOE5MbmdRb0k4SDZG?=
 =?utf-8?B?aHhxTXlKQ3JZQ1dSTUIvM1gyYkdyd2JIRmc3eTIxSUxwU2FBbDBsUWg1MWI1?=
 =?utf-8?B?T1EwU3BJaVNiVHBUeUJaVkU0UWdwMGZXUTBIcFMwemgxaWdmZCt6cXJURWR2?=
 =?utf-8?B?bUlpb0oyWmJDU2NncldDZ2hCMkJlUTU0L1VzMG1JRHVvdHl2QUFXZlp0RlY5?=
 =?utf-8?B?UUY3OGpHL0FXMXk3ZzMvRzlmOE5OUVIwWE9ELzdsRUM5cjRLZzdKN0EyT0ly?=
 =?utf-8?B?WWhRenhyODNmQU5UQkE4ek1tTFhlbXVhV3l3NkZDckU5djk4cUZ0OW81Wlc2?=
 =?utf-8?B?eGI1NDhTbE9xb3BYK1RjQ1Q1MVR0b1V5NjdnbGtBU3ExRE4zd3BHZFdTZFg4?=
 =?utf-8?B?anZubE9HbFh0am44ano2emdNY1JxUFRBZ3NpTmVGS1lWNE5zdk5TM3FQOXZ1?=
 =?utf-8?B?V1JBZ0lHSVFCWFE3aDhEd2IyS081cE9wMUlDZ0JRNW50VnFlQnE3bzBQTlA3?=
 =?utf-8?B?eVVjTHBXT2EreHBZb1lTeVZ2bVNVamlyNjN1NFZoS0dkY3VjekxnalJZN3hF?=
 =?utf-8?B?Z0drMDBYQXl2ZWgzR0xWaHJQdFE1c1pvZGo2eEp0MXVuRnRvUURKTE1Sd0RW?=
 =?utf-8?B?WmpJOUtDNHk4RFlYYS9jYm9PNThUR1ZwaDdKcjdVdC96K3dQVDdReU9lZFZt?=
 =?utf-8?B?bzR3K3VFemVVVmlhcXNFSUF4M0drL3A1Tyt4eHROZ2ZwRE9jTU5YVVFLbzlD?=
 =?utf-8?B?cWhJMkJSTDV6ekI3OWhJNlA3Kzg2bUMxVTBDMERpbDlHN1lXcXpzQ1BvTVZW?=
 =?utf-8?B?Z05RQk5vd1h4a1hXUVlZcEJZd0crUytUTXNNUnhQQ1NPVzFyaEpkWDZBd2ta?=
 =?utf-8?B?dkxreFMzLzlzSjJvYzd2NFdIZjBmQmRUVmlpNU5rUDdzcmhPOEZWWXRjRVdR?=
 =?utf-8?B?UVhzMlZBMEdpNm0xd3FmWExkOXRrT3dMTUpNcjRWYy8ra2N5dlJxVERRdjNn?=
 =?utf-8?B?dlpUOFRyZ1V5YXFGZThPMWtpMnM1VGFBZHZGNEJwZ1NMUzk3ZGxldXAzb3Ry?=
 =?utf-8?B?Y0FyK09QejBJUlU4b1ZyZUtBakFlMVR1TXVCTHhSTUhmNVRMaWVDbExHWkkz?=
 =?utf-8?B?cVIxd0RXM3dnN2ZJT0kzU0U4bjE5bzZrbGtkUlhpS0Z1T3lrT2R0b3JLcnAw?=
 =?utf-8?B?R3UvdWRTUmROUTNEeTNxNmswM3NBV2pleTBwYWhuL3NudjlqcHl5Q0Zod0tz?=
 =?utf-8?B?eE5WVUZMYUh6UGZ3MlNCeW9PZHNlVExSS0VvL2hKK0FjVjd5dGV4MFdrTlJr?=
 =?utf-8?B?QzIwUG9SMHJ6Z1dNNjZ1M1BFOXBRc2NubFlaUVMyWlNhelhaVC9nRjVYQWts?=
 =?utf-8?B?d1BsalNleG9IenBFd0M3U3VZQURiWXFzRUtNc00rQ3N1U1VUSjhVMkx3ZEJS?=
 =?utf-8?B?S0NRMWFxbnQvK3BFekdrVjE1TlBNd0hlV2R6eTJHaUJFVTkwUUtlOUJ3N0VE?=
 =?utf-8?B?dk9OQytzZ294aHhuT205WXVYK1RxbVhCVHNteW52TnUzOTBudzQxamlKS3FE?=
 =?utf-8?B?SlRmZlNYUEh2SUNBWEJVSk5jSlJSaHc0cUFBZnQwSUdDYTNMTlJjMGhHUVJi?=
 =?utf-8?B?Q3hKNEJzQStud0JRQmNNWDBkRmdtWWNyZU5vR3M3YmREdC8wUW5Ydm5yelg1?=
 =?utf-8?B?bjhCWHhncGhzWUxsVEZ4SkQrTlNoUngxYTNZVUJRcWtkd3ZuQTR3WTVPVjVM?=
 =?utf-8?B?aHc9PQ==?=
Content-ID: <627FF1E919C4244AA31577C4D79EE9B4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce60f4fc-753e-40a9-7273-08da6c9d90a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2022 11:22:01.8330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwQddBSrkOI5rP1a2KOPPo8k36HbvQuWI7kR9VrG5hErDX/87/tVQ/pEcfKzapimcNeH1/R1qN1RlvWO1y/iGPQ3LHs6u8d5G0kr2i1gv4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_042211_110128_C4C3839E 
X-CRM114-Status: GOOD (  33.52  )
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

On 15/07/2022 18:51, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> It's my first time messing around with arch/ code at all, let alone
> more than one arch, so forgive me if I have screwed up how to do a
> migration like this.
> 
> The goal here is the fix the incorrectly reported arch topology on
> RISC-V which seems to have been broken since it was added.
> cpu, package and thread IDs are all currently reported as -1, so tools
> like lstopo think systems have multiple threads on the same core when
> this is not true:
> https://github.com/open-mpi/hwloc/issues/536

Hey,

Not got any feedback on the smpboot changes from the RISC-V side.
I tested it on polarfire, the d1 (with both SMP & !SMP set iirc)
& on the u540. It all looked good to me.

I'd like to have this fixed for v5.20, but there isn't too much
time left before the mw. Not too sure about the cross-tree changes,
does it need an immutable branch or could it go through driver-core?
Catalin suggested removing the CC stable from patch 1/2 & adding it
as a dependency for the 2/2 patch - but obviously that's up to the
committer to sort out.

I guess since it is a fix, it could also go into rc1<

Thanks,
Conor.

> 
> arm64's topology code basically applies to RISC-V too, so it has been
> made generic along with the removal of MPIDR related code, which
> appears to be redudant code since '3102bc0e6ac7 ("arm64: topology: Stop
> using MPIDR for topology information")' replaced the code that actually
> interacted with MPIDR with default values.
> 
> I only built tested for arm{,64} , so hopefully it is not broken when
> used. Testing on both arm64 & !SMP RISC-V would really be appreciated!
> 
> For V2, I dropped the idea of doing a RISC-V specific implementation
> followed by a move to the generic code & just went for the more straight
> forward method of moving to the shared version first. I also dropped the
> RFC.
> 
> V3 moves store_cpu_topology()'s definition down inside the arch check
> alongside the init function so that boot on 32bit arm is not broken.
> 
> V4 has moved the RISC-V boot hart's call to store_cpu_topology() later
> into the boot process it is now right before SMP is brought up (or not
> in the case of !SMP). This prevents calling detect_cache_attributes()
> while we cannot allocate memory.
> 
> V4 is also rebased on next-20220715 to get Sudeep's most recent
> arch_topology patchset.
> 
> Thanks,
> Conor
> 
> Conor Dooley (2):
>   arm64: topology: move store_cpu_topology() to shared code
>   riscv: topology: fix default topology reporting
> 
>  arch/arm64/kernel/topology.c | 40 ------------------------------------
>  arch/riscv/Kconfig           |  2 +-
>  arch/riscv/kernel/smpboot.c  |  3 ++-
>  drivers/base/arch_topology.c | 19 +++++++++++++++++
>  4 files changed, 22 insertions(+), 42 deletions(-)
> 
> 
> base-commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
