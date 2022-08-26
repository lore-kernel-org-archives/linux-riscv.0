Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6ABECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yz+TXPvJUxuJDPljVOwyvprywyhBb0FtCP7onUbdDg=; b=wpZIUXMOjL3LEd
	Tgr4oaZqTIs2Gg+3DKS5O0iOUcdhCM7m3Oemv5vm401VxgK4OKayEI06Egc9EAP/bcLhL1XeCHIyK
	WCeclyYTYR0XIO25WePmgac2eEUQQaWsiuPbFtdpVZ5z9T8l1+jD90mGE+iz2bpT7RcIE2h5s6qKy
	LCHxmxEF6YjCZa9lHafuWVOYZUfDLMfDISzEBAEfTMeWGwF5xZ3R565zSAiL2CchgREQXjq0yUM+x
	rPfuUd/3Gqmfv9Sa8SVl86rT1jd8yfG9uT8n8FaevehOcEV7EHzcK4zso9KVoLCcXcqc0rv3vxqot
	L3geLyISQZU/ISD27IEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbPA-0074gK-79; Fri, 26 Aug 2022 15:37:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRbP6-0074cH-Ma
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 15:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661528272; x=1693064272;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ehz4grZjhWyEhkN+3iMk1WOhZdy68iEH/WCm38ZP+5U=;
  b=sWK+eYPcpiGpHXgBXhQqeHIVhnvvGLIOWRFhW2sQNT43X7rWh67kX9YV
   etY6LoYpZTUlmMPrUz3WBG1KiAJRDM94t4uUoJ9TQYEoaZdDXqEjIMnYn
   5hxKgGmd+I+Y1KZ8HaU+hksV29pyEVERvBCS2DdcyNttxqHBmbzlrvIbb
   VNzzZssMMapRSGOnUhIDic5dfwk5xgKf92DJa0SXNtET9SSOcq9Zmi+Q9
   QPrST0XtV1F96hePwr0qgOb4F2ilNN6wd3gk9HNnQYlvcSY6MLVzrTvG9
   d0JnJ5tBUrfurof0/pV0IYUqVIuXmxJ9XWEvVrdRtXDSUWeGtYS+FbCgR
   A==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="188219916"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 08:37:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 08:37:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 08:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zv952nfkCaLCVRdH52xmvF8PDJLI0XleLsXjSd6Y+wEK1Wi14KHNBBDR/ODy9b/Da4xsX1tYpRbW1y9XWJiiHZlopsofhRWkmhYo/oRVQCtc0Nno6Q/1AOvEY4X7QpRNxmqZSyPX1i57xMV4yj9gY5pDqHt8/0C1Q8XzIFQ0BGiPE1cuFurlYCVET3P1KUY39GiOjQDGNa2UEJbcSi98u0QiiVSXz2S10tBZgPd+n8fx87MQ5iJnYAiebVgrfRHlP77iewQjz3RXSeTQaUK+dI39uiaOB0Nh61p+drKyTOn+JsW4rxz/CYrUTqYaPMmjGTGUfKb1ewZ7xwlYqhwtig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ehz4grZjhWyEhkN+3iMk1WOhZdy68iEH/WCm38ZP+5U=;
 b=I/Gzwqok1VwvCouGMEU35Up1LC+f8bKQ9gPHn9pof0LWNKCzZmB9n+Wdw2NjdnS/SmEQI2AHQp5ZiGnXjiGFdW7wObEx3qDLlCsC2Z+6lbVnQSuBQjzctIVOZiHzXhUYeNG/9Jli0NAmjqgBVFjW8nVb4b3t4DwSW8/j8qf9V6sQWVXDL4KreTDdQvTwKu/cNhakuFnc4zTADbu8gmylrKJdcsos14nnGX/mgULu+kUCMRTAzjmkoQulmOF32EZWqiHBWczirGTX+6f1lsglC2f/+WIiOL97woy3RLCKfWg4SFlMIwO2U4F38KyPtt7S5JwNf3g/VsCgM/3Is1I8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ehz4grZjhWyEhkN+3iMk1WOhZdy68iEH/WCm38ZP+5U=;
 b=YKnp18RQJFsC9vRgNfrYTvwLMG1goC25L/kxMtsrbqvpmzCTgQWyk9S8e1ct3yxT0JgFRNR7urCJ+7jcKOkzvBCanITXss3JFNCZcpMmoUl9tItd/etvtsUgyqjQKgx5A9Mw0A5PCkpXIStJKECNHAZQQpQiUl5nXB1ZXtrCgPk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 26 Aug
 2022 15:37:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 15:37:41 +0000
From: <Conor.Dooley@microchip.com>
To: <sam@ravnborg.org>, <mail@conchuod.ie>
CC: <monstr@monstr.eu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <hca@linux.ibm.com>, <gor@linux.ibm.com>,
	<agordeev@linux.ibm.com>, <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>, <davem@davemloft.net>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<arnd@arndb.de>, <geert@linux-m68k.org>, <keescook@chromium.org>,
	<peterz@infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
	<linux-arch@vger.kernel.org>
Subject: Re: [PATCH 5/6] sparc: use the asm-generic version of cpuinfo_op
Thread-Topic: [PATCH 5/6] sparc: use the asm-generic version of cpuinfo_op
Thread-Index: AQHYtVJUB5xz+q4nSkCZ18VS3U1tX63BSsiAgAAOIAA=
Date: Fri, 26 Aug 2022 15:37:40 +0000
Message-ID: <87c83d38-18bc-7dfc-be6f-d906ed713450@microchip.com>
References: <20220821113512.2056409-1-mail@conchuod.ie>
 <20220821113512.2056409-6-mail@conchuod.ie> <Ywjc67hcBwOkMtI/@ravnborg.org>
In-Reply-To: <Ywjc67hcBwOkMtI/@ravnborg.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e12f5ed-6df5-4d74-906d-08da8778e96e
x-ms-traffictypediagnostic: PH7PR11MB6056:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VDGlC/wdnRe62VEhDGOBMwQxoUIR/jJzJswQZtCkHqQLMcKYuILy4RmZJjzre3fe45eXQFMUn7ECLr2/1g+JZJd74o3zUbPyJoTafbz+/ciuCYCh280YvZNkB1OjK61feFAx/pS1MvTy5vZHgLjA3XNdP0va266snbcLyhUI8cVLIaaGKxJDmk2rl1Lxv+wrej8DFNDlNA5VpA3nePJYPpRhO/HG7q35xUtoIIYx2i3+w1c4C1x2iNHi/P/RH/zYY6hixwskVStW+qUtZEW8e9bOU+Cdm4TT+ovfg2HRbAuUAYK9zcGU5Qs34nOPdT2oW1DB93ze+riCqTqJym5jBHxlb6rfiywxWAsn7GGdlVRlajhgBb3VYREVnlX9t+3qTgW4xF2+Rp3SE38vLJQA/NIIngQ7SiJbBvvKUpHIGh7IWgnbQTDWHiSnCGMOz0jCC3P0jaTOB7zIwwxDyADX4iRM4Qby6hXYdLM8LebpOhh8ELEQx/pjmC1JMn0v5umciAwvDV+PzUozSYi6SoC2iU0n7nvOdK3tW2jOECc0vhWKn0Mrh0bw1mgsVltVz/YaDYkvGFisqvlwGNlL9rCOMAr35tGvCEodkGI1ALQbBWfhFlAVFLxHHFpf/nn8YhZgO5oJBvXhsZEIkPZCJ65LNz/4vt76QbHuPf9xsAYyJW6iUWkUrWXhVeXMdR0a8Xu+TUSTA5MYlSm89PlaME4m7ldjbSiEC6GiqJur1rqId9fIzCj9P8cwq1kG8LfcnLYTehXnvEWE5ySzO/CTG1SeeQUyRYTDSSkAa13nMe3s2kB88Ty5PXzqkX1U3i7i2/P60uERK+xzHKN7u4sjWZheS6+3KJo/eX0dxBNzgwQ2+fNLWU0DdOh0xsSLWBv8ZkVh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(366004)(396003)(136003)(66446008)(54906003)(316002)(38100700002)(122000001)(7406005)(7416002)(5660300002)(8936002)(83380400001)(66556008)(91956017)(38070700005)(66476007)(478600001)(8676002)(64756008)(66946007)(76116006)(4326008)(186003)(110136005)(41300700001)(2616005)(53546011)(966005)(6512007)(26005)(86362001)(6486002)(71200400001)(36756003)(31686004)(6506007)(2906002)(31696002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmtsYnlXZjFTRmgyRU9DaWdpcTZQMk9zU002Ym0wQTZkT1hRK0VYNkMvYWVP?=
 =?utf-8?B?b0JjbkRuUVptOW12SkNUY2FOQlBpNTJBWW95UTlibitjSG5yTzJnYlRINmlR?=
 =?utf-8?B?N1I2Y2dlUEFQbGJSZEUwcVMvUEQyZHVWOVJCNzdxQ1IrYjJ1aXA2YkRQaVI2?=
 =?utf-8?B?anhRL1hoU1VPSzJsT2lHbXA2dmpkcGNtdHJPbFJrcWM3K1RCK0tya3h2dWZZ?=
 =?utf-8?B?ZjZlbkZxMngrQ3JzTDYyK2wrK1hYS1VIb1A5NldKbm1SQ1lnRll1c1JVREND?=
 =?utf-8?B?dXNEVVpoUW9NcFhWKzJPWUZKM3czcW1YWnhrRVdkTHc3bkJaS2lrM09uUjFQ?=
 =?utf-8?B?WGpIVkJMcm44d2lCRis2bGpkRWxHQ0Q3V3hEdjFxZFgxR0x3eDg5R2IxSmVL?=
 =?utf-8?B?YVNMTGVidDRZU0VTOFRqRTAwNHJtak1JUktyNWtCaVdhMXo4THM5Mzgxb1Jp?=
 =?utf-8?B?OS9DbExROCtEZjI3c3ZYeWJsbVorcE1XeVYwSUVVTjZpdjBCSjQwamhFTzhy?=
 =?utf-8?B?Y0EyQTU4MHdudlE0b3RROEFSeWJZZDBGRCs1dnVocEtRSHhSSyt4RVlpZ2hE?=
 =?utf-8?B?ZENiWnl2MVk1L0xmN0lVS21Cem1ocHhYNERoU2loeVBBSVhkRkpuOWdPNGZY?=
 =?utf-8?B?OGx5UDlESnNUTGFhQW5pMDVRVUVQNjdqWW51TTZ3RnR1SnhDZmF1QU1zRUF4?=
 =?utf-8?B?V09UeURDZlE1MC9VeTczMlFoNUlFN29mb1ZNT1dHenZoSTVRL1lMYjBTQjRS?=
 =?utf-8?B?Rm45eTJpYWJLWVM4V3RJcFBhREVKTUs3cTY3M2VjaFVtVEJQcTkvc3FSWXhz?=
 =?utf-8?B?QmlpWXRabVBCYVpKTHAyelZ3My9haDhtNnZLUE56T2ZjQ0F5bERHS1pFVUh1?=
 =?utf-8?B?UzhxRWRqSGluUW8yRCt4TjFQV3kwMTQ0aGRsNkVqZTdueEVKdmNJYXR3bkNk?=
 =?utf-8?B?Q1huTUpVYjZLTkNNYVd3dlhwNllWZ3ZsamkxMFZ2TWhNMW5lUHVmSnFBYmla?=
 =?utf-8?B?elNBTklLMzc2aFNBU3huK2FFQWo5SFlDU0ovNEFMeFNrWDRMVC9yU0dDcE1P?=
 =?utf-8?B?SFFoaFJGR1Jobndoa3BmeWtBWGtOVk5IVUtndWtKU2xIYUVnOE41SUpHN2VK?=
 =?utf-8?B?dDFhcTVVSWJyME5sTytPUnFRZ1BJOHZFOURzbGpORlJjY2t4ODlNS0xsbjlC?=
 =?utf-8?B?dkJ0QjMwbzVlM2hxTnNCYjlwT0Z4bFJacFVROEY1OWI3S1RIazZnSUhyNEhM?=
 =?utf-8?B?YVVJSFo3VlM1eTNDaGFzRGdYRXIxK1N4OWVHcW1yUVljRWhOc3RmZjV5QzhL?=
 =?utf-8?B?dHNhb2NRYTA4eThNcC9FMUF1VlpURjBEdXoxQ2hkcFRZeXFLMmYydEtla1hP?=
 =?utf-8?B?K0pDNm5mRzNCRS9sOTB0N2dRYmhLUW5CVVowSHQ3WWdNeHBxd0pOaGdvam9k?=
 =?utf-8?B?bVAwTG00MHJGY3BpODE1M1pWczIzNEk0NXRnZTdrSHlESWpDT1lteHRjSGZ0?=
 =?utf-8?B?Mld0V1VQam1GUFZDSEV6QTN5RG50YjhnZ2hzQ3dHUGo5VTQ2R0ZKZEk4czVo?=
 =?utf-8?B?THgvY3ByNC94ZWVEdS8rb3FxMityZ0h6WHhEcjVjeU4wMGJlalIrQXdDQWVR?=
 =?utf-8?B?UXFnTkNuWWxlRTFhalZtUHFOQzc0T3dCblB2NHMzM3BDZldsZWpxMThhaG5Q?=
 =?utf-8?B?dUkrZkFPTEdEZlowQTBxOUY0RWpmdWFnalFFYXlVdmw1bmN2RER2YW9nNllK?=
 =?utf-8?B?QXRTSFJMSHNubXlpamdDU2hnWnNpZjQzOFJoU0srM0ZZRkdzNGE0RlhhTHZQ?=
 =?utf-8?B?L1RtdjAyanFVbnZxSUpMQzNENXNNY3UyVFBSRytYT0hLZ3NLWWFkQm1OaU4z?=
 =?utf-8?B?UWU4dmNYbk5mL1poRVhiT2hrSTNKNG1pcDBkQ0hnSjlhR0NLOXdYOTNoMXVu?=
 =?utf-8?B?RjFaWDNtTUM1TkRnZWVYdlE1OGFmcTF5aWdDYUp2RkdkNmFRbVRtMDYwN1Y1?=
 =?utf-8?B?bU9EN2FDckI1bUprZGU5Wk9Yb1JXR1krbjlrRy9TWkxsZ1RaQVllTHFMQVYw?=
 =?utf-8?B?RFFvZUZ1ZFJjaUNXYjRLTE00anFaQ0dBNHhJSEtFaUgycE8vdkJXMUx6NGxm?=
 =?utf-8?B?S3JlNUJnTmM5dmRDYTcvNDNFamR4UzVRSlBOMU9UaWVIV0pUdjZFK0RxeVpK?=
 =?utf-8?B?c2c9PQ==?=
Content-ID: <AEC04B5D6C6F81499C582F11ADF292AB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e12f5ed-6df5-4d74-906d-08da8778e96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 15:37:40.8352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jh667STd1eCL5k1T84UPIGvmRg9+sF3OG3bstQ8zfKFwfoAdAQP//MoU/iJ9jQPffwoMbN0vzAWEvfVmpDypmNBOiRxoSkLMCCwC+dg4FB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_083753_018161_561E33C3 
X-CRM114-Status: GOOD (  24.62  )
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

On 26/08/2022 15:47, Sam Ravnborg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor.
> 
> Thanks for this nice simplification, but I think you can make it even
> better.
> 
> On Sun, Aug 21, 2022 at 12:35:12PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> There's little point in duplicating the declaration of cpuinfo_op now
>> that there's a shared version of it, so drop it & include the generic
>> header.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  arch/sparc/include/asm/cpudata.h | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/sparc/include/asm/cpudata.h b/arch/sparc/include/asm/cpudata.h
>> index d213165ee713..af6ef3c028a9 100644
>> --- a/arch/sparc/include/asm/cpudata.h
>> +++ b/arch/sparc/include/asm/cpudata.h
>> @@ -6,8 +6,7 @@
>>
>>  #include <linux/threads.h>
>>  #include <linux/percpu.h>
>> -
>> -extern const struct seq_operations cpuinfo_op;
>> +#include <asm-generic/processor.h>
> 
> Since the header file did not need <asm-generic/processor.h> then it
> should not need it now after deleting stuff.
> The better fix is to add the missing include to arch/sparc/kernel/cpu.c,
> where we have the user of it.
> 
> A header file should include what it needs, and no more.
> 
> I looked only at this patch, this comment may also be relevant for the
> other patches.

Hey Sam, thanks for your feedback.
As per Geert's suggestion, submitted a v2:
https://lore.kernel.org/linux-riscv/20220825205942.1713914-1-mail@conchuod.ie/T/#u

In v2, I included linux/processor.h instead of an asm-generic header.
The diff for sparc became:

diff --git a/arch/sparc/include/asm/cpudata.h b/arch/sparc/include/asm/cpudata.h
index d213165ee713..f7e690a7860b 100644
--- a/arch/sparc/include/asm/cpudata.h
+++ b/arch/sparc/include/asm/cpudata.h
@@ -7,8 +7,6 @@
 #include <linux/threads.h>
 #include <linux/percpu.h>
 
-extern const struct seq_operations cpuinfo_op;
-
 #endif /* !(__ASSEMBLY__) */
 
 #if defined(__sparc__) && defined(__arch64__)
diff --git a/arch/sparc/kernel/cpu.c b/arch/sparc/kernel/cpu.c
index 79cd6ccfeac0..ffdc7a825b80 100644
--- a/arch/sparc/kernel/cpu.c
+++ b/arch/sparc/kernel/cpu.c
@@ -12,6 +12,7 @@
 #include <linux/smp.h>
 #include <linux/threads.h>
 #include <linux/pgtable.h>
+#include <linux/processor.h>
 
 #include <asm/spitfire.h>
 #include <asm/oplib.h>

Hopefully that is more appealing to you!
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
