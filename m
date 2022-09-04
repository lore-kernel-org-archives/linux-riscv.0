Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1270EECAAD3
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DyI/LYgB1halN8Uni5MAzoC700WDNm6E1mYRL/LzJM=; b=GxUz5GjgmoCpq0
	utWQeYmTuI0JIvJBMiiFb9s0+tviGLuI3WhBjYw/LoueZhQOATM46nbrGxT/SCnlKP5OTIReXAIfm
	aBYfR3n34giDCqx1XlS2aigH4wUyl+vYcBpv1xoIWkgwLdMQe9nRHFSiOZHUL/FXt2hf9dCYS7LLv
	YvQGnIu4Hs8sazmgr8ElmACjHAHtmXIZ1ubEefAPnNbkXRdGfVTFjbP5t/V23fgyjBG965jgB9IFJ
	61HdTX5Sgje2ra3I9rujRU4j7pnpF/tIpKm+tKgVFLB3JQvheXELhIn+ASykZbp93zxAoVQ6SmtkK
	d7gbGcCS6o6qr/GD3dDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmYj-003A7K-MY; Sun, 04 Sep 2022 10:08:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmYf-0039rz-DN
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662286134; x=1693822134;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OHRTfU1LGDgox0zaasGoV6VXpNAwf7T34nwblS8GGZQ=;
  b=Z4NqRy9QwNwmG4gldMEP7yygs05SPufWonC4aTC7o7yQKX7HIAri2yYN
   csHX2KOyJz1CwTda8KCSFuiljEPTvYrd5T/SBdczlvHXDCHHFdK39rjU3
   6qIwaCMxGvHxNV8e58FJBxMFrHJv9gfw4p8hqIYyRkJqZXBkVGAqJssD3
   EyCWvkhODOkG/AR40VfRaCVQ3Jk32cue/ORX581CwSrr/UOTNcAdiDICe
   VGPrUeMds5v41aAs2Rrsqyn43hoPzwsk2Te4VlrkWDk36XCA+67PaLDtK
   myJo3i9mOp412Jw38G8Cjf+tD3RPLW4AzheVSedTcax9vq0xIIQYPnEf5
   g==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="178965582"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 03:08:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 03:08:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 4 Sep 2022 03:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRlxMbsuFcLWekKNe0c/yBme5M8rXOvOBCMqkOWJERrc4eMMhMOZ2uj6+1AU2ftIcpVOKTr3kIaMpY/q+iw7bk8iWMZQ8k3/diM8QtXpz/gJqsx6NpmR7mXfWNE5YOVgDg6A3CfeGqlwrVe87ytH1DEqjIPdWbJ3pVvDsqS1lDkacSPc+K1GV7XEFYXhifKVAEoo8ot/B3Lxjgy9wiGUCHVYUAy7Wa5GpXWk4Z9YRtEQIXNxs80g5eAqecGZ23vjhRw+jiFgi/47HM5F09kX0UZNllu4zOQrgOG5WyZZzyMgcbGRnZZBHh70v9AQwyP/acOewofUEEJJzGuP0jPfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHRTfU1LGDgox0zaasGoV6VXpNAwf7T34nwblS8GGZQ=;
 b=GrX+uUWufixHnoDSLOCSuBhDddk7Fe1VJfyGXCjElEfQmvsR2kYk0ckZlM7jLN2oBpwmvZBks1qNbG21b5FHIjMUi+R1pGKE3w1NRiS0VSS5RweJv1bKdjqU13xKbz/Rz0uUZzlu7cbrLnx0Witmb3rSQhmXrHJLoqW8Dx44yLbTy7uk0FIc479/EsVeELDDhVJt7CGoxeSIfTNaHTYhDdwnl31SiFzj3ui3Y+ry9ipup6YibN8ld1RziH3+h9Q19UdWgFumuydwRER/3YRQJnOGjjNGKKBwGTOyOs5bmVZiQGQX1HCMTDLXvxe0rUzHodSew78lebi7DKk0ZPgtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHRTfU1LGDgox0zaasGoV6VXpNAwf7T34nwblS8GGZQ=;
 b=sLYtXpOAgxz+hh/H0YhX/SqoDS4DYXQV4hx+0Dl3SZphIy4ScpufQErHXd4LBPZ7xmEvDwczC7dSREIeNbigBVkN+VQuI4ZK32KWFo+nDYZ9a/et6UhhvwN1r46z3ovFcFLyw1LcHQdNSOGYyam15nrJ4NEq5fIy4G8B1Q7HSDo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4208.namprd11.prod.outlook.com (2603:10b6:208:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Sun, 4 Sep
 2022 10:08:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 10:08:45 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<heiko@sntech.de>, <jszhang@kernel.org>, <lazyparser@gmail.com>,
	<falcon@tinylab.org>, <chenhuacai@kernel.org>, <apatel@ventanamicro.com>,
	<atishp@atishpatra.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>,
	<lkp@intel.com>
Subject: Re: [PATCH V2 6/6] riscv: compat_syscall_table: Fixup compile warning
Thread-Topic: [PATCH V2 6/6] riscv: compat_syscall_table: Fixup compile
 warning
Thread-Index: AQHYwC/pwZLrXffauUKzdFDCKMbywK3PDEKA
Date: Sun, 4 Sep 2022 10:08:45 +0000
Message-ID: <4f34f0bd-0a67-a9d7-82d7-895b63a9300c@microchip.com>
References: <20220904072637.8619-1-guoren@kernel.org>
 <20220904072637.8619-7-guoren@kernel.org>
In-Reply-To: <20220904072637.8619-7-guoren@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79008fc3-418b-40ed-71c4-08da8e5d73f8
x-ms-traffictypediagnostic: MN2PR11MB4208:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /QbrZ+UZoySxIo8zG5q4ki3DpzYFaQyBkLGTUy4RQnKJ+6AvmuEHUjX8YhTaw+2rkvHOLFl05kLxyHEFKepgSfucFBqvz+r/ESZprb0NJQCBA5S2xhoKwcMn7zXTtEeCIFf1e0qNg6f/dYfmIOjJGVp2iVlP52typE8e8NKwtuNxdeoP2ZK7kTCY9fa92FlC9+QKXgmUFBjbwZeqwlVjXvroxrv2xSbu4avryjIpC7puzcZD0KfJpFpLggMqUoYherKYSaOvzsJWsermUFGGRHqCCIRbPNRCOAvRo0U45Sxc1/KsJRQRUgIsj2g5dODdGbVswGDedAMNa+1cZL+0lmjWLa1m7xQ9Zt226JHGRJK4hFM6npwumT/ZtK4exWEalXj2Pveo/6H0v2H576MIKHxxlLbhJ2k/bsNDIbvFmySZDFFUjrUiRZ9fsq0aLwhg/qtbE6pMPGu9a2ci7Uz3Ftd/Dshl/lEr3X3Qxg14e1XRkYa9oG2PIubvyXBPI1jjOrLvXQp8g4wcoEZuFEeXSGcGGC9WQDe2Q3mH4xukoEOa7je2JHDeTjqyaEnYJSgL0D4amMwEZcrWauePctD7ebY5sij4UezKQpU/MzkZVjUh8L7WQVdTe3lETHsVplnA+B9cIcFYvrubcrR7HcQUsmOTiO/1eqXeHKOsgPwGTvTgMf4ViKKEYm5hAAFUrxosWM6IfceFVaYU0VXYJn8NzZRHGiSezWT/d+O1NkU/fL1lutXDOvE8RvkdA7pUtPHnJIVity+GYBOdVq49S8AmBudaLfppyz82djoIx02WBh9lonyZEJe4DQ6zrZsy/6zIXQcZV9ZHcxnHOGXOKgbuoc0vYGN1IWcJn9EMtex6t0geFp32HvjjBm9NX1I5Jtcp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(136003)(376002)(396003)(39850400004)(478600001)(6486002)(966005)(110136005)(54906003)(8936002)(7416002)(38100700002)(316002)(86362001)(31686004)(71200400001)(41300700001)(36756003)(26005)(6506007)(53546011)(6512007)(83380400001)(186003)(2616005)(38070700005)(76116006)(2906002)(31696002)(8676002)(66446008)(66476007)(66556008)(64756008)(4326008)(921005)(122000001)(91956017)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkRrS1N4RllKVEZ2MFViWnYrZWFpTTM4b09saDBtUm5QNGNHaEowak5sSHJv?=
 =?utf-8?B?Q3IxcWtHZ2M4VmhYTllCd05UUVhiUER5dVEvWVVYNVJ4RzVZMm8zZ25MMHMw?=
 =?utf-8?B?N1V6YjlDTW1PNW9KbW84WldKYkhlRlptZkxMU1RaQXV0ciszVlZ1bGxKMElJ?=
 =?utf-8?B?aE92d1NuWWRxYVNleElHbjRNUjU1NVBIU3BLQmF3RmlUQ3NZb0hOVlA1bkJW?=
 =?utf-8?B?N0JEbzFjVGVPVytOZERTamFXRm5rY3d3WjE1a0xGekRaalBOTDFsVkhYeUJt?=
 =?utf-8?B?eTNubXZCTXZZZUNPSythZlpUazJIbzhKVkFPM3BTN1NXQjNTbWJDRmpPTFdE?=
 =?utf-8?B?T0drT0VWUnBPNWhlZjRGZXBnZlBYRnFxMDZ5UWpxWUJxczlmR3NhUmpWc0F4?=
 =?utf-8?B?eGlrLzg1Nlh6MURWZEVDQjNqTjJCR09qdlRjUlVMS2xsYWg1SWJwMWVwMkx2?=
 =?utf-8?B?VTRYWGRubmdVR1k1ejZxOXk1QVA0enphRkxkekhQbXl1dlFKeVEzaThQNnlI?=
 =?utf-8?B?Rk56eS9ESWNhRk1lMTV4YmpKK2NZQWdYTit6eVJmdmhIbm11eCttWngwT3Jm?=
 =?utf-8?B?ekFSUS9nb1hLNHhlaEFSYy83NEF0d0RBMzE1YmErR2liSUkrQ2FWVUp2Rmpx?=
 =?utf-8?B?L0pJN29lemU3b1RUbFZtWWNwOXJLY1hybnY2cENUQ0cvbW8zb0NRaWNqKzB3?=
 =?utf-8?B?aFRzODVNUkpTV2NEQTJDZUlnYWg0M2ZKVy93Y1plSGc0dmkrYUpYdk9GcERm?=
 =?utf-8?B?bTBOZTZxb1RJcGdxckhyZEtNanBacVIzc3gzeEJZemNBUm1jbDcxSC95dFU1?=
 =?utf-8?B?amNiZEFtWXVvR2I0TzFyQlgwVXgzc3NRSTlpZk1FelFWTXhOMW9xTzhJTUxR?=
 =?utf-8?B?dm9HR0ZWK3ZOS1VOWFpEak4rKzFGd0o4eThERzUwK2wzWnEyZ2V6ZDBXWWlF?=
 =?utf-8?B?Z0U4NEp6RHBIemhEblBqS096VUh5N3VyeStCMHdvWHkwbDR0dUx1WEppOXVK?=
 =?utf-8?B?eWd1ajdENFZ4Q3BaR0p0ZFNZUStjWFhGSXBXZmRvek9UZHQ3SnQ1TGc4YmdM?=
 =?utf-8?B?SE02anZKZmd3UEg1NWNJby9hQng0c0dxa1VJY256eVkwd2Y4Uy91N1BYK0Fi?=
 =?utf-8?B?OE9KS3NDVTYzbzU3MnNyS2xwRGdRek42N1VQU2hVRlp5Sm8yUVVhODBueDlC?=
 =?utf-8?B?SmxrZEM3dldlY1l0cXhHTHFWM1dINUp6WXBmbkF6TlcyY0RTdEQ2VzcxdXA4?=
 =?utf-8?B?TkZRUSsrT1laWjRwVGI4NjBWWEFTaDNraXBnVCt4WTZFSElTazRuSmVwbWtD?=
 =?utf-8?B?YzEwMlZkdHNIYkh5TTlqOFpGYSsyM0VJRTQzRlduNk9jYXNYSUFaNVAyQkNv?=
 =?utf-8?B?REc1WGx1VzNhMHpyQVBwODBXRk9LWjFuWmZuOGZ6T1o2VXNQSDVwTGh6L0Nj?=
 =?utf-8?B?c1JYY3dBVzdZenFsckk3TzZIQXZVR1JCck5IQ1p4djRMSEdTVkp2OGgvcGlu?=
 =?utf-8?B?S1BkeDJ2YnVaNXdvM3Y0ZFp2OEg1bm1hYkFFNXBQSFh1OVRsOUQ2MGgzN2tl?=
 =?utf-8?B?YW5FeGN2L3hDYVdtZlphOUswTGpsQTkxUExRMjBLTlRNb2E1K0ZkSzRPY3A4?=
 =?utf-8?B?dzd2WThNK2xDajc3eFhuN21nSWV0bUZUZUpnMmY4dkt6SlBkRU83MUtHMDFo?=
 =?utf-8?B?Z0I2S0xPeU9zMHlyT0NvbWZPNitlQTJCdFpnYVhIVVNnOEtqZ1psdnBXUW0r?=
 =?utf-8?B?UlJvOWFjaGVoNlBXMzB6MnR4V1BhRHpTOHpiVmlkN2xRSHE3RkxWekJzVjg5?=
 =?utf-8?B?RnRkdVc4U2o1TTdYUW5uekxXbmlHK05OUGpweWZEd3Ircmw2d3FSK3dJdysy?=
 =?utf-8?B?Q2NmV3VmWUIzRVpzdkZ1eFQ1VDVqSTVjMlEyNUpkTEJYdUVGTFh1SHpQMWdZ?=
 =?utf-8?B?KzhFS0o4WEtrMG1YWC9DaTZZSFVObFBXZ0VaUFdHT0ZKZTJDTWRIZ1VaSkJG?=
 =?utf-8?B?Y1Q4azVjQ0NzWEk2TnplZmM1Uk5GNDhISnArL1JhVmZ4YjRXOERhaFNDMWtm?=
 =?utf-8?B?SVVISXp1dzhCY0R1bDgvRk9LRllLTkRVTEZ6Nk9hbUphNVdNcmUzVHpzL0dh?=
 =?utf-8?Q?Qe1kSis5LK8v3VFVsL03EPP31?=
Content-ID: <7B78D95CFF4ECE4B949662ECDD4E1778@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79008fc3-418b-40ed-71c4-08da8e5d73f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 10:08:45.4799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCArFRHj06h+NlJmHVNnQojFrG+mDRmWfcpDswm0gQrmHzN6UzoqueMSdA1f689FyWxHpy6B9Srh+s33yXxfW6vSlIAUepZN8wpJtq7zahw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_030853_736802_ADF8D460 
X-CRM114-Status: GOOD (  15.40  )
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

On 04/09/2022 08:26, guoren@kernel.org wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> ../arch/riscv/kernel/compat_syscall_table.c:12:41: warning: initialized
> field overwritten [-Woverride-init]
>    12 | #define __SYSCALL(nr, call)      [nr] = (call),
>       |                                         ^
> ../include/uapi/asm-generic/unistd.h:567:1: note: in expansion of macro
> '__SYSCALL'
>   567 | __SYSCALL(__NR_semget, sys_semget)
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>

I **love** this patch.. I really wanted to get rid of these warnings
since they seemed to be false positives..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/kernel/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 33bb60a354cd..01da14e21019 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -9,6 +9,7 @@ CFLAGS_REMOVE_patch.o   = $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_sbi.o    = $(CC_FLAGS_FTRACE)
>  endif
>  CFLAGS_syscall_table.o += $(call cc-option,-Wno-override-init,)
> +CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
> 
>  ifdef CONFIG_KEXEC
>  AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
> --
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
