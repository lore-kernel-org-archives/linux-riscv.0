Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BA7C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSO8QreWv1ys0ztkAQDIeMMVfNqeJwssMNWF5zyMlgc=; b=MoTHUMaIt+S2FQ
	Lf2vkIFZlUhyZ5WStKK8vwp1W15YetpEgKL9txz5+c93U3bZdRZrUzoPCCj354qXdG3lwN5KlHxAb
	paBUB0u3oWWD6M49v/P86EcuD+mG3+1dZYzyXPwm+v0fF0BS7M4XpQYDMCpWnAmcu4lmUrmkBp8sg
	KTJAdtP4cqRc97NGc95+4QN9llML6sGftfciMI0xMCO2MZy2+oaQTpK5y+5MGFjYWzfjMOzjrkpHf
	6Lo+lmy1HCV9Gc5NLXHiKQohw3hMOOFQJFizYCRSzpjtpZUgPFOcUhrtjXkbnzRwIgENO5Zlw+dON
	2uhh8S2kxawsDm2/gh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpeEc-0000000BsTP-3nbK;
	Thu, 28 Mar 2024 01:07:14 +0000
Received: from mail-bjschn02on2071d.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71d] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpeEZ-0000000BsIh-3XsE
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 01:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdYPonKcrJ7wqDS03s7rzxnwuK4sDLIHUO6qH/9wqEllc5IBD8wk1UN8EX4ZmVcjlW091+6Pz7dBsgCH88fdSlfWX2DMjxjVbEWuQpP63wJ/67F4/tVaKe9VdK6J3z6HYKjd4NhWAFzdo78u4QOB+D7fnhGNXBBcm4ffBbrgPrDnSQ+26Kq6VWphEEtUB5M5K058ubOVnkJsk7NGsiJx3PpNrT7BHvszpGdLJKjhCa87Fsprj02XM7FoxxXvPrLlKSmPw43NKY8YocTOugn9Cf4w5PsAACglxohWZFmq//f0hjtmPL1nehfb5UBffzLqTz8M3DInaPMZnihwmbUotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+o3L9vuoy2YEyp1qdAf28R2PwpHKAapNnnTQV7bG2Y=;
 b=OsTacSKTBWJcPptFjQeGvQqZJdq5rAvRgXbVWtvyn10wM1/3pa5XMgX34pDZfouayKnFV3ywqtbvNbOOdCDECrp1L+u5JbXrCYvJDbktmlrSH3khAXL+9zdQhBEIRHyiRcGS3qENS69MtqWKi+4N6/eP//MGjz/Nj2k+Q8DznucBMKeQMRiuaPaFl26lzRKjd4STXwuQ05b8cKW6mJHwXFrTDkV2287ugiHJ25vzNbL/g/SAYFCBjBd1Ymp/HTRGlFUyYV4uH1u2AHz7igLFCQPFZ54FEKnCGKCeQvdsVOM46ii7ujc1Z1QaYPNxsBLE6l3CC4ZMa9PTOY0dQUd7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::10) by SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.42; Thu, 28 Mar
 2024 01:06:42 +0000
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 ([fe80::b0af:4c9d:2058:a344]) by
 SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn ([fe80::b0af:4c9d:2058:a344%6])
 with mapi id 15.20.7249.041; Thu, 28 Mar 2024 01:06:42 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIIHYxIDEvMl0gZHQtYmlu?=
 =?utf-8?B?ZGluZ3M6IG1lZGlhOiBzdGFyZml2ZTogTWF0Y2ggZHJpdmVyIGFuZCB5YW1s?=
 =?utf-8?Q?_property_names?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2MSAxLzJdIGR0LWJpbmRpbmdzOiBt?=
 =?utf-8?B?ZWRpYTogc3RhcmZpdmU6IE1hdGNoIGRyaXZlciBhbmQgeWFtbCBwcm9wZXJ0?=
 =?utf-8?Q?y_names?=
Thread-Index: AQHaSr81E8nk9BtrhUGN5g0sexXYkLDg67gAgAAseFCAABFwgIAD5i7ggABzo4CAZskggIAAdadQ
Date: Thu, 28 Mar 2024 01:06:42 +0000
Message-ID: <SHXPR01MB0671EA5AED87CE14113148E7F23BA@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
References: <20240119100639.84029-1-changhuang.liang@starfivetech.com>
 <20240119100639.84029-2-changhuang.liang@starfivetech.com>
 <20240119-despair-festival-59ab2d4d896b@wendy>
 <SHXPR01MB0671E2150D9A2707F12E0901F270A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
 <20240119-preamble-calm-7724e17fcebc@wendy>
 <BJXPR01MB0662E6EEEEF888BD90A1FCE5F275A@BJXPR01MB0662.CHNPR01.prod.partner.outlook.cn>
 <20240122-uncivil-almost-631137081fd9@spud>
 <20240327-unlucky-bulge-2bf99a8649be@spud>
In-Reply-To: <20240327-unlucky-bulge-2bf99a8649be@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0671:EE_
x-ms-office365-filtering-correlation-id: 307197a3-e9fb-45a0-f70a-08dc4ec354c8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Stkxo4GW3DiuPxof63XNUPufuurZOEoVpWCdSzeSMeaksXlRuiJDnnWvwOSVQZMzn/Ofyf2BM9cvCS7T9bxF0RUWJGbiKdlkqYLmnW/XmyU7luJtnzK5cfJECrtYt0L8pAuU/dvxS3gW0GOVVySVVtfOR6CUCPRWWZqi+bxfRjg/ITJnRVoXMVzijOr3QUdXCzTWpFzyDTqhv+hHM3TtFiB2GqKKFJ9t2sULens9cF4KYBhPsdLBYtqg9SOd8cnOR32qLRZ+Ij6tsM849GY009mlJ7usOqZUH84VE9AkkWqjacnnww6FFAnrV8Sm59pj3hgJcOmmSV5w9+2wZrsDuiDWKyvgWj4BFEgqSLFMYl2qN7NPM6I7GSqFCR4B3L8EZW0bh67ceDtQk+KKfYMzZpl8ZquL65JGy8/j5kfPAKXeyXSdGKR+MOVniZV9a1g5LsD1+8BNtjNdH+x15svx+Tqnzvnx3MNhdNyP0Tje8Km9jXNlW6Nu2GxMEwnj7neWjI33a6xIsZba6tUozEvxGTumNpm9XoDvwQMQXT1ogQgBeH4b+PdaZfsKM82AOe+LR7PtQzMn36vsjrzh+kcK6cYi1UwXvQUu561xWX1s3ezKq+Ynxik77XNpC6/aLsR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(366007)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTUwQXQvTVdSa2pJVmplTVpiZEpWakR5UDJGdDVycU56dkJDM0hJRVFkanl5?=
 =?utf-8?B?OGdVcG1tVXFmY1VmdG5YbnhUTng2cW9CZTR6WWozRURVZ3A3ZlAxeGpvVUM0?=
 =?utf-8?B?MXdqUlNMMzB1NU1Gb1BiR1lqK0E5Rk4zZ29IS3Y3MTlEOW1jQjJlRzBRcE0w?=
 =?utf-8?B?V2lRZjNySDdiK3pFb05MblFVWWhUTm40RnQramRId1FYSlVtTEYveWhnRnhU?=
 =?utf-8?B?bUM2WHlualFkYXU5elJxKzh4TUFiaitWT3R1Z0ovY09VRmprNkxKd0RhaTZo?=
 =?utf-8?B?MDl5Z3NYdHlRNlZsMThaeWp2enRsdUNsNDMyQnVKVnBsbDIrMWEwNG5uVlps?=
 =?utf-8?B?WWxiSzJBdWE5T09abytDd25xRUEwOWZPVk5oejhDT2IzNHh2VTBGb0EvMnRK?=
 =?utf-8?B?ckJzUVNDSWMwN29OQWpJcFU2Q1Bac0xZcXdFdCsvT3M4QnBHYTZyNXROUS8z?=
 =?utf-8?B?bjdCRUlWQTJRMXJuSUVIK25OcUp4M0Q5QkowN0o3VEJLY05CanppNXEvblRt?=
 =?utf-8?B?TlhsbTZOYm1MTHoweVZxdjA4UjNuU1hQS2szdnZrd3pSN29IeFZyMTZZNUxK?=
 =?utf-8?B?NHhTcVM4VGExRUF2OG5ES2JoQzhIcWZTTlZmRG04YXJNdjIrOWJCVHJOVVNL?=
 =?utf-8?B?TmQvU2VUaG9qV3ZadU9yVEtRZmZSaDdjaW9mbk9DdjVjSUJrOXRXVGpYQzNj?=
 =?utf-8?B?a2tFQ2JHVkJSY2toeE1ET2NQaDU0ME90YTFoVjQxZEg4NnNTeGpLSjRKanlO?=
 =?utf-8?B?a2V2K2xnQlIxWER0bVE1VGxVRzU3VmxmSEhaN3Y0UW85alVORFRhTmN0VjdN?=
 =?utf-8?B?dlN1R0VTV0x5Z1VuVlNkQ0NOcDZHMTNrQ21QYW1nWVBKay8xK0VSZllLSENE?=
 =?utf-8?B?WjF1eHpyL0dnNTFuMlVCSzVlMHJkSytNZWpOaDdEV1dvWCtCeFNuTmIyUjlM?=
 =?utf-8?B?TEIwakJwMFNaYWw3UHc5c1BFSHBGeEFwcmlCMEFFVnlGZlBwVFg0RllGQ0dO?=
 =?utf-8?B?T0lRNkFVVWNpcTNnUTUvODJLRjhzcDJiQ2VuNlFTaUcyeWdsZmpGN3phMjRa?=
 =?utf-8?B?eTVMeFVnaDNiWUFTSTF5UytDUG5VVXFJOUNpYmVreFZXSXV5b2oyTEpZR3F3?=
 =?utf-8?B?WFBBSG1hYjM1NC90WWNHQ0Z2Mm8vekw4cGdYRThqQk9VNDZMZk9KTk96YWlZ?=
 =?utf-8?B?V3h3Yzh4djRvOUpNWUN2a245VlpXbXFwamZQUjNkTlZRZGZYb29CU0xJWkpO?=
 =?utf-8?B?cHRYemtBZnFJY05MUGxCK01nK0VobEZ6NzFKR3VPZ2VoaklUU0VNVy9SM2Zn?=
 =?utf-8?B?dlFZZ1daeE5IT3A4VEFnY3BreFJiTXZDOEJmVDd3OWhSRVhyMVRoQm80bUJ5?=
 =?utf-8?B?T1JwSVg4enphSkJLdzBZeEg0VGJ5T1hTVUY2REtxbnRrc0JNbElpR29VOFNo?=
 =?utf-8?B?RTIzTHF6Z0JSUkdhSS9KSUQxMVNFRzEzMzlsZGllY24wVTdmOURQZGtRcFJm?=
 =?utf-8?B?TVYwcjdGUHorNldkblZNUHlzSENsbjlPSUNTTitXTHNTeVlPNFl3VE1xSUkz?=
 =?utf-8?B?SXEyV2xZdHVlYVI3NkNpVlEyMkpnZEpMQWM3VHpvdyt3TDhwck5qR3MxZXJq?=
 =?utf-8?B?WUZ1NjhFRjJDNUd3cGxGTURpbGl3TkptVmdCUjNkeWxrRGtPWXJla1BZa3l6?=
 =?utf-8?B?Sy9iTjJHK2tjK3ExRTNDcFBHeFRrd1FRWVJScTVjeFpCZW9CczZZRWlnSE5k?=
 =?utf-8?B?QjQ1RDZ2dlAzV1dzdTA1bk1wNGVOZUdZYXhmZjgyOGJwUWxqdU9QamE2ZThk?=
 =?utf-8?B?MVk2RTFUOXoya2RkVHNRSWtJdmdiUUt3NlprOFFSTWxZVVRYb1dvL3haK1JI?=
 =?utf-8?B?cU53bjl0aE5EZmJNWUt3bHFMTFJJbllxejZPZU1ERDQrZlZGeXJjckxnMytP?=
 =?utf-8?B?QkJ4a2NLNUFsY3I3ck1KWnRmS3ZyQkw5Z0lVd0s4ZEpFUXdXeDlVd0xiVEJT?=
 =?utf-8?B?cmNPQjdnWEFudEZBam9NNTc2eUdxaDcyS3NFZUNCS0FnTnU3YUVrNEg3S2t3?=
 =?utf-8?B?RUk5UTZGYTVUMzJ1T0hPekpVUkhUZmw2MjJzNmdrZEE3a0doakk2OS9DcVZj?=
 =?utf-8?B?TmlUNTFheitPRjE4cC9nZUpvWDBYODRrQ0M1Wklid1hCdTBDVlRzS09DcmJz?=
 =?utf-8?B?L1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 307197a3-e9fb-45a0-f70a-08dc4ec354c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 01:06:42.7790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Da5nA0d05dg9ei2ncu0SQsPBgkQ4AlgMmcQua18HZtZ3AtpYu7JzgBzIYno9hKTm45K8lJZQACENELODvllPd9yX0P3E3bfVHyDNOgVQkZpr2ucWx2pOCVbzDfrUXW3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_180711_941686_BE61C106 
X-CRM114-Status: GOOD (  17.93  )
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

Hi, Conor,

> On Mon, Jan 22, 2024 at 08:24:51AM +0000, Conor Dooley wrote:
[...]
> > > > > > Do these clocks etc exist but are not used by the driver?
> > > > > >
> > > > > > Or do they not exist at all?
> > > > > >
> > > > > > The two are very different!
> > > >
> > > > > These clocks etc exist but are not used by the driver.
> > > >
> > > > That's not an acceptable reason for removing them from the
> > > > binding. If they exist, they should be documented, regardless of
> > > > whether the driver makes use of them. NAK.
> > >
> > > If so, how to avoid the warning of dtbs_check.
> >
> > By also adding the clocks, resets and interrupts to the dts.
> 
> Going through patchwork stuff now that the merge window is done. I'm gonna
> mark the dts patch as changes requeted. The binding (and dts) should
> describe all of the clocks the hardware has, whether or not you choose to use
> them all in software does not matter. Can you please resend the dts patch,
> with all of the clocks, resets and interrupts present?
> 

You have applied the dts patch.
https://lore.kernel.org/all/20240219032741.18387-1-changhuang.liang@starfivetech.com/

Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
