Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A5EECAAD5
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ym1rm9TZ5ONQkirL+88kxmnBERFS5RSexLZzGVyINhA=; b=JkgkSQ6kNHT4MO
	c4WHsHobmhv72fmacRa7hjOa6LB4ucRX81EQH+95SUir2wyi+TToeYUaB8aZjdkaK5ZlkooAiypxD
	2AivBU2TDPNiMmfEqFczzdeAFsWvwQvYuemhoOs56xM31SxtucyxZCGqV818jEqUxgYrMUoy2b9o2
	OfDj/W6KrpZhr5W1rC72I8bVToACaor7qW8MFJNN7PSoPfOf77xpKRZ+W8mh5zXbfm+ppT6Y2FOgj
	fxAVVgmONT/RnjRTjQnjaEzVbVGIdWOJ422xfXvFuumJHXFuTpyYU6TAP75HlvHqUnoe1c3/ZfNqS
	6IPlZcox87gaFm5rM7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUaP9-003d1u-U2; Sat, 03 Sep 2022 21:10:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUaP6-003cIk-13
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 21:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662239411; x=1693775411;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f4cknM2sEn+Z462YgGLrJgVHad2JXDrh0MsdNhkP6xA=;
  b=XUxPk+kJwEmjTklsoR1jC6WNn975mCHUxYnCG7zUGh/7YDyij+B96I+n
   jUI/EdxbB8WocgvQwhPNxk/BurC3IAwI0k5fl31qaaLyxlCjrjQPD1Zr+
   VKEHUvL2iw8GmN60c86DZqFQChTaFUlH43kpTna9BMseSCx14F0Q1joye
   CNe470fR0J64cjh0hVuFRSBv81lxc6e27+j7DsyaAXwk+bLt665Q0G29g
   Ed/PQ5mUt4OCBwj3Xt6Yi0lkl3ZawDRIoW4lNdcn/nY/uUIpoddYHKHe/
   Ko2oxvzIVSoAL1FiYcn7bN0WvYS/zNxOdaNQ+ypu8hZ5+vwMqNoYhA3R5
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="112073513"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Sep 2022 14:10:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 3 Sep 2022 14:10:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sat, 3 Sep 2022 14:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6PtclYL8/hbhoIIaxlFCtor6PBCg+4kXOrz5l3vfMfHNX0/B5i9RZ8iSuinfp+6AiXyqG2OITKIHid84kh+BcqVXRE5H9NBs8mzoICR3cmYbg56aa5m6nNhw28P4oFg0GxF9a5hKlIIwJtmBPeCU4Wnh5DbWI8B4IdbXxHn2SkltU2Pgo7WP/U2bf2MQcnRTvdF/b2tvFamEP/GFMLwH0gJL696zLCK4PxtnwBvXwT4IB+eKEKKb6fUCPsz4XjDAJ+yh3Mta7V0hG0Wv448G+HwPz6UrHyk0Xi9QsjrELKjGvhrVN2RTByZofHDLOnPr0hwj5q9ek9MlB/2OV+ocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4cknM2sEn+Z462YgGLrJgVHad2JXDrh0MsdNhkP6xA=;
 b=nmKahFfyo0YAXCC2AzDdSQiORJ8YJ4BI/WEZKwJA1+5faDIKaFPHc5ts2y66nQnSeyLnQkqu4QRIdV1OiE7M8t3j8h0/pS1zyylhQ/4WDrz9lfR/6w89+Bgz8Uo9y84/EsyX0PF0DvxmcWPPXH9aphHxPwXDW3D8zDqa/EYAp6Qq+/F4DulBj+R4BATaC17hhbUEy9o8srxIfU7nVXf0m9Xxh+aPNI4pfoppofG5y0C+lppFogFkfVPHsC0oEj8kjiNXMs0Of9e3eaYvaFyBQoasIzSxL1GUVuxuqy4e1eBonJR0kI7ot0CKC2CSKJMKyWIUUY4DhpCVdqGoUV2F7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4cknM2sEn+Z462YgGLrJgVHad2JXDrh0MsdNhkP6xA=;
 b=GcvdRP5qwIdbxHhYPh4iSuEk3+LeH8JgqmoxSfnnYnhFjNXjCCgZe0v+mCRU6/CEuR0amGGKmuVHVLhsLKZZEbuwfkBS1SfDTxOsJ4aI5xhjFL3+73huXcphotoG69K4vemEvBT/PCPgt/6Eid2B/9vMxLzqh7FDh9jO6jXFsQ4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4149.namprd11.prod.outlook.com (2603:10b6:a03:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Sat, 3 Sep
 2022 21:09:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sat, 3 Sep 2022
 21:09:54 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <Conor.Dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] Microchip DT fixes for v6.0-rc4 (or later)
Thread-Topic: [GIT PULL] Microchip DT fixes for v6.0-rc4 (or later)
Thread-Index: AQHYvuYm9WU9wsZ0AkupF4kHDs5Tc63OMsaAgAACc4A=
Date: Sat, 3 Sep 2022 21:09:54 +0000
Message-ID: <bc337988-01a1-ff16-965e-3f40702c9b34@microchip.com>
References: <mhng-9daaf911-5f32-4f2d-9fb5-2d621d5ba3cb@palmer-mbp2014>
In-Reply-To: <mhng-9daaf911-5f32-4f2d-9fb5-2d621d5ba3cb@palmer-mbp2014>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c52dc82-1ae1-47d8-d5e6-08da8df0a5d9
x-ms-traffictypediagnostic: BY5PR11MB4149:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 71Qeta6iW4UoT8hXKBWRrN3ESj8LcQKGbTHmmQMWDbPye+WU53QdP4fpqQdPPRvwNYLdTqUsSPQdMRlAMA0HiAU28TBjzMXfveQLU/ay712RMZO83dP5O0aTjrdFUDtxZZNWuY3zauHjqY87ZFHHLxOmnwkurowBiv/ygpPhcF8Kgi1fK1A7pc+b5Ngmn24n7VpCDaIjfHHs9C6rPzUX0jOtue623+c3A45TiU4616PuFEm1COA2eDEFluj7wBad+mG3JfnBOt6UEqO5E6dlg4zVSuVUYk9H+0TUx/sHzZcUE1E3gH+31VOjftdhVThISt8zhildKGz2DVbZfHVmiFiuWVBh8WGAI8mJOHUfpk32naWTsO/EweXKO56SelhzaqwIW0giLDER+OG1iUdKPgPmxg3BzjsbRweZFwYu7EAQa5FG8EbtRr23/7ooeE6W0i5SeaI7DwCQthzH9+JP7/ZD8X1d6Cgk4YyQM31X9idwklIN5JSZHANcPjXC/hbDiYRutMiPhGLjcYImoKqHbGTazRn4L5EI0YuQBuUgqYi1Kq4oQUKkKjUvpJtxbvyzugnxXdSo4rakd0ysFlOm+e+3n53JNc3+WZkZza9B/EycigkVnx9hBZw2vPBfqCotxhwHQeKZ+H+IrBHjqH6N11tOjyw0f9zR2YHarsui1ULwPxex+9XXATwI/72Yx4HAbzVWip68mOADHnoVZFrfHPxF1dLe/9FxDedLngAqDi4G6gFQYCIVRbnuAk1WCfnXq3dmbJg3MD+zmsMbP5aNz7cQkM4tBxb5ooAhhP9TyKFG9jZM8SaGQ+v+NIlmE9lEvCuGx5kKH+e8I4HLqZyU3+gkIRrzP2+j0cmZGmjEHS73iu/nmVYbsl8x/jwNTyLDiSZCAyom9w4c6CDN8SMlDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39850400004)(396003)(366004)(66556008)(316002)(5660300002)(38070700005)(110136005)(66476007)(8676002)(66446008)(66946007)(31686004)(91956017)(36756003)(64756008)(76116006)(4326008)(6486002)(86362001)(83380400001)(31696002)(38100700002)(478600001)(122000001)(71200400001)(6506007)(41300700001)(53546011)(8936002)(2616005)(2906002)(966005)(186003)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qkcyc0EyY1Q2U3EwaFNrWno2VzlDbUhNWkluNzdhWEY3YmV2bFBrQ2Foby9t?=
 =?utf-8?B?Y1FiQmpzV3FNVTNOU29paTNyZGd0eE9MVHpxOEdMcFNucDVNU3BHdWwwUDcy?=
 =?utf-8?B?Vk1RZFZTazl6bm9sK3h3K3UyZEpIRUttTEJ5UFhCQ3JUNm1zT0E4dEdXYWdJ?=
 =?utf-8?B?YThPZU5DTDVRbkEwdnd5aFl3a3lRNFFKNWc3WDNUQmtEbFE0TUJ5a0pMbjV5?=
 =?utf-8?B?eEdnU3kvdEw5VUZlSW00VTU1YXRoaXVIRU9ES3RBYVB0ZVduZFAzSEM1ODRl?=
 =?utf-8?B?VHJ2VEp2NlVFZE5pRzhacVlnRlRNZGxiOERxdlhqMS9CN0FINzQ1eG1ST29k?=
 =?utf-8?B?Sk11ditBWmtnL1NRbFA0T3RkVE8ySXNTY3RPV1J2ZjhuY3NLS3hJSm03ZG9P?=
 =?utf-8?B?b3I0Mk1LUnpSa2szU05kNnRRalZtaEk5Nmg5SFpwRWMxZjZ5cGZBRnZNbnNU?=
 =?utf-8?B?RFJsTC92aVhsUWV2YmRKd2NVL29pRnBadjVTUW1MdEE3OXNidEFYL0doM1N0?=
 =?utf-8?B?cDBDanNUODlLdS9lYlNicWg2ZVhtcDBvRnVxamt6bS9BNVVqSXU2K0s2dXM1?=
 =?utf-8?B?ekQ3VzFkN1NkUkJTSHZMcDA3YVhKZnVmTXRadDFpRUl2TVFML2dqbTJ1eDVY?=
 =?utf-8?B?MGJmZ2daUEpWK0NTTkk0MU55UHpZdDgvS1RtendndGQxYVFYbGl1S2VsV1R5?=
 =?utf-8?B?WG9SOWlGell1TTNpTU5EOVI0L3RsTXhZdVBjNldGUTVTUzMraUw2S1lyYjV2?=
 =?utf-8?B?R1pyV1l2dTg2dTk2RC9vVitDL2hqUlRtOFpZOTFzdHFhMjBlNDFqSFdnOWNa?=
 =?utf-8?B?Z0JqRzNRTHl2d0dGaVFQbzN2djRXQVRESU1saDNBeW5FRlJlaU5IM1Z4K015?=
 =?utf-8?B?L3VRSHJDVG9GSWcwZ0w5eCtZT2tkSkpyUkVxWnR3Sk9ESHYzakZxbFFJOFc2?=
 =?utf-8?B?OFplVk0rTTcwUEpOR2JMUloyS1ltNHJ5ZnpaRU5lYnQ3V3ZOYWZtcm5ML3JT?=
 =?utf-8?B?bVBBTWE2ckEreGVXbXY0N3lHQVBNNUJ6RGYvNjZKVjhTdExuMWhWSHVlVDli?=
 =?utf-8?B?NTZ6dUY4eVVnMyswMDQ4bGlHU2NnUlFHanh5Y1pvRk10SS9qVDM4cFlLT3Qw?=
 =?utf-8?B?VFFKak5JKzRIMWplUlhrV1k3bGVsZ2llMDErSUpVSms3T3paTExKK3FUREVn?=
 =?utf-8?B?andjR1BXVnh2K1hOZlpBNWpFbkhkZkJVeVd0Z0F2QmsxczhaRS9iS0FGUjBq?=
 =?utf-8?B?Q3RwUTJ5N3lEVWpiVjRlL1hyOE9POVpIQlplaTg4bEt3K0VtcEVEL3VneEdO?=
 =?utf-8?B?RElLZXl0QXlLcDdBSi9HTkh1NEhIdThwczEwb2N5SnJkZEZUQUxPR2FiYnJs?=
 =?utf-8?B?c3R0ZGpERVVINm1ySXNHbkhiSmljayt1dHZDMzlOcmlVM28wbUYwRCtuNXhY?=
 =?utf-8?B?dGFUVWhZbzN3djRZTHp1cHNhZEFBc1ltMTFIMjB0V3doZ05WSnZkN21xaUh0?=
 =?utf-8?B?cnVWZyt4TG5oWGtGbE83SWFvUHdzanZUTEJwTm9ERnBKbUZISHpnY0hhUThJ?=
 =?utf-8?B?RUM0TjdGdzR2T0M4SFh6MkY3eVgrNUlaeU13NmZ5ZHlqVG9ORS84WS9wQzVu?=
 =?utf-8?B?blFoRWRoNFBuMUVMVXFvUy9WUHBWN1AzMkJ2YkFwZlNUSHdTb1djaWh1Nk8v?=
 =?utf-8?B?YS8wZ1V3OGduclE0a0FxQjhZM0NUSHBEcGVnMVdveHpuZS9rZ1VBUDZPS3Ur?=
 =?utf-8?B?K2IzaURYWG80Y3grZUxoWERYME1oVEFUTCtRNFo1REVsV3JhLzBOc3RPYWhU?=
 =?utf-8?B?R25adVo2ZWduY0VMNStTb1hvaWxIK1hUdHZ0eHFHRG9QZVk0M3oxMUVpYWJa?=
 =?utf-8?B?T2U1OHUyaGlvdkN4dnhOeHlwODFNU0JPSnhYTWV1UHVDbURtYlJtamlIVUwz?=
 =?utf-8?B?RmZMS2NGL2N5cTlBUnRBbmkycXNPelNaNWRzbHZsWHIxU0JKUk9BZGEvZUFW?=
 =?utf-8?B?dDZKbkNtWklueVNDcGU2N01wdkEyTGhGTGhPUVp4Uzg5dlRhN3MrWnRUMEF4?=
 =?utf-8?B?VzlGMS9iMmFMNzNCcjZZQUdpZDlmNEpscFZMTWZMdmxoYXR6WmNWYnVjWGxt?=
 =?utf-8?Q?Yyt2lh/InUPLHAIO+rjYjf7hV?=
Content-ID: <9F59EF7B34144549893BD414163BD955@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c52dc82-1ae1-47d8-d5e6-08da8df0a5d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2022 21:09:54.0374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrRg+gyiWZJhoLWSznPPxqDeCi9qwoZ/5yXTgL0pQ9YIXo1+jJwWGURqI7RS1kcDtL3Z6Vx4sptn51XS6fVKguF5eSsqFvIAslfXD3WXY5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_141012_508520_37147C30 
X-CRM114-Status: GOOD (  27.41  )
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

T24gMDMvMDkvMjAyMiAyMjowMSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IE9uIEZyaSwgMDIg
U2VwIDIwMjIgMDk6MDc6NDkgUERUICgtMDcwMCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29t
IHdyb3RlOg0KPj4gSGV5IFBhbG1lciwNCj4+DQo+PiBUd28gcGF0Y2hlcyBoZXJlIHRoYXQgYXJl
IHJlYWxseSBub3QgcGFydGljdWxhcmx5IHVyZ2VudCBieSB0aGVtc2VsdmVzLg0KPj4gQm90aCBm
aXggdGhlIGludGVycnVwdHMgZHRic19jaGVjayB3YXJuaW5nIHRoYXQgSSBpbnRyb2R1Y2VkIGxh
c3Qgd2Vlay4NCj4+DQo+PiBBcyBJIHNhaWQgb24gbXkgYXBwbGljYXRpb24gbWFpbDogInBhdGNo
ZXMgZm9yIHRoaXMgZHQtYmluZGluZyBhcmUNCj4+IHVzdWFsbHkgbWVyZ2VkIHZpYSB0aGUgcmlz
Y3YgdHJlZSBzbyBJIGhhdmUgdGFrZW4gdGhlIGxpYmVydHkgb2YNCj4+IGJ1bmRsaW5nIGl0IHdp
dGggdGhlIGR0cyBjaGFuZ2UiLg0KPj4gSSB3b3VsZCBoYXZlIHNhdCBvbiB0aGlzIGZvciBhIGxp
dHRsZSAmIGdyb3VwZWQgaXQgd2l0aCBzb21lIG90aGVyDQo+PiBzdHVmZiwgYnV0IFpvbmcgTGkg
d2FudHMgdG8gZG8gYSByZW5hbWUgb2YgdGhlIGJpbmRpbmcgWzBdIHNvIHRvIG1ha2UNCj4+IGxp
ZmUgZWFzaWVyIGZvciB0aGVtIChhbmQgYXZvaWQgdGhpcyBjaGFuZ2UgYmVpbmcgY2xvYmJlcmVk
Li4uKSBJDQo+PiBkZWNpZGVkIHRvIHNlbmQgdGhpcyB0byB5b3UgdGhpcyB3ZWVrLg0KPj4NCj4+
IEkgZGlkIG5vdCBib3RoZXIgbWFya2luZyBpdCBDQzogc3RhYmxlIHNpbmNlIGl0J3MganVzdCBh
IGJpbmRpbmcNCj4+IGNoZWNrZXIgd2FybmluZyAtIHRvIGJlIGhvbmVzdCwgSSdkIGhhdmUgc2Vu
dCBpdCB2aWEgZm9yLW5leHQgaWYgbm90DQo+PiBmb3IgdGhlIGZhY3QgdGhhdCB0aGUgd2Fybmlu
ZyBmaXhlZCBieSB0aGVzZSBwYXRjaGVzIHdlbnQgdmlhIGZpeGVzDQo+PiBhbmQgSSBkaWRuJ3Qg
d2FudCB0b29saW5nIHNjcmVhbWluZyBhdCBtZSBmb3IgaW52YWxpZCBGaXhlczogdGFncy4uDQo+
Pg0KPj4gSWYgeW91IHdpc2ggdG8gYXBwbHkgdGhlc2UgcGF0Y2hlcyB0byBmb3ItbmV4dCBpbnN0
ZWFkLCB0aGV5IGFyZSBhdDoNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjIwODI1MTgwNDE3LjEyNTkzNjAtMS1tYWlsQGNvbmNodW9kLmllLw0KPiANCj4gSU1PIGl0
J3MgZmluZSB0byBoYXZlIHRoZXNlIG9uIGZpeGVzLCBidXQgaXQgd2FzIHRvbyBsYXRlIGZvciBy
YzQgLS0gSSdtIG5vdA0KPiByZWFsbHkgc3VyZSB3aGVuIHRoZSBjdXRvZmYgaXMsIGJ1dCBJIGdl
bmVyYWxseSBsaWtlIHRvIGhhdmUgYXQgbGVhc3QgYW4NCj4gb3Zlcm5pZ2h0IHJ1biBvZiB0aGUg
YXV0b2J1aWxkZXJzIChhcyB0aGV5IGZpbmQgYnVncyBzb21ldGltZXMpIGFuZCBJDQoNCkZXSVcs
IG15IGtvcmcgcmVwbyBnb3QgYWRkZWQgYXV0b21hdGljYWxseSB0byB0aGUgYXV0b2J1aWxkZXJz
LCBzbyBJIGRvbid0DQpzZW5kIGFueXRoaW5nIHlvdXIgd2F5IHVubGVzcyBJJ3ZlIGdvdCB0aGUg
QlVJTEQgU1VDQ0VTUyBlbWFpbCBiYWNrIGZyb20NCkxLUC4NCg0KPiB0cnkgdG8gYXZvaWQgc2Vu
ZGluZyBQUnMgb24gdGhlIHdlZWtlbmQgdW5sZXNzIHRoZXJlJ3Mgc29tZXRoaW5nIHN1cGVyIHBy
ZXNzaW5nDQo+IGdvaW5nIG9uLg0KPiANCj4gSSd2ZSBnb3QgdGhpcyBvbiBmaXhlcywgSSdsbCBz
ZW5kIHRoZW0gdXAgbmV4dCB3ZWVrIC0tIHByb2JhYmx5IGVhcmx5LA0KDQp0YmgsIEkgYW0gbGVz
cyBjb25jZXJuZWQgYWJvdXQgTGludXMgZ2V0dGluZyBpdCB0aGFuIHlvdSwganVzdCB3YW50ZWQg
aXQNCmluIC9hLyByaXNjdiBicmFuY2ggc28gWm9uZyBjb3VsZCBiYXNlIG9uIHNvbWV0aGluZy4g
SXQncyBzbyBtaW5vciwgc28gSQ0KZGlkbid0IGNhcmUgYXQgYWxsIGlmIGl0IGRpZCBnbyBpbnRv
IHJjNCBvciBub3QuDQoNCj4gYXMgSSdsbCBiZSBvbiBhIGZsaWdodCBvbiBXZWRuZXNkYXkgbmln
aHQuDQoNCllvdSBjb21pbmcgZGlyZWN0bHkgdG8gRHVibGluPw0KDQpDb25vci4NCg0KPiANCj4g
VGhhbmtzIQ0KPiANCj4+DQo+PiBUaGFua3MsDQo+PiBDb25vci4NCj4+DQo+PiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDE3MDljNzBjMzFlMDVlNmU4N2IyZmZhMGEyYjRjYzBk
YTRiMmM1MTM6DQo+Pg0KPj4gwqAgTWVyZ2UgYnJhbmNoICdyaXNjdi12YXJpYWJsZV9maXhlc193
aXRob3V0X2t2bScgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3BhbG1lci9saW51eC5naXQgaW50byBmaXhlcyAoMjAyMi0wOC0yNSAxNjozODowMSAtMDcw
MCkNCj4+DQo+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4+DQo+
PiDCoCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jb25v
ci9saW51eC5naXQvIHRhZ3MvZHQtZml4ZXMtZm9yLXBhbG1lci02LjAtcmM0DQo+Pg0KPj4gZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDBkZWMzNjRmZmViNjE0OWFhZTU3MmRlZDFlMzRk
NGI0NDRjMjNiZTY6DQo+Pg0KPj4gwqAgcmlzY3Y6IGR0czogbWljcm9jaGlwOiB1c2UgYW4gbXBm
cyBzcGVjaWZpYyBsMiBjb21wYXRpYmxlICgyMDIyLTA4LTMxIDE2OjU3OjUxICswMTAwKQ0KPj4N
Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4+IE1pY3JvY2hpcCBSSVNDLVYgZGV2aWNldHJlZSBmaXhlcyBmb3IgNi4w
LXJjNCAob3IgbGF0ZXIpDQo+Pg0KPj4gQSBmaXggZm9yIHRoZSB3YXJuaW5ncyBpbnRyb2R1Y2Vk
IGluIHJjMyBhcyBwYXJ0IG9mIGZpeGluZyB0aGUgY29uc29sZQ0KPj4gc3BhbSBmcm9tIHRoZSBM
MidzIGlzci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IENvbm9yIERvb2xleSAoMik6DQo+
PiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiByaXNjdjogc2lmaXZlLWwyOiBhZGQgYSBQb2xhckZp
cmUgU29DIGNvbXBhdGlibGUNCj4+IMKgwqDCoMKgwqAgcmlzY3Y6IGR0czogbWljcm9jaGlwOiB1
c2UgYW4gbXBmcyBzcGVjaWZpYyBsMiBjb21wYXRpYmxlDQo+Pg0KPj4gwqBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLWwyLWNhY2hlLnlhbWwgfCA3OSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21w
ZnMuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAr
LQ0KPj4gwqAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygt
KQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0DQo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
