Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6896FC00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHJz1HlreLXmrKUIFlSwlGmeOOsxcfSmxNxfnSoUACQ=; b=xiqUHccUILE6Y9
	d1g+PqgsqsL1TweCiEatG21VV74S/qiv8TVZD3hutIOpe1Z9zZpUT1MrLFNsoZsctZ6to4w4zLtLJ
	Tihz/t1WVO8QBet7sSB1wrXqCF0WNgqRxlyGwr9ZO/8Vp6Z2Sh3iBDY+D2MkqsiTMmV0XT8kpH93s
	rpKgsFmFbxmM9FsPWKqMs0Wi0aIaiKPcFkxvP29IgS1XcyIj7aC/lCC4V6BHcr9Hzv2YphpsYv62O
	1yBBKNE9yDNkYw+PRy0Kc2rVgArczrwvS3s32yi698oDreJJ/1Ef8eR+eBKn1ah3P4EcPw1NMmkWq
	3mGnhGWoXPqCM5Mbvr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPFD-0025Fv-PK; Tue, 26 Jul 2022 18:25:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPF9-0025DN-L6
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 18:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658859919; x=1690395919;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rN9Et1jtcPlkCEG909P9V89vLUsVOWyWIO1BmMm+r+s=;
  b=08FLmme5hCI4/iDYADsmV1mgq+x5bLnbOsjwEbDWXmVIqXJy/idLr6ad
   oV9sMaEg1UOU0hhOkHXGRIIZKPS2B/YCVHC5994HQ7Dzf9Ewr7VJWA0Bl
   LsKvvIsQO4F2mu1D0+YlsmKkxr4Fr20RRL6+kDht31CCos8MPBP5bnIrp
   6POsG0RVJoJvkURwCJGt3+6/2eH/maxB7iMopr+upbIWUFGXB6RVC8SiL
   TegTO9CJOEwK3OAuZ/MQqT1LAj8h+rR8QXTuwS2X9sro5dYME0nR4M95c
   9KtfzQfUm4rm6AaZu7mOw7GEo+KVzjUXwU9JCK6d74EdzY3btWFLh7o/f
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="183843031"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 11:25:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Jul 2022 11:25:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 11:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3ikzLja5qkf9PvU0MMKJlq2lqyWcMBrvd8PklIuwunas8QNqRRcmfofK/lAVPr99ImX6feiPRBw7H4vMg04pSI2REylmFyXNedUrDTbUVbtQtijp+7T+TqdhmK7jmOx/vZG44EJki2qgpTs2rpICZuD1RuMejDWiFm71aGvjX1FKjcu9QhQfgOKxiNIKhua5xCc7pFL9+39wYMjQmjJmziB4c9IgiwYQIumjJY31BEWutjb9FcfcGinMZgYP0+kIcS1UWsSQay/im5o7stjAN17hkR79c44HFgGJ2ff5mU9hgl3yjHooDd+eGtVF5onsD8cgFu+BErjGkub+bM72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN9Et1jtcPlkCEG909P9V89vLUsVOWyWIO1BmMm+r+s=;
 b=Z6UzKkld9hCH/lUbwT8puNd9/2Z2wcJ6gn9ZekAtk/awe2ZTdjta+Rf6g7kxNSk2bnNKC/w0ENu8uxpq57M0yU+5dudQVV6xIAm1S3KA4wk/urpIdiZeKjVLktolWOJkHZkzuGDO+OFhrfPIWBXPKGIzXRZkm5U4D1LEX31ys1u4zD5NdNwNy6NkvLuJ+BqKk/MturcmoIgdyTQj60gYMDUigyGn5pp0Ob9Fgj8g8+Aj4fR8FMTqOhAYqR8zTCCtCTmrmlZvFq3RaWYbbXgG+SGjdegZlO3MqVO6ZqawgvEnV4SNPvQVKF6idSYWWyFfjH2C3zIEelktyK/gyn6heQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN9Et1jtcPlkCEG909P9V89vLUsVOWyWIO1BmMm+r+s=;
 b=EtKHIiBrE96rcAKrkGmERYOOFAOEBbUcldWjWfC56WNv+eyiVTm+nVKLhbjUEQCp+hxpiMo9gOEf98vtZFV8HGst5HMsP/p0U8lC06dvb8Mg2BfNd/ZAegaXOm4QC6PDLCfUOblq9ATaAJ11xgbn3BA9gh6CSEkf257Jpe34pE8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 18:25:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 18:25:10 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
	<magnus.damm@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Topic: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Index: AQHYoRqPxI/VCgWJ706uhVm84f5gp62Q992A
Date: Tue, 26 Jul 2022 18:25:10 +0000
Message-ID: <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05b2aecd-ea9e-44f4-dfc8-08da6f342c80
x-ms-traffictypediagnostic: IA1PR11MB6147:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lDx5sL8T5h0zATi0H1NtQPJxCzK3GWS5198/0x5vWnkKaG/4SKuIDIGKoYGBzjcXy+q0gAZfeovO9RuSu0JrE6g3sfKxw9dVpREBnT5xKruZF9X4UImz6Vi8VQ/tMsrV7DrsEzdv/Rn78/6aHTPbQfXl9Y4Gfs1bWI4r57SEl2A8HOksBLLGCQw3rvt34hOR0bYssYKiZMPi2MidrRIQT0imUdKp37f/Jl0PYUs37beZMHK49mzM9Wmowat1auScjIVp7Cy5HY3BOxWSmaAZcdHw84VvJlavQSaN7xteY/8ZojMhcSzb9zDa0tQ71jvSQEVqcb050OU4tIbPL4NiI+Q48sU+6x6KJ5YWNCXsTBiFNDz9szF+9j9vfW0jvAQGOHVgRprtdUBVHDK4Uea/LiQ+FlXxY4xcYc7ppikkx4fHbb6XcqQ9jUWp/DhAEHH+qd9PpzA2KkmBe2wVAKT/bvCBLvgJPTkjkyZxsmjunyLjK0lw3V4aypb9n21TTcd9itN6O5aaHZjm9WiXoDNSk0yXkMliEg+/b3ijKktBfpMPKCUz+sxpCe56rTrpwVs1w58RHlosoME6r+Wv/gQUR/2eFy5yOh4g7eyDYyEv+pxWew6s7g2HS6pMWl8B+SW4UPZ5fMaF06q/JzemyeTKzIJasN9U6XX3kuR81oa629UcJocDSikfAGMILST/Flyr2bYfnkYZVOBGRxBbsZVpQoK508X2+wCVIUhNG6FxhiwI0YC8jIV9niVhYlaLdEJwdS3+FhYwUujWES/FUNKAbTQrb4l9GY8JQDpXnpiM30UBJiNpmeL20elPR17dTgUqEl8OnM3HjhrlKH7AtZKIdajUOnX5laXMGXV385YQz1uuKXKphLhdUAr4VmbupFUu5VKlO1GC8XjeR9cEESArpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(396003)(39860400002)(31696002)(86362001)(36756003)(122000001)(38100700002)(186003)(31686004)(38070700005)(83380400001)(2616005)(66446008)(6486002)(478600001)(316002)(2906002)(6512007)(54906003)(71200400001)(6506007)(8936002)(110136005)(41300700001)(4326008)(76116006)(26005)(66476007)(66946007)(66556008)(8676002)(64756008)(966005)(5660300002)(7416002)(91956017)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFlpWlBzZUpQVVIydFNCWkVTOUF3NFVsOUhEa2paQTEyS2U2T1VhL2JkV09H?=
 =?utf-8?B?S1lDbTZETmU1Y3JxOWlkSjZDdEl3QW5pZ0N1NVJHT1U1M1YxRml1VXYrTE1I?=
 =?utf-8?B?SkxGemRtRmUzczJQTjE0U2E4YnlpdjhaNHBZdVJSK0IwTXRzQ1BJWXJzbG0w?=
 =?utf-8?B?RkdGRGRxRGtmaFJnQ1Fza3htdmt0WHRLNXJGWDFWN1h2bzhiUmZhMkVkZnZk?=
 =?utf-8?B?dzV4eis2YjV4bkpNYVNHeS9ZVExuNU5IVDU4ZlExaGY0ZHV6ZVVyRFlhV2w0?=
 =?utf-8?B?UUZ0SjNtQklxMHFlelQ4ZjNBSHlMVnREclcvWC9TQWVUSjUzcE55WDEzTkg5?=
 =?utf-8?B?Z2o3aHNoKzhuNGJNSG5JdUtQbkdSdFd3TVFwMU9HZ0JOd05tN0IvZDNUYjFt?=
 =?utf-8?B?VGpXTTNuZlNTejlLcGVJeHh4Q3dReGtZa3dMaW0vbVlCU05ZYm5Ha0lQV2pD?=
 =?utf-8?B?aXFZL0FnY0kyYVZXSThoYUpyYXluaUdqRkRqUlJhM3ZrTkh0TlppL0dZNll3?=
 =?utf-8?B?anJ5NjFaL09BRTU2SmtGeUVOaGUwTGczb21HbUJyVUFUckxsZEdndndIeEp5?=
 =?utf-8?B?M0NINmVpRnJzTjNxU3E5a29pOVBkNGhVQ0VLQ0ZIR0xrd3ZHYm9iNmhrVm9m?=
 =?utf-8?B?Nyt0VjJMalBkcEFycnNUOWlHVzFPNmhhNm5VVFh3Q1lGTFJRSDFvNWtlV2ha?=
 =?utf-8?B?alR3UVZ6SlVPOGEvNmZBYUU5S0Q2aFJSSXR3Nkh6eS9YSDhYTlhDbmx0Rkh4?=
 =?utf-8?B?eUdMeEZXS3htTjVIN01jUHdiOUIzSFhQTm1QQ1dRckxWam83RkhUNStwRGNH?=
 =?utf-8?B?UFpBMjlWT25tUEdlN3JWZk9EZkpna3VTcFlMUUVkd2dmaGZXZ0wxZ1poTmdE?=
 =?utf-8?B?OW5EUFBqdHdQV3ptc1JHb0dLaERpVXBRbFVHNTh6STVGd21jYmowWHM0L0VW?=
 =?utf-8?B?YW9JSzBzbzlTVkhNMW11OFBWWDJyWHVWK3NWOURuUXBtcnp2VmQ2azZ0OUZS?=
 =?utf-8?B?MHBGQmU5anM2N0ZsYkJJMkREam9sL0twZGljRkU1K0dSaGFrUVJmemU1bWpJ?=
 =?utf-8?B?eHcxcGtnbVB4VnBxemF1WnBkMjFtZHp0K0xWNmE4Zk5jWjIySnBjeDJmZS84?=
 =?utf-8?B?bWpOdHY3bWhhOXI5QmRxV3R0VjNGVG45cnV1MytRd0dnaGR0b1U4aDVOVDg4?=
 =?utf-8?B?OGxJUzd0dnpaTWw5MTZkRUlJanBhZkQ5MWNJZmJwK2NXendwWUhHU2FsaGFF?=
 =?utf-8?B?aS9jaHZ3Rk5hVS8yOGpkTjZZMmxkcU1rdUlJRE43NlBWMGllbS9QUkd2a0FL?=
 =?utf-8?B?UldnNzV3Uit3V1VsSzZDcE5NUHYzMWJxZTNkSTVFdnFXakZkbXVhZm11SWVH?=
 =?utf-8?B?alVsNGtzTEZmcElyQTJwbEQ3N0FsRkoraWFJNnRLelRldjRiRmw5SzRHWkVq?=
 =?utf-8?B?NEtmcW9CdUhvMlR1alpXbTdWNGJPMythNFVwRStqYU1iWitOck5ieVRaZFdN?=
 =?utf-8?B?SDIrNk9TMnMzbXZiL1N3NDdtRjl4SkZjK1ViUVk3Wm1SeWFjN21RK21XYWZq?=
 =?utf-8?B?ZldpekMrVjBIT0VlaEswWlViK29VSEl3RS9VZE1sMzExRjRXNHhmTWlyS0RK?=
 =?utf-8?B?R1R4ZWMrWkxvWWJqZmxmNzNLUyt2NUtEUTVsUVR2b1JZRmllakw3YXVQdHdG?=
 =?utf-8?B?aUpsMjdhMnZYbEJwMHltOFo4Q1N6SU9hYzJMTEhJVlJ4MWhWSmVCMUszdlpT?=
 =?utf-8?B?MENmS3h3azhvYWVXQ0V2b0FnUDYwUjNremM1TmxzYkFZai9iU3JTZ0ZqZEc1?=
 =?utf-8?B?Z3JoUnpROEpReFprVCs4RUtSNjk0eHFBVklNaWRtMnlmUEIzcU9jT2pjbHd5?=
 =?utf-8?B?bThPNldiVnZHRUZJSU1HOHJBaGppVDlNUjJuMnU5ZG9HQWUvcGk1cXlKdjZG?=
 =?utf-8?B?ZzFIejhzWUkxc0xEZmk4OEtDMHIza29FV3RGL3FCdVRaV0JYUlRHcDRDMUYv?=
 =?utf-8?B?ZVowTm9XNzZSWGJXaW1OWXR3OUJFM0ppbGRMcktqMW54Z1lJMEV4WmszS3Rw?=
 =?utf-8?B?Snh6RU4xVXEwRm1tZHg5bTR6ODBJWDlhbnhOTThlQ3pzWVZWcGpJNy91YW03?=
 =?utf-8?B?Z2ozRm9BVThFNGVMYndpQU1ldVZMb3RQR0VnQnlCcVpZcXpyLzNoWVBXdHpY?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <F8281C6C8E566E419FFFA3BFBAB97161@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b2aecd-ea9e-44f4-dfc8-08da6f342c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 18:25:10.1660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FBHc34SEGvtj1ypFM3ddytUXXy4R1trRbhVcuCL+blhUgSS1Opea6EW5itVO96lz0/9Gg4bPcSydhgeaxj42IChKWrhdYSQ8XIW8xBqneY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_112520_044898_A88BB7AD 
X-CRM114-Status: GOOD (  22.25  )
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

Hey,
Saw your other binding patches coming in earlier & wondered if
this would show up today ;)

On 26/07/2022 19:06, Lad Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> Single).
> 
> Below is the list of IP blocks added in the initial SoC DTSI which can be
> used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/boot/dts/Makefile               |   1 +
>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++

Missing files? Where is your Makefile for this directory?
Or the board dts?

Enabling CONFIG_SOC_RENESAS_RZFIVE causes dtbs_check to fail :(

>  2 files changed, 122 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b0ff5fbabb0c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,5 +3,6 @@ subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += renesas
> 
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> new file mode 100644
> index 000000000000..6e0b640c6c7f
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>

Including arm gic stuff on riscv? That seems a bit odd to me.

> +#include <dt-bindings/clock/r9a07g043-cpg.h>
> +
> +/ {
> +       compatible = "renesas,r9a07g043";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       /* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> +       extal_clk: extal-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;

Why add the empty value in that case?

> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               timebase-frequency = <24000000>;
> +
> +               ax45mp: cpu@0 {
> +                       compatible = "andestech,ax45mp", "riscv";
> +                       device_type = "cpu";
> +                       reg = <0x0>;
> +                       status = "okay";
> +                       riscv,isa = "rv64imafdc";
> +                       mmu-type = "riscv,sv39";
> +                       i-cache-size = <0x8000>;
> +                       i-cache-line-size = <0x40>;
> +                       d-cache-size = <0x8000>;
> +                       d-cache-line-size = <0x40>;
> +                       clocks = <&cpg CPG_CORE R9A07G043_AX45MP_CORE0_CLK>,
> +                                <&cpg CPG_CORE R9A07G043_AX45MP_ACLK>;
> +
> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +       };
> +
> +       soc: soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&plic>;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               scif0: serial@1004b800 {
> +                       compatible = "renesas,scif-r9a07g043",
> +                                    "renesas,scif-r9a07g044";
> +                       reg = <0 0x1004b800 0 0x400>;
> +                       interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <414 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <415 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <413 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <416 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <416 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eri", "rxi", "txi",
> +                                         "bri", "dri", "tei";
> +                       clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
> +                       clock-names = "fck";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
> +                       status = "disabled";
> +               };
> +
> +               cpg: clock-controller@11010000 {
> +                       compatible = "renesas,r9a07g043-cpg";
> +                       reg = <0 0x11010000 0 0x10000>;
> +                       clocks = <&extal_clk>;
> +                       clock-names = "extal";
> +                       #clock-cells = <2>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <0>;
> +               };
> +
> +               sysc: system-controller@11020000 {
> +                       compatible = "renesas,r9a07g043-sysc";
> +                       reg = <0 0x11020000 0 0x10000>;
> +                       status = "disabled";
> +               };
> +
> +               pinctrl: pinctrl@11030000 {
> +                       compatible = "renesas,r9a07g043-pinctrl";
> +                       reg = <0 0x11030000 0 0x10000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       #interrupt-cells = <2>;
> +                       interrupt-controller;
> +                       gpio-ranges = <&pinctrl 0 0 152>;
> +                       clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G043_GPIO_RSTN>,
> +                                <&cpg R9A07G043_GPIO_PORT_RESETN>,
> +                                <&cpg R9A07G043_GPIO_SPARE_RESETN>;
> +               };
> +
> +               plic: interrupt-controller@12c00000 {
> +                       compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
> +                       #interrupt-cells = <2>;
> +                       #address-cells = <0>;
> +                       riscv,ndev = <543>;
> +                       interrupt-controller;
> +                       reg = <0x0 0x12c00000 0 0x400000>;

Does reg not usually get sorted after compatible?
For consistency in this file it should at least.

Thanks,
Conor.

> +                       clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> +                       interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
> +               };
> +       };
> +};
> --
> 2.17.1
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
