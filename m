Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0158BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 15:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A8160FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 15:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0A8160FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3nCzNJyNG4LsSZC7i+U2Q+twaJM7wtXIf2jboFN8tA=; b=0P0kVp9cXwRLiq
	UNTDq3aFmBgZrUFx/7O+C1kLeAqis5k8Kcr05jLe9Z/2+m0794tgn1/7S/Vd122by7unWe6mXGb0j
	8/7vpSDiSY0J9G9zxrf4cSvvHCX6INFlzoctCdqHhFckc3UYR3INAP0+i+ddE9gn1OdT+Bi50WYVA
	elZZrLZXgt051CKMPGTSnPQM3WMBCmvLFSvBuCObzJAaC8hQahG5jAvB9TFHNc2EItkZ0E3IQGdqf
	wX8TzwCDOKilvhWsTaxMh4DY9qQBL11ZxB0xVmxQH2HysxsBYKohcLXStqZwqKaiXrntFwo6Mov2B
	gtzdL8aRr66SLLEz1/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkpC5-005hIw-CB; Wed, 10 Nov 2021 15:07:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkpC1-005hHZ-9b
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 15:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636556837; x=1668092837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ku0Bc3dw+XghLk8Hz3gIe8DWYpof0HxDDPwRgHh4xGo=;
 b=RxA+868LK7JKYvFm04u6eSnKMMqf68KjJpG/QbZvSjSeD4BPl25XUjIF
 j5Mratt9MEVGSHisu1q+xyrj3iETcXN8qXXD+gQ1T1/+DMLKOb9OEiPQL
 rMszEc6yCXZTNhfBRB4eu0t9tB4J0vU8g6xXGQkZI19vS3DwwN1rEgaiy
 iAiGT5abXvuwDZdhfnKz3o0jKbhqPliEjweWYDT0dYryF3dXhv3nRj/lU
 Ogsb9X8cLgzlVpVutQT0ACEa3lhmWYYg8y/daVAn/d/MAwBhXZUVJvrfe
 4RbgUGfNR0FMyyTZRcF60sZOWLZafiWPnL1KeDDx4VkVbKwTNsRQRglwV g==;
IronPort-SDR: by5W3xuP2DIhWbwJOfkWT1/sW0Ev/qXH6TLH43N3nGcakykcYtXzIYpxjzgji7JDZBxLzpSZ5a
 5W/2G3qTu063MLaHdWKCdzpXuhDkJ2v6+Tmmbx25Qp8dLZHaDwaNwvcnsm8mQKMUZ4LmRVD2fc
 Q1XcEh8FNKKEF0xvAtj1YB3+Z7Av0+sNlg+CTvli5y36m/H8g0ZWxghn4smwBO4dx36DNAIrx8
 cQUtxLIsVMaNgySPyVJQdqUyMlFBJikcHQBhz5BxYcw1TbSDpbeI42ON2J7STEKo4o1B6Od5KW
 OKVh/Aj6PiiikZ03iayKeLRC
X-IronPort-AV: E=Sophos;i="5.87,224,1631602800"; d="scan'208";a="143476439"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Nov 2021 08:07:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 08:07:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 10 Nov 2021 08:07:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B//AX0a/UzzAgwnnqhagdNNuCDbm6lZQ+pvqkaAPdGON6roBvosxqyQ2f3NE8Mb9Wf04B/HjE/r+AFOqxTMHZ3qwYmEdHa8NPl0+Gmz/UFtSKvuhckcjWWFS52mudCOaOZtQmWLCHTyEufF3eu45tzHW7J34Erk8dC2st3hyIsOgPwa/uq2gRsCkejimHT3JXsBcHRodWefJc8Ge6aMGse+AuUvaqC5usnrzViAO8u1NpjFjxWTvS/fTG3rzgqYOkiNOpDGG0i5OKypXkgzysDKoWNeZQke3mczm95DzSdjG7zoEXL5lUF+XeDE6xc9s4Inz3aN+3nP70TgDjJlxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku0Bc3dw+XghLk8Hz3gIe8DWYpof0HxDDPwRgHh4xGo=;
 b=FazHA1qYofiQYB3ncl6xxb5xaV2gIy6KXYD1/nag7ZjPTyOE4iZgnzp5Hv1CkzzSQ+PNIeTWtK3EcSRS56mJtH6JJxxnJofAfdIvWOojOPhDEZ83mfxIlyXPEkkTV0JFnWcqzW13Qc1JcBw0WLLAzEOQv0GmcwvhfVG7kX06tu9tmCMlkviBpICN/GSD/6vG0tdVlmQixXl1Kxz1nhh6Jg4sHBAqzuVbdwCWeS4RAneb7lmw1JmBHhsVo24w47/4+0P8M3/Nj+EyNFqUUmv8OCgRIu7oPxfq6ikZUsijw4UiEmzwsmNXJSh8A7Fa+tt7gnXZqXKgfEvgXzMez8EiDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku0Bc3dw+XghLk8Hz3gIe8DWYpof0HxDDPwRgHh4xGo=;
 b=WB0oGbTnLaM810X401BWFE3EtO6kKkmdwT9nYF+VTWVbHDzOehP/49w9/GaWwyTGUwULYCVbOSy5LLGGQPwFF+N/fg/LDys+H33uAlzYA1YaI6iGByIdNwjppO6EpJyplKInrxPDwTlp7KohYdzp2ulmJ+9XcMyRKhE206kgGUo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:95::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 15:07:12 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 15:07:11 +0000
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
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2yk8h5UAHwUis11m3Urxauav66E+AgAHqiICAAAqfAIAAApqA
Date: Wed, 10 Nov 2021 15:07:11 +0000
Message-ID: <6b065b43-e3a8-a3ff-d537-7cf70b153d22@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
 <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 112658e6-9730-424d-068a-08d9a45bc5f3
x-ms-traffictypediagnostic: CO1PR11MB5140:
x-microsoft-antispam-prvs: <CO1PR11MB514077ACE75FD38B57C9850E98939@CO1PR11MB5140.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tcr/8K77hxUn6mTHwVYVvkKLxmYjWVsR0u5cCpFEZrgf0O62sZnU/f/I41BzKdxJg2M/ku4Rw4cQ1bebrPFppb1q884azLEaK/D4/gHxbuPnBfKWJhiZatyIJYxCxSsrwRjeqmo6p6fGPPC1ydkifNgltTn2hvEEOknAoVNsmDfBkQEeJJKd5/Ik60UO+THgo330xXcLMEc6hLEeTr6VkjfxA82Qa9okrKuBFuFcXVDiSNieH6LTlhr4AkDNO4V/R9indwlDt9htu6aHlHUHVltBQ948QWX3PHsBen9rvjw9cijjEMr2dc6fIW0bMhUO3YqSmLMbjJf1OBzEBkKujaHkMgEAwJruOkQSfsWbIDyEiaxDOA1aiS3kWCRVOgOkch5P3LVY1hFuUOjQAW1o2+MI/CtwuTaFWs7STyhdj11xLUWDCsx+raZ0leM0zDv+RTh731I2Te20xkWtiGGdwImUGb4GAFx+zJl8b1Z3RFdIDQwbzR03Fmzir7g9Cp2tJl6yPCJH+5nw85gGUED3Z9VG8cSw7Wqff6u0WOVJ4oToABIfLqIAgEgdtDo+jrOV31iF3va+H5TB5sKOsQ/WCZDdZnr9ykF8Zd1F+JkxaYDTUtoeNIoFFfLBhmJxzsobmUVCLSkaGgO9QCdZI6qYn8ncfAXF1NdJBxJypNsSMr4UWew+alezhKigY4+gNmuq7zm3laqy8QKkS0L5OvGQBUskqePqrkBK0GwYoHbCQqs2ItHwk6Hxd3WEHk7DrwmXSCx/1cP4JPvXk4tHb7621Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(5660300002)(2906002)(71200400001)(6506007)(31696002)(6916009)(36756003)(26005)(4326008)(38070700005)(76116006)(54906003)(66946007)(186003)(64756008)(66476007)(508600001)(6486002)(66446008)(66556008)(8936002)(6512007)(316002)(38100700002)(122000001)(2616005)(86362001)(91956017)(8676002)(53546011)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2VGckZWamYySEZ4cGVyYkhNSEZVZ3N6TnJkaVpUR3lMR1JQRWdtYWhnOXY4?=
 =?utf-8?B?cG1pY3VubWh0OTY3dDh2cGVya1d4UmV4UStpR29ycXdnajdISUhxaDFzNnpF?=
 =?utf-8?B?RGlISFRpZ1BlR0p2WGNUanZTMURJUjIwZldUTjdNQW1WUCthZ0lFa3o5c25i?=
 =?utf-8?B?TE8rNnhObERoU29GenkySjdnUjhiak5WMlhKR1hGTUdFTCs1TkpyRFhEd1dv?=
 =?utf-8?B?WTVUbTBac1lTUXR4VVlsaDY2YnJDdFJEZ0RHU3ZFeUFvQWNFZjdvMlFGaDcr?=
 =?utf-8?B?eSthOTZ4bjFVcGpwNHpQNk1DWHdPRWtBc2RMUitVa2NGTVkxZ2lUTnNYOHA5?=
 =?utf-8?B?d3VYdkx0a2VSdnhNOGtmNk5iOEVweEo0bUtydzRzYzgrRm01VE9hUm1JanMr?=
 =?utf-8?B?U1dpZzh4OURLTTREbXRYQVF2VkZ5Y2lMa0tGMGw1VWVQdld2VEdLK096eDJT?=
 =?utf-8?B?aGl4OWZPV0txaGVSdnNoSXdMNXBYREdZTE02UlJXN1NXSzBjU1JVQXpuVndU?=
 =?utf-8?B?R3EzcGsvQVBHQW9VN21STEJtMDZySUhmaUZUbFlTRXdENDVHYXNncVhRZmJm?=
 =?utf-8?B?dEJ3UDdTY1FPWE5SZ2ZqMDhFeHppMTR4NFU0bEd3a2g1QktGVzNFWVRBS0Ur?=
 =?utf-8?B?M2RkMmxPVU9yakVyZFpLcWRLWWt4LzVRcEpaVnMrSnpvNmk5K2pzMXlkT2RI?=
 =?utf-8?B?cWM1Y3VyTndMMnF0UkxuaGlZRHUxd29CTGZlaGhuYXFabDhqS0FXZ210N3lq?=
 =?utf-8?B?V2lLbGNQL05uWGhHUnRZQVpJMjJnT2E3Qm9BOW1JVnl4cVZwOHhVQXdpMFY1?=
 =?utf-8?B?SGdFTDViUDAwN0RxR1dST0d2WVZHODZVTkRrWHM4M3ZNQ01TdDdVUjNCWnRV?=
 =?utf-8?B?bFJVb2s3YzB3d1BUREtDMVdjSTZ2ZTdrQlNHcUlaY05YZTFtcHpCL0c4eU5D?=
 =?utf-8?B?aDlrb09RWDBFQnhQVHphWmV6L0sveXVmWXJma0g2cUVKYmU2MHpUMGlpVDIy?=
 =?utf-8?B?QU9sbVdodXFUL3pYQ3lEQkFacUJjMmpCWEw2djV5ODlURi9hc3FTdkNsMVpM?=
 =?utf-8?B?R3dVeGUxdHJxL1dVYXZKT2dheUJzbUtXaGVvVk5QTUVJNkphaW14ZnhqSkEw?=
 =?utf-8?B?WDBSdnBLQUlmeWE2MjY1dDhxSC9TaGlmNnkwUDJkVGJ1cWs5c0ZkdjhXSEl3?=
 =?utf-8?B?Yk9QcE10Tlc5RlhTNDd5QWxDVDROSWFlRDF1Rmluc1JWdUROTlBwZTQwWFdU?=
 =?utf-8?B?cXFFbGxBMWVtN3RvVTdSTk9nM01WUE0wS1phYkhTSks3Y01tcWJYSnJDVEhY?=
 =?utf-8?B?dXYzNTZCNnltdzBBMXQxWG1pdm4yTG5wTWdJL1NtTHdhcllhVlEzWjdxSXVS?=
 =?utf-8?B?KzFJeVRwbE9Ick44MHlaR21JTFF1YXhONzh0eU9sMmNEWEVzTWRXa2ZMcE1M?=
 =?utf-8?B?MGM1T01WanBNWkxJWTkzZC8zT01QWnFIaHpKR2xrYldHeVhCU0Q1UktjUkxt?=
 =?utf-8?B?bXFBczdoNyttWUd3cE42c0lOcit5SUJRMmJrSWxSQzNXUEZGK0IxdnpvRHhM?=
 =?utf-8?B?dElGbWp3bjErS3UrcldlaFl6MEJGZlovL0lzM0QxVzhsNzEwVDhkd3h2YmVU?=
 =?utf-8?B?dHA5TVNUNHdJa2E5UUFjRWVCTThKMERaVFdRaEhEbkY5UjMybkRKNDlOMkZj?=
 =?utf-8?B?OGUydTZlb2NqcHdCbStrQTlKZ0hwclV6MzVJbE9RNmMrQk5NenJzaFhLUnFu?=
 =?utf-8?B?S256WDNvbUVOekt6cUkrUWFJSSt6MURlTzVjTy9HRWtOempnbUtRMkpldTBS?=
 =?utf-8?B?SlpZaDRlMGE1Y1QvVjdVNVF3OE1mN2lCdTk4ZnpzYWlJUnBGblFoQjN0aDF4?=
 =?utf-8?B?MmdlZDJrT1hsS3I0MjBxTVl3K3FzRjY3VFF4L0NMMURyQkpSWWVzOGhNRzA3?=
 =?utf-8?B?VkhicVliQXREWFNPdFRLZkY3WEV0VUIxd3pkVENZb3ZNUXA3UGRvb1UwVUpC?=
 =?utf-8?B?YVhnbndjTDRNdDFaaVVUa2VQMXpQdExWaFNONXhqSVZBNW82cEhvYThzOFFJ?=
 =?utf-8?B?RkxnRDIzbUhHKzZZOG1uTDRJRGhzZ3lEZmZBU1pBWXFzZmJPUGlxUG1YM2NX?=
 =?utf-8?B?aHN5QVdLY0xUTTFFN1dXdkl1UU85aStCMmYxbmd3TEFMU1MxQ0IvZVRPQjY3?=
 =?utf-8?B?eFI1N1NtOFNLSE9qbHFVMmhkcDRoY1BBVmVRaHF3d0Q2UzZ3Z2hCN1lDeTVu?=
 =?utf-8?B?TXRWQ3hLVFJSL2kvcGhzZHAva1d3PT0=?=
Content-ID: <B8744197C8EEDC40A9C6023E4BC36DE7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112658e6-9730-424d-068a-08d9a45bc5f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 15:07:11.8020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfbTYa0NZsKdI4HCEc0Ra1zmNlhkCH4J2VKeufOHDRDqEi05xa/GZ6plCLDyXZQtk087DsJMzzZkJ7PtvLZsGNVgfRUSfBvMr/7J2XVkr5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_070717_387168_24B8809F 
X-CRM114-Status: GOOD (  23.62  )
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

On 10/11/2021 14:58, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
>>>>                   plic: interrupt-controller@c000000 {
>>>> -                       #interrupt-cells = <1>;
>>>> -                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>>>> +                       compatible = "sifive,plic-1.0.0";
>>>
>>> Why drop the first one again?
>> we felt it didnt make sense to have something that specifically
>> references the fu540 in the device tree for this board.
> 
> That would be a revert of commit 73d3c44115514616 ("riscv: dts:
> microchip: add missing compatibles for clint and plic"), which you
> supplied an R-b tag for?
> 
> Is this the same plic as in the FU540 SoC? Or do we need a new
> microchip,mpfs-plic compatible value?
> 
yeah, ignore that. i confused this change (which is an accidental 
clobber) with another sifive compatible that was dropped for not being 
relevant. hardly makes sense to drop this one when i kept it for the 
clint and cache controller!

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
