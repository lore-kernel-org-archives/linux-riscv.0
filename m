Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E220BECAAD4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6j29ICCw3O3BaCDSo6+cUudzXiGkS7PAWxChd292HQU=; b=QY9OdGo2zDbURO
	zzDrqWDSpOuXEYIHeHCeN+PRlHEl9mNgsf1eqUmNYcJ8Eg0AnIXSB4x9baIGW6KLxVqPW5640VQi4
	VvFsebxd8U68pvZLcqHH2/T9DRGTNwbNL8Hhw+oltVncrJ3bnF+P5hc9b8laXOWqXcP29CeVRtRBy
	TV51DGBR173jnFFiWC8ZRyPh9sORgpYqIlqXQomVz8K2VuEA5QDLDdu5eSQVH/DsXruRPjQE3RtTM
	nocpbnGUhOp77ciZ5VwYCF63TLqOMENrkJ1245u2cFM1RyLqOJbXC0Znomijn5/cKW1+zfTI9pnFa
	PbeECYmBXeyKc2yXIc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmmk-003NYz-MO; Sun, 04 Sep 2022 10:23:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmmg-003NXX-CS
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662287002; x=1693823002;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2OXYNvf0WzvH1E/1jHYaDj3+A6tDuKH7TJhpo+weQEk=;
  b=embXwx6qLgCu3J7nAxhr16TTQRnb7ZGDvV1KxKKAH2ivLxDpRIdYHf5+
   RN8EB7wLJfhAAqejzjZGeJVVpHNGzqXzi3h2pM3witBa9fgmWkcdetFbk
   NF4+kX5+CZQ/7QBg7JCLMlWdXisN5qJ/T5c2L1mt3DjWeTxx4yLbYGCyM
   FG94KAdtIpHAZDwvcRi+4xKoSTJ2E0WEA0NSWp9VI7rCI1B7aFWJxXhW5
   exaK02Dewc+yIo3r9c4TzaVrT5WcA4RjBQKzK2r0PpYQ3yHMxPDuJuS4k
   6IVOobCYjIZYTFKLiVcM8cA9B97hNoRMngzguq+BgOKVGXsLTInRzbwEP
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="175547199"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 03:23:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 03:23:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 4 Sep 2022 03:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNiWwUKq524ECPPL2wdxwUD1a0n3fW0+9aGx1gd0YSmlmbLlDi8kk2+y4RmzMcRvryYL4femvUue7XkcuBvHamZE44RFfBRPL907PbNrxS0U8ZH4yQQQFreunHFraS6R/sZG8dCuwP/Mv7N68lkRhY+/MyWbyIWu92iKsMlkDTcSY0+7MRwxhDCd1UpZl9CJY87VMLr7DsENyxa4a6gCSujtLkpv8334CzrrlX384Eb7wEubjaQ9oquynOFtcxaRpxx6PWbRuXIZo9kXk0KO9glCCMs2jjyMj06gX4EdHCtskl4r8xmBMtNRPX14oZziqT+L5yzTRukN7LF7XniY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OXYNvf0WzvH1E/1jHYaDj3+A6tDuKH7TJhpo+weQEk=;
 b=DUxKS6I/3yRjOmqA8tQoPhkWltAPhG3hKs9nwAeUgNIjk534kKmbiKbUfWl8h3CJiKXFBtVqYBU40GZ6Y2F12Id6UQIMhArgNWGZbj3o0wHO7H4/fyiwdkplJh+zj3a6Rln35hkBjSMWkxRiTPJFNrMbLsKbE+AgbKUordLr+S2JFpC10MlTI/5UwiE74wDYQWHKvconiCPNKaO4vmQ/YiULtOSPrhpwJmB5noBUpdyQmX07I1uhhbkwi7Tdp5fV3boh56p/A88WNiB3/f4xFD4prc7ncw02oo7eByQC5d4fxr7Mn4zDii9CXCWJXRprY/gt/xjVzKOm7XArex7ooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OXYNvf0WzvH1E/1jHYaDj3+A6tDuKH7TJhpo+weQEk=;
 b=mK4DxWpzMK2GLPJP5m4KYd8i645sCAjxo8CGs1l5w0xKb1o//aPdWPi0lEBlos+MLzpe7dBpYXhzKoy6hGOCBlawxbTPLSEvuiwNEXF/+i8Zuw3GmjH92yVWPwPaz5/aSAibpflk8s8K5oMEtD3IeVzxQuXnU6UOZZDaoHpbZk0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3456.namprd11.prod.outlook.com (2603:10b6:805:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sun, 4 Sep
 2022 10:23:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 10:23:13 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <lkp@intel.com>
CC: <arnd@arndb.de>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <kbuild-all@lists.01.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>,
	<chenhuacai@kernel.org>
Subject: Re: [PATCH 1/3] riscv: convert to generic entry
Thread-Topic: [PATCH 1/3] riscv: convert to generic entry
Thread-Index: AQHYv7Oq7iFWhuUlx0mA3Zfh9NtPdq3O442AgAAW2ACAABbggA==
Date: Sun, 4 Sep 2022 10:23:13 +0000
Message-ID: <de36b174-ddeb-02cc-8271-6db8ee16f6fc@microchip.com>
References: <20220903163808.1954131-2-guoren@kernel.org>
 <202209041559.Mnnj8WRz-lkp@intel.com>
 <CAJF2gTSekwXtdAGArPWiWshSDZuPH569jHBJZkpcf9JPdvS7hA@mail.gmail.com>
In-Reply-To: <CAJF2gTSekwXtdAGArPWiWshSDZuPH569jHBJZkpcf9JPdvS7hA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f00aa1d-540a-4c4a-2dc9-08da8e5f797c
x-ms-traffictypediagnostic: SN6PR11MB3456:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PM4S0uxzpvyQUJGXh89cyyfiv0Kq55P5EwGcZW4TkiP2Z/7SyBfRVjli8QZ29UiZc8pE4FNkFwaajbw7YNYZtihDgnvnZcxw6KUE9JWqIVsQ7jyrIgHFzmOBhu0ZmlcWzLdNuKY2KvFR7mepUrFoxMBYxXN6lNp2bZBx5xgPg1pSxD1CDAqUZQaS3/BzR76xc8xKB2S8ejtBeSoTx2KhkrYfyULTuTRoLiFqqBtu5JOzqEmjZUmd+qu9oTJmuMsF6cD7MzEja/rqlNfNVanTiT07X40jmkUGxl1lFoJwZJZKZ0nzK7v5rezlRGvXPjh7LxqIAfqmFVjwuBJo+EZxv2TzSesnHhSFuqy3iJ7XIiKLm/IBFhFVt9kECb718IHSvevimZB6iqRWX7iUxOayJ6YSVgo0hR2nbPHCOXtHlX4NzoZQy99fZQ2pp+Yg5+R2zAQgjf/oQWMoJtHIT0tRYtjMgfIdZQit8L19Rpn47kNNW9redjY7x15lYLrWnkCrwWO9/d81J7MzZm5UiNZrYz+v+tgawsxbHF6alYOrbJXadtwh2t13nVk3V3fd7OpU49TYhUCZ5B1QvTnzfUR/Ngl7fgcayoie8Q+Ci39sE5TtSNouuf08eLcO1U4xt5JB6oSLzF3cGAE0jad/QxBBp/lpDI0gp11XrDNCTlNVj+A4vWJWJ3fQRGmFpQMLSr3R1QOP8amVnnazwbAGXnSmFNdQ6Tz1Lf8lFFUJasOvjdRqwBAjOPNLn+BMyeXUWW1QSG74j/lwf9EL+HXToziotDgbeorUt31luW7w03xtI8DNKWY8lUBKpufW7jJMaHbjoQyO7/zda7JXsqTuS8lAdAnAp67Zctrrpurd/qYO8nQRQR+f9xjpX91459yDni2F03xO+qnwgyiUeDeynwAx3fsiO8w7yMbtA8Sjj2LBcw0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(346002)(376002)(136003)(396003)(91956017)(66556008)(36756003)(66476007)(76116006)(8676002)(66446008)(7416002)(4326008)(5660300002)(64756008)(8936002)(478600001)(66946007)(6486002)(110136005)(41300700001)(316002)(966005)(2906002)(71200400001)(54906003)(2616005)(186003)(6512007)(26005)(53546011)(83380400001)(38100700002)(6506007)(31696002)(31686004)(38070700005)(86362001)(122000001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW93Y0Z5M1JhbWdFeXQrbUEwem9HSCtLeG93NGQzeHFvc052d0srK3VCN2Nv?=
 =?utf-8?B?N0NHblhuS2N0S1FyWFVTbm04cWFQeUptdTZvSzNjc3g5dWRuVXdtNWVFZlZQ?=
 =?utf-8?B?ZDZzTW1hZ3hVcXFZM3YycGMvenNKTkkzblVTTEQ2cUxPdnNqNzRMMThYNU5r?=
 =?utf-8?B?U21ZUXlhcGhYb1VVaVJYVjEvQXpzUWFwNDNSUTJOb0tURHczVEZVVW1ndlZk?=
 =?utf-8?B?a3lTdlBWN2wrTlNHcDhuMU0zckk4eWNNUkR6c0NXRFhkS3ZHeXZVR01mdC9s?=
 =?utf-8?B?SUJMbU5OZmY2YVVkUTh2SzVLbkRZZkpjbFJ5OUVnV2hydEFsem1ZbGxrV1VO?=
 =?utf-8?B?SUYzK3JBaFkxeFlxM21kUWYwdHZ1MHVERHNPcUgzZThYdUg5OXVrUUNvZUJT?=
 =?utf-8?B?WVoxV0ZkSnFjeWk0dHhGRlpybmdMcGE4TGJ5SldvaFB4OHEzRk1SeWlET1VM?=
 =?utf-8?B?VFRrOENqU1RjdzdTQittK3lyM3VEdnRLV0FXbTBpbDA5SStYeVJUSEg0amR6?=
 =?utf-8?B?YWlrdmJ1eHBQSllOZG1aaWU3bkdjZG01T2pSVExiSXBHaFdkR0FLd1ZjZ2M0?=
 =?utf-8?B?Qmc0QU9OWGc2bi9sQ3dZUm5LaGM5ZDlUenBWTHhZazhxY2E3VitIaXlOSzVo?=
 =?utf-8?B?VlRSblpmMzJJWVh5MHN0d0o1Qm1Na2ZWSFk2QlFCSVpiSzhGQWgybTlRVEhZ?=
 =?utf-8?B?RU1rVmcxLzNIZmVSWWNTQ1llT3BJNm41Rmd0UW9qUTlSbjZGT25WRE83OEtq?=
 =?utf-8?B?WUd6ZTZqb0h0dUFKK0lidnF3L1hKV0NjZ1VTTU96OGpSRVcyUzJHM3NrL09m?=
 =?utf-8?B?Vy9sVjdzdm5URE5ZUXg1UnlUek03SDFtYzNMNGV2UVBES1hmUUM5ekRUcE9E?=
 =?utf-8?B?S3dCaEZoc0VWcWdBM1FTUDJNNlFLNzFOVStQdnRSUnBPd0NtRVZzZnBTMlYr?=
 =?utf-8?B?Q0F1TG1CSjBPcjdPZXIzYVFIU3JONzVrOU44UXJMVkdQQUovblc3WGhNWnVZ?=
 =?utf-8?B?aHZTWndaKzYxTU10R0ZnQ0ljaVR4ZW5uMkovOVhnWmtKSHV3SE5FNmpYc0dt?=
 =?utf-8?B?ODhSQzdSYUFkSzJjYVRlVkwyNVpBQStsaGNmR1hCZ203MStoMHZVblJKR1gw?=
 =?utf-8?B?TDZZdThIZVJjaDdYRU9FNTNGSGRGQTBmUWwyM0FVb2hXbGtmMTVUeFZSMVFQ?=
 =?utf-8?B?WmZWd21OSEFtYnZqdjhWbS91dzQ1UitzRXMvUDA3REYwc2VUZUMvR3kyZ1pD?=
 =?utf-8?B?MDUwZGpESXR4SkZkaC9jYUthMWRTay9HU3EwUWp2NlZGL2xCQm15eUo5S1d0?=
 =?utf-8?B?RG0zQVdVUU00RTlPYWFvQnhSUlM4T3QxUkRaL0FhMVUxWWp2UytKTTUycG93?=
 =?utf-8?B?MUR3RVFyN1FEdGx1eWF4MU5FU0hpVUlkUTZ2WGpqNzNveXRCU3hYejZmYnh2?=
 =?utf-8?B?MFNNUExFbDcwSEhSUSt1cnhtUVJXL1Y3RDYwdVR1dHByNXE5K3R2Wld1Z0lQ?=
 =?utf-8?B?Tkxybkk0TWtUdlBMNENwTUtNYzBVVHJsSWVaSmw2dWhrbGV6eTVRcEQ3c1NF?=
 =?utf-8?B?aHlYQW8ya0dEWjkrSEhWTWMxNGlJK3dJOEFxakY0QWhqNnQ1NEZqajFXSnlJ?=
 =?utf-8?B?RXEzV2pKMXdoZ0tUb041WTlLbXVIVHhDaDA1bXNyRWNscmlHbE93dVl5R1Vs?=
 =?utf-8?B?aXJsdkFxdDJTWjFJS282bjJsakxjYnFrUWlMQThDQXpYZUd1MXgzTHk4K0Vk?=
 =?utf-8?B?NWhnMmE0eW5LbFR1Z0JGaVg1eE5tSWFuYjkvWk9hMnk1YVdpMVJrWENXK2xC?=
 =?utf-8?B?anB6d200MHlEbnMrdXVYQ2JnL1FDKzJQcVBCMTE4QThUK0F0S2NmS1lsUU1B?=
 =?utf-8?B?bzRDWjZPWlpPSWtwWktka0NnT0dWbmc3V1pXN1B1Y2U5MHhpZzV4dm10Y2Ra?=
 =?utf-8?B?bmcwZ2tkamxRZVVqaS9nSVZPVk9lTXdMd2N0SENiM05qUlEwV2dRMG5BSDRj?=
 =?utf-8?B?WmZDV3pva0l3eThxRXl0bm8zWm1VdzdUUlp0d201L0JtcTNsMjR2WkJud3BU?=
 =?utf-8?B?QWFlMlN1eWd1cjRSZHNvVzVqaFgzUzRSOHJBRmpsUEwxWGJsV0lEN1FWbE8y?=
 =?utf-8?Q?cwdTGt4EqG6je7b1oZUaSZcr7?=
Content-ID: <C6CA5E84832F5042A19163BF8142DA9A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f00aa1d-540a-4c4a-2dc9-08da8e5f797c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 10:23:13.6939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Kkn7GFAPUCttKuEL0fKFGmLNk+g/kojlHw9/yDWkFZzd5dNCYIn/3tblrIOF2W/ot71ELuAYM7BP30XaTFMkBjPjz4/9r3fASGFojJS7Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_032322_551194_2AE2E5F9 
X-CRM114-Status: GOOD (  21.82  )
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

On 04/09/2022 10:01, Guo Ren wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The problem is the robot only picks one of my patch series.

If there are build dependencies, could you just send it all as
a single series?
Thanks,
Conor.

> 
> git:(8390e92d0bcc) git log --oneline -8
> 8390e92d0bcc (HEAD) riscv: convert to generic entry
> b224d265f838 soc: document merges
> a10b904f72e1 Merge branch 'arm/soc' into for-next
> 566e373fe047 arm64: Kconfig.platforms: Group NXP platforms together
> 96796c914b84 arm64: Kconfig.platforms: Re-organized Broadcom menu
> 3779852e05c7 Merge branch 'arm/defconfig' into for-next
> 646e8ad3e676 Merge branch 'arm/drivers' into for-next
> 086e9b3719ae Merge branch 'arm/dt' into for-next
> 
> After cherry-pick all patches, all is right:
> 27642008ec1f (HEAD) riscv: compat_syscall_table: Fixup compile warning
> afcaaabc38e0 riscv: elf_kexec: Fixup compile warning
> 741c29016482 riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
> 4eb9469a3bc8 riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
> a372b565b7c9 riscv: convert to generic entry
> 2d228d709c92 riscv: ptrace: Remove duplicate operation
> b224d265f838 soc: document merges
> a10b904f72e1 Merge branch 'arm/soc' into for-next
> 
> If you want to try the riscv generic entry, please use the
> v6.0-rc3-based branch [1].
> 
> [1]: https://github.com/guoren83/linux/tree/generic_entry_v2
> 
> On Sun, Sep 4, 2022 at 3:39 PM kernel test robot <lkp@intel.com> wrote:
>>
>> Hi,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on soc/for-next]
>> [also build test ERROR on linus/master v6.0-rc3 next-20220901]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
>> config: riscv-rv32_defconfig
>> compiler: riscv32-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://github.com/intel-lab-lkp/linux/commit/8390e92d0bcc635f457df18c8c1baefc78a94e48
>>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>>         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-GENERIC_ENTRY-IRQ_STACKS-support/20220904-003954
>>         git checkout 8390e92d0bcc635f457df18c8c1baefc78a94e48
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    arch/riscv/kernel/sys_riscv.c:80:17: warning: no previous prototype for 'do_sys_ecall_u' [-Wmissing-prototypes]
>>       80 | asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
>>          |                 ^~~~~~~~~~~~~~
>>    arch/riscv/kernel/sys_riscv.c: In function 'do_sys_ecall_u':
>>>> arch/riscv/kernel/sys_riscv.c:83:39: error: 'SR_UXL' undeclared (first use in this function); did you mean 'SR_XS'?
>>       83 |         ulong sr_uxl = regs->status & SR_UXL;
>>          |                                       ^~~~~~
>>          |                                       SR_XS
>>    arch/riscv/kernel/sys_riscv.c:83:39: note: each undeclared identifier is reported only once for each function it appears in
>>>> arch/riscv/kernel/sys_riscv.c:91:23: error: 'SR_UXL_32' undeclared (first use in this function)
>>       91 |         if (sr_uxl == SR_UXL_32)
>>          |                       ^~~~~~~~~
>>
>>
>> vim +83 arch/riscv/kernel/sys_riscv.c
>>
>>     79
>>     80  asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
>>     81  {
>>     82          syscall_t syscall;
>>   > 83          ulong sr_uxl = regs->status & SR_UXL;
>>     84          ulong nr = regs->a7;
>>     85
>>     86          regs->epc += 4;
>>     87          regs->orig_a0 = regs->a0;
>>     88          regs->a0 = -ENOSYS;
>>     89
>>     90          nr = syscall_enter_from_user_mode(regs, nr);
>>   > 91          if (sr_uxl == SR_UXL_32)
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://01.org/lkp
> 
> 
> 
> --
> Best Regards
>  Guo Ren
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
