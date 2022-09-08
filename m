Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD71ECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwlWhROE1icShrvG3xfFLYNYOrzG2m3aTiKYIo+iED8=; b=q1lszl0dgLkNXU
	d+jITVZDOso1dWQdyPULNCY2tWKQvFFFqVkbhacRHz3BgJaO3sBql4V/oTh32CfBdG9vjUxdaIdlP
	6G7dhFqOI8zVvBX+2IueI2Jnhr6W3QmyxvBuFfLkMxmRRNe8bICQgo8WM6bgTQwdsv6wrQ4eCCXIX
	Hjc9ava1VXOirydZGnwiAYBDSM2ZIkfns1Ef5vtCgcwU3o4bUTYdt/kbzuOAXQ7cYExBRQkZpM9Xq
	hvS9cmfF62jlQg5sO8eIAD544nlWvZ9ag1PIqpqzEluYWC6VZuGejQI2ODHxIJIAk7TcVjcpZiBwk
	r9U1UVHWJkiY6CeYrh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBHW-00HWd6-16; Thu, 08 Sep 2022 06:44:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBHR-00HWbm-Jk
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619493; x=1694155493;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JuwKKWo5c5Od4+7TLzGL5DblM7IitMaPtwqsDX/e86U=;
  b=LfU78nbhfGAzT+2xEuKPxAgvS7CVafuMZ2shi6JUr33sQH+aONKXG/7B
   b4MB8QwUvLU7UWAkv9fUBavHIDzXZJIsnL3kXQhSdjv1HHN9FlvUyot1b
   2/hoeAClYjdRKdifrd5SNhcbGSIckZgEca1PlcmXzhtr4peTkB088VLl5
   2v23GJP7zxltRHDFIYWqTkX1npHmw5dB43ibSZYP3m07044sJCvysrQoU
   bAEBNjrB12kYPnmvbjKtwW68uCsn1B6bx3T89qxxC1VUqV+EvjN/IBLvK
   BnNgZojjqonaA7BOdIipIeArNHtH3rsYZStIqa+zaqSnFY1527fNjnVx1
   w==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="189923923"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:44:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:44:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 23:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9NNKITzAlH2xJD6ofJ9UonLc0tCE/M1wwO392mWSn6UkrYX0aH12E0jUcx/Vw5r4nLx2ZfV5XRxkYseo8sF76hp3ZF2lv/bOPZqVCrj7YMJLUL55tBr/EkL4ffta0KRqzFRc6It5uP6tNLY8kR9Z9v2EED/Z5yy0ZUAxxibqSeKth7hMqj/7aGVkyuQR7qQfzEvAKP8VrQvR9XhrLUa8HHxuMVXZH7jUSy/ywYc+XDpeF1+6I06zHbQMIv3tOE4zEonRmF/VeJdS2sJoiAqf1Fqt7McXWcJUXMSgMWD8TUO6vESdHZL2hgTo/TreYNRPzxQXxi9EIFp3D6MJe9r7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuwKKWo5c5Od4+7TLzGL5DblM7IitMaPtwqsDX/e86U=;
 b=HwaO6QE1vzszcaRVSQV2Sbk5Uch7ra9/T/yZSWCcg2XLoI0BKFzKOCPNTnfgzuR5pSBO6dqtuZGdIaQMxAB+4B38eep9Z49SjeZIZCyVQZGZxS+WxAALo0RXOcpVOUPMG77WW58KvWu6R5ChBaOS+/iO4bqVhojB7LlAlDWbMr3bT2VZ0u2FkW5sty/ilQvPKSyW7NqYYaWxZVpZb9Oj6yynNQEGxKF2+WhggUOlUQ/csK98lKf6wQHj5wIZDnnNfH7pWPNDYX4YDyVWgV6b2Jnp+QiHCt/NUNxKHVevPScOlG+vmN/Mnur2HESeBEu9RhPAnNEB5WSfXzbDj3zY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuwKKWo5c5Od4+7TLzGL5DblM7IitMaPtwqsDX/e86U=;
 b=vv0pTLFhMA0jfzG0rwT4qzzK1W0rMeD3DzLT75uXGqB5W4TUoAW4nlD6PZebanQBhC57TTa3NJE+XjBCsNxdR8Bmx0+OyOunVaSYNkhkYkW8xbOR0SQzCXymiwO9ZvcFQu/L5tcU5wQBWBnoe7givzedq/6OPc/bGhfcgA6L5rQ=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:44:31 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:44:31 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<nathan@kernel.org>
Subject: Re: [PATCH v4 01/13] clk: microchip: mpfs: fix clk_cfg array bounds
 violation
Thread-Topic: [PATCH v4 01/13] clk: microchip: mpfs: fix clk_cfg array bounds
 violation
Thread-Index: AQHYw05y4MB4vKigokCPWQLu42HTIQ==
Date: Thu, 8 Sep 2022 06:44:31 +0000
Message-ID: <119b58b7-7757-7f76-1472-8047961c9dd1@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-1-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 201f44d1-29d4-45fd-243f-08da9165959a
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j7HV5HwB38bWjWEsfYs6x8TyzPEVZuR2j+ttrEBiRr4QdunYEBiZxDnfMYjCaWoKBPDcjyDbfPYzdvNRpLhj8eFwP+g/NH/BS2A8eo8R5iSQZEqkj7c6+5nIOdEBkHj0A34A3lEp2hcJYyMgPJzruXB6131HkHOUlwZ5V3zuzemDs+ccqiTFgWzk7a6F2csmqRTFrQCms5IrYO6p/MDzP8WnVPOmm9c2ua8yTC2v15pAuQ2oyVydMDfWJD9x9hoWqo0UASbahiunqH1eVWA0QtaT0CZARFvK85t/PvLhTpmI5GzzkLiENZ3OL9EsKbfWugcFaZYpLEiDbRuart6I+ps6KG30MBDIEEE4Bwo1CUEI/8B+D/FV0vTMNDuffiyW4dJRdJOPmCNI/4SWEVjjxjUOO1MwlFD+Chiox+h8i2UmAOtsZbDKlHIvbgHmoj0NY8ZkZjsHRcjwYeDEjFwzeuUcRY+f9/NPXVGeTLz9uJ/pJaWZn8tdofzm1yHj9+Fpw4t7SZDBGzg9vqfGAsPCixqq6hzLDL2svBwOsA+DAULHm9exzVENduV+GHz0Ikn6izDtjnzkCfpTSG4wbDiPFujMM2YwruUpgcRKf3uOs85WskfyhOo+ht3INKJqKqbTHZDYhmCtl2ZvGGRSSVYcMK7mAItA6B4typZKk/cDlhTI0qKTAc2ladv8byANDupBoc7gymlZ3h+m7cL6p904jeXiJ94O3XoxcMvM8VZv2DAOy7kWpaYP0WRTUjMjOWwifXBAHrB7HYyuH+D/ohVKrrM4+tNL3COiYWUDZQskh1pZSxXcJJal7cGDUy51AfK+IfXNeUgkuofZUFlNuOzbFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(45080400002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjNvTGF6cHF2NTM5T2ErRE9Ldkp4VmpxTTZXd3E3dG5GTG5WWVJuNTEwc05k?=
 =?utf-8?B?VVlQR2pBeGRLZGxFNENjcUhEdHgvT0VVNzJ0amtxN1g5ZStSTnhVUENnZEp3?=
 =?utf-8?B?K2hVTmE5dW8rYWUvOFAzdFFKaGNpMUFyTDNNMXFvdDF6elZub1ZLMDZ3L0pQ?=
 =?utf-8?B?cm5IaUYvUWt0MnJ4eDVUOFBsR3FxQ2NRNGR4eHRzK1VzMWQwK2xrYWJCanNt?=
 =?utf-8?B?WWF5MTUzVjg0TkJJWFBjcEVwcHd0S3Irbk5TV0ZXZWFYcjRxOW90OFFJTGRY?=
 =?utf-8?B?SkxQS0ZWTEQ2bDcxbktlMmwyVEpFQXhQVXppb0lsbFY2M3BxcXhoY1ZYeTBl?=
 =?utf-8?B?Tk9HOWM1UThuL1BZL1BGRnlha1liK2hpWVhBRURpNDVmaGxTOTMwN3hPYUlk?=
 =?utf-8?B?Uk9iRW91QnlGRDFTLzhZY3hhbGhVK3V5U2NBd2N4aWdUTTQ5aDhDTElpemgv?=
 =?utf-8?B?cjREbVpIMDVaeFJmME1yN1dETGk2TkZIWVJaZDBvTi84YXlGVjVFMmlERE5k?=
 =?utf-8?B?VEZOOU5HUlZVOTVuM093QXVrRXFJWjVJMVRiL2MxZHQrb2IzSXE1eS9hZ1d2?=
 =?utf-8?B?WHhReFFjQ0U5RnJHcnlEQmRjVlFvRUJOeEpaRFJ2RVNjUE1DSGNreXdhbUhs?=
 =?utf-8?B?djRYOGllRkhvVndmNStOMUlxbUl1RU1MVzVZK2tGZkFmeGxjM2NsVjRELzFm?=
 =?utf-8?B?d1R3MU04OFlRQXNpN3RuMDBBeStNWFZvbXYrMmRqZWlEbFljSytRZVF6aEk4?=
 =?utf-8?B?RFRzN2Vld3krVHFFdVozRUVpaHFTZEhvNDh4UmRyNjRjdGlXVi9jc2J6Q0NY?=
 =?utf-8?B?NjNiZUFoSUNIbDV3U2g0ajN6eWZBeUtHQkNpZ2EvM3UwSlN0WHIva0VUTmdw?=
 =?utf-8?B?Q09WdFV1QU8wbUR4dkZpejdxL2FKTVc1UmMwcmdkN255bVlUNlB6YmZIVmhk?=
 =?utf-8?B?eXEraTBuenZMbWJmbXlzVGVMRWxXYmxCWlVwY1pvTzVjMzhKYnlZZUpJLzdW?=
 =?utf-8?B?S2NIS1IzSCs5NzVac1hVMkRKZmxVdGZVNEhLb254SkhScXZFYlEzVWR3aERF?=
 =?utf-8?B?WVZ4dDdkSWYxYTZIMnlFdTlJdnNTZHV1S3hLaDVhMHRoQys0WjRVN1ZBZ2d1?=
 =?utf-8?B?MmUwOGJOM2t0SCtvQmNUZmtrVDJNSnNmaDkrY0dxMnlGdUdTVUVrMmtOUlFB?=
 =?utf-8?B?UHY3ckFveXFvVHNmQ09XTzhMd0VoUUdVZGlQUldIM0xQTU1QWHFsMitSbHUx?=
 =?utf-8?B?eDJxeEhBSkZuNTRIbTF6ZlV3bTk5ZTFRWkFxT2VVbHRWeitPb2dBeGNwS3l1?=
 =?utf-8?B?TEVsY1gzTmR4cWNlT00vUG95LzRDaTRQcGFIMFJGdGpQclRoUWdNTVV4UWNv?=
 =?utf-8?B?eksrZTUxRE83SlJpMEtLOXMvVm9zV0NoY3NTQUpHcjhtZnVweWdOemxPQ3M4?=
 =?utf-8?B?RGVUeUxYc1N1YUdWN1M5WUhyZExXTjFGdmg1cnlCTFhZZ3EyUFZ2Y3pJTlQw?=
 =?utf-8?B?aGhuOExRS1VUTWR1OUg3WVdZZExDS2ZsaWFIYWVCSDVma3B2bjJPRFNHSDhn?=
 =?utf-8?B?ajhGUG9pWVhpUXhiMm1QemVBb2hEZE1yeklOd2JETmtYcWlGMTcwSlh5OXNU?=
 =?utf-8?B?OEVhUnBiN2xpUmh2aWd5dG9CVXNBbTlRK2FhaEkvMnVEM0NnWFBLVFM2ZlJK?=
 =?utf-8?B?M2ZXRU1uZkNHZ2F2ZXRmZUxjZHh0c05QTWYvSlV6M1N0b3MwT2IwaFhVWitH?=
 =?utf-8?B?NmNIamhQNU5yS01RY3JVdXc4anExK1dUdkNhNlVqZ3k1VVBhL0tRM1c4N3NV?=
 =?utf-8?B?eVJ1QU40UjBmV3E0Y2hrQjNCNm5ZbnZPOTRtbng0RkRZTG9DUDdUUFI2Q3By?=
 =?utf-8?B?eGRDQmNyTkVCWlJwWnVtSm5tNmNXakRtdmE5cDJVcWVMeXhOVmxqckUwWCt2?=
 =?utf-8?B?VTk5TWZZYUFtUGVMRldGdmRVZXpKZUhrWDJ3NGhxdGx2eVFEUDNtNkpXRmVr?=
 =?utf-8?B?bEVjSzd3RWtlbXkvdDhSRXZDMGpTWWtGeFFmQ0pUclBhWXpOZng2anRSaHpi?=
 =?utf-8?B?bi9SdEoxYmpEbjdlZDlhdDFNdy9SbCt5M2JSWmJxSUw5TlJrbU9zbzBkMGln?=
 =?utf-8?B?RXJ6Y2pSbkNoT3gvV1ZWY0c1RmsxR2dGV05HYUx3MzNJdGczWCt4VkxweFpY?=
 =?utf-8?B?bmc9PQ==?=
Content-ID: <948FF9BAFF5554458405DD155A8510E2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201f44d1-29d4-45fd-243f-08da9165959a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:44:31.3509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0dzsmd8W50pK6x5h3lJiDZQtJ6WdylCfnl2INS4Ro7kdPj7ZwcsY+PgeRAVhM1p/q6PYqZngjRA69pk0hsPQaOnbEpxJozbMyBuYnwQC8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234453_682280_F96636A4 
X-CRM114-Status: GOOD (  25.33  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> Unnoticed in current code, there is an array bounds violation present
> during clock registration. This seems to fail gracefully in v6.0-rc1,
> and life carrys on. While converting the driver to use standard clock
> structs/ops, kernel panics were seen during boot when built with clang:
> 
> [    0.581754] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b1
> [    0.591520] Oops [#1]
> [    0.594045] Modules linked in:
> [    0.597435] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-00011-g8e1459cf4eca #1
> [    0.606188] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.613012] epc : __clk_register+0x4a6/0x85c
> [    0.617759]  ra : __clk_register+0x49e/0x85c
> [    0.622489] epc : ffffffff803faf7c ra : ffffffff803faf74 sp : ffffffc80400b720
> [    0.630466]  gp : ffffffff810e93f8 tp : ffffffe77fe60000 t0 : ffffffe77ffb3800
> [    0.638443]  t1 : 000000000000000a t2 : ffffffffffffffff s0 : ffffffc80400b7c0
> [    0.646420]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000000
> [    0.654396]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.662373]  a5 : ffffffff803a5810 a6 : 0000000200000022 a7 : 0000000000000006
> [    0.670350]  s2 : ffffffff81099d48 s3 : ffffffff80d6e28e s4 : 0000000000000028
> [    0.678327]  s5 : ffffffff810ed3c8 s6 : ffffffff810ed3d0 s7 : ffffffe77ffbc100
> [    0.686304]  s8 : ffffffe77ffb1540 s9 : ffffffe77ffb1540 s10: 0000000000000008
> [    0.694281]  s11: 0000000000000000 t3 : 00000000000000c6 t4 : 0000000000000007
> [    0.702258]  t5 : ffffffff810c78c0 t6 : ffffffe77ff88cd0
> [    0.708125] status: 0000000200000120 badaddr: 00000000000000b1 cause: 000000000000000d
> [    0.716869] [<ffffffff803fb892>] devm_clk_hw_register+0x62/0xaa
> [    0.723420] [<ffffffff80403412>] mpfs_clk_probe+0x1e0/0x244
> 
> It fails on "clk_periph_timer" - which uses a different parent, that it
> tries to find using the macro:
> \#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
> 
> If parent is RTCREF, so the macro becomes: &mpfs_cfg_clks[33].cfg.hw
> which is well beyond the end of the array. Amazingly, builds with GCC
> 11.1 see no problem here, booting correctly and hooking the parent up
> etc. Builds with clang-15 do not, with the above panic.
> 
> Drop the macro for the RTCREF and use the array directly to avoid the
> panic, using a newly added define that brings the index into the valid
> range.
> 
> Fixes: 1c6a7ea32b8c ("clk: microchip: mpfs: add RTCREF clock control")
> CC: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/clk-mpfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 070c3b896559..9e41f07b3fa6 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -27,6 +27,8 @@
>  #define MSSPLL_POSTDIV_WIDTH	0x07u
>  #define MSSPLL_FIXED_DIV	4u
>  
> +#define RTCREF_OFFSET		(CLK_RTCREF - CLK_ENVM)
> +
>  struct mpfs_clock_data {
>  	void __iomem *base;
>  	void __iomem *msspll_base;
> @@ -381,7 +383,8 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
>  	CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
>  	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
>  	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
> -	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(RTCREF), 4, 0),
> +	CLK_PERIPH(CLK_TIMER, "clk_periph_timer",
> +		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].hw, 4, 0),

A personal taste: as clk IDs and clk indexes in mpfs_cfg_clks[] array are
different thing (ID for clk_periph_timer is already different) and the
CLK_RTCREF - RTCREF_OFFSET here is in the end CLK_ENVM = 3 maybe easier to
follow the code would be to add new macros like:

#define CLK_CPU_OFF 0
#define CLK_AXI_OFF 1
#define CLK_AHB_OFF 2
#define CLK_RTCREF_OFF 3

and change the CLK_PARENT() macro something as follows:

#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT##_OFF].hw)

>  	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
>  	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
>  	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
