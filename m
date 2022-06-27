Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50B0CCA473
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6h8EyKhwqEHE0PmJWQ0V132gNC/K7jE7IdbEn2vX4A=; b=rS2ZhDdlJ4I/t/
	e7WZ+l0eag13Luzmwl04TtOX7CrdR695PfIjCfqloigx3+NcG0NXWxTGn7Vlt7/+BSlFHrqYx8GvK
	au0G6Acm8zzzI4ZlreRJnCsD5C98ug8hVgj9SAWaJv70k1uBkxHx9Fz9rGLhms+NpvGyzL3ceVJVM
	YGm22ApQn7k5TwlCDJ8VUx3hqFIhOVtHZabMWQaxiSz/7wcPk2FcitQpmOc7mDDmo2Fw3FkR/lW1s
	a/H8GaDCvfTYNtqKn7fZ6VWsiM4Ob/KKHNNPwuUbipdHo44Ii6/i76+baTKYFkMS7PueoOQUG6pu/
	c+HEvnlQUoIUe/num1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ipL-00GJXL-Ff; Mon, 27 Jun 2022 07:06:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ipH-00GJVJ-P4
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 07:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656313587; x=1687849587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uxK79LnZN7wg1S/baveMCEqckMl0me1kjXQnBFyz830=;
  b=OjnIP6fjVZzYQWIcc//QghqcXRXnVw+XH2WHmT+d1C0TnsxngByK6JKC
   3JVjDPjMD7zRuu2ID9vC1VYS6BySNw93BO3vxvUguIhy3vHcRpNcvWQXW
   XRkaNNhsk3cqHoigAI+mE+t86zY6IXFQOM3PTJxSJ5zJQ9x+DOYmQX9ED
   OWvOCn3RCmlEgxIQt0g7IYF748gg0DXGePgyq+bHNRlBvwleCiDt+w5+5
   ytDWpQkQXnyduV/0GWXvMKSv7iPH6slRSbsIfHhiNOCtGa28Dfm+xzQ98
   phHLpLhfzFah9HvDPzaqXgzhkHGQqxgTJ/5K3LntgoBg+9jTW6/UwTh3N
   w==;
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="165187226"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 00:06:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 00:06:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 00:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr1I/Kq+yd2OVHNAKE6h/Joueirld+XygMV7EUBFGCXZv4z7KhWNHZio+PNTDzL/dbUDgFPq7Tb8zimFRB0cgAhpq1CrRgqWXFgP+y8YLEmkrmNZrxIsqJ28BTQfTJmG6XXc0oUdF97dFKDfleGIfsEm3Kbl0Vdiye7LP7vgTTEqnMyqtK3RsITRUc78tlnD9qBB2KfpGIsGJforW3ABUBJ+x+mEl3RKSn+cy/OBr0JKAP/UNl0+32n+DyObvjVdLzPbYrS1/6EbeGrnYWR5O6bBJU03lDmb16RpgsSil8oKOjYrGmnmmkosRxYsRTem+dDC7TSzjw5mO8mN96uQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxK79LnZN7wg1S/baveMCEqckMl0me1kjXQnBFyz830=;
 b=oVP43OdT+CSIzCR5binRicu0GGzwv6TmZALBfgKxT4Gm/VkPMZkUZk0NOCViK69Fn/QBosOf/MavFxUsLEaXq5iWqKHLuDxxumMsJVINBZp1jEq7O6jfK+bXAPXnRwBPPq1rAKyBAvbTJaezehzcJt5SiOu1L5QWKmAhFC/AhTrxAcyAym7t8FEJWsGXNTGZzbGBMdtPrRMwh7vpB+wIN9OlpU9sjE5BXAkuD5X0WCcl7ZBA4WTfyJJxiZb6gnnJF2ODY/FzI+bW/mOvIRQ59FfebmR2jxUwpZO5vtxTRfz0NX9+rDEnkq1DK8XEEs7L4iuF280FZ+/zFdn2wnJ5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxK79LnZN7wg1S/baveMCEqckMl0me1kjXQnBFyz830=;
 b=O5xFFhoZ4K1k/lLmARK0JmhZSEqR5M5TD1aYPoF7jxY8xvvVBo0oPXst4JqzHUQwmWSjzarERvmwayPXXB1gx+/ypbLTVXGoyHgJOqVVnEC8FIqrJp9UtRwea9yll3NpkVK59Si1VToHmyUOlhFLoscBDIqEPeo+l+PoX4vlvPk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2723.namprd11.prod.outlook.com (2603:10b6:406:b9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 07:06:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:06:10 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <Conor.Dooley@microchip.com>,
	<damien.lemoal@opensource.wdc.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <fancer.lancer@gmail.com>, <tglx@linutronix.de>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <daniel.lezcano@linaro.org>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<geert@linux-m68k.org>, <lgirdwood@gmail.com>, <niklas.cassel@wdc.com>,
	<dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>,
	<thierry.reding@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<airlied@linux.ie>, <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
	<palmer@dabbelt.com>, <broonie@kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@rivosinc.com>, <daniel@ffwll.ch>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQCAAAjWAIACL32AgAk9twCAAAL9AA==
Date: Mon, 27 Jun 2022 07:06:09 +0000
Message-ID: <b8dce80e-2753-497e-1dd3-3eb0d248b74e@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
 <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
 <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
In-Reply-To: <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: feab9995-0017-48b0-0cbc-08da580b8375
x-ms-traffictypediagnostic: BN7PR11MB2723:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +8sUvYL7spsTFkcUYIOKRDYRR5hbI7JKrkUvraFRcnrge31OTxiEIDDPKG8Bj+PoVHAtZdBKbPG72i03sj44DORT2X6niPzgs2i5DcpOX4M0FPo3F4JsroAHBBjeIwOdDbMc7KT8Y/fLQM0LgIFlpDzwnwFXItNvlaBaVGa/I2XrwEKr3RKxuCMFJOma1vwIiauBJfrdldsWfOEGGgLAlF8GON4RNeFcc//6bRDsSTEdf8hCixQ9z34m7bwdKjh1am+hIzwnXGLOkvpVV2c6iIQpyZd5ux97TX6UIuvEzXP/DYIjN3du4CwYbLlCUUCeMDj7CZZr/XPHcnI57x+bAkymv5BQGj342sew0KrEBAyWQwlSuOF4C+UsqJ+hahnb66wfMDv6aPvxMG58J8yI1yVSdxl5GrYiLYfce8zgaH4oLC66J3Y5tHuflfPy3Je8I3ixELDY5+ZqEQ4r6dTjCAOocKzkQH9PCVeOoVqbUbSHbi+CDUdr5dezCe/h/AwByeoMkLxmByyt86cQdK5YwoRsP3buw6drztuIOres087p61G1mVRj/Wxgc3wk2ngiwIfQAmDbW/TSTvTN6JOEKcqev42n+Xf8ruPBczgF8avZLBy0KTMm4YLUttsOdjO6j82f4HkEpqX1PTBdLzF4xXwrVHIlwy4Boc8GCnSmce0fMRR5lcA0cPc2p+CB0h/9LSd1BDr010Rq/jqcG+b6X6aGtJbLVBh4PT/RiO/E1EQyj7nHaG9CfDYo+V6w88K7Jci6wPtF7Nl6DiGQMK6g5pkWRvFbiDXqVcqx4NewJRD40LHOoH1P07pHv5ufiEwKty1PKA+RaobLnbgn1Tj24BoLIrshzUnV0jSFSJjFJP3FvTsQnivL6FT51jNNgoqXD92t+qUD5n+vtIr7Opga/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(39860400002)(346002)(366004)(2616005)(110136005)(36756003)(41300700001)(38100700002)(5660300002)(966005)(31686004)(7416002)(66476007)(7406005)(54906003)(186003)(316002)(2906002)(38070700005)(53546011)(71200400001)(6512007)(83380400001)(31696002)(76116006)(26005)(8676002)(86362001)(91956017)(6506007)(4326008)(8936002)(6486002)(66556008)(478600001)(64756008)(66446008)(66946007)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzRIWEQvRWlnYi9jRGhqRE1rMTBGNDY5eDBJMXc4K0Z2QXZaTTM4Qkx2SUgx?=
 =?utf-8?B?bElMaHRyZ2trRzJUb1hxOGpYdzZiK1FFMFB6b0ZubjQ3VjVQRnUyS1B4cGpa?=
 =?utf-8?B?b1MwODFuK01hc1k2ZllVUjJOVDVub0hjeXVTMUUxcHhicG9DajlVZDBCbjFT?=
 =?utf-8?B?SURtQ29wRitHQ3JFV0pFaUVwNkRxVERpL0M3RUJHNERoSUluejBBcnl2UGxF?=
 =?utf-8?B?OFd1MHNGek0zRkxVQXMxQ2NGKzAraXlEb28yMFNUaXIwTHNCbDNORzVQTE01?=
 =?utf-8?B?Nm95S0NZMHRYNWZqUE1rVE9nZXBLU2R6c1FOeGhRdXlQSVdHcEVQN3NMWWV2?=
 =?utf-8?B?V1AzaFBOaHAwZEJCOGxHSThsbGVxdVNjQjV6bkYrYzlQU3h2RzYxSTFLZC94?=
 =?utf-8?B?YmhkOEYycHYyeEdsMmNpRFZCakx0dHRmUTVKTGpQZVgzL2JqTERhNXJaMzBy?=
 =?utf-8?B?TTgzZEpjS2JFUWJTODVERHVqMjNtN2Vwci9pdVFJZ29BYkVrSDNNalR6SXBs?=
 =?utf-8?B?alMvTTFLMjQvM1kzMWduL0pvVjRDREo2YnVDYjZqTDc0ZUhOa1Q1NVMybktu?=
 =?utf-8?B?b0EwbzFvLzNaZ0puM3VqMDY0Y2FWTWJ0ZUxheW1WOFBmZFNFR2V1QlBsYStZ?=
 =?utf-8?B?amdvNTVvRzlVMGMvWDFvTlRLZ0Z1cEdQbE10dTk2czBNSzZpUUhwWk1YZjhV?=
 =?utf-8?B?QzErNmdVdDliUUt5YWJCUUFGeWdOOUsxRlJyTmdKRWM4N00rdm1aaVF1Zy8z?=
 =?utf-8?B?cjREOUIrZEcwT1NLTEI2R1I5S1lVNlIvKzAvSFloSEFtdnNLWFVSQXZnU3Bk?=
 =?utf-8?B?cXRQalRQUm1yMG1DM25zL09hN3p0bVBzbmsvWUxWN0xHUkNrT1NQNkZFczgr?=
 =?utf-8?B?WFFBTFpTU3NEMEI2djAvMnFyWTRvTnIrT3RnOGZmNHpOK3AxMHN3WmxZQVRC?=
 =?utf-8?B?TWFNZUNLNlRMQmhub1daNTRXMnZJTW9jdE15d0dGMFBibUdsK3ZiUS84SWU1?=
 =?utf-8?B?RTlETXJYZFY5Q0FVT2x4c1llR0FudVpGZ2JVVkVDTVFrN1Azc09leXUvWkQz?=
 =?utf-8?B?bzJWSlRSRjRTb0Z4M1lkZ3pSRGR4RmNLV0Q3c252OXVRbG80dlRYZUJDbXNa?=
 =?utf-8?B?dnBqU1licHlEMGgxeXN4QSsxcHVzNDJuVTRqVGNDZTdhOTlIRUxkQUUxQzlH?=
 =?utf-8?B?NVdsTkxxaWpEeG5kRStFV2JlZklnbFZ1c2x6ZENvVTdTT242SFdPQ1MyMGNu?=
 =?utf-8?B?VnorZDZZVGc5b2MvbUxoenFiNmdIL29zSElJaURYTjdLem94VHlOYWFGeG9y?=
 =?utf-8?B?UFBRK0xQYnZJVC8xdzBXOVo0MXQvcXVsSUhhODNjK0VyNzNwb0Nxam5FaG5D?=
 =?utf-8?B?a05Sa0tsa0JmdkEyeExieU5hTGZpNDV4dVY3OSthYW5ncnJOZTcwVHl5SVk2?=
 =?utf-8?B?SUcrNlF4dnIzQXpZeWZDc1pEYlo5NkhYWENQZHFOOGZvTkxLekhzeS9tcGI1?=
 =?utf-8?B?dlRBVU1EM1A0ZUh6YkdBT2VIT3VsczBSNHU1QlBibHBpU00xcWNIeWpQVFRx?=
 =?utf-8?B?dno4NFpxMXA1VkdtMDUvSFNGSW9qeFZKcllhWlhiYzlGTE5TYnVaK2hzRG1F?=
 =?utf-8?B?SzZ3TElxeUZvZWdOTlFnZ1JyUVFSYzlmM1ZwWndoQkVJM1RNUzVXeWtyMVRK?=
 =?utf-8?B?ZVFCUmtjazNnZmNtSzQ1WjNuclhlQ3dsaElTclgyYmZtekY2UFVBZUVoNGM0?=
 =?utf-8?B?N3BZb0NLZlpMVDh5aTl3cVlCRitoNkFUQW53RTIxUXpKUSs1aDhGMmhveXc4?=
 =?utf-8?B?enZlWnM1c2UvNW9OcUkrSXVveVFmbWNKakI5VWtMakNkWCsvS3BhUUlLUnZz?=
 =?utf-8?B?Uy9HUERkaFM4M3VUSGxXYUpXNllYeElvUndmbWR1NlRUdGxIMWhvN05rbVpW?=
 =?utf-8?B?ZFp1c3VaSmM1eWdYNEhaLzBQRUg4ZDZaUFhUUGVjRlFmb09pUm9HS09wRi9U?=
 =?utf-8?B?cnFnQ0R2eFJoMG5jVXJIaEUrdHpQK2FreEZIUlFPb2Q1K3lZcmpnL2p0RFVo?=
 =?utf-8?B?Z0V2MTNTQVhXWE1CVVVKZFMvVldOZUovU1VLUzNicWtRcjcrUkRVVU1qQmZx?=
 =?utf-8?Q?CK0un4016SF8tzO+YYhbFg0ad?=
Content-ID: <CDF377D72449B04BBD60C243D66D4C89@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feab9995-0017-48b0-0cbc-08da580b8375
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 07:06:09.9405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +axRISy0WtIM8hntN5rtT/WFEjP0sxbVm0rcfNPlbP4MnKGuZrJuFS+O8XR8Ayl8tef+LClmXfjNmrTmgEQ3aJ8bvBkpL0d5rghaONXzj/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_000628_058132_64C6BDC6 
X-CRM114-Status: GOOD (  18.84  )
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



On 27/06/2022 07:55, Krzysztof Kozlowski wrote:
> On 21/06/2022 11:49, Conor.Dooley@microchip.com wrote:
>> On 20/06/2022 01:25, Damien Le Moal wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
>>>> On 20/06/2022 00:38, Damien Le Moal wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 6/18/22 21:30, Conor Dooley wrote:
>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>
>>>>>> The k210 memory node has a compatible string that does not match with
>>>>>> any driver or dt-binding & has several non standard properties.
>>>>>> Replace the reg names with a comment and delete the rest.
>>>>>>
>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>> ---
>>>>>> ---
>>>>>>    arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>>>>    1 file changed, 6 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>>> index 44d338514761..287ea6eebe47 100644
>>>>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>>>>
>>>>>>         sram: memory@80000000 {
>>>>>>                 device_type = "memory";
>>>>>> -             compatible = "canaan,k210-sram";
>>>>>>                 reg = <0x80000000 0x400000>,
>>>>>>                       <0x80400000 0x200000>,
>>>>>>                       <0x80600000 0x200000>;
>>>>>> -             reg-names = "sram0", "sram1", "aisram";
>>>>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>>>>> -                      <&sysclk K210_CLK_SRAM1>,
>>>>>> -                      <&sysclk K210_CLK_AI>;
>>>>>> -             clock-names = "sram0", "sram1", "aisram";
>>>>>>         };
>>>>>
>>>>> These are used by u-boot to setup the memory clocks and initialize the
>>>>> aisram. Sure the kernel actually does not use this, but to be in sync with
>>>>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>>>>> kernel work fine with both u-boot internal DT and the kernel DT.
>>>>
>>>> Right, but unfortunately that desire alone doesn't do anything about
>>>> the dtbs_check complaints.
>>>>
>>>> I guess the alternative approach of actually documenting the compatible
>>>> would be more palatable?
>>>
>>> Yes, I think so. That would allow keeping the fields without the DTB build
>>> warnings.
>>
>> Hmm looks like that approach contradicts the dt-schema;
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/memory.yaml
>>
>> @Rob,Krzysztof what is one meant to do here?
> 
> Why do you think it contradict bindings? Bindings for memory allow

Because when I tried to write the binding, the memory node complained
about the clock properties etc and referenced the dt-schema (which
for memory@foo nodes has additionalProperties: false.

> additional properties, so you just need to create binding for this one.
> And make it a correct binding, IOW, be sure that these clocks are real etc.
> 
> Although usually we had separate bindings (and device drivers) for
> memory controllers, instead of including them in the "memory" node.

I guess changing to that format would probably require some changes on
the U-Boot side of things. Taking "calxeda,hb-ddr-ctrl" as an example,
looks like the clocks etc go in a controller node, which seems like a
"better" way of doing it - but would break existing dts in U-Boot
without changes to handle both methods there.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
