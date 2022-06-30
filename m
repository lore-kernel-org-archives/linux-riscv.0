Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C1C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ya0qMST2rYalAWBnOwvNXuxOeFDlzNLO/uxoWnEoN+Q=; b=cl73qWWy2UwIeB
	TSAV+SfimVwqQe2Vf8C8oMT3NySLHQ0NeJNxVeqqFNM8AixQzBKweoKTxk2CXlFwVRFLzxo77/5hH
	pkC0DSU+46KDOMVAUAdtD+CrbVc5yUzBJVM+qrMU9ymFVrBl0xo/tCdMCbLsijIjb/QBUjKqors2O
	JNvBHOfA63W5eIcYVDcJp3ch0GDNlHZw1DwiPYEaPRCcNDZKMQEUcHkor9Our3YiNWlD9A80Uj143
	c75DTzcndi8hbwY3Q5GvslegUCHuZnZdHrM9Qj5wZRhkmsk3XZ5ks/q/R0k7tAjHaKz1RNmVCGf9s
	GePv3y6uP3TNRfPzBIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6xYu-000kAq-I8; Thu, 30 Jun 2022 17:02:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6xYr-000k9c-Lx
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 17:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656608557; x=1688144557;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xNrB28RICp2Z2t5+/ekANsFdoKpgnGoTmVfZ/qzlIFs=;
  b=XibUMIIGQavLLDtotDbwZsaaNx/oDdlET4j+fWq9Kne4mdbJQnfbHwl8
   KjuCwy68PtCXYSuTD5bzctGr8MiReFHB8zSvdHIQiu3keE6elHyQDNM+Q
   7Yz4sfretJEkNLi9f02XZw7xOlUjRjsG5i0WaCf7eQLgsLB/dTX5qT5HX
   4DP1lJv9/psupOkOtVH4Te7jnJyhUlqK229bewxhbyPxg7qvA4FlSVDMp
   6Lwc+7jxQj6m3f8SUnf8CvmBsnNWMLn1pIdM8HvkkCPYW+T69vNY/Et0E
   Fafp9E4EertuGvIkuYOpLtgwwwH2Rga08F+LJDazSNm+CMJhd1BpMcs6V
   A==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="102516870"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 10:02:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 10:02:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 10:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QudkIMIqs2W39bXHgir7DhFsSFrjtzT6g1r1lruFFFQzkFoQikhiS67bg2K4ce/pBpFuWR++ZgQOz0sLlIXwyH2mW9R/F1oxwEGVkTKXiVRaEXJjTCwpUBooHUdOhNzCoGzo0iSy5RkumOU7cX8VnleW5TAAQRHp/TLDN6zsVTwsVaRJXfC6A1XBjBZOCS8dgtJGuPKbdV7hV26VY85Zopij5eA2pBV8htZ+9uEWOzbLZV+WRFSOYmZCmVQOm2qIaiMu70tWi+GKqpeHvbf7yN3ljAoEsUlEm2FV5qGFk6rPzAJodky/+71zO9AWi0kTgh0yXAxhMRfAtOdm2UzHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNrB28RICp2Z2t5+/ekANsFdoKpgnGoTmVfZ/qzlIFs=;
 b=iLz0JU57rST0dmuiV10lJlr/kFid1fqYD5dxatj2W8x53D3vkob/JZHk7hOOcWGePeWzusus+Lq1VzuX3NfHAv4drVvMzj0g9ktvi8fLODMQhTeySA2h9e/V3xQJbX2HM1LKQQG2MfyKj1Zn/x5RZK+Og2Zp2Dgm+zDPmo3Pe1qauSAn7lPaiim90Om8yHw2y+aycaFmoUrmqGVATid14q64RUCrcgW1LgQqDu94B5wUJ6SPd2b/l7b/F/MvcUmD92nIQLlEB3rbjpinpEdI4uK7qQDxrkGA+YFudIxt6jQmQqeO2AINy1IFtVMJkqd08Bbh6MIj/wjMddV1OKPQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNrB28RICp2Z2t5+/ekANsFdoKpgnGoTmVfZ/qzlIFs=;
 b=LEnISbamkbASX5HpoCaAGr13UDY4jSyLUZq/2AH2/ap5yxUOyarkktTWoawkcpyk628+yWp0YHBKz4eRbtpTiZ7O3k34O+UL5EIFp2LvpOW1OAYLclxMbPXZ/tVA6tpUBh1twpvy+RnzDBx5+vTv/xHTM6dCT25HAI12UvsL96g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 17:02:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 17:02:24 +0000
From: <Conor.Dooley@microchip.com>
To: <Niklas.Cassel@wdc.com>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Conor.Dooley@microchip.com>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Topic: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Index: AQHYi+h3hoTHjH1NZU+cAhsP+cEeWa1oKv0AgAADh4A=
Date: Thu, 30 Jun 2022 17:02:24 +0000
Message-ID: <3fec7542-c5f9-8812-732a-d624b0506ca9@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-14-mail@conchuod.ie> <Yr3UKQ/772oFyvc6@x1-carbon>
In-Reply-To: <Yr3UKQ/772oFyvc6@x1-carbon>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab803a41-4411-49a7-0d8e-08da5aba4dfc
x-ms-traffictypediagnostic: SJ0PR11MB5040:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tm/nQrSR04eoTKd6k0l0nQWydS85h8G6L4tkdZ1Vsuqim/HQA7epZgXE4ljHqqZBSlrft8fp4owLczqHq2UxDIANvihJ1TImHIwe6XsmoaGkkMYnerOZYh+yAg6truN90NliK+A2TO4udqyC+hJsAow5zXY502SE+OZ1/eEP8gCUtFaLIKJYlwHB5ulN0I2eWw1FzxuUiu4w94SiiEPjs0tiSJBsy+8m+nX3P7vgK0EvCjsKZAzRfP5gp73j/fGOArUcLetuh6hPCClh9IW7bOrE2Qg8jqr0Uy725gO3wW5ocEmw0EsTuIPLhdv2jdXxFZlB4guWxHjxKD/MsJao9tC6hVjlLe66A9yVd+RhX+sy1de9OVQeKtUV71VT1xE1xi76KBSwsHsL/LENXYhPLKfQK2c0MboZiBdfqn5LeA77ar2kkrVc+3sH/rqnrtE4Sz7yebVzRHxXTdanQLvBQtKNtIDEQma5fopchQwv0H/ylV4iqpV9Ax4zph3LOCVzlcogK2FdNbe4LGL6Auhqwly66SttKELX3Yj7o0BZVetNeIhTlte0TV0uHasf5OxdMQsy/Hih+6azDlfJu0Pck/k04J1iru3EoGHmeZhXGy4xZseruvhJmUhRGJ3IQl9ldhTz8tFbW31156VKyu5oA0aNbuGzlj7ll8HDHq9f0LusEeecBg59X6sMwqOnrDdIQ/Pq/cseikf48/dXIKbhrGm5B6MdV+1UNGxlkc6upHSSudbmhP8775jQxQSGDoEyieoxWKvDZFJnAy2G6ZXvAU3DWnLwEWt1H0abfi1eodCYkWDYj5WDZQP/Ry47SBXeBZuvPkZjmV/xkByZloJ4KtgwCVQeLTGvZMdU17WhdeXN1bPNxpy4LgFCALO3f5CB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(366004)(136003)(39860400002)(5660300002)(38070700005)(6506007)(53546011)(83380400001)(86362001)(54906003)(122000001)(91956017)(316002)(66556008)(6916009)(66946007)(8936002)(66476007)(478600001)(31686004)(76116006)(36756003)(6512007)(31696002)(7406005)(6486002)(2906002)(8676002)(64756008)(38100700002)(2616005)(26005)(4326008)(41300700001)(186003)(7416002)(66446008)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE5LRUNoeUhqczc5MWpHc21VbjVXMTFLT081QzJ1TWE4b1Y1c1VjV2xVZ09m?=
 =?utf-8?B?enFEUWE0dUxiaStMUkk1MUxtY0NRS3ZlRzBxZFc0QVEzeERpQjJUdHRjS25K?=
 =?utf-8?B?K2h0SUI4UmtVdVNURnlKT08zSjl4SlduUktBd0F6SGl1R3kzQzdQdnZOREhY?=
 =?utf-8?B?NTZucG1IeXY2dmR6Q2NyNTl1UkNtVlppZGZ4NzNtTXFqRW5kQzhBTmJLQnYr?=
 =?utf-8?B?MWNvTWhkNUpROHdtcDFCNW1BRElFdHVIc2l2K3JGdFk4eUFhdWtUSS8wMExq?=
 =?utf-8?B?T0JkQUh1d3BWNDdHQUhxQ3NUT3RZdHVRWjI3NkZvRGlubnAyMWdad0kyeEs3?=
 =?utf-8?B?TUlZQkhOMHdXMWF5VWc4ZWxyTitjbkovdjA1TjRXM1phbnF4U3JOSmVkUU9H?=
 =?utf-8?B?UDZVa1UyY3lLYk4xUzJMNmVpRDFJeGVEUGpvWjhhMmpIYitNbG9jLzV5Mkh2?=
 =?utf-8?B?SnNhcnR2RUN4WjVjSXpnQ2dQSUxRVTRrWFRpT2dhbVB3NXlTbkgxY2FQOVVL?=
 =?utf-8?B?am5GQVhPb1FpbDlXTnZJSmI3Q292cWZ6L3hPakovZks3VnpzVEVSbExOcU1m?=
 =?utf-8?B?U0FyOTBFQUwvbWlNUXNxbHdVN2FCT2JhSzI2Q25wS3dXZnJRZnorTGluVlNz?=
 =?utf-8?B?aGxSWWJCNEtyTWdOQjZQTFFMY0VBQXBFRTJvN0dySkpGVlB3QStuV3V5TEFM?=
 =?utf-8?B?cDdOK1luTXJtNzFwOCtFTDhOTFFaUFZEVVhoTGtLd1Q5MEo3Z29lc1ptalJE?=
 =?utf-8?B?aGphSksweEhiWFNmOVM1R2xlL3ZGd0Z2QWEvempJQVIwcUVydlR1cEIrTmp4?=
 =?utf-8?B?bHlHMXBvd2N0SHpWMjBBS0VRSDNFcFhpdVZXSlRxL0pRb1lpbnlVVHJWN3lz?=
 =?utf-8?B?TWZQWkt6NDVSVnQ2TEVYcTZsUzQvT2dDdHNjNVQzbzlEZnFsTmc3NytITzF5?=
 =?utf-8?B?NFJveVkwUE5xajNGbUZtVWdnaXoxbjYrSkw2YjVZTmNsdUFXZytQbXF6T0tM?=
 =?utf-8?B?UzdHV2duTGV2eW9pb1pucStNQzdPQjg2b1lLUkF2TXF1ZzExYmdxQVgwWmxt?=
 =?utf-8?B?dmdWaW9LVlN5V0laU2lBL0tmT2hmbkJjc1AvbWhuZEI2bVh1dmRHQnJ1ck0x?=
 =?utf-8?B?L2hoNlI3SEFZTnorNE5ZS1dmaTQ5YlhvbmxqL3l5a3ptVTRkL1h0eStTZmRz?=
 =?utf-8?B?MlhEcnF5V1pRc1AreDFkWTIzaWRnd2c5bnh6d3dKYmpBTWVJMXhldEhQRnc3?=
 =?utf-8?B?QWxibWwzdE5uY3BuZmtFcUpMRHVTTEhUbEZJNlJFU3pUbU9iWU1aZnl3dThm?=
 =?utf-8?B?WG1Vd2REbkRZOHh0Wm85TVRVL21DVEo1eUdET1dKamlJWnFEY0swWG1VdVRN?=
 =?utf-8?B?d2pWcmVpUlJ1QjZqbW9MM05jZVlQenZEajlhd2lJcDNMTkJJckxKd3lqSUlN?=
 =?utf-8?B?anRhbnlZeGJsajRaZDh6cGY2NWRWc1dXM3Q3YS9XMFFJT1VmWmU1N05mc1hP?=
 =?utf-8?B?bVhkNW5vS2k2QWJaZGJrTWpzbUVYOUxacDRsTmZjUThyekVIbEJaVlJCN1U4?=
 =?utf-8?B?c0QrY2xsbFN6WmgwYlhLZ2l6dVpXeWt0c003YXR4cWVlQ3BjUXhtQ3gzZHFh?=
 =?utf-8?B?OEJ0TWgxaHNtU1ZTRW5ZRjhmTDRVSFJUWXQwQjUyMHJ5bEFiMW5HblhaWkp3?=
 =?utf-8?B?V0Rhb25GaUUwRndvSlVDOUluWEdmUU9rcEpwZW5wWFhsOFludU5MNXdCMXJV?=
 =?utf-8?B?UlNtTGtqWTNTNnpYNElYRW9NUW8rYWg4MkY2eFJWWEpNMlFZY3l6R1dBT2Ur?=
 =?utf-8?B?WVJCeFcyYkR5Y0dINGRpczd5dTlWWld0RE85Y0VMT2cyYmxld2xtaTJNQVoz?=
 =?utf-8?B?NlQvVkRnRCtSZ1VuTWJqeDRtRSsvaVM4WDFiTUYyZUVBTnhXTGFvbmRnRjU4?=
 =?utf-8?B?WEhvb3FxdjVrYnl0TVJacjJvamZVbjV5S1lkUTBsRmtsNDNyaHl0SjBFU2h0?=
 =?utf-8?B?aGZMbGZ5WTJURllyRmFIRW5saVpBYUJUajhzaHUyQ1FYYkhaUzJpYTBZU3pR?=
 =?utf-8?B?b0I0dUQ5bHFHbEkyYkZ6aEdIV0dQNXB6SlVDT3JjSDJ0Y2FaaTBPRlBiMzkr?=
 =?utf-8?B?a01veHhFVGs3eWYwYVYySTFRVUpTY0FjZWo5V0VlTUZuRzlwVVJjZzhrbUFp?=
 =?utf-8?B?UUE9PQ==?=
Content-ID: <B091F2015A2D874E8F23D71B3B5ADE31@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab803a41-4411-49a7-0d8e-08da5aba4dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 17:02:24.4971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lr3cgq/GRRAk7eik52W2ynw40t7T5VfHuo8SjksXNTtSTPMb1OaC112jPwoykypwPhEmdYBOqX3fA2QpQqviQbp4mTM8s1FeZV7kT9Idw3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_100237_870282_B27974B5 
X-CRM114-Status: GOOD (  17.70  )
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



On 30/06/2022 17:49, Niklas Cassel wrote:
> On Wed, Jun 29, 2022 at 07:43:42PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The k210 devicetrees warn about missing/empty reg and/or ranges
>> properties:
>> arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
>> arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property
>>
>> Add reg and ranges properties that naively cap the buses after the
>> allocation of their last devices.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  arch/riscv/boot/dts/canaan/k210.dtsi | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>> index 948dc235e39d..6a34dc4f3e51 100644
>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>> @@ -163,7 +163,8 @@ apb0: bus@50200000 {
>>  			#address-cells = <1>;
>>  			#size-cells = <1>;
>>  			compatible = "simple-pm-bus";
>> -			ranges;
>> +			regs = <0x50200000 0x200000>;
>> +			ranges = <0x50200000 0x50200000 0x200000>;
> 
> This looks wrong.
> 
> The property is called "reg" not "regs".

Yeah...

> 
> And I don't think that you should provide "reg" at all,
> simply supplying "ranges" should be sufficient, no?

I don't recall why I put the regs in, I'll drop it if
possible & respond if I can't.
IIRC, it did actually complain.

> 
> 
> Kind regards,
> Niklas
> 
>>  			clocks = <&sysclk K210_CLK_APB0>;
>>  
>>  			gpio1: gpio@50200000 {
>> @@ -382,7 +383,8 @@ apb1: bus@50400000 {
>>  			#address-cells = <1>;
>>  			#size-cells = <1>;
>>  			compatible = "simple-pm-bus";
>> -			ranges;
>> +			regs = <0x50400000 0x40100>;
>> +			ranges = <0x50400000 0x50400000 0x40100>;
>>  			clocks = <&sysclk K210_CLK_APB1>;
>>  
>>  			wdt0: watchdog@50400000 {
>> @@ -437,7 +439,8 @@ apb2: bus@52000000 {
>>  			#address-cells = <1>;
>>  			#size-cells = <1>;
>>  			compatible = "simple-pm-bus";
>> -			ranges;
>> +			regs = <0x52000000 0x2000200>;
>> +			ranges = <0x52000000 0x52000000 0x2000200>;
>>  			clocks = <&sysclk K210_CLK_APB2>;
>>  
>>  			spi0: spi@52000000 {
>> -- 
>> 2.36.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
