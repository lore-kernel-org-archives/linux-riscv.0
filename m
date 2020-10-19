Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B59C433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 00:09:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C98722272
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 00:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tc0YsRkQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="drWwI908";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ezTs+fRC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C98722272
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=lKLRMulLKulNWKMShM2noweWMBW5nM8cPjZccXysTSg=; b=Tc0YsRkQTTB3zjJlWQpb1o07Y
	3oDaPfcrWZx28V4/aBnyTONH5k9+eatMAuDDlVJ+nCB5HXCfMvRON82XZ9sWVNy3rdgyKnfjrek88
	Hu+1KR2HYIubOWYn7FKUABmwjvffHIWzGN7+Pw8+Q8GY33sCQUfXQdEJ7nF4oDJP+vRUNxplUNvWZ
	XIJJPbd7tkOpgIgJ0ZW7WaGkMcrmyjJvDJiGTnw/hdytb9uq2HrBkVHvUzEGGCcG5SXEkiKIONbut
	SQ/qJ96xxM7Z6MdzCZPFPt6Tm+S2/+DUqJ3raQBgvD6IyZqpsU4hNn3oij3xEqXTlM2rmf1q6Tpyd
	mwrpq3Z/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUIjI-0003ex-B4; Mon, 19 Oct 2020 00:08:48 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUIjG-0003ed-3A
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 00:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603066127; x=1634602127;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=7P2nT/OosPciFZOjQ8fsypN8QdW2KrByX8jvmc60OIQ=;
 b=drWwI908Ra7IuAowpPPLsq4HY6VLasW4AhPxza9vNrpdyWujtP8BicAC
 mf67YHs5CYjnKRaxd4HjTlCSZibIUvUBLjxU4cDlsto3pQOY0iMGXjfDS
 5RF0ccCitXMaeM9XzF5GLj9Jo+R5IrF8e4cWQA6aIRGKtqS9DVrx0PKtN
 SMuvR2q88UPDYUrDlTpW1JbIj+2okPBaDK730wNeBWqxu1FOTK7mrY6dy
 GJNZ4ZbAr/EEMNnh7rwcn+3o258hsqmOr2ObKxCVh1EeCpv0fuWmLBl14
 fEO1913LFJP4m1HTDY5aaiy+OLq0WTwcmJuggusC0uiLeArJc/JI7wzHI g==;
IronPort-SDR: MzkxWbfFa1dShclcawzQEH9WXOhT7ujYrkNzgfFdgpfnr1UA7jXAV59axEqz0OSkAfbpvgv7pr
 NJUIFrrrEi6cIiwHn9P0AmWG+UXuJuMNcO+ZXZodrkDeYGRm7W0K88Bj0TJPWdGH68r/BC3Lm9
 J20q5BYpv9RrunVx2tQJhMoPj9Cf1ySPMkbR5Vj/ChqfxehafuXhmpql1dBHyZFGBFtwSRusu6
 eJqL3ael+8qhLFCgGCRaizvYt9+iHdBDk3luWOM9Zh5lHzkjwFgXCTOztKO8e+/yOKS7maOVP/
 Pew=
X-IronPort-AV: E=Sophos;i="5.77,392,1596470400"; d="scan'208";a="154707918"
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hgst.iphmx.com with ESMTP; 19 Oct 2020 08:08:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcftzLYhjQE6awBRcgqL//T8a/cS81p5iLMveaK/w+HoHXX+iW3wtnEGcAhvAVp/ApUYRo+8kvzVPJHAFtBUj9yS7figk98YjLJLpM4zXz2XxioppdGrZgRmWytTe+/bdWMy6EIx4NZD6+EI98mE6JxudJKdHRgpSAaPLwXbmMk7DNAuHS9rBiXTKQYGqyVAXR1vRS5nsdEMu+NGcnZPlhIORbIvVx/wkT3QxYBygtakCvtvfWOQQc8jwR4kYYTnb5woPkkxHshB8omwNNExqKEv69M8ObIfio7mEzGU+20yMSFSxFayiLwR5V7j9OuY9E0PVUJ8Ra9+ikviAAozIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZSCG/o1tUUDl63YcNne7xRABemTNn6ZGbQkom+/sA8=;
 b=Qi2gi4XnODs+LdyNQqGONFvZuAFWd3P07R+T1qktLfkPb/y9rF/XZCW8oHT1FGtn/t8c2R/Mlkpow+oSc1QVA0uiTYcMYx0vL6RIEIAHxkfv3dqeOgnz3XmMFctuD5Dz+K/8su5HPfU9xTP1+L9S6KN2iCJtILn+hrG7Rf9Te112PPKOLXxMkKbCVdeUaFi/D6imZZx/PJrSxhW8QQdHpvXKcMlZmaTi9WaQZW2rRoXkvS4FxugvIRkpJA1mwi4UnFU0ZlFlsRreGkBfWO0sAUJkUsbWJ8Vg5wANtTojVNC+q4BKpv2XAAhv6CI12cuakMViTv2Jm1F5qGt3rusPHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZSCG/o1tUUDl63YcNne7xRABemTNn6ZGbQkom+/sA8=;
 b=ezTs+fRCCZGHxVYstRWSLcNyD8qhg/cqNbMx/tFOqQNo1HPa8frWS2OyFJX99DSzx6uTctrVJ6IFS+g4ulzNOtssE/P0hBnJp6w8SKkwSED2Gf7EmBJqqJj9FQQlVrpfOSDDSJiTWO3/rv4TVCJq1PTB2qC4GKy2VVz1CqdC2aw=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4915.namprd04.prod.outlook.com (2603:10b6:208:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Mon, 19 Oct
 2020 00:08:39 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 00:08:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Set text_offset correctly for M-Mode
Thread-Topic: [PATCH] riscv: Set text_offset correctly for M-Mode
Thread-Index: AQHWpLOFi+Sp7W1SsEeQiRIFvChPLg==
Date: Mon, 19 Oct 2020 00:08:39 +0000
Message-ID: <BL0PR04MB651474C90B702F1B72A68490E71E0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201017182848.125139-1-seanga2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1cf3:4b6e:86ec:cfa5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 986bc7ae-406b-4a39-b2c4-08d873c321ab
x-ms-traffictypediagnostic: BL0PR04MB4915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB49156CD5229CCB57B070963BE71E0@BL0PR04MB4915.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b6j0xNedwOdmMARxH7ft04B7sbjcGjHLr5OA5VS6rP2ovhH7szsQP0+l8xkyKFo4YYzRRZGBtyrfx78zaJk1DPOtAGqhLlOvS7t/mU7mJ4VZjbANGWv3myHZsw+OkYiEH5en4PzHuBCICXMO7rlRDbq9R6lH+skn5Pq+PutaM1dkqPa5YicWt4CfFi77FgHunst4hsxrvyNJ9b76K36k08wfqm/KvpUK3roGmcHRHpPmghddKbGDVjYhD2Hoq2ZPLyoZXsbLltSVrb4XfscgHTyOBhwh8LsrElwsbPPZSW5xkfYXCpOl2dB+muROsgaV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(4326008)(9686003)(2906002)(64756008)(66446008)(91956017)(66946007)(66556008)(66476007)(76116006)(52536014)(478600001)(5660300002)(55016002)(110136005)(8676002)(8936002)(316002)(71200400001)(86362001)(186003)(53546011)(33656002)(6506007)(54906003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: RzrHj4dfSqLPYDDHyZCzvryCBnd8cvHj/byMA0x8I3IF8LYThCLam1SNO9TJpDKqtz2rcWH9nr8AHeFao2oZ8kxGoUo9FVbZktqQ6ergTts2deMmw9oOnHrPfey2WIFMBBrss9BIuj2jsjq8dxCRuENF0ZiM32I2i9ZKfFJpv/PMY3W3qNc7K2qK3gFUH0jn8y40gMYDYvt4kLVGy4EdG+274uTlACy01BRryzQsSLkoa26nlxiQypz8EDKkD4ke6gF8+Nhi/v1GLJBpAEcqBqEdlc5VEvBiz9MfoScAiDX6gpSh8OrtRXDGMBAotrRkdnRg0WApjamzDTMfQLinwoSTT3oY51lqADEU4qswibbmutSvWxhju8kdSG0iOvXMx2778frbDSnXA+Xl26u6dDaGlNzUZJxKDKdjS/EzaOWXsnzKvqiecUV0To+piNB374QuJXNbldOz40neS9C6eby0Mj/ZflnU6aDS1u0mKsaPiPVk2uzdXRyFYZIeSTy+n3QbYfrxJvvmI/Hc3zyhGij+FvQnwEvnMTJUT93Q2vEIxRTVYvFeC50orb3YW9f8B5tyo0nhs/O4SQ0N183hXIVCxpqI2FSZdT3r0nGxh5pceeMYim5Xt2kaO70DnhKIhH4T3HUDzaZ4i2Mg0AeXurSYfruvHeBR4BjY/vNxK+M9XTVPX0v320xxUD/BxONkE5iG08QdJbe8W2RXwb0kgg==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986bc7ae-406b-4a39-b2c4-08d873c321ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 00:08:39.2836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0VzOTRK2B9BeBmaQ+grH4l33uy3BLUdh4ZvgrwIhYrZDVGQu0JlAGRmIFb3oEWEAVjiyg4An/jA8P8ZsKwP4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_200846_463436_C27FC987 
X-CRM114-Status: GOOD (  14.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/10/18 3:29, Sean Anderson wrote:
> M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
> should be calculated based on PAGE_OFFSET somehow? Even better would be to
> deprecate text_offset and instead introduce something absolute.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
> 
>  arch/riscv/kernel/head.S | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 0a4e81b8dc79..74679f338c65 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -27,12 +27,17 @@ ENTRY(_start)
>  	/* reserved */
>  	.word 0
>  	.balign 8
> +#ifdef CONFIG_RISCV_S_MODE

Shouldn't this be:

#ifndef CONFIG_RISCV_M_MODE

CONFIG_RISCV_S_MODE does not exist.

>  #if __riscv_xlen == 64
>  	/* Image load offset(2MB) from start of RAM */
>  	.dword 0x200000
>  #else
>  	/* Image load offset(4MB) from start of RAM */
>  	.dword 0x400000
> +#endif
> +#else
> +	/* Image load offset (0MB) from start of RAM for M-mode */
> +	.dword 0
>  #endif
>  	/* Effective size of kernel image */
>  	.dword _end - _start
> 

Otherwise, looks good to me.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
