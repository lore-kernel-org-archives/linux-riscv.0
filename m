Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDD5C25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 17:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLpRJ4mLfK4Xm2asqib111/ixZBqBLrqGyOst1Fs3wo=; b=axVTHFOUgPhfdN
	EYbghibx2MDX85Id3W/5+o5fmidqltfbSNN6bWqFNwCwPsmXbUtAG8G6akbIz7GzW7U4kSMuqnhfU
	2tg8u2W7ajgmxV2wWEa/71gQxl/dIdVHVEsGhntPH5/6CygJ6gM0aACu39CnvenLvTqhBneFAD4Lo
	QTGrcfUmfBd3Jenyk0r7V/oBek8gPTCPrr0PDFQqnxuVq0GKuPTThTtsEMv9pdkt5o66IN7NLkO0P
	ryf6j5SLkjaUjD65f2qTl/EHhty4COhTcQqwUnMoAs7CLA/rupHzXpAXuuuwHLGfYZ+OYRpMy2mqb
	KuNEmDuFtX9j5VxGj2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSHn-00BGrm-Bj; Sat, 20 Aug 2022 17:29:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSHk-00BGqq-1C
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 17:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661016563; x=1692552563;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qP7jq/67rc7T9cdP/AuZ7gdw5keN0vOM9VJ9QwIbGNs=;
  b=eeIZDOQIyaufCGuPyOo842ZWOLES6jW1fZZ1ZFw01eIGziaTOzsy/ICs
   4b+OMwzm/ZRTxOBvMOUAS9o0Dr5rdqeRI0StyvexALlymadtkqH9BMPPl
   fhIFzv1Q8Ad8jdHgo5cnynltxtUAqG0Z+iCTKYsbnjbw4OzU3y1hstoh0
   Qa+TuADAoqC6iM1Eo9jJ3Y7HIZqzKgc6eqB6xPxwNNj5oSC5S+qzVHLal
   QyKMXLD/iDxFhArb4NEQmimwWoxvWgReURKaPXtdp6cgrK6ChZdkEfd90
   Fn6hebAecN5ax0dK/GeCl2YCyvF0TmXz6jugfGTwg3Bny6jqmRLXGsnxo
   w==;
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="187345239"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Aug 2022 10:29:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 20 Aug 2022 10:29:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sat, 20 Aug 2022 10:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3tOmWg5PJbEHJsob8E/oSGgRSqvZZT15L5uPSXl79BhknShScLi4wXrBva5Kj3AhQ9ZTn/2VqzpYW6RNmDJiow1/JVxxPmqV7wfiCPolDWCZLoDrGindO31oDE4NvdtQtq77xZRuyinw0POuI0uw8vjtxKGooPJFBzcPKqsH1dx4U3+QqmfLwFM5SpZI2sQgWqeyVzjVocLVkWYDXyqdbqRCMSlM95j166nDT870UXunJcV7fdI+RHu5IEHQyVT/0t0FtsG9LYOk5jfXZUjQTBTmCKpLqKZYiF9RewPPJ014TWRYOztXGRhtdKMEZe/03N1AyWcMQBC7UGHZDS+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP7jq/67rc7T9cdP/AuZ7gdw5keN0vOM9VJ9QwIbGNs=;
 b=nyOJLEJX191RVLXAUSYoQxnEeaf+Kv+wzp/fVPu3hIREETSsh7IhfX11pNuxGd5iE3AUT38vgrFXwnt5/z8LTdcEXDvqaz7b4Yu4iDAw64gt6xBuot9Z31+jrkgn+npmXD2pMIY5oc1t+v5bRewIHamPCoy5b0uPtUySA5FvmpqMaGmSNsSFAoyzMXo71ymd1iDQmRn+nf1Vc1ioZGNYYG4Yc994EsQxt3rTsXGp03abQOc+/0kWNqvkjSi8XFC+y5ggZ2iMiQYZcYkcqWSN7Qwadb6taFzXQwgghKPGGcs/SqEIKysrPaAEYWifQd6vycz8TsWeybuL0xWxoh/HTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP7jq/67rc7T9cdP/AuZ7gdw5keN0vOM9VJ9QwIbGNs=;
 b=cpXpOE6+Nkbsxu9Sz99g9B1gpwFREQJIZlpRfTIyS/EmL1OqKdAnAcOiAAgdJWKkvSfyPoQMii3DqLIBjhQYy9FOzz8mtnYK9UulcCFdIIjaHy7CVbBflTmfMljpHO17mSxeU4wGmCd6Dy1oc20rKNeZCV88yAaHQPKj4eOfaJw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB0035.namprd11.prod.outlook.com (2603:10b6:405:62::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Sat, 20 Aug
 2022 17:29:19 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Sat, 20 Aug 2022
 17:29:19 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>, <Conor.Dooley@microchip.com>,
	<andre.przywara@arm.com>
CC: <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Thread-Topic: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Thread-Index: AQHYsGUwgMumzpPtekanQb2zMhKHQ62v8GmAgABAKYCAB+IqgIAAATuA
Date: Sat, 20 Aug 2022 17:29:19 +0000
Message-ID: <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
 <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
In-Reply-To: <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c4cb57b-a45d-4854-a261-08da82d183c6
x-ms-traffictypediagnostic: BN6PR11MB0035:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jsoDuihIJdEIbW3uQ4BG78DL3UctlDdaTIRrKqQJQp+DrmUss779euIXGhdXIIhJICCgjZFYOMZo6Xe/jDYd6aZRHp0KdQFFLoWlG/uWD5hG2GIU5LKB6oNJiLleN8lzdDYTx00T+274K64dlxWh5csZgFQ7YXh5ZIdGFlVL/cAKLDhxjDA8zRMU00LCRM3Do4AVkS+T09fVIUQCsdFuHZYbASctcb0L1TZUVcPqKE9MVD8eQSUsa66vy79jEwuzbkZhHPjovyjkd7/LcxC9ptOQNj1rvXOp4r50VuGmnTDI8HWnaTOvqdzLjiv7Pr0ukVdg6hbop9WoDF5IV7yJKcqf1h6FA1hctMrIFctg9SoofhInCsJ8P53P0SKDWN7Ya8+2VNgEswVKY9ZDgJv5T5vUAnNHBVlwMzOmsR1DEbBCOpZED/PqZ6X7cfnXIVYhpu07kZH4o2aRX+mYxZV+Hn+CyuQ11JnDWSW1LKeDUWdItYjCbU3YL2paZTtntrC9yYOgGvDoLzTFdS6ACi167uK0CKWFofv+8f5bmSv8XHydiiTiXbVsLyEVZcD+IiWiYLiEGw3dVec7lXvbAnl9K5DSFKjkQbSO2Gf/7lZI1XxSet2VzRfvPSdT+OQ/mK8JBtjEh1pZDaelub4c0wZd2elLUTo0Ux1jJQmGfwXtisv2XsKJWvNkVoLLZbLfae5zSZ5QpiEIa3k3VAQMFyiVaPMp3NyX+tyw0rB2Lb7uG58EtJdvYf/qHWeJwDzkogR2TMhklZ5nH0pVc5ppIe6W8p6HbMeX2MIIzuN85iJ1ELLF7hZ2Sl/L1OioYvr8mAtfgeGoh1X8Flx2cmrjBZumrcEpTjPSG40YCS5whzJYKmI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39850400004)(396003)(136003)(366004)(376002)(86362001)(31686004)(36756003)(2906002)(41300700001)(478600001)(76116006)(66476007)(66946007)(66446008)(4326008)(66556008)(8676002)(64756008)(91956017)(966005)(31696002)(71200400001)(6486002)(7416002)(54906003)(26005)(110136005)(53546011)(6512007)(6506007)(316002)(38070700005)(38100700002)(2616005)(186003)(8936002)(83380400001)(5660300002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzNLMFIxeXVldnhONHgyNFQvZm9NQzhYN3JVd045S2NlS29vS1p0ck15cUt3?=
 =?utf-8?B?eHFPMXRhK01SVFg5UXJucmh4ZkY3QTg5ZHg2cUJnLzIrRDZrSnhoMHBibFFh?=
 =?utf-8?B?ZFBsTDdJSytNenFGV2dOTFIycjBSU2gwdjBLTXpWUk56SUwxRTk1c1NkaFZR?=
 =?utf-8?B?LzRtTWNHY1gvUmVMSEZaU0Q4YWNrRDlXUDBJN0E0dmZOU0tDdXM0blVMVEUw?=
 =?utf-8?B?WUFWemlPMHM3OFhGOWtsZWdpOWZXa2FyTGlZbU1mSWlhNis2SWlVQVBiZEJy?=
 =?utf-8?B?TUl2UnVaVTZueC9DbWdvU0pEYjc3ZUFObXMrWjljWUd6aDBwMFRYNUlwSXpk?=
 =?utf-8?B?WDF2UGY1MVRQUzJoV0oza3hxR1FDRlI2N3R3dEttaVZLRWw5Q0FOdm5hMTNG?=
 =?utf-8?B?K0d4OWs3WGpzZTZiTTZsZnY2WkJxYnlsZjhSWHlNYWdTeWZVV0VrRmlKUjBI?=
 =?utf-8?B?SFVVUGIxV2EvVFAvUVUySUE1KzJaeGw1VTQyNkY3SGRsanpWNm43Rmo5djJp?=
 =?utf-8?B?RHJaNTFKRStQWTlzZDdxVG1veTFTS1BJZzVrMVFrbUhFeFRuWi9uaGczcDg3?=
 =?utf-8?B?cUxOVUVlbkE3cmtMOWFOalFVYlpINDU1WnBqeGxMM1hYOU1jUDRjSys1d0ov?=
 =?utf-8?B?V3p2ZVpZRjF1cUxMQ3djeXRQSzR1dWlXQVNpbUwwMkFnVzB3ZFE1M3FXSU12?=
 =?utf-8?B?WjNMWW9FbEdnVUkvT0xQeW5UTmRUZjZZdmdXcHg2akxRVXNJWFZ3YUowMDgy?=
 =?utf-8?B?dCt0V2dCbTErNkEzS09kcnFkVzloMHhnWktXSjlGZ0orQ2ppQUNTWUhUVng4?=
 =?utf-8?B?eHYvUWg5ZlBCWUM3bGp0SnNRT3QzWHZVU3VaelFWZmNaUWlGbkNZRVNWeVBI?=
 =?utf-8?B?dDhYWmdsRFZET3Z3MTNGMldmZklsY1d1ZC94aVh1OXpWaFd5RjhSR0dRK0Zt?=
 =?utf-8?B?Y2U5TUxrSWZ4dVBNTXFzdkJwR0cyNENxZU5yYU5lTlZlZTY5REZRY0N4ZFJn?=
 =?utf-8?B?YlI2VmV4T1hGSXhFVVRlb2wvZGZrSlBwVHhzSjdnUFpkM2szNFUrL1lqR0xL?=
 =?utf-8?B?WjJZSCszN1NpRGNYUkxWclZBOVQxd0NuZHl4SUVaVTUvWWFRejFxMTkyc0Vv?=
 =?utf-8?B?K2ZmVzhUOEs2NCs0U3NXdjd5YzZaWEhrelJnTW5NUDZxUTB0czYxSldYajhR?=
 =?utf-8?B?K3BFNHB0cE1FSmRCVVNGc2w0ODVZS2VuRXBSUTZCOVdKVGYrVEtXNDJUTTJz?=
 =?utf-8?B?clI0WmxvMFJvdUEwMW1XQmtwdktiT2xUN2hoVWdqVnA5QzAyRG5FREtOM1NM?=
 =?utf-8?B?N1FQdlZrZUFidzFVTXV4OEpTR0VUYWpzQWNRdHoxd3RLTzU0UU9VR0dzZHRQ?=
 =?utf-8?B?VnJldHRmUnNzZEtrL05xOFlOY3VSU2tpWm85SUIyYVlOZkRQNENzdXZ3YVJK?=
 =?utf-8?B?Z2VSRHdqcWRkQ1FwRmYrSjVtNk1XY002UlhoWUxXbzlOR0JKam5GNWdva2xp?=
 =?utf-8?B?OWlEd3YzSk9ZSDh2U1p0YTdkTzNaUEIvZHl2Vm1VdzFNcUJwRXFmdUtqRXNV?=
 =?utf-8?B?ckgzeTFEdU1yNy9rVWJpV3B5V3oyZFE4UXNrSDBiUS9XbFlQb2pkZWc4UjBk?=
 =?utf-8?B?Vy9qUVhJMUtZWXA4N1JITnVISXltSVEzSWtiTG90czVRQUhQSkJrQ01hR0dp?=
 =?utf-8?B?WVltVWx2TVJXRlBRVjJaaHVkTldSYUdDTkQ2KzJJZWZEL1Y3em9qWElMcEJM?=
 =?utf-8?B?NGxhS0tLRFBQVmJjNVo5amJsN2NWejZscHFSYlFrbFhOVmxwUmw1Q0NVNjN0?=
 =?utf-8?B?T0ZHVXhjR1I1MTJORmMzSEJYSHduVXQwM01UWmY2VHhqaVAwSldoMkxBWFQ4?=
 =?utf-8?B?L3E5YjBWNk1MZzlTMzloQmhOeXY0dmNQRTV6ZUZ5YW9kSzUvTUlzRTZKa2Zx?=
 =?utf-8?B?ejBBTDgyN041c212NTRGYzVkSEF6a2VwWnpCR0RxZ2dkc2l2NlozdEdLcEZx?=
 =?utf-8?B?QVlEd25qTHZFTXFNQWtScmMyQmJkZlgwQ0RXK0tEenZBcXJ0dFpJVU1ETG1q?=
 =?utf-8?B?VVI5RTM0WGZKT3NmYnBydU5pNWpqTFpOSEVzbTYxMmJJVmZlZkFjTFBwNnd6?=
 =?utf-8?Q?CrBmPkPhOLP0yFGObIU1mc23Y?=
Content-ID: <7FF66E7B49D698429D5D6BE8D8445063@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4cb57b-a45d-4854-a261-08da82d183c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 17:29:19.6643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vl0yH+zggfxf5uGbkXIRhOJvkhTflHdlGs2EVim/3w+S+EoBM+ChnAgFyX5adKcZ1xPqhLGZdhT6cPHbBL/88rmW+7pJUvAZZVRdDmx86AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_102924_122594_8C1F2839 
X-CRM114-Status: GOOD (  18.03  )
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

On 20/08/2022 18:24, Samuel Holland wrote:
> On 8/15/22 12:01 PM, Conor.Dooley@microchip.com wrote:
>> On 15/08/2022 14:11, Andre Przywara wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Mon, 15 Aug 2022 00:08:09 -0500
>>> Samuel Holland <samuel@sholland.org> wrote:
>>>
>>> Hi,
>>>
>>> thanks for all the efforts in getting those SoC peripherals supported!
>>>
>>>> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
>>>> one HiFi 4 DSP. The SoC is based on a design that additionally contained
>>>> a pair of Cortex A7's. For that reason, some peripherals are duplicated.
>>>
>>> So because of this, the Allwinner R528 and T113 SoCs would share almost
>>> everything in this file. Would it be useful to already split this DT up?
>>> To have a base .dtsi, basically this file without /cpus and /soc/plic,
>>> then have a RISC-V specific file with just those, including the base?
>>> There is precedence for this across-arch(-directories) sharing with the
>>> Raspberry Pi and Allwinner H3/H5 SoCs.
>>
>> For those playing along at home, one example is the arm64 bananapi m2
>> dts which looks like:
>>> /dts-v1/;
>>> #include "sun50i-h5.dtsi"
>>> #include "sun50i-h5-cpu-opp.dtsi"
>>> #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
>>>
>>> / {
>>> 	model = "Banana Pi BPI-M2-Plus v1.2 H5";
>>> 	compatible = "bananapi,bpi-m2-plus-v1.2", "allwinner,sun50i-h5";
>>> };
>>
>> I think this is a pretty good idea, and putting in the modularity up
>> front seems logical to me, so when the arm one does eventually get
>> added it can be done by only touching a single arch.
> 
> This is not feasible, due to the different #interrupt-cells. See
> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com/
> 
> Even if we share some file across architectures, you still have to update files
> in both places to get the interrupts properties correct.
> 
> I get the desire to deduplicate things, but we already deal with updating the
> same/similar nodes across several SoCs, so that is nothing new. I think it would
> be more confusing/complicated to have all of the interrupts properties
> overridden in a separate file.

Yeah, should maybe have circled back after that conversation, would have been
nice but if the DTC can't do it nicely then w/e.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
