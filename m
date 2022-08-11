Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A17C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EskX9X4XJF1FlIw8vr1P+xuGa5i1jssdRAddBi/BwGo=; b=DXAA3um5IuF2yE
	QY661cUTu5POtm7zILbxqhQwnBk1dHvfnIQJooVngYjavn//5ibKsxQxg8x12dS+ydtokvENcMNjO
	HBiSzQSjeT0pxfDZn/kvVN1nLeZMl8/XST3sKD9avrBBuWLbQptU6w3Oqk5Wq+YYw5HvKC5SgeACI
	BDSCkS09NmSHPTER1YtLOg9omEk9H+2xvZN0s62tvl40JqxZ6f6cCcB4sz3vXqYqPBEMfujB5MTI6
	jmIYa5sm5mDGLIN+cVaQWbfxLbFRM5SDp2UmW6KFoRbcPCHL36Td6+1AA/OS+kqd8fj4zvSqhNR7k
	8h9X4Xhrwm5OzpwHyIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM80M-00CVs8-Rc; Thu, 11 Aug 2022 13:13:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM80G-00CVmk-Vk
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 13:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660223616; x=1691759616;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KuSYKBYFNsbsWZvdnLIqkQDX+RvlLX6gIK1Z5XnggLU=;
  b=Adl763rFdSJk7MBR+hrpnT0PRoKtwLFWjC2RSRPZO3eHEyoYyvek4EEE
   w1MAKAlik/8sEQnuGUuDoAIXdbjYp0lBxKNbcSLM/HUGFdgOjH/gKt5aA
   vFR8oeAhw/7YERuU5dxFb7/ey2DjmQnq01ZNZiFMbsRH8mDev4wkeLTaH
   7pnuyfG2WngElU4Bnt4BLxvohNxtyfcUk70xkXVNQV6XTuPaqdn5HdKAN
   ghN9+mJZW8x/8noO0vr6NoWuStCVTfQ6qu8g0BuEtqCrkBXxe+GWcErab
   QnmCBOV1sQUErLbmj0oNFYXjNBQBQVpjZK1OkqlmzdjA0BPUi0AxBRoNa
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="108609813"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 06:13:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 11 Aug 2022 06:13:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 06:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4zA9NTNS6aroQsVJHBn7aaIAikAjPzz700Mzfqsp2L/gevIdkJjSaWDstqpk6BoKfpwzG6fKb5Wt8BX2D4U/q2IBy4PmiORDbjU+JxsFi9UaVMdeb1kstTVqF8OL5mSOEnP08HEkQxD9sUdWBq23VmIY8fbyjRLSRGyxvFfFxaidANDcDNV42ecWKucefzkb9HoiJ7TGcU8BOrWxSF4lAmUGUCq3QjMVgVnmySwtYRC3h9Ql1kYYNEH40YaSvmIsqd1MN2ZkV2w/eNapjO+QtfW2HaRJ/CrJZiYgolsYMUdQ0ogvrBzua1PgdEO+gr+15ZKXwzc/VDeh/oUBAnbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuSYKBYFNsbsWZvdnLIqkQDX+RvlLX6gIK1Z5XnggLU=;
 b=lZVhHGo4U5b2WR4lrowoofZsQDfmoAnf5VpkWJK/lXcp0nr+sKL4+3Q1sfiv0zOa5KcE5DRGCTNe3hcHn1n56u+erS48AU0iBKeLx9bm8KbvCvMoEddCa75RTwNVBkwFexdlHVOhx7tMGwm8idv1OlkZRanh8CW3cyVnTjHLihqBQxsvSv6ZWRCYQKA+/aidzcId1mQjofzqERK7Oxel3riDKL0DDbwaLlCzqOLuUGwCPRIkaWE6eNtz2GqCtmCo8g5V3/yHQtl/sSRNddV+rHVIBcCZPYRwD/oFKOF6nmnWVgAFmoJcKU4dOj0IAEiknzb3YaWwR8PRoY9Ue16kGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuSYKBYFNsbsWZvdnLIqkQDX+RvlLX6gIK1Z5XnggLU=;
 b=CvVfov4JsvGVcnB8bxee47x03NdadOrkt3eVQOGbx1GN7wa7DNIHEwRCjXISjoKlIX6XY6dum5vWjl8tSxIr3bM61lprSEMusBtXPb8LrsjPL1PzANqMUsSJJLI2L6nmwsoMO9SdP/UEXvbXOlLlDdvnjY6mmJsZadKs84Dp9+w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 13:13:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 13:13:24 +0000
From: <Conor.Dooley@microchip.com>
To: <nathan@kernel.org>
CC: <ndesaulniers@google.com>, <llvm@lists.linux.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Daire.McNamara@microchip.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2nacwAgAFM1ACAAAaZgIAAA0QAgAADOwCAASU6AA==
Date: Thu, 11 Aug 2022 13:13:24 +0000
Message-ID: <d38d8b9c-45da-c464-264c-bebd084bdb17@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
 <bd14f1a2-750d-2511-df0a-85a9f5925f84@microchip.com>
 <YvP/bjh+wXihlrdG@dev-arch.thelio-3990X>
 <fc470bf4-33bb-d67b-3860-3ac775982f27@microchip.com>
 <YvQHtGObJwyBKGCQ@dev-arch.thelio-3990X>
 <3d2c56fa-8245-4992-2074-cd39677c2b3f@microchip.com>
In-Reply-To: <3d2c56fa-8245-4992-2074-cd39677c2b3f@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89b372d7-d0af-46b6-970d-08da7b9b4597
x-ms-traffictypediagnostic: CH0PR11MB5428:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YW3ywF3eAR9V6/ZbtgpgpsfNHJwSn467WjDvl0M4cAnEcgKMHHTOlntPGe8BOyzTppqVJSQ1oX1zcipxPh0IvwISzhJ9p0MfjF7it6b3HbYBLBCuJgdJuk/cxUrYHvMAWKNKmUqGe3HgNUV6Q8rto+HpB4X9MhEoHWeak8DT/WNg9cB6vqwI1zElQVskpp6pZaNH+xr9gVDxRk9IVhCPGbYnxd9JWstqdAEVkQb99c4RMYoUNYYXZTOFJxBdszvCTsxo6e6d0Y9WWcBVeSDpPldOM6O/HUij5awtQmeFUBClSiPs108ze2RAJeTfS/e2wl6+KjNymrOuSSWVBXxFn3/xdpCpdf4w756leKWz7cjG+51iC8SWOc6sxlELKc25r76gRKfuic2Y0aJIMEiAdNor27RsqurPB5gsbTe5bird5gk2NUxMuU7sBnraBKV8CFnM0BkzJFy3WbTFZIwszBeMHCFZYfVmv6KLHKfc6+sFyoPZ4WfYbsCX3gAezd4xdXk0nQX+ghCZMWSqYSIGjnAvRv3CQw9cFQXCAFKQyJTg/X4DImuar89nLL0FtalOuQmzBx3f0OGZ6B991Hlt5R/shAKyDbTn5caU9sc+wZEN0L8GCys0uty4A56nh7KwAn1gNu1buJ2QHTJ9dc33iaRTKFPQQgv5Gzqg/qCekH0sK6gxyDv6sIstEne9hv6z0BcJP9HZfQV+iKBA16z6sYqmb1CrtCuZPAxYud7JiGUSxZhkei/hVzseRXikvVOHCOQyiBYJX0S0vNY+9ICqq7YcxiMywYVt8QNNlQmOmmPIhhJOTHSZb2YvMwp0/p017McgRj/gTNQLx32qbDygW5LYyfSjZQ1JlTpNQo6mQrz7V1wpKH/LIYbawwFukzrr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(136003)(396003)(39860400002)(376002)(5660300002)(8936002)(31686004)(6486002)(316002)(66476007)(478600001)(91956017)(54906003)(76116006)(66446008)(66946007)(64756008)(66556008)(6916009)(36756003)(41300700001)(8676002)(4326008)(71200400001)(26005)(83380400001)(38100700002)(6506007)(53546011)(38070700005)(186003)(2616005)(2906002)(7416002)(31696002)(6512007)(86362001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWRVR3lRUmhGTXo4Yk94TTVGM21pSTRxQis2QkhmZWJURWpvZ3kxeHZvNXpJ?=
 =?utf-8?B?VUJsTUlxZjVvZFlEUG1VUlVwRTVrZ3RocFRyZTlCR3ZQWXhKNzhTTm5JUEJQ?=
 =?utf-8?B?NnRLdW5raDdsN3pSZVdwMmFIUnVVRHhMOTZPelpTQS81c2c2cldFRzk3bFIr?=
 =?utf-8?B?L256ZlBOQTVKMXAvWGM1RDZVRk8wcnhraUhlRHFQTFdxeFRkMjVTWnBvWTd3?=
 =?utf-8?B?M3R6c3g2SHJaSUljYUcwb0QraVFJWklQd3YyUWVGV1hEOVdleHIzNERPWHVp?=
 =?utf-8?B?dkN6YW1vQzJIUXRhK3k3QzdLQTA2dmYxN3pxNDFoUjk2SjViZGNBZGk1SEQ4?=
 =?utf-8?B?NUU3VHNEWnZ2Si9GZzN4Q1RaZ25LcWhtR0U0TWpNazI3Q2YzNkhDOWFDcXgw?=
 =?utf-8?B?Wng5ZGFtMnU4VGpmcUFQWnBUMHVpNytHZEZHeGRVL2ZNN2JvaCsxYStVTXlC?=
 =?utf-8?B?LzdldHc3dFRoSVhTQStnK3BtYmpPMkJ2bkxEWXkwTVZJblFic29zZWp2eXNo?=
 =?utf-8?B?VmIwZVhzS0JnS3YvY0JMeUlmQWVIVWpiWUhzdnVJTWpkV28zVHhneU1icWhB?=
 =?utf-8?B?dk1IV0dKbEF0cDZYejRDbUlUTnA4cGhhRSsrME04SnBGNU9xNkFsQkx0eDFu?=
 =?utf-8?B?aVdHZld3QmNPb3I2NFl0M3VuUUZDQ21oRmhNeDhxamV2QWYyVERQS3QwYlhQ?=
 =?utf-8?B?Y0YwbWNqdkRBSmcvMk9TSGNzWVJMSzAvL1FwVHJFbDB1YnYrTklEMFBPZmxM?=
 =?utf-8?B?YkxnUGduVWx1QS91UTVkNWlHc1RrRENSdjRFemg3YXcvTndNR3JMSitzaHVz?=
 =?utf-8?B?OUFMY0hyYkRmZkxraEtpeG9RSUdLellPUWdoMVphb1d1eE9xRjFrWE9UR1gw?=
 =?utf-8?B?d3dXTFBWSTlQaC94Z1hwNFQvdVhvT3V5aFRyTmZoTkFlVFdFcHBRbnB2MGEv?=
 =?utf-8?B?RUxUTUZ4eGt1UXE5d1JMZW54R1RXRHR4UXhlTS83STA1dHg3MmpBZllCb29y?=
 =?utf-8?B?Y0szbU0zdWRYM2lUNElaeFRUYXZNT3FFYUFCcXBYWnY1ekZWRmV4QXRSMUhp?=
 =?utf-8?B?S3UyUXBJZEZqUGNLTVFwM0RwK1pMRkhMdU5SMmYrK3c4Y1FoQnJoNmNlQno5?=
 =?utf-8?B?a1NaNlVkMTY2WGZKc0NRR1BmU0FFcWVaai9qMmoxTVZhdlAvQW5EdTVUazhB?=
 =?utf-8?B?RE5HbFBtL1BGSVpRNVJMc2NEbWFQdG1YSDdnNlZQeDVNYkdPQk5jU3VHUnpj?=
 =?utf-8?B?U3RrMkVoZ2xNSlJCRG1CTHlLdGR4R0tEWFVOaEZoZnV3WDlFczlpUkJQYlpK?=
 =?utf-8?B?ZStMbldteGM3U0pQMFVqMWZ0b0NOQjRtOWkxVXFnb1VkanU1d2xCS284bVJp?=
 =?utf-8?B?VlcwamkrcFpSV3lsdXhzRUMxVkJuZ0lySE1EM3p3c3RaUnNrMDhRMHR4bGhj?=
 =?utf-8?B?M1pmMVZTWVpTejF3c1RFM2w3TVQzKytMbWcxZ3ZmS1NWV3QvZWMzc1o4WHdv?=
 =?utf-8?B?SmdibHF0NEZ6MGQzRGI1bi8vK2VXZmxhWkdoRmcrcUl2NTZvTGVCN3FwTU54?=
 =?utf-8?B?U0w5L1pNYkFzQy9xMHhtK2h1VkxlSkZpcmhLWStEQXpLYUMrOWRIUHRjQk1u?=
 =?utf-8?B?eWpIcjFpNDhveHpRNXhUejUyNWZ4RktHV0x4VG1PeHJ3TC9RZHVkdTZuS0J3?=
 =?utf-8?B?NDNhOU1LdGI5YUlaNG1yNmVRU0V4ZzRnQklpQStNSFhEYkZXUUZXTVhadUlU?=
 =?utf-8?B?VGV1VFRXdGxJbXRLcU45Y09Nc0k5ZVdFRUdUVFJ0dG9Dd3NpSXQ2ZmR1WHBQ?=
 =?utf-8?B?RDJJc0JXMkJnK1UrMXkzOWZxb2hXeGoyR2t6M0hJREVwa1c3ODdzY09ucnRk?=
 =?utf-8?B?MCtFQWIwN2hURHlEVThYbDFBekhLN2wraXgxY3Y4T05Kc0ZnWlp2a0FxeGhN?=
 =?utf-8?B?U2dVU2ZoUU9hWUZnYmc1d3RqRHp3VkZpYlFtbTN5NkMwWWNTQUY3VnppREZK?=
 =?utf-8?B?UkFPZnpJTDFBVVlsWUVGUkVTZkhwRXhLRE80dzdDOVlJODU2QklOaUpldm5i?=
 =?utf-8?B?SlZUUjZFOUIxTllXUk85MkNwbEYyYm9QYWR6QVdObnJ3d3FqdGVyV0p2eEFn?=
 =?utf-8?Q?fE3ufMB/aoLwhDSwMz0jN8Kl7?=
Content-ID: <6D272C5509564A48AA84DCFD0F5FEB85@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b372d7-d0af-46b6-970d-08da7b9b4597
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 13:13:24.3587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IebY5omkvkinl/upvjh3wJnX+KyYPFjd9/1n/eR/AlXgE3skwM/+3260oSummnIkW72Z1r2hqX+uJyi7BGd5bxLe6c3orRZd8DWOVpzL9DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_061337_113766_AEDA855F 
X-CRM114-Status: GOOD (  31.30  )
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

Hey Nathan,

On 10/08/2022 20:43, Conor Dooley - M52691 wrote:
> On 10/08/2022 20:32, Nathan Chancellor wrote:
>> On Wed, Aug 10, 2022 at 07:20:24PM +0000, Conor.Dooley@microchip.com wrote:
>>> On 10/08/2022 19:56, Nathan Chancellor wrote:
>>>> Hi Conor,
>>>>
>>>> On Tue, Aug 09, 2022 at 11:05:32PM +0000, Conor.Dooley@microchip.com wrote:
>>>>> +CC clang people :)
>>>>>
>>>>> Got an odd one here and would appreciate some pointers for where to
>>>>> look. This code when built with gcc boots fine, for example with:
>>>>> riscv64-unknown-linux-gnu-gcc (g5964b5cd727) 11.1.0
>>>>> The same code but build with clang build it fails to boot but prior to
>>>>> that applying this patchset it boots fine. Specifically it is the patch
>>>>> "clk: microchip: mpfs: move id & offset out of clock structs"
>>>>>
>>>>> I applied this patchset on top of tonight's master (15205c2829ca) but
>>>>> I've been seeing the same problem for a few weeks on -next too. I tried
>>>>> the following 2 versions of clang/llvm:
>>>>> ClangBuiltLinux clang version 15.0.0 (5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0
>>>>> ClangBuiltLinux clang version 15.0.0 (bab8af8ea062f6332b5c5d13ae688bb8900f244a), LLD 15.0.0
>>>>
>>>> Good to know that it reproduces with fairly recent versions of LLVM :)
>>>>
>>>>> It's probably something silly that I've overlooked but I am not au
>>>>> fait with these sort of things unfortunately, but hey - at least I'll
>>>>> learn something then.
>>>>
>>>> I took a quick glance at the patch you mentioned above and I don't
>>>> immediately see anything as problematic...
>>>
>>> Yeah, I couldn't see any low hanging fruit either.
>>>
>>>> I was going to see if I could
>>>> reproduce this locally in QEMU since I do see there is a machine
>>>> 'microchip-icicle-kit' but I am not having much success getting the
>>>> machine past SBI. Does this reproduce in QEMU or are you working with
>>>> the real hardware? If QEMU, do you happen to have a working invocation
>>>> handy?
>>>
>>> Yeah... So there was a QEMU incantation that worked at some point in
>>> the past (ie when someone wrote the QEMU port) but most peripherals
>>> are not implemented and current versions of our openSBI implementation
>>> requires more than one of the unimplemented peripherals. I was trying to
>>> get it working lately in the evenings based on some patches that were a
>>> year old but no joy :/
>>
>> Heh, I guess that would explain why it wasn't working for me :)
>>
>>> I'm running on the real hardware, I'll give the older combo of qemu
>>> "bios" etc a go again over the weekend & try to get it working. In the
>>> meantime, any suggestions?
>>
>> Are you building with 'LLVM=1' or just 'CC=clang'? If 'LLVM=1', I would
>> try breaking it apart into the individual options (LD=ld.lld,
>> OBJCOPY=llvm-objcopy) and see if dropping one of those makes a
>> difference. We have had subtle differences between the GNU and LLVM
>> tools before and it is much easier to look into that difference if we
>> know it happens in only one tool.
> 
> LLVM=1.
> 
>>
>> Otherwise, I am not sure I have any immediate ideas other than looking
>> at the disassembly and trying to see if something is going wrong. Is
>> the object file being modified in any other way (I don't think there is
>> something like objtool for RISC-V but I could be wrong)?
> 
> I'll give the options a go so, I'll LYK how I get on.

So I managed to wrangle QEMU into repro-ing. booting with bootloaders
etc isn't going to work (nor will the config with gcc actually boot
properly) but it gets far enough to reproduce the problem.
You've got to jump right to the kernel for which the magic incantation
is:

$(QEMU)/qemu-system-riscv64 -M microchip-icicle-kit \
	-m 2G -smp 5 \
	-kernel $(wrkdir)/vmlinux.bin \
	-dtb $(wrkdir)/riscvpc.dtb \
	-display none -serial null \
	-serial stdio

(serial0 is disabled in the dt)

With gcc there'll be a bunch of warnings like:
clk_ahb: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
That's "fine", not sure if it's the lack of bootloaders or the
emulation but 0 isn't a value the hardware will see. With the defconfig
I provided it'll fail to boot fairly late on because of missing musb
emulation.

Doesn't really matter since thats long enough to get past the switch
out of earlycon which is where the clang built kernel dies.

Didn't get a chance to look at disassembly etc today, but as I said
last night it reproduces with GNU binutils.

Thanks,
Conor.

On another note, brought up our QEMU port's state today so fixing
it is now on the good ole, ever expanding todo list :)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
