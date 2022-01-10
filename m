Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F850C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vunwIOjGC4GTzNq/ltFIzIgBn3HVwphHacKLjUuWOo=; b=A0Ff7FnmuEuy4U
	+sXjkm4ZMoi2Tt0PFU4XpZNx3+cdehVUwh3/IA/S+kv5LNJGV8Q8IdvXikvWPcNXDfw1Ma6GIE7qp
	1PrJ2UDXTmwIou7NgeNT+uMMItoVj3zShexRw8d5+ZC+yBOJrh6EXg5p/kS9boZ6KlakzgCryv3TH
	I8rHuD1M/vwPCrwjH2HIRdALi3s8AESCls0JJp4YO6oglueE+93K58ZB2QD0dtgDvIIQRUBW8Hdwg
	lt5T4h2qhq63sYWFDlo4dFZxiEM/JUDoNtax/p+0h7cMyr30PGqi+HXp3jGv7Nj/pd9ExyAmV2I7o
	b9gkGj2aYulA0f5iyRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rzG-00Ao31-4Y; Mon, 10 Jan 2022 10:33:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rz2-00Anyg-8p; Mon, 10 Jan 2022 10:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1641810780; x=1673346780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=q/NsG5xjGofsvPGuUtnr/BxlHq/9+6EEkra6kjfR4F4=;
 b=uDxX4syve32CpvHh3SIAglmKkOaE7wJqHLlCvT/CDAIbIyfe7D629edV
 0fbMBzo/CQ/iFOilyqSH8rv6+Wtl5QiNJAV78VCipoB2oT45fdXnD6ZDf
 WBpNIEkFeUmAATIx6MxLqJVqZGXeneO4A9Db3//jt1YGaxeoHnQ7JCE9y
 ivHKdhxR61+J6X2PFEY3RRnO+BcgTlwQ2P3H2yVtMggJrBatC1KTnLNIG
 JdBqTn7YqEJ/ocvRLZCuc9cVURD60Ypn3hQ5ay6TEUYbztz745ur88+NV
 IwXDlwSDlxkixW9OAPdLwREiIGTJOk7GAhIA6Ihb110mibz+wISLUqpEN g==;
IronPort-SDR: FCx85KwoT6l9P+wtKX4Q0HOqa03D3tVYs5AN5F342RL4AFZo3oMpwyYgjOVPk29a9pW5MwoMQr
 h52xxaVCcfFKpPuE+ZP+J5Etj0vpesPbbBQx9OZx/NhyuJ/hz3Td6aOMfisVSyyorNkP5gxItf
 e8NsCxvjiv0abgpCLqawW//j7zNdvguzX3WI4ocTK4jrkmS1uoiYu/t+8c1GFbjSENC3HpTWN1
 x9rsO0S93aGJffOayQTaKmFk4VjIAICzhbm4+rkhRoDCyzEEW6Cta6tUWQCzcz0bStUASWPiPi
 aoDO4Nde3HIhd7QjfF0diLxg
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; d="scan'208";a="158067907"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Jan 2022 03:32:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 10 Jan 2022 03:32:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 10 Jan 2022 03:32:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpipQt6FzPzChDEsb1fWQ424txsdZiHEO0kezzhgp0PlkVMWShP5nIumHO8H9y0P2lW6t0tXjY3ryO7FlVD22WZkw7P4GFx8fm9TJbiT7LH1ohSSWcx+/X81Fxm74a+JAQr/KD9yy60V1JYnmvGKwqCqe1+CNYH5AKrySIc6pKw7U5pkbFdWHZ7wCioniiJByqm9jZP181OLehNsbw3ro4p2wC600OD8cY6f4sXjtjFTJW9aVFovEDbfOZnX+Z+rxl5gnq8DGUxJVPm9+i3VL0/D2voW1Du3/G2ICpTa+mmYDYRuTa1k+tGzimjD/A9JN1wQgVjX1Kr17zwSxYsN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/NsG5xjGofsvPGuUtnr/BxlHq/9+6EEkra6kjfR4F4=;
 b=hQG55DYeesvSpiITUYTyf0Mr0cmYn4icwXnQJGB248A5xbPdq7PGGotM1ThIup56p+PbvMka8FL6LwuUlt+ampPdoNlsxc/qXD0ym53+CaKjjfimqSeuhF1YJgocjeswqo7NLObQ4plh57DNlgbn0yCeTn35xOLMRMbtZhpzb/dwrO9nYFyNWN9H3XhlUtqT5sr9c6pMGFX6UU+tGocvbpyiXlRnIOvPoIUCaU2M++5+cLUBOI0Vs2DuFGkWjHxatcTNmdbfdVK2XAEr+4k+PfMw+KkTLILsQROAihgOXfukaxf+CwBB8gZ9OMLr3mMX88F3wXhfMF4R+5rJ7T46RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/NsG5xjGofsvPGuUtnr/BxlHq/9+6EEkra6kjfR4F4=;
 b=iWDaDHM0oPFO4sNOyR3oqqKftz4q5l9eYIldSPy+EzWazASxB+2ZOxO9BAkRK1MsFPKG4gViuYimyuFpSoTuPs7S4JFhMYft0R7eJRmWor4oWpZ7zlqpmNOvSAUZUDNzdlHvy12c/R0vm2y+gYCFe464cDY8o4dxjLb8WEO9idg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2367.namprd11.prod.outlook.com (2603:10b6:300:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 10:32:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 10:32:45 +0000
From: <Conor.Dooley@microchip.com>
To: <arnd@arndb.de>
CC: <aou@eecs.berkeley.edu>, <olof@lixom.net>, <Cyril.Jean@microchip.com>,
 <Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
 <jassisinghbrar@gmail.com>, <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>,
 <damien.lemoal@wdc.com>, <atishp@atishpatra.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Ludovic.Desroches@microchip.com>, <Claudiu.Beznea@microchip.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>
Subject: Re: [PATCH v2 0/1] soc: add polarfire soc system controller
Thread-Topic: [PATCH v2 0/1] soc: add polarfire soc system controller
Thread-Index: AQHX9a/UoiOGRKIfI0yoKROyro43JqxcMCKA
Date: Mon, 10 Jan 2022 10:32:45 +0000
Message-ID: <6924ec40-d253-0370-9e51-49552855f56d@microchip.com>
References: <20211220144413.6798-1-conor.dooley@microchip.com>
In-Reply-To: <20211220144413.6798-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be51c3f6-46ad-4807-c508-08d9d4248a9a
x-ms-traffictypediagnostic: MWHPR1101MB2367:EE_
x-microsoft-antispam-prvs: <MWHPR1101MB23671834D9F205151FC95F1A98509@MWHPR1101MB2367.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNynOM8RAzCeSKa4c7G0ZkZF9yDdO1gsmwte/gf7CJoVQFUMN3ed0nJQd0WBRupwtQsxxtEhekGQ93KON1SWXHP3FqEbi9WyF/pT9zezJTf2UJwlBR2TOSPZuZVxFKaEgnsu1S7SPW2a3iGLxq5XR7y8bH0YNsP6Fcc8TaF3MPVV2l9MI9b4UemvilOwbRJ77mPC5H32g+Nsm4X/jg4QRrcjWGoPN7HF4W3GbyvZp54AKkEeYaTrKaSP48dRIpQ/6w+XZwRmsI1IoAZ1yPYfungAj+s7yYqExYXkkU9o/KUf4qSc7Q+4ljz+cF7bZek7/OhlI7Uqp5XrGpqTzScXJNrVTKZQnJOn4RDJ4PUi/4OlGAA3PjHCwJIu4H1wo9EbnZ9AZaqOm71TDLD4+iTZE6T/p8vDiFYDvKZ1aFkMhiCStVOpfj7+Zt6a78MuFhAmbZRrh5WHylkV1AD6Wa2lul0unAGQrcSSEILB08eypDu7ihMLPI0jY9N9tZVZXk4nfPnZi1daQsKqMZk9AvBmVHusDByriZp8VHcGIEkv1TehSrLhPBPPPahlg649j1ZV1oc9l8j8yVn8yLMZziNHLQPjmuNhwx8WzsWxCb308oXo87QXxKJP1/pMiWZ4OkRUFWZMtGI+FEDiBA/ZbViiTWFgqJeJskOjQ+y2A1DpfeTYPRUK0XBsL+NedJEnzJHetvkq3Uw4fs/rwDLrJRuEDeI7QbWbTfjj3DsDHi6OvRUpp4B22zUarX3/Syu/UtCib21+CSVDL1XUD0M7pXAXOXAHUVB33DqivEuHqEzkpQsWijX+pGAMgPxhW+41mQwRBMvudoIlzTba2Z4EO5m1ncFzTS2T5Q+inGkD8X3M6OAVGywDS+zfmO7ZRjoP4dAfBRY21zNLriCaF5AgTKKZzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(8936002)(7416002)(26005)(2616005)(5660300002)(316002)(38070700005)(54906003)(86362001)(4326008)(36756003)(83380400001)(91956017)(66946007)(186003)(64756008)(66556008)(6486002)(76116006)(508600001)(966005)(6512007)(6506007)(122000001)(53546011)(8676002)(6916009)(31686004)(66476007)(31696002)(38100700002)(66446008)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG1nUkhHQzlWYko1b0VTVTlab3prMS81WG1EajM4OGg4VUlLamtQTGJKeXdW?=
 =?utf-8?B?OTV1alk4L2ljZlZFb0s1YVV0TUt0S0ZHL1lUN20vUFVXR0dyMlF6SFAvU3pC?=
 =?utf-8?B?SUhYVCtXSy9xZGdQVGEwRnQyZC9ZOExzbDd2OGRXU0xPUUd2cWtsTE1EYkVQ?=
 =?utf-8?B?dnEwTWNLbjV5WkExWnhsQ2VTZlRtSzgvTzJST0U0WkJCRW1jWUdHNjYrRDNY?=
 =?utf-8?B?V2x3Nks3dVBHTWdsNmNYK3NPMmRUaHM1S2VCOGdiWXRib01JeVVvdTJqQ3Z5?=
 =?utf-8?B?UzdOcXZNR1NWcUlVTnZLUHhYd0ZBMWN0NUtrcW1PWmJrbEdoVEpYcWdYVk4x?=
 =?utf-8?B?RVE1VURsQTFya3ZGWHlmTkRjeHcyODh5WW5OTE04U0E2d2h2NUdaUWtXSHVa?=
 =?utf-8?B?bHJKQ0kydFFGVTRKeFdpaXVHelI5d2ErNlVYNGp2L3d3RDFxYWtMb1d1QUox?=
 =?utf-8?B?cjE5UW1ia2JXRFV6VE5YMlppVXJzZFdLSHlDL3VYUm9salFLM016c3ZYQVR4?=
 =?utf-8?B?Q2Q1Tk1CM2JIWG83a2s5azA3MUxFOXZFWHRBbXpXRTFkdzBqVUVxUVd5eklQ?=
 =?utf-8?B?MkV0TlUyRmpEV1RNZnFNVUlPVlZ2TVRtRjRQVTJSUU8wUHIxNFRBZ09wbEJS?=
 =?utf-8?B?UlhjZ0pDbGQzeEJaY2o1M3RDdkN4VDZ6MEZWZ3d3Y0hoQkNrZXBkL3F4Ny85?=
 =?utf-8?B?K2YzeWZHUjJsS2JXYTI5RjBOWFBSbXF0cE1nZEQvS0UwUlNZemNMREh5L2tB?=
 =?utf-8?B?N2N3QzRTRzVOeHF4dE5Jc0I0dzFsTDJWK1B6ckhrZGppdjZEYmFocWxsOEJS?=
 =?utf-8?B?UDd0d2hxbXY1dE1IR2pqSDEzYmQ2blpiMWY3T2pLZFNFV2xqaTZjRzhwZ0E0?=
 =?utf-8?B?Z0FjY0w5VEc2SzNYeUlxZGppUzR3QjhlV0UyYkxWZDRwb3VRNlFqN3grSkhn?=
 =?utf-8?B?RTZscThFZE1zdnlNZjRCaUpFU2Rsc0NPRUlHUnZDV1R5aHp3YTQ1VXkvR0tm?=
 =?utf-8?B?RUFQMjJsVElPc0xPZ0VGc2VPc1FEYjJKMnlsNTN6bU1SRDBmRU5tcnhtZjRM?=
 =?utf-8?B?cy9WY2xKUUx2R3M2eC84KzUvbXBJZEk5RGh3VC9qRnMwVWNWOHJHbW55ZUoy?=
 =?utf-8?B?WnRBcjRJN2dXaEVEekJzZ1RMZ0haOXpJdXp0bHN3MUZmcnhkV1RKdU90NXVt?=
 =?utf-8?B?Sys1U25QQkF2M3lGYTBqaFcwV3djV2JKR082UzFIY2J0dXBjNGNJOWYySkQ1?=
 =?utf-8?B?cGdNVVZ5aTN1cEtPMWtMUlUvMWNDN09ETWd6bW5EbVZucmpWR0hJUnJGV0Fn?=
 =?utf-8?B?Ry9tU3MxUUpFT2dPcUFTSm9lYmFCeDlibkZZVjlid1dId0xzSFB1ZDZpMXRt?=
 =?utf-8?B?eVJHZFNkVDdBYitTWkxNQVJQYXNMdWdkejBOVERnQTBlQzZSdDc1Z01Md3hD?=
 =?utf-8?B?eWkzRFpQU0tZUkN2Mng5SGxkVDVobkxWbllBMzA4cFZHemE0QzQ1QWVlVWtH?=
 =?utf-8?B?SEU2Y2V2VUNIbFFvaitCaFUrUDBBaGtSc3BQK0JlSGdlZmxnNGd3ekxDUk1o?=
 =?utf-8?B?NFdxdXlDcEIrQ3JQL3JVNm11YmZGdDF2bG1qR2RDc3RWMXBiaFkxQmRvLzlX?=
 =?utf-8?B?ZnF3U1pVK2xwcEVLUjZNOFdCSzV1VkFYUTQ5dGtFYkpEb2pMYU5VNlNmZmJx?=
 =?utf-8?B?WGJnd2R6elBrZUJRV210dG43TkNsNVBrYnB0RG9ZWmVUZi9lSlNyTFJ6aTBq?=
 =?utf-8?B?R3hFOEU2UmVJbzVtbzUweG43Yi9Ma1E2NzZMWHNrajcvYlVjWWduenNMb2Qr?=
 =?utf-8?B?TzNsN01XTkxzYWt2ZjZLTE5KR2NkWlhsRGhaSDhTelY0a0hXTFYwaTZrMys1?=
 =?utf-8?B?NUtuVVZNQTNGUWl1dUkwQmdmaGEvbjhEL3dRV1dXdlFNaUFac2dtTHN6UFds?=
 =?utf-8?B?aHNaT1lvRllZTSs4RFdBNEpBdHErSWdTMW5LSnR3M3BBNXVPOXRuV0dsS0w5?=
 =?utf-8?B?MHdQamV2Yk5XV3VwaVpKT2R4QmgwRlBQSnF1Ykp0T3YycTkyTlJwS3c3Uk5s?=
 =?utf-8?B?ME41NUV0SkdNamxGZkJWYk1WZnFPNHNwRGMxKzk1NHV0NXlka21BN09jQmhI?=
 =?utf-8?B?Mi8zZ3c1YVdYK0RnT2ZzckxSVk1LM09yU0FZYnArc3QvRDQ1L2p5NThpRmta?=
 =?utf-8?B?RUVONmEyUmN6b2VWQ0pxeXdLc1BUaXpreUN6NThDTS92U2dTZzFvMzk4ZXVY?=
 =?utf-8?B?Yy82bnVDZEcxZUNrMHVrRFJpQ3RBPT0=?=
Content-ID: <E3AE3AEB61162746AC326186A3506C2F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be51c3f6-46ad-4807-c508-08d9d4248a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 10:32:45.7227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xW4cCWfcXWq9rlZkFVbV2EdYp7IRqNfaNelFh6Y/rph0xeMOEDsh4sve9QeLIHArCvNEp+F6ZHwU1f/Ecwb5HX4F3iJy7W43k3vhTHMAp3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2367
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_023300_353250_ADB6FAE8 
X-CRM114-Status: GOOD (  28.36  )
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

On 20/12/2021 14:44, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Changes since v1:
> - system controller is now an mfd
> - parentage is now used to get the device node on the system controller
> - mpfs_sys_controller_get() now updates the reference count
> - "polarfire-soc" in compat string changed to "mpfs"
> 
> Depends on [0] to change the compat string in the dt-binding.
> 
Hey Arnd, if you could take a look at this it'd be great
> @Arnd Bergmann:
> I sent the first version of this patch in November & you (along with
> requesting referencing counting) wanted me to check if the driver was
> bound to the specific device [1]. I have taken another look at this
> driver now and I am still none the wiser as to how I should do this.
> 
> As I said in the previous thread, I checked other drivers but was not
> able to find any examples of of_find_device_by_node() where the binding
> of the driver was checked. If you could point me towards an example
> that would be great.
> 
> Thanks,
> Conor.
> 
> For some extra context, the device tree entry for this driver will look
> like:
> 
> syscontroller: syscontroller {
> 	compatible = "microchip,mpfs-sys-controller", "simple-mfd";
> 	mboxes = <&mbox 0>;
> 
> 	hwrandom: hwrandom {
> 		compatible = "microchip,mpfs-rng";
> 	};
> 
> 	sysserv: sysserv {
> 		compatible = "microchip,mpfs-generic-service";
> 	};
> };
> 
> and the mpfs_sys_controller_get() function is called in, for example,
> the mpfs-rng driver:
> 
> node_pointer = of_get_parent(dev->of_node);
> if (!node_pointer) {
> 	dev_err(&pdev->dev,
> 		"Failed to find mpfs system controller node\n");
> 	return -ENODEV;
> }
> 
> rng_priv->sys_controller =  mpfs_sys_controller_get(&pdev->dev, node_pointer);
> 
> [0] https://lore.kernel.org/linux-riscv/CAMuHMdWTjrAiHosU0cGyJYkK=9JzNgHb=tjHXPdYxTWmkVzeYQ@mail.gmail.com/T/
> [1] https://lore.kernel.org/linux-riscv/CAK8P3a1m_LhOg5JGMqPz6sohJa2hPZ3GN-jQDPxigZ5DaqAGxQ@mail.gmail.com/
> 
> Conor Dooley (1):
>    soc: add polarfire soc system controller
> 
>   drivers/soc/Kconfig                         |   1 +
>   drivers/soc/Makefile                        |   1 +
>   drivers/soc/microchip/Kconfig               |  10 ++
>   drivers/soc/microchip/Makefile              |   1 +
>   drivers/soc/microchip/mpfs-sys-controller.c | 169 ++++++++++++++++++++
>   include/soc/microchip/mpfs.h                |   3 +-
>   6 files changed, 184 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/soc/microchip/Kconfig
>   create mode 100644 drivers/soc/microchip/Makefile
>   create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
