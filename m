Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32362C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmR0LPBbll9QoYHXI8mNdIfa9zX6tiOR8QTmnBzRiNw=; b=J5Aghdo5i1pO+C
	EKCbZbzLF0WhDu1mMRDgBeWsKAT4ngFAoMqLKlZYknfYIkg1I9KCeOzmv4MnRCjunbs7GacZUhVg0
	qPycLpVVf8wa585mQreg2KAbqvf8reY/9p6E2urWmAAz1J6zY1S2UdJMyd6LyFdAyNovccbPkqikY
	2v7/g4YIsPhMnIG1U7r7KOEMlc8+eH7AJYLdgOYgvRPHWLVxCjDe8u9JsP+DIapy//ZfGZSfgcmdm
	ZtksBxjWBk5mxDvlPoZNTGbQzqrJUy6+1RlAwIRL9r1H7AB5VuTdAmD/baRB9X0nMIe6b8r9Jihjs
	6QEQqNxl40DJFvdzXIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCiDF-00GMKI-3J; Sat, 16 Jul 2022 13:52:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCiDD-00GMJb-0D
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 13:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657979524; x=1689515524;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8LV76yXTjsCN+rQhK1KXE/wbfXpz0znSqAlK5Hkqu4c=;
  b=EX2piq9wbWU5f19zmrGkB18tmIQpFi40dCPka564N1RODBIyG6kBRwuG
   F4uRvzDCODFJM0pY0g12brnasIFZJMccx/Iw0KBgixheM/m7Re6EwxQDi
   waYKOR2IdjCxB6toMYodkcBTvbK+CH3Nd6zwfkA5uviWb/HXnsDPmv4lm
   AfxeYIa+Yg2MkZzlWS9YVQEi2+55qgjN6am53TTxaQWaLYTrCKfDwj0xj
   f0m8Yr/PSlg1BI15LlKKsMM1DBEF6usNHZLm6H6q19FVtQjnNB3U3XCiT
   YaBKlwWIiB8vZ1QOb/w63ia9vTcOwyxJ4ZoaF7miTdrwHerXmLKvWJJac
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="165044306"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 06:52:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 06:52:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sat, 16 Jul 2022 06:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT9xdix40BtXG6LjiuKKFecfj5NCtUvE6orLxRNeilog++ElUjsQLSJ3nrCk71PqwcfXMm2G5mORro64VUxhclE4fOY9+EbEH2yQh2wYHlBikN7eb/iXJQ55f7oXzDkFpXk+OWHHe0uVICCbr7d27fYSJ7DkpzLuQou9ydoVe+/Dp9jiEQTDSQDM5yK+W7COPj78XlUR7LUbMK4yhntYs0m/heLjVheCx3jVjLo7SZ6YoPOr/klfnc9kb29TDzVWg9ixMYOCoGf4NlS4XrIj09BwwvgkoWRVM8ADsAn2cKZG/rK/r5T01qNf0WcUk74G9LQvPTg6D8/LS15vATPnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LV76yXTjsCN+rQhK1KXE/wbfXpz0znSqAlK5Hkqu4c=;
 b=LFIQ/RiH7kHsgtJ64siKFQe9TCjrJVdCVL4csIEuT42veO1bxtQFLmyrXTTjXJT5TQSGmu2SEQyb7MuSnN6irlp9VPPjW3OdgqexJ6ungsEL1+MtJBPY9JK9khEokl99x6rGgq1yQePYxDhCtX8QzWnIRRRNcyeiCqXWEbRvpZILNJCTnZ2zJTy0NZHvgPAKMicHZepKcyVfRwiWatPBNIb6Ae+Rtc6tsgZiFIaUUX61wFySo8sq29Fr5Ra4BQ1bHPIHNsWOAOdp2/BB3WDsgqidViTKuqawcebDIB2976P65aSzjmqiT1XqpH/Hp7c52rvoLBKxuVcC0FiHUr1K2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LV76yXTjsCN+rQhK1KXE/wbfXpz0znSqAlK5Hkqu4c=;
 b=hEwcf/2BqHvrKxcyPHhbwX5SKMxjR/wDqKltAkiRctMwLcZHB763V3PR0TGQlMAT7nyHbh/cmUIh4RMUo0Ts7csxofpDEJsfg1rF+jliVKJT2vhIRmK6b73Bg+ywuLxK/vPYhjYyyMkE5k5rVMwsw7rclMQ/4FKV7kVzas2ofLU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR1101MB2279.namprd11.prod.outlook.com (2603:10b6:910:17::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 16 Jul
 2022 13:51:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.021; Sat, 16 Jul 2022
 13:51:51 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <Conor.Dooley@microchip.com>
CC: <jszhang@kernel.org>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Topic: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Index: AQHYmRszskc746eBeEittMqtckvNAA==
Date: Sat, 16 Jul 2022 13:51:51 +0000
Message-ID: <6e37baa9-a1b5-47f3-e61f-3bc40a7c29c3@microchip.com>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
 <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
 <YtKwjmbQmIMm4gEo@xhacker>
 <7292971d-9048-2b83-40c5-29c0a930d094@microchip.com>
 <6bb47d92.12c94.182073e1feb.Coremail.panqinglin2020@iscas.ac.cn>
In-Reply-To: <6bb47d92.12c94.182073e1feb.Coremail.panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81b635d3-f08c-42fa-6a8e-08da67325609
x-ms-traffictypediagnostic: CY4PR1101MB2279:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EnMywcco1xoK/DAeVjI907SPXf11UMTYyhawEFS/i2ulDRz/V7jOCvCw8qMH2w3NYtui0jj8idNrC5nOU5MwZGbmcl7HRPI4mKXvN+r7qqqMah3ZppR7+ypPSsTXjt329J++S3clPTy3ZPeHxpqhlNc6kE7M6QOc1QhMje2Lxo2hUMUQaXrNkzR4xadVMfBzDdXNYAHOeVIPmbZDxR2gFUiOC3zxSoc22shC8efePHSAN1xQOWim2RbTuuOjIpgP+lL9ILqzzh3OphvEZRt4aUaXssfvIH6nKIfnhgsPJLr/AqjYbXewHBoDEfn3+uFYjSOXZAfM61yP9IGsgbgVddelGptoMaI6TP7S/Qon2mBZI9E/1V6J9En1cI7YRCOg9VuU9m9m4daKilOzTW8lwwaKGBfk+vidbl/E61NG4NllBd3v1N84ME4xxTg/U4JdeX/9plylTmHkU9Ygtdd5flhDUJ7IwLtcb3Csp/mIZ2d+lKGIAsnhaQOZFkS5mzbIRcaTD78IxZJO04B8YSIwY8XmIcPp1mFlIFHHhylRBWUS78LNSK8QG3RJeXzf2ed1APkyZxJPwZISnx/iR4jVl9yvsoR+swlPUunn/43t85T1DP05O2NciX4jy3NHQk85AB51SnskFRPkCWqxRKoKnDVQKTtw4bu4bMGjMKPjDK9OzyEim+JXFfrvxGcPAqq4NXYXs1+OimG1rRcZujM/LCMfmmBvLZnf6yjIFNAYPKd/uP0A54pzMATZVk2KttR6fyIFaEWXxvc2Et70q5b/onV3upQBkTs1P03gA7MIzGAieDa2SeyNBXSjZcihXWkU8n6KYQMK/DhmhRsaGFThMEFRZy4Fs5livY21eW2ycl8x8STO6suh0LiY57S7SlrRbP8cO1KULbo+Zk3AUec6DqukBQMN+FCgelP7kmA7Ntg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39860400002)(376002)(26005)(966005)(6506007)(41300700001)(6512007)(71200400001)(478600001)(6486002)(53546011)(5660300002)(8936002)(31696002)(86362001)(76116006)(2906002)(54906003)(110136005)(316002)(36756003)(66946007)(4326008)(8676002)(66446008)(66556008)(64756008)(122000001)(83380400001)(31686004)(38070700005)(2616005)(66476007)(186003)(38100700002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFJabHlsRlN6bVhpKzFMWkdGdmlyb1VOb2pLVHgvODJSRTlvWHVTQlhVMjBr?=
 =?utf-8?B?OGNoN25rcVZhTFZITjhFRHZ6ZWJDd2lVekRkRjd4bDQ4SlU2RXFSeVZMTWRs?=
 =?utf-8?B?ZURGem96SEZDdlBINW56OTNhMllCLytZcUljU01XdWJPbUJxRjF0d3g5R2Fv?=
 =?utf-8?B?bFBEMUxScnNxRE9BUDdLRTVkZU5KV25lanFRNHNuT0RneEtJUlpwWEY1bnY4?=
 =?utf-8?B?MjZJOWFzM0ZxUjZEWHBWS29zWVc3MmcrVFBvUzgrSWhnLzRtT3NQYzJKdWVW?=
 =?utf-8?B?WENwSnUzYlZENzVXblErTC9JVWhjOGd5K3V6Qm5Pa2tDK1J6eXRnL3k1MDdO?=
 =?utf-8?B?QmFodTdDVmFJckRmdVA4U1d6djFDYThwUEtrNTcrS2IwZkZSMmd5N1lQQ25q?=
 =?utf-8?B?WHNMSTJZWjhuOFN4alVjTDdNWVNudVRHbzdYNDhIRXNXK2E0a21hL1h5WXRW?=
 =?utf-8?B?UnNKWDIzWG1QTEJsUi92NkdZVFNYVXZDU0RQLytxcGNuUHY2eC8xQXBMMjVD?=
 =?utf-8?B?R3ZOa2V0SWh1NnZRUVlXdWNwYzY3bW1CaUtqbVdpaWdtUVFRRTYrZ3ZVWHp6?=
 =?utf-8?B?eUYySDRNVVhGUm5Sc0QyekVHY29zeFM1YVRjTnBtU3hTTmFpb2RaM0RZQi9R?=
 =?utf-8?B?TW03R3VOclI2ZitLSnNRRG11d3RkOW9NSGYvT1EyWWMwVnNnMkdQazdoRnc3?=
 =?utf-8?B?MWNrRWN0T1IydS9RNjVORnF4ME41bTE3Wng1aEQzcjlpbmZvazJKc05mK0Qr?=
 =?utf-8?B?VW1EZi9qeG1aNHFhS3hnaW9CdGVPcHZicjdNVmExZ3lvQzczSVlFc1Q1SFJC?=
 =?utf-8?B?YVQybkpBa1dGeHQ3K0dkZjdZN1FVY1ZoTlF6WlpxbkFDbVEvVTVhdkg4WXF6?=
 =?utf-8?B?TFE3dy9SSTRMQjFDeEtnb1NHMXpYUVFvSDB3c2czWWMrWVNQKzYvdHRZbkwy?=
 =?utf-8?B?SmFEaHZWRlFXaVF1OWE3ck1udTFJTUJYNVM4QlFOUHRhLzhNS2hrMVRzTHlL?=
 =?utf-8?B?a0E4Y3hkL2J6UFYzQTNLcFphR2l0QWxCRmtLeC9RM1gwRTZ0RlpwYXBFRUVM?=
 =?utf-8?B?NE9EQ0JJNUMzTi9uakZaMCs2TEtjSzhPN00yY0tLS0syVU1jSHZ2NWsrSHpR?=
 =?utf-8?B?MVNYRk9UWjI5elJLVURUbXFxQTViUVgrc2tkQVRMdzdsd2NmWkRPSG9oNWVn?=
 =?utf-8?B?YVZTb1RSdXRoY3BMTkVMNW9SdHRyZFZjNFdzUEZySWdhemZmT0FyMmpPZHg2?=
 =?utf-8?B?c0tNQStZMFpJeUErbDR5dEltVnhkV09mTk02QzZsZlE0N2V2WWZOM2lKVjVi?=
 =?utf-8?B?NVVTQ0kxZElPMmhDRnN1cmJ4bFZGajhxczN3OGFtZkFUM0pRMlFRZ3FkemZT?=
 =?utf-8?B?SjR3cWE5T1ZEMHg2WnhBTUxKblgrOU9FNGtrajVmNHVNUzFQZlBwMkEvUmtG?=
 =?utf-8?B?Q2krME5tdjJUTG5nMDhabVJvK2Y1OG4vUWVqUDUrVGdELzRvcE9udVRMUzlV?=
 =?utf-8?B?ZndjV3VKVktMV21Ca2lJUmE3elRmRW1zTHZEWGd4ajFNc2pNenZQZ1dYTjh2?=
 =?utf-8?B?Rlg3a1FBcnJndHFYOEVOeFpKT21Vam42a3MxdUJSTEpBSy80eExVQ3M0UFhG?=
 =?utf-8?B?WS9XVm03OEZYUE41ZG5SRlNRTkptdlRxaEd1NXRmOE5jSkZUUjd5S0FEWjFN?=
 =?utf-8?B?ZGJEaDV3aXBrT0dxNzNFc0hZUzVQNzVxZ21LeU9uVjFBUDQ1bkJQN09KNGJ5?=
 =?utf-8?B?RGQ0T1Rxam9ucmFURnd4eGxraGZkc2tTdlIrb3Y4ejZsTUQva2FYT1VmcmpY?=
 =?utf-8?B?alIvWWJNeXkvdEhReXZhYXBoV3RRaE11YnBkTWl5VkQ2NHpLSlU1OEkwWll1?=
 =?utf-8?B?NitrdGRzcXFzN3hRRzVpVFVBNkt5dHNENEJBb2xFbklzZ0UxSjlSUmh1RkJZ?=
 =?utf-8?B?Rzg0UmxDcGIzcTVrUXZ0YzMvb0MzU0dSTUpIN3RhR1pLSUltaDhhVUZRQzVD?=
 =?utf-8?B?SFlIL2dOWUF0TGxaNGNmUER2ODhNM20wYkQ3T1ViRjVKbzhFd0IrbW04aDVa?=
 =?utf-8?B?eXVuRXlkZHJlV0Y4YmNBaE9XZkIzNmIxaXJKeTJyN1MzOUx2TXJML3VMRHVS?=
 =?utf-8?Q?Ihe83GiHdJGCZ+erEz1xONqZ+?=
Content-ID: <E47E115877C48C4BBAD709BADE4D5DBE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b635d3-f08c-42fa-6a8e-08da67325609
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 13:51:51.5673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q27Kubo5nlZbu0iZjbfxKCzTNcqhqMko9kiUQuNbuyFqDLk+UqSAQQIhHZbIlZ5iNv4hR4axwfyWAUFDyPdUNiwZ2uTpk8A85J4T3ftkRnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_065203_131699_AE192D98 
X-CRM114-Status: GOOD (  18.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

DQoNCk9uIDE2LzA3LzIwMjIgMTQ6NDEsIOa9mOW6humcliB3cm90ZToNCj4gJmd0OyBPbiAxNi8w
Ny8yMDIyIDEzOjM1LCBKaXNoZW5nIFpoYW5nIHdyb3RlOg0KPiAmZ3Q7ICZndDsgRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+ICZndDsgJmd0OyANCj4gJmd0OyAmZ3Q7IE9uIFNh
dCwgSnVsIDE2LCAyMDIyIGF0IDA0OjU2OjQ1UE0gKzA4MDAsIHBhbnFpbmdsaW4yMDIwQGlzY2Fz
LmFjLmNuIHdyb3RlOg0KPiAmZ3Q7ICZndDsmZ3Q7IEZyb206IFFpbmdsaW4gUGFuIDxwYW5xaW5n
bGluMjAyMEBpc2Nhcy5hYy5jbj4NCj4gJmd0OyAmZ3Q7Jmd0Ow0KPiAmZ3Q7ICZndDsmZ3Q7IFRo
aXMgcGF0Y2ggYWRkIHR3byBlcnJhdGFzIHRvIGVuYWJsZS9kaXNhYmxlIHN2bmFwb3Qgc3VwcG9y
dCwgcGF0Y2hlcyBjb2RlDQo+ICZndDsgJmd0OyZndDsgZHluYW1pY2x5IHdoZW4gInN2bmFwb3Qi
IGlzIGluIHRoZSAicmlzY3YsaXNhIiBmaWVsZCBvZiBmZHQgYW5kIFNWTkFQT1QgY29tcGlsZQ0K
PiAmZ3Q7ICZndDsmZ3Q7IG9wdGlvbiBpcyBzZXQuIEl0IHdpbGwgaW5mbHVlbmNlIHRoZSBiZWhh
dmlvciBvZiBoYXNfc3ZuYXBvdCBmdW5jdGlvbiBhbmQNCj4gJmd0OyAmZ3Q7Jmd0OyBwdGVfcGZu
IGZ1bmN0aW9uLiBBbGwgY29kZSBkZXBlbmRlbnQgb24gc3ZuYXBvdCBzaG91bGQgbWFrZSBzdXJl
IHRoYXQgaGFzX3N2bmFwb3QNCj4gJmd0OyAmZ3Q7Jmd0OyByZXR1cm4gdHJ1ZSBmaXJzdGx5Lg0K
PiAmZ3Q7ICZndDsmZ3Q7DQo+ICZndDsgJmd0OyZndDsgQWxzbywgdGhpcyBwYXRjaCBtb2RpZmll
cyBQVEUgZGVmaW5pdGlvbiBmb3IgU3ZuYXBvdCwgYW5kIGNyZWF0ZXMgc29tZSBmdW5jdGlvbnMg
aW4NCj4gJmd0OyAmZ3Q7Jmd0OyBwZ3RhYmxlLmggdG8gbWFyayBhIFBURSBhcyBuYXBvdCBhbmQg
Y2hlY2sgaWYgaXQgaXMgYSBTdm5hcG90IFBURS4NCj4gJmd0OyAmZ3Q7Jmd0OyBVbnRpbCBub3cs
IG9ubHkgNjRLQiBuYXBvdCBzaXplIGlzIHN1cHBvcnRlZCBpbiBkcmFmdCBzcGVjLCBzbyBzb21l
IG1hY3Jvcw0KPiAmZ3Q7ICZndDsmZ3Q7IGhhcyBvbmx5IDY0S0IgdmVyc2lvbi4NCj4gJmd0OyAm
Z3Q7Jmd0Ow0KPiAmZ3Q7ICZndDsmZ3Q7IFlvdXJzLA0KPiAmZ3Q7ICZndDsmZ3Q7IFFpbmdsaW4N
Cj4gJmd0OyAmZ3Q7IA0KPiAmZ3Q7ICZndDsgaG1tLCB0aGlzICJZb3VycyAuLi4iIHNob3VsZCBi
ZSByZW1vdmVkIGluIGNvbW1pdCBtc2cNCj4gJmd0OyANCj4gJmd0OyBBbmQgd2hpbGUgdGhleSdy
ZSBhdCBpdCwgdGhleSBjYW4gZHJvcCB0aGUgIlRoaXMgcGF0Y2giLg0KPiAmZ3Q7IA0KPiAmZ3Q7
IEkgbWlnaHQndmUgc2FpZCB0aGlzIG9uIGEgdjEgKEkga25vdyBJIHNhaWQgaXQgb24gc29tZW9u
ZSdzDQo+ICZndDsgdjEgcmVjZW50bHkpIHRoYXQgaGF2aW5nICJBbHNvLCB0aGlzIHBhdGNoIiBt
YWtlcyBpdCBzb3VuZA0KPiAmZ3Q7IGxpa2UgdGhpcyBzaG91bGQgYWN0dWFsbHkgYmUgdHdvIHBh
dGNoZXMgYW5kIG5vdCBvbmUuDQo+ICZndDsgDQo+ICZndDsgVGhhbmtzLA0KPiAmZ3Q7IENvbm9y
Lg0KPiAmZ3Q7DQoNCl4gbWlnaHQgd2FudCB0byBmaXggeW91ciBtYWlsIGNsaWVudCB0byBub3Qg
ZG8gdGhhdCB0b28hIDopDQpUaGFua3MsDQpDb25vcg0KDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBo
aW50cywgd2lsbCBkbyBpbiBhIG5ld2VyIHZlcnNpb24gcGF0Y2guDQo+IA0KPiANCj4gVGhhbmtz
LA0KPiBRaW5nbGluLjwvcGFucWluZ2xpbjIwMjBAaXNjYXMuYWMuY24+DQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdA0KPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
