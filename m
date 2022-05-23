Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE85DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 12:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKNya2WU2cZEKZj3P6hrx/W60kaeuI19jRfyxxk4td4=; b=iBaRYQRjhufIgU
	6j/XqFj2eX2UX7o2hrr8bckd4YBxzE2JnzPsPBlNKNNbQKbiKngYjRF9HqfNNWqU0oN4gNiKbeMaP
	rmVasvywJMpvJlck+1wXAsdAL7CS2SxoDSsQs0f1clHgHKF0ggUC5IwFDxa/Ktz0SUrt7pe6H1BMe
	n7B1RISzClJjDhNlWSCIZfYbzm8zLqTO9p9y02saQ0kPkiSnYjHV1NiO6GSZ9Gt7OoTNygzPDrJK9
	28oHpptmZiteNf3U5LyvV+sjEuZzNGsVsGDEPJfsEYiY4HjZXszP7VJU2t42l2YfawtKw7DtGk9gF
	raSHaDkxgG8B+afzpVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt75w-00464Y-Hl; Mon, 23 May 2022 12:23:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6Xk-003q9o-My
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 11:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1653306492; x=1684842492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pR4+kEY+0rtUovZl4eo/B8pmoADnqVpCRumI+HV0sts=;
 b=c7BZK4m9c6QbyCbfUOXWoxPSpcT43LQOnag2Sc7BSqG+JhIpTA22cqQb
 A9nLs6rgInWs4zZwub4Xz5MeNFbhYcEi4rGeDRcP3b1XwtTtRhmOWZ1U+
 REYpW9a5PfEvpmsRUEZSy4ZGUlv1vpvpWNWBVLg5dFA/RedgXOUBCu/90
 3HYwXMeErNSvSGitc0/PdK7ppke4p4179w3R6kneULETCnFt3hGqecJ2h
 mB0KvH1n0bXb69zpQVg+WJqzP1kyIssXT8UHrPvscsasxtCkNrS2sAyLc
 7vphYoj8mchd2Mr+QxAvXafq9TY48Au1lI2H7forCAhUqOKZVGTlti6Dn Q==;
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="165251347"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 May 2022 04:48:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 23 May 2022 04:48:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 23 May 2022 04:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W74SKFJwYQzUYQg77fI7h5z2x484wTfk4JaqoY8ORZPetXG1sbX67ICJNUh3AVQedR7lTgPAK0hQTlyNh8YqVL794JYxAYPRNQcTy7hfuJeGYtmiWNr5bcJcF2gANz/asCORCN6/87MDJDE7kzPyK02APY8e/5kGihT8FQ9FSDy7zr6FB4c63YP9jDu06GSbNol53TEtZZa4srz32/9+BkFWSfqiBcV2Vekn6+FCp11H+xhcw9w67yNAy7+dkgS5/TuJMyPvyqfTA1rQ+q/XbOI0ep4s+48w4d/kyWNeULajqVB/rv4Fkcys6LmgVz7eNcVOsouMnBLTEDZtk4wHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pR4+kEY+0rtUovZl4eo/B8pmoADnqVpCRumI+HV0sts=;
 b=nbjLX+8aJb0Twa5sIrPjdCF1d8JBhpPyHFjH9dhNiCycJOtsnogbj/HspRupdQ/dhJ+ogsF7LSjFWsLjgh9NaKp8CSvDZc3V+YTYa2LqD0h9HpTtAyYveSSKUVzlLbnXQv7axog3WTzRNkk7BcW17OFrwbK9Z6oAnax1M6U+hJuK175zurm9wmxqRBxRTuzfemjmGjjRQ2sDRwDIKfjdffSMOdHCviPZkVqb48TTSyZlBmC3K/oM6P5J0AeJRxA28gFve0D7L1YX7YKLIVsgQekb+el0U1bOVlRyDt6/PfX78ZYaWw2of8S1uBlwXBJZv59M+g0YogvkN7BM9pDZ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pR4+kEY+0rtUovZl4eo/B8pmoADnqVpCRumI+HV0sts=;
 b=fbPQ3qBYDkm4lcl7CTba9cCuIH/sryb4eY0E0tLSCci0wILVZ0mH6ltR4f4hA4g2HeADvFZztJXm2qpH7C4lCBuTchhBb6jtTi/LLVRdjGeuV/4p5LI8B17xGBQTfiiOe7S8fUh4XLsDRMqXTzHPUfkbwHfLexsXyCedxeAFiko=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1915.namprd11.prod.outlook.com (2603:10b6:3:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Mon, 23 May
 2022 11:47:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 11:47:56 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <palmer@rivosinc.com>,
 <palmer@dabbelt.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
 <Daire.McNamara@microchip.com>, <Cyril.Jean@microchip.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <heiko@sntech.de>, <arnd@arndb.de>
Subject: Re: [PATCH v5 00/10] PolarFire SoC dt for 5.19
Thread-Topic: [PATCH v5 00/10] PolarFire SoC dt for 5.19
Thread-Index: AQHYY7DQ3kLmJTwM1kCphTDz2RbFs60sbhUA
Date: Mon, 23 May 2022 11:47:55 +0000
Message-ID: <3cf58174-1ddd-219f-9f14-4d0015f697e7@microchip.com>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
In-Reply-To: <20220509142610.128590-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 776081ab-31ce-4fd3-3217-08da3cb213bf
x-ms-traffictypediagnostic: DM5PR11MB1915:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1915A1902F8319DBBC660D3B98D49@DM5PR11MB1915.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kKXEeUyosU36R65jnVOaLaJrswp2hl5kHDYkBC1+cFIAeIIH3XWL4M5aWAMDTazifpYZOcQdyAR7OAfapvzubq7byAkyBFwO1USqtBxxM4tzUeiJnwXBjgvznxbqSK65aVFyk9z1fJ7KQ3U3G6YuguisbhFsoUUp4UPrQqFXLifx3Ip4xDhxbm2P3FFL8MmUQCOvdfhVcJPGXDRR1NCe6A63RWtoFaQHR5n18huy207u0znkm10W2qudZdjUEolODDt2kkcy974ZMzsEttbzR8Q6oAjDSJTKzC1gc+I9iXWQxLSAR3riiu6r/Q6zLEqKDXplhV996ezepE97e5tshQJyIggjHKuFDYgk6BjieRCGAd4Dn6CXj2KF7UGm3bG0znUQKjTUGNnMFjGo6E/2b/9QsPFHDoJ6Wpmdsa6jjHguRe+0S33b2BRrr3fErERm1KjHKkBGODK8HPSx2zR3sKq6em8pR8R9RgS6PqJPYLULF0p+WxbwPDlDmJNakDg8R2exbyDn20Dp3QvgR3acIoOxc3HuNXW873lpGyir0J+3YN0PH3E5VLmHAnml6St4OJ6JESMBza6XhluPNke1K0C5PZG83lN/1uybeiu8/T4U/pp98tio1o003Jv+HgUiLI6Lmyf655FTGaN/FvhkmJrJI2HXeBQD3E205XxjhraxWhWyPyQYqjzfMsCw49FgrifnJkgNE/9d1DSwctH/wdPN8zNL4S+jKxDbz3ZWNahJVmvtkUrSapr7uHE1xV7hyxslv1MNwBkCeXsapctQCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(38100700002)(83380400001)(110136005)(54906003)(122000001)(38070700005)(4326008)(8676002)(64756008)(86362001)(2616005)(66446008)(91956017)(66946007)(66556008)(66476007)(76116006)(31696002)(186003)(6486002)(508600001)(71200400001)(26005)(6512007)(6506007)(53546011)(8936002)(31686004)(2906002)(7416002)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0Z4Vis0MlVCd1F1STNaWnQ0SFIwYmpQQVA0eHlhSmxlbW00d0hleTZhQklD?=
 =?utf-8?B?R011V05xamczMVBxNlNxcndQTnBOZFBiNWhjUWNnczVZdnp3Vlo0L2h5YXo1?=
 =?utf-8?B?RnNwSWRwYkRINHltNTJndm5HSVdpOXIxUnIvM090bTdna2U0QlA4VUVXVG5V?=
 =?utf-8?B?VWFKM2NUVDJtYUxMamZsUDRDTUlMODVETFlBTWh5QzdLaXhWc1V4U081b2dt?=
 =?utf-8?B?Rml2T3NVR0hINTVuU1U4NEdORHNvSy8wSGlLcll2dWpRWHZOM1pOZmhMRkg3?=
 =?utf-8?B?cHM3REZENnVWOE9NRlQ5N0k4UlYxekhKUlRDczJMQXNRUHJFTTNjMXBoNko3?=
 =?utf-8?B?N0VNclZMTklFc3p0bE1BNGRYNXcwQ2ppTTBKMXR4b3hPQkVDdGdIbEpBQVJr?=
 =?utf-8?B?S3hUR2VXT0JpRzllYTB2NXpRYjVUU0R3NHI4SEJER0FPUWtPYjZmb0hXL2di?=
 =?utf-8?B?SzdndkFJR2N3VGFReUVmVHc3MTFzcjJKaTMwNFNnNVdsbUF1RkVHVEFsQ0JU?=
 =?utf-8?B?M0x0eGt6UWVmTWNlaytndVVLb2FCb1daU2JkR0h6VnJOTmVGRWVlYzRRR3dw?=
 =?utf-8?B?UnF1TFlJbzNLK05xZ21hKzJSYktrUDQ4TWdLcXpYbm5aSmNkdDVEMUJON1E0?=
 =?utf-8?B?Y3JTaUJta2svZHR1Wkk2TEdZamhaS2I2M3p0dkFJaFVydmt5cjNOcEtpWDlQ?=
 =?utf-8?B?alh1cWZlZm5zMVR2clc4VlhHMnM0MWZwNjJXeE12dVF5dmxhdndzbzVaSUxv?=
 =?utf-8?B?aW9yTkZoYStsb3ZBSHFOc2d6eDg4b0JCRmFjSXI2cDQ5bkkra0E5dDVLU2Nq?=
 =?utf-8?B?dTZvd1pIaWpyWUtucERQK1huMDdzZEx6b082bVpldHZzM2NvcVdpYUxYQ3RI?=
 =?utf-8?B?czM0cTNhVkVPUGc2TmNNSGg4cWZDbGZOMnlrWGs3a0FXRWErSlFnVzgzRUl5?=
 =?utf-8?B?b0RPQlNuS1ZqdUY4SThTMGk2bFdJUHVaWExQYUliN2IzdGYzdjdib3NOOEVn?=
 =?utf-8?B?SEo5SmlSSjUxL0JTVHQrRjc5ODNVbWc2NkNYOExldUZqNnI1cTF0VGZzdHRE?=
 =?utf-8?B?MEYxeUhCVHJoRis1bW5sR0h5SThMUE00bFZGN3ZIeW5aZkZHWnpkeWFEN1JF?=
 =?utf-8?B?dEJ3WG1wZ0xnZnJvbE56T01id2s0am5xZVplNU80UjZ3OWdOMlV6RC9EbWth?=
 =?utf-8?B?aXgxOTliTU1vMDRZR2tOLzlBaCtGYUZaSndsdGNac2lRck5xdFlPbFI1M0pq?=
 =?utf-8?B?NHY0V1ZJY3dhVzQvcDYyOVVRRnkzaUR0cWV2VUNRWjdYSjZOVldhbjNyK1F6?=
 =?utf-8?B?NzFURnhBajhSelRBTHlBbENTVms2ZzNSaUgzNFlqdXUyVTFhTmFkNWxGeHgr?=
 =?utf-8?B?R0xFenF0UzlmbmJjL2Y3WTZlcHdyZ1pYOWpPblNYZjBNU09Ua1JuYWpNSnJ0?=
 =?utf-8?B?QmF0aTZJMThtdHhWS0tZTWh5QWtmZXE2TzhWcThGeGc5UC90eFgyM0pWYUZk?=
 =?utf-8?B?OTdWL0pqVjUzVFoxTE5IMi9zTzVKRXFvSmg2TG04Z1E0RXZnaGdUaGN3OVY4?=
 =?utf-8?B?OVU3NmNEQ01SWFpxK1ZYUFBnbG0wdnh0d28wb3Rpd0Z2c3BZeDV6TXNMdzJ1?=
 =?utf-8?B?TGJrd0JCSUJPa3dLUFhSdW5yemVobEhUY3FsQUYrMWZDdzNyM0tadGR1U25D?=
 =?utf-8?B?ZGtuS0poNjdLcDc1QjVweDZGL245Mlg3U3dpOEkwQUpic3R5YXMyWFRYQVVi?=
 =?utf-8?B?MHpsTVNUb1BvYnZOK04zZkNaQmlvSWJFV3hxRWxKRkdzdWNNdk1WbXkxS2xx?=
 =?utf-8?B?Tkpoa3Rydmo3NGFjblBNS3ZMVVNHZ0tRUkIxcVB5LzF4MXBLMHQ4WklFSnNF?=
 =?utf-8?B?RWF4a0JOVk9KaDFtamxpanhUVUloTFArRXgrQi9qTzg1Ri9qNHdGdm1Sak4w?=
 =?utf-8?B?d0U3ZldGRC9FSUUxUXM3a0dzM2U5SWo5NjBsb2dvcEF5MWoydGlDY2FFTVBr?=
 =?utf-8?B?M2NyVDVHbk5KWU9qOXIzdzZ3NWRSQXIwVUt3VHNHY3JWUS9ZK0EzYzV0alpi?=
 =?utf-8?B?UjhKd0s2c1ZtL24wbjN4NlowUkxWUnlnaFlJZzg4RFdDNmxtdWpFR1BMSWl0?=
 =?utf-8?B?ZGZSVmMxUEgwVXo3ODAzYjRlN3NMSEwzSHRFdVc5WG5PbXh2NUpveDdIay9z?=
 =?utf-8?B?SWdwU2NLbVd2eVlKdnk2RU5PN2p1amxNdGNOTDYwL2hyOU43Sy9MOUdvWUhp?=
 =?utf-8?B?M1J1dVB3ME1aV2NvekdVRHUrbGp2NFlmUnRWYVA0UFg0M2NTMCtsYS81Z21T?=
 =?utf-8?B?cTdvUDhBZXczVmIyWDdvVDJ6bXdDWUxYVS9WSFdMdlk0ajhtL3Fsdz09?=
Content-ID: <8E47401514341B4A9A98C634C6FADF5C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776081ab-31ce-4fd3-3217-08da3cb213bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 11:47:55.9176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwuNea9eby6v6EPXtOXVnrruu7xIblSq8dxp0xFLlUcaKiFb9hPiEAVUww6sZfwQmmlyeB2v2kT0Gjm0BfNPseQ1fDWAg+d+ddVM6gz1VJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_044812_855274_13650973 
X-CRM114-Status: GOOD (  25.72  )
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

On 09/05/2022 15:26, Conor Dooley wrote:
> Hey all,
> Got a few PolarFire SoC device tree related changes here for 5.19.

Hey Palmer,
I know you're busy etc but I had been hoping you'd take this for
5.19. I know it's late, so nw if it's too late.
Thanks,
Conor.

> 
> Firstly, patches 1 & 2 of this series supersede [0] & are unchanged
> compared to that submission, figured it would just be easier to keep
> all the changes in one series.
> 
> As discussed on irc, patch 3 removes the duplicated "microchip" from
> the device tree files so that they follow a soc-board.dts & a
> soc{,-fabric}.dtsi format.
> 
> Patch 5 makes the fabric dtsi board specific by renaming the file to
> mpfs-icicle-kit-fabric.dtsi & including it in the dts rather than
> mpfs.dtsi. Additionally this will allow other boards to define their
> own reference fabric design. A revision specific compatible, added in
> patch 4, is added to the dt also.
> 
> The remainder of the series adds a bare minimum devicetree for the
> Sundance Polarberry.
> 
> Thanks,
> Conor.
> 
> Changes since v4:
> - Whitespace and status ordering changes in the polarberry dt pointed
>    out by Heiko
> - A new patch for same whitspace and status order changes, but applied
>    to the icicle dt
> - A reordering of the icicle dt alphabetically to match the formatting
>    of the polarberry dt
> 
> Changes since v3:
> - remove an extra line of wshitespace added to dt-binding
> - remove unneeded "okay" status & sort status to node end
> - sort polarberry dts entries in ~alphabetical order
> - add a comment explaining why the second mac (mac0) is disabled on
>    polarberry
> 
> Changes since v2:
> - make ,icicle-reference compatible with ,mpfs & put it inside the enum
> 
> Changes since v1:
> - fixed whitespace problems in the polarberry dts
> - disabled mac0 for the polarberry as its port is on the optional
>    carrier board
> 
> Conor Dooley (10):
>    riscv: dts: microchip: remove icicle memory clocks
>    riscv: dts: microchip: move sysctrlr out of soc bus
>    riscv: dts: microchip: remove soc vendor from filenames
>    dt-bindings: riscv: microchip: document icicle reference design
>    riscv: dts: microchip: make the fabric dtsi board specific
>    dt-bindings: vendor-prefixes: add Sundance DSP
>    dt-bindings: riscv: microchip: add polarberry compatible string
>    riscv: dts: microchip: add the sundance polarberry
>    riscv: microchip: icicle: readability fixes
>    riscv: dts: icicle: sort nodes alphabetically
> 
>   .../devicetree/bindings/riscv/microchip.yaml  |   2 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/riscv/boot/dts/microchip/Makefile        |   3 +-
>   ...abric.dtsi => mpfs-icicle-kit-fabric.dtsi} |   2 +
>   ...pfs-icicle-kit.dts => mpfs-icicle-kit.dts} | 105 +++++++++---------
>   .../dts/microchip/mpfs-polarberry-fabric.dtsi |  16 +++
>   .../boot/dts/microchip/mpfs-polarberry.dts    |  99 +++++++++++++++++
>   .../{microchip-mpfs.dtsi => mpfs.dtsi}        |  11 +-
>   8 files changed, 181 insertions(+), 59 deletions(-)
>   rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
>   rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (95%)
>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
>   rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (98%)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
