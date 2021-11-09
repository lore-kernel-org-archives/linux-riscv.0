Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD25C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 15:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFE36128E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DFE36128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yooi9nHBLNVjr9R34ItI9bcDgikzbvAKEW99a1+2z0=; b=FSPDMqxxTdaKjP
	aWNxSFo2ykO72ffFPR+LMAgkZOAHoDDna4evddqcwv6oXaXcLkjn+ANIuMazMKEBeq2eRuOht5NxU
	Y9+VQur85VileHDGyNtJkl59nUJP8g45ZndNgxNUPxFZ4IbE8oFzZYASP4T7EKGN70Ld9LEb5nH7w
	grcD9J79Igu27ByKUhXEZXlfgNp5/6b+S4qg++trSBuCdTBBkKMqPpcA/dhYx1ZWR4ZNamH90uVW8
	RArN+3aK98voJ9ddJtGoLijV6qf1gnLAUVJ7dOMOTXaa7ZmiqJw6Thu2QwNB2AEQDxQKl26INQOvJ
	gFOA1cL8u7iAQeLhpfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkSvn-002YEs-5u; Tue, 09 Nov 2021 15:21:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkSvj-002YCX-W5
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 15:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636471259; x=1668007259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=THD/+EONdemloa8gtl+1AWVD4B+VPO+7HErc1KFjOg8=;
 b=uhQYttMMj1O8I0+ytJCgkM5k2BkGGhu0gSPap9N3NiBcxRpBwOsavoFB
 oGQFicMnqLMeqH9BH9GA671dOMT3g/a7FnaLQ+T8QS2rciQro5ag4fDpz
 Dqz9hF8acs+vKZqG7/wdtA6M+J2w0pB+nyX/HSl2eJto4VRFYmyD1Rbxk
 goDSO0xS9DhoBKVON0ifgv+mBBvLxlCTTO/5URzdQfBDAtHOQf2V+1jcW
 6ZflwbCFacYSV+QfFN7DZyTaTHmHfilQC5KRvEy3hUlq6ewiIMGA0L6gn
 46aKpRJAC9x7SJROF2zGN9RXkr8oEBgKyiMrh3qQgTBe1XMk5d0JvzOEl w==;
IronPort-SDR: 1/ESdcd1Cvr527XVV1cRytQAgpTO6xl29EogDtCN3Uv0YTe36p00AitzTO6szVRSTgpyK61koo
 DQFrlRkD8dm523DQkkt5V0HTT5gDLZi2hoP95PSlSf0HS8/1gT2xLUBGt2XX9BZ2jGspcfG++r
 G/mVe4iRfZ/dd3t+eFAHbUaUrXi5JB1vqGGxUoglcgsBAsYbYxRSRI1AXgNqgkl8Pq3RFQCVCE
 64yY4CUuVdLbcFh49FOD6Okbxv6p81hrqGGI7Q+9iEZgm/qnFssEhuMXgpKqSmYEYP+OtCFLmQ
 RiRoGK5RSZaphFfhcE6AsMne
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="151282108"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 08:20:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 08:20:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 08:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRl0VWAqhRgO4OJdKBIWgyBsuCa6R0fnsRrEVn2ttk1heIZYEnBpSvosBqCF8RfZrvigHfTo/jrbE9yn/dx/dSS3uKK7ZyTbZdIJcc6xbKuA1Pcr2m1Nr/UsuZ5sSDVHBuUs1pFVS4RiKHF44jMpmX35NS6sOglY7y6fPZkxjmwfM6TF2vsy0IB3JSMxOOfX7MbnmPjFAOql1QehhNzSJpPHrmbL+YlQFa+i64zA/YGDER+gY+BTyn8qYOi6pPS1zVFiR/6PHcSHF9UhOUKN0XVB9fJGMdYjciy4E8s4Zhsrc859KdTwcKF1nHpyDQDux1rwATYDrg7QTVE94X2AXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THD/+EONdemloa8gtl+1AWVD4B+VPO+7HErc1KFjOg8=;
 b=I9JGAPsfcAxWZMqtdjgDPbIFp0JtvYhhlee5L5E1LU4gAbskT/bbCyeTDfzYTIkZGVif2uCYJZ3jxm34XYngfrM/sm10wWRXZv5JgiPgopu9CVWEDuWLTnjEcUirulS2JMcu60Le1tIQ2I43Vxc/cQGQiOLRTyVDcOnWxdHQhlhv4VzDQiPGZj9N3Kj5NEL0Hs1YAg6sIgmYZpJsWCX7bxOISDy66x1+k+yHPgZuFRaPk+z3xGlEwRvK5v4O1pfewmb93jxUIajPKlBVivBBrMc675XcCb+UYhJi7Ru2fku8+CByEFNmDQ2XFCHW8Khl+o8juR/RoKU9Or3Ci4Nh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THD/+EONdemloa8gtl+1AWVD4B+VPO+7HErc1KFjOg8=;
 b=PMe0ljFD7N52sHzpTrDfc+t5IzHcxCwkclhAHM0fprXeUEjCCaBnCCWwQ+G6GQqvW3S5Tsw2B8MGCOJADKCoOb0Cd0CPLTpZ9mRBmKt5zYyu1Rk+SSVs8JJikTs/bkTuMU668A4d/iwybxwOC0vhKzSzbw0s+atyrR2OxFAJU1Q=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1888.namprd11.prod.outlook.com (2603:10b6:300:10e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 15:20:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 15:20:53 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
CC: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
 <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
Thread-Topic: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr
 compat string
Thread-Index: AQHX1LJNdMdlY4vowEeneOogTbWpzav635GAgABx/QA=
Date: Tue, 9 Nov 2021 15:20:53 +0000
Message-ID: <9067328e-6ed7-5ad0-a518-4d3d5b875087@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
 <CAMuHMdVx9BgCYHX5-Bwx1TzQzNK1+7cUWoWnOdMX31SJ22sMzg@mail.gmail.com>
In-Reply-To: <CAMuHMdVx9BgCYHX5-Bwx1TzQzNK1+7cUWoWnOdMX31SJ22sMzg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82e62115-390f-46fb-fddc-08d9a394850a
x-ms-traffictypediagnostic: MWHPR11MB1888:
x-microsoft-antispam-prvs: <MWHPR11MB18883B275693550C7EE2D84D98929@MWHPR11MB1888.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JZjVpH4+V5LaHPumuLtDa9qpyTXIabkUYqDEY6by9E8Y/IKbqnVbw36crH+OOLhgV7MbtMAmBzX9vDdZicu4XPKTOpodRyHC5XDxilABAD9vvRXgZgYYlXKivbci8jpB9dBj+XICb4QvD1cFumJM5qU8d4c8yun7Q1XTh4DY2i2wNu0YYhe5RyUB/f97/dn4hmTccSc0+kEG3aSfFns745Nu1OZTE6yeXPkDB9TER1C8jFrLT6Rqgy+gQ/i+vsJUmWLqxgMcRSHg2rBwbkSDyf/tstcfF9S1Ji1wvFl3or3WhUv7HYpbr0QapMCyo9xUSTGNW+LU7oUgJBLnScE9KrmBK0CQmwkg6OUlFUkjzZXjFBJC+FM5R7S1a7TYUlnpZb87J6+wVMR87q3emrO3QKG0QtaG/WN68dbSZI6lJNSEkwKsEsnrCTcG3IP4efapwm+J6mazx5TrpSE6Z3FRlsTS7gmy5Q7TA8bezmyncfyzCcYXZdclOQrD622mJAZXcvdZlC+k7JsUn85jb5i7KruxH89+0pou1++0EfCX9uTKwuRlHmrNAoRGL7TwkyhjWnoY6vdycOT7VlrUSo2XSwP23JIMjLCE9GChiAQFUGrc3qlhAOf2kLLI/U/qb/Lqbycr27VYoZbvI4lJGmF+bgVO+fVzl3MTTyEEJJ1arzADAVvmMFwLZ/rYIJnWYPWWfq0D19iECGL6QLTvw8HiVR1wyONRT+xjZi7hReRGJZBvwR9+Y+ooKe3rhG3Sy6l7UboFhB5/7MLQjs/gIztBTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(508600001)(4326008)(6916009)(2906002)(36756003)(6506007)(6486002)(53546011)(38070700005)(76116006)(5660300002)(26005)(86362001)(186003)(91956017)(38100700002)(15650500001)(66556008)(31696002)(66476007)(6512007)(8936002)(316002)(66446008)(31686004)(122000001)(71200400001)(64756008)(8676002)(83380400001)(7416002)(54906003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWtsUFZ5UDlQblZzamlUTjRNSUVFYjI2a1p3WlI1Z01HZjVvaGxvUkxHYnZU?=
 =?utf-8?B?OUNwZVFRMm9HKzgyL3RJdzZRUGxGN2dUUTAxc0ZGNEdWU01SQjMwdHBCb2Ix?=
 =?utf-8?B?U1hsVmhid09zelBSNjdYNTdFRWErdzlVWGZzSEVXRDRSazJzNnBqaURzWnhL?=
 =?utf-8?B?dTQzRDZhOXFtaE90UlFxQ0NwQkgxL0lqY1p5bUhSQWQ5dW41V051aVpacXp6?=
 =?utf-8?B?bEduUlJQTUpzbWhYVXUrY0ViRTlyTHJkNTdEc21WWnQvMW9FZ0paa1Z2dVBT?=
 =?utf-8?B?Y1FxbmlOSjhsOVpZNm1zYll3QUFyYmpyT3VKU3JybGRqVngvUDJ1c1hWOWZP?=
 =?utf-8?B?dnFPT2pzRXM2V0dUTEVoNWdjWWRTYW5EM29tZFpxUFg1MHhpb2JocjdIanpa?=
 =?utf-8?B?Z2xLQkNVeGhSYVFLWUJZMXZ2UHQxb29tbFdtcnhCMHdueHNPQjRKem5jTzNr?=
 =?utf-8?B?ekZHMUxSUE9zTzVzOXBscUQwOGxjSE1KYXJlOWcydGxMaGZXdldlMThLMGR3?=
 =?utf-8?B?Wk5OZU9aZFBCM015L0pjR2tqYUd5NkFtd3ZlaXJCZmFqRVdzaEMvNEdXUjFP?=
 =?utf-8?B?TlN3NlZWN0Z1K1A4SFpvdjUzMC9oK1lkQWdaSWtHNHdnSWFzM2tXK3FPUUlo?=
 =?utf-8?B?VnNSVG9PbDNReUZsU1Jnc2tQQ3dMa2hkS0tTNWlkSVo3TjBaYVVXWERmRjQ5?=
 =?utf-8?B?VnpGMGtWSlh0cFVGNmpZYWhzZFpBc0oyZDdRVjQ1SkxqUG5XRHhqckJOdVNZ?=
 =?utf-8?B?Ymx6QkN1MWpwNnpyeC9zU0xDT0hUOXlubTd2VE01ZzljM3lCWG9wRGdvS3Zs?=
 =?utf-8?B?T1h0ZEkweVhGL3M4UHFIWGlTUXRNRWJXaWtPRnA1ZFBCR2NUdXhSYThmN0xs?=
 =?utf-8?B?YlRPUXBLY09jbi83dHk2US9ldWhMUVFuWjRQNlpYVk5CaUxuL1dwYTUxY1Mz?=
 =?utf-8?B?WDN3NktnNCtPa2t5R05ucmhUQ3NLbFVoU1RJMEFpcjVRNGMyTXAySm92T1Zl?=
 =?utf-8?B?SDhxM1EzckV5bGRIRmFnRkxObGZpWnFGSXZmd2lHaUl4OHRDQ1dzZXN3cnZM?=
 =?utf-8?B?QVdSRElDK0tjV0xjdE9BZUJXV25aQXJYM2pLbnVWZlZISmNSbGxpbHo1S3ZQ?=
 =?utf-8?B?Uzk1Uzd2SEFkTDFKUmc2QVNueERRT3BCbW5TelZPT2NUNG5XV25DQXlUMURG?=
 =?utf-8?B?cG4yMWd0WDAzbWw0azgzVVkweW1MV3ZQSDhaMC94UHVGajdzN3paelNuYlZI?=
 =?utf-8?B?WFBlbG1mb1RNclJYOHBCRjlhdlloLzZZUnlnOGxrQkVmM0xRUDdZY0Qzc0Ro?=
 =?utf-8?B?SW1XTWxXZWtkdzRMUkxuNFY1U053VFVjdHU2b3RNVHpOd2YvNm9nZTBid3A0?=
 =?utf-8?B?a3BEMlRLWnhQNWgra2pZK2JqbURrdUNnMmpuS1JuVlpXZERoM0Z1eWJYVERY?=
 =?utf-8?B?Zm5jSjdlVlM0cFNSUkVyUlV3Q2JWQ3V4ajJRSFlhL0tDaG1HZTkvUlo4RE5L?=
 =?utf-8?B?SHJkTjRhSXJ5ZU9NQXJuQ3B5Yi9oeWozNFJhNG5QNmFyWEVhN2I4YjJYTU9T?=
 =?utf-8?B?bmxubjVBcExZaHpQeUUxUXVWQlN5NGRCV29kWFRlY1VFckR2ZVVjbFpkSm5o?=
 =?utf-8?B?U29XSFY0UVdCOXFrVTkwWDhvazlOYWRjRldieHk1cEtCYTFPMG9GalVFb1VI?=
 =?utf-8?B?SUhIVVZVSmNRaEQ4M3JFWENsblhuMlFXZ1h0cDRjeEFxc1Z0UTNwQTF0c2xt?=
 =?utf-8?B?eXhMaWFNaGM3SlhabHpCZTJMci92akhjZ3FLaDRpVmZaT3JzSnVxM3htME1k?=
 =?utf-8?B?Q0g2Z1FnNFhNY3BLYWtBNSs2VkduUUlzWUpuSjFCQ2xyOTBLM241Y1hkQVMw?=
 =?utf-8?B?MkE0SC9nUllkNzU2VkVKVnBFS2tuU2RoZHFpaUJZcUNqc01iMmo0dVU4Z054?=
 =?utf-8?B?aU5NSmVZbk8vV2pTZ0RMcGNPWVc1NEdobTROdi9zd3BHNkdqSnBZSmh4Vzl1?=
 =?utf-8?B?YXUrM2g1M0Z0WE11dnEwbzUvRTU1UWVuamM5bTRsbFRBWjE1eXJpOVg5SDZj?=
 =?utf-8?B?TzN6ekhRbzYwTWx2b1BLOVB5K0dHUTNwbk9FV2pCeEFpeHhlc3RKTCtMTFJJ?=
 =?utf-8?B?K1k1UU5uZVYxWExRaXRVSWJSdDBBZDF4L1pTZDVhQlY2aWpFNzVUM0JNM1JM?=
 =?utf-8?B?d2ZpNStWNHZNaUpWckEzcmtVWlpJSUpHcEJqbHdmREYzYUNsM0tTWkNyNjMx?=
 =?utf-8?B?OUdpOGo3czRFT2lFclNud3p4WEdnPT0=?=
Content-ID: <4A1B852F87C52A4E9FE560B4FD57E871@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e62115-390f-46fb-fddc-08d9a394850a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 15:20:53.0162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7ZlEhPnzv5f5V+4aC+/JWu0tUSzSBSEnb99UZhW+01KKjtOuTT/LM5/YNKXfZjilqZLyOoW/m93A2AsnmQG9t+4FLJ7XDol0ceIh6ourEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1888
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_072100_174720_090C5653 
X-CRM114-Status: GOOD (  23.01  )
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

On 09/11/2021 08:33, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Update 'compatible' strings for system controller drivers to the
>> approved Microchip name.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>
>>   properties:
>>     compatible:
>> -    const: microchip,polarfire-soc-mailbox
>> +    enum:
>> +      - microchip,polarfire-soc-mailbox
>> +      - microchip,mpfs-mailbox
> 
> Is there any point in keeping the old compatible value?
> Are there any real users? Most of the MPFS upstream DT is still in flux.
yeah, true. and now is as good a time as any to just outright change it.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
