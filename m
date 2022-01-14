Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2513EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVuIevepb6iLrBo+NgWY527iiI+6MBTULrs6x+AWlME=; b=PhVu51xsReW7qY
	2g5RcdCTeA6dz3/LY4aNuISY1R22lgBTN790tsWJB80UhnCOxIO+DSM/rIy0U5CQU4PutLMf00aND
	mbX6GQIcdHNlSVzoTcpAze4b02WbqDft4i7CKej3GNNM3a5UASkiuGuZTeZB+ogOBQ790ElStWiO5
	5QaMi+nLWSs1fcvrePmj6wG3EwjvbwFuiwNT7HTAz+4+yYpvY6z4B7Wx4tanZ1DajLdD2M9mVpmic
	tZ8Kc61QmHalkT2BN9/Fp3vzTH41zl0HXURdkXAzvZ+PaPn8YrJus8Rr4C7M+9Ptoxi4EhRK5Aq7j
	oFay8KTHwWQ80KOa4DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8MkQ-009Djc-Hh; Fri, 14 Jan 2022 13:36:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8MkN-009Di9-Lt
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 13:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642167363; x=1673703363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x0ZIDT/f/Yv/si8+tvV8M5yI5P+VCzG7kk8/+rwcMjs=;
 b=RycgByfSZZ88FEJPk1UjvA5OdZCp7GVwgxYbabEOQneAx9o6s7Pg0GiU
 v5pEpxwAm/5IMw0Y7Cj10bZqCBJVmaXuKnhFsbMsNaeM0k/QfTf+jEumG
 o6cFdgLQ/GaOu96bhceV5IlwI91CLuPBROn/g3kaMFoBAt+fOEGjg5ByA
 QkNElUzbLeTY/1kZ779aWzKVRkF8+fdq2HDFEw6BYiPQ1R3vOZsbaju3m
 ldNmioVlzO/wH37gWeOaIE0Uw5g1FY0gT5NslwAd7dnvhXhT2vu6XxYcC
 LfrbG3iZq4BWXW/Daq/N0xYu/06X2xFuXmC8sxgyHitp5Ce0TRcLJIIWY Q==;
IronPort-SDR: mQYChvmdbJMym3//f/lpad/vSJgSved3uRi7VaSS1Q6j/LgKb7T0BWM/CL66xULjwG0r/+zJY+
 g6gbXW+FTPLqk3OV6epJwhwQxwV9wL2iz1rdvjBpyK/wn5ujEqmKsBDfn4SjL1edWvVHL5YOSF
 GJV4t5jdHJNnlW5TAJpM37Z0XW8HFw5iXRJdaLw5LmDihFZYPPWs6tzkIGu+/WPY4tOiqgnx1x
 Jhpo4ebXx/+AhYYC3UHGDH69ZaVWk4AWMLf2LEtJrK0ud21YuHN+dAjQMRxQtm5zi6hPwXYBJv
 8n99AfUX7QuS8FR/jNZlQPc5
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="82513208"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jan 2022 06:35:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 06:35:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 06:35:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kawDYz+xQ0yQq+X2gv7fTv7UzVULZUU3W7RDo98m733wlOK77xhCDKWlsNUHvp4g5wZxHt2YKHA55vMQHK/sgtOsaHGVOKTZmmj8RU9ptRF5kqynb5fdVDtZTlXFOg4npTLBaZiI/C11g2+hQY7vfpvDGHuvR98N+aIZCTb6dHqGVppzn+3S24ZRpjuBHZ83S/oEuX44pBTzq2iRvYh/fTWQu307ar3S4JcztVY8074EfR33IMbSRScUc6aYD1C8eEciKMsOahTATPtdywTS8ASlnk6CpzWcjcS0H3pGZD2cV3GnrwgFyr01YahMe4A7o/rwEyo4F2urn12KHoE+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0ZIDT/f/Yv/si8+tvV8M5yI5P+VCzG7kk8/+rwcMjs=;
 b=PkReSfvd3q+GsDkKetgNFNANzXlt6S0GBYdNd0Y4fA+RX95yiCLwTCpgbBkNqpGd2wTXZhz49chLmuAtGbqBoQ63wgKQ7khR+r5bdgK+CV+h1GjVC+f0AzX2cBckf4x1s7o0UKzza+x9R+4Ws9twc/4at4bu9hY4LNV2f6Gd8Hl56GvhqWnL/Wf4Kl/YeOJA6sY26kWhlfSWDdxVsdldypUw5CvRb6yyI5O0/ynsbqb564XdwgdMysOx9CQpXNHKeicE4tZ1w6bgD3j6UkBbJeUhaw7zULut71jIHZH1XkdXCPY3QLHttC0Haz7AD0BApRu/+wKLDI8RxNrosusQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0ZIDT/f/Yv/si8+tvV8M5yI5P+VCzG7kk8/+rwcMjs=;
 b=IX2QZsIp/bxjw7fdrDrkxDDkdJkbRJCrQ4xNxcTzCFaHNgqv0X8EnNKBsOEL9OmkUc7FfDgQVZ6x9080oyjt9fwkQkabBiEtFRNiYuciJG4W9hIb+5oVSK/P68NN0EXS4O/2fmA0r36qJIWiHWfTV0XLRG2+9Vvp/mwoHmOmefo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM6PR11MB3579.namprd11.prod.outlook.com (2603:10b6:5:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 14 Jan
 2022 13:35:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 13:35:52 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <robh+dt@kernel.org>
CC: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atish.patra@wdc.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Topic: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Index: AQHX8ylFKW6kqD5p50ew7h8tB9OgBKw2sbwAgCv/9oA=
Date: Fri, 14 Jan 2022 13:35:52 +0000
Message-ID: <5b5deada-b9d5-5e35-7876-f5b94e792cf2@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
 <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1aed9974-c3f0-4c6e-044d-08d9d762c905
x-ms-traffictypediagnostic: DM6PR11MB3579:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3579A43D7A556030F03FABFB98549@DM6PR11MB3579.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mlKJcGOHKObCZJzEpQ1NBlezUjbuanp4r4pkCgjnxlGnCTYEgW8d0Yu5/0iXM2thCmxXNwi1rHRk7n16EF79nMW0m5ym0k24LsoQtTnlSGYhEAwLkqMzVV9CT900VezKhiq65fWKwN8k9SwNaR1ggGcp3LhLtZcpz7+nvW8vb3wfpCKVPLsy4ppoy/LxCwL6+eT9ewRnxymgK9abvUeaYX8nKW+PvNiEoiSou7LxgjNmSoB4Xk8XAFe34bj5FGIRKKgXpgpyPza9+B/Gkt0/FFUu456WkW+NAtEi4b206cZSOYXOE7xSyBbqUpg2MLy/zsjqdaPsKDq2SUsk9QdVlFIz1y3XyUT9CQJzc/UON5raVP2Gm8de8MTefWt4dlYVhRb/45ndVJ/jjzbywinrPbvIkBD2JSH7w+RvJ5y8tkW4TkjMlFOdz9RcabqnaEnJNHmda2y0+FAM0aB8WFGCekX7I+0kD0OQ8rUVv/NBi08hCFNceMI9bqixKNFN0/xqYqhciXJ79+4eHj6VsoKeDtW3eGaE0Poj2PbTmj030dewxMrH95/AS427NKNmXXQpwtbCOyffxpTCg2SeMc+111wyLYFeLLcMWxSVqeI1I56Izhw2S27N0b2Pzz+GFDpCt9jCklODfstM59Tn4YQZuVMUnhapQOVYqDS9phPikNY6SAEO5DnmDf1DDr4eGw/zLKG6MK/MFYeEkbm3BsUjrMvS8F6VgsMr+onLAc8z1nA7i5m76YEQUSUU0HkrMsRgeTg0JVfmeRYWtP606vC+bw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(31686004)(6512007)(36756003)(8676002)(6506007)(54906003)(83380400001)(122000001)(38100700002)(7416002)(38070700005)(86362001)(8936002)(53546011)(91956017)(186003)(66476007)(110136005)(26005)(66946007)(71200400001)(31696002)(4326008)(5660300002)(66446008)(6486002)(64756008)(66556008)(76116006)(316002)(508600001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vzd5T2RGOHhrYy8vbzBvUTJuVVQ4OTgyK0NWY0ZaemcrSGtnM2Z0SkJVQjhC?=
 =?utf-8?B?cjlQSXpFaDdLS1dOZmRyUHJ3NDNldUcwVE8zVlp3bHRyTWl1K0ZiS1J2MlJO?=
 =?utf-8?B?WlpObkU3blVycnU1ZVQyVkF1eUxzQXRyeWNtdnNldWdpTjFCaU52WWZmSEVx?=
 =?utf-8?B?ZEoxWHd1Mkx4bkxSNmVKeHlkaUxoOURoMTRhRm9oVHROSGl3N01KeEtiZ2cy?=
 =?utf-8?B?UWtOZWFCeUZXZlRMaDZKQ1A5cWQzL3lOa2MzN21nc1BtUk1GVzY4eU9EMFJm?=
 =?utf-8?B?RkJIOFJKQmlkZHplSXRpOG5ZT0tuR3lkQkYzSUVGci9WdVJKNU9uNmZoU0Yw?=
 =?utf-8?B?MzRCZDN3SXZHejk2VHF6QU9EVmVpKzlEUTRCMkNJZzMzZlAyblJwMGFJN3dj?=
 =?utf-8?B?MjQ4SjlRZnZUMkUxdUJMRzBLZHN3bzhwNm1iV09seE1ML3JtYk1rNXNRSmJn?=
 =?utf-8?B?dEtkQVF4a2xTWHBKN1czSnNNcDBsQXEycTBSZ2x4eUtwRGYxdGltS0R0UmdY?=
 =?utf-8?B?MFByeHJkNUtURWlXZ1VUNUM0VWkxekR0ZWhFQW05UEphdjZVbm8xL0JlMXRE?=
 =?utf-8?B?bER3TWJQdVJBUVpBTzd3ZG84bkliSkFUUDBTVmdpN0NvR0J2czltR3AzZ0hv?=
 =?utf-8?B?RXNBV3E0TGNIMnk0QitFSkZyV3NXck5yazVIanNoNTB6bTVERFF2bnpJcnZv?=
 =?utf-8?B?QzVlRFlzZEpmKzN6Tmkwa08yTmNnSjRSVHhybmVwL0FBT3FiOHdleXlUL2N5?=
 =?utf-8?B?OHJuU1JyVXNhZTZVWVRLUGJ3aU1SUlNFeEJqRUNPTzJzNTMzVThGajh0Qnd4?=
 =?utf-8?B?NTVHTm1GdHhLZlFWZWIxSVNmZ3V1NHNZOElXWkFNeFZCNVBNUHF3REZUZ1g1?=
 =?utf-8?B?OG5RcHdidE5jK1VHN2dEblNYMnF0NUZmRVRvSzluYTVhSnhrTmw0MS9adkxV?=
 =?utf-8?B?VXFtaEp4V0lOekJFU3JCazQ0NDl3RktQc3V1YlBjVVgvZzVEcDZ0bzl6eEht?=
 =?utf-8?B?TDBpRllsd2txNklPNjkrUFB5eGlKTHdCS01JdWt2SStiRnh4SnAwa09NcDRw?=
 =?utf-8?B?RzRzcGpGMGV3dGJhREdwZEpHODl0M2dWSkdJZUhJWWluV1M2UC81Z3pkWWhq?=
 =?utf-8?B?aGhrQzVIUXAyMDBrcmVxYVlhbytRQXNHQTNxLzlnNjZBL3VSYlJnalQ5c2NH?=
 =?utf-8?B?MkxjbHFNc2dqaXdVZlYvM291NlM1S0d6VmVNQ1BEWDlEZnhTNlI5akloYUoy?=
 =?utf-8?B?K1cyU2Jyc2MySVo0TWxhcVg3S3BWT3lDbDR3eEdrdlYwNzJ1OEZGZVJEK0JU?=
 =?utf-8?B?RTZWSHBRaUlsTG12bGpFVkFLaW9hUGhnbmd5K3lDeDlTMG82S3dVMk9XWndy?=
 =?utf-8?B?Sy94em85YURjWXRGT2hZRVMxbEhoTjVDMXg3UExWN2dLR1AzWXh2b2JlVUQz?=
 =?utf-8?B?V2lkQUFQMmIvb2FTdHRNcnNkVVc5bkZSNW5rcFJacEV5TlFTYktGVGxnOG9Y?=
 =?utf-8?B?QmMxNk1zV2s3bUlnSVpIZ1kyMlhNRHhnZS9JQk9nbHA4aVArYVZZYTlmTU8x?=
 =?utf-8?B?Y0JFMUk1UFlGcVpSNUJ0Z2Z3MUJHVmgyOGcrc01yd3FZb3FnV2MvaWxTV2Rj?=
 =?utf-8?B?R2ZuNmkzT1pjd0llcDhtL2RmNTlyUGZiTDFjTi9QekdmNlh1b3Fla1pmeThI?=
 =?utf-8?B?QzJKcEVkc01hZTMrSGRMd2JnZkc3anJ0ZXNEalBIUWswOGNPVklNKzZqNmxS?=
 =?utf-8?B?aHo1d3I2SldiRnlMa1JWR1ZQUkRJdFVyS2s5SUdaUTFpZUNlQ29SUmpFeUtQ?=
 =?utf-8?B?WTltZ2N6SytWSWZaakE0d0p2OENoK1cxOC9qK2hZbVZpcEdoUC8wUFRzZC8x?=
 =?utf-8?B?Um1Pa0c5blRLNjVhWEdTQk5PU29maEg0NnFLbVhMa2dHd2d3NVBOb3VnNGlF?=
 =?utf-8?B?bUM0UnRxZEw1YmNMRnBGWExqb2l5R2hqb0FHWXE5V0VtSm54RlhLakgyNFY5?=
 =?utf-8?B?WFhwRGR3ejkxSnhnYmtMS3lSaTFnUWpsQmk1WnJ5bysxU0xIRW1XOHY5QzEv?=
 =?utf-8?B?N2l4M082eDNJaXBmbXNXeWZRY3NwSmRTWUxsVThtV0x1QUVxYkt6R0QwZHRp?=
 =?utf-8?B?aCsxa0JsaDlpUFQ4dENIWlY4OWtIY05RQzE1Sk9BejN4REdTOGVFMUozQmt4?=
 =?utf-8?B?VTRQUmF1eUJEQTBTYnlXTjc2eGpqTEJYUDFBc0EwMXJiUmkwcHB2V0g3SlRQ?=
 =?utf-8?B?TnFIV0lNZDVhVEJWOWFjQXdjMzh3PT0=?=
Content-ID: <5913DF09F0240C428DF89194B4A70127@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aed9974-c3f0-4c6e-044d-08d9d762c905
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 13:35:52.6921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +q1FxoUuH0yyJ1r5UIs0/g20aR7SySoPYD9lZO17y0MHYwjRzigQ03uB6EQMqas2wgrHmdMzGJ4UOVj0zZt7xKKwBcwi/CG3ddEzr95oYL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3579
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_053603_924034_AAD6C05F 
X-CRM114-Status: GOOD (  25.19  )
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

On 17/12/2021 13:43, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Split the device tree for the Microchip MPFS into two sections by adding
>> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
>> FPGA fabric.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>> +
>> +/ {
>> +       corePWM0: pwm@41000000 {
>> +               compatible = "microchip,corepwm";
>> +               reg = <0x0 0x41000000 0x0 0xF0>;
>> +               microchip,sync-update = /bits/ 8 <0>;
>> +               #pwm-cells = <2>;
>> +               clocks = <&clkcfg CLK_FIC3>;
>> +               status = "disabled";
>> +       };
> 
> I'm wondering if these should be grouped under a "fabric" subnode,
> like we have an "soc" subnode for on-SoC devices? Rob?
I was about to send v3 but I realised nothing happened with this.
I will leave it as a dtsi and submit, but I'll be all ears if Rob wants 
something else.

> 
> BTW, do you already have a naming plan for different revisions of
> FPGA fabric cores?
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
