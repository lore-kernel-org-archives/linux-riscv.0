Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCEBC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZQtd7jYX8MagRlb+LXR7WG2ju4C92cj/XUR13Es434=; b=R/mzxv3id5vkm7
	fB+IaujvAM7BdU5a1JmtPhipjdv7M7F1TuIOq0n3hGlR4lLlHuay7ZXhqWm/O2nZAJ77Gl7BX8t4H
	jKtv1+XdbkNR5ltgg6vM3zHTt6mdPW+fAWWNH+VEVFDeKaUtKigJFa2kLOv4Hrxt+lLUp42SQpKvF
	SXAy/FxDilEEl4EQqs9FVgPICWC42TVepk213/gAnt+3SKKtUQa2GYvtV4OrrPzfFuaBdO1nk9S3t
	DGEMCt6gPNcJCQbvOqLcjXWNjl5rt/HQnqBlQ/Z61kFpPHrcz0f9cNfj4dZ3Kk1xGi5bLcsd/E9/E
	c3DAE0h5bupB+dMQzQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBLM-00HYHz-41; Thu, 08 Sep 2022 06:48:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBLJ-00HYGY-5H
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619733; x=1694155733;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6bkL2eq0fz5ivVvDc/2+nNeu3/W5d9jig+NCAVETu5Q=;
  b=ePZWkyRYZcwx0wfCG60OVW2fbt/xPPl02Vf9FoKyhwX0IKnKREl5K/6Y
   0yFK6YYhiRnaZuG2pBaihDXAL29q92RqHGgYwWU1+n+j3bNUnGq14CsxS
   u2KlESNHPlP5X3ofm5BkBjxaaL/fmZyaJmLGG8DyZj+FSFPp1Rat9a38O
   DesfNyLxOJd/PvxXnF8wcgFLOYhv4t7TBsXKrm51v2U0XpkZv9fmsmIP3
   DdqlQ5XV4uHnbYaBMgcVQM4W5uviMMzYcN7DKjdmHXrTHb9QdwznPK3hr
   VflqJUOFgjzJFlYxmx17U0WuFJqcdr1Z9vW46PTCHOOJ376Fr6ZfJeJfo
   g==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="179642403"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:48:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:48:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 23:48:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+ozLrT6OB8zqpQ+Jo3+3TeRxI/wajzCeuVmbIu+Q7WkniKZcaJhXVcUihsbyepzi3lL7gRc6pjh9u31oO9cHUzyCHrYpiG+0uADM4FOCVT/vqeJTmgu8JFNSDR8G2CrqSxjCKA0X6pCvrwtC5cWGS7ar8uWo3/PdDur7Wcma4JsTuq1LmLG9xR+DHiv8bB1IPVB02EhXaJ0q+ieCYE7bF0H8LviFeR4EQrurVoQVWva4skRe6SdsgsPx/pP171cn14ZA7WwXvjvALwztczJ6Pq4rhOxsvOyUk/wJIlbJnxjdan8NiYXiN91avGRi9mLlzJ9Rfwd335Ha/kXHBFlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bkL2eq0fz5ivVvDc/2+nNeu3/W5d9jig+NCAVETu5Q=;
 b=cAheA8vxMRgLFCephxWJfIs3a6Q1LKh2d997BFhIyFgTaP740cqmM/rRCsBuDn4z2T52JXSyAWtMhblRcPXG0XovuHKQ/Rcxd2LeNUS4lGbg1ELqyAz0m0/5Wo48eCIADOKZc30xh6R43Dkhh2cO4dGf/5UqNfNyq5us3t9JBhRUigsJzD2eZ3NkvosJVSl9Dv47jTjOaKm/9ppCy2wJjGQiVCngCaTH0CwdyGLIgzcbU/hz5Z2hW1o2zq6U4tLakTDu32+8DI3gK7PUuUQ+jYmY51JS41CFWyNf5S8SDGW/eSsOtGdFQz9QWS8Miq8daNum/SP4uZWHIBN30FGQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bkL2eq0fz5ivVvDc/2+nNeu3/W5d9jig+NCAVETu5Q=;
 b=maclx7QxglMchO5i+4YKGILqJmqTeTmU0GgiyHw1CIkhezRwqDaL4APBsYhpkgre5TsK6LWsHJDGIdoby5t9lf1yT4td+ZWCJYvZLY2phUnb5kDgeOZDf0RWt3RUilGiVOrUTvUZxg5SyT3DgWXHseWu/tZjv3FogarI8fguFzY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 06:48:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 06:48:50 +0000
From: <Conor.Dooley@microchip.com>
To: <Claudiu.Beznea@microchip.com>, <mturquette@baylibre.com>,
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
Thread-Index: AQHYvG98o22tTG+7mU6lxnNYP43gca3VJAaAgAABIAA=
Date: Thu, 8 Sep 2022 06:48:50 +0000
Message-ID: <9ffd5028-6639-9c3c-e09b-c9b7602a2ec1@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-1-conor.dooley@microchip.com>
 <119b58b7-7757-7f76-1472-8047961c9dd1@microchip.com>
In-Reply-To: <119b58b7-7757-7f76-1472-8047961c9dd1@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SJ0PR11MB4879:EE_
x-ms-office365-filtering-correlation-id: b19060d0-5037-4f11-d132-08da9166300e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pP2BlyIBHDLYyHHJjT9U693oEfmQJEyWnybx5jZRpUQ63kkeMN30pRuidU4H40AHU3PS7EWEzFIZrUOIhQhkVPCSKa13ShmFEdfrSKmmPhCDFK++2d9P9eGcMPIqrqF8BGhUvog2TEvtLSrkbjvUWSy2Et6Sagv6Lyk3sE86vP7QOyOhgheZrhjwlTnaE+kVy2UEghtVDOjUHTBQn3SjSzbx+PmAdGWlR9vB7aHtWO/Xm0wM49NKfepMvauX/XSzmyJ8Xtm44TeFnKTe9CcVZ1h3z9bcI1jFY/DGYj8hxuhEbSHIPJWZle9GEiTFy3XED3nLIrMDeZ5wFVYTmdCe0Bl1mjwb64R/vGf5U/ORev3ZRxK0dJjULY7Zp8D55NrtukiPgvOry7UCVea0+lEhtMH954YJp8acWELFrBm/2NDckloSEI1vwlGek0cElhE9X/RJPCXRNSfd/kY/X4NzfXzqWVsrF6/6XGig13MzWQ4LqjJZflVGHJirLqdN71ewaNSisbTUokh4p4tHSShXU3IBb2Z9kUCjXK46la4Ok1HNSBz8W8oiwH3uOE7k1bPalTsb27r4F1gnEENUO08O1VYE8YeRmCju4mXXth865h91Rh/XeaN4cSiU0mzPxJKIRi9KDCfAhHgJqWH6tZq5BYNsubY29Voz1gHCaM/zNfeZMOp/vaRX8KWBBkUFznuRqBSf62QC3OD0wXi0/0z/aE0T8kRfwni2Y/AWC5a4ZMQbuJoJ+yEKS/u3aRk9Q4JpHIeMtTeAs9fuPUql/eAlpjng4Bzjjyac0HDlHHP5sILTkFlzTCaEgrHgVuwTLv14IUdVnxRBcFd2RaneuuG0zQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(396003)(136003)(39860400002)(376002)(31696002)(26005)(5660300002)(8936002)(53546011)(86362001)(110136005)(6512007)(6486002)(7416002)(2906002)(6506007)(71200400001)(2616005)(41300700001)(186003)(478600001)(31686004)(36756003)(38070700005)(45080400002)(8676002)(6636002)(316002)(66946007)(66446008)(76116006)(83380400001)(38100700002)(4326008)(66476007)(54906003)(64756008)(66556008)(91956017)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3NxcEZueEpWblQ3YjJrbWUxejN5RkJFVkptbDVNcjlTdkJscXVhR1ZRSE1u?=
 =?utf-8?B?L0NXaTk0aU9oU0VQZGlkaC8vMStKV0llVUYyeGo2dkh5N0RKKzVTYlF0eHdj?=
 =?utf-8?B?YURldWR4N2IrSjZUN2hra1JMaWg4Um9aRVlMR2lKUExCVnBKN2U1clNsM0lY?=
 =?utf-8?B?NVcrZ1AxQk9QTWl2bXZPYldmbFNudHlMaTd1TURWbWswcUlYWDJMWUU3c0FS?=
 =?utf-8?B?RFUyYzlFbzE2UjQ5YUY3dlVVQnhGdUNPcVhkZ2F2cm4rcmR5K29hdTBqOEhj?=
 =?utf-8?B?cWNuRUZKKytzR1NnVnJpYjlHNVhYWk9Rb2ViSUsvMnJYRC9iaEVYT1JTQ3Vy?=
 =?utf-8?B?MUEzbno0eE92WkhxOUlmVVRuVlI3Q3RoWWhMM0R5YkZpZVI3MzRpeGZOU2FM?=
 =?utf-8?B?Ry9nU29VN0dXNm90bWFWYjMzV0UvdEhySkNtNkpVQUpxTUgzRXQxVkFaZW16?=
 =?utf-8?B?Yml6UU1CN3hKRC9MQlpyOU5WL01MSDJoNkJRaVoxeTFGbllMQVIrWnc2dCtl?=
 =?utf-8?B?czdMUXQ4U3g4TlhHOHorbXV5UnB2d2tMZFZ3VFRrZXNndGtXcGhNWXNNcUJk?=
 =?utf-8?B?Y3Z0WktYbG5IbkFoejFPMkc4YWhnWXBLWTdkbi9zb2lLMlcydXpNMDYxYUdj?=
 =?utf-8?B?K2tpbUlpMUV4bWlBamlDUU9CQzdpc21wODl1V0JMdStEcklOeDhvQTZSdkxv?=
 =?utf-8?B?VGtPNXZPRm05K254bHU1SFhickRrVHdVeHBtczZTRnFjRUUzUzBxUEpYWGRn?=
 =?utf-8?B?c1R4TmVuNTNPcG5FUTkveFNJM01Bd2plUjRzblNkS0hpZGxJMzJNbDN1Slli?=
 =?utf-8?B?YWJMUFdWT0JwRG1KcDRia2ZvMmJ2bU1ONDM4QktVbUl6Tm93eE8rMGFNbXhV?=
 =?utf-8?B?R2hkbFdMempOeTJNWTNFcEhCdWo3dU1lWHUyWThTUXJqbmxJa1JJS0wwTWpS?=
 =?utf-8?B?bElNOTZFcmJmZnpKVTd3Zm5ndnFCaS82Q2ZsSEFad1BnQVp0UFVudlN3RGRF?=
 =?utf-8?B?RitReldISk1UeGE0VE84QWJTNlJIZzMrN0VSY1hGdmlsOEdia2JRY0FRY3Vy?=
 =?utf-8?B?L0NqN0pWR1Jnc09ScjZma1pLcUVUcmtTcmsxQldrdFkvZWRQSk4yREorU01Z?=
 =?utf-8?B?UnZqdVlwVGlFeGVmM3U1cFlxM2hQNmkwY2NDWEhCL01XcFZleFpMeXlwQzQy?=
 =?utf-8?B?bi9MblM3QkpUMThUSEZhWjFtbzdIZktZSE9TUkRucGVBZklrZUluYUFFWTdJ?=
 =?utf-8?B?Q2NTekJmT0YwR3hHNWkvbzhFTEVJejRNaDBwY1E1NHE1Uzh3RmZSRXhTNmQ0?=
 =?utf-8?B?RXNWYWx3WU9zeGk4QW5xbXhoWkZBTlZPUmFEdVhZMkRNV1FBMlpscmhMZE8v?=
 =?utf-8?B?RGlnNGQvM0ZUTFZVa3hJV1BDNHFoWWtieDNoSkZsQzRkQ3pxYm9NZkhtdzB5?=
 =?utf-8?B?cWV6UVM0clM3T1NjNDhvanJhbmlMN1VnbXpoeEhUNFdrUEp1b0JZYUNTd3Vy?=
 =?utf-8?B?SlNDR0dYaGEvd2h4ek9YWlJNbzZNdHdHM3JiUzMwWXk4YWZSQkovTzFHK2Jj?=
 =?utf-8?B?UHhMdDh5aTVESDJtM3QyTGdCT3Fuc0tTT1VPSFZsRmowcEVqNHJrUzI1N2g2?=
 =?utf-8?B?ckQ3YjlOY1Y3Sndsd1BBclJmSG9xb1pIVGY0R0luU1d0K0kyR3MyRzJXcUdB?=
 =?utf-8?B?YmtONTV4MllSNkRLcmIvaVJzMXpZTm1WQ25wZ21OekdUYVNMb0FTSE5zNVRF?=
 =?utf-8?B?NWIwNHQycUNvQThzbFZvRW44SlhXVnNiWHQ4T2JoajFvL3gxR0dQUWhzSjZZ?=
 =?utf-8?B?amVuWkdJMkhNbVNNQlZhdGlzajlxYnNxSHNBcHp3b05mSTNjblpEWlZ2Njhq?=
 =?utf-8?B?c0F6Yk0wVEhvRXNOeEFsbGVHdHN1WE9WMGhOT21nUXlKT0FrdFNyQ1htclBW?=
 =?utf-8?B?bHlDOXowbE9nYUlYNGlGdmpBWW9ldjczT1Vac1R6M2dkUmpWNm1sc2JZREVl?=
 =?utf-8?B?bEY2eC9TdXVUNjZzaXFVekhlYXV5RHpDdnJsUW9jbTBHa2dYQmtESWtjZVRT?=
 =?utf-8?B?eEs1V2NPb3d3dklDL0w5Vm5mOHdvQU9lTnBwM0VXblBCYjR5d01ORUs0alBJ?=
 =?utf-8?Q?XJv1iTW5zHU+/9b9Ch6hzaePf?=
Content-ID: <82956AFA45923A4EA38CCA81141061F5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19060d0-5037-4f11-d132-08da9166300e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:48:50.4690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: noXgTQATizCxJQfArCvAkTpS5WqgFgfdc5hG55vXn2Rv9pQuaU/qF1bWZATTSib5AcDUp5QZb1Z/La5NApfwvxmFBE5WJYept2XQgppPIK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234853_234703_77FD8A91 
X-CRM114-Status: GOOD (  19.38  )
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

On 08/09/2022 07:44, Claudiu Beznea - M18063 wrote:
> On 30.08.2022 15:52, Conor Dooley wrote:
>> Unnoticed in current code, there is an array bounds violation present
>> during clock registration. This seems to fail gracefully in v6.0-rc1,
>> and life carrys on. While converting the driver to use standard clock
>> structs/ops, kernel panics were seen during boot when built with clang:
>>
>> [    0.581754] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b1
>> [    0.591520] Oops [#1]
>> [    0.594045] Modules linked in:
>> [    0.597435] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-00011-g8e1459cf4eca #1
>> [    0.606188] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>> [    0.613012] epc : __clk_register+0x4a6/0x85c
>> [    0.617759]  ra : __clk_register+0x49e/0x85c
>> [    0.622489] epc : ffffffff803faf7c ra : ffffffff803faf74 sp : ffffffc80400b720
>> [    0.630466]  gp : ffffffff810e93f8 tp : ffffffe77fe60000 t0 : ffffffe77ffb3800
>> [    0.638443]  t1 : 000000000000000a t2 : ffffffffffffffff s0 : ffffffc80400b7c0
>> [    0.646420]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000000
>> [    0.654396]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
>> [    0.662373]  a5 : ffffffff803a5810 a6 : 0000000200000022 a7 : 0000000000000006
>> [    0.670350]  s2 : ffffffff81099d48 s3 : ffffffff80d6e28e s4 : 0000000000000028
>> [    0.678327]  s5 : ffffffff810ed3c8 s6 : ffffffff810ed3d0 s7 : ffffffe77ffbc100
>> [    0.686304]  s8 : ffffffe77ffb1540 s9 : ffffffe77ffb1540 s10: 0000000000000008
>> [    0.694281]  s11: 0000000000000000 t3 : 00000000000000c6 t4 : 0000000000000007
>> [    0.702258]  t5 : ffffffff810c78c0 t6 : ffffffe77ff88cd0
>> [    0.708125] status: 0000000200000120 badaddr: 00000000000000b1 cause: 000000000000000d
>> [    0.716869] [<ffffffff803fb892>] devm_clk_hw_register+0x62/0xaa
>> [    0.723420] [<ffffffff80403412>] mpfs_clk_probe+0x1e0/0x244
>>
>> It fails on "clk_periph_timer" - which uses a different parent, that it
>> tries to find using the macro:
>> \#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
>>
>> If parent is RTCREF, so the macro becomes: &mpfs_cfg_clks[33].cfg.hw
>> which is well beyond the end of the array. Amazingly, builds with GCC
>> 11.1 see no problem here, booting correctly and hooking the parent up
>> etc. Builds with clang-15 do not, with the above panic.
>>
>> Drop the macro for the RTCREF and use the array directly to avoid the
>> panic, using a newly added define that brings the index into the valid
>> range.
>>
>> Fixes: 1c6a7ea32b8c ("clk: microchip: mpfs: add RTCREF clock control")
>> CC: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/clk/microchip/clk-mpfs.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
>> index 070c3b896559..9e41f07b3fa6 100644
>> --- a/drivers/clk/microchip/clk-mpfs.c
>> +++ b/drivers/clk/microchip/clk-mpfs.c
>> @@ -27,6 +27,8 @@
>>   #define MSSPLL_POSTDIV_WIDTH	0x07u
>>   #define MSSPLL_FIXED_DIV	4u
>>   
>> +#define RTCREF_OFFSET		(CLK_RTCREF - CLK_ENVM)
>> +
>>   struct mpfs_clock_data {
>>   	void __iomem *base;
>>   	void __iomem *msspll_base;
>> @@ -381,7 +383,8 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
>>   	CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
>>   	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
>>   	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
>> -	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(RTCREF), 4, 0),
>> +	CLK_PERIPH(CLK_TIMER, "clk_periph_timer",
>> +		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].hw, 4, 0),
> 
> A personal taste: as clk IDs and clk indexes in mpfs_cfg_clks[] array are
> different thing (ID for clk_periph_timer is already different) and the
> CLK_RTCREF - RTCREF_OFFSET here is in the end CLK_ENVM = 3 maybe easier to
> follow the code would be to add new macros like:
> 
> #define CLK_CPU_OFF 0
> #define CLK_AXI_OFF 1
> #define CLK_AHB_OFF 2
> #define CLK_RTCREF_OFF 3
> 
> and change the CLK_PARENT() macro something as follows:
> 
> #define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT##_OFF].hw)

Sure, but that is out-of-scope for this fix which needs backporting.

> 
>>   	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
>>   	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
>>   	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
