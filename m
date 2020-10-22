Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E250C388F9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 23:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E212820724
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 23:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K7yGPybn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kk8m3BWs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Isipzi3U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E212820724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=y8x9t5UfMz6ZWmYrdcQEhqS5FumjSoYuak8Ou477zFk=; b=K7yGPybnXDgtpmAB+5NV/uAu8
	/B93T/MbviHe4XfRlKuGaArKbFW26NlzjNuoMUTkRGPsFK/jV3LeRmYNUPtXBXIAkIYrZ1i4jJT3r
	/YI1gf+rpGdZAMpP8Nd0s3GNwhbnrozzivoqI6dyJzGe/CVRiEJjBK7T7DT9efhS1JIU3X0bOxtOa
	9fQgNpws42xiXWWigDiQQ8VVWNiwoMcBcFVFVdKDPuPoHHi/ZfpVq8kdgRHN4rWvUATERaqRL3b01
	tTZXWeKJA7iOWD6iwveCvjyVlXVE136xQh6YEt30ID899A075v1J0esjhuUjYPXGeg8jeMNmhSgSU
	7jojZGPnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVkQo-00072x-0j; Thu, 22 Oct 2020 23:55:42 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVkQj-00072G-Sv
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 23:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603410938; x=1634946938;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=sephKk31bA1tfAPnKI1oAq9J8KHgj9iFX9R/KycpE2k=;
 b=kk8m3BWsQ9RXUmTlnBZNVZDmUhhJ23E/zIT7gXN2HAVHGWtNvM9kWAkJ
 ll7qOJYkp+CAaxW6q/2O016g0X9OCIs7ojzxFasIlu6fxobKHqSaoam4/
 ZQXeXfboTQsOwCjTmTABCQDsnwE3aiYvUiC9xP7ilbqqIDy9KhUah3yGk
 dt63on5CnWCwHukWk3xtOL+4P6Ns4FAavxwibVcat6K+R69oOeL5XZHcG
 skshwcZFwOWLr6CosfH/t6wnIt2Fo5x3EHKOL/icMboNWQW/gRgc8iYwG
 6+65MB7Jvz0b3CMHk8EBRDHLgnoNqnzQKVJJ/bMucqASa6VYn/eqmBEAQ w==;
IronPort-SDR: SQhtX2Yw0rU/agAhRnvMUa2wuon1E+qeHljLDegWCOtV8oCT+9FG3SgIQekzFxXb7mmVP7NABh
 SD+EuAXEEaZUfZzaAybg1izU3/2CiZgCd5wzgQfRpMLGV4wqc0TBR+dwVr+zuEe/vpPhnXMphY
 /Ry1G5KkVZPoelMv6DTAfMz1npT1PQL5DoiN0xia22CgUcSUODk+8bydo+D6zrwxBGLvo8pbMi
 uf5un5uDA0ssb8EyfDyCl8hP9qNFg0RGc51nBsq7TMOjxrCSvM9TpuL88+Z7pMvLprKKJLXaCy
 CDs=
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; d="scan'208";a="151898188"
Received: from mail-bn3nam04lp2050.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.50])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2020 07:55:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+0xPfUxNQir6BNuqd7JGNSF+saVSBI9Lsr9LPrtbJWqUpY62z8IGT199NP6BSAqgY2OwnwUCd6rNMIDO0bwY/yQmr2WR3S3YksjTj1rpS+4VUC5gexlkK2nnaK1U9UKV6Y8BAFJTWbo38qnqshJjd6E0Y3IWJwC0ZIB7T3yR5LcZ6cpOUpXBxHK4SO0f07nfv6gyHUHGuLCOJ1hkoy2C+LL6MFrv/sMxltgjGCpq/tkVY65TIcLN4BHFoGy+qAptXzTIKxBcKTFFvPVrQkpMRb3CMQoJGDb23h776f2H4F16IR/hXH/dnA8TltHQHuo21QyxK/1CAiFitlw6A6uSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B22f7181ytHIgR20/QAKal/KCjkAkKlEREULg+O06vg=;
 b=V9anL/eOPc+v0yCTki1TNag51z6cS0tt2J1r+MlBQ5VdMtBymJavQJ4ujdMfnmm2UhabBwFeYFpPfFIgS82ZhBwDFhvsxVcdlrB3lxBn7JKagygUqev0l8fEx8BQdvKSTjUYi9Uv/+Ve1X/7Jx5Ey6WsECjPcLbykgj0I6UdC7ZFiJiya8B0DvsLBsdEzk2olU2P9aHOweptsZhpSHcxCF6KztaoQ1kfB/ljzMVWTXko7zIaomDMLZ1htYm0AJtXRanyoJWn+CMONDhs+5MpKpv86sy3Qq94xwohST1E/lrwhXoD3DFeDF9iqN58GCq1/SsyzUjObkNm5CD8bBLKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B22f7181ytHIgR20/QAKal/KCjkAkKlEREULg+O06vg=;
 b=Isipzi3UIldLcnUf0Sc/6xHapoMn5NlEd3zOoTMd2m14qOG+5DutORevQv+EBfu+4+Uf+UwrwleyPGRAGYVCCBBdryvQnYjVZ4pnupQ3id9QsbRc+PWfaTYMG8F873q8Prx3lXg/P5Il8b0QAXlv1dgifmo/cXe0HiqSlAoKvJE=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6671.namprd04.prod.outlook.com (2603:10b6:208:1f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 23:55:33 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:55:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] riscv: Set text_offset correctly for M-Mode
Thread-Topic: [PATCH v2] riscv: Set text_offset correctly for M-Mode
Thread-Index: AQHWqLIuSPfy67Jvwk6w5mTr7yvKCw==
Date: Thu, 22 Oct 2020 23:55:33 +0000
Message-ID: <BL0PR04MB6514430D1426E3C0CD8A1DC2E71D0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201022203012.428607-1-seanga2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:ac62:d981:f824:8ed3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb565ab9-381f-4a36-328f-08d876e5f70e
x-ms-traffictypediagnostic: MN2PR04MB6671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB66712733A27BAEFD156D65A0E71D0@MN2PR04MB6671.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fBCIUuXjrruzoMqOSwAJktQIRj13smX3tD2Quh0EQSHFv+FygkoT83emGxGd8RqwaJrSN5E5clv9JwqGh9m/C2ncjHtI/nIJfpdWloMjt1mUAjnWqOgFUqqqkSa33vf4En11sMfsvdMvH1L19xCvWTeYeB3X5ncc+hsboMU45Ug0RmHnuzhuoNAsTaCiXl3NBWz6OWkyhNdMcQgPWBuOndkTNG6YwIaAhwOGmXtQZd/bil12DpAy67WMbasc4LCpujnvoaimVdbSt4V432QVHwLVPEXCmCZEVb5YgwiDny1Zv8ze/1J8BdieBIZA/GfAAWJ4lTtFjgAYvQnmFzn9uA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(8676002)(86362001)(9686003)(7696005)(53546011)(66946007)(6506007)(186003)(76116006)(33656002)(4326008)(91956017)(478600001)(8936002)(54906003)(5660300002)(66556008)(2906002)(71200400001)(66446008)(110136005)(52536014)(66476007)(64756008)(316002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ImoeoIx5SNQ3dQs68t50Ir+3+uAFtNBGEA+CyTxMT0LssMvcYvLbDurjGtrxe8Z65vkQF/Arf03pORxo8qxl9kQ8Rcusr49COT/6XtqAtWC4XAUjBEPrigDHXOpeTfInwzPieAd0UNQKNkX7N91IWhBbm/o2YZ2t3SJRiuGoyMK0lDxKCONgACM/mUuvINFhZw8mUGHqALYt3McLgK3xaTPbsiuWi6KOlzTp1MKecR15eMcl9E1GIZBfFfE0O07mGtvloAN8MyODOjAi/2DFgfPKFJQD56oESSY1bRWtvuVv8rCefpTmctOBIKuyKdpcfFRxCa8nn8SfYNNwAEDsZvupXBlfG9j98Uh573+TDDFIyX3mTPTWakGNdFiwl28TnDR7MVDNzpvY2opdmzk2rspAHlIN70cJ3FVAIR9p5mXU5lrILRFEa1O4D1YBS5OoHrQV/af6xBWvoKhV0R4zISIA7TtsM/DoVrupRr57m1JxX30jjNT+M922vvRNHkzYiUThcvTPbCqv2uPTihcXk8L4LnrZdCQEJimBstSBim38c9XM9au82Jg9EjQOsUV51VMVJ4vt4HV+elpPIStxuB+lqaUll5gK5RZi5N7PWyHkt34NQVxKYDTX6/SPpL6y1b7TR3T/tS/ALcQmMshe0mCM3vnnwghoic1toq9GDcpvePzbXi+pBJ3XsUrZW6bMebcIK9J9wj+c2fmqrf3+sA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb565ab9-381f-4a36-328f-08d876e5f70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 23:55:33.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDVhURhon/xKvlzcYkV1xDO4f+XSNH9h1DfUf6/XM7ZTdxfyJ4pn6mCd0GnMGYcrkPPl9l1AQmwfhOifMO/43g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_195538_229925_222A697D 
X-CRM114-Status: GOOD (  17.51  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/10/23 5:30, Sean Anderson wrote:
> M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
> should be calculated based on PAGE_OFFSET somehow? Even better would be to
> deprecate text_offset and instead introduce something absolute.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
> 
> Changes in v2:
> - RISCV_S_MODE does not exist; use RISCV_M_MODE instead
> 
>  arch/riscv/kernel/head.S | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 0a4e81b8dc79..5a0ae2eaf5e2 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -27,12 +27,17 @@ ENTRY(_start)
>  	/* reserved */
>  	.word 0
>  	.balign 8
> +#ifdef CONFIG_RISCV_M_MODE
> +	/* Image load offset (0MB) from start of RAM for M-mode */
> +	.dword 0
> +#else
>  #if __riscv_xlen == 64
>  	/* Image load offset(2MB) from start of RAM */
>  	.dword 0x200000
>  #else
>  	/* Image load offset(4MB) from start of RAM */
>  	.dword 0x400000
>  #endif
> +#endif
>  	/* Effective size of kernel image */
>  	.dword _end - _start
> 

Looks good to me. Added this to my upcoming pile of patches for Kendryte and
tested. No problems.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
