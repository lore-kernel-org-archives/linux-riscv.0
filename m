Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F0FC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCY6+I7rDEh9bGlYKaW7IVezjcfa4lTfnjhnxTR5Ado=; b=ca+sU/0zjCe/cS2qnSY8AgOHel
	4wK3qVupuUmyd/YrIeRwGZAQQQDT0HVllBdnu62ySlBAJU14PBk7WnWd7ymIydpwPUdjziOk6/AUE
	3dF+NYlhN0p5gzxOxfDQvwgj/Ba+t3JjoH9IvX6qSsVlhrvjJxGDkiXxil0hNjzy8YDVjgQ3681nQ
	+smD3OzWKqDvYnSSZd0Y7DAFWQKtOwiAvZjc6OXrReswC3EqQo/w6pnhb9oH11PoTkxCFwT/vHN+E
	HCNY72+rq+filGKbHNqdElEe349XnieO01PFZzqbOhs6mqIDs2lE80nTeRlxqE476o4zc0loRrwZc
	p+q8SVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNpvB-00GNa5-12;
	Thu, 11 Jan 2024 07:56:13 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNpv8-00GNZW-1N
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 07:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtHJ0c83BKn0HcbwbV2sJ1wpcMFXTuzzVbtJQgH7/h/SGWgaIrRZ8YOkT5oFg4klpEjCAhyRpYNTjIvKH4WiAtsKsRZn0BQth61Hdzz/3djJWFs1g7ZaLoWG4T4A99Qe1T79Cro/Tpzg1vbeCDt8u4aRCdaxoTbXP4s4JWEb+56vfgp7JKt/s+uSgCE/Ab9Tm7rQ+RIGZ/MaBRDnhH56qfRAVYuI33ArXkhIhl3kNp/Y2numk1+QAoqZMkiSp+jSn+pCbRS/Euv3r4PJncTb8cOBIP7rx3YTpLl4sMRCQ4kyehjA5/cJ/PsvOBG3kai0xXN6Tp9GO+kFN5NSEqPI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mutx7ZzYrouYw8vQtyupaqIVeYGVSSCLwYRYZGp9fY8=;
 b=CfBDps99+Oi81zi6fAO94m1QPzi0KnSryazy0422EWLTVK6IXkGpznYgysb9fb12O/DTM97QJbF+6ek5e8RNUGHPmS2SwAjB+Wmm5c2FnFgAQHypVoJCw1T3LKYaFKMT53CjKzIhZKWNTEMSJ/RKrHSrddVALhdPpXm/xh9UZ6Y58rsHUrJUQ9Lths7opb7v7mHOBVtOxVUbt8TIACulVeVUYpjS+ypGSvJ4vjHkxP8gZHdhbwmvwNYAaiRFNH18BfcNY2ho57antOP1WOOuA7zzlw7osTumVe46XMaE4PB6OO9/wlkZeksexWKYC396/B0DgECiey9Tc6KeKV9xdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mutx7ZzYrouYw8vQtyupaqIVeYGVSSCLwYRYZGp9fY8=;
 b=uA930Ww2Dm8XBhsGoNn8YinyVaLkko0OOSZE6B8TagcaQhMd3hnZ9BJnkA1GdZIW9f5hYWeV64UkHAnj7SDYaluunqLTUsvb1J17gjSCirztfyvQyjkp/9lO/8WH5xxo/69ZdmRyPvXY4NLol/1974lhzj691ly4McrJREjHiH6F08nC/LANwCF3lJNgr++ZVI7bBRbkfy6n0SzWx82Mc2+l3+hu728tTxKPwMtKGnhEu4Jm/u1KNTVYmrtXEI5e4OiIkqzOszqPkRiyuQT69O4KVqE+BYIntTLOqD+yv5ZpkhkbRfuJyZBWeJIMPCvJ+2X4peoWpxnX7o0PyeAPDg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0836.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 11 Jan
 2024 07:55:56 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 07:55:56 +0000
Message-ID: <MA0P287MB28223C2A4D405527AA806008FE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 11 Jan 2024 15:55:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] riscv: dts: add clock generator for Sophgo SG2042
 SoC
To: Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <25650372c373b15309cd9f3822306838e556d3c7.1704694903.git.unicorn_wang@outlook.com>
 <20240110-sedative-reggae-389839cef8c4@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240110-sedative-reggae-389839cef8c4@spud>
X-TMN: [rj3+RFThqDDelvaISKpwucbXuH7321ie]
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <ea342ca0-40d3-4b58-8f5b-877dbba9653c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0836:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9449bd-9c2d-4962-3b41-08dc127abdbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfAflkPOzf5vUWstlhpuK6IV0dTXvAZJMdja9b/P+O8/loL5OK0mgOxWfsVGuAprzVpD/pmUk629RZfkT4DNB5ORi5bZ4aXzv1H4CRLSAB2Y5vAQN5yoRKKYS3jP/YJsf43auDdIf249C2HycnFWF4pjai71IXsFjetGjhYEXeorrTyF/wDee5fJeTfHxWf+LDKWnG2VhX+U2VvRK9VqnzDQQedHB1CfzC9uYth3l5I6iC7LhmaleVauWDuysxZWhVi7kk0utb/euApmt9BnuXvSBWBzkqs3WcvE1+bPtMnskvSixVG8p4SSYCH1x3oaemKDtZL4jr3t1kF4IJ/BDPIRbwH/yeKbnZXNY5WCNGzhgo5C2M87rK2ImLgCdWyzs83ZKjDZJjQ+YN06H43fkk8jqir6x9TuWa4H4xto9trD/eQERlecQeeI3bAErxi4CMjI4iI65MElhXdrzUYAOT7vw8T8XDiqDkVID1fFpnQHZHMNv8xOGHAo0WgyIzlR5hC+wW0kmr09/fhd5SCix78MdXV9sE4KSsIwBojDuvwJH4jG1Yq9aPFEaajVATRLrERaxj3qMSfol+MYJh6EOMElEI/dgbTMc6hnfzQ/I60=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm9reWY2OEdlZW0yQi9rYWx2QW41a1BqaDJwd1d0VkoxczFaQkdPL2ZDeHND?=
 =?utf-8?B?UVhBVTlqMzl1SmQrdExYNzZOZmQxeG45REJnWEdvaXVkMHRYcHlIVkxORnFn?=
 =?utf-8?B?RUo1Q2p6VzJkcFhvWUdvc0VnTk5TdWU2VDk5bm9VN2NQbTFzbTBZdy9WZWpE?=
 =?utf-8?B?UFoyRGFDL28yellXbUprQjRFS0dUMytwbEtBRXJvcmlvWDVEZ2hjVUdEdlBJ?=
 =?utf-8?B?ZmY0WnFwaXhVWmpRUk5aeUFSdmRHTjlJTVFMUjZBR0ZaLy9XWmZJN29pVUMy?=
 =?utf-8?B?Q3hTUXAwdWZnREJKZ1BQSGtoQWEzYm9hOHpZbWNvSTNyb2RyRzlJZk9ZdG91?=
 =?utf-8?B?bWZQVURPRGhsWjhsZUdhbUcvTk1md2ZJcmZIeWY0UUk5S1J1Umt5aFJVVHFQ?=
 =?utf-8?B?eE81dVpCTG9YMEhjOCttR0M0UWRYSHFrOWZlOFI0ZGNuMGVZY1hEaWp1aFlt?=
 =?utf-8?B?MGNac01sN3NUVFRrR1lwc0hKRFRHQ3VVWkdmTnROK1RibWczN245UkdHaFcr?=
 =?utf-8?B?cnU4YXdpN09PSzhEZC81RnFycm9JN2hoZGtEU3k5WjNhK3hXaVlSRC9VYjVH?=
 =?utf-8?B?NE04cUg5WVlGZzlmREw2NEJWVUpnN2xQcnJHaHZtbHJETlI3VFYwWlhnOTgw?=
 =?utf-8?B?blFEaE5ydDBkL3VlSEl2b3hiNjlKbk5jYUZNRTBsSDhEYTc1ajJyTnBmcEF1?=
 =?utf-8?B?aHFjbXJLcmZhdXpTVFNEalQxa1BweGJ4MGtDblBNaks4Uk5oRGFPNlYxaExV?=
 =?utf-8?B?WU96M3p2d3Y1Q0YxaUJuV2M2OS83VW0zblVPNFMxSmMvVVMxcUtQQ3lHMXZM?=
 =?utf-8?B?UXk1c3JIVmo3eXFVRmZNZlRHMW5Hb3ZqYTdleXZlaHFuMk5LeFUxL3hXMlNr?=
 =?utf-8?B?S1lSL2p3YXlubENsdld2VGpnQ1dxQTU1bXFxbVFXbmRQV1E3SU9LdFM4TFFP?=
 =?utf-8?B?bkdDTXcrSFRkY3lxa1lWOG9vekh2NlVxdm54WUo0bk5OeEFKb2Q2WlNmeENH?=
 =?utf-8?B?bS9CNkVSZTFNQlFWLzdXN1hoTmlOaDVNS0cvcWtHQ2puRk9uV0I2S05LbVBx?=
 =?utf-8?B?Zkh0WG5KL0E3NnVzOHAxb0F4NzI1ZDlUSFh0WHZKWWdJRTFMM2l0blZaNVN0?=
 =?utf-8?B?SGFuTkhsazR0NFpVUFFicU1FalhqRGFzR3J1Qk1QaUI0ODZEWnE1ZVJxaytq?=
 =?utf-8?B?dGpla01jN1djTGhhRXZKK0ZoeE5ETDZpWUtKcktuOVJqVWRGSlRISkhIem5t?=
 =?utf-8?B?aGdkQmhqMGRJRmtCcHhsNUJCR0FFcllqSXk3NTEwQldFbFVIajN3dXhFcXNx?=
 =?utf-8?B?Qi9XeU9iMndha3FLRUJ6aTRTT3VmOURxM1RUc0p1b1JIRnVSRkMvTzJxWHlL?=
 =?utf-8?B?K0JWQWJqaVB4WXBBOG9sL1hzQ3E2QUlCRzlnUWxoRFhRR1R5N25NRWNTMjdj?=
 =?utf-8?B?aGJoRkxXMWdaMG9RNFYyd004T2lpTzUxa3RYeGFoMTN6RzFJOU9NOGlCVkVh?=
 =?utf-8?B?S3UrQmRBR0orcnBYMlB1d01DbWJsSXNGYng3b2FteEhDNkxUMjlIWDF2ckNI?=
 =?utf-8?B?djRWVUFXQ1pURzJZS1JHak9teWttaU5qdnB6NGxOY1RyU25QQStURFJ4a0dn?=
 =?utf-8?Q?KuMwgmCo7986gnYs8k8UPV7fMcAHRCcbAVWkGO2hUlEI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9449bd-9c2d-4962-3b41-08dc127abdbe
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 07:55:56.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_235610_472307_92EF3964 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2024/1/10 22:13, Conor Dooley wrote:
> On Mon, Jan 08, 2024 at 02:49:53PM +0800, Chen Wang wrote:
>
>> +	cgi: oscillator {
>> +		compatible = "fixed-clock";
>> +		clock-output-names = "cgi";
>> +		#clock-cells = <0>;
>> +	};
> Where does the name "cgi" come from and what does it mean?
> Clock Generator Input? Does the sg2042 documentation call it that?

It's abbrevation of "Clock Gen IC", I found this in the clock tree 
diagram. 
https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/pic/clock-tree.png

BTW, There are three cgi on the diagram. Should I define 3 in DTS too? I 
just found they are the same so I just defined one.

>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
