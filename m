Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69057C43217
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 13:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3043E61175
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 13:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3043E61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yedomvIc/c8H/OvjJ/ikjO0P73Ti3FPDVfk6wO4QDb0=; b=lJpuB0EXxrRcqz
	r2yN0uhNuV2ZB8wmpuhq6SncDFWUnmjjCkf936BdmDiUEosIBAxgZcpUckKbN3ZxMPUaYM5SOL3/T
	+37Gi9ee7Hug0+0l6iy7d+f2G2I8H4I+PFzu6gk+jTtJwhxdPc9VFofksTCVc7hmw5YM4QTWIRJo0
	jt7Gx9Vsi7o0uD21iHY+mfsIsv6n1OlSzq/8XL+MgaEm1z5lsMwLu+wp/dTnE/0/Di+LAb3cxJkan
	nhYGPAXcamDsxBT/kL3AMSFeoLbfYkzOFdCAn4NqC604sqqpJpC6+ZxPFubVD679rOK3pNZ9Qs1Qj
	y4DC5V0RVrsazJdJOtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkR3F-002JI1-EI; Tue, 09 Nov 2021 13:20:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkR3D-002JHd-4Q
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 13:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636464034; x=1668000034;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bUw1eRupk4ggY5TI/qj1twp8I/ZfxG/Uj6OYoObkUv0=;
 b=BF9cTTY1y/iOIALCUgGTrS85vaTRPKxHbzfdjoBd6v/lD8gAYZYw3VX7
 iPF2iCTRH11XT7+jJh0EbUALwkZfo5s7VknWJfbvwqJG3w2W3KHXCuE1T
 Kp7iH9PmKqoD5MhS0oQ3Tw1F6IMj/v4ZfH3c094MhljgcjhypRo8VOgRn
 Dwk++n3q5U8oykkjfJz8q3+dPPz3Coc1sAPav0rT79ZvBK2cFHneqN58J
 TR8ywtxfDBOtzOb1Dqi/tvbJf1iaLUkl0AuMIdT5N8DpvZbLYcAuyqy6k
 G8c7cGffBcYB+982OipzN3WMd+/pCY1XI2h6dUUQY+rsalLamVxFyJO9e w==;
IronPort-SDR: Q/LeLdyMhYt8LWYZ8hr7fB9X3A/KhRlAE+zYhndDd4P2qR4PRlH6JBW3hcT9rL0kC/1WMfv9pC
 1uAC6SAfpP487m2ORbfSRvzs0YR3UuxFhPaUmKakCuo/PfiGJAm57dch6b2bMmJIALhtcZqwl1
 s0b/UOcRq6lVb1ppfyuuanbxF2Bg8NLiRsMjBmWbtKbYzl3mYFCnj98DLd71Imn4kg3sZ6yHZJ
 P5KgIx/qfzKjz6+c9C3pawFPcT0QfhopyL6soNV7ScOTLB4Pus1+Twlx0RZfXgv0E/UfAQeAjm
 sJpXNRCuVAe4HQBGMCe4r/or
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="75851438"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 06:20:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 06:20:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 06:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVNhRUdv2fMi3swgj8VHV2/9weyMRjxQA81dX/BKZXneta/sBcwNyf9/EypSUvuDkqqlCS3+wWTg5s18Rv4ENWA8lQbKNDPFfUVh/eeOX5i29iHThOll3p1Y+XVjfN2Ko7uhWk2tKSTEOx+G9n7QR8AXwSocIlZLUnN8NoUMvlkW5NXkrIPjjEUb/TYrEPHpirEOoNcpzqZN3b2LRHIRxfjDVTwIuiGMr2MvQTcIC5MeJ/Daj2GOid9qjHNJ+/WKa3Ln+3NckORLTcQtxKMlLBgcQhFAoLnhnYO/2oGVY2tuR53iyFKs71QjsLftYpF1RNr447xiNCCUiNtMkwGOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUw1eRupk4ggY5TI/qj1twp8I/ZfxG/Uj6OYoObkUv0=;
 b=I43xadz/ik3RbE2AxPdFmOi913KpD3By/1nrzHZkknFwz+hjeUhGpE2QddIzffZ4yizP2WYEkd5bwBmaUz2ksZqumxFAzdyMd8HAAaonHzd3Cw+SpsVK5fZUUKi9S8YEX2Ea0WsaiLT9/T5Uy1WxpSnXBU5a6M2RaWSzzXaMQK6oUJbdz8nEls/F/e1O4RuqgWVzXags7xyfZiqhBXW9d1Va90LNvdEMpwEC9NtQvz6HQXweiB0TGCF7urbysmrgKJ/M9Ie6qUQYOHrLKyqS0Odr4E/2X7IwHCWlctue2XnKBy7Rjisd8OvhhBc4o3RFr5p6ccO5jrdTn0rIHpltIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUw1eRupk4ggY5TI/qj1twp8I/ZfxG/Uj6OYoObkUv0=;
 b=kWEZC/yg2lmUhygdHUSn2y8TI9+LXiIIGJEreaEdy11QI6Gjil6TTn6xLDUnfeItModUsTAqtiOk3czsUjIsADbzS5jc7pQoXRFLHU4WzigMkG/wTrtfEYZVsHlKf5O9bTJaQB4qLIjd7Tl3gJ/Q426xsdyzLVB/opTK8jwYwtw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1933.namprd11.prod.outlook.com (2603:10b6:300:110::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Tue, 9 Nov
 2021 13:20:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 13:20:25 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <robh@kernel.org>
CC: <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
 <linus.walleij@linaro.org>, <linux-riscv@lists.infradead.org>,
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
 <linux-usb@vger.kernel.org>, <Daire.McNamara@microchip.com>,
 <linux-spi@vger.kernel.org>, <geert@linux-m68k.org>,
 <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <broonie@kernel.org>, <palmer@dabbelt.com>,
 <bgolaszewski@baylibre.com>, <jassisinghbrar@gmail.com>,
 <linux-crypto@vger.kernel.org>, <Ivan.Griffin@microchip.com>,
 <atish.patra@wdc.com>, <Lewis.Hanly@microchip.com>, <bin.meng@windriver.com>, 
 <alexandre.belloni@bootlin.com>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <a.zummo@towertech.it>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Topic: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Thread-Index: AQHX1LJfUqgSbOdkdUS8ce/NVnrEbqv6lPOAgACJDYCAAAokAIAAAZGAgAABe4CAAAS3gA==
Date: Tue, 9 Nov 2021 13:20:25 +0000
Message-ID: <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
 <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
In-Reply-To: <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
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
x-ms-office365-filtering-correlation-id: 5156db62-ae0a-4f78-f2ea-08d9a383b130
x-ms-traffictypediagnostic: MWHPR11MB1933:
x-microsoft-antispam-prvs: <MWHPR11MB1933373E4BB2EE4033954B7298929@MWHPR11MB1933.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 57h7t6W3k6rM/FLu6Y9NIzPzfH59569x8Q+vQUk777xt2tQusX/7keJBxgusHQgA9iC3S0AAAnLdTUh7Roda2aogLNkJiSarmmLCasvSDg/6js1+jrmtZiUME1+BliNg7sGLuHav96grb/KSFH/HlUC3AjVXrl8ydF2gcglWaeHnQXNX363R8kg/abNeHX5MwqMW45qJw5gr5rU5YjogydUjf4u7ZAbPidU3yk9kI15uWbgVLeAot1MPDztwikARSmSHfwp/hH8867K2Mb7ZbeRinFUHYz0pxRO9pCEH1MHzXIHxNvcDKUjycGmfA1Lvsed5vN1mDIZXFjak8zJtZ+fQy2VnQaPgly0gv/SB7+egQnBkHquI27ri6XOV7XxXEBhkZ54Z8ZnNnxd2KHqumn9XgnTphKw1/p1O9AnsUwwthApwQrvgLoZ0mjDvx+Hy8c8yvL4WSPu//qR758gAaO+RNw0jkFd5azOxnqg3pCW3dB3A5zL+McrQxDHAMCnuSxZfc8LuyPtgZ3SL3s80fvEdcEXgYUiMaZNzTDjqahe/9cF1TLhmeI2rlU2gGZ7J1eSBTtAnfyeNd7Kgizage8lcRz72GDjbYHh8ErA35Wlk4/5dN338o4I46QrVckEBZUizwz7wSrCrCm4OhYhXhR1FRIGfijIPm9iFuhYbi+l3pgo0BbIoukYXu90HCNfKwyO65ljADgesLPtOtfIcEHMsidyd+Tzey3N5ernYtwi4Cmy9gX1uN+wkSfT80UmyDFuNWSGG6DfkxXQzazr87g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7416002)(122000001)(91956017)(6512007)(76116006)(64756008)(38070700005)(6506007)(53546011)(110136005)(8936002)(66556008)(316002)(54906003)(508600001)(8676002)(26005)(31686004)(4326008)(186003)(2616005)(38100700002)(66476007)(66946007)(6486002)(66446008)(2906002)(31696002)(5660300002)(83380400001)(36756003)(86362001)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnBydXpvVXA2TjdpZDd5RHRTc0x6MGlGcnJvZ2NWUENEbmJDUGo2TXJObVJ4?=
 =?utf-8?B?NU1aelo3cU1ZVkd6WGVYVWN3ZWNac0h2RTVFYllBeGdBMTg4S0d5VzJEazVO?=
 =?utf-8?B?L1VOWVh3MHlkWnd2VkZQSkMwUXBYZFNnbndiVVpucjhMQ3JjdzlNMDVTeVo1?=
 =?utf-8?B?UkRXTUdhRmtDYldiVXJqTndVQU5PWHZQVFBJYlZ6bFBTdUFYd21NTGtJaWdi?=
 =?utf-8?B?YTlzNHRPN2hocVRXWUhYSnpFTFNwUG40RE9WS01wc3Rram52dnpRZ0RHSWVL?=
 =?utf-8?B?OXdXdlNiZGlXSnVKT09HN0Z2OVZBbUpYTUhKU2NsSXhmeHNjenZCM01ubGs5?=
 =?utf-8?B?RDhxUzYzNVpmcTkyVG1Pc2VKcEcrSFhOWUVkbzNCRlVwZjB2a2RDcStEdTFh?=
 =?utf-8?B?TXZxMldvT1UrUnlVNytpQjVTRFpHM0szOE5SUmhSM0kreUV1VTZ6ZGhIbWJt?=
 =?utf-8?B?bnFzeFdUL1V1dWlCa0ZnVStiSmRsN0lzQmdyQlRLR0g0Tk0ySkpDOGx6aDNy?=
 =?utf-8?B?WVpzaVpwaDhBS0NBQ3ZnREcwVXhLaXNUZE5GWitIWXkzUjlxZ0MxTnhQL2hU?=
 =?utf-8?B?MEs0cnpyZkViT2FMZitjaUZWYnpncGxGNkZ2NnUzeFg1bnNVcGpoaUNCTHc1?=
 =?utf-8?B?VUxUTWxYNElqQ0JkcmtMRmZQR1BTZEtQdXk1VFFzYzZoZWdlT2pZNS9VazlI?=
 =?utf-8?B?ZnRrL2xVSG5VUG9odlJ6YVRaUFpBUnRxb0FMV3lYSTNSMm5jbTU3UlVub3BH?=
 =?utf-8?B?MGYrMUVWaFN4OTUrVlg2a3JMUXMwWGNoclFkaXdIdzkzcDZ0ZVpzUS9xMkNq?=
 =?utf-8?B?L0V0UUNvNlFNV2FmWTBMT251QllLMHpOc29lTHVLL3I3aEh4b05YVVIrNUoz?=
 =?utf-8?B?WnhvY2xzY1FiSlhxWFNrZEVmcTJMYXhjRkdaaGpqY21YOHpQcmNKRGl0SUpl?=
 =?utf-8?B?ZjFhdU5qNGkrZ0pNd3htdzZad3NFWkpTRmZBSlRnUnY2aGtVNytXWjU4RHQz?=
 =?utf-8?B?cStFU1Ivd2J4cGFmcFVmUU9oSXVsbnQ4Y1NYRW1GdUNVWkRqUzBJWEZ3S2RS?=
 =?utf-8?B?QzBNMVpnQmlHNkN2ekM0bXB3K1VkdzJ4T3YwNGVpbHNPaE83SmZFREY3OXRn?=
 =?utf-8?B?VXJHYmRRM2FMWkFrdGhCSkZRM2h4eUhMNS9xeVQ1UzRNZGhMQ3AyaFpkMENJ?=
 =?utf-8?B?eUtpZG90aTZBMUZ6Qm1nVkovZ1Y4bSszK2R6M0t3NW0vakRHZVdvOEF6N0p4?=
 =?utf-8?B?U1FtZ3liaWR1WWpXeUNDTHpBMFJtYUZtY3dVL0NVbzlMU0N6NVA0Z3RLclB5?=
 =?utf-8?B?azJvZDBmeXNTTHFjamhHMW9zcDl1VUlwZy8zSUJHVHhVRmw3bGY0NG5TckNt?=
 =?utf-8?B?Nm1KVkNWVC9xUlNtRmdNRjI3VmVMK1kwRzhTSkJmR21EeGRhVWR0MzNtK1pQ?=
 =?utf-8?B?bmhJMzRrWVloUjA5M1YySzFYY0cyeXhmWWZlMzg0WTMwV1NwMkR5Nld3VlQ1?=
 =?utf-8?B?VFllMCtva3JRVWd5c2ZLd3BUR2NJNXgxMW16TmVpQ09jc3RJUXlwallJMHM4?=
 =?utf-8?B?RDRWWWhLeHBuWllHS1kvczF5dEtWc2Z2TTFvZGJHL1UvMlo2R0Q2L2VSSy8r?=
 =?utf-8?B?R0tPSWVva1c5MVFhTUVJZGh4RVJTUjVjUjlzczZ0RTZwL09VcjRTQWpucTFj?=
 =?utf-8?B?VzFVeU5xd0ZYMHYzRmllcU9Td054eE1qZDZQS3Jpd01JbFVWam51UHVWVzlp?=
 =?utf-8?B?YkNFeWVJSUZvYnZnZXFVVG1lYWtlSnhzL01YZHpITE0xdTNvNDRaamtPNWpl?=
 =?utf-8?B?NEtUTWUzaFFOSUI0SXhBYnFoSC9HOGJjMnJibXl0bFoyMnNOL0U2eVhwTXV4?=
 =?utf-8?B?SUdTR1VodU1CMDY2ZG9wM2xKb3ZVa1RneTAvVlpWVWZ0OXVjL2I0RUhhV1pQ?=
 =?utf-8?B?TXByZmgzK2pIY0Zja2x4N29NUHJqYms5TGovMVNqdG1nN1kySGZBNUk3Y3lr?=
 =?utf-8?B?U2M4enZBOG9ER3NIRWVzODI3em1mN1BvbVljYVhZeWVwbkNXR2liNHk1ekNZ?=
 =?utf-8?B?TmgydjRudDV3Q2JDQ0RmSzlxOHhqZG9LOGN1OWFCa3c0eGgxVjZoRFgrUVpX?=
 =?utf-8?B?YzJUb0FRL21xYjRsaEdESmxwSkpFZ1YrWGRGWnh0MTdOR2VCWEdZa3k5Q1RD?=
 =?utf-8?B?d0NYaVhBdXRuNGdQY3ltSDF1VC9SbUthY0IycVQ3SkNOUUFYTDd2S005OGp2?=
 =?utf-8?B?WGlhYmd1UXlvZEZLWHFTTDJYSGlRPT0=?=
Content-ID: <F0F1A545C408E648AC3A9F3446CA8B38@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5156db62-ae0a-4f78-f2ea-08d9a383b130
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 13:20:25.6243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+8aGtNTYzXHAY1qP5W0pbj7pi7kl9N9wjDpiZ1bJBeP53NMCywnw1kT8/MTgupJbwJocHclkMYXjPmYBijZHwdfHHrT0YutsareBHSH1dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1933
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_052035_297096_16684134 
X-CRM114-Status: GOOD (  25.37  )
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

On 09/11/2021 13:04, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 09/11/2021 13:58, Conor.Dooley@microchip.com wrote:
>> On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>>>> On 09/11/2021 04:06, Rob Herring wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>
>>>>>> Add device tree bindings for the {q,}spi controller on
>>>>>> the Microchip PolarFire SoC.
>>>>>>
>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>> ---
>>>>>>     .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>>>     1 file changed, 72 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>>>
>>>>>
>>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>>
>>>>> yamllint warnings/errors:
>>>>>
>>>>> dtschema/dtc warnings/errors:
>>>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>>>       19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>>>> Rob,
>>>> Should I drop the header from the example or is there a way for me
>>>> specify the dependent patch to pass this check?
>>>
>>> The error has to be fixed, although not necessarily by dropping the
>>> header, but by posting it. How this can pass on your system? There is no
>>> such file added in this patchset.
>> I linked the patch adding the clock as a dependency in the cover letter
>> [1], which is why I was wondering if there was a better way to do so
>> that would get picked up by the checker bot.
> 
> It's not only about the bot, but dependency when applied. If you did not
> warn clk maintainer that clock bindings should go via Rob's tree or
> should be provided as a tag, the patches here cannot be applied in this
> cycle.
It was not my (our) intention to send the clock patches via rob's tree.
And since this is my first time trying to upstream wholescale changes to 
a device tree I honestly didn't expect this series to get accepted in 
this cycle anyway.
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
