Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4496AC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDsIXa6dNK4zPNFqIMSLpCXsXgZFT/paWGIhfBbAMHs=; b=i8TMyHNg2w1CeU
	2DP3nzyVusQHysXZ9CQMHv657DJgN/pbGxGl1NNZnUvAp9L6BULjKW0xoMIj9t2TZn6qHR0MLGjGO
	u4ffXND4MRXT8yRjUKNT+rJTQcmbakzFKVbCIe6vbAC7X6m09kqISkjwtrtVH9SNcho7LjVB6av2H
	iABI0GKLYdMs0tRNlZGpWq1Utf7XfQWEaCFej3Z+6/UX+dCjgDeztmIZXWOmplPO876negmb9A9jg
	uTATrEZYVcRKIWAFjKSh3xkIIUh1IcOWkszqtFuozAC8f74YXX3/6/ozOJgqIgRg5RaUOZrifofh+
	o4vwWsrxPs9Lj50gR28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN44-0000000BmiH-43JH;
	Mon, 29 Jan 2024 08:32:24 +0000
Received: from mail-bjschn02on2071d.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71d] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN41-0000000BmgB-0Nnl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv6i5E0QzuVVZhFAnpDKF9tLC5uSgQ6YW+UfLBM7Q2t1hoo0Yq9K8sLTMtP23O1lPw81CtwjuDlYkPGFRFCm05K56ELfs25TX1ORJfjhsvEedSmPEr00DAwUqIe0mXKdZ4oSFUgbawdVEA2aizYaa5TsPbhC0DXVsia/jr3IUOpljbarzSo8HERI61PCwgAs4Edwv0JAnRCubQnTp5xDyeS0s4XSwVz4+Vq8059TVhKhPaZtALBSh/XqddnWL7eT6czQTXPDOcqXBFArKmcrOL5XdoWp3X3Imc3vXzh4EHmllp/eUbUIM2/4UdzoIUV5Dj1u3wQ/CohYr9NF5h/QHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsYwNLKtg2FdjvD0hlIZS/E+cS0VfcUGf026o4PjJqg=;
 b=nZI7sPxAJUWbulwbmSzeGDlZ/99xvuI8ajSvMW04SRHy8IqQr/9ZJWszvH2GE5LMEqJauY0xXVgI/MSNR+22LwpH3OS6QR3rkYRN0k34xpyBzV9OicfQaRTE0UU/5526nQAEXamvmV1fbDSqDXisLmpLTQ2P3iqazrRjIP3+1l39miDqdXMcI8jGArb4YoMAXTSahcgp5h7B+S4tBENSWSnn45TSN02Y2kRc9TodutJeL18S337jXXCwoczjaBNOc1FxQ65XERDMc1ecwO76UWY8yIclqWwwWjk4rvDid43onOVDfOKbaPLqxfQcdAdxOi5Mdo1SD27/QG46likVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sophgo.com; dmarc=pass action=none header.from=sophgo.com;
 dkim=pass header.d=sophgo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sophgo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsYwNLKtg2FdjvD0hlIZS/E+cS0VfcUGf026o4PjJqg=;
 b=iGSFc2d4DJoEGf53xWTQ0HM5WRfw45h70/JORszXSg6EO4y5z/bpRu47dWc1MX81+AoooDrCXgHMbTS4OiiqMceMsUdHi5uEvXJPxXpCPd7vtzy8NTcWZeDPKys1NPyrK+waedQ1jI8H2gt4fYqLnPONQLQiZ26tT0xHACpUn1QkJmhfD5Jv1fVSEPcgrjTVluLRhTYSUFTKPz3rm4JlGjeFQfSKfjNTDVcuPZPBX+HRMnaNczldwv+yNfd6vilbRW+MwOXZWEYzKyEWbrjLAgIZyvp89i/ZGNnKI52HrGwFgvAozTVnDKT86a6zpGugIQSKzLmZxce51J4NKOqDKA==
Received: from ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::6) by ZQ2PR01MB1177.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 08:32:13 +0000
Received: from ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 ([fe80::e26:c525:8e37:e442]) by ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 ([fe80::e26:c525:8e37:e442%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 08:32:13 +0000
From: =?iso-2022-jp?B?Y2hhby53ZWkgGyRCcjJENhsoQg==?= <chao.wei@sophgo.com>
To: Chen Wang <unicorn_wang@outlook.com>, Conor Dooley
	<conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Setup proper info for SOPHGO vendor support
Thread-Topic: [PATCH] MAINTAINERS: Setup proper info for SOPHGO vendor support
Thread-Index: AQHaUEwJyduIPynuQUGwqf4UiMvaSrDwdvw+
Date: Mon, 29 Jan 2024 08:32:13 +0000
Message-ID: <ZQ2PR01MB1210E6725C761F6362C00375E97EA@ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn>
References: <IA1PR20MB49534A5DE79A6CEE57301737BB792@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240126-squabble-vitally-7dea14d09e18@wendy>
 <MA0P287MB282205C98343FC2FAC20BB28FE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB282205C98343FC2FAC20BB28FE792@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sophgo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1210:EE_|ZQ2PR01MB1177:EE_
x-ms-office365-filtering-correlation-id: 12bcb5a4-4b1a-40d8-90b2-08dc20a4caf3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nFy/9++l5St8EPWSIX31eWpqtsXP5OWbLw42ba/AOkoyIY/upxW06u5J/9TUmCGWc6nhEH0Hwuwc5QwgJI1NfYUXu31x7QClGEMEljwePpHg3Kbvvz1jBkQ0I/kRzB1O0WUQchr1L9uyT6gUwW+cWXXG+h5x4BULlMYJzBctltyf9nJIelAduxQ4XSbYpLUXzhw03j2FH/fYzZj4+iVSJSs/JtxtYz44egalOeOYNf1if0BPn6Uliv2gn2mFU48PZTAvjXwV72eEVtAOYM1QOh+hVgC9eWICEtghvzS/+Ja+LtDyXJfBAz0uJNMaXQe5MgUB5F5nhEF8y+1oWXT5u5qG6EGBs3zXZ7UwCso2b+rWYRav0IewnqINkEH0Ha25yuyNXn9pgK8ZXO9YNiEEwEoIZM9v1+kcwSbJdsJrg9xBrZYyY7qo7IABplGsi26kijotGG6jXH1zFy4MbMBJlosNl8ltbjMDMqgVKf0uhmOAslPAHi/zxSGI/sydeoJRK+ykHNp+dK9IV1L6tcYF7xyXwcXkEvyIFkbfEbkzxVT1544wZDSj9XedYsgOpDV6ZUbYrdBEVWw0LEmUK6ATUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39830400003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38070700009)(66899024)(41300700001)(2906002)(40180700001)(5660300002)(33656002)(41320700001)(85182001)(66946007)(54906003)(64756008)(66446008)(66556008)(66476007)(40160700002)(76116006)(110136005)(86362001)(9686003)(83380400001)(53546011)(7696005)(55016003)(26005)(966005)(71200400001)(508600001)(4326008)(8936002)(8676002)(122000001)(38100700002)(13296009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?K0U2LzdBY2QySEFCNnh4aUg2UG8vckl6YTVFcmdWZ09EemM0WVB3N2dK?=
 =?iso-2022-jp?B?czNyaGYwcWZ2SkxLZGsxQVpGbi9JUFgreGF6TDB6NVozd0IycldhVWw0?=
 =?iso-2022-jp?B?bHNvTDR0dlF0MTYxbnJSNlhqbG1xWnlOdS9KUThwanRtRVdOSzcrWCts?=
 =?iso-2022-jp?B?WW1ybk5nQStsTkRVUXlxb1QzQ0FOU09FZWt0M2tpRkQ2U0NmcjRPa2Rn?=
 =?iso-2022-jp?B?MEd6VnlRSElTaDd0OUpRbzQ0eGo1SU9wWUJUWGF4VDdwRDFpd3hhdnRj?=
 =?iso-2022-jp?B?eEkxRjluRVkwTGhMTENVNXVRdUM2dGdqRVpkLzJNMDVhMDJtaXBzSmtL?=
 =?iso-2022-jp?B?SUlqQWxUU0hvK3MxSEQwaU4rTTVkLzZJdmpIN0xaRWhROU5XaDh6UzRI?=
 =?iso-2022-jp?B?VTdVTmVtR2g4SGc1OU1ZbkRlZ1JHdEFTOUs2REdpeWtUdTF5dUhEbE5U?=
 =?iso-2022-jp?B?c0lUY2VVbXUyMUZhVFA1dFVKZzRYSEVXaDdZZ0VBeXJpWDRUQi9EY2s1?=
 =?iso-2022-jp?B?QmE2d0JZU2o5UzFJbmdPSkw4YkU5VW81WExPdWVQNHBsVHZ0b3E5cVho?=
 =?iso-2022-jp?B?ZkFtNUVVMzhuTVBlL1hIWTdGUklVbXJtWUxxME1KdXFLRDhJQkF5cE85?=
 =?iso-2022-jp?B?cnVCMXlWQ1JoWkVLSmkrZkRvYTUyeW55dXZwU25BaGFaZENVZmdUNEd4?=
 =?iso-2022-jp?B?SXhzczhWUW1ycGUwN0c1Wi9QVTU2S2VVbUV5UGwyQjV4RVEyTkFVUHlq?=
 =?iso-2022-jp?B?OENjRE5mSFgvVVJ2SngwV09jNHRpb0NyUHlyR3pVaWsySTg5MGpNOVgx?=
 =?iso-2022-jp?B?Ukt6dUJIWHkrTERIbVQ1b1R0U2l3emVFdVFOdVBXdzI3Q2dGYWs0aDFx?=
 =?iso-2022-jp?B?c2dGdlNGMm12akRjWFdQd0VNK25heitWdXhUYnROd3J5R0tQZEJMZEhu?=
 =?iso-2022-jp?B?V3FTdTNrQ2lpM1ZrQ0NVa3J0UkM4WmRYOXp3K2E4cTlrM0g2TC9IczAv?=
 =?iso-2022-jp?B?eEdTZUlWQnFmVzR4eG9yTjcreFJZUXhiY1JTZUxNMHZOUHg3d0FDanRs?=
 =?iso-2022-jp?B?WHBCanJwREtiblBmM1NKNmlUQ0Q1Yk41SlZQMk9lek8vUVRDaFpveWdK?=
 =?iso-2022-jp?B?QUpiR2M2RzF5VnVBbHpwalQ1dldoRkdWQ3BleEcwdllsVE9sN3hnR21D?=
 =?iso-2022-jp?B?djh3MFRaUHUyZ2hWVjJmMWV1VnE2c3lPeE9OK3RXZWdPTmRmNDRmU1Z2?=
 =?iso-2022-jp?B?cnRwREpqdm1MUXV2Z1pQQk4zTkZPVzlHbjlHSjdxNFVCdi9wZzFsakhh?=
 =?iso-2022-jp?B?bU9rSmlLVzBzQTA4UkgwK09ueVR0K0RVREc2M3Jlc1RWdmNBZTB1Ymww?=
 =?iso-2022-jp?B?ZjJCcTRldDdvMDhqaGdCYnFwcjljMlRJVU1zMFVIczF1RVo0N1lMWldt?=
 =?iso-2022-jp?B?OGE2WXluYmYwSGdWalVOQzNvVXlwdXo1VThxT2pma3dSZjhRR2VvQkJp?=
 =?iso-2022-jp?B?SW9wTGI3Q1dEalFubmozMlR4YzRRTTVhTTlFbGZQSWh6Q2pYc2dxVzdz?=
 =?iso-2022-jp?B?Yis1bFJ5R3NXbE5Ib3c5SzdiS0lSNkN2Y3ZKTVlRSjI4WGhYcmZDdnBU?=
 =?iso-2022-jp?B?TjRuNExlb3pSYXNmWnlUQzY5Um9UUlk1TFpCM2ZZSmxMUitEVkgwV2Vi?=
 =?iso-2022-jp?B?YXBZWmxkM1lSQjNDRUVFelRleXd5VUFkeTltNHIzWTZ5TEhDeEdEMExT?=
 =?iso-2022-jp?B?T0I5aHJma3d0RmdyZTFLMjZWMWZyUkhySFRIcFVmbytkUExwZWNYbFAz?=
 =?iso-2022-jp?B?Q0lxbVpnd2NHUlZrOENKV3RkaC84Yy9KWHp2L1F6WktmcEVFOG45Sytx?=
 =?iso-2022-jp?B?bHJyY1JkV3l0UHM1cTJpTHhlYStmWFczMVBjOFJUQVdHQmJXOEtwc1lZ?=
 =?iso-2022-jp?B?UlpXRU12aUdoT3pIU0xIY0owNnFrRmRVK0J0UDBTVCt6UGlqK3NXRkNx?=
 =?iso-2022-jp?B?Sm1YODJlaUVJVzVSUysvQ1g5am81TmN1Um9HVHNDdUFCaVV2Mm5ScmRv?=
 =?iso-2022-jp?B?c2VLYmhlSXQrOUVKSmhKOGVEL1NzQ0YvbnJFdk5HQ1pTc2JubDhBMGVJ?=
 =?iso-2022-jp?B?cS8rVEUzTUNiZGJzRWp5NWY0dmlGaGtqSXRkK05mSXA5Z2lYRklYYUN2?=
 =?iso-2022-jp?B?WjFoZlQ4VGdjMVR1dWZ0d0kxTGZ1dm5MSldjVEZnYm5XMVFQZTNVZUF2?=
 =?iso-2022-jp?B?VXJBTEJDZTVYV1V1VVlrVWdBMm5DcW1mcGNUZjYxN3VsUlZnY0UyVGNP?=
 =?iso-2022-jp?B?UEJHZQ==?=
MIME-Version: 1.0
X-OriginatorOrg: sophgo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bcb5a4-4b1a-40d8-90b2-08dc20a4caf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 08:32:13.1041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c40cf433-6eed-47a2-a184-1397bd7ba9cd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58YJVGZoGuPdxUBGNy+5Oq1Xhz/aWiEYbdxw0yKOLmeydkNDk/M95+A5gqm6GvGeXf+P1zn6M+9YVI+GGii3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_003222_497067_283BE617 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

> On 2024/1/26 19:03, Conor Dooley wrote:
>> On Fri, Jan 26, 2024 at 02:04:50PM +0800, Inochi Amaoto wrote:
>>> Add git tree that maintaines sophgo vendor code.
>>> Also replace Chao Wei with myself, since he does not have enough time.
>> Ideally Chao Wei can spare some time to ack the patch though?
>
> Adding Chao wei.

Acked-by: Chao Wei <chao.wei@sophgo.com>

>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> ---
>>>   MAINTAINERS | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 39219b144c23..0dbf2882afbf 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -20446,12 +20446,13 @@ F: drivers/char/sonypi.c
>>>   F: drivers/platform/x86/sony-laptop.c
>>>   F: include/linux/sony-laptop.h
>>>
>>> -SOPHGO DEVICETREES
>>> -M:  Chao Wei <chao.wei@sophgo.com>
>>> +SOPHGO DEVICETREES and DRIVERS
>>>   M: Chen Wang <unicorn_wang@outlook.com>
>>> +M:  Inochi Amaoto <inochiama@outlook.com>
>>> +T:  git https://github.com/sophgo/linux.git
>>>   S: Maintained
>>> -F:  arch/riscv/boot/dts/sophgo/
>>> -F:  Documentation/devicetree/bindings/riscv/sophgo.yaml
>>> +N:  sophgo
>>> +K:  [^@]sophgo
>> There's a single instance of this "[^@] business in the whole file,
>> is it really needed?
>>
>> Also, you can fold in
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bf107c5343d3..cc8e240ba3e2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18859,6 +18859,7 @@ F:    Documentation/devicetree/bindings/riscv/
>>   F:  arch/riscv/boot/dts/
>>   X:  arch/riscv/boot/dts/allwinner/
>>   X:  arch/riscv/boot/dts/renesas/
>> +X:   arch/riscv/boot/dts/sophgo/
>>
>>   RISC-V PMU DRIVERS
>>   M:  Atish Patra <atishp@atishpatra.org>
>>
>>
>> if you want. I get CC'ed on everything under the sun anyway from the DT
>> MAINTAINERS entry, so this at least might reduce some confusion about
>> who is applying what.
>>
>> Cheers,
>> Conor.
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
