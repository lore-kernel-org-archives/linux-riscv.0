Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B8DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnWeh+kPMqHlPjo/ataHtoaRE9S8cCZ+i6UfmJyEYRg=; b=B/ng6VmE8U8YQT
	4UeLFSpoDzQn5gE9PrzlAyII4LEtRr3/saKrbBt1qgb0sKiKG5hBXN738iS2ydtrbzVr1tL6M0nLH
	sFztbqsNt0Qqn1HQKO/QknA8dBN+ZsP9zcGUNGeMxbXjeNROtzrnkX9bn3MTbx/Cyv9Gh3vqKGXo3
	joPzD2fitcT+YGRmbE39sIZe/oQUiGTmQ2tzSfAt24i6M42p5gAPC5uucykQB9y9fQ3tN63aKjW9h
	kYxz9tz+Fec/sk+zzGGEG0ti/fUOg+BgC0K7AOhDDep7VTNMK9/IsupvOn54mdgrEA4HifYjtY9sn
	Pa6KlN1fvdXeU9w3JWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzDfg-0017lY-Ll; Mon, 20 Dec 2021 08:05:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzDfd-0017k8-9N
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 08:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639987521; x=1671523521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wHnpscFXlSZVC6AWTaM4GTGTdDe5nVOTbhFzAwoeR3I=;
 b=pUL/bdnK1nV2tl5wbFm3NUMhrsxkjLySUSHUspqD2pRHvqNbgjPb09wf
 qGKeb8EriG0Mn1Bev7yNj4D0JweJ3AE61oi/obJ7uZvMcp4IS42Gz142A
 qcYeoXjrxjK31doYNirhUOd/ntgCk5mESj5jU+EqaQFk5cb72/qu5yOTD
 3H0bDAzznTa/GijL84MqpK6FMCsL6tPzAWcVHsGyKYWqUP6N59aAGJegu
 P1IK1cE987I+nVi1Q7kh092MTiBs6mgPcOtlTuoUlo6eYPDqqRWM3Ql7F
 /Ir1+Fup/QtWky5CMVNdLg+zwoI6LrPRb2GDEJshW0p/NHuaT7xo/pdOV A==;
IronPort-SDR: KSMuJTqJsp1pIgZMEqcypuAVclu2TmHHJkdUC7xZcDsTHZqNG0+b/Rmpw+gJCHhIE6G0MUuLeB
 coUjTcudZSUtx1MS5BWDNPpaWlgtweHqnkeD7CorBEkN9bKTMc3yQH8pzelxYYRPhls/dWWvx3
 s9L6CoHiws2Hx95uVXCrkCOjNTNGzlccSdckD3FUs0esM0DpI062JN3OD7wOSppbdXy2yIdCP6
 pqAvcmY0ZsIJkLv9bmHx5j2ZEMyI/CcxKMjiVKQh6O5c8UF9RxPlb6wSWjsTkm6JuRdm+Paz8U
 OZ5KXfUrUBHfF7pTvhw69Fz1
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; d="scan'208";a="142948277"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 01:05:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 01:05:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Dec 2021 01:05:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7koHassZOrASmQ6TjoJTwfyqnRiWP/Bc1kmN5w1JsAO1idVqAvEmLOQMqfpLg+LpcJYsmW6M/hfxD0/8rzen6Svf8OnR42E2iJMjULMDvjjusxxgD2cuvDoEStSC4DCSkHo4ADP1IqTJRtYOtjuVZMbSWW3BeLcuU/7KAdwv4Rk9xsCKFk4qDImuAkxhoxDBdWIS2GhjUnNgfNwry6HrhbwchbVs2HasgWrgEXkhx2O3feIstJe/STJ47HlLelO6rcL8bGFCSSLoWaR91IdeUotOfsuW0W+49JLyU6fxzGWcu1Z5ixtywVEZaGCtRmxOI1E1zUVFILU8Z8jym1lBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHnpscFXlSZVC6AWTaM4GTGTdDe5nVOTbhFzAwoeR3I=;
 b=NtHPQ3/M4YqoLAraUaHTJT5tCFDn8p6/VFCLLFV6/Gi5H8EWlg1mgHR+BUako3sXVNicheCYamaiY8rmzIY37DdDsYi4V9pAYS44pciSzRQa0rgUKXgEiRf7z9z0deytXa0AZCdh4+nSZuGXfsHsDRHphqIuT83U59Qi37meLsJZDjTJOFJ2mbB8mrrLgSvAlTqbUQOIGBFh2ktO9vyneFD3N/zHmuk+Cu9xbjCZHpsoQlF1abvq/xBRYudro3UkVxz+pF9mZjRQQ4QM4L5bnvLNFIITuNtoNycjYRarPKSizBJY1chVTzmUDWYOhwNiTnO6btU3sNwXQtE8CFM6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHnpscFXlSZVC6AWTaM4GTGTdDe5nVOTbhFzAwoeR3I=;
 b=VE/nA+/kW2hGNSybP0xIFXCxvLQhilDaKKohS0AaLjioE6jOc9KJvJWskTZSqq7KbT6NxAsUmNPAhUlx1PBM44eQwLc3C9jOjvT3+3BAph0gQnZ/DvzstuCivWGH0cRHMqzWiBD9Mz+obsUaA2yOOrtTwWIWl/0Bpt8LKvCJAu0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 08:05:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 08:05:13 +0000
From: <Conor.Dooley@microchip.com>
To: <broonie@kernel.org>
CC: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <gregkh@linuxfoundation.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
 <geert@linux-m68k.org>, <bin.meng@windriver.com>, <heiko@sntech.de>,
 <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
 <Ivan.Griffin@microchip.com>, <atish.patra@wdc.com>
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Thread-Topic: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Thread-Index: AQHX8ykv6sbPo1+d0UqqLmeeX2B3NKw2iOgAgAAHFACAAABvgIAEemoA
Date: Mon, 20 Dec 2021 08:05:13 +0000
Message-ID: <2981d13d-13c7-f455-722e-778fb07f170f@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
 <YbxxrlmYGC3Pg8+j@sirena.org.uk>
 <606633c8-6cd6-af3a-4d6a-bb3058a64026@microchip.com>
 <Ybx3+3QaVe2lCcQP@sirena.org.uk>
In-Reply-To: <Ybx3+3QaVe2lCcQP@sirena.org.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea58834-ac3c-463a-7c6c-08d9c38f7354
x-ms-traffictypediagnostic: MW3PR11MB4634:EE_
x-microsoft-antispam-prvs: <MW3PR11MB4634FBED18470B63A2753634987B9@MW3PR11MB4634.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8jB2hhXBVUtTlu55DacEncdR3v8gf9L94wJ/Og+TsAjtk2TuFZCKOcU5fm91BtUIZ2PyOOBuSddh5j4wzn095mADXoICWkK9NbSyvY6sThdOmelZ44nZdOv+cLf+4n5dW0bNFkiwfLNkqELGwgE2fC+cHEqPofXW2AWcP935/ax4sY+t/H5DtsSsSFqD6BUvipHkFf00B+MdHEETgmIBnX3PEH5O/jVGfzLABrKAxIJwKD0WCaCqF8emRuzjtrNhZavqVDCb8HjYU421IyOFhd2wuDgPEJsh3vWdGBB/z6+O7LLZLefDTpFWtwa9uT7zw0CVVIb1xDxqOx0PZfO4BZfZQHRWr0Ur+DVjQ2uFHmlgGS4uS0tRdMiQ9stzSS07Q0yR1c8y4NPQBFBz6LYloJEGD3+D7uiJldm9dUzjfFiePXcS/vNwpfwK+G4XGVduHShfTkVmvVbbKFEfTgKZcbU5aP1hcdvwm8Zm6ZeUkvvWaa0Mqo1M/b5HOUnPmlmmHiTzEahzJSvfCncBk7Bz17yySOHi5AN8iVyQWFO1XVFW0QO0AIhJKUJeQJxJlk0iDzGXVe39+2OOt7ThQMWQNEfa/e6qNDmPe7qLnoTHkSBxSYsw6TTriYGzmYViI6t0Ss6kLDEER+sqJV7q8vCmQl4KowwgfpAU9XR7uwZ9yoXobhjMf1LLuien5ushEBXXqI4OXptuCuUYMLp5f5yOzGggUzn07eBRBLq38hpER6fYOxRGIy6MjzSK+oUW4SFfbIh7aQ0STB326cV3JAoEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(4744005)(31686004)(38070700005)(86362001)(5660300002)(66556008)(66946007)(4326008)(36756003)(66446008)(76116006)(6506007)(91956017)(8676002)(186003)(53546011)(64756008)(66476007)(6486002)(6916009)(122000001)(54906003)(2616005)(8936002)(31696002)(508600001)(38100700002)(7416002)(2906002)(71200400001)(316002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?sG/Z1ifRiyJgKgg4hkAfwK2/rkoePAu416Z/A9KhbYZvHImDqj5o54Oo?=
 =?Windows-1252?Q?u1FaWVSTgatc4XUz7BTeFv7af3t3A2zL46gCDLM4FIjmT4FzOXx5flvr?=
 =?Windows-1252?Q?WqdGRk/ArmtQsVjSzacDhoBykAD2cMhFJAYEzaoP/LAJaNoE50Sae69m?=
 =?Windows-1252?Q?HVPzbw1qqtdFRKuY/gtQzgZ0YDp44Lx+2m7tAQ6DHzo8xjgBahcTKceo?=
 =?Windows-1252?Q?ovwjg133YruZxKO5qk6yWgszscp+ARa1/1DjXA7wbg29LNW+f+w2/CiH?=
 =?Windows-1252?Q?5lNJEOau3t+X/Jk7q9ID5LIE0bZbO3/A1bMWC4FneMsHz9UF1qT4kE/N?=
 =?Windows-1252?Q?MmJk4lC5002OHPc5DepJiTrC9TAblKCMHrOtZArmbKKjEDd9VUZvSE0M?=
 =?Windows-1252?Q?Tj+GRMMIrGlk9nOYZgLqZf9so7hBhiHTCztbhIWuC3J/Tc+Js8E0QJ5h?=
 =?Windows-1252?Q?O2gMk7KluXFLdC9JWXv8Ckpsu94IS7hoa2PuSC2XdM+Hi5ZOkOXMDpf0?=
 =?Windows-1252?Q?MZSJcgusNTNgIDYHHMNFAxLm12rri0BSnYAl6sFvMTYJZ3FuklzP9y5Q?=
 =?Windows-1252?Q?GU2/Mj1E5iOQJdhJXPWcu0pVEJkAca6cQt4KOC/QdNfMoW+wnkdOEjTY?=
 =?Windows-1252?Q?8r/0miGWZoTo1mssbpBKrS0Ei1gJgKCTBkvNO4SM5UIUhfzvywi81sR/?=
 =?Windows-1252?Q?guwQTAqWW/DDHoktahtnUek4wlz6H2d5RtejNLOkbwvYjjPiBfAyEy1/?=
 =?Windows-1252?Q?vPRPAppj/1ORh9SjetU9PHSjAUNFgHlptXVO92oUt4hUgHAtWq4gp+Bu?=
 =?Windows-1252?Q?EcAzkR4JytciPF7rhlc4yRli5zfi2kMj1qH+xGT5kuUVnbZqdIcOzv1y?=
 =?Windows-1252?Q?P6pG+oqGDbsUJSlwjyk9aMW2WbOhLNCzVrFtEKlbNs3bhP4vpreeJz64?=
 =?Windows-1252?Q?OO9UDl/VV3UFWKKS/Xf4dUUNF/66oBOI9pSgyiAxuEdO6EMRYe83rRPd?=
 =?Windows-1252?Q?MnsH7pkf/EyAkOAkycSZZFx/dl2hLILLc81JNA+b9SsDRJVYxQOd+zRe?=
 =?Windows-1252?Q?ppF/UsZ7iOkBpBylkjzWoJqj5eeJIN6zgy3lM+bwDirNQ/fUDbH7MRM1?=
 =?Windows-1252?Q?LIFicjb+szHu1zb3CDOxI23WgKlRSUSMHcrozcvomp/YbMF/dw5vHsxt?=
 =?Windows-1252?Q?s5zB82whQavx3whZMQy5GX+bCSek7etM+Nd0lNmwjZc3hZ9c1k0u1OFT?=
 =?Windows-1252?Q?kKCey3o8LlpIJzxoNqLG+WF7LMjcuIjY9g65Y6fYbeaJriizcJg/Dai9?=
 =?Windows-1252?Q?xyglk1rFa+3pbWWszBsTrPNitS7ec5XLEN5Vnn9z4VSeSt0qgQ0dHXAt?=
 =?Windows-1252?Q?nNXAIKAR6qgzxq2rWVLXvz4Kc/PIXyFSNwfhT/6XTPpETVH2IKNjwoNi?=
 =?Windows-1252?Q?Y7vh6HKraG6V+TWwW5Rq0MWdBePrOhoQfCElUmbL5AVzcoB25jN4CIxt?=
 =?Windows-1252?Q?ox8q2FHJcYmHJfQNiwBT/u3m4ivwtJuYEW+Ypij+pVNygn4tdgtBKnOy?=
 =?Windows-1252?Q?648LE5N8ndnrj+1sFs6ejbylpFr/JMAcaHtHIVh2iKn29WYe9u48kane?=
 =?Windows-1252?Q?oIByX0JNyX4kKKtO5CNdhWH13E+qsrbZQytu8mvfL0HvJU720ICg2/FZ?=
 =?Windows-1252?Q?WEwGHPhBQ/eeOuP4lYNuP7QlyNSfFQUoI26Ju5pxepnIE+h2pRkLGGQl?=
 =?Windows-1252?Q?Or8XV53HUDvOPs9yWoFKhcxyabfDfQENHy8mXAjZ0uswNx+FkVxjJCEf?=
 =?Windows-1252?Q?h/jKDg=3D=3D?=
Content-ID: <4719C4EB9F0F6741A01BFF335C8421B5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea58834-ac3c-463a-7c6c-08d9c38f7354
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 08:05:13.0886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16SjlWGnaSDKE6kgLOsZLyD145gznsFZvjHMH92lODt08IYgDdGm3P1nBhZiAGXBzLROVlxRricbce/ghNh0bIi1etoqC0U8vlVA2vDRMRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_000521_674402_B7E9B835 
X-CRM114-Status: GOOD (  12.38  )
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

On 17/12/2021 11:43, Mark Brown wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you 
know the content is safe
>
> On Fri, Dec 17, 2021 at 11:40:29AM +0000, Conor.Dooley@microchip.com 
wrote:
>> On 17/12/2021 11:17, Mark Brown wrote:
>>> Why do you need this property in the DT - isn't the number of chip
>>> selects in the IP a fixes property?
>>
>> Nope! It's an IP that's intended for use in FPGAs so the number of
>> selects may (and does) vary based on implementation.
>
> That doesn't explain why the number is needed in the binding - why do
> you need this property in the DT?

Took another look at the IP core configuration & I think you're right 
and that property can be dropped. The register responsible for CS 
control will not be optimised away even if the CS is not used & the 
worst outcome is that nothing will happen.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
