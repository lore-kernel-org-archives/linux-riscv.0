Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31FEECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vSsXEPynhRGruo9HEjpRzeGd/PWmP8B9ErZ8tdP2Lk=; b=WFlgb8iDjEzbDU
	hmdL87RRKevXJjUyY1iD2EGVaxAIv1s4CW8nPF0ZemUElsQybxuGgEtnvwDRDjiShX/pT0Sv1nE6A
	guIDbBcBPnA8UkEazjg1DPzhLLkc/LIBWnYBs1waxPK1tg4UxjhWUtaz30/qgi7VqfJt+qUOXxMVA
	5TpgT/Zp/iMg21pmPPZ3std5X621zyk/Q4TJMjmNa0ECodEdqpowNRNW9quwDtGXzXYankOyIyqW1
	Jdf7CujxVEm4+BAsHS7DNcu0JMsR5Tu/bjMKYpoorLH4XJIFPir7JUYdcLt/dNuZEwoFnjM6Bdqpo
	Bu02tq9xEyibUCO5171g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHh3-009DT9-NG; Mon, 05 Sep 2022 19:23:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGxT-008Vr2-Ev
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 18:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662402992; x=1693938992;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=NGo5kJmRmHx+S+g7F/wltr42EEE7eV6IJ126ZXwnn7M=;
  b=oI3Aiz0YkWca4SzFc78zhihTWOCirBwNf4UdbIBHcBr3N2tVliHKvWbZ
   clCfg81ndh3RajMd7dtjufUH+ZJOHVq9cU1LwqkLmlNCM7DpAEwjfQ35t
   ITt5HETTB29igyRrKuNtiAHTFieEru8Ykmj2CGpFdYMjWbK4z/3Hv4NCC
   QElJwAZujUKpsHZsAz1W33l4UxBq9hOrputmFfUOpjVGQezuscSj7p2WG
   d4vI6WVtRfqgpaXrJSU4jnlZMtSi7Rmx8UE5iFEzIrj2rWT5ImEBCgUiP
   TWgvXmldb60tG1uBt8lvrPiuI30vyerGkhUMWdhHWEXKVCjX7uVVGKOfy
   g==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="179111455"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 11:36:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 11:36:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 11:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqNHilS6jmbIF6Bh5kmy8H0hPpZ2QJ9eoNIVG2Z4s0uizPVwHCDJ1gmKt/jrbSYcL6B6AYyIceIB1tEN0x7BErKMS6KoRuoBj0z2S1oQhrhuL9RUPffXCQHpiW6H4Qje5weXy0xKQ8igp5XuH13RnvW7lOv3mO2jOOYpi7NmkY9n74NAfCop/kbehwm9PZ9JPo4KfL1kmgwydenGGpsEO/lm8VDH92DG9tGLiTyZJl5ZPXSZZYPy0bTeVrtE1EN8W0x2mCS3TnJSh5UAGcxBu4L62hwPUv1fa3bE5yihkG93kqA2YUdn0322fXsrDpO+j8BGfMMVSXcjiCLnZUAfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGo5kJmRmHx+S+g7F/wltr42EEE7eV6IJ126ZXwnn7M=;
 b=CuK6Iuwv7GyP+vSoHiJ1UMtOS5oc4QbblcyA0PMfaUw7CAmccbHfAoMS/LGae+7Zpcsn0KjFy3LvbqQdofwoMkZ8EUMpgieGJe7Axd3uf0DvGpBsdw01LA8QxH2RFFk8X+rgOdib3Cr1n3DsoAhjLcMbrAzVKzxDwM9XNpXQ/pVByjgNJnkOJ/9a3/9dkrrJ++iR5mrRtt39qcoAJgJqUZIpZ7zAP+Z5FGknsOzTAZhJFyGx4NnM8tbkhmPY2gBt9nIoU3tJGDDdpdtvYFeZIHQWEsa1nz43u8P9wNRXR27vICgkqyO3YRlqJR1lhYPGIfZ8iOXyP1YTewIdNFe4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGo5kJmRmHx+S+g7F/wltr42EEE7eV6IJ126ZXwnn7M=;
 b=db88lz1kNDnxNZfsthwGK8PXTFIUwMcrUmw6A9fDi9rzUX23xSjxw7udu8ua5RgfIzLLKgfsJn8PzjuGbVI6YkmagPaATeUT0lpqCEeP8uKf9sNDjc+YSGBBaFng9FKrExgUxYg4pXk7u6g7w0N9Qpq/6HvgJVTzlschUjbBQAs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 18:36:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:36:15 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] soc: sifive: ccache: reduce printing on init
Thread-Topic: [PATCH v2 4/6] soc: sifive: ccache: reduce printing on init
Thread-Index: AQHYwQIC7mihKguHYUucGYj3s4hGeq3RKr0A
Date: Mon, 5 Sep 2022 18:36:15 +0000
Message-ID: <490336f2-5028-499f-d78f-620e083b3c61@microchip.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
 <20220905083125.29426-5-zong.li@sifive.com>
In-Reply-To: <20220905083125.29426-5-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 964a03bf-b1c4-4243-d636-08da8f6d83da
x-ms-traffictypediagnostic: PH7PR11MB6698:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwF9WsGaVEgg1adeV/8upEI59V/6fA83dONXwj9ns3NLqnhBMtbY3zH5KXPS9jcPYfAkxHwdV0yFrCjgbqAEUesMpCZYfAPlUl/UiwN23j/7GWpEENU5DfBG+GpReOL3dEH+eoqs6iqIq5t/DaPxLzSB0ud1LOH+UV9TlI5mVhmj1c2cMekvhajP/Pqdqpe4L+nEpEklMEa7D11hFBmkDAGibcOMcrzdASsuFhu+ZFxczyyv457TzFF67dwi9dfAgw1TbQ5yIxjS4Ckzh5EpWUjavTkxwFqFjHmoqRQGEN+0yo+2dmvfI2kk65IlPczgxmW0RiRCnBs4ZIm6RmZTGce/Clps63Hlf0clSb2rQ/dj31eALtbDk90Yvxj7m7OQQq6OiXWiP6m/fh/tYurfRJbzxQzjXctcmAGv6GIdRtE5rtGH9rL3/uUYlWNuwC+kw0ejuTklotGOXw9rGb/CZvcN9YO3Usu18w7SvvGUVz8QNjwzoFrsCocXRBIbIdLDAaHpQrQVRcqYMgHKs1g8ErOFw2G0tHd6c0tuPY+wVRN/mNzo/DmA9wDyaALsFD8f1UtZ2ac/ER+3sb+RH0HAySu7PCJK4SBSzTPWV9XGmlgZnQtswbR7fcyBSDHqfXGxIEtIyAz/wXoY0xE6n2mexq4nuxeMgfma6vCJYV0sjN+zm7W0Hir8/4g9n41nJaC6yNl0c0gt55Ui5zCV4R+kEKkx9cliErG+JAzQP4L+H7JwV3lUYj0JSkSkjkiMf9mHMfd+rymrYA1r9DASBm9pTns/5FrkeqVL6XsLGBxJ3/v830ZMImYvZ0uu1ttsD9iC+4mcgGkspdxIEZLqhpDJgzzxT1b3+/Oz/HM5B5liro4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(346002)(366004)(39860400002)(7416002)(91956017)(122000001)(38100700002)(2906002)(110136005)(316002)(6506007)(71200400001)(31696002)(53546011)(64756008)(83380400001)(921005)(66476007)(6486002)(66556008)(66446008)(66946007)(86362001)(186003)(38070700005)(41300700001)(8936002)(2616005)(36756003)(76116006)(5660300002)(31686004)(26005)(478600001)(8676002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RksrWkJ6K0dBVUdHdmRWd3RXMGpkNkwzc1dYa0pzdmMxNER1V1NxR2NkZVM3?=
 =?utf-8?B?TzVZdDhuV3FsRDltNVMxYm5YS0EvUFF6dThmYTR2b3Q2NnFEbE1SM0tHZWcr?=
 =?utf-8?B?cm83dThaeWt5WDk2L3Z2SHVSQmkvUWJXMERCRzFZeTFRTzVhWXYybkNPTTJC?=
 =?utf-8?B?MWMzdnJYMER2UjJNanFDVFhqR0RYc3RHWUt6d2ZlK1lmb3czNmNiWkhuSmcz?=
 =?utf-8?B?QzhXbmZiNzYzdmYrd3NZaVJCak9OMExhcTA5bGNhRnpjM2JxQkVkSEMxeVRZ?=
 =?utf-8?B?aU5Ma1VqK25JTnQzOXZoTGVHblQxQ0FETnQ2TW5MZHR2NW5idXhabUxYQjV0?=
 =?utf-8?B?V3YwNWVPeXBFV3J1cXJEMk1BNHFvai9rSGR2UGZLUlZPSmhXMW9lTzVhZDBs?=
 =?utf-8?B?ZHJzVG5GSFNDL3E0YUc2Z245aE5Jb3kyY1N3M0g2MHVwZmdEbUhNSlhXSUhJ?=
 =?utf-8?B?QzYzRnM2dkpkazU0R3dTb3pqcWF1aUU1L3ZjemZzK0pLZzhRQllTYms4TXlG?=
 =?utf-8?B?c2RXWU9PS21sbGRwTE43TGhNMlZEb0hqNHVUWSt6d2lyQlV4TllwdHlrdzN6?=
 =?utf-8?B?SW9uNXlFcW5hNDZ0UUpBUzZuZDkya1FtNEVBR0JVdno2U1pKMkFYak03Q0Zw?=
 =?utf-8?B?WlpKbWxQSmFiZmJJL2dzOW8rdndjbFZiTm9DTW8wc3R4b2pEb2NJY2ljTDkz?=
 =?utf-8?B?VGhGaWRhS2VHM1VZMTJoaFBUditRQUxGTTZSV1owYXpJV0NwVGh5bEZROXkw?=
 =?utf-8?B?YU5EZ2RnMmdiOWw5bWlhUXF2SVRqbEJJYzdjOVFIL2xZbmQzRGJnWGNORUlV?=
 =?utf-8?B?TU1oRHRjQWNzRGVjQ0FuV2pHTVp2MlZydW5obDVSbVNWMEw3T2ZsM3d2KzBF?=
 =?utf-8?B?VGc3VGhxWGNEVTNRWUJKSDNNTG9adTdDb3QzcERkM1oxcHc3c01BSGMrbGJD?=
 =?utf-8?B?VXIyanRwWnZwZDhqN3pobGFVVDNrRnFBVUdkd3hiV2FaRU1EQ0s3V2lobUsr?=
 =?utf-8?B?ci84WDlIMzRheElnNWF0KzVlZS9LNTZGbTNOUG1SZWIvWHlpbGdUNmJJOHlK?=
 =?utf-8?B?aW1Qdk9mc1hjR0E2Q2FxaWZLVGlGZ015QU53OFJra3ducUh1SGJJUURVYzlp?=
 =?utf-8?B?cW1oRENSUUp2ZnpjRkEvcDRqNmlrT3pVOC90eEcrR2NycitZRzFxT0NzelE5?=
 =?utf-8?B?cVMzZXdIOCtkME56YW9WaWVsOGNQRW1RdGpRVnR3TWtYSEkzMjdnRFdMRkJ3?=
 =?utf-8?B?NmNRZ0d3OFVKQVlVMnJjaWNqMUFRV2dOWEhaQjFMSEw1cGlacURVK2thNGZv?=
 =?utf-8?B?Z2h1Mno0QXNkTThvTlpraC9FMGRFaHNucWhxcTEwbXcxSGZtSEVxYkZ0MDBX?=
 =?utf-8?B?bEhtSFNvWE9GSlhCeSs1OU1Hck50QS9mRmNWeHFUVDB1SThXOGlZZlZxanJW?=
 =?utf-8?B?YXllSHBidVdYbk9RUThMa1FBeU1XYzNMVlVnd0s3bGxSQlFzcHlKbU83ckRD?=
 =?utf-8?B?QjU3Rlh6ZGkzQXJhUlVBZHB4RzRMN0dWQ2xaUkVkc0E3c3VUSEdGMndWVS9C?=
 =?utf-8?B?SVU3c0lMTVJIdWxvMys4eHZzOE1kWTV4SFN1TlFoWWZDY0NOUkh0M2srRjBo?=
 =?utf-8?B?c05TdmNNSjZ2dVhvMHF4L3FMT0lmdVl6cVg3cGtsVUdPUk5RV2dydnF2aDB1?=
 =?utf-8?B?TTE1dGlxUUlIY0xhb0czOVZQb1VWMDBwTTNEU1d6eVF1OUZYY1ZXQmViQ2FP?=
 =?utf-8?B?QlJ6TlVjajNoOE1BWlcrUkZRbUlGQ1BoakdFQTZncEZmQVNYcW9pUUVoUjNp?=
 =?utf-8?B?SUVoZjZ6Z2J4clZBcTkyUWtqL0dwKytKbVNUU3MweTVzRmZ6MVdyL0VyNDI2?=
 =?utf-8?B?Q2RYSEtVYVk0NU1FVmxIYlRxWVpvNklNVmh0SXRmRmFyaGtDQ0xiMXFDSDAy?=
 =?utf-8?B?b1JkMDZpWDdCTUpROWMvWHByRzJMVHdVOGVBUSsxVno2Q3RLM3AvRnNRUmZ1?=
 =?utf-8?B?T0JPMnlnNThtRVpSNUI2d1poT0tDYzN6N3lYWElKYXk0K3lWamNRekJkbTJK?=
 =?utf-8?B?TUU1SkVwV05WZG1WaldFMkdHcEwrTkF0VGZVV0RNYXZEZnNQN0VYQU4vVks0?=
 =?utf-8?Q?V9E7U/XqKXWlPqpFXqtBX4Z/Z?=
Content-ID: <9C48A624C5315B40831B2ED8C41F1AC8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964a03bf-b1c4-4243-d636-08da8f6d83da
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:36:15.2085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpbcNEN5Zo4GjkNPl9FIuGlxKQrzmdn1jt5aKNQJ65Yp2fiv35GvivJAuyumDSpoXoJDhwwat0TwsRBq1FnMqS4h9PSNCX/WLAbzwx/L09M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_113631_699272_374E705D 
X-CRM114-Status: GOOD (  17.78  )
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

On 05/09/2022 09:31, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Ben Dooks <ben.dooks@sifive.com>
> 
> The driver prints out 6 lines on startup, which can easily be redcued
> to two lines without losing any information.
> 
> Note, to make the types work better, uint64_t has been replaced with
> ULL to make the unsigned long long match the format in the print
> statement.
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>

Hey Zong,
Missing your SoB after Ben's here btw.

> ---
>  drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 0e0eb85c94d8..401c67a485e2 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -81,20 +81,17 @@ static void setup_sifive_debug(void)
> 
>  static void ccache_config_read(void)
>  {
> -       u32 regval, val;
> -
> -       regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> -       val = regval & 0xFF;
> -       pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
> -       val = (regval & 0xFF00) >> 8;
> -       pr_info("CCACHE: No. of ways per bank: %d\n", val);
> -       val = (regval & 0xFF0000) >> 16;
> -       pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
> -       val = (regval & 0xFF000000) >> 24;
> -       pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
> -
> -       regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> -       pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
> +       u32 cfg;
> +
> +       cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> +
> +       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> +               (cfg & 0xff), (cfg >> 8) & 0xff,
> +               BIT_ULL((cfg >> 16) & 0xff),
> +               BIT_ULL((cfg >> 24) & 0xff));

Could we use defines please for the register shifts please?

> +
> +       cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> +       pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);

%u here no?
Thanks,
Conor.

>  }
> 
>  static const struct of_device_id sifive_ccache_ids[] = {
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
