Return-Path: <SRS0=5c4l=BV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E2EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 06:42:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F86C20781
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 06:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qh5f9oDW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="W8SHHV/L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="kbzeEjF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F86C20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Qgg//Tw7DJvoJI/YohZYivn0izEdSs+6Ts/aGHfA/qI=; b=Qh5f9oDWkMevhvM4VSvFQPauk
	pwx9wfDYSUZ4GU/Ct0NVefkSFzw/7Ktzb/SX0ROOP6wwBJS7d+IrLtdbblQCi95JjkWZTssi69GFz
	YQ8ApL4eqeCJTFkKiaqIe7TIMLGNm2YH+eLnSWfuYoMfsAbFG/AuF3vwkzUtVYfD2uRjJBFh8aXFl
	E55eybJmfkfDB+Xm92iDPyCmBBd9/hZNmMrYMUOopYGOgOBrSP5CP690J97yGdmewMB/6GFcjwAld
	YYcfkQjth4tk16c0eERrA/BbSr4SfLvQcgyT5aa5zJ5mLDO0uuo06PSkpRXxTPxv2CpUIzt44tTvz
	L8TAhsTxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5NzK-0006DZ-Td; Tue, 11 Aug 2020 06:42:22 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5NzI-0006CU-4s
 for linux-riscv@lists.infradead.org; Tue, 11 Aug 2020 06:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597128140; x=1628664140;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=PaJNur4bzP8imrJFj9C8XwlzrtfCsMKk7zDevcvlapI=;
 b=W8SHHV/L2O+mkFoKr/pemKtipLb0+5O4CQrBTC5RpkK6H6wcUsFduC8e
 2uI+wkfiSQvH0hjN6vvzOyywizQSUzLe6DlJPqyzjUrNhaDsivBGOI2Uk
 HxEbDL1FALn1bdhyHiPQEU0yZCLiF3nLE7RHRtb92fOv8QNaMNR0OPzuP
 yUORBwZs/RH8ZZeUEiTXAodJKrbFyua4v0ssAynZl/Rk7RR5aDM1kYU/J
 hbdzb5kMLfMuqFIW92kyaz/gTw3HTxuhIb9Bah3ZhWV60s9nEFXY+cHFx
 KkESPLvX7FJ6EFuBbGlfO+gc018ynhaN2uJYyqqmbWEYk3PqDQWwyTIQ9 w==;
IronPort-SDR: Kh4yspYkKRlqzFgZccwQChwqpqMyaRZ7NRQrBYm8TvHlmlx4PMVh6jcNkgjVY1GChT0SkUgaCA
 B/oN9M09u8hnlMmRo0TdQ6bu17h31RQmvMSLECx7pfcWf3HZ8qH3vWJLfeNkNyeg79YUhHpsSy
 h1YuX+LGoUAk++JPR1l5d1F/ttlG+24uX0gWN0MjYW98qzPDHKVpcH8jYWywz4qSjWuZJowXeH
 x1ApfFakvqSqk1j8Yx3VydQAPItgzHvy50+daAfpNu9mh0Xs1L4qYLFMuznoKi+4/2wqAYjLqy
 rO8=
X-IronPort-AV: E=Sophos;i="5.75,460,1589212800"; d="scan'208";a="144692250"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2020 14:42:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SphO2ar0Df89ABVs58m+E9WMQP8+YNFRqsBgiY/kgwU6+Ykr+ju3e64pyVaGGtuPkIXVt5WXm0wHYjsROXT6775odhC/bblWlsNNoB1NrAj7WR7Wsncx/mTOTrPwCw72ag8qOJajtiFHy2fI9LgdZj0OyT9Fy4y1+SIr84KZrkQfmhmclVV3yIW+ZofZvGCGB6DAbPnMC00SSzJJLKqMxamI4EEqcJm8y8xKSa1ZE7wVMij2k6YmbeueZX2fcgzuOP5y7SSOKJyoJG68uMWfINuHTF0MPNEtZDG3c0EF8VzOJL7l4+B/KF9j/3EBu0O9WD+vDDRJ2v/QBI2R8ZrNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQAIWCcdnTBacU+umg+nbFUjQZp0qqOywQ88jvgQFBc=;
 b=X6Fyy/YTT3WGApnxFko4A8jLaYZhJysjzV4fo3wFvAuRYm2eEIqkxKQ+M5H7Z731XwRAtPpIjIHyRDKhLbssWTdLcuLojJRIJkuul6Sb3FzKJPpn7YjmblDuG00PwddpbKdWT512PXTXRA6PkWdtSXmaOKG/9sQ5m6vwAxNwk5hjtRKgU2K5KROFIh1wwsGI47T3bR3wFsOAraBcw8hPiCEZ8vEZDD7Mcf6PXo7GPr7VMkuneWNNfKvnoN6x0FpKtdImbUDShJOAF2UXxxl3OFJBkytIiNjkaalVnzwOun4T/H6OU8L4YldwUL4HJxb1yPaE/z6/f/udMTkVXIprMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQAIWCcdnTBacU+umg+nbFUjQZp0qqOywQ88jvgQFBc=;
 b=kbzeEjF5k20tOzbMgv8DZNu3wFjlkgXAfVZs7l1Ake6tDNTb8VrKPuiUQc0ObYkRy/95yRih2RQsIQOuvGDSgTJ7CguWuQAOpN8fOcOFcBWmzHX6efKIpW6MNfg+nuPJefyqPhMh9xnTfvSq6/C4FwxW4jWJfj0RQP1vc76Hr4o=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (10.172.142.14) by
 CY4PR04MB1257.namprd04.prod.outlook.com (10.171.245.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Tue, 11 Aug 2020 06:42:15 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::7d15:9936:4b3b:f8a2]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::7d15:9936:4b3b:f8a2%12]) with mapi id 15.20.3261.024; Tue, 11 Aug
 2020 06:42:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Qiu Wenbo <qiuwenbo@phytium.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Setup exception vector for K210 properly
Thread-Topic: [PATCH] riscv: Setup exception vector for K210 properly
Thread-Index: AQHWb6n+97W98+gJfk6zRY9oCnz7uQ==
Date: Tue, 11 Aug 2020 06:42:15 +0000
Message-ID: <CY4PR04MB375124E6D2AD38BF1D71C1D5E7450@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200811063659.284088-1-qiuwenbo@phytium.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phytium.com.cn; dkim=none (message not signed)
 header.d=none;phytium.com.cn; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.47.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4ae553c-2d66-430c-1869-08d83dc1af8a
x-ms-traffictypediagnostic: CY4PR04MB1257:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB1257BCDF2C0430130F4D6205E7450@CY4PR04MB1257.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z16NeC7RfO5+hEwrpToSVVmBOrE7GvxkdcRqEEO8bk2ILcxzdwILc3jvIMmEv8Pj/6LSSOJIDy8E/HtyFWW9RoDZ016hIkfm1Zqq0Fj6/IjvIYoxMw5AGC094p9NdOWx3ly8szrpNB46PN/wipc7cwMIxYwpxPGO3OrDaBYaS72ssBMPOh1OYD7hfCriETelevJ6+qizzzBoOPl6tv0nOA2VoDx5ZtIEjFrAcZo8liNyIGRT/IzgSazZrb9337KkA5GaLyI0rcV5ICedcZp5Ue26DpFDfaBv+JYzU3fLwHwIueMBoYChCWfw7T8VUuorY30UBbnvfwvPY1h24UR+ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(186003)(9686003)(7416002)(52536014)(83380400001)(5660300002)(2906002)(8936002)(66446008)(66556008)(86362001)(64756008)(26005)(55016002)(66946007)(76116006)(66476007)(91956017)(53546011)(110136005)(33656002)(54906003)(6506007)(316002)(7696005)(478600001)(4326008)(71200400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zBx9cCNrJv6poPLZPVwizkwD7oeqVGUand05Bxz+sDg3bZgixnSlAhlFGNNpe3eXw9Izqbq5exnmU5zRZu2ESGooHHBmqSCjamSA/EZJHk1b/XFh1b6W1AHpaLeKJBIYrWNxcZIZAzALkjYFp66lI/nyGfWOSZgZQ6s7RNjMO9NONERlBZoXIHzeEYvnGiS25Mtj+5ZVztae7HYrL7h9h+SO4rl0NMkCN//MAWP8WQ/HInDITEc50BAtkkJfIRFKmmcKqoErQK1mRk5by3qsAdpJOwUfbEuTFqMP07gMmQwjr52cxBkz6hCy0OkYn6EPI16IRFSZ8yZLBNzxH2vr+bbE2nV5MqydEpaWpwos6vGGMinRjp1swekKSlAjO1Wvkps8PIk0eBv3nMDkSFKa059QjEzULk9ftfELAHW7qHRiZkIJbOGyQDxJ5cC9klWnLaZiamqBDOZFr/+MHVq/OwXCDMVRO58jKcNAve9EMBPsHmviloBlgPFUPVsMNQ7/Cdou7M/QrWxE8WLd+35JQ8jZ5BsXTYHCdDrtEGg9Z62XNDk+gvNpTjCvTFq2ZPZ7kSn3NjBJxfFW3yt0VmZZC9A0bfnn9Ij46vOZmMjyAd3gfKappRNb2Lno0bDYZyvObWbAZvOOxSwvsuGFRYJ5ow==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ae553c-2d66-430c-1869-08d83dc1af8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 06:42:15.3891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywC6Sp0iXT5uGBdyjeIpzNpeiBmvlLGh6NwFDoSzBdONnbOhrE5D44P08USE2flhseUmFUz4Kb4JangwyatovA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_024220_550576_523DE6E8 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/08/11 15:38, Qiu Wenbo wrote:
> Exception vector is missing on nommu platform and it is a big issue.
> This patch is tested in Sipeed MAIX Bit Dev Board.
> 
> Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
> Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
> ---
>  arch/riscv/kernel/smpboot.c |  1 +
>  arch/riscv/kernel/traps.c   | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 356825a57551..23cde0ceb39d 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -154,6 +154,7 @@ asmlinkage __visible void smp_callin(void)
>  	mmgrab(mm);
>  	current->active_mm = mm;
>  
> +	trap_init();
>  	notify_cpu_starting(curr_cpuid);
>  	update_siblings_masks(curr_cpuid);
>  	set_cpu_online(curr_cpuid, 1);
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index ad14f4466d92..a390239818ae 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -174,7 +174,16 @@ int is_valid_bugaddr(unsigned long pc)
>  }
>  #endif /* CONFIG_GENERIC_BUG */
>  
> -/* stvec & scratch is already set from head.S */
> +/* stvec & scratch is already set from head.S when mmu is enabled */
>  void trap_init(void)
>  {
> +#ifndef CONFIG_MMU
> +	/*
> +	 * Set sup0 scratch register to 0, indicating to exception vector
> +	 * that we are presently executing in the kernel
> +	 */
> +	csr_write(CSR_SCRATCH, 0);
> +	/* Set the exception vector address */
> +	csr_write(CSR_TVEC, &handle_exception);
> +#endif
>  }
> 

Looks OK to me. But out of curiosity, how did you trigger a problem ? I never
got any weird exceptions with my busybox userspace.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
