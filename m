Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E76C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIX/JU5/t5+5ckV87O7D+69i+Gs7W1ITOrsLUNuuXTo=; b=dhxjIrjBKnHVnB
	//KvROvcEhu87q4OcFFaHNF3rReC97eCTvpakLb+uhDFFmIT7Ey6Cu/mmEzPsZcaAuGUnlPvZJ836
	PAQ3cyn6hTwJuvlMRkzfe1zEr60Bn3b0MF/ll9alcgpOGfG/OXph++bfXZyeJN62ypmPunsNjnYqg
	aJh9mPzQZq37W8kKbis1SND5rwxp+TOBAOoLHgzepIq6Auki+ZPy4/r6j7GrqtZVsENWie2n5haYd
	uZRQOuKTIsZ7IlgbPsruHadaoGV5WyTRQ1CGcm4kkJpaPs/llCfI9SHYjl3f2LOerndpxzxziZ7mn
	paIZLUDJsWY0AC5IyAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPk3-00DHUg-2v;
	Wed, 15 Mar 2023 11:56:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPjz-00DHTX-3D
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 11:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678881384; x=1710417384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RTSM8DU5spKDxpyz31Q8qr/jUPxKZ3szkKojU7jrmtM=;
  b=1i88h3FD3aG0EXKOdUnmpHigA1TY/egxNlsRI3q81OguL4C33HNWLWtn
   RzGy9woy0r5ngdeFF2qqhC6ultkH3Bd0CJVCkacOgOCU7TGhLqFb1AzMq
   8tnibqVNYAV4y3Q2e5qcSUPegh991N/cDl9Z3UMSWuFH+q635qGKDxwST
   fgAaZUYEyFQNuj1ccvspE/XII52IHl1eLdAhjOJUnjOZobNnUwEukJW6+
   nJv271NYA9GRMSNUXvW8nnNKIte+xTVkwAS4GUr+OJ2tQ1idLWqJ3xXGv
   gfmhdsV0vk/HYNerZ5U9b2QeOz/G/ffsp2BdkzGVmxYiMmngk/BG+SBks
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,262,1673938800"; 
   d="scan'208";a="201746739"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Mar 2023 04:56:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 04:56:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 15 Mar 2023 04:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeHY2JbWtzyQa+gYqMblg85x2IEZ+NdPgLwfhxeK1FSMWq3SU/mqtBu9Z7e50kKex/9vTcucNwWD3GlbHA5SguJ2QU+o+/7qBVqoTzwi+GbOgV5+N9c+iBnG+Cv9uewegRP0yN5IM3sBQO4swLyYYAV9urukldWfdB1lJwbvnI7uHrFGXeSBwI6K5mIjLGP9fx6oNC+YxKW4ZuPxvRoFf0DkpaVkX4/5N2kN1Uk3BKAL+NqqFJt2CyE8hX88JNRrAfBQp/3d1U2uMQZna36dKUEYdbs4lWKUXDHWAkAZG3L5OT8PcKmncT8Z6IJnCl6RFvQf/fAbD4KkCTsIftEeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTSM8DU5spKDxpyz31Q8qr/jUPxKZ3szkKojU7jrmtM=;
 b=ZipE7hIbyT8viH6owa9KbRHAEDewOsIBGpT+RPIz9oLDDMUM7sU4cnQIvZyjGmd9k4oHpA0pwO/umtGCy3pB2dbYuTmFEZEPOQhUIYyNpL10FZCww6iB/I1N3+BPa8SUtaB0105ihMmvXb5sS9ZMZkhGgVdfPfPPz+XWTAGpnMTVfS4RU7wQwiBepYLN74NfLNTFQ1wXS8SwHP5vL2HCTqbG++GMc1VGIg1s+N5D8eTe6g0Eaq7NNNHFAouYemnwaLuEDtAb4NNcwAdgOmb/aFbzjigjv5fNWwuiFblPV0dv2Er++bxqp8XZzKiDsFx4a+/eSkQu7/PymqeuGTCZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTSM8DU5spKDxpyz31Q8qr/jUPxKZ3szkKojU7jrmtM=;
 b=WM6BW2pgQdrc9XdChu6gAZLbL3xilwX3TDZ/uj9JFKZ4MR+MkaJhU9DHGi8jRQDAaoVLSMhobGDmxT45tUWG3JoDnvNlFrOs9L3BYFxASblY5pVnzjRzJ4SQGUeVvI9jit5V4veG7eGZwzFMIJJhf53DrFC+CDhAWxjmC0cmsmc=
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.23; Wed, 15 Mar 2023 11:56:16 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::df9f:c807:67be:19f1]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::df9f:c807:67be:19f1%9]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 11:56:16 +0000
From: <Durai.ManickamKR@microchip.com>
To: <michal.swiatkowski@linux.intel.com>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>,
	<Manikandan.M@microchip.com>, <Varshini.Rajendran@microchip.com>,
	<Dharma.B@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
	<Balakrishnan.S@microchip.com>, <Claudiu.Beznea@microchip.com>,
	<Cristian.Birsan@microchip.com>, <Nicolas.Ferre@microchip.com>,
	<davem@davemloft.net>, <linux-kernel@vger.kernel.org>, <edumazet@google.com>,
	<kuba@kernel.org>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <pabeni@redhat.com>
Subject: Re: [PATCH 0/2] Add PTP support for sama7g5
Thread-Topic: [PATCH 0/2] Add PTP support for sama7g5
Thread-Index: AQHZVyOsxMscuSByuUOf3ASeldHu2q77uIEAgAADgAA=
Date: Wed, 15 Mar 2023 11:56:15 +0000
Message-ID: <cedc50dc-bbfa-d44c-1420-f72acba4bb81@microchip.com>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
 <ZBGvbuue5e3vR8Fs@localhost.localdomain>
In-Reply-To: <ZBGvbuue5e3vR8Fs@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|DS7PR11MB6126:EE_
x-ms-office365-filtering-correlation-id: c0653b87-0419-4bd3-3e19-08db254c47f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ziSADKRfwrJEID9zpObfIMhq63PXGZ8ZAfvFuQVOWsVmABfcsGO809rer61Ros2FV/7vMBRsbUcNU1CZQbzt1HyYZoDaMV+kaMM4Y6Jj10QmvsVH7Hx282XtvNg+b2plF7FE/fovhL5oICtrfgs9FNRzUB/x29xKSAhmGrrqohOaV2v0N4mNMEulaYkMR3RZosYHU0h8c/zUHmqsw1V6Q36DkOeT6VqSzxU7eDO7YXiOns3FJ2Hni49c278Gj8hfczIAOxMEY7nt4WswhSgkO313pGuXcq6fKrkbeB3nNNLPLoeLkkb3W4pBPXgIwbkNRDmtOG3X2MKDHN1N5fH3Ixyrk+fGGJiaDDpugqz4+xeZKQnfQalsbNboBQMlT7KjFQ8b1Esw1yZblsGniP4dy0EVR1qQWSvhbwAwVVyrN/DI1fJLV3rGCTraQ00cfRnXsronPukzXdTPwrIAt7PZEBz3JTAFdZGTYgoCjaPmHRvLzV0SGN4jbZi0ktEw5idDwONPrMe6DvbhTsANsnihihaS3X1HlUYFfRO4E3zD3CkJYcCMaQBCE6h+cwf41268Km2PGVTISfBmUfmiuU5Dw2O+YWJzSrUc1UBefK+EZdybRj0/D++uWtIa88BNyFWt+X0lMXFAJD8nQ1zzLoqi6ji1xj0ce9JwrGWMfBOJ0Dj4BKACBod1tiNZsxywGhmsGOWsPk8hL4MwD0GJjkXXc6N9VvMUpY7PEAEQAgZNVwYKFW782tAGP7Ico8BKR90m0MA1OXbS9VY+wpifHsJNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199018)(91956017)(66446008)(66556008)(41300700001)(76116006)(66476007)(66946007)(2906002)(38100700002)(31696002)(64756008)(6916009)(31686004)(186003)(36756003)(4326008)(8676002)(7416002)(5660300002)(83380400001)(8936002)(4744005)(2616005)(53546011)(6512007)(38070700005)(478600001)(26005)(6506007)(122000001)(86362001)(54906003)(966005)(6486002)(316002)(71200400001)(138113003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0JmWVlHZVVJejRLYTNUL3J1RWRmNGErTEVWaVB6aXJtNHZiYi82WHppNno0?=
 =?utf-8?B?aWRvMnB2TndySmpOcVkvUmxHNU1pVzNpVlJsQWRJa2VKVjVOMDRxci9BN0Iw?=
 =?utf-8?B?ODdUVkdrQmNhVW1LRU5YeGV0TmZkdXZBazRaM1VPRGhtSXVyR0tTMzdyZWpo?=
 =?utf-8?B?OXdyc3RqTTRNMlgyQTRibldKWXZtNnZncEJEcXlOZmVuaGY3MkUyUUlySEJ3?=
 =?utf-8?B?dGRHSmxwS3lTMTZwTy9odWNnR0ZOby9YRG4zYzVJT0JxcXpJZjJIc292THAx?=
 =?utf-8?B?Z2lxejBUOEdidzJRMDUzWExmaWlleUExRUM4STdGVlZiMnQ3K3RsNWdtdmNT?=
 =?utf-8?B?R3lPN2FDTE5KVGpjQVZXcDh4bVlKWXdyVnRqWkQ2ZkI1NU1Ba0trQlRZT1FR?=
 =?utf-8?B?aVlLd1VzUUJ4Wld5Ni94a0RGY3JJSm5XSHhKZ055NUcvUnRLVnY5NmF6UWlQ?=
 =?utf-8?B?c2RwQXJ1TEV3NTVYMnhmZ0tWQjFMbGt4djdxNkVLaFhSdm5ueFFNQk15VEFn?=
 =?utf-8?B?WEc1dUtVcWd6SjZCcjVRNWxnbjlHb0JWWCt4YkJTMzN6ZUJsQkNmYk0waDdH?=
 =?utf-8?B?NVN0cjA3TFZEbVlqZFhmSjRBTklGNTdXMTkxWHlucWRFQmJNd2h4WE5SNnFk?=
 =?utf-8?B?Q1hyV1BLMmUyZDFleGR2ckVxc0RtUnp5MzVWYk5SRGVnZ1ppZUZpZzh6NmJ6?=
 =?utf-8?B?NXNPQWI0aktTN2pJMlhPcjBmbmdYcWZsT29HUE1OdmplQ283VFgzVmF2cnNp?=
 =?utf-8?B?V2JURHpGYjltMEwzRHJObWdwWnJ3Tjd1OS9OdHBlVHFSbkhva1VmdWtRTFdu?=
 =?utf-8?B?UFVvT2JKS3hXbTh4UEVLbjZxRU82NzNPUTlQaVVKM0JCVEZHejFzL3EzQjlF?=
 =?utf-8?B?NGxYSHJzR09mWk01cCszekJYMzRxVlJ5QTY4dTFRbCs5SDBxZG4rbXg3b09i?=
 =?utf-8?B?NWVGVzVzcmJ2QUUyS2RrQU1janRiTmkvanFqTFUvcjJsUXB0M1JyRHFhbWph?=
 =?utf-8?B?NWNQRk1oS3E4ZEVYWHRMc3BRN281TXpjK3ZTNThhMnNDdWRZUkwzN25zNXc2?=
 =?utf-8?B?a0lFa1FWTVNjdW5TbS9WQnA4bS9oZU9KTWt2cjJqM1I0cVU1ZTQ5T3NKMjAr?=
 =?utf-8?B?Yml2R2FnQW9oa0VLcWRRZ0JUc1FVdU9mdDBnSWU3K2xzbVR4UjFRSnF3STRD?=
 =?utf-8?B?Sm1xMlR4cjhQclh1M1FHTGM0ZE0wbkxCOUhuU1c3K0RvN0wvTHpoaWxxZjh1?=
 =?utf-8?B?Rk1qdGZUQkJubnhLSXBCczIwVGNDNktaUjNFY1lJL1NIZUJpTTNrVXlvZWh3?=
 =?utf-8?B?Z3pQOWxPcXlQQktmWkJDKzNNaFBTNzVXSEVlMm5PeUlpSGxvNFIrNmdUSE9a?=
 =?utf-8?B?SHZmaHphVzBIWlVPMVR1OWl0ZlpUYi81YTJCQ05nNEMzY3BNWi92OStUSDVB?=
 =?utf-8?B?eC9Bd2s2Z2xERmhVSEdXWW9zQXVUR2lEVCtreDZYLzV3NHZuTWt0QUF4TElP?=
 =?utf-8?B?eHJKc2lLQWM3eklSemNUN2k2YitqaDhnNkYrMWdoMjMySVFZcDZjYWhtOWVw?=
 =?utf-8?B?R3JIeXpDdWpyVnUzb0RtMDZYSk9DQ21LbEdzeVEyZTQ2a0RwVXovSXY2R2M2?=
 =?utf-8?B?dk9iL01IODF2dzZkSDZPTHRnME92LzNxZFcvY0owQytHaUlnQmtkRllTRTRu?=
 =?utf-8?B?RWgrQXIzWUI3MXh2RUZMMFdKWlR1SnRoOFVBWXB4bkNhQ1BVTzIvS2J5bHor?=
 =?utf-8?B?cmdvMDZ1UkVaRUhkVURDeHpzaDlERTFtV211M0RqZ1NPL21JWTFJUWNmaFhv?=
 =?utf-8?B?QTNWbTlXTUU5clVpbkdyOGxIdG9iVHhsV09BUE9qR1owbTFaRExpc0d1Q0JR?=
 =?utf-8?B?WXVrTEFrWDlVczBUL3B4cjJ5dWxEa2ZzM2pkcTdCcjNHdTZKejUzSGNMTktl?=
 =?utf-8?B?LzZsSUhuL2xDT09Gb0JBQ3htUVZNWW14YXdNcjcwZlh1TGhMMW5YZVdUQWNx?=
 =?utf-8?B?MWIyWUFiVVhnVzJ3bnVvOXhuYXpzUkpLWWdxaVZ5SU1TNzJnaE04TlF4aUw2?=
 =?utf-8?B?YmxsWlR5UmtNM3hMLzdXVEtTV3BEblV3dXFFRGVqbVpqRnJYNXFoNUJhTzVa?=
 =?utf-8?B?VkZZQ0dBQWd5VXVvdXRseGp2UjJEeHl4dUdLVHpzRDZqVDdwYjBZNUZRYWI4?=
 =?utf-8?B?K0E9PQ==?=
Content-ID: <3CB070819E10BD48AF07500A7A8AD377@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0653b87-0419-4bd3-3e19-08db254c47f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 11:56:15.7323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d54SWkfV5ADVT5dnCPIEgjwdYhfuEJ5HZ+qn/xDYN90YVccYFJoWlBEdWOaiZwodtReJYZsUPtBu1c7OKUUURCkYyFmIM46xb+X0kOe1Tco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_045624_320857_45D153CA 
X-CRM114-Status: GOOD (  13.45  )
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

On 15/03/23 17:13, Michal Swiatkowski wrote:
> [Some people who received this message don't often get email from michal.swiatkowski@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Wed, Mar 15, 2023 at 03:20:51PM +0530, Durai Manickam KR wrote:
>> This patch series is intended to add PTP capability to the GEM and
>> EMAC for sama7g5.
>>
>> Durai Manickam KR (2):
>>    net: macb: Add PTP support to GEM for sama7g5
>>    net: macb: Add PTP support to EMAC for sama7g5
>>
>>   drivers/net/ethernet/cadence/macb_main.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
> Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
>
> Side question, doesn't it need any software implementation? Or it is
> already implemented, or it is only hw caps?

Hi Michal,

It is already implemented. Here the scope is to just enable it for sama7g5.

>> --
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
