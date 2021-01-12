Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9989C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 04:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77CB222510
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 04:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77CB222510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=BhOR2zOG7nMJowEsDAt08VDy/yYMHZhmOiCrAW6ui/U=; b=MH2jW9d/d5egdjr2myYRcbcyo
	RwxFSjxk7uWgCg222uonFqHP8sseXM9MrttUot6xer3Z4lnZRtXKrjKUaoKkxCkGpTDWCPKfUCJpq
	QLjBlfVzGTsG0GturKFFkpGNkEX+B5OS8d6quhysuHgyOrovTfEdu5B5EHiAGSL6uFGxxxcwnSpFz
	4znawONW4mi5oOrK42poIHB/xdcNbj+WIVZcwgLOtxnflcrKd2YKRHoOmZBGpT0bSSlsXMANKKXsI
	wmmMapRnzzTkcg8SL7tGbB1tVw75t2CVPV8PFnaSu86vLlxTl9tJvoHRTWAw+q0AQKit1xTeSsU0l
	ui1aq8uDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzBjc-0000S4-Mi; Tue, 12 Jan 2021 04:56:48 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzBjZ-0000R8-GZ
 for linux-riscv@lists.infradead.org; Tue, 12 Jan 2021 04:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610427830; x=1641963830;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=vJvtbYKQoJ6csep19qOshXzJScicim53C8PDsgZFEUg=;
 b=guiiKtr0N1AkyHQs+BMPssAImej5sV2gIYI5RrkkL9M/Y3ypws+cpUjK
 cEtSP+XMebhhs4Z9Sx1lYrXkKdAeC7q6clwLmztV05/pgbL0C3RIMQGXD
 CmwR+xEcR+r9sAl02LZ5183O6OYpxwlE68+vq2bVKOY3uVf7aRRou5pv7
 77qYr/IH4J5LfaFfMAJ3EGY5I4rmHXBcZ6+zEB6zfaZ20rBYfzV74iaaT
 qOMiUyuT5/v44sORvyp8sz0jSvGrMddeT9CpnbsU2aARCeTpUrPZCXInO
 6m/YTVq1q4b+Jlj62Scqp8mb0Tqj7+e60aAD6+JOlAZJ1/nK8B+hcjpGa Q==;
IronPort-SDR: 16yNKk7Y62L6bqg/kLgoxXUk5ytHCq/igLrGmA9Ep8t6kKPjNiHelUDgxBfLGZvTEI0qnzIQrC
 nG1VIcbnx8H9pSylbWvnY0ibNH23ekijXCx7rQ2ja8GDNuuftbejxlS1mSNZbSlwNy3AAAEPw4
 x+X1WXLkWoxIDj0vkYazSr0yEIHugWArzaGJsiaxeUrCOaTp3MVipaSlWg+AOAbyTHOIaxccD+
 S5V25Wo1me/2rBmytp4NmKeSNKLlduAlvTCvfRV/4I0aIgMRqM0DmjYH0xVkL+mcah6wlsdiV4
 1gg=
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="261101912"
Received: from mail-sn1nam02lp2056.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.56])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 13:03:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNLYZVsLv0iYlGotohpvJ/qdMMbSdwepIK+UVS178RXkrJYudTaHsYIyTLlYx5RiOMNBuEDlegS/L8sYvRjeEcsYmEmc9zK4GBX8FXT/8hjS/MNarBVFPAkKKVe9Trd5xwz0CMlUyicKseKB8SSC1LvUYO21bSMy4N7U7KHPGCn9HBceG7CQzFC72yUECCe4tZcRJWl1yc5FkpZij3tXmGtA+5PmOmfZunbJ2FeqZSfGda+6ni+z8i80mwcwsG1NTLcD8S7nU8gnu1Iu2Tc2/sN+VAbaJ8Sl7aHN5LbFa0wpDFONWmVZpDlrlu02c8ugaVxyjGOsKC2W8xURhd2QrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itCe7Cvn9oWGdipIK9MP5Yro1SJFR9twwtcA4RPYQgc=;
 b=GqUJ0UcsxxXEFB5sb7hkgw0j3nTvKs3XkDkyZ/FAxhJzkCGicEIoz9uAvZXCH1430Lo/gSWVqD+7mj3lZlsfJIQVF+DHN5CpW+J7Ywg/J0i9pyZl3yxpwTJlyjglGqLXG+lw6VtRHfUYWgLF5Oz+Sx/Eyz5lYWHW1/otaMpifV6ITnasQzWR7SkCZGcte6bq/kxNDnC8kgilDmZdTs/g3RNxsSopr7oFKcFz9r191GODQMA/kIKzYcKaLTshEaaG8YiwmGlY8cNpT5zymnptpZUd9FRx4j9QS4YFI9uUqmnl9c1Eiapi9TiNvoF8cxI92pZ65bD9lmxbPCPhRjybwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itCe7Cvn9oWGdipIK9MP5Yro1SJFR9twwtcA4RPYQgc=;
 b=Iu8+jRrWADwJWDlBkjYmEkMT2Q4/pQWYXsW3EyXez5Q/JpoBSRv7zPt5ct9ukSAfvNvx3qceCHv7miaE0wQAsT+Lw3RBM9HxmZ6kuihRmJCTh8M3Tbulciljbx2yQR+tqee8uEWBWLhJwc24YZNHKe2ac5OIIY0WhO7ZwpZt91Q=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4738.namprd04.prod.outlook.com (2603:10b6:208:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 04:56:42 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0%9]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 04:56:42 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vitaly Wool <vitaly.wool@konsulko.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: simplify BUILTIN_DTB processing
Thread-Topic: [PATCH] RISC-V: simplify BUILTIN_DTB processing
Thread-Index: AQHW6F+wb8gN2NR8V0SpNievsT3NMA==
Date: Tue, 12 Jan 2021 04:56:42 +0000
Message-ID: <BL0PR04MB651404BE54D2D9297DCEFEF2E7AA0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210111212031.2422-1-vitaly.wool@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5cb8:2b48:5f8c:2c03]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 42ca2df3-4ddc-4fa2-f19a-08d8b6b6746d
x-ms-traffictypediagnostic: BL0PR04MB4738:
x-microsoft-antispam-prvs: <BL0PR04MB4738ACFD5C168A9AF5974E08E7AA0@BL0PR04MB4738.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 70Ow8cfTd+xlRlBKNuJUlyo5gzgP1vzReFkK+Dl9p5NpOUHKZx/bvOZYBXqob44eiez3wBl/cYMjVDoEem3r5+1dZJiaSol9gD+Mknjj/WazzaH//YfAWKwft1J0IQa1HSM8N5eEzxoVzL6CpgVXqmP8DW9w8DLRCCGwDPFMnSBhzmhZd4aDwouc7MDyyARZd+p0UnZjDyX2BZTGS1wH7ecLKR81gzLVP5YJPwZs4OZCydqXxZ7e4XqqYy7FL5PeykUgDVfXDD+3GMQ0XGkh1EfwAjTzwTs+h3CVltTP/5sTOUxgu6QExZVAZ2OiGxWbe/yVyhJwZUH09/q39FB0wjN1Gc+7Nz6fd29Q1vlKrBn1e9X3Fsl5NkYAcpsSjQSnumy81zLnipBZaHFv4UC8bQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(186003)(54906003)(76116006)(53546011)(6506007)(316002)(86362001)(66556008)(33656002)(9686003)(4326008)(64756008)(52536014)(8676002)(478600001)(110136005)(2906002)(55016002)(66946007)(5660300002)(7696005)(83380400001)(66446008)(66476007)(91956017)(71200400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YNqYf2voHV9yMNypfo0nlRvby5Ytdfks1pAwHFrFPtY585mA7vYYQCP+S0gT?=
 =?us-ascii?Q?L3uBgiPegmarl/he19yZFUJmx+6v7Lk0HcGlzxxC5yIiKGh2I7cAx3ZJo7ew?=
 =?us-ascii?Q?r9SdKDbJosQPzsoFL0YJAGu463782qx/a4apPnws8nT2taUv5Ha/hwO1aRGK?=
 =?us-ascii?Q?OvNKnxbV+Du+th8rX5t88qpPAJn3n2TtLmWQZC5owkN9sw8GuV2ogjfcex5S?=
 =?us-ascii?Q?N+fByQtzpzsUqWvNlB3P22+uQy39VGw8injjfcXta0ylOrVllN/PPu7yKqgH?=
 =?us-ascii?Q?jvCoxpCHW0FqnraS8vCsmK6OMxc8ty32CI6x/o7R43PcsWeeVCTueJNC3yK7?=
 =?us-ascii?Q?O1pRcpmtjKYoeZqpu1cMMbY0UOVnppOktXhtaGv8tWkpTOHGcro+E9lfeYtb?=
 =?us-ascii?Q?ZuGZtk6AJsF2100W2YYPs0ejNXJdM+SZ9Ih947z8a/fGwRVn8kIs4KI0gVRo?=
 =?us-ascii?Q?7OaDir/XnmCBuzMSt5gP/YaXu/B73YW0qZ0uTMcGCdlUBrLdMKaXVpRbDo+t?=
 =?us-ascii?Q?kmavPgSnVCDeFhf+l0o5XzvxhsQjy6iLs6CGbuozlzA6Q87LYT9wZlwCGXDf?=
 =?us-ascii?Q?goVdUYUSf75uuRabdD0Ulry7VmasoLNRaxJQb1Po4i9062VPMpeysnhgdpsq?=
 =?us-ascii?Q?ucx+UKtkfIDbG1/ftrv+hUgMsxR4bcduVyIctsoSK5/lqrCHITRxlweDWWoM?=
 =?us-ascii?Q?KFHT1Nx//30XV8Zl6WzRUYTxUciHioTxPBrhe6xg39CRqz4jILDbTOvGSwCA?=
 =?us-ascii?Q?d/auSuJz9iR8s2NvuWX+S3r3sGlQjC439FL0dOklJST9gS+seaWcsx9+xuD9?=
 =?us-ascii?Q?hNBZCc4RvXA5C+2CmxqPEb0nHLuGjut8GLXZUNat9YWTP9DhlS3JSAu0BU/a?=
 =?us-ascii?Q?9u3UB4Pajlq7lRdPdzpYcuJ0vB+P5dgtFG5ORZrZJvbz6J9tSF8cucPIS7rH?=
 =?us-ascii?Q?j73FRBwH30DYryv7BPv3O9oDnxoedX7JSAmTNrGsSBw7LLOnweHKYVB5Kd0Y?=
 =?us-ascii?Q?c6TKWVJxiciRNskCF9m2gUIKeCfg5MVQxcHOfI4kEQyZJP8Xo3w+3PK3TquC?=
 =?us-ascii?Q?o4ZGLr00?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ca2df3-4ddc-4fa2-f19a-08d8b6b6746d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 04:56:42.5873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kArmoArcbwvBbHUJ025AMhsGWIzLSeyTqAeDK/zD+cnE7xX5TwJyhv+K0js/upAgV0d6b0nydTSszkp96lJbEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_235645_862875_135B6A1B 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/12 6:21, Vitaly Wool wrote:
> Provide __dtb_start as a parameter to setup_vm() in case
> CONFIG_BUILTIN_DTB is true, so we don't have to duplicate
> BUILTIN_DTB specific processing in MMU-enabled and MMU-disabled
> versions of setup_vm().
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/kernel/head.S | 4 ++++
>  arch/riscv/mm/init.c     | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 16e9941900c4..f5a9bad86e58 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -260,7 +260,11 @@ clear_bss_done:
>  
>  	/* Initialize page tables and relocate to virtual addresses */
>  	la sp, init_thread_union + THREAD_SIZE
> +#ifdef CONFIG_BUILTIN_DTB
> +	la a0, __dtb_start
> +#else
>  	mv a0, s1
> +#endif /* CONFIG_BUILTIN_DTB */
>  	call setup_vm
>  #ifdef CONFIG_MMU
>  	la a0, early_pg_dir
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 5b17f8d22f91..45faad7c4291 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -615,11 +615,7 @@ static void __init setup_vm_final(void)
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  {
> -#ifdef CONFIG_BUILTIN_DTB
> -	dtb_early_va = (void *) __dtb_start;
> -#else
>  	dtb_early_va = (void *)dtb_pa;
> -#endif
>  	dtb_early_pa = dtb_pa;
>  }
>  
> 

Tested this with a nommu kernel on a MAIX bit board (K210 SoC). No problems
detected.

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
