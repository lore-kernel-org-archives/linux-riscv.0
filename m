Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE69C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 14:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AC0610F8
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 14:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83AC0610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PosjfizIdjp2VTlNQoNOX0LIVn71yifb/OGetrNFuEw=; b=Qxx5iVhc/Chzgk
	LvCIihONHvBWniVxsgexo+xgCDqxQwO2kkSQrijdK1UOj/w2t+8K/eYLwCuRLawnrgE/4CI3Ivfij
	ne+Bjj7L3hFD378VhAg9FSV0MdJvTCUn9yLNeS6QCNY5tfdv1gHc3tLnPvSpYlJoFt2wAhb2btlrN
	Gb+6LyxluxiOh2MLeWrSWQcsur2T86yWFOuQW+7v3OtYXVy9eAmmSBDgRswncuUWXdGbh8je3ZO8n
	3OAmqwseAA7KPyjk99g3yL9k+2Fd7xxGHDh82bCtg1AYlL0s3RUhD/7QN3wf1mv0JXJdVFnawfYXq
	kiEtJ+GKTWyK+rmHg89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkoSX-005cVc-LE; Wed, 10 Nov 2021 14:20:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkoSS-005cUX-8b
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 14:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636554012; x=1668090012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6y8LA+WfKtPylGcyjGQoyiyLYOcjTujCSkJ5CUyzX/Y=;
 b=UkoICSO0OBCr+XFBROlH9Cpn02frbJlCT1pJO0D2Es8ez1nBnbpaZxFR
 A1Kw06UNM6NDJTYq0QnMbNk7PitY0dMmMCIk1WcefniMuGf5DVMEphelC
 L1t8NFmBivOHezNU5qkJ2ut78/bpuyV/iEt7v8LcG69imKaDdG2JCFzyV
 cP6gGVd/4nT2fNjsfBCg+3lwJn3rv+VEp8jPeEhwV0Lb4AFAEaTNm2wz2
 3EVTJey4Az2o+IO6RWQ1qwEPtJnTQV82sIuLtSROXWci7DuH4SkvFBDSn
 qfYSc50OYOOAor+gfHUh6ultqMAhS3F08qbaPMRW6C/9UCVA8GViIsNQE w==;
IronPort-SDR: BDqyY+owOs6Q2HCxAkHMRMY/obOXDZTYagFbfAIFrNHOmjJovojxcWjXLCR0zgiYiP8WklHcdB
 QTkhubLGIX2t5OvrujTNitd4VUZ5a+9F1o1xFGwah1t5svtUuWxRXFXCw2YrBuJLyoFIEUJv+e
 oFG9wA/XmZmQ/5WZKmxp5SW68ohnHb6K/zj1VxwXnHBXg8CcgVJ06XsX6fwdyuzJJ0TstyS8F/
 mq4yIToWHv2HSM9PvH+hJNuMb1if3YQX4ifoK0qSqJfECFffoXxxC6IpXlBr90qwPGMHKvdOGP
 HuBs6z5Bxj2fJIOlzI3RaM/j
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="136123241"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Nov 2021 07:20:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 07:20:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 10 Nov 2021 07:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2RFe9WifUESeDBeoflfraW9sM3SPFM+47FzsVvWUvnyrFEDwqmUQ7IDeMNTcGlQXPlAh8chX1Hee8LOoGxTMMxK1E7Hnx7sH2q/9P2TiPuGRB3vMO2sGZ/8NwK9A4TeR8MfOJLi1PhRA7bv6SpXhkuTEDXb58eN/UIdz6RWNekSv8MbMkwGgUW1iJ0jNoPJAYZOqjAlIXzzftHvrA05/wAqCGrjcJngGv3teYPGDYBL0+HUFMufqknCZG80Fn2Eya88QW2R0ecctHwrwAtcYPOaq+0DXLvMvdLrrLQ/zQc22Ioh3FTSvcGe/dUA9Ab5JbASWlq72dCecaUpNXfufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y8LA+WfKtPylGcyjGQoyiyLYOcjTujCSkJ5CUyzX/Y=;
 b=BYDtbPJqtVJLxRtDBrhLfNLKiuYcPTiTT8VuBYG1mSrQCCJ8WPR+HRpHVxqYFyXcnkYF3tX39H6BkSVeHCqes5WE1gbhIwsXOeNDgw3FEmbkLXdz+Yo03h+uIzfxfB4wYpKi6mBgVFMqADJ5vBFab+ImYlgPOVTcOd1Ds9Jvf6cdJ/AMguPcQ4Af5cv8fwzBsUP6BA//r7/0nB1DbOO731u2LRLro3TfUa1R7abLTB9t4pojRVuo8dQCL7EN3yqZKs6HgBGad/ejHQCh7Cmpzvj82QXzi97Te5AR3GrByQ5Swhyp0Y+lcWmzhaWRdIfdY0RQoOi3nb9O7Z4Czzhh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y8LA+WfKtPylGcyjGQoyiyLYOcjTujCSkJ5CUyzX/Y=;
 b=s9R5+4/nck5oX0UP8WIC2ICKFY4ddf/ItWGVtZlC6xN6LyAsnI73WuqvILsgSbdCM1MKDGqWUTOrwTFfx9FhpLwzt7VNjKkFpvKFpjwhAc/ErJsDMrIG5B0LZgvn0ONQiQobAzXNVayrvlG9D5C9Xkct/vgfYmCFszsjQ7gBNGc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2080.namprd11.prod.outlook.com (2603:10b6:301:56::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 14:19:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 14:19:51 +0000
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
Thread-Index: AQHX1LJ2yk8h5UAHwUis11m3Urxauav66E+AgAHqiIA=
Date: Wed, 10 Nov 2021 14:19:51 +0000
Message-ID: <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 494d3a12-32f4-4d38-933e-08d9a45528db
x-ms-traffictypediagnostic: MWHPR1101MB2080:
x-microsoft-antispam-prvs: <MWHPR1101MB20809D546B811C04C01BE32D98939@MWHPR1101MB2080.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vuz+0XWdq6dO9zd+uCdkk9iQO+u+nSgmxs/R1iWzx+/VmBAQpg1beVFy+j/3dD/hzK1+omUgNZ4PJeF7IkDSkDcodO+YDgMkz7PEVSQ4JbfO/ZVILQmcM18EYi3brb0FPKLDvWIMcnq/Jxqq/goG5t3GaPFCI4m3BAZ/nJvo6PqSHcbNEpBXBF3X4Kf5qf3wCCXh55/Rp0e1KiMLunTSDzxzCsluE1X6fypk3UGg6jv2LxEWD9hhJdXIyrdAqFMRrzIgNtvgkqELxC0BmqBt6PU4l+TGIxBecCGLqLhHktfVxXZYsDIUsDkuYSod+/QXW+AhaIRcHOyRHbrrCfGryAAlk/YfQ1Ws7Nju9UMCdsLN0d5MwtWKVNewMZ7PYBYuTeUV0H3ivM9J+9cp+ay4QBoDOzFd2UnEZunF1vlDvPtDwghoKAVA46dW9O/Mi5Q/eKpAw9JJdRvTXL9P3BDBwNudejHhZlz9WduAUnz9jRG+4dMKgDrXzAbM2Xiwb9D2W3FAR5T9eDagxUAFUCwnFVjXo643jzHq9leriXkMgKwy5Y1LtC2zr2+Y4iOQ4kTYCJjbHSswnNPZK7HByNqwxaZWei7WHH58hfUBD4ZHT8bSqiobtKNVd4zLhQRVwuxNTdW93pd0hBG8Z+q4OpZKqWpMQ0B3v48WM9yTzfkjhZErySVVrAzsdGn2rVjGK9Q1EuWRg+EMyTjM2pwUVWD3B7n4if2ok+AS0CydAfOGVym1gFOnSVWyOklvZp4EmVgng+fwmvvKrKilRLhciZ4p3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(71200400001)(53546011)(508600001)(6512007)(66946007)(66446008)(64756008)(66556008)(31696002)(6506007)(26005)(38100700002)(66476007)(6486002)(122000001)(31686004)(2616005)(76116006)(38070700005)(91956017)(36756003)(7416002)(316002)(54906003)(5660300002)(4326008)(8676002)(30864003)(15650500001)(2906002)(8936002)(83380400001)(6916009)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlllQXFkTm41dzBEaVpaeU5jWDJodVdFMFNmTzVjbTYwaGZyV25CT3pJUXpM?=
 =?utf-8?B?eGw3eUE1RXpDUnpDbmxqa0x2UDdhVVF4SXZDMnRqNi9PcjVpeHRVY2lkN2F0?=
 =?utf-8?B?aHl2bmpBdEdqRjV3VWpZaUlZZGhBMkRBLzN4MkMrMEV5ZGJSbjhmTE9uUnBv?=
 =?utf-8?B?eUMySEhzN3BvbUw1RExaQzVNUGV5N21BVGxMZ2VQclNzVUJkTjhoR3ErTEU1?=
 =?utf-8?B?YmhUTXRmWm9vRFNFVDdMVDN4c3F2RlRxYVphVlVKbGErTUJrLytlZ2VNZEox?=
 =?utf-8?B?bDRKTDhqbWROd1NwMEVYRGdyMFNrbWJ5WE8vNkFmZGF1ejkvVmVYdFlVYzBu?=
 =?utf-8?B?aTZCNzRyOFJFc0hZdUVSa3oxcDFOQVJ5eE9DTzA3SWVsMVFwWkNHbElQajhW?=
 =?utf-8?B?Y3c3dGFaY1d3NENuSlNrcHRSanZkWmVpdUVaRDZPdFhXZVFVdTNrZEJ1bENB?=
 =?utf-8?B?N2U1OWlzckRESkpLQnVuY2pqaWpzTVlDR25hZm9Gb0NwMVRYM2dxWjM4dE0w?=
 =?utf-8?B?aTBBYi9zV2JzVENzT09UQndyN0NReGUrcGNyeGhDMFFjTjNaK29QUmdidCsv?=
 =?utf-8?B?MUlkWWo0bWJyUTJwUkR5VDUvMjNlZVVvZFRqTit2SXpvalQ5MkU5VlpnZlhh?=
 =?utf-8?B?cFU0NmdyY3ArakpNQ2VZV1Q0K0p3cEFSendqa0doSFJ4by8rTEZybFQyWVdS?=
 =?utf-8?B?c3ZFM0dhU0pGb0pxcDN0VlE3UlhoUlpvaEs0QkdxS1BaUFFnQXVpZXE3bTZX?=
 =?utf-8?B?aXAxdWt6R2lEME9EeitGUUVZQU1qcEwralRTZDhBZXhhU1dSczNSV3dTcDVZ?=
 =?utf-8?B?WVVUdEZ4Qk0wYitKbGZMNm13Vi9aeVl4UmM5cEQ0N2ZyWCtDUEo5ZUJrdWxG?=
 =?utf-8?B?ZHRHeklWaGxFeFptRzZwVXJVcFdzUDNJSUNjUVlQa0ZlbXJVVGQwYlpFRGNn?=
 =?utf-8?B?d3NLWmhZb1NqbXliUG9hUDZnZzdqV0hlcU5KN1J4VXNHaXlKR3VDQ3prY0dY?=
 =?utf-8?B?M0ZmVmZ1L0VZd040ak94UFl5ek9FY0xBeGNDVUFFVk85WS9OblJnYzVhZVFG?=
 =?utf-8?B?Y05YVlI5SkZIZnlQZGVYY1BSRy84cUFxa0RZYm02RDBZTWlMREEvUHpCOTA4?=
 =?utf-8?B?R05zWEdWU0syNGlUTDE3TlBHRDZoejdrck9XUTI1NU9ZTlNJZEd5cVJvajQw?=
 =?utf-8?B?eGZlZzJKd3BKNmMrS3F5RktsRlZsbmo5NXMzVk1XWDFtdW5TeDVldzNqSFRr?=
 =?utf-8?B?MlJjZXI2TmlnV0dCYnVYSjdJTFVFTkhNM0FKcm40R00vWWhYdUZPREVwajk5?=
 =?utf-8?B?Vjg3bEtoZ3BjeDUxbDRkWHdKbnNjd1VkRnA4MUd2b1hMRmQxZ2NEbnJoNTVT?=
 =?utf-8?B?aFNPMjRuWDM2WjN6RmhrekNwVUl6T3UzRE1iZHYrQW1CbkRhUVlWNnpwaitx?=
 =?utf-8?B?cmYrZ2JKWkFmNzZMR3JzU3F1UGxmOXpGOWdmSHBVdmtHSWlaMTgva3Y4RGc3?=
 =?utf-8?B?cnFVMGtUOXV3bWdrYjF3YWVDK255eXlhT0xNTUkxV3ViVi9OZUZtdDFORURh?=
 =?utf-8?B?Wm1ZSVo2Z2VZdEdXMnZSZHZ1Q3RxWlZxRTd4SHlqTmJmZDFGeVFlY0JzaFc4?=
 =?utf-8?B?SUFqZ3pvV2NQQXFhMmplSnlwSktpT0djRDB2WmdyNHJLc3l4SXpjMGd1aWtQ?=
 =?utf-8?B?bnM2Y09zMG1SOGQ3NHk5NVJQOWtIbTdqWXVtYXQ1MVRvanhpVGlGSWJzT2sv?=
 =?utf-8?B?Q3pwK2JKZVIvMXJKOEdiR28wNEFhOEVkbUZyUE5XNHlQNFRtZUx1Zi9ybURN?=
 =?utf-8?B?MkdUdk5HQmRDVjVyT04rOW9DZTYvNERRdThCUXFsbUpDdHhvbnJ4b0NPNTZw?=
 =?utf-8?B?c1BWVER6ZERONUdaS3N5WUx3Qm5mQUZQdmVWNDdaT1JCdFlDMUtOMnlyRHFa?=
 =?utf-8?B?djd3K0d3cm9jT01MV1NzYkR6ZEx0UkdEckkrY2E4QkJUSW9KQWlzTTRnUkdF?=
 =?utf-8?B?Z0R2d1FKNmVVZG1OZzY2ZTlsY0dpbUdpQzgwSGtQc3RHaktPaU14U0V3emp5?=
 =?utf-8?B?UzFFR1pWUUVmUDlHcndrUzg0N05EZlV4ZFUrSmlrUEVQck5HM0R5NDg4SUpB?=
 =?utf-8?B?YTZKRjR5NkF5aURNeUxVaEtxSnZJakZTYWhaOHBLQzdwMjBxbmNLdHN6VFhI?=
 =?utf-8?B?RktWY295Ym1TVFRrYnFPQkF2RlFZT2tWV284TVpJNXZ6d2FXd3RFKzlJNk9t?=
 =?utf-8?B?VDA3UEdhMUhCa2lZZG5kMmpIVW1nPT0=?=
Content-ID: <701928C4F68B2948B2E782C7989C4E68@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494d3a12-32f4-4d38-933e-08d9a45528db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 14:19:51.2766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4dDETY9Np96OEzUFwYEUrozn/WXvmJQ9aaaV9OsRslrk/YyAEHpSmP1Vx9kZvGnv1gepbf2SySkrrrO86AowPn+joMXYG2CZ0bfoX0edz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_062012_441928_257B52A3 
X-CRM114-Status: GOOD (  22.27  )
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

On 09/11/2021 09:04, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Update the device tree for the icicle kit by splitting it into a third part,
>> which contains peripherals in the fpga fabric, add new peripherals
>> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
>> map which have been changed.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch!
> 
> Please split it into logical separated parts.
yeah, ive split it into several patches - one for the splitting into 3, 
one for the new defines, one for the changes to existing nodes and one 
for node additions.

> 
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>> +
>> +/ {
>> +       fpgadma: fpgadma@60020000 {
>> +               compatible = "microchip,mpfs-fpga-dma-uio";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               reg = <0x0 0x60020000 0x0 0x1000>;
>> +               interrupt-parent = <&plic>;
>> +               interrupts = <PLIC_INT_FABRIC_F2H_2>;
>> +               status = "okay";
>> +       };
>> +
>> +       fpgalsram: fpga_lsram@61000000 {
>> +               compatible = "generic-uio";
>> +               reg = <0x0 0x61000000 0x0 0x0001000
>> +                       0x14 0x00000000 0x0 0x00010000>;
> 
> Please group by angular brackets, to increase readability, and support
> automatic validation:
> 
> <0x0 0x61000000 0x0 0x0001000>, <0x14 0x00000000 0x0 0x00010000>
> 
>> +               status = "okay";
>> +       };
> 
> Do we really want UIO nodes in upstream DT?
As I said in the replies to another patch this is my first time doing 
any upstreaming of a device tree, i didnt realise that this would be a 
problem.
> 
>> +};
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> index fc1e5869df1b..4212129fcdf1 100644
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> @@ -1,5 +1,5 @@
>>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> -/* Copyright (c) 2020 Microchip Technology Inc */
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>>
>>   /dts-v1/;
>>
>> @@ -13,72 +13,187 @@ / {
>>          compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>>
>>          aliases {
>> -               ethernet0 = &emac1;
>> -               serial0 = &serial0;
>> -               serial1 = &serial1;
>> -               serial2 = &serial2;
>> -               serial3 = &serial3;
>> +               mmuart0 = &mmuart0;
>> +               mmuart1 = &mmuart1;
>> +               mmuart2 = &mmuart2;
>> +               mmuart3 = &mmuart3;
>> +               mmuart4 = &mmuart4;
> 
> Why? SerialN is the standard alias name.
we changed the label to mmuart to match the microchip documentation. 
would it make more sense to call mmuart but alias it to serial?
ie serial0 = &mmuart0;
> 
>>          };
> 
>>
>> -&emac0 {
>> +&spi0 {
>> +       status = "okay";
>> +       spidev@0 {
>> +               compatible = "spidev";
> 
> Please don't use "spidev", but a proper compatible value describing
> what is really connected.  If you want to use it with spidev (which
> is software policy, not hardware description), add that compatible
> value to drivers/spi/spidev.c:spidev_dt_ids[], or use driver_override
> in sysfs at runtime.
as i said to Krzysztof - this one was an oversight from me, that 
compatible has never been "spidev"  on its own in our internal tree and 
i mustve accidentally omitted the vendor string while making these patches.

Either way, after talking some more we decided that this entry is not 
appropriate anyway and i will drop it.
> 
>> +               reg = <0>; /* CS 0 */
>> +               spi-max-frequency = <10000000>;
>> +               status = "okay";
>> +       };
>> +};
>> +
>> +&spi1 {
>> +       status = "okay";
> 
> No slave devices specified?
no, but its exposed
> 
>> +};
>> +
>> +&qspi {
>> +       status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +       status = "okay";
>> +       pac193x: pac193x@10 {
> 
> adc@, I guess?
sure
> 
>> +               compatible = "microchip,pac1934";
>> +               reg = <0x10>;
>> +               samp-rate = <64>;
>> +               status = "okay";
>> +               ch0: channel0 {
>> +                       uohms-shunt-res = <10000>;
>> +                       rail-name = "VDDREG";
>> +                       channel_enabled;
>> +               };
>> +               ch1: channel1 {
>> +                       uohms-shunt-res = <10000>;
>> +                       rail-name = "VDDA25";
>> +                       channel_enabled;
>> +               };
>> +               ch2: channel2 {
>> +                       uohms-shunt-res = <10000>;
>> +                       rail-name = "VDD25";
>> +                       channel_enabled;
>> +               };
>> +               ch3: channel3 {
>> +                       uohms-shunt-res = <10000>;
>> +                       rail-name = "VDDA_REG";
>> +                       channel_enabled;
>> +               };
>> +       };
>> +};
> 
>> +&gpio2 {
>> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT
>> +               PLIC_INT_GPIO2_NON_DIRECT>;
> 
> Why override interrupts in the board .dts file?
> Doesn't this belong in the SoC .dtsi file?
The interrupt setup for the gpio isnt fixed, there is an option to 
either connect the individual gpio interrupts to the plic *or* they can 
be connected to a per gpio controller common interrupt, and it is up to 
the driver to read a register to determine which interrupt triggered the 
common/NON_DIRECT interrupt. This decision is made by a write to a 
system register in application code, which to us didn't seem like it 
belonged in the soc .dtsi.

Using the common interrupt for GPIO2 is the default on the 
polarfire-soc, there are only 38 per gpio line interrupts available of 
which 14 are connected to gpio0 and 24 to gpio1.

> Please group using angular brackets.
> 
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> 
>> @@ -145,49 +149,55 @@ cpu4_intc: interrupt-controller {
>>          soc {
>>                  #address-cells = <2>;
>>                  #size-cells = <2>;
>> -               compatible = "simple-bus";
>> +               compatible = "microchip,mpfs-soc", "simple-bus";
>>                  ranges;
>>
>> -               cache-controller@2010000 {
>> +               cctrllr: cache-controller@2010000 {
>>                          compatible = "sifive,fu540-c000-ccache", "cache";
>> +                       reg = <0x0 0x2010000 0x0 0x1000>;
>> +                       interrupt-parent = <&plic>;
>> +                       interrupts = <PLIC_INT_L2_METADATA_CORR
>> +                               PLIC_INT_L2_METADAT_UNCORR
>> +                               PLIC_INT_L2_DATA_CORR>;
> 
> Please group using angular brackets.
> 
>>                          cache-block-size = <64>;
>>                          cache-level = <2>;
>>                          cache-sets = <1024>;
>>                          cache-size = <2097152>;
>>                          cache-unified;
>> -                       interrupt-parent = <&plic>;
>> -                       interrupts = <1 2 3>;
>> -                       reg = <0x0 0x2010000 0x0 0x1000>;
>>                  };
>>
>> -               clint@2000000 {
>> +               clint: clint@2000000 {
>>                          compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>>                          reg = <0x0 0x2000000 0x0 0xC000>;
>> -                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
>> -                                               &cpu1_intc 3 &cpu1_intc 7
>> -                                               &cpu2_intc 3 &cpu2_intc 7
>> -                                               &cpu3_intc 3 &cpu3_intc 7
>> -                                               &cpu4_intc 3 &cpu4_intc 7>;
>> +                       interrupts-extended =
>> +                                       <&cpu0_intc HART_INT_M_SOFT &cpu0_intc HART_INT_M_TIMER
>> +                                        &cpu1_intc HART_INT_M_SOFT &cpu1_intc HART_INT_M_TIMER
>> +                                        &cpu2_intc HART_INT_M_SOFT &cpu2_intc HART_INT_M_TIMER
>> +                                        &cpu3_intc HART_INT_M_SOFT &cpu3_intc HART_INT_M_TIMER
>> +                                        &cpu4_intc HART_INT_M_SOFT &cpu4_intc HART_INT_M_TIMER>;
> 
> Please group using angular brackets.
> 
>>                  };
>>
>>                  plic: interrupt-controller@c000000 {
>> -                       #interrupt-cells = <1>;
>> -                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>> +                       compatible = "sifive,plic-1.0.0";
> 
> Why drop the first one again?
we felt it didnt make sense to have something that specifically 
references the fu540 in the device tree for this board.
> 
>>                          reg = <0x0 0xc000000 0x0 0x4000000>;
>> +                       #interrupt-cells = <1>;
>>                          riscv,ndev = <186>;
>>                          interrupt-controller;
>> -                       interrupts-extended = <&cpu0_intc 11
>> -                                       &cpu1_intc 11 &cpu1_intc 9
>> -                                       &cpu2_intc 11 &cpu2_intc 9
>> -                                       &cpu3_intc 11 &cpu3_intc 9
>> -                                       &cpu4_intc 11 &cpu4_intc 9>;
>> +                       interrupts-extended = <&cpu0_intc HART_INT_M_EXT
>> +                                       &cpu1_intc HART_INT_M_EXT &cpu1_intc HART_INT_S_EXT
>> +                                       &cpu2_intc HART_INT_M_EXT &cpu2_intc HART_INT_S_EXT
>> +                                       &cpu3_intc HART_INT_M_EXT &cpu3_intc HART_INT_S_EXT
>> +                                       &cpu4_intc HART_INT_M_EXT &cpu4_intc HART_INT_S_EXT>;
>>                  };
>>
>> -               dma@3000000 {
>> -                       compatible = "sifive,fu540-c000-pdma";
>> +               pdma: pdma@3000000 {
>> +                       compatible = "microchip,mpfs-pdma-uio";
>>                          reg = <0x0 0x3000000 0x0 0x8000>;
>>                          interrupt-parent = <&plic>;
>> -                       interrupts = <23 24 25 26 27 28 29 30>;
>> +                       interrupts = <PLIC_INT_DMA_CH0_DONE PLIC_INT_DMA_CH0_ERR
>> +                               PLIC_INT_DMA_CH1_DONE PLIC_INT_DMA_CH1_ERR
>> +                               PLIC_INT_DMA_CH2_DONE PLIC_INT_DMA_CH2_ERR
>> +                               PLIC_INT_DMA_CH3_DONE PLIC_INT_DMA_CH3_ERR>;
> 
> Please group using angular brackets.
> 
>>                          #dma-cells = <1>;
>>                  };
>>
>> @@ -205,7 +215,7 @@ clkcfg: clkcfg@20002000 {
>>                          clocks = <&refclk>;
>>                          #clock-cells = <1>;
>>                          clock-output-names = "cpu", "axi", "ahb", "envm",       /* 0-3   */
>> -                                "mac0", "mac1", "mmc", "timer",                /* 4-7   */
>> +                               "mac0", "mac1", "mmc", "timer",                 /* 4-7   */
>>                                  "mmuart0", "mmuart1", "mmuart2", "mmuart3",     /* 8-11  */
>>                                  "mmuart4", "spi0", "spi1", "i2c0",              /* 12-15 */
>>                                  "i2c1", "can0", "can1", "usb",                  /* 16-19 */
> 
> No need for clock-output-names at all.
> 
>>
>> -               emac1: ethernet@20112000 {
>> +               mac0: ethernet@20110000 {
>>                          compatible = "cdns,macb";
>> -                       reg = <0x0 0x20112000 0x0 0x2000>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       reg = <0x0 0x20110000 0x0 0x2000>;
>> +                       clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
>> +                       clock-names = "pclk", "hclk";
>>                          interrupt-parent = <&plic>;
>> -                       interrupts = <70 71 72 73>;
>> -                       local-mac-address = [00 00 00 00 00 00];
>> -                       clocks = <&clkcfg 5>, <&clkcfg 2>;
>> +                       interrupts = <PLIC_INT_MAC0_INT
>> +                               PLIC_INT_MAC0_QUEUE1
>> +                               PLIC_INT_MAC0_QUEUE2
>> +                               PLIC_INT_MAC0_QUEUE3
>> +                               PLIC_INT_MAC0_EMAC
>> +                               PLIC_INT_MAC0_MMSL>;
> 
> Please group using angular brackets.
> 
>> +                       mac-address = [56 34 12 00 FC 01];
> 
> Please drop this.
Is the problem here having mac-address instead of local-, having either 
at all or that we have populated it rather than just filling with 0s?
We set it in u-boot anyway, so I think dropping entirely is okay.
> 
>>                          status = "disabled";
>> +               };
>>
>> +               rtc: rtc@20124000 {
>> +                       compatible = "microchip,mpfs-rtc";
>>                          #address-cells = <1>;
>>                          #size-cells = <0>;
>> +                       reg = <0x0 0x20124000 0x0 0x1000>;
>> +                       clocks = <&clkcfg CLK_RTC>;
>> +                       clock-names = "rtc";
>> +                       interrupt-parent = <&plic>;
>> +                       interrupts = <PLIC_INT_RTC_WAKEUP PLIC_INT_RTC_MATCH>;
> 
> Please group using angular brackets.
> 
>> +                       status = "disabled";
>>                  };
>>
>> +               usb: usb@20201000 {
>> +                       compatible = "microchip,mpfs-usb-host";
>> +                       reg = <0x0 0x20201000 0x0 0x1000>;
>> +                       reg-names = "mc","control";
>> +                       clocks = <&clkcfg CLK_USB>;
>> +                       interrupt-parent = <&plic>;
>> +                       interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;
> 
> Please group using angular brackets.
> 
>> +                       interrupt-names = "dma","mc";
>> +                       dr_mode = "host";
>> +                       status = "disabled";
>> +               };
>> +
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
