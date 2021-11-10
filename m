Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D45C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 09:46:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C974661039
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 09:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C974661039
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpRRgXIoBKX0heaDuFwsxRnF64+zxYx0vQC9YPhZK1o=; b=oUKDspcLfjLyId
	2hCfgmc8NHC/sdiUo8Zgf3z4pe0F4/BDDz+Tse5EbbRBeo7kqfGQaRijuyPvfyGxZlDw1JycDMJfS
	WIqECm+oBr50T9jQ0But0v8Gk/IOh7cz+P0f0BdI+/Rp84l7aZHwdyWmTMNW6n5oM34vaB0027/Go
	cNXWxoULMBDCsh3eOJYS5ZLZKAN3CobpxHBpjGr6eaHDVuV03hEqFcEEjmeKP27wp5u2uGPGNHfZ3
	ZN33d1qWprps41qT4QVMSy4kjoHMnmCSVnZiFBh04i1nsQbLl308gefTwPQFxRr0T4k0d94BlHfYa
	75fa3UDi6rWp70IPub8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkkBh-0050t4-BA; Wed, 10 Nov 2021 09:46:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkkBd-0050rz-Q6
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 09:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636537593; x=1668073593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2cNqUGlbdW7H9+xSekOOrFNUqDwodPw9Jdx8Fn1BXtY=;
 b=ve1GxcqIyjm+IVoOiNNZDmpMO1t14YfXrZC0b1YWKHumaqpN96xgxFbh
 Urc1br0JNiNkOjF79sJV4d4B6io/w6sGWQ4La+fnqXiZeTb2mu5nMFOfj
 PqWVm5RDHhad+fZHlxCHz2/TukMX+aEWFmbdypNvgtKhWNk5MUYes+4Hm
 SewaUCSsQM5LQEvFRBjl3dMw0+gbYuIgvcLyIitslNyuutl/lfsaEW9FU
 EZH6yYStjDyMU4A3WTkGUiuFSUrMClllYF3r6mZ4AnHODacKW1q0UXknn
 YLccB0RCZi1TifyaBpQAq4xyaCTTjApzNXh0temgxqMHTjgk39MUtifnQ g==;
IronPort-SDR: tO3XEm+XN3LdfwtymiEMZkmfye+elt77GI/50F6IsFq7qgwfMvjF3vSRmWfGVjOZEUJvWo6/3i
 UE8GVHFW/uE/FJj+8SF2No6GYB7SHKf7QMfcxqLpSYkwaxTGA39HPpe0c/oB9y0wjCjbmmnw5N
 rhHwQbB/hlX8q8uSPeu4h6CsvDqLYgg2BXVwBkpXcPWVkuWtaToCRYzpY+BBVQ3NDFdCJJr2K0
 QFm63dRNyHn8f5LJVRB6HjppJWeMwZGRdrpfoLsZwlbr8vfxbHCHEcMxoWBPH93IIlpQzPbBf0
 1VmcjzdlvZTviuCLSwPXWH7v
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="151414323"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Nov 2021 02:46:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 02:46:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 10 Nov 2021 02:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiFoJf6MLQK4QekgImbFj85p8uLM5X7eFm1etsbCg4IXPL7yh1Ht6WDQ+1NUtxrBgwfdRNoZhEBZnLxZ0iGds2HPtfHvzhsc37/wDOwG6Q9WSU5aBPrWKeJWMBjVYl19Am9BA/Ez3tkjMz8ojTSsxKcfZNpclFlvzwpdEP/olC+trD513VcMnHa4gaZRe/uNWTWXBofucbmnkzQ4JtUgTgUW8ZabamtF1+HNfsdD/Sf/KRHJ14DArKVAlcjakM1ScKC9wqLYfe968QtChNE3rgNpSKpjexQT0xzjh0Z0+sWxQL88ZLyB+vCp+Lpawq5TVp0DIqKJ1+9vpIVMTUav7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cNqUGlbdW7H9+xSekOOrFNUqDwodPw9Jdx8Fn1BXtY=;
 b=JSKancrLMhR1lem1LyJQ/QbiskBOg7sJB+Ad3k/6bDBIYeFC2UfbHt+w61hOe+Z7p3ZklJRUsR3Cm63aCarvl9y5T5xJiHLXO1Y4FGJ7zvd6+Wiw+ju0VMp9oElAF/2Be3CxjQR0uv26RC6WWa98QhPljn6MdqKvayf/qTqxQRmZkjG0c1hxggTRjPbt8cTFbYbQpA5LZadeAzJ77j9l+izAEHSvD4H6MTMoqJdJdO59uW9a5Dr8ZLbtdMKqIgvdxsa3bNZW1dc7v3uBHtlNDPzHYA7XatPdGSp+aFReh4wkcTVRFHTsQGHSDwRKtKxdxd3GVQxTaRS0LHbTsdj1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cNqUGlbdW7H9+xSekOOrFNUqDwodPw9Jdx8Fn1BXtY=;
 b=CnqYVb1rV0AASKwBtnu/B8ZZuTpgGYQsAkC/v7HKJYu+1NNplvy1IDgeve8xV3xU3Qo48VK87+QdpLb9fAc4bM2SAGxnChL+pkoV/oqbVjaHFP2ZemgJZZ4CmhXwm3EOsLiSO/l6kSISEOtU+sg/l5NOk8jHNWZkZ+G8LWNDoQo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB2016.namprd11.prod.outlook.com (2603:10b6:300:26::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 09:46:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 09:46:24 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>
CC: <broonie@kernel.org>, <aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
 <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <jassisinghbrar@gmail.com>, 
 <atish.patra@wdc.com>, <Daire.McNamara@microchip.com>,
 <Lewis.Hanly@microchip.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <geert@linux-m68k.org>,
 <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <bin.meng@windriver.com>, <linux-i2c@vger.kernel.org>,
 <alexandre.belloni@bootlin.com>, <Ivan.Griffin@microchip.com>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <a.zummo@towertech.it>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Thread-Topic: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Thread-Index: AQHX1LJPDy+D8VJjOEmJwWP3EzXa3av6In2AgAEGMoCAAABzgIAACyQAgAEvmACAACKRgA==
Date: Wed, 10 Nov 2021 09:46:23 +0000
Message-ID: <9d6f2e66-860c-2b8a-0b45-7dc56dd5298f@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
 <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
 <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
 <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
In-Reply-To: <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1116c8a-3a64-4594-46c7-08d9a42ef54f
x-ms-traffictypediagnostic: MWHPR11MB2016:
x-microsoft-antispam-prvs: <MWHPR11MB20165FCA889AA05355C4F51D98939@MWHPR11MB2016.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J8izQeTk6Sdg6FY4FNDQmuN5NA2ulIryPmZG0zWuzsICl0Lv5CvCY3bNuqSX62x3C/tp/ZKuqvdfXoWThPMGLn7rrXzv/1N+lAN4IFwmDBrDdlNgWZalUVb04ORiFaDd/vTQBCTlsZRR4C+Q4oDGbkb/HMAdNpvNvJyDm7PNdSzn3aKfi55Ak1b14YDsP4PyNjrJur+UGmQ3ssflZuNdyo1gnvghgvHhDxqyHCG0ak4DROtgShfsWJ6TxdqXNXVbJghxC5Fo6Xz9SCmIk6P1mxVGoNvx1G9KWznUt4YBAMOm453CHUHuNnSf8dRSFsAgdD9UMPD+T7k5lotm3Km8jdhxSsnGezatUU/pUDAumtjT4LpjXvXzMuY/+ralfPzphONn+Lj3u55Faj8fI/WqEBccG+B5mzW/7hc5u43oqJFD8BQuSmrheFr593Rg4sZm2uNJcsQD1cgHN9I5zjZsRvyVx446kz/oHAfbWntsFtJ1nfQMoxHT9daDx6rExi6Jh1YxU4wZYWecQllWM85Y0+7u1Mby37kmdRQ/9S4A7dZmD2FTsSI/zGF2ot4TtSKaxcBjeYF9Y62Wk+3b5OcdL3aWn2KdIq0IdK8UZ5ovhetvSILU4dXCs2p2D0RYX5pVxl+rJWo4Q36oK3vPAbLXGIQ8PZ2/6zeUFLUHYUQUG5OrG6XYoi9fO0LPzw6jt+LGErGnvMFbHaIJOI2WmnjksMyfUDoSJVPDKTsAohOLWEFtoqV3853CtUqU8+xXUrwRazUlzIVj6WAYN2ia0wPbh0e7bUj6EJbV/iH7/1USBdJ5ADuXDu39Ho63+908UH2Ix8Rca9KDzk+MbArI5gXtdmHD6nsjZtw9wmYLzRP5PeB3d7nzA+ncWOKwNFsXmynpazYqTwO1wNUZ6ZSV25l6sQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(83380400001)(8936002)(8676002)(36756003)(38100700002)(91956017)(2906002)(76116006)(38070700005)(71200400001)(5660300002)(53546011)(26005)(6916009)(6512007)(6506007)(66946007)(508600001)(86362001)(66446008)(4326008)(66556008)(6486002)(186003)(7416002)(64756008)(122000001)(31686004)(66476007)(316002)(31696002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUd0NUl4d29vWjhKMGRpc1ZFZC9BVW9WREI4ZmsxWmhkNllHQW9jN3RCRFgr?=
 =?utf-8?B?S2hncjFUWjl3MllHeUNHYklBMXB2dWp0aHl6bUlTVEJZVmRwWERBUmlmczFC?=
 =?utf-8?B?WmNNdk9PT3h1RFRsOXE1blZUZkFOMTlKN25ZeFRDVmZEeDZFZXp1UUsvRkli?=
 =?utf-8?B?cVdnT1NxUlkvKzlRN04wczNDQ2hFcGI0aWFDTE9ZWmh6bDh4OWtML2FwV3lG?=
 =?utf-8?B?RjhSZDVGRFNmenBlNWRZNmVzdUlzUVpNc2xoLzI2d2t2bEE0MmRTN3l5NHQ4?=
 =?utf-8?B?NDNsbktoKzdHRzFGblNZQ2REUjJWdXc0Sy85M0VPNWovRG12ejJxd3NrUjFW?=
 =?utf-8?B?YTdtVXF6T0VldGh1OEdMSDFyc3ZMTFZ0STRlaDBmV1grcWZ1TmZzNWZXa0Jy?=
 =?utf-8?B?eE5yTFMweW0xa1ovZmkxamsxZE1TRnE3T3IxQmZITWF2bkMxOHp1K3Ria2hr?=
 =?utf-8?B?WEVYK214ZzQwZlpzMzNiT0d0ZGVMZm92aG1tUzlYWUR0QTdTd1c5OGNlcXVS?=
 =?utf-8?B?ZUliR0xNN1UwSG9iT0lwRUQ0K2tvMk1QMUNBQURNN2EvZGt3TXpWQ3RnRk1l?=
 =?utf-8?B?YmRUamZGY09DK1l3UWZ1V1YzaGZ1RjFaTGdsQnBkaml3ZnFIRnhxZHJRenB2?=
 =?utf-8?B?MWdhR09pMnBFL1F4M1ZGYUNvd2U5Q2MrY0h1ck1lQmNGZkJEcTlQd1NsbnJG?=
 =?utf-8?B?cEdHdTN2UkdMQXo4dHY5aXNJK2s0WkNWK2puaFQyMnBtTlZJcDc2c3RYUW4w?=
 =?utf-8?B?STJiUGQ1VkNRSHFOb0xRQm1xNDMrMHljMFNzVTFySGZKV0FUWDFYd1RzSW5k?=
 =?utf-8?B?ZzJsSkRYVTMwUkp0RWJUc0dCM0d6amJod0djcFd5TTlIZlZHNUkxVmxoRGtS?=
 =?utf-8?B?OTBaUGd6LzNxWEdpdm1PVnhmWUkvb0lqMitjRnkydDNRN0hMeHkxaXovazBZ?=
 =?utf-8?B?TUhOZG1za1BoaDhYZU83REVoWk9kSmxGR09BU1VqRG5wRnZnOThwTU91R2pm?=
 =?utf-8?B?RWwzYlhCS2NhbFlmaFNtZDAvRnZFUkZpL0RzOFZEYkJQeDQ2WTkwTXBMN1Np?=
 =?utf-8?B?TTNqT3dhS1Z2SnVxczNjMkdMclBQcTBBeDQ2cVdBaUErS1Vtb1VyY2VLRTRC?=
 =?utf-8?B?QnFrTEZtSHJRNVh5d01kS3d6cVA1ZWoySjFuSDlwTDd1cWdWaTVQMWxWejI4?=
 =?utf-8?B?bitKQVl3NjlnbDA3c2ZBN3hhUkRqcWlhRTRrSFUrL2VtT1lSWERjdk0vbTRV?=
 =?utf-8?B?T2loUzE0M2ZiZVRlY05MZzF5R0xneGt6a0RkL2F5T1MxRVpVZS82MXZnMkpK?=
 =?utf-8?B?cE5ndG9CaERMY3J0S3ZCL3F4eFlxa0NlY0ZWSFhpRlFjZkUwZHo5aDQ5M1cy?=
 =?utf-8?B?blFwVTlsbDBReTFheUtrNmg0K05UN3NiWEhOR0laR2NaVm5hMXZ6cWxrY0NI?=
 =?utf-8?B?YktFMXMwMUZaaFZVTnM4RXZLZzFLRXhjRGZvRzJTcUd1bTBtQVpLbHJkZHp0?=
 =?utf-8?B?WkRMT3lLdkJ6dEJlRFVSUnRsZW9EMkdZTGJvaG8yS3I2Y3BWSkNUanRxb1ZD?=
 =?utf-8?B?TkxlbVZNTzBERlJWUWVUbTNJTkg1TGFMRGJxRHFlUjlHYlgzbU54Z2hxTy82?=
 =?utf-8?B?eGxVSGdLS2xGQmVVNmVQelZaOW8wRmk2eXBXYTk1K3hoVG9ZRzR3R2VhdXBW?=
 =?utf-8?B?MkNla2d4cjhGdXhFZGo2NCsrRkx0MHBURU9KekMrbHdkampTckEwRFVMM3Nj?=
 =?utf-8?B?MVFQVzJ0T0FvdXhQeGxuREpvT0dOaVBtQ2lWOGxScUFFeUVkalRyWTFjLzRz?=
 =?utf-8?B?cnRRTWpCY0VTd0I0TDVGbGVNTEJJTGdSdXpIWHBTWFZxYU9QYi9VU2RsVkFO?=
 =?utf-8?B?VUYydkV1MlF6Y3orRE9jNVRpS1R4V1JoVldwT3NsVDFNOEJyTk1GK3FKMTF2?=
 =?utf-8?B?OE04QzNJTW94RnBiN2tFc3RPa2NDeUR3SmNUa0syc3dJNnU4YnIrcFdDYk9V?=
 =?utf-8?B?SzlVRFlCZUNmUlRHWTEwVTFVNHdUTkIwR0NtSUhFb3RSV3hnUEphcGtUU3Yx?=
 =?utf-8?B?TGxSbmNGQ0RoTzlWOWl1NlptMWpuUldjb2U3cFZIQzF2K294eTJ5WUNYZHMz?=
 =?utf-8?B?cEN4TFV6cGFqT0FEY01jVWFpMnh2TUhPYXJkMG1aWmNUZ3JSbjMyWDg5aTB1?=
 =?utf-8?B?QkpyQnp6U1NPcGVyWmNpUW1JRXJYN25mVXdyNFQ1MFNmVXZsd04yVWtLaHM4?=
 =?utf-8?B?M0JoWVRTcGliSUhuWDRkUTlqdEpBPT0=?=
Content-ID: <3A9E92F93211CF4C941A7E594D987D9B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1116c8a-3a64-4594-46c7-08d9a42ef54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 09:46:23.8858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uvuVhv4eTAq+mBkYyydM+f5Ya0hiZGQD3m5+7EBZPR7ztwyJaGFuRpRJ+Kg9dLQFn367vnvBmgDaRQ4GlKoPLPaOzWlg91WvVYOWBoGRXKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_014633_982907_43826DA3 
X-CRM114-Status: GOOD (  16.22  )
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

On 10/11/2021 07:43, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 09/11/2021 14:36, Conor.Dooley@microchip.com wrote:
>> On 09/11/2021 12:56, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 09/11/2021 13:54, Conor.Dooley@microchip.com wrote:
>>>> On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>
>>>>>> Add device tree bindings for the hardware rng device accessed via
>>>>>> the system services on the Microchip PolarFire SoC.
>>>>>>
>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>> ---
>>>>>>     .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>>>>>>     1 file changed, 31 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..e8ecb3538a86
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>>> @@ -0,0 +1,31 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>>>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>>>> +
>>>>>> +title: Microchip MPFS random number generator
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Conor Dooley <conor.dooley@microchip.com>
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: microchip,polarfire-soc-rng
>>>>>> +
>>>>>> +  syscontroller:
>>>>>> +    maxItems: 1
>>>>>> +    description: name of the system controller device node
>>>>>
>>>>> There are several issues with this:
>>>>> 1. You need to describe the type.
>>>>> 2. Description is not helpful (just copying the name of property) and
>>>>> actually misleading because you do not put there the name of device node.
>>>>> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
>>>>> please use existing syscon bindings.
>>>> 1 & 2 - Correct, it is bad & I'll write a better description for it.
>>>> 3 - Its a system controller implemented as a mailbox. The syscontroller
>>>> is the mailbox client, which the rng and generic drivers both use.
>>>
>>> I understood that pointed device node is a mailbox, not this node. But
>>> here, what is it here? How do you use it here?
>> The system controller is the means of access to the random number
>> generator. The phandle to the sys controller is provided here so that
>> the rng driver can locate the mailbox client through which it requests
>> random numbers.
> 
> I am asking this to understand whether there is a generic or existing
> property which should be used instead.
> 
> If I understand correctly, the rng driver needs a mailbox client?
Correct, it needs one. Binding for that is here:
Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> If it is a mailbox client, then there is a property: "mboxes". Use this one
> (look for existing bindings, e.g.
> Documentation/devicetree/bindings/firmware/arm,scmi.yaml).
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
