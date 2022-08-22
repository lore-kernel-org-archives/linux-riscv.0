Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E86C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kg6eM25+me95Wob+tfHwjnRsPwvNRakBuTnL05E0TKg=; b=RfOG8z0dCR//SJ
	O5rB2NO+kbAOitjRh1+L2fCxi8W6fyo1vQAA6WA6Qs2OZkDSOgK+wG0NY8CnG15uAfgjaTF55TmxK
	VjiJje9yntvTE2CoudlJV7uMYDZRHvf0W4Pvs/A67m91/mA2xqQIMhhRX8wKoS8+1rGaW8K2Uluu1
	wEg69hXbvdmZ59eLftZ6BbH08sxu136HzleiAQFGwsCNdOx8Efq3hdGc0HkgJA3X28sEJnTK3YlEM
	dhAfH+haAyq0j7Tg9XzhJdyDjwhJ1VkghT+ulg/VtRaLd6O+K1cR5iMyikMErinpA0KU3pHIr89qi
	SOSm81m18GXKEboEPTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEjb-00EthN-JH; Mon, 22 Aug 2022 21:13:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEjY-00EtfP-Mu
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 21:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661202800; x=1692738800;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BRu0ZVYP6W/sZo30OEWbiFHEli0Gth4xwlIfiVAHAo4=;
  b=otOtK21Gjz6UkxRSCWyiU5uXswd1quk5vqKZpnyP/KWuX7BXY+sR9uKc
   2V1udcqBp8kowPZKlj3ptV89b1KMOGVWRdVlw5iRWjNkdz/DDZdk1kVKB
   WYcS2jCg375did9iKzfIAv4OLXe46eADDoSJGVnMkBNF2jWJyplj6YkP5
   B0EPHoJX/UVi0YWCVHr0GbQMCMmW+UtfQD8jWU7ve7upMiqdG4DIzYyL2
   n7qHhrDPhDly12AdrODATT5Hqq+MI+kqp75pNwjDHjzwwknSdWnryrSKP
   nwHuaymcFhsgaTJhFHh+aIw7mg6+Ip7co2Va1UEdSpc1/MD9XTUEIXOo2
   w==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="177437837"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 14:13:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 14:13:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 14:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFx++J2I4DYap4HpVz/K2DfD7tMbgqK3qFk619v8zJLBAtiKE+XyPDuipJn4ERO+sUdjLAibSJKDrvr5+irNkeZNwDoTRIJvwQUAryhbZ+sTijVxX4Da6rSdaAcjbaCaN06tK2TuVZ/bJJhU2XTRByl7+mow4ypa+IHlpM9AUMjAy2GlxhxExUonvHlMUZYia4sLD58/BK+A7zRdEGJH29IS2bikoGwqqrDLjQkHaxNZMNdU4XJQTw02lXzx8cSAzfi9Tjv7EXjtLk7YFztnVnL+JQLvzHlSF2aJIWEAGBMKaUfeNByezXE3J5gzk8Y2UyqEQz1y4ovzRvlj0wvzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRu0ZVYP6W/sZo30OEWbiFHEli0Gth4xwlIfiVAHAo4=;
 b=I8z3KsO5tiLK7HwlFrfsF/BpmM+5kD3UCkeDX6VHR/DmL5KhrH1nS/gEK7fq2VqP7qyqyL1IRxNj4gH5O0gHg2cnpyRTvH+F+pJU+hot9HuuqtL2YQudbQWy5LF4biUwmqJckgwpz2gEBbg/+1y3/LZbsdMDE0HmWTGqTOTlptKsfEvE8TnGDtKVuFXhpd19HppGGJBrHBZBo/jjNUYSba/G4nEI2Cb03lTg4UZoDuDYc5X8mnnJ8HpVV/+x2IBwu1uILpZZu6F7O0CTGVJmugXI4ZgnzN3R6sB9QhDCLv3S5ZtvWQorS/Ltx2kjkQJlSOTtE1jaB/OjBKTJ1XF9Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRu0ZVYP6W/sZo30OEWbiFHEli0Gth4xwlIfiVAHAo4=;
 b=BalhhVDl2Umbhf3pGpOZmk+kFYuJDz2S0b3n54HZ4Wweyah2WpCR9kG9DRGiUXUn30Zj/E2xvD9nBTR2kSNU4xQ3b6uua9qfE0UwOdTuq2ccpMG5/cGlJM7DNfS2vf5ZJ1gJrwqC7JACTRRHfT0ar8R/dE+xTD2lK86Y34+u6MI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB3725.namprd11.prod.outlook.com (2603:10b6:208:f9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 21:13:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 21:13:14 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v4 4/4] mm: support Svnapot in huge vmap
Thread-Topic: [PATCH v4 4/4] mm: support Svnapot in huge vmap
Thread-Index: AQHYtjzLSfHXDBmj6E+pYk/VRkccH627a4EA
Date: Mon, 22 Aug 2022 21:13:14 +0000
Message-ID: <0a6dfb2c-d4a4-7b56-6f61-339afaf1eec9@microchip.com>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
 <20220822153413.4038052-5-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822153413.4038052-5-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d4ea094-f2d8-44c9-4e86-08da8483209f
x-ms-traffictypediagnostic: MN2PR11MB3725:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QH78HVeNPKSwPBoorX4T4OijxrgejV0kxw8czik9UjTf0b2lFTuh3cL5r6S+zbkswhSASOEIprxigzQebCXrEZ0r6mXOGyfMuqAKSd5S1CaJ8RSZMywuscBOZMubLhBT+BCbnY3QD9JqR0IxZmOM1xAaAYX/nlHjg1rgecbB85SsBVSrjPJPQoWMRiT1RO9Cx9qFrpqMlw0xQG1AYb84pCBvZcrpwV12dZvudJ9Qu8KKn4yhEBUKKmiL4LuO9/wk+4M2vCCF/29znKQl71+kMgoEpFbLkTWBM2Ekzic+iBWRZpzVw4bfgaelBK3H3/8ADIcysqADNiVAbRVFnh8vyAWnuheTebQaZq6sfxByiU9RHi+sfpscztl4K0wYv9eoqztqEgK32FIEaGmoT+Cujz1XX6tbVWsF9OBihyF+s/WdGfyzCUgriMYW8wOmACD1sEQ10dxbDnp8edtZW7PzCfyvrTznAw97B+KPfjkob+oqmOUDqC5FRfXkW0iSmS8WXg/zIww6C0iDp7UObAI9s0MiO9kw0cs2B5GLyYok3P1q1U+8S5osvhFRsZaqcnP2fuT29b79FnovdC7wYyPGTcht4wI70in/IGWMMBbYKJB/lZiUG9O+cWgQXiklH7XFGn2Rr10VM7Mn1G8m0eJu+mY/k2JyswGLXj5MuOvR5zgrn/pchkIFSuUT/UfSjpX0eXJtjztYlL/YLxCkCxSsPtRWv3ZYjZ6Nwdn/+6zHFbqOHhXs1gdcvbgKUZ8AkyWlPHKzMfJzq2iw3pE5hq44V7Omc6HWe6uwZgeXcEloewhu/3K0Sq4QACbseRyJ4r5df16O/EjgF1xedlpAR7YaSKlTpuhPLe4corIhDWP9liG8qpGU3BBWynA/gFRkmDsV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(39860400002)(346002)(136003)(31686004)(64756008)(66946007)(4326008)(66556008)(66476007)(66446008)(8676002)(76116006)(86362001)(122000001)(31696002)(110136005)(54906003)(91956017)(38070700005)(36756003)(38100700002)(2616005)(26005)(6512007)(53546011)(8936002)(186003)(41300700001)(6486002)(478600001)(966005)(71200400001)(6506007)(316002)(83380400001)(2906002)(5660300002)(14583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTdqYnVacUpZUU5NSjNBZUVEQThBRUxFcUQyU2pROGR5ZkpwcVNGcFZDZHhw?=
 =?utf-8?B?ZGU0RWF2Nml2Z04vMnh3YytJSVlpMENueGZOVE5telRGd0dLVXUwUmRyWVZK?=
 =?utf-8?B?cVVQTnN5dlZId2tRRUlXQzhUU0tGNUxScGdjNFhjOGhjNEI3SURKbWNYY3FE?=
 =?utf-8?B?ZzFrdWU5bm0xVjU2L0NMTW9LUDQ2cGtXUXBXZFQrNVl0b0VBR3VxRnpJRnB1?=
 =?utf-8?B?VkNwQlFBMDVZVmJsdExGd3N2NHhoTFdiZGhZUUVoNkJyZmN1MmtydEJxOElj?=
 =?utf-8?B?dGQ3YUp0bnpJNnVBK01hSWJoUkx6M09HTHo5cG9LUXpUSy84YUZFcXV0Y2VL?=
 =?utf-8?B?RjhqTjRLbTlIejVwUHlmbHVEY2lkT09TQTdJQkcyR3FJUjAyOWZrMG5lQVJn?=
 =?utf-8?B?a0dkVTlCYWRlQnZINWVxU2hiK3RXYUdPWWY5U3ArTXRoa1cxZ21SVzcwZS84?=
 =?utf-8?B?aHB4bW5CbDdJOGVkMFZLaEFRdGdnd0VmZm5pQVp3dk9neER1TDhvRG8xYlZ1?=
 =?utf-8?B?Z1U4eVlXNFYrWFliS0VCS1hXMjJXYlI4TnpPWXVHK0ZxMGFad3lwcXVCNWFZ?=
 =?utf-8?B?bElHb1Vqd1J0OHFyTGhEUjVlMTNrU2xGWDNwOVJzcjF0MXFLM3R2aUZ3bktS?=
 =?utf-8?B?RFpHbzNSVGo4NkVqN3pPa2lUSzlzMjRyc20wQWZ5V091YmtTL241ejNJb3Qr?=
 =?utf-8?B?bWo5UUVubmN2UXkxUmxwSWhVKzkvVUovSFo4NEJ6NWl0TDc0TjR0S2lrdUhV?=
 =?utf-8?B?bHBjanVnYnVEMEhoa0JzeGY5c1VZNjMyTkdVMTduL3BSeDhyTnJjOEErN0Fk?=
 =?utf-8?B?WGp6MUpNWDNaQnorbUkyelJRMUlFSXFvTTJyTU55amNPZDBuYXNFallOTVJG?=
 =?utf-8?B?N1dsUmFueXZYekpXNHJmMHNScWROWmFsSDlqZHp4SFdNbkdKbzI3OXQyUllC?=
 =?utf-8?B?SWU0Vk5CaHdqQXAwakdkL1NaTy9XdGhkRmx1c281SWtDenNBU3krSzdFZkVE?=
 =?utf-8?B?WGFSZndZN3g5b2ZBdXZsTVU0WURmUGVVcUJ2NVVqSWlnVVVqSWdiRXRZajNQ?=
 =?utf-8?B?THJLZ0JteFFlNkw5WUsvWVkwbmViaU41Vi9aZWpyclJTcURlK2VKV1h2aFU5?=
 =?utf-8?B?SStRSUdjSzdVb1BabVZETk15NGhzK2wzanErK3V2aWRqZ2tHVFBDSjVQK09q?=
 =?utf-8?B?K3hUU0JMRTVmWmxxNnA3amRZUTFXQUcwdTFKLzNtcmpURWRESjN5RVpWQlhi?=
 =?utf-8?B?TnZLOURtK3ZnTTNwZmJ3V3pUdFBhNkFxUzg3M2FYKzM0a2hwbG9ROFFuSEdG?=
 =?utf-8?B?UlpYV2JCd3g1OGpPSXpaSk5mYXhHQVlCenpUcEd2RER1cWxTUzdXOUM1OXdR?=
 =?utf-8?B?ZTBwUGx0WU5MaExPZzBDN1k5aG9aeHcySjFwUmFJRndSMkdTUEEydGF2bXpC?=
 =?utf-8?B?Y1hTamZIekx3dEJZVGxvV1FBVkVXYzFvU1NKMEZKTU05YUZKWVU2Z2U3N2w0?=
 =?utf-8?B?UnljYVVGdTdBRmh5SU0rTDZwWnNDcGh1ai9ZSVVjVnVBdnFnUVkxeG9ZYVg4?=
 =?utf-8?B?RVJiZkk2dlhkeHNwMGpwZ2tiaGN4S3VKenBhcm9XdlZqL3B0U0pMMU1pNHNj?=
 =?utf-8?B?cm9pYzI2am1pNXVmMXBuUk5PV2s5SkNwbExlamhzb2x0bUxEUmZvbTgxc09B?=
 =?utf-8?B?SHEyMDhuMG15ODVJcGNlTmVNWXIyc1lkV1RkZVZ4REhrVFZwd1hCOVdGT1pl?=
 =?utf-8?B?c0U3ZGhpMGNTOXRadUR4bjNOK1FPYlcxbU5KbEZTdHkzSEk4bzF0YjVySTI3?=
 =?utf-8?B?dVcxa1MvbDJJUTlBSTNrUEVvdFZKMm9NbzAxeXJFTlNoMzlqUDZEQTlLWUJ6?=
 =?utf-8?B?djNTKzBoT29ZVGVQVTQvcDZ5WnJOOVZqa3BnQUdCT3hhUGdRMnBBcCtDQ3VW?=
 =?utf-8?B?RUpZMXpUL0haeFUyY21lTFZzY3ptSWpPLzFTWmp0dFdoYndDV2V4cXJKTDFV?=
 =?utf-8?B?MWxCdG1PcWhzbWFGRGMxNGR4eDdEVDlmVVQrdXhMQmE4V1FkcisxRTB1MnNj?=
 =?utf-8?B?OTR2TElCellCbERPVkR0OE0zemx1ekEwaldzcHMvRTh3RURnbDhOZUNRV3BF?=
 =?utf-8?B?eEpJNkJNQ1ptWkowMFlncWVVTVhsYlg2MFNpaFZqRU91UDBSZ2pjUGc5QlBM?=
 =?utf-8?B?aUE9PQ==?=
Content-ID: <BD2CC9DDDA98224A86FFE9E7BF18A622@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4ea094-f2d8-44c9-4e86-08da8483209f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 21:13:14.8468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0B1K2MDATfq5web11HQ3k1frFDNUQ/wpIg6L6aKBdZcM0adE14AZBHrl3DynJg5d6dQM0MNqLAcmVfsB1xC4Z80NldBEjXoXmany8sHO/Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_141320_851392_F0ABEA18 
X-CRM114-Status: GOOD (  23.85  )
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

On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> The HAVE_ARCH_HUGE_VMAP option can be used to help implement arch
> special huge vmap size. This commit selects this option by default and
> re-writes the arch_vmap_pte_range_map_size for Svnapot 64KB size.
> 
> It can be tested when booting kernel in qemu with pci device, which
> will make the kernel to call pci driver using ioremap, and the
> re-written function will be called.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 9aaec147a860..a420325a24ac 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -70,6 +70,7 @@ config RISCV
>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>         select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>         select HAVE_ARCH_AUDITSYSCALL
> +       select HAVE_ARCH_HUGE_VMAP
>         select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>         select HAVE_ARCH_KASAN if MMU && 64BIT
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 37547dd04010..6d5caa1a6bd9 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -750,6 +750,43 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> 
> +static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
> +{
> +       return 0;
> +}
> +
> +static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
> +{
> +       return 0;
> +}
> +
> +static inline void p4d_clear_huge(p4d_t *p4d) { }
> +
> +static inline int pud_clear_huge(pud_t *pud)
> +{
> +       return 0;
> +}
> +
> +static inline int pmd_clear_huge(pmd_t *pmd)
> +{
> +       return 0;
> +}
> +
> +static inline int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> +{
> +       return 0;
> +}
> +
> +static inline int pud_free_pmd_page(pud_t *pud, unsigned long addr)
> +{
> +       return 0;
> +}
> +
> +static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> +{
> +       return 0;
> +}
> +
>  /*
>   * Encode and decode a swap entry
>   *
> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
> index ff9abc00d139..d92880fbfcde 100644
> --- a/arch/riscv/include/asm/vmalloc.h
> +++ b/arch/riscv/include/asm/vmalloc.h
> @@ -1,4 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  #ifndef _ASM_RISCV_VMALLOC_H
>  #define _ASM_RISCV_VMALLOC_H
> 
> +#include <linux/pgtable.h>
> +
> +#ifdef CONFIG_SVNAPOT
> +#define arch_vmap_pte_range_map_size vmap_pte_range_map_size
> +static inline unsigned long vmap_pte_range_map_size(unsigned long addr,
> +                                                   unsigned long end,
> +                                                   u64 pfn,
> +                                                   unsigned int max_page_shift)

How about:

static inline unsigned long
vmap_pte_range_map_size(unsigned long addr, unsigned long end, u64 pfn,
			unsigned int max_page_shift)
{
?
> +{
> +       bool is_napot_addr = !(addr & NAPOT_CONT64KB_MASK);
> +       bool pfn_align_napot = !(pfn & (NAPOT_64KB_PTE_NUM - 1UL));
> +       bool space_enough = ((end - addr) >= NAPOT_CONT64KB_SIZE);
> +

tbh I would rather see this early return for each of these failed
tests rather than lump them all into the below. Prob can do the same
for each of them.. Personally I find that more readable than what you
have here. /shrug

Thanks,
Conor.

> +       if (has_svnapot() && is_napot_addr && pfn_align_napot &&
> +           space_enough && max_page_shift >= NAPOT_CONT64KB_SHIFT)
> +               return NAPOT_CONT64KB_SIZE;

> +
> +       return PAGE_SIZE;
> +}
> +#endif /*CONFIG_SVNAPOT*/
> +
>  #endif /* _ASM_RISCV_VMALLOC_H */
> --
> 2.35.1
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
