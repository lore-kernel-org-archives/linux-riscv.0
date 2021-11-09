Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AC8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06023610F8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06023610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmwHmmo5NMA/8K89plZU27GjPlcBhff8HwIUYCwIk2Y=; b=dRNW2Hqz1M7pW/
	u2hbE7UhKate3EhohtlMWmKCBYpniSAaMDt3hEs0y2z1/cuh2g9FkxbOiXa5TqMZOg0zhnHD7f8Sx
	5odQzel1Kq2N5h7I2WcWgi9r+j1BzF6SlgW30x40UOAgSMFxdR5y/RODcNE5UHcwoJcj+hKiSr7Vk
	WkzAlEdnx/IMy+LKfeu8j33323YtymKYLHvapuIUPKuBh0KWNRXhVQ6c4xGNF27bIV3mTMDJoNQRW
	koAmF0sT4uSOeskNCDeDkpLdrB+GSEE24XsMznRrjufT9ytAzXPkuXfKKB+kfNqcf/SqAj1pNvvQ0
	Fm/QA0nWZa7pmNF23Zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQeD-0029Af-Vt; Tue, 09 Nov 2021 12:54:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQeA-00297A-O1
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 12:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636462482; x=1667998482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ixMUGfEdBbVU1vU9zXKdAaWjgZI0T2LUHYIfr13vB4E=;
 b=zRcA4BCZf9dKibFocf3kFhSnA92oHIuWNJ0gPqs9fIM3Z1kJylXzi4lO
 Vzd/YR9oVhoblxzYkUg1U46LnAOMtDZhEaxy52oveXNv7FKJhJLnrTpdM
 kNhtEi+QPsYQwv3X7BollsefUhnduUnfCBZRBgY6jrM28EQrUWr0KmHbm
 AFj5YUw+xUfyNjsX9aPJSgn9Ah/aad2esAH9yichJ+81mRrc/mvExMMA0
 bOl0F0CZB6S4HSxWdVR3u9wu7aKIEcGu2j8hguD8+H6xV5yh5LJHVmEZV
 YIrA2ieyilc6fUXI4JyK6l27OQu90QKelbz2HLOk9GsALdCCeP0pRp6Kh A==;
IronPort-SDR: JudQVwal95oSizLYoIBQD8v0wJGHdAcHyAOeECISdE+wVXstNG7nH8ff+WnxFHtZX5vW1UBnBV
 0H0WKdaWAVgWi3b7j1oAIV1RkwK59YvxUrm5ArVvmc1tKoUB6AT/m1UbALWRUeOw8W6zuehOqk
 1Yh8KOUXdKx3RwBFUogSye98AK9LArEwMgMPxyQjhaS5syNhLDg+O5dwGjwZnt1d73HcVXaDAD
 Nlzp3/ZD7+wnvp6fj58lGZhiPGmyDwIdCCDs3toFSRD8a4jleymgiWm3/KdL1LwL8hsY+5SBzn
 70vTRi0bs++bf/CrGr4WL1yq
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="143317230"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 05:54:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:54:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 05:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiTaIeMLsuilF3paK/921fN4XDZ4vwRwy2SlzyhVQ14EYjQ8c/v6BqC9uIINIQnUkJj14dQk1OFu1SV5hPum2wNYcR/vH6zzJU+LGL2FCPUv0FyQuXfBN+nSpSG+dz6gkitA5N8wmgSwwxVNLX84W5hReRPOFddfE3ufWlvY2c3TZujEFaC7T3WO5J74Na2pVIeqqmv0NMXa4t+Drjs+OSN6Nv8NyBDMAKKfwIPWCcJZYAMh26nVT94lI5J7IYyG2rHGI0DE8tSywJCSH2DGkYka8FtHJHel2lYrL2lS0JuuGzMZfE+B5ruwLwGKuiSQ+Ot8xAlVn7QvqQzr8t/+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixMUGfEdBbVU1vU9zXKdAaWjgZI0T2LUHYIfr13vB4E=;
 b=nSFJkIkYFWfwC/wa96RBx4dnIm1bIgF2ipWLAjRWXWKK/RhJ+WzKwr6MsOXggekxBJRzU5TAWauzRk33kVZZsjpeTRM44d6wio6gkWjGn4cfs7acme5U4DEOs5e/SDItQr2E/2YAlYJP3rGyBSFibiF2xjpx+djzkx2wtKEreVAuYjlnzLnFU50bv9hztSSIQK7G/sXQASuU0jhEC2Ei92YYYtsHECC1U2soNzqc1Vyi7g95dG66YAh1CzOPxGGGypjjrHmkT52L1Yzgw4v/a78g37QbsqV1ToySo2oBTFghOZHYPbhng2UzGzFWlBXGd9pxCqDHHSfxoigwIsftbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixMUGfEdBbVU1vU9zXKdAaWjgZI0T2LUHYIfr13vB4E=;
 b=EvLLtrpFxCM281lqZv90dJo/jAxSIFVEMZS7bsNYvtIck+jSJi44GZI3QUP+PvIkzDjYdNqQpQcL5YBDgB4YdkKac4zRRm9C/jJBdbptHQ5o0ez82gJr7MF3iD46XP2ZLst2CUaXqBbvek+i6b9QD8vSPi3mto/LxphcuBo6xsk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1549.namprd11.prod.outlook.com (2603:10b6:301:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 12:54:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:54:35 +0000
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
Thread-Index: AQHX1LJPDy+D8VJjOEmJwWP3EzXa3av6In2AgAEGMoA=
Date: Tue, 9 Nov 2021 12:54:35 +0000
Message-ID: <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
In-Reply-To: <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
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
x-ms-office365-filtering-correlation-id: bc5e9172-d1fd-49b8-b6a8-08d9a3801558
x-ms-traffictypediagnostic: MWHPR11MB1549:
x-microsoft-antispam-prvs: <MWHPR11MB1549A93ACF2FB0A5A52CF68198929@MWHPR11MB1549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ODZqgVG2YZcGwlV6g1wFkTX/5TdHttGHU511TLoXT1L57VBpnIaga4kgVETjXIUMaXW0Tm33aWe9lqA1Y6Jlp/oRY34bFHDGFKUwvoDPlJNg3S8Btex0dN0ZstZE7HJQ9HqBYiWIHKyDMLlxBTSOqwIcpXkhHDm3wLfXD1zA+3R0SSMi0GN4XsXNZqvZh/PiA6+QosOJU2fmulU7X5P2GlQJZyjqonRDqOU9532BC7RyHT+VvQhn0QlKX9ePIMtIreZu6gYFK1Jg99ryoGOcsUqpqjyHH4Llck7EFanRsn+gTHD+tN7b/oERFchasS1HZWp9/vwqcDyLLh4cQzL8vgoX6U7QHIuVd1PS6IvK639BfbW8LrrO6cqPDkvBFQxa7FCiVWsKBKjdyfkyvJojVi4KmTVTZ7aSRivfFi/XLnWGheUNnwgMQIYW3AmIWVOvZVeMiNcXP4FHxwaRqGicH8DuI/Y1Wau0MZybCPwCKHRWEUv5UCpkcXAbIV7wkPFFgyLWmAneNJBZFwEBgtKzPYv0L2gXzVkDfXohr79oR/cI4VWPG9ImECR29tPM5fPrJndt+6/pRCXIOYyqypD/XPrhzFu2nI6hgi5hKViZ4Df19n+DQobCa8oV5tHh/JwRKClx4wkK6DBl4YFRkxKGQDn6WRTGHjoXczHbeJYrc/6kIgQUulyIlR0+AC2gQDK/sVp5d8I5NuhDtir3KD7xdRX3LuJTkc0vXKdqnbccIgWM0BeZquHOtN/NuUZSpY2ic4a0Kof0YX1Vy9Hx9wAttwD2FiS1x4Pv/Wot+ld2n/oFOaAHzCXmf0uN09Z2swd4mNEuq665XwPRyieOVfTRBQ/ClK9A/qeAk7M6FB357/ddhKgN2NI3eNAgW8QGPwKiQTNgy1ODu7tii1Qf6D5ig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(8676002)(86362001)(6486002)(31686004)(26005)(66446008)(64756008)(66946007)(76116006)(91956017)(66476007)(186003)(66556008)(38070700005)(36756003)(4326008)(2616005)(54906003)(6512007)(508600001)(122000001)(6506007)(53546011)(316002)(6916009)(38100700002)(2906002)(5660300002)(31696002)(83380400001)(71200400001)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGNtbkt6OU00UUcyYmJwMVp6b0ViNmR1WmkwZDQ5YzYySm8wM0ZzT2V4aEZ4?=
 =?utf-8?B?dkUrZXhQdk1KdDR6b0hwbDQyYjRkenpHUlBhZlFlN21uT1ZLVVlGZkRnSmJL?=
 =?utf-8?B?VkNzc2J5TkVpZmlzTC95TWNIT1pabEpsejN1bWFwTzdMNjZrREdKRWd2MkVU?=
 =?utf-8?B?UHo1MkxNS1hocUVPNTQ2U1VWUXoxMzRGaGVIS0U0UUpwc0VrRUxvbVZrdkZ1?=
 =?utf-8?B?WXUxclBrbytlM3NpNXA5ZXdBZmdqY1F4Z2RSdHRkYnJCMWRaOGJDSTZ0UVg3?=
 =?utf-8?B?MG5YcjY3TnBDOGtkSTc4Rzg3SUpLSExRdDA3RkQ0WjdEcXY4UVpiTlRuNzBm?=
 =?utf-8?B?QzROb2N4MURCSVl2MlNrZTAxeWFscnRwYTZ0bnU4aU1VRUhtVWVCbjd6MEts?=
 =?utf-8?B?ampYeU5sUENxc2p3QmFRSDA4d3BaR0xxYWVaZk9uMHRjVXppQ3BxazdBQURI?=
 =?utf-8?B?MTVEQXliOU5HaDlQNUFjMXpLMFM1QUgvWDc0cWcrUmd6VE9LMjJrNkxEazF1?=
 =?utf-8?B?NmtZVE8wa1ZHL1RhQjVLMkRUaGs4RSt3dkFYT2ZlREpQWXFxakxlYlMyTXlu?=
 =?utf-8?B?TGNSWmFQSHlmRHd6UTBJM2hKb0g4WW5YNW9GMkFBZ01ZR25oM0JPNmFhMG9i?=
 =?utf-8?B?RFluQldkSCt3OEFPNTByNXJ4UVRZUXcxUzNZNVkzZElBOU5CcXRIaDJWQkhB?=
 =?utf-8?B?TFVzR21udUdQT3NXeFMxTlhwcGpBUUM4R2lSTEhsZmNoRmtCZGtjU2p4UVhj?=
 =?utf-8?B?cFRUd3oxZVN2V1lORXV1L0hpTW4zOTNGU0dnOU5rcmF6OWtmRGJBdFY3eVkz?=
 =?utf-8?B?dmVSRTdReHRnYlFZSE9Pc01lK05ici9odHZ2R3JsOVJiQ1NhcTgzNmJjQnRY?=
 =?utf-8?B?b3pPMVhjdmc0OXE0Rm9mQnlGeHZsbVd0MzF1WktsREhnSmJGM1VyVWlhVXZ2?=
 =?utf-8?B?M25zTnorNFFDSnFzdkRUOTR4R0IyN3Y4NmZPZjQxcy9VK0pjTHBhaWo5cENR?=
 =?utf-8?B?VHZRQlNQTVU0V29XYmRtbHl1RW1UV0NWaCtZb3pWU0Y4UmE2MnN1aDJpQ1Fs?=
 =?utf-8?B?SlNzbGxWNkJSaEYvdnZoTE9XOEhVbkhKMzAydjlTNHBpMHhnNys4U3lsbW5I?=
 =?utf-8?B?aEltckZoNlc4YW9PRGE4bnB1OGozQzlLVmV2VUhRRWowcTRNQlRRY254SmFs?=
 =?utf-8?B?OTg3TDlxRVJuRTJCT0FXU1crUGFuUDZFalAvTmtuQTY1VTJEaHNZbmVTZTdW?=
 =?utf-8?B?OXdGWk9JRTQ0NkJuZjNUTHpPckQvK2xyUmpNbjYrRzdVM2J6VzRFQ1p4emRR?=
 =?utf-8?B?dWVjem9aVHhDTURyQ253dVVoSzg5TGlPVlNJTlFMTlJXRmRwd2FSdWZpbmov?=
 =?utf-8?B?YmdINksyYnJYUUtlZVJhbW1KMG1od204V24vbW9BMUlXSDlDbUNXTjhEdGFQ?=
 =?utf-8?B?NEl0OHAzY25GS2RyOGF6U3NqVFQzVENDeFVoUE9IbTB1TWQ4UTVzZE9pdmRR?=
 =?utf-8?B?YXl4UlduOGpFZ0lWaGVQSmNDN3lzNkh0S1lYZVV1bVJuQ0dlOVVtUlBvQVBj?=
 =?utf-8?B?bVRHVk53L3ZKNVZTSUdCRWpkcFNKTDJyK0RRYzNqaHY3UmhqK3owaVd6ckVh?=
 =?utf-8?B?cExYRmRuU1cxSjlrSEhud1NjOWx4ZmJ4WFA5TnN0cEpGWXJEK1BPbWVYMXNC?=
 =?utf-8?B?MmRIWGdSeEcrQXdCdENGNHJESnBwa3M5V0llekw3V0hSZjRTN3FsRnJZVkJB?=
 =?utf-8?B?OS9OU1dTbDhjay9QQlVWV3NUVWVaSHZ6WGRGOHM5OVNsUmdTaTE5dVVYT3NC?=
 =?utf-8?B?SVJqQWwrZzRWUkozNHFMaHE0R3p0Q3orczUvbGNTRk4vaWs0RWoyZUxUellO?=
 =?utf-8?B?ekNuaWlCR1FOVFdnYm5ENk5WSW1vd1V3cGQ3TW9OVXVzd01EZDU4ZFY2Vng3?=
 =?utf-8?B?OC9TbTdoemdWVWx3NjJXZ3Z4UmlkMnAzeHJZVG5SME5jVmJuaktjM2t1dWtt?=
 =?utf-8?B?ZWpRc25vMzRLOHFuZ2ZITEN6QjVMTU42dEdFMzhudE1BeGZKaFI1WnBpdTR1?=
 =?utf-8?B?SThBMGZDSmZDdHl0VVprbFFTT25DRmQvZWNUYXJLRmZ0Nng2R1lXR3dMZTZS?=
 =?utf-8?B?SUR4SXdWaWxSSkpWb3lvZXYvWjZsWHlmaitzWjI4RFB2NFJOcCtBVHA0d3Z3?=
 =?utf-8?B?ejQwMnpKT0lJYVJIaDd6OCtzZzdLNllmSGhXRzhzekFtUjl6enUxVzVGeTFo?=
 =?utf-8?B?ckhMcnFhclBOaytYYllaeTZuSkh3PT0=?=
Content-ID: <3D9CDDAE0F751C41BA00C2B42FF2F42B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5e9172-d1fd-49b8-b6a8-08d9a3801558
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:54:35.6991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULGmSRabj/pOox+nfN+AEINNGO9V/+Bd3z6B3xPMgxguG3Vyo4yxg6emqeC9uVJQQItWvU1w8Yil1MPTAv52TO5oLKfxEy98tHr4eQtHhnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_045442_850030_87C5F67E 
X-CRM114-Status: GOOD (  19.91  )
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

On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the hardware rng device accessed via
>> the system services on the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>> new file mode 100644
>> index 000000000000..e8ecb3538a86
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>> @@ -0,0 +1,31 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Microchip MPFS random number generator
>> +
>> +maintainers:
>> +  - Conor Dooley <conor.dooley@microchip.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: microchip,polarfire-soc-rng
>> +
>> +  syscontroller:
>> +    maxItems: 1
>> +    description: name of the system controller device node
> 
> There are several issues with this:
> 1. You need to describe the type.
> 2. Description is not helpful (just copying the name of property) and
> actually misleading because you do not put there the name of device node.
> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
> please use existing syscon bindings.
1 & 2 - Correct, it is bad & I'll write a better description for it.
3 - Its a system controller implemented as a mailbox. The syscontroller 
is the mailbox client, which the rng and generic drivers both use.
> 
>> +
>> +required:
>> +  - compatible
>> +  - "syscontroller"
> 
> No need for quotes.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    hwrandom: hwrandom {
>> +        compatible = "microchip,polarfire-soc-rng";
>> +        syscontroller = <&syscontroller>;
>> +    };
>>
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
