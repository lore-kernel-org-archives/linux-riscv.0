Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6A9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:58:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3727C61152
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 12:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3727C61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYtP6e1yOpjELy1Nxbnf3c460g7mXTG1KArGfpvF03Q=; b=fnSslNYPLAdMzX
	jvTjB9F+j5n9gkUPnkVv8I7St3iwSLrRt2r+/w0jMJcaIo3w3OjouHoMd3z6EAXvfcAEAeuEZnyEb
	IVOuR5UDU00VG3JRjSjMmOCQnsMIY25Nzfo8/BE/3qL4yajao6jFiAoDr0DLmWUof1gu0TkJ2sC5h
	naRsBCbtHtl0IAVvCBma35iHasHO9HT8XCcVIFV2OY4KQzzGs4d/1+rBjoaRwDcbXM7EI8/OeKT10
	vVsDA/Zsv5CI/kKRbGp+edOjpVAEQJhfvjiAAKCiCXFR9duTZpK+QGsjRQeHWtlUThYZqMNe7XiNs
	wci16LeZz77i+9EVrkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQho-002B2t-4n; Tue, 09 Nov 2021 12:58:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQhj-002Az4-QU
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 12:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636462703; x=1667998703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f5WQPrn2Bi744XemAxe8Tzk1ZJIquWHtLn+YldyQG8M=;
 b=XI7ExQn6h61mLxqfkSQfCYyg44eG8Ao/A1dqCTZNMc2iVN/atCPhBhaR
 yEQjinDhz6NY8J7W1+ZLL0/NY07Em4fctdS2IAyusjc2/f7Xbl3TgxZcY
 MUlBijiAs0UCLseo1lSLDD4okYt0qzhnSLUakXz26jCnPaYxSj1Q4uzda
 BWBFEwVvaMjTTrP01e+qxAZaca/EVYSI3CsadA/zvFEa38ucF2o6wBiBl
 YsRTCZf1LjzF22kdFNCCamT/qp7CMulxAu/iNEExghbeNAb4L3TviqIEu
 zjJf0oqbsXqhLWi67bIoG9PfjGALBGOZxRcFH72LwZxl/U0fY6WL6q8LY Q==;
IronPort-SDR: WWW1riFrEUXFLW7v8t6A8ArYCc9WEhdXmgkDbcTGAiKl3eNyNorjr0Uqf6k8sPdReLXy5xrayY
 g/RkjtFL71Klh9yF1wkL8g7+z7XzLd5k2Be+wXaEunio9KO5KCxzgAarU2YUOA/lTbBQCttMDS
 niveL339epIH31ZWsO18ihjTdbLfQWIJYFntjQFZZRPwkAKRbqqszU4CkIZueUSCHgADqiwL1C
 +yJtX7nfpEs6V142w1ydRTVkh5Lh4iFwZEnYuY84VPxc2u784SXkNe7iiEVtMJjRJ3ZXdZ+3ui
 6WYCapPmLeSF65cBB+V6+tIp
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="135968426"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 05:58:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:58:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 9 Nov 2021 05:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccdDh2aun+xq5DnkgbfsDdQ4NQ7bpMzPVHe6g4Q+9IPYy5cAixvVdEDjoEAZEpUdRV8c9E00Zqu/mpQueeAZK6jswQnUBc5EYvj+obFn+LI+g4JsfHfV1YM1bqAccO4Ct8K8BinILOasPL63/tFppeEX/aRqJ065ECSyyvPeSGsW6i6a8xMBcs7mjCNnHA2QMPvAaElwtTjWRK+HeBEkU8CGW1ivSQ0C4m8y9eT10/NoI4UrPLb2kQGdwx++CTLkhGwkD1PKJL3Jt+ckw7XAaiuZ8Lh31+/fT4iRXkF49nRysCDOqrfMzoC2MO+flHHxlOg+fFSrqPC41nQ+rqBtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5WQPrn2Bi744XemAxe8Tzk1ZJIquWHtLn+YldyQG8M=;
 b=FLRCVP9lKx1TBXxfryPj7cIl9wuHdaNWcDuD/F9t1r/wCI+J9sBGd7U9jvv1fIEQ+hBEtkTiyPXeKhIihRBs7aI4oNLP7SWRlXrsRuJPrkDa4uad65+PmUYB4PQlH6+Zt0H+A//fakIAsphr6HmHl4djFlqsjllWxVhtYYPb7a24Pms853BqfMrrqrj6CKe8sPRpWgFhmublNiHv8j1oWcNxrZ41vDjYUSlGZa5FSnm4NK1jOQ/HArSE506/7uFcv0m4bvjTree5k00FIwSVBVCHhyxXMnXxdXjH37cJaiYEXmZ3kTeBdC0yvfn27otOSqmVVDIavcvnKDEklql4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5WQPrn2Bi744XemAxe8Tzk1ZJIquWHtLn+YldyQG8M=;
 b=fBVXYHOGz133Mju1Xehib5OGZwxrehvrB9ygBWR4zQWBBLaKMqweZFGGYQTUbCGTqvQBWLfRO9Rer1sRaM3S5ozTeuAczq+fkEcFnitw5zwQnIBCOBfqW3IMMpiHhn5rab1H4ZidhouWG3DbBzokXYaXOjDqCv/IMG0IBxHVUbU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 12:58:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:58:15 +0000
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
Thread-Index: AQHX1LJfUqgSbOdkdUS8ce/NVnrEbqv6lPOAgACJDYCAAAokAIAAAZGA
Date: Tue, 9 Nov 2021 12:58:15 +0000
Message-ID: <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
In-Reply-To: <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
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
x-ms-office365-filtering-correlation-id: dfbc5b48-2644-4568-7870-08d9a380985b
x-ms-traffictypediagnostic: MW3PR11MB4585:
x-microsoft-antispam-prvs: <MW3PR11MB4585CCAB94CD2C83743D6DDD98929@MW3PR11MB4585.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FbiIWCx67V7fry5Ieia8LyStvpFbQgZdzfvBiEAk7WFykiN6i2wMgJfXwWv86W4x0c1a3UCBcRdDIL4fOx7zpqJ8RFtOW6S0X23cLOQ+ZS11E8g0f3/Rm7JTWbiYyc1JJU2xnN0BRNyqggBmROCXujMBTLoDQn+W7oDGCjWAC5V7WnRENIgxPtv1pVyIeVYFmbqdFz7rs6fzhTqQhE5snXADpuCbdAqZK/L/B0KiyXg78jZ5tcDhqz58fsQFwZGWmJGlsewK6tgHc9k26R0sGprkrZUw8KwshKPyz5QZWa6HR2GOSqchKINLerHdhl/7loUxTKyxDq2kskc1kO5Q+DjclymNgfgYdOCU/qyM9Ql1YnkihF/ARunXlSpRcgEpV6N84pwov6tEodyhtF6Crl0Btfy6Aepa/h8bPsLB13HicGttos3f1drp6Bak6Jst4rjDBcAXECoMThD6N70a+BNMRkB784mj9VxfVbHatTwBZ3oEdEPayfdPJh46vy2LjBPs71rCBNf8aaMtbomqPMwcTsV7k7aoG7urNh4+3yZfu7weVIi9dagNarTsHz9zw80byMaTpXe9aeFJFVNTW5yvMCNvd2qKNJCy368QhXJkEVcXecHdLHUWqT6ohLeHDta1DnoyBnyTenpoWZ87nCX7AL++BRt6sllACMa1SXo2bW0ZgAimOi4/PHtnKCKN7ipJ453Dcx6K+/BCGrYtjI1Qnqu49hsYT5VvA3QaglfCmqE1aCNEuVRPUqujetnJM24EfinbrdvovJ81PGZbTPoQL6AfWC95e3pdwYZK5eHpVrU849H0TJg0T4vMY7li9ro2sst4z8ryev1DiOT53hMgpvJAtODNbl3LXFcX9Pk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(2616005)(8936002)(110136005)(38070700005)(5660300002)(83380400001)(966005)(508600001)(6506007)(71200400001)(7416002)(53546011)(76116006)(38100700002)(6486002)(186003)(122000001)(64756008)(31686004)(6512007)(8676002)(36756003)(54906003)(66476007)(66446008)(86362001)(66556008)(66946007)(91956017)(4326008)(2906002)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0dPand4NlcwQ0ZpWVFudWFSUUxIOGRtWm83Mmhlak1tSytIOEZOaTY5TUhi?=
 =?utf-8?B?THVrdHZncWNNYS9BUHczQVBzcmxrYTd1elJXakg4Y2VSRzFkaFdVTmVPSEJK?=
 =?utf-8?B?VHpJcmhEc2ZnaHh1clVOSTBJdGVpZTdCdDZ0LzNQTEQvM2QrRFBMNE5SdHdv?=
 =?utf-8?B?VVBEZTJ6TDFKbnF2M21HbktXSlltRFRYTjh0anVyRzYzNnU2b3RVdi9NcWg0?=
 =?utf-8?B?NndIR0o2TDBKcXF0ZkdZdzIwWmNRZlNlV2xBVFBZTHNBcGpxcTFDUGRiRUt5?=
 =?utf-8?B?YUI5czZDa2M3L2EvMzZkYTNKRW5HT2ZSUFh3N3VSMWRPSDVhcGFxdHlJOUhy?=
 =?utf-8?B?b2RqZDV6NmhLWDVSblZJUDY1OGNsYlh5ZzZoZVp0VWRHUkpJOHBrV2VPekY2?=
 =?utf-8?B?VnEvTDNBWXVQTmlHUmNlYzdiVndjdW9aL0hFcmxNN1pWNUs4Q1l3Nk1XVEJM?=
 =?utf-8?B?NTM3ejJEOGY1WThsbWlBRkttYXM0dmQ4TmlxTnN1eHZTTmdtdHA0a3ZCTHBX?=
 =?utf-8?B?NWp6WkFDUGRVRXZyejg1NVY5YStJSVRRZjZQK1E5aFRSWmxhZHFmV0hSVmRm?=
 =?utf-8?B?TWprVkpUb0JCZ21OcTg1Mk01NUlvNHVsU1FPSUJuOWxzNFV1MG4zR1k0eGRT?=
 =?utf-8?B?VTUwZTB5K0pIeXZiOFlOS1R5dUNjcVZ6dkUyL0hpR3U3QTFxOG4ybWhXbzJ4?=
 =?utf-8?B?cXQ5MGxzVDBEUGV1VWZRdXlmQjNoSjRWSU8rM3JaSzk3cS9sNmpoWU9XaFR2?=
 =?utf-8?B?UkNzcTkvMHpTbGg0cWkyMU9EeFJPV1MzUlZUNHpYZU9FVkw3K1lHR1NpcGl3?=
 =?utf-8?B?M2FVSTFVOW9GdlJNY1FTcWpYTkpiNUxTdUlyMTNHdXpRZHVGdXdIU2lmNWV2?=
 =?utf-8?B?aXlYVHVKbmFuZTVTanFmeWFxT3pGTWNFRVNWSGNadGJhakpNOTJhemlrY1lB?=
 =?utf-8?B?bHE1TElUekFjNUZRVitHUlJPRVRicjhjTC92SjROWXZ0K2NuV0g3alZSaDAw?=
 =?utf-8?B?ZGdVRUNFQU1BTXphcHh1YVZta1E0YXE2c3VFWUlTVTc1YUNMNGNpdDFMZnp2?=
 =?utf-8?B?eStmdHhHN3BHMEl4SHZnTmJqR2wyajdGbnFheFFjb1RnK3JPMmhEMkEydlhM?=
 =?utf-8?B?b0d5VG41TWdwUFR4RkE0TnhFMytyR3ZlVEtNV0pLbS81cGFQOEVkMjBpMlVy?=
 =?utf-8?B?SjNuZlNaWWRvdndiZTBxcGRXbVZZNDB4RDI4MjFIb08vV2FGejQrUHE2dVpi?=
 =?utf-8?B?bEsxWFZDa2lEMlJBaDhlaGk2RU83ak00aGFhZ2ZNTjZmeXJxcnByVkV2cjVr?=
 =?utf-8?B?R20wakVNQjh6MWNIcXRCdlVvZVIrd3hxcU9BQXZQaWl2MlhQazBhK0JOYnBQ?=
 =?utf-8?B?SWEwblhOZFFSY1dDZHVlZzVObGlSb2twVXV2LzdRdHg4ek5YbDN3TGRhQlZL?=
 =?utf-8?B?R2ZmSnNmb3hsS2xsc25nc2NBV0J1SnNsb2g0MjhKYlNRZjl1WE95VjB0amRM?=
 =?utf-8?B?MVZENzdaQWVPNHlCYlRnUy91Y3VrREtQTUFQVHRNU1VHRnBPQjhRNWN2bXdQ?=
 =?utf-8?B?V2RDbWp0U1BNYUM3Y01uU3FtUWNlcGhLaUs5Vit3bXlieHJQaW0yMWtUSlpv?=
 =?utf-8?B?TUE3dkpPTWNJdmdQK3FEbjZvL1pVamU5V09RRUhSWk56dDl3RmVSYUFYY01Q?=
 =?utf-8?B?cXE1MWRQNFIxcE4zTUIySmNEVXRiY2RmaWNRNXMyT1VzRkpOaHkvV2RQVEVh?=
 =?utf-8?B?K3dZKzhDcVhBQnZtSlFNVjVzNGhYN3owUVdjQjc0V0YzcG9zRDY5blF4WElv?=
 =?utf-8?B?OVI1aSt2ZndqK3NuKzg5MHFXVmJRakFNSjEzYUNlQ29lbHI0T2lyR2pCSUpa?=
 =?utf-8?B?bmJ2bmFiUy9WRFRLa2M2cTVydWd2ZVpCWTN3R05vTVhoSER1Y2xMaHhkcUd0?=
 =?utf-8?B?WkVDTWJJNFMxT2ltSzVIcEord0dqQ3RGOTlQeXpCeEtRYVA5NE1zdkkzQnE2?=
 =?utf-8?B?ZmxqcCtXa1ltMkkxamVjeEZDeDZiWG5lMUhUNHZ0ZGx6ZnJyUVlJOC94V1ZY?=
 =?utf-8?B?MmIyWHdCa0QveThMN0JzRy9jWXRLNzZzb2s0OFYyTW9zV0E4U3kzNzltMmM1?=
 =?utf-8?B?bm9UVGU1Q2pqOHN4bmlmdENMWENKM0YzaVhxL0JRTjB3b1JaVE1obWhtSWFP?=
 =?utf-8?B?ditMeGd0WVBGQnBrV0NHQnBRQ1NETDcvMWxXcHpsSWtXY202MW5IbFEwaGRQ?=
 =?utf-8?B?MkdzNTNyNXlTQVVTWXQrOWRFYkdRPT0=?=
Content-ID: <C2198F6A72D17B46832B9C69C7072F6C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbc5b48-2644-4568-7870-08d9a380985b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:58:15.5176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JQmzviz+1cGidGiE77iHPZZqXqA2zh97ATtSOuofcv/7NumEz9FlKThZXwYf9U/hme4qKkQtUEKORJ0S0UyDXIP1JFbS/ebPB6vAqWTHlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_045824_072538_E9E99EEC 
X-CRM114-Status: GOOD (  20.36  )
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

On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>> On 09/11/2021 04:06, Rob Herring wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> Add device tree bindings for the {q,}spi controller on
>>>> the Microchip PolarFire SoC.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>    .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>    1 file changed, 72 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>
>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>      19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>> Rob,
>> Should I drop the header from the example or is there a way for me
>> specify the dependent patch to pass this check?
> 
> The error has to be fixed, although not necessarily by dropping the
> header, but by posting it. How this can pass on your system? There is no
> such file added in this patchset.
I linked the patch adding the clock as a dependency in the cover letter 
[1], which is why I was wondering if there was a better way to do so 
that would get picked up by the checker bot.

[1] 
https://lore.kernel.org/linux-clk/20210818141102.36655-2-daire.mcnamara@microchip.com/
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
