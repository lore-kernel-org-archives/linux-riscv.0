Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13FCC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1VsHH5rDitVoSCxvkWKU+iRRUsNAX2zc1grc3Zxh4I=; b=NwMgdCA+ppeX7w
	PBD5BeUPiYaoq0LyvkfDv9YwsTGzu8jkvJsJIEvbhb5TX6apBD+vFWpCOV4bwW9AWJWz612MZkAjM
	agvAIODbAL8VXfJ/bKXj7OwXjx09/s1Kx5BjQTmsZI3rarW/UkHKQEUm4xKzcP/vWgFn2TKRwOG1m
	PfRtoVj0CVUGfSD56LWKCHaLcJk8NTtTxX9M6WVE3lm7LN+L4lI0lxJzvYibt1of2fQwuaNtOiBIa
	UiqCcYWz05HfcGUZGTXPTAaboP/Fronx1bNbNr3XHMymtdRImiCtk2DXKwofjP7v4lyTBg2i5JqYV
	a3Wou2i0TWQjaWlEK3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8cqt-00FUPb-0M; Tue, 05 Jul 2022 07:20:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8cqo-00FUES-E6
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 07:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657005602; x=1688541602;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EESTty5lfxesod253zoBi71Y0BXZUKcZehHCcHWlJwc=;
  b=UfQAcAxV7KQCAsQdDq4Qk8m/fSEHuH+fX7C5jVvtwta0JlkY0y4t0I05
   wNphDJ1aJVLgHW4CS1YLqbFmnDBj2v7KuBWH26iqKqiPpDvFBQ1hhveyb
   2QbCcGh4hfkMiae7xuDIznUrk/axVVkjM5bhWzhqNEnF9Oq439pcrew5x
   A6nhbiaDU5otWg2brBJukDe0o8DTzfa7+MycAQLe42kzBG0g/CWoaDM56
   x7tBMGw5Pt5eM2Uml1+EZI7pnLf7KIwNgQhtPkxEB4SrBEq2F0cef+xHh
   twYCORZsF4RME3dTTAXUSQgOLMebA8tml0EZhX7vRy+adD1y2Z67C4BDU
   g==;
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="171042917"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 00:20:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 00:19:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 00:19:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvKqVGYGU3eouvgNgS6FKe6tStPTKlCK88z1CJI3cTcTnYNC3xnTdGZSfq6Wm9cuJN4yi6LLLfTSAgXrBPdKCiEL/eylHS8sl16HUySM/wYnZGp3A2qPa80zqSJwLEmM3f9KxHKjQT1243iFSxjjOCntuzl2jygGB0VzqPcWVBMu2uuOFhzvdhG9yuz82LqZY6cgHPvPzzluGTg92ADV3/4ryZHSO5Oy3lXyGGkNsdsAx9n8FG602PfdSSJMxotfatKtDP870svGbFM6yhbYJvLHQoqyrEoLwFpnbuajJJk+cZPM4V4A1j5YV6DTb5TF/TWfioBED46Sh7ihh+pHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EESTty5lfxesod253zoBi71Y0BXZUKcZehHCcHWlJwc=;
 b=FbbCxLDCcF2zH6HIj0uS+IcLp1dtZG9D54RphwZCccl5FFGMgyvajea2wWe1jSzZCe7A905XolsmBCMNST5AvJvIzJaGn0KxPxzflHvDmZytTPiuFDjZLI6eUe0R1JmmqFOfLZs3G+k/rDFkcT1M4LzgmtDgBYOhIEIBALj+fAgpDVT+6a4ZzZdzaR3a1XSWNKcj4alycyDB8sa2j245ymCiSsy4JLvzWAUuGQ1X7DVEOTCpUu+zmk0F2FuJ53nN10HY4NmSqzi5GvEsWATqotRy+/Lued43PPGykoNEkGMqIrkMe62Yy1isC9Y5OIPI4g9S3G3GAwa969YGXx5jkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EESTty5lfxesod253zoBi71Y0BXZUKcZehHCcHWlJwc=;
 b=YZUd+C/8YhM9O3J/OkfbICBpuntZup1RqAYtoxjHh/hExcrfSa6VO/UB4bCIcFjzJnt4egRZrSrXP1kxUy2SkaisH/+8aG9oSV1NEYtvwJXJk4tCSbU6Wq3FYbVwzcQds1dFkivWZrFskfgtaSvcIVo0w487/ROOUNBVTlmEpLQ=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by CH0PR11MB5739.namprd11.prod.outlook.com (2603:10b6:610:100::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 07:19:55 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 07:19:54 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Nicolas.Ferre@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [net-next PATCH v2 3/5] net: macb: unify macb_config alignment
 style
Thread-Topic: [net-next PATCH v2 3/5] net: macb: unify macb_config alignment
 style
Thread-Index: AQHYkD+fxScyJXAhvky7g4JpHN4i5A==
Date: Tue, 5 Jul 2022 07:19:54 +0000
Message-ID: <8747ac2c-4363-4fc2-8139-08d21a778677@microchip.com>
References: <20220704114511.1892332-1-conor.dooley@microchip.com>
 <20220704114511.1892332-4-conor.dooley@microchip.com>
In-Reply-To: <20220704114511.1892332-4-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3711fe4-865f-47f1-47e9-08da5e56c263
x-ms-traffictypediagnostic: CH0PR11MB5739:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oQ0tbSm61XXUx+v5bOjJEft/sZTBufXhy36lDNpb8GmDOCPds0CxWMotsTBbx+pUAIPgqIpbbAoniA/5aRJwmBdhillaRXwuZ9WssK/19MOBT86De+8tjIj7YEMTcDCtoVnTSc0ldEr8YBiogNQJ2pkNmdAtuqTtthaMtsJN174aJVohhLJ4mPuzQV+Go/+vtVDVuAyptMcmJexhrijK/ykz/LW0amUPiXRgnlmNn2LrBVGSEuwYI5VAIOBDAFhuZTmaxmbYtGd0zUwiBN7heJ1xjeYF0WbmuJ0CQ7L9RI+R6J+EZYk1QXRitx360F9GRmBr33j2xwJKR7r8fqWHm4+sPBN8zAq3jH/8kXTkbftWITkjRPFj9UPMpA5mUi8c+tj6OGYXK+RgNseSlURvsEiqcvgMXTLjSpVy6y97KhaJXL0BZnOiaiXKhrQoJHzdSJT9K0zxaClXhUXPWMIZVo1cNk3uWuMTziWsis6a50n8CG4laexvdOM7kHQZ+HGB02O83+iW+iM4f0q0sjQRWw1ujuQqdqakXttVA5346osYfyeRk0GNvDqtCFeNUakBy114/hFK2S0INEPBHZujqhXyH8zoAQfppWL07Hg9POCr0xpXhMfyChDstkhreBOhOxJjmw0kg75VLO78FTQff3sX8mQYKKpKeHAxLrfBsHy6wDOCRiuUernCqPrzxc6POEYmtyHerRBBiAO3xDFcs1P5x+X7sL04IJMVgZgfqhQZ4TDvzaQOeTq/8ZwmQZPV1Ua/75IATvU7HAaclticTt6GRKBap8cpaI9ZyCR1vEmUyKSvfW07yDk4E3tFVe48aF/WfU08EigJgMYe7DiyKah6uBqas2tcJVgsBXY5nynt7ryfkG+3xPM9tpgD49WA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(39860400002)(136003)(366004)(38100700002)(6506007)(31696002)(8676002)(76116006)(186003)(2616005)(86362001)(41300700001)(83380400001)(91956017)(6636002)(2906002)(53546011)(66476007)(66946007)(36756003)(66556008)(31686004)(110136005)(4326008)(316002)(122000001)(66446008)(64756008)(54906003)(71200400001)(26005)(8936002)(38070700005)(6512007)(478600001)(7416002)(5660300002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlVSQ0NDMEZWYjViOS9XenIvTk5ZVkE2SXFITmVscE9FWHNTUEpDQTVIaXVM?=
 =?utf-8?B?blJHUGNadStrTnY5Y3Q2RFY4NklUY3JtWHB2OGNOby9pSzkrSW5XYXJoODRO?=
 =?utf-8?B?ZnM1WkNpUWlwTEdTcE9UVjFYTXBlRThsbndlamtZUmNrMy9ZUDVveWVnTyt1?=
 =?utf-8?B?eVJOQ2VkdFRqRERJMjV2NDMxczBTb3ZHZlhsQktndVFsNFoyaU1JL3plUGtR?=
 =?utf-8?B?VHhXaDNpS0hqZzBoQWJSeVQwTDlsN1hENHhvYVhycVdrVk0zbUxyeG1BanYw?=
 =?utf-8?B?b3Y5cHhMVVBZV0N6MGltWXl5bExQNGpwUmxNbjN1T1Z3VnpNRU1kL1JES0N3?=
 =?utf-8?B?Rlc1MElEcnlZU2F0Q3FEWWZCMlhCTzFvV1NNeGRId2lCMnAvUWN6VmgwUlEx?=
 =?utf-8?B?ZFFTSkdaZUV0RmphMWFxRnFnaTlkc0FhTGNTd1NvY0RRUHI0SDZEQzNRZWpy?=
 =?utf-8?B?MURhVEtvem5lVVZ5RFl4aHlVa2grNDdwTVE0MXM1Vnl6d0RyNCtTVU9SRnVZ?=
 =?utf-8?B?R1FqeGxMalROTTk3M2ZIZUMybWMzanhyS3V2VE5DUXdaNHhRYzRtVVYzWkRw?=
 =?utf-8?B?V3NWd040Sjl1ZXQ4dTFEYkYxWXhXcGNqWW5HaXZwUWdUOXNuWjJ3a2JETzVw?=
 =?utf-8?B?eWxQYkY2Q0l3djJ0RG1XM0JrWDRERjNOdzd4YU1QRXFFZ3MzWVo2Wk5UVzY5?=
 =?utf-8?B?VTV3djIySHlmQmhqekRnZmlaTjl2RzRNNFNBdGorazY4OVI3Qnk5bEpOTks0?=
 =?utf-8?B?Nmw1NEJQK0ZxVHBMY0Vnck00enNWdU9FckJac0hnaEYveVBCZFRGdkp5LzJW?=
 =?utf-8?B?bTFmK3RmNTZ0V1ZDS1dtQjYvamRuZnBpOUFhZmNSOU1kZ29oSDN6M2JvSjln?=
 =?utf-8?B?cDVQbmJEYWd1TFdIYS83dmdPZWY5ZVBnU3dPVVRUaTlzSXpuVnhHak9NSUF4?=
 =?utf-8?B?ZzRDTkQ1aDM0TURjWGVXZHFLUnJOcWZCMU9BbTUrRnpBR1VnbW1uVzRWWi85?=
 =?utf-8?B?eDRoN20yUVVZc0F3Tk0vWEJINVBCMUJlSTVGTzhPMGtXZTY5Um9xYTJGU0Y3?=
 =?utf-8?B?VzROS0lyd2pXOERnUU9vbjNuLzNzTTdNQW1qcmRMV1FuN2FGZUFGYzZCaHB5?=
 =?utf-8?B?Zks1MzMrYXVJdzZkNlVxOURRcGhiWlFZaUZHc3FmNEZzRitxZjYyaDM4MHZz?=
 =?utf-8?B?SDAydmF3cDczTzhGWU4vY1JoWWF0cGNGU1lqdWY1SlpUV0hPSmxXRHpTU0kx?=
 =?utf-8?B?eUJ4cmVjZ2pueHlSa3hGbnZ2Tm9Wd3JmNm5ITXlPWWJsQlUyZ2YrUnM0cmVL?=
 =?utf-8?B?VGQ1L2FYeG5vRDBEZ3RVRjRiU1I5RXZHZ1llaHhSTmpDVEYwUGdxNGF3QXBp?=
 =?utf-8?B?emxza2xVbFliZ1ZsWTdVM25CaTNoZlRreFpWa0JTUTBReHFPcWJNV01aRE5o?=
 =?utf-8?B?enpnOTFCK1ZNaDVkZUdKQnJKQ3RoRGYvcEhGZjFxeElGaktZaW5uV3RTWDcz?=
 =?utf-8?B?N1NrVXFsVnNBck5WaGN0Y0pzZ2tmQ1dKZExOdDJRaHFNSXB6Nktwa2lGUklx?=
 =?utf-8?B?aGV2U2dHZVVaR3RjZThhSnRyZGJlSldoTFRqczNrY251ZGN2U0o3QVNibjAv?=
 =?utf-8?B?cnVGaUJXY1JXS1dyNEQvNzhsL1VkWHNVSTBrUlhpamt1OWFaV0tPeDlZaFVx?=
 =?utf-8?B?SzB4T0ZHV1MwWUwzOVdyL2J0T053bEFYSjlFYTJ3K2VGaWRuNW84eTUxK25L?=
 =?utf-8?B?cGRKa3lKMmdlcW9aaThqdE9GVjgwWGtqcFNoT0VVMTEwWGxHZnRpdnA5SXZn?=
 =?utf-8?B?VnkyUkNRVUhYbHlnR2RVUHFRbnJVOFlnUWhSZGhSSlJsWDdlVWZwWGdVbVU5?=
 =?utf-8?B?K1B0dGYvNTJzWlJZWCtRM3dQRkJFbmZ2STVaUlFNYTZwb1h4ZklmV3dzRjZF?=
 =?utf-8?B?OTR4SjdVTUJqblltdjFqRldyT09xZmxGYW0zMEYxTmtSeXRkTXh1M1BuemY1?=
 =?utf-8?B?TWdJMFVOK1hQVXBHbmVYTUpkYUtyVE9seFcyWVdDbDMxSndaa3lhU0tBNDkz?=
 =?utf-8?B?QStJY1h2NDQzS2xIbWwzMUhyL1RKczN1R2w2ZU8xM01Xdjg4MzhsV0E1Q1B2?=
 =?utf-8?B?dXREZjMvd3JlTmtsU0U5Nm5PUVVFMWRDZWFVb01CcXZXUzBmOVpxUXlUMXZr?=
 =?utf-8?B?d1E9PQ==?=
Content-ID: <BAA0F1BA029A304AA85EC4B843FD1EB9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3711fe4-865f-47f1-47e9-08da5e56c263
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 07:19:54.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0Og39OrXQSPhED/ShsVHzKCn0Qk1tnOuLIwtpedrD8nVq/nlXctCVTZiDnxzeCuF23nshPaL4DECnKOv3Tfb7g2whTx3a7N07RqMgxJ1Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_002002_532905_700FB3C0 
X-CRM114-Status: GOOD (  15.54  )
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

On 04.07.2022 14:45, Conor Dooley wrote:
> The various macb_config structs have taken different appraches to

s/appraches/approaches

> alignment when broken over newlines. Pick one style and make them
> match.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index d43bcf256b02..85a2e1ea7826 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4626,8 +4626,8 @@ static const struct macb_config at91sam9260_config = {
>  };
>  
>  static const struct macb_config sama5d3macb_config = {
> -	.caps = MACB_CAPS_SG_DISABLED
> -	      | MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
> +	.caps = MACB_CAPS_SG_DISABLED |
> +		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
>  	.clk_init = macb_clk_init,
>  	.init = macb_init,
>  	.usrio = &macb_default_usrio,
> @@ -4658,8 +4658,8 @@ static const struct macb_config sama5d29_config = {
>  };
>  
>  static const struct macb_config sama5d3_config = {
> -	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE
> -	      | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
> +	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE |
> +		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
>  	.init = macb_init,
> @@ -4731,8 +4731,8 @@ static int init_reset_optional(struct platform_device *pdev)
>  
>  static const struct macb_config zynqmp_config = {
>  	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
> -			MACB_CAPS_JUMBO |
> -			MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
> +		MACB_CAPS_JUMBO |
> +		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
>  	.init = init_reset_optional,
> @@ -4806,8 +4806,8 @@ MODULE_DEVICE_TABLE(of, macb_dt_ids);
>  
>  static const struct macb_config default_gem_config = {
>  	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
> -			MACB_CAPS_JUMBO |
> -			MACB_CAPS_GEM_HAS_PTP,
> +		MACB_CAPS_JUMBO |
> +		MACB_CAPS_GEM_HAS_PTP,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
>  	.init = macb_init,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
