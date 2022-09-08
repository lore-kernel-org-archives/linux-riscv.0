Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F09AC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gb3X1Z7gWfTIwDiOlCX/T/Fb0z1IL9wesrStCZ1vnx0=; b=d8Ky5NNfKxqoOu
	vCtPMaCocoh819sWc1ZlXGFiFn3MCcq77e8ssOPS5nl8sTt6v/GI2heHGwBtX9nCjS48hgt9xD8N4
	xcH7CgFbPRtyWjxYFhx2Y3wfrIFDiC+O2Oa1XAoT8UrhBikAGjEvmMBhIMGjwMK0QDI0v9S90Ge5S
	OF3jnhInm49Zyy6arKHc/XsHqxGgJ321cFUrwXXGBBPHRLL0Z4q6Z3GV8euj330Jpo+nQEs3Y3cIa
	69oFe3zTkyVcbccXpmsLMDE4ClBzY6Q+YLq/+W2DVk7jPUvZC90/S3pimlEB0Z4yZK9NllMxTjq8e
	UogRtGZqyIfRaQcpZXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBHr-00HWgx-4M; Thu, 08 Sep 2022 06:45:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBHn-00HWg3-Ul
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619516; x=1694155516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k5nHV4wJVTMfvmZZ4toaFB5yMeg7uTyD5TSJ2Eh4WWY=;
  b=djU+QCYSp/w4dpF2uvfEv4NIdAV8ElTalXwwVGW0AOSmp3ynQzULTiVI
   RGZyFvmATB/tJcU9EDRheJR35pOur5AyIKG/Kqh7XCjJsiqyf0Gj2W/Xs
   W/3knXkJeRFb5zKfkEZhFQAikRnUten7qNFExzKKlcIBgsGNGYMNbKngY
   XlCXo6qpAJ6c/IjndKAX0RN9CWEsQ6XzF1pav6A9uFLopcC1ivKg9I66O
   AzG79jq4v/Z+x0SUCl9n477ap+lPgQwNf1zp2JyUnCWxX2oBauG1+Y7tL
   e/545XqPkIAJvgfOsdIlrNp01NPyaO0nDJhk0SYT8MU1+K/KCvCyJw5TZ
   w==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="179519055"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:45:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:45:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 23:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaZ1R5egh7ieei5PYXPL95KCEl2VZ71r6SJqiaVvlaWv5nlIs31HVrFwzxaVlQb6kVXGAL/cUwcs6PFRVr78khEWenDuIp+semGhXn3Zc9rENNYuIp2ixR8VVrsxgQG1UYSYd23Ce+k5PXuqMtX+DvjitORl2/1nMhAgWCJjHxtpcenXVlOaPmMvRxmRD0A0I9ndYOCcqzfjW/JgOF+yNVDe21Y7pCiJsV/6/8uyfnRRbw/sDqn6iWzj9d09BRAewVrfXUKWX9XJkDjEPX8Eoqy9GB0FofN0DKO5JE1R8b0djr5BfRmEjPSdEdKa/lqCQfVDM4wjbjHxsHuKrRXG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5nHV4wJVTMfvmZZ4toaFB5yMeg7uTyD5TSJ2Eh4WWY=;
 b=AlXs5jZOB2Jk7WK3EurekH/TqcP72GRGZ125J3gtcjrveV81x7xnvxmhtjxPo0Ys2XYF7B/bixwsS3xHoS8+bxl8y6DpF87E+A+CXgEy2/oYH7pFUmsPP908E8Z19CICZqXzi4DMhRdLpvlg6mlVZKoR0JNRa7jqATsMbJa7roxjK8jnlqTIPUOLvqxgnv7hab4buPbAEU4NXnUhxcpu8hxiyzbu70KN4l9cUwWMeDPR7oL6yNCfvZpSaEfLlioJ4p8hCSKVhSv1zrCm5lm7tbkBq9q54OrIblb0Ontv7yWGIRwbKI0oKbDu+XlyjLtPQiN8O4KDtSWDbKKRj8hSVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5nHV4wJVTMfvmZZ4toaFB5yMeg7uTyD5TSJ2Eh4WWY=;
 b=RYkdqvKEZYOjGPpk5vdVBrSikZ5N76R22cClvFlN7/gpZxRucy3Mj2cjeHWTE5Ji90XaY4Qc7divQDMOvzjs31XryhH+ZCheiR7DGNkbl3oq9Igt7NhoG2lQOVBY9n8zlG3lvGBubLT85xOcGjCC0L9rGsBIJkFvuYRXmskuoVg=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:44:58 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:44:56 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 04/13] reset: add polarfire soc reset support
Thread-Topic: [PATCH v4 04/13] reset: add polarfire soc reset support
Thread-Index: AQHYw06Bq0bWR/4jpUiKQh8SMHzPyw==
Date: Thu, 8 Sep 2022 06:44:56 +0000
Message-ID: <2005988c-56ac-fb9d-ef58-1b67e0c0fafe@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-4-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-4-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 112b4c9e-8dce-445e-9f24-08da9165a49f
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +pGJnE1X5vfVU7X63IfDNn1fO9Mz6myoEkn0Gx53JDDN0VFrqXhLPfX6EFepJBhYDivfrajp+sgIZx1AM3oK6UqgWc1IvMRZIWtnhdgcjqsd5Ibu+qoS4MZZb7ol9FRyhEoWa0qZ2/imZ/PGcSoWmpZ2Er9Tv1IbOwA+5w+utKBhGaYxLeZvOAjzmJO7Bab4AC2i/q6pzVB9eUOjsQsJ2cuVI3zte3jn8lh6sacT1ThADgsADtQaNeAGQ81LhQW47jDLG/x7/g/S+BlFQOP8z5BNB4kYPmE2vMiFkFZXbr2HBywIGCEYCmKNP+j0Ar+BDUFpjDqnQT5BTXSHxSVT4baf0AUAyXduseME7HtUMIKoixTptINamxEjrqxC3Cz2cTCZasSD+VDkEfAMUnp3Hd6iW3pqFaqb/2CYnnAUJKm/1ivBhKhgqTQz4hzg6W/BSKfZiHLiCx5TYYTg4oRsW3BInpg2Y+AbOxXil05etmxLzxz2/p4ICLEAwcCnHQKYCdMvMdrwRyx5dHpPaUTslzsVmx3x9E63rEhmrzqNk4kIlB12/LgPk6121M8SK2laXlVWaFLnxzIqaw5emOp4dNSShzTg0bwcylfa9KDbZDrkRT8XI1Du/10YlgbyyEh3VxMDHfDJUSWuE76gQLlmt7PfEt0XgBsxzBIXLOPlFxpLHAkD1Su/Bvtl0iXpApDcFprac5lz2txbCKAQaQOg2y2vyNj80ftcK4NJm+jSG1b+R1+dUFvJCcTXxPr6ITLBCkZDLdMRA4de0vaFnPjqD4wA5eZcvpfiS6vM7oF9LqLlxrjQ9wg1k5O8FuO56XvRZ9mBufNqN2gN3TTkWrhdxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVRlNndIMUczNVNRSm1FT2dnbWJqZ2NnTlEwRmNZak5IMFVNd1QyOTd5UHA4?=
 =?utf-8?B?Tmo0eHY4L3NQWDNkSDNIMUx5bmZabHRLVHVtaGk5aDY0MTVwdndtK3pIajZp?=
 =?utf-8?B?akVnaXp4cXlZRjhIVTNpTTV0T3dpc3F2TlAxY1hJbjdVRXM2eDl4bHoveXU4?=
 =?utf-8?B?SlhHaVBUOWZKQ2d6OEFjekVhb25CSEs0NmZIakJoM2xVUEdSb09PUndPanhm?=
 =?utf-8?B?QTZEU1J6U01MUVFDd3BHKzJna0NwOStBZXBYVUx2eXJ5Z1lGU1ZnejVuYmlJ?=
 =?utf-8?B?SzBhZDB2Ni9SeEkvbUFHbDNZM3FmQjhDcVIyUmtJNGs2c0NZRmZURW1TRFpY?=
 =?utf-8?B?YWZJcGlBWGtpamVjdVp2OE9teEZqem9hK2tPeWY5RXZRU1YvUzQzMVUya2V2?=
 =?utf-8?B?QVp4TVVydm55cVdUMmRzdjVIbnQ0VW9aUU1mc1hBSGl3RTc1aUxQMUk4MFhp?=
 =?utf-8?B?Z25vcEVsNnBCMmwvMEl4MnpCKzViTmFBUEl4YWN1ZElhQW5EM2pXcnVlSmM0?=
 =?utf-8?B?bCtjay9sOEpiMC9OblV3cnp6TW9EQnJvYWFhMzUxb3l4RC9vYlZqS04xS1ND?=
 =?utf-8?B?WFZ1SDk0V2JsVEF1a0d6Wm5kZ2F6QTR3WmY3OUszMkpjRlR3VmxESVhJRjNs?=
 =?utf-8?B?VGRNNWVmNlI4a1hRSVZPQkZyNTVzZkhFN1l2bnZpWDltYjVrbG5DYUJWS3R2?=
 =?utf-8?B?anNVQWp6U0R1TVdrT2ErYld2S3lObmRMZ0dwNktOZk5mRG1JTmJRQXBEQ0Iz?=
 =?utf-8?B?Vk5mK1NCdm51bEcwZFE1T1pxRjFFSUszSk12dlNqWVJCTDd1Wm91OXoyUnp0?=
 =?utf-8?B?VEh6cXhLaWpzaFVWVTN0YzJWZExjQ1orNVR0NjYvNU9vTTlGZGxOZ21ZVGlo?=
 =?utf-8?B?eGRHZ2RtS1NtMWROSE14WUZyV0gzcWdhR2hGbDdkTDUyWVdDVGFPNGZCSVNK?=
 =?utf-8?B?cFpLV1hzYVdoL2k3U01qSWZINTdaVnZGMVl5RitVRHBVanVBcUpzdHhCbzZI?=
 =?utf-8?B?WVlJNTJqK2hhUGwwU2tISzlRTDZIMUtHRytmd2EzU2hDOUw3cDVhY0d6MS9B?=
 =?utf-8?B?emZYRDg1Z0NVeTdGL1Y2S3cxTjJHMVVkdnQxUVY3M2k4cGFTbStBd1hWZzhC?=
 =?utf-8?B?T1p0QjhiaUFDakRkNjhwcmpyWWV1RlZ0OHpUbmpHaXh3RGFoL1ZWOEFXbnBM?=
 =?utf-8?B?dk1GVGNYUVBmYnhKVCtXMlYzZzNNTVpITjJuRDBoR3ZuVnoxc1pGNWxnN250?=
 =?utf-8?B?Y3BXNHFMUVdjOENNM2QvM1doOWIyQXIva09wUUttMnByTkhvZ1oxTXk4clVa?=
 =?utf-8?B?SWZTbVY0eWZzc0NYYnRyQWV3S0xPR0ZvbXA3b0FHNEE3TlBPTWdSOUZnUVVt?=
 =?utf-8?B?SHN1a2hXa2V6WHRtYlAxK0F2S1Q3L2VFTExkOVJuUnJUWmxubmVaMVBzd1BK?=
 =?utf-8?B?SnpuOFhQZEd6RWNrU1lIUldpVW5qWmVXYi9pYUVrU0xVWDlOMUFwNG1wU0s3?=
 =?utf-8?B?aWdMSTMwaGdORUlRVmFEMEpONTZ1bnIxNnNXbmlxYjRzRVZEWGJwSlJZZjA2?=
 =?utf-8?B?QnJTWGpPc1NQOE9CZytlYjR5NC8rLzN5ckxFblJteUkxOHhtUjNlZzg1RHl6?=
 =?utf-8?B?LzJPZ2x4eGE5enh0US9sVzZ1U2Fmc3hmRVFoTW94ZlVsRDJzV1NlQS9GZWwy?=
 =?utf-8?B?OEhXVGJSUW5QRi94dXg3UjJkQVFtdWtHWjE1Tm5BVUJTS1VadjltWFduU3hm?=
 =?utf-8?B?bmkwYUxrYlhLTFV6ajYyVUl2c2ZFdi9GRUJrbWJuSVAvazVzUC9saG15REdW?=
 =?utf-8?B?dkZmcXB0NW9DYXdTSjh0anBycTVWUHZzbkN6VmNIWFg2ekZ1dmdMRWhYclNx?=
 =?utf-8?B?dDF6a0JsVldIRTZDbXNqZ1kwRWtXWnlWY0lkb05JMGZSaUdxY1BTalZ5dlFm?=
 =?utf-8?B?SloyRldQMnBRUEl2SjczZ3hzZzJLd1laUVcvYjM1dUFpWm1MNTUxbzdIMkNH?=
 =?utf-8?B?Z2IzU3NMQTNTeURXKzJjd3pYeUZyTkJSTjFsUEliMm5NR2hzeFY4Rkx2eUxn?=
 =?utf-8?B?ZERGanZpMXo0ZGlPQ2JpWDE1bk9DUUFhUzRSUWE1WGF6QnUvQXFGZ2xycVNj?=
 =?utf-8?B?cXdqOFdTVXJKNHQrTUtiUStPR2VqL0I2TUJyTTJFeVNWV1REazhJZ242QjVQ?=
 =?utf-8?B?L3c9PQ==?=
Content-ID: <E896461B0744694E8D21D2C664FC8EA9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112b4c9e-8dce-445e-9f24-08da9165a49f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:44:56.5526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXHZ6qAmndM5B1woVea/RrKyRcGPsXy+zxZk7IWu986MvBAyQs5xh0GGh011YL8VRst8M6wtTaNcMQMN4vnoTCj/8NH5zeL6KAYeake/wss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234516_027700_A45702F3 
X-CRM114-Status: GOOD (  25.99  )
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
> Add support for the resets on Microchip's PolarFire SoC (MPFS).
> Reset control is a single register, wedged in between registers for
> clock control. To fit with existed DT etc, the reset controller is
> created using the aux device framework & set up in the clock driver.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/reset/Kconfig      |   7 ++
>  drivers/reset/Makefile     |   2 +-
>  drivers/reset/reset-mpfs.c | 157 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 165 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/reset/reset-mpfs.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 806773e88832..85f7abde3766 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -152,6 +152,13 @@ config RESET_PISTACHIO
>  	help
>  	  This enables the reset driver for ImgTec Pistachio SoCs.
>  
> +config RESET_POLARFIRE_SOC
> +	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
> +	depends on AUXILIARY_BUS && MCHP_CLK_MPFS
> +	default MCHP_CLK_MPFS
> +	help
> +	  This driver supports peripheral reset for the Microchip PolarFire SoC
> +
>  config RESET_QCOM_AOSS
>  	tristate "Qcom AOSS Reset Driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index cd5cf8e7c6a7..3e7e5fd633a8 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>  obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>  obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
>  obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
> +obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
>  obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
> @@ -40,4 +41,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
> -
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> new file mode 100644
> index 000000000000..1580d1b68d61
> --- /dev/null
> +++ b/drivers/reset/reset-mpfs.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * PolarFire SoC (MPFS) Peripheral Clock Reset Controller
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries.
> + *
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
> +#include <soc/microchip/mpfs.h>
> +
> +/*
> + * The ENVM reset is the lowest bit in the register & I am using the CLK_FOO
> + * defines in the dt to make things easier to configure - so this is accounting
> + * for the offset of 3 there.
> + */
> +#define MPFS_PERIPH_OFFSET	CLK_ENVM
> +#define MPFS_NUM_RESETS		30u
> +#define MPFS_SLEEP_MIN_US	100
> +#define MPFS_SLEEP_MAX_US	200
> +
> +/* block concurrent access to the soft reset register */
> +static DEFINE_SPINLOCK(mpfs_reset_lock);
> +
> +/*
> + * Peripheral clock resets
> + */
> +
> +static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +
> +	reg = mpfs_reset_read(rcdev->dev);
> +	reg |= BIT(id);
> +	mpfs_reset_write(rcdev->dev, reg);
> +
> +	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	unsigned long flags;
> +	u32 reg, val;

Using either reg or val in this function should be enough.

Other than this:

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>



> +
> +	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +
> +	reg = mpfs_reset_read(rcdev->dev);
> +	val = reg & ~BIT(id);
> +	mpfs_reset_write(rcdev->dev, val);
> +
> +	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	u32 reg = mpfs_reset_read(rcdev->dev);
> +
> +	/*
> +	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
> +	 * is never hit.
> +	 */
> +	return (reg & BIT(id));
> +}
> +
> +static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	mpfs_assert(rcdev, id);
> +
> +	usleep_range(MPFS_SLEEP_MIN_US, MPFS_SLEEP_MAX_US);
> +
> +	mpfs_deassert(rcdev, id);
> +
> +	return 0;
> +}
> +
> +static const struct reset_control_ops mpfs_reset_ops = {
> +	.reset = mpfs_reset,
> +	.assert = mpfs_assert,
> +	.deassert = mpfs_deassert,
> +	.status = mpfs_status,
> +};
> +
> +static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
> +			    const struct of_phandle_args *reset_spec)
> +{
> +	unsigned int index = reset_spec->args[0];
> +
> +	/*
> +	 * CLK_RESERVED does not map to a clock, but it does map to a reset,
> +	 * so it has to be accounted for here. It is the reset for the fabric,
> +	 * so if this reset gets called - do not reset it.
> +	 */
> +	if (index == CLK_RESERVED) {
> +		dev_err(rcdev->dev, "Resetting the fabric is not supported\n");
> +		return -EINVAL;
> +	}
> +
> +	if (index < MPFS_PERIPH_OFFSET || index >= (MPFS_PERIPH_OFFSET + rcdev->nr_resets)) {
> +		dev_err(rcdev->dev, "Invalid reset index %u\n", index);
> +		return -EINVAL;
> +	}
> +
> +	return index - MPFS_PERIPH_OFFSET;
> +}
> +
> +static int mpfs_reset_probe(struct auxiliary_device *adev,
> +			    const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct reset_controller_dev *rcdev;
> +
> +	rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
> +	if (!rcdev)
> +		return -ENOMEM;
> +
> +	rcdev->dev = dev;
> +	rcdev->dev->parent = dev->parent;
> +	rcdev->ops = &mpfs_reset_ops;
> +	rcdev->of_node = dev->parent->of_node;
> +	rcdev->of_reset_n_cells = 1;
> +	rcdev->of_xlate = mpfs_reset_xlate;
> +	rcdev->nr_resets = MPFS_NUM_RESETS;
> +
> +	return devm_reset_controller_register(dev, rcdev);
> +}
> +
> +static const struct auxiliary_device_id mpfs_reset_ids[] = {
> +	{
> +		.name = "clk_mpfs.reset-mpfs",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
> +
> +static struct auxiliary_driver mpfs_reset_driver = {
> +	.probe		= mpfs_reset_probe,
> +	.id_table	= mpfs_reset_ids,
> +};
> +
> +module_auxiliary_driver(mpfs_reset_driver);
> +
> +MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(MCHP_CLK_MPFS);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
