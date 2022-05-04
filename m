Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F2C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQxYHff5t52hTG+diRawvNf8lbxFpcsipJkLb5Rud9c=; b=uzKaPU5WFbac+t
	46/pljMPbik0uGk215c8QdJzkT8F57VtRZ21ULMB+eatu2x21kMjOxrYUHezB0Z79PwQXiLpYRSVM
	HmMEvXnILbHN0nXBBm5WAmng7kod+eLeVetUobVKFONgb80b9rrtSkmYMgt0CHzPl1ihpOdqV1cOe
	mdSnZyuHhTCv7bx7QMDdq2YtdQWQNyRkZuNiH5NlvKeO/QUNSJeakkxwbs1jQNl5jzvJefaXY4nTg
	7UjV709ORCnjjRMj1eOBBwei0y8ShGuPrXt/+sgmWKdncpw4Mr/Q7akx+UGbx2iW/vQAetc3P0Ill
	cyWG/mGpuosS2qSuS3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8jT-0093mX-2P; Wed, 04 May 2022 06:43:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8jO-0093gS-OS
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 06:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651646608; x=1683182608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VC04SDQ6f7ZHDy1TMm7TzUzUgRjw625p3fNa3w6r9QQ=;
 b=OGjuWTnuE8bH9BOUStsVVQL/qDd1TlXW0JI4XRBTU+/twl6HQnHsHl+q
 e2/R39Zhvm2J5S4DNfu8QWgCGxFfilVbKS61jWASZBpIrbKXvZOOZw/gi
 Rw9uEmV0Q/y+0CVZFKIWdBBe9lFRV1Mhm7zvSjJTN/9rPnWh6IjPWOeSh
 +I0xCFDhHOvUzuhXPLeOqyMhijuLK6MLTTURYEq6vzV9/OQc2fQd2K1dz
 z1hmELYKkt+YQuxK/hYSasx0sz9OidKYGAAtGZTRd8tc26VvL/lAaPkza
 ixR51ErMoLTngSXupmqNo5XLXfbvO6P0y11ebgtJSvx9OuwL/HCsEoqsF Q==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="162256605"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 23:43:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 23:43:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 23:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFTZUD+3MsPpz2N7dEz6diQWfxE+2QmHX0RSCXeWXHPG4nXIPaPl+OBe4b62I796068WfV2fOf+XWYeX/dCXZWSWuxuO9eDDJRxnH4H6s7Rr3akeGhJwhiDqFP4wgrIMAC2hyxywsplyf+jPZcTY34dllU/j2kToYugwMX5q4ZAENWWWs64YL4h23c6RWGYU+NfBb2BTNXOR9xPDDQIKeU8bFBCR+xh4dRdoRP9rHBhHr2jci2PcNWWbOnfIM/XFLwdGSeWM5cCOpF3zi/BvAhb/SMu7JnJdIoyFNjTNo00y9dIKw6NhblnCPAo0B9/J1i3oLQujD6ajVgqw/LAGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC04SDQ6f7ZHDy1TMm7TzUzUgRjw625p3fNa3w6r9QQ=;
 b=feAeE5kKvrD5z5eRsBwqdWLPo85S3qP0CV6XefOhc/ey9zjxwBSAnmdWBxwAoJySxe8NKS7ygVmI9ENi9PSRUNH/mDX796LUQ1/o11efl5o1sGgV3lrf7cWLlNLuro9txlRle2nh3C8u4ZFSyqGCx9OOhKqZwD6vIyqQM1W+MSsI/ZLDkMhFm5kKhXVbTBr7QGTlLxyYK7V1OoMOtfeFlZolApolBsfJmRKb2TY4yXHT2xviaFF19HP5rsuEBykdSCZO3pJMBbSJBdDn3EslUGi/JMhU2JQlH+b+ooGYKC2L9r0mFOoi8rY/HNgvkkeZdt5bi5WbYW/y98aNH0G1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC04SDQ6f7ZHDy1TMm7TzUzUgRjw625p3fNa3w6r9QQ=;
 b=B5W1y7u63QUXhKuIKZ9XlV8KYKCCdXynD0Y98+3ml+jIxfjdVbQGKBD6VbbeybcUzZowehp/DKmeQE6hmu9XyDTWDSPc4dw9HxZqoucyeP4enwqBiPEGwzU6aMZBRiRexYRTk4pDWE9WtruE5cjSF0SN03DIwPEX8QMAUspWE78=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 06:43:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 06:43:15 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <krzk+dt@kernel.org>, <palmer@dabbelt.com>,
 <robh+dt@kernel.org>, <linux-riscv@lists.infradead.org>
CC: <Cyril.Jean@microchip.com>, <Daire.McNamara@microchip.com>,
 <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <palmer@rivosinc.com>,
 <arnd@arndb.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robh@kernel.org>, <mail@conchuod.ie>
Subject: Re: [PATCH v3 2/8] riscv: dts: microchip: move sysctrlr out of soc bus
Thread-Topic: [PATCH v3 2/8] riscv: dts: microchip: move sysctrlr out of soc
 bus
Thread-Index: AQHYXZF/DC6xJHNIB0mum/kRo+VnAq0N0nqAgAB2wYA=
Date: Wed, 4 May 2022 06:43:15 +0000
Message-ID: <08498895-ebcd-b0b5-4463-7fb236626dc9@microchip.com>
References: <20220501192557.2631936-1-mail@conchuod.ie>
 <20220501192557.2631936-3-mail@conchuod.ie> <3166309.aeNJFYEL58@phil>
In-Reply-To: <3166309.aeNJFYEL58@phil>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2df9c761-c4c9-4432-52e5-08da2d995dfe
x-ms-traffictypediagnostic: DM6PR11MB4628:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4628C1A056935F81755A1D8E98C39@DM6PR11MB4628.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0zrnKph/aEXvOwaHFJUIBzLMU5iooiFTnfINYLzCV6dOjxdgIgehznooQOOp0v4ypyxeYk2F2UJZ1gK10TaD5wiU+WDpXraUD/8Y8AeC/zl+G8umeqE/1+Gjvthh5nf1R+zdQYnyZOyZcP+611KqUMENJkVFA1i/KAirxzuAyQwVOHBt4Vg2fdvk2W9HuDpXYmax4TW4GMwhOjHhvl32Wgwy/h6H3rV0F5bknG4gHuj2UWktWCYa1F5qFqWeW9izbqw3Sp24OCND88d6ShDBvdSjEg+8iCVOi/bK5KmbtxL+/OfVEVsQ2NrSEhKpE74W4mBfGwml0ZF7J8A3XqYPR6KJuA7g9P0n3fP9vv/o2EqByJxOHhH82MMsjOmW5XOAaoUtGHB13YS1JOVYNddPgYRfFmDnjPEodusr+CdndKXocJTdHfEhBgBWYSYIbuXqfQBy6vldEe5y6FkeQYrnLKNMr0/bwwJbXf/czhAJOXtkXFrU/FNRE0v7gVqXc7JncUgDvGzkHaFwG7hqiQmuGtHMUb/rVQDjsxOUy8mDw3fP3MylUcE4W/8yZHGr9uqaXj+XjYNiItQXrUTLZYHiNaS+JoOicOrHnY6U4/XMgYL9WjK9Bg9pfDYF8ESGuIU2MBAuHOntlkFL3q7Xq9DlCKlDA5xB0PekUQEkBpqt6/xwzzNHi838JGO73oJmcLx/Z7VNNacWXveYNsYfYWCRK2XMdsaD9pxJSx8nhcb0xkXsY1zoioIG7Aj0DsQ3XdbHHe+kvbUbZom1rF/uwbyDeyIYi2scucuMs8VunuX2Q6OPH0KigsuqOAFO/DG3PsNR5JiwhjpPVu2wlOE36+Uvyc2uh0tsSeisf87EryWswLQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(71200400001)(110136005)(7416002)(5660300002)(2906002)(83380400001)(186003)(36756003)(8676002)(64756008)(31696002)(54906003)(26005)(66556008)(6512007)(66946007)(316002)(66446008)(66476007)(91956017)(76116006)(2616005)(8936002)(4326008)(38070700005)(38100700002)(53546011)(6506007)(508600001)(122000001)(86362001)(966005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTQweVl0dmN5M2ZISW9zRXJadkxWVVhFNUJrRHFWOCtTT0lHbm9SNTNMRjNU?=
 =?utf-8?B?NGtNN2dISG9iWDdSemJmRjBCeFlNRGdlQkJjdkFNUmttVkhCSFFZZ3dDYlBN?=
 =?utf-8?B?bnhOQzBPWi9FTkp5eEM1dTgrZWk0QnRYWlVyaGVjaFViMjBDdVFkT3UxNEd3?=
 =?utf-8?B?REN4eStIbTBUY0wwMjVFSTBSTjV4UStQcUtBbldDSjdGeXpvcURtMXg4Q3Rr?=
 =?utf-8?B?YmtMTHFDSEpiR2dwNWVsdHlTTmlDMGVFVHVyeVV2eWdsekYwMjVQalZPNkdw?=
 =?utf-8?B?M3pvTSs2RGJqQlhNTHJiRE54QlhxV0tzTGdXM1lFd292YkxBRFhNbjhHdEJr?=
 =?utf-8?B?R1ZOdEExR295b2hHRXVqTjl0eEtUam4yZjVtZS8vajlobGVDeFpvUjl5U3hy?=
 =?utf-8?B?ck5JUFdHMTZzSjlja1F6ZzBNajdvK29ZM2FkSVFBTVlGcGdmcXdWTElacVY5?=
 =?utf-8?B?eHRRTkExM3k2MW1IelY2RXpGWWRRRHNzS1N3RFlsY0p3bUZVMjVmaVhZZDVv?=
 =?utf-8?B?RVptOXVKdStmdWJmWm05dFVNdk5zdmNOT2NwRTNFZWRrSll5TVF5NXJwdU5q?=
 =?utf-8?B?ZmR5WkxxNkp3ODV4K1hpYS9XSlVvOFZ0U0hab2RNR0VKdXRyS0I3aWxtT25P?=
 =?utf-8?B?bmIwcGV5VnFqY0tQOXdKcHJUZ2JjQWpGcVpHbjRaVVIxbWxRTkhQQ0MxOTNP?=
 =?utf-8?B?eThTN0dhNFpXeFNGVTJmMnYzYXo1SkJVQU95SEN5dUNxdUIrRytSVDRrUjFG?=
 =?utf-8?B?OE9jbU5VWjhBQkhyR1poMDlTZ2I3NVlXMzVZVTlOTU1HbmdYYk5nUEZybkNL?=
 =?utf-8?B?US9jbllOTzV0UUlyN1h4V3FTWjhiNDI1Qk1wREh3aE11Y0VCcllWVkxhSjNi?=
 =?utf-8?B?RzFiaDArVTBFWTVpWlZOL1p1bWVJZmVuT1BRK2tZaE9UdXUzMEhNSVZZZUR1?=
 =?utf-8?B?eFBTOVdDcERuR1hKdEpvbFJadXFVd0Q5R20zYWMvb1JvZWcrK0dtNXIvQmNK?=
 =?utf-8?B?S09rQk1HK0lXWXJRenVzTFQ0TVlIVmJGdjNxWnRkNFJpRkd3WjkrTmVlOTRs?=
 =?utf-8?B?MjVZRFJmUGdMQmRwNEFZUUJIYy82TitDV09UMVBOai9qdXU0M2phbWVpb0Qx?=
 =?utf-8?B?c0M5cStad3FSVzJuSWlUQkZvTVhjK0NleWdGNXRaeGgrR1FwQWtXNENvL0Ra?=
 =?utf-8?B?VGhSR2Z1Q1RYUUJjV0JZdzh6eWZhL0YyQnNDRk83VUZZelg2bEozc0tVR3Rr?=
 =?utf-8?B?dzEyQzBMTU9Ea3JQQmMxT0g1ZllsYXZvb1RNRmR6WjNmZTlFWUlYTk9UeWRx?=
 =?utf-8?B?SnlaMUsvM3JzdkFHNktIelFKdml0Z1VXRWV2akRJYU1GZ044emZsaUY4cHBR?=
 =?utf-8?B?cGZhNjljd3RhVWxINHBFQ1c5elVQOC9ITUt1ZlZqMVd0MEs5citXdW1yQW85?=
 =?utf-8?B?eXdDTHNBYklXQXNFSnlVV2xMM0pkOVZZL0tlREhlclc5Z1pCTUZNci9SbWJF?=
 =?utf-8?B?aDJQTmZKMlR3SDFkTytGVUp5RlBwSEtOVFVMSkpyTlFBN3Eyb1dSVVhuVWc3?=
 =?utf-8?B?T0oxRWRkaVdzN2xyME54WWJWSitsdGFzUnNXOGhvQ0thQkRXUWo1eFBGODhX?=
 =?utf-8?B?OHJTdnlMY0RELzZpOE54aVdEamNoT1oxdDFjOWZ1eHV5NERaaExCdWRuRVNl?=
 =?utf-8?B?YTR1Y0RtYTJHai9CNHdIMjJJU1ZSRE1EYW4wdkhmM2NOM0VsVitQV1BIYWc5?=
 =?utf-8?B?OVJXQmZvYWtDRUR1NzFrWnNaLzIwZTIrT3d3cFl0LzdnbUdEMkM3c0pJZVg0?=
 =?utf-8?B?dlJxeXFObWx4T3hya1RLLzdCbEVUYnlkVlB5SEJzamswVmN6Wlg4K1h3bzNH?=
 =?utf-8?B?VGE4R2lpMWE5TnpSYkJaZGtBajBTenlDRGlhNkVMTllWbitvV04ybGhWenJq?=
 =?utf-8?B?aWJUbzFEcEJVOU1MNTBpK3BNdzlXVCtJQWVja1dONGUzdm4vOUkzY3daSVhu?=
 =?utf-8?B?RzRxM3dLY0pnYXMrSS84OHNmOHZBT0pGYW9XT2NSSU5GQnlETEJuMmxoMUc4?=
 =?utf-8?B?SVV6WExLenZYU0JGYUtYQzAyMFA2YWxwWkdZbjZrL3cwellteWFUeHl6d0Nv?=
 =?utf-8?B?cis2ZkpRT2x4ZTlNT1BobEg1UmdObkYyU3V5TnRFVHRvdzdwZWJtYjl1Tnpz?=
 =?utf-8?B?ZUFPZnljaGEwNitvTVdyMEhtRFo4VGFSY1NBWHFxK1hvK0JJOGp0SE1yalFh?=
 =?utf-8?B?MEVwRHRFZzZWM1U5ZEd5QkFVRktJTnNlYlV0bWNSbDY1SWYxOStIdG10VzVz?=
 =?utf-8?B?OUY0Uk5JVWxsSk96V3RVams3WWI0aDNDako4RHA2SE54VGw0SDRGL1pRc05x?=
 =?utf-8?Q?Se9s5n6jeyt79FVo=3D?=
Content-ID: <CDA950E1559FDA4297BAD96E59F50331@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df9c761-c4c9-4432-52e5-08da2d995dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 06:43:15.6384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5SIlWMJ19+YiY/ZTrsIxgZYTTN95av7H+IWA3cgRaPuGcWHoXSngcmhqq+OQQv+3/UOJd+adWDuJdbpnhcEtIwIN3JgBZZlQi4fGE2SMDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_234327_079545_2FD23641 
X-CRM114-Status: GOOD (  19.15  )
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

On 04/05/2022 00:37, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am Sonntag, 1. Mai 2022, 21:25:53 CEST schrieb Conor Dooley:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The MPFS system controller has no registers of its own, so move it out
>> of the soc node to avoid dtbs_check warnings:
>> arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}
>>
>> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> What function does the "soc-bus" have at all?
> I.e. mailbox@37020000 also looks like a peripheral
> of the chip but is outside it.

I am not sure why a soc bus was chosen originally, splitting between
axi and ahb would be more accurate.

> 
> And I remember getting the suggestion to not use soc-"busses"
> over in arm-land years ago [0].
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c3030d30d9c99c057b5ddfa289cffa637a2775f5
> 
>> ---
>>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> index 746c4d4e7686..bf21a2edd180 100644
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> @@ -146,6 +146,11 @@ refclk: mssrefclk {
>>                #clock-cells = <0>;
>>        };
>>
>> +     syscontroller: syscontroller {
>> +             compatible = "microchip,mpfs-sys-controller";
>> +             mboxes = <&mbox 0>;
>> +     };
>> +
>>        soc {
>>                #address-cells = <2>;
>>                #size-cells = <2>;
>> @@ -446,10 +451,5 @@ mbox: mailbox@37020000 {
>>                        #mbox-cells = <1>;
>>                        status = "disabled";
>>                };
>> -
>> -             syscontroller: syscontroller {
>> -                     compatible = "microchip,mpfs-sys-controller";
>> -                     mboxes = <&mbox 0>;
>> -             };
>>        };
>>   };
>>
> 
> 
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
