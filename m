Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D23C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1OTPVp4sTbCMQJGU/A26hkVk3RYtkcpthfpBjBwEpo=; b=YhKIrwiUPV+5zW
	K8MRD2SPTRGNcGxMgqyaioml8GNYoWHrF7bUyFJpjRy6RKCDJaDHmCQuBqk0QIVgVlyorP3MyUb32
	mi49Uli09/k4k4AfBWP89US4TAz5sUn4c31bxoqbyb3dCt1qGuDyiS7qu7XJnxTx8c2SV07mqkng4
	Cvah97UIS0axL3/EG6XE6ldxbRgwpr0DXf2ciL0gszzI/bPmf/8Md+eztV4q82VauIxUt8VL8/q6v
	XNpp/4+VGVjPCBTfTCj3g6ijy4kxc4OrwFtBoPuyahhAq9hXqorfM4meDiKHSe7kvbsyDR+xR3UAl
	JYOoELLzmtgpeiw6TZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV9bQ-00162T-7R; Fri, 18 Mar 2022 10:13:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV9bM-00160j-Ob; Fri, 18 Mar 2022 10:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1647598376; x=1679134376;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=FAZJNOSycMPR0AVN4gA5pPjvVmMyvnjK7sW5spVDPkA=;
 b=niWjbF5/eANsHh4Kw98zb/lHyHIvPX4MowypsHgJpsWhCpMjUfHRGiUW
 EHTuVM4rr0Y58BnyjNAZz5r2kGHkf7tZBhbMNVBAfe/fyF63mmcPGghkJ
 Bl8Rdnwyz4b1Lermj4yYz3U35HkW6OlE9pgtQ68Kvo266vgP9ZQJxpWEL
 rPPWLSwMR4FRNTOZjDgiPzEyWlYao6NXrD/tbDLUc1XflR9xu9f/gYypP
 zCUzaT0kWz3LOzvo/7Z6zvQfVC7SKatMuTaQMWdd4Suc9RNdfyW5Os5SG
 mTStbQ1gWNv5VOvWKI0cP7eJBcGqKUQoNq8fzx5F1s7RK4WHUlRFHUuju Q==;
X-IronPort-AV: E=Sophos;i="5.90,192,1643698800"; d="scan'208";a="152466305"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Mar 2022 03:12:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 18 Mar 2022 03:12:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 18 Mar 2022 03:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfRuXaidSbPAxN/KU7QQaUMJ+8My7mrlSn0A1rhuidgk/t9Y7RzjqsV/6o7qTzDv47a9pyodcMl1mM9eZO37c9tp0PnoLF01aMjGsCGPI3TNTlcUkMC4A3JL7uRbkepmNquJ6qLEzA+N6NoCNVvkPxUAhn6W5d+VAj6XwlEgBGE2d3+5ILmGsiF9ZOeDoRybS8TUJZstlxxbc6A/WdokdXjjlJF4wREiQlJz/OjwYkB0LUHY73q6WFoV3Dmgjt50s1KlEktnjdQRiZK3cmx/KMEsOs1TMvcKof1aTH7i7hijC5gwbEAZfRG42mXS6+c1yx1qCaTjAelJcm3ofLasQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAZJNOSycMPR0AVN4gA5pPjvVmMyvnjK7sW5spVDPkA=;
 b=nwIK4ePvpJvkQRhx5N2Hvt6+UV+/TXhOa99fBlgbLl0ehLJ5vOkgxgRpSe7L79io8yue6NRf8gxs3EMSkNn1EunJnYI38pq6PgTjiAPcz2HHnP8iqFOyYSLGkTWi55URvnx312y1XweR5BCfbOiu3ohULoCINPnomzD9uSP2DUbuDJZPvQyfeJi0Auq/KyYtS60fLzDvNnJmwojYqD6X+nfDPAgQNFltWNjcy+T6MhzGSyKh4FsfYPbLrITVOCiG/1Hdy4kg5A5VwlSBqNjetE369Ltceh4WcACFDlTkGb/H98Z4IRaaj5gDKEWbVEj1XPuWn3+8Z2bAdiRlOO6ZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAZJNOSycMPR0AVN4gA5pPjvVmMyvnjK7sW5spVDPkA=;
 b=JXuEJRfMMoIcFnnZRXhtmGX0tSsRnWQiRAIUmTqGMDQeFtVYhrT98GTuGDb1voRxD6ZWCMR+mS3FYP95myvqQ0Or9gVDrhb3kZBednS3tRE08o9JtVmlqez6ERu4G5IGUgNPh0ZDk8PHUFzoG8AHKryzBpvYQYaQq2QxPSV+k3Y=
Received: from CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 by DM6PR11MB3436.namprd11.prod.outlook.com (2603:10b6:5:65::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 10:12:47 +0000
Received: from CO1PR11MB4769.namprd11.prod.outlook.com
 ([fe80::6d66:3f1d:7b05:660b]) by CO1PR11MB4769.namprd11.prod.outlook.com
 ([fe80::6d66:3f1d:7b05:660b%5]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 10:12:46 +0000
From: <Claudiu.Beznea@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <tglx@linutronix.de>,
 <maz@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <afaerber@suse.de>, <mani@kernel.org>, <linusw@kernel.org>,
 <kaloz@openwrt.org>, <khalasa@piap.pl>, <michael@walle.cc>,
 <mark-pk.tsai@mediatek.com>, <daniel@thingy.jp>, <j.neuschaefer@gmx.net>,
 <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <nm@ti.com>,
 <kristo@kernel.org>, <ssantosh@kernel.org>, <narmstrong@baylibre.com>,
 <dinguyen@kernel.org>, <cristian.ciocaltea@gmail.com>,
 <qiangqing.zhang@nxp.com>, <l.stach@pengutronix.de>, <paul@crapouillou.net>,
 <jiaxun.yang@flygoat.com>, <jason@lakedaemon.net>, <paulburton@kernel.org>,
 <tsbogend@alpha.franken.de>, <mail@birger-koblitz.de>, <bert@biot.com>,
 <john@phrozen.org>, <geert+renesas@glider.be>, <sagar.kadam@sifive.com>,
 <s-anna@ti.com>, <lokeshvutla@ti.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-actions@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <linux-oxnas@groups.io>
Subject: Re: [PATCH 10/18] dt-bindings: irqchip: microchip,eic: include
 generic schema
Thread-Topic: [PATCH 10/18] dt-bindings: irqchip: microchip,eic: include
 generic schema
Thread-Index: AQHYOrC3Mqtqyy4fFUKI5MxdXerRZA==
Date: Fri, 18 Mar 2022 10:12:46 +0000
Message-ID: <6c2ab139-f648-b6ec-03ac-02242a1f9db6@microchip.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317115705.450427-9-krzysztof.kozlowski@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d59dadb-8cad-473e-3dc9-08da08c7d9aa
x-ms-traffictypediagnostic: DM6PR11MB3436:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3436C232E8CE6FACA21D844487139@DM6PR11MB3436.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ij3mEhgT0vEwfvOBdTHcmzYLbYvf341kkWdDdM5eTTwJI9X2Mt6l0YBk4T5fTeYPPa459aTo+TcDaqW/ObSSZticX8HdZSMgvKyqAGeo3HMHUUHqt3GzcXwXctAiKHScQ3z1gcyEbSLwb/aNFcHyjiC84+feeBdeSxL76Q/rW2Sm0Wcaq2omSix7oJD/vd1NEFfViHXleViEmJkIoequG3R8YvLt90R0pWsCgolsi34N8WfbXYSiKoe8Doa6W6FIHIUH63SHZgVsb2f5t3R/C69fBFf0CrCgqXip/URggGtWXwRFog++TlTBp37FshhIf+qWA1gki7t9vjUbyLqJSVY05popvIrwDKshYbmycpHWLSxoVTJ5xHmUW0jH4UjOr2RFeN0vqIYx5IJAj+Sj+Ni5gkE2m5MjT7QZFertH98fAtJ5UGiBnKrgBreEHnn8ENhu03MNmF2UlaOo9OrPGiXpRMProeZfsBAgp5d9V2fTeLF+SGGyZDklZdN0juJoRu0iPeUirxIVB9m28qVYBp99/eZeXEcK8V/VUC9TdRbhflfDdZkftj4dng1+t4QHeqlwIh6OruYlNzwl8Xh44Cjwwx7ao6RH5+9GgRihA8znCk2gXZZKbHslhIeADbARYJfu5rq83+3633SDMWiWvzk+b79TdwxTE+zIS+8HZxKj47sFs5vGHKFTFDTuyaeDG1UJPVKnp4rOzxhm7QBcP8pZmq7Pp4mUhMU18eAUBYgUWmofK2YpiFiEZO9A3qE5zgxP9NFs7RemiqazikmTdbe135PNi3CVr0X7s/k7W76zw1xUwNmkFGKwlOfF9AFG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4769.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(66476007)(66446008)(76116006)(64756008)(66946007)(6486002)(508600001)(83380400001)(8936002)(5660300002)(7416002)(7406005)(110136005)(38100700002)(921005)(122000001)(316002)(91956017)(186003)(26005)(38070700005)(2616005)(71200400001)(6506007)(31686004)(36756003)(53546011)(31696002)(86362001)(8676002)(6512007)(2906002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXhJdW9SbnBRaUxFYzFlanpxY1RHK0xaNDhZS3dTZm0vdHpaS2M0alIxdkNm?=
 =?utf-8?B?a3hHQXY2U3F4dFNVWkJCaGcvRGpla1lqalArK2FKOHdtc0xiZ0JWWEdUaWln?=
 =?utf-8?B?b01YdnpTT2pqQVk1RWpHYm9ZZlhlRDlIZi9WQkM0Um1DeHJMbU9pb2NrZG80?=
 =?utf-8?B?ZVRRMVNuQ3hiOS9JOE5KTTQ1WENWeXpKb1kxdE5WWkl2aVNkNEcxckJjMHdj?=
 =?utf-8?B?dFZEMVdHV1hSMStEdjRMVnRWUFdrbmdwcTI2VCs0Zld3SjQ2YnlkRFJZempJ?=
 =?utf-8?B?cTZ1alpsWk91M3BHOW9vaXZURmpjSFZiUjdhRVMwUFVaaS9SK0ZJeXo2clZY?=
 =?utf-8?B?S0FCUXNlM3pSaDVzc3pPbUp5SDl1a2dmTEUyN21GTW1tVTRDQUsrV0Urb3g5?=
 =?utf-8?B?YnBpT3lpM1l5dTRNVmZHRGxxakMrSkNnaWRIQWFYYithRk5xWkFGZ1pZRjVl?=
 =?utf-8?B?blRJV0V3M0VPWlI4OHJTVEsyTHN1NTJPaGhScHlPMzQ0ZUlWY2RreU45a0xT?=
 =?utf-8?B?bFNBSktRNEVDaVoxelhXUlRUcjRraEVOWklQZWxwbHk1OVhNVU0zN2lVelFI?=
 =?utf-8?B?dUJUUDBqUTZ6dEFaa00wZFg1WmxEMXBCMW5wYmNMeUpUNWMvdWZPQWU3akQy?=
 =?utf-8?B?SHE5b2ZIYXJVSFZPUkhSbUgvTkVSazI2cFZFU3p5aWRkRTVsZFpUMXAxTGYx?=
 =?utf-8?B?dEpveW5JQURwdXd1ZWFmYW8vb3EyaG81eWpMTExXbkJCRzV2MFREencxczU2?=
 =?utf-8?B?Mk9UV2RRajFkdXJiUHF1RjJ5c0VLaEdLU3RBOWtJRVhvbU9Zb2FhTTRzQndn?=
 =?utf-8?B?dXhhVnJVeWZRdUUrbUZqMi8rM3ltcHFBTnF5ZzBMQmZvTEZXQklhZ1dJMTNz?=
 =?utf-8?B?QnZxbUJtQnJuK0ZZRVBzWXpGTGJ4VzA1NnZubWJRR2NmSFVSMi8vV1lwU1I3?=
 =?utf-8?B?MG81V2s1STNKR3pra0EyVlk5NnFGVSs3VEoxbXVHa0JLVDExcGdZT3NtVnlT?=
 =?utf-8?B?MFJvZHIwS1htcy95Z2QxOUlvaGNJTzMxeWt0QSt3QnNvUnNiUDFjdXFzYlg1?=
 =?utf-8?B?bzZlbEpqVmw4aStzWG1RNnArMnFaNjNBQmdHQ1doQTVHQXpjcGMxeWRNWFZT?=
 =?utf-8?B?R2Jsb0JJRWs0d0JibmczRlBMVzIxY2x2VXdhbnh0Nm1HREhYTE9UN0tUL3hQ?=
 =?utf-8?B?bHBCaDFCTllvSW42cjRVQmVXMUhkWStaTWphclhWYisyVkF6cGJhUDhTNUZ0?=
 =?utf-8?B?cjFSM3IyNTFyK0lScmkwYWEzUmVJTU1rR3ZaTEk1STRWK09ZY2tMUGJxZG84?=
 =?utf-8?B?ZWZ6NGdQdGZ0WGo4Z21zNXlvRndHNDIxbkRGK3VQSXk5WXdEdGN2aEg5a3Y0?=
 =?utf-8?B?NTVuZHoxekVMM2FNdFB2SEF0bjFDNGxUK21xVFZlQXVjZ2hMVHZMVFR6TmI3?=
 =?utf-8?B?bjRkUDlFL0FUZHFJQkxaMTd6aFBKcGxpenZVcnkvL29GVWFPNFoyeHp3Nmlo?=
 =?utf-8?B?THg2M3RRWkkrV3hMNGV4cnp0Q2JMM3hWY2txK2ROT3VReitrUW8xeDRLRjY5?=
 =?utf-8?B?Y1p5ZzZoU3pGY0dTelBNMmxISnRHakk0VkpPN0JTR0VLYWN4Wk5SaWh4K0U3?=
 =?utf-8?B?bHZRNFR4WEM0dDNhcjFUT0cxTVM4dkVSWXhJZm52ektFWmN1WWJteWFmc0Y0?=
 =?utf-8?B?MVg5NlJTOGRkVTJaVlJwalJUUGJHa1lSMDhRL3k1MTZ6TkFKcXE4dlYzQUgr?=
 =?utf-8?B?azdRTnZiRE9ZekFLcVJUNFhONW10K3NtMmN2TFB1RTRFNGxlN3BnemJSZE1W?=
 =?utf-8?B?UFZhQlpCaTdzY1lIaEVZNzRIaURSUWwwTm1CeUVLajhCejZDakxsMHhvYmQy?=
 =?utf-8?B?M21Vay9jazBGTzBESEpnUjZyU1hEMERZNkNreURkNGozcG40TVdmUmlCNktk?=
 =?utf-8?B?TWVkVHV6TVpvT2FiY0VZbzdqSjNQUHQ2N2pnRGhtT3B4Q0NKdy9hRzdDNXpI?=
 =?utf-8?B?czY5dVc1R0ZRPT0=?=
Content-ID: <7551BB03539FF7418EC51E7A1A6D1AB6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4769.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d59dadb-8cad-473e-3dc9-08da08c7d9aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 10:12:46.8267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teGAIuGswiSWTggTIrtQMIxNpuH7EUq1k49EJ47FOgE0bmo2I58OXJBXPMoxe0rC4Dq92rQGnl1Em0i8xw5/rp2YyhzkpSek8ekrrC052Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_031256_969351_D9FBB127 
X-CRM114-Status: GOOD (  15.71  )
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

On 17.03.2022 13:56, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Claudiu Beznea <claudiu.beznea@microchip.com>

> ---
>  .../bindings/interrupt-controller/microchip,eic.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
> index 50003880ee6f..6ef8632b3f5e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
> @@ -13,6 +13,9 @@ description:
>    This interrupt controller is found in Microchip SoCs (SAMA7G5) and provides
>    support for handling up to 2 external interrupt lines.
> 
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -51,7 +54,7 @@ required:
>    - clocks
>    - clock-names
> 
> -additionalProperties: false
> +unevaluatedProperties: false
> 
>  examples:
>    - |
> --
> 2.32.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
