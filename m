Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4B7C4708F
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 09:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A391610C8
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 09:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A391610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E647GUhjdZLpqyiGiHXBROPsL65o8hQztybgksP7wZg=; b=1gvL9k2Z8PMlcQ
	4Mdm2w/6rFM+j0jSwtH40ILJMBcB+louHbe0jdSPwlvAcS+3qavfdgeX+5e2hLBVtHVYGJel7NKRA
	zL/Sr6h1PTxTaqyaOb0dvGm+QQtcHeL0tmqaSfYT7exFZVrkLf4r0NlOjJcYMybgdqFwruFz6fv19
	BfIJu0snwxW08IHdUQ45S34F/2B/WnwICpUZrOAIwrFjfGcuUQDi4oHB+WYyH78qVSPIz8LAC+M2l
	g7bDBDS+4I1H0VTxa4i1WNrfiYUpwHloftmKIZJknRJS+CjQoV+tdBLsdAED+HEKuaXYNRdCAZJw6
	3iPoV/DYM5DzH9gDbH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lneOv-00Bime-3z; Mon, 31 May 2021 09:40:01 +0000
Received: from mail-bn8nam08on2041.outbound.protection.outlook.com
 ([40.107.100.41] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lneOs-00BimA-9A
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 09:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKVOkFEoUK/vJOK2ecX+TFax9fTvCTe2iFvBEWbRZs6r/BT+eBIPKCLwJ+UEBeyEQkQjJ3sxi9l0iLxV0wCn4ptOf/yRRRYu3ESPrNcMUo3gsbkjy+KnIMEAb45a84n6I38voHuerzPn3hYBycIyssdq2tG9We+SeEdZXTBW516tok89+yEzHDLMdheRvix1Xvbf0FPoh+HnAGUo9tN1Z6gKL6kNCryUFP4b8Mu+b+P9d/5Em3c6QBQsgXPnCacFvpOk85563YzkFcS6re37wZhd5z6eR3j4BlaAGOet0sQ6NqBOiQ/jnogfobBCpAMcVxAox7pkWisgGpdYn/Cfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh//W0V8+uHWczHfNZdUvtE6QE4dHEhnDnqvQ5y5x8A=;
 b=L6VhDWOpwr+RzZvhoo56+Ybb7EPbs9dwS/ypGQSf/vuTOXFQ21b+otOWuQWWNbLUnGHWuiq5lPDr/j3dC+kd2jGOd/HdJJjULrpZ0G+lhPf5s9hn1voHVjZmV3NyOaWKAdUJxG9NAHXCe9CHInQBST5yuRhdJbX4nbNHLQUAmo1Znu+fj4FRMPwkXro/V9pM5DChQ6Vf6D694zeFhlB5wbI+KCi3opHuFTYv49cI0TJhxtmJ1tzbLSlfe/Mwy6hGMi3GayGzJyNuqVDkcHD05Y8+aQmzQ+RpRoFsL+ol1d8e0Clfh+4jM3Yjeih9p3qtrZqB2gNyYFxOh00bQ5v8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh//W0V8+uHWczHfNZdUvtE6QE4dHEhnDnqvQ5y5x8A=;
 b=nwNq9LQb1KVkfvkAM9NhOH8yjYSboC7mns9osHYeq5GTBa64N5yIdb3yuj36u+Xapy74k829e7bKdd4fWyrlRrSpwWci6Y3zQ3Jp0wPg4DHgngrUjWABH32S2GvIeDmc09HyRI3OCO1Y8GOQLmMbV5lPJBzcQaEpCZmxzkmc+Rg=
Authentication-Results: konsulko.com; dkim=none (message not signed)
 header.d=none; konsulko.com; dmarc=none action=none header.from=synaptics.com; 
Received: from BN9PR03MB6058.namprd03.prod.outlook.com (2603:10b6:408:137::15)
 by BN8PR03MB4596.namprd03.prod.outlook.com (2603:10b6:408:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 09:39:56 +0000
Received: from BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::308b:9168:78:9791]) by BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::308b:9168:78:9791%4]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 09:39:56 +0000
Date: Mon, 31 May 2021 17:39:47 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt
 <palmerdabbelt@google.com>, Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH] riscv: alternative: fix typo in macro name
Message-ID: <20210531173947.06a79867@xhacker.debian>
In-Reply-To: <20210531093310.17848-1-vitaly.wool@konsulko.com>
References: <20210531093310.17848-1-vitaly.wool@konsulko.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To BN9PR03MB6058.namprd03.prod.outlook.com
 (2603:10b6:408:137::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR07CA0087.namprd07.prod.outlook.com (2603:10b6:a03:12b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Mon, 31 May 2021 09:39:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ca61125-1d98-4ab0-a7cf-08d924180c87
X-MS-TrafficTypeDiagnostic: BN8PR03MB4596:
X-Microsoft-Antispam-PRVS: <BN8PR03MB45962C3E77FF2FFAAF4025DBED3F9@BN8PR03MB4596.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxfFh6Nq+YTcMU8yjuIg/P2O6xS05fbnZtp23I7u3Qc3w1K1z2XbLBcWodxMWv5FXHrg0an3nQM9FdWpukm5Vgkl0uhlu2QuGBe182gOm4uCFqekAzFaY72Pr/6RDFoJwBSWEpIQ9f41CUH+xkXS0nBhG/mES7oBgt0k0U9qh5LccKLedZ8hYqr2a5XgY/r1Rx/iMsg8ZDHMFYNFe2LOAFeX7TlxzilYd492SsNtAtatMK34amCgQwthrFlMsqjC6sENJo8CowIPYa2bj2btv8B2BOnwPXoE/ICKJh0CagOz0PU3ME68W1+rRuKi/TaJLRjmoQNJ0rflFFkpFZNG8udcfV0Y+FLOVhizThy7qdrg1ZE53kZenjMj8BOQzicro0kYdiY7i2zH5molbn56krGlNzOoEwLrnzY+fXM0B3P9e6BeIpSJeghSKBRE+w5CBH8G2Rz8IUah998atgcqHca6DndbPEFzqjCp7MvETIMguA33uINH5CzhTZcYbnBf5A5rvud/eBmcg2Zu6LveK5dVP8t2zLO78NcB0zAbsceQEbHq9uamPYeH2jvG9EDuyIIIlskcCOV2IfTMdzTi2V8ynzkOQqGQBO4I3gEchUTObKaeLt1/tYWTxAfzC5fpxCkRK1T/RCinfiyoAqBtv/aPYdnAqkpldXM1uv2F+JryZV7mKA6onK9x6GWufMBjHwIp5lI8x4a64QWTkmQgHqAXzC66cZiCahVWTPD0IOoF5mGwE4yMzDvVsEVKJvF78n1NWxRL/pzY/3ycu67LTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6058.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39850400004)(376002)(136003)(6916009)(5660300002)(26005)(86362001)(478600001)(6666004)(966005)(6506007)(52116002)(7696005)(55016002)(16526019)(316002)(2906002)(9686003)(8676002)(38350700002)(8936002)(83380400001)(66946007)(66556008)(66476007)(956004)(4326008)(54906003)(186003)(1076003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8JmefPm9dBkUJoU74aY5n1tfxMzwwimXnf6wY34+BVTqWjZHcZYp0OU8tYvz?=
 =?us-ascii?Q?qzphBjdDOW4G9MXAbZE8dP6bpx0lhcNrPXnIYFfZmq0flPNpPb/n7yCjjtZC?=
 =?us-ascii?Q?yNaYmt87kovEt6s/XB0v9tMwpLPALhhuZVW8ONblj53g1hbUOk8LW3VKfmGp?=
 =?us-ascii?Q?b7bpvuA3NsSAqdxd3gnTUZSaiqx+OZ6vppcPqnNdDYnX9nJi9RV6Vu1zIzeg?=
 =?us-ascii?Q?M5+wOwb++b3U4LejoIUVVwb4LX/qRxl/TBhSpFXloFYVRs9K6uBZgIGkkTxI?=
 =?us-ascii?Q?B0YHwVMvPfDpWMiik+Sc4T7aGywXwf9ghvwDHVoXlPORPVcGSCf+XTdonxkP?=
 =?us-ascii?Q?TryCcnvdOptyNoJba2xX0/VZgMGpdpH+jD3xRasPESdWGMckHJCRlNf9zdSW?=
 =?us-ascii?Q?MUp0O+AyMfZ0+uBkBXWkRv0lmiMLr+VKB5JqbKdiznwfLMhPBdDeX17nPA4D?=
 =?us-ascii?Q?+w8lWcthRI+YaMpC34OXDpin133+fGv0DHrm2FZUR82UtudTrR6o4agfRGD1?=
 =?us-ascii?Q?hzNB1w6RIJnHFL/fc/h37iBeRrTnaUBpzVDLfAeTu0UHDSWHux/i+1RH/jzs?=
 =?us-ascii?Q?cjexDlDvGdnMvfUjCj7YZ6paEUl/vHBZFv6WNlDhF69zsyqSiSW+I9PBd1O0?=
 =?us-ascii?Q?6dOcyiTocBJvvxzkfSX16TKqbFkCkJ7wz2mLs/4t0KekLY4vBygfmogoblDM?=
 =?us-ascii?Q?mCBg96nR+tZoCY6C4OWODl6tObD2k3JvHegN2QEGV6h1SZIxMarwI0f/j/HG?=
 =?us-ascii?Q?iS4C5XBvrhe1z9uf5+MmAgvxO8gyl9WjJ8z8vujGuEjh/WjyqsFdov2DYp36?=
 =?us-ascii?Q?xCZbFC5Nn1dT5Ow7tmhcTiJ8s/frvPLc8cA2fsA2RCorgTlACSgZ51VNpdQN?=
 =?us-ascii?Q?vIOwfT+1tKBYFvymn0LX768BI+6YRTKMRjf56jIl5A1WDhped1ziKomXDUwP?=
 =?us-ascii?Q?Su4FSJpdbSdp4kc3lfCgd+DiqNkORmdEFCmQ13REuW7rN0XFKJofT6Y4D5W+?=
 =?us-ascii?Q?hSBqBRfhLUBIQcc/CzEMUoFFFwsNBFSymegDZSx+GpGvwWwTY3gn6O3s3Q7j?=
 =?us-ascii?Q?XJmBkbYUzcUVZ1VW7cgKazmfDLQPg6aYgVTnC0SKoR2WVi6SgOypHiyDJOXd?=
 =?us-ascii?Q?aOHnQIGpbFVvMxo9a4d633toOSWzb9yM4vOpLBdzBGgHGul5NMx4gvFbNUX2?=
 =?us-ascii?Q?J3QC4JqSa3qkwhB1O5GN8VapMpPfkpvF9lH6Ab7wy5vjP6beNx1z9eo2nR8t?=
 =?us-ascii?Q?upl/Ogmf+vb42bSNnbEuXqNgyXs51CqS11JZ1PjH2UkCVf2v/kCkgkdh6ede?=
 =?us-ascii?Q?FtVR8S27/tEAA5xjSsyR8J0a?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca61125-1d98-4ab0-a7cf-08d924180c87
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6058.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 09:39:56.0654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvM2G1hBO4zLFZPLVx+sM1e95VlFd0lUgf2EKSpf/wcnVgLrK2nQ7PDQmrBdtE7hAgCZUgJTicB7Bj1RkCt84Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_023958_407505_B0568517 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon, 31 May 2021 12:33:10 +0300
Vitaly Wool <vitaly.wool@konsulko.com> wrote:


> 
> 
> alternative-macros.h defines ALT_NEW_CONTENT in its assembly part
> and ALT_NEW_CONSTENT in the C part. Most likely it is the latter
> that is wrong.
> 
> Fixes: 6f4eea90465ad
>         (riscv: Introduce alternative mechanism to apply errata solution)

IIRC, the "Fixes" tag can exceed 72 chars limitation, does checkpatch.pl
report anything wrong if the two lines are combined into one line?


> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 88c08705f64a..67406c376389 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -51,7 +51,7 @@
>         REG_ASM " " newlen "\n" \
>         ".word " errata_id "\n"
> 
> -#define ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c) \
> +#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c) \
>         ".if " __stringify(enable) " == 1\n"                            \
>         ".pushsection .alternative, \"a\"\n"                            \
>         ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
> @@ -69,7 +69,7 @@
>         "886 :\n"       \
>         old_c "\n"      \
>         "887 :\n"       \
> -       ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c)
> +       ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
> 
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
>         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
> --
> 2.29.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Driscv&d=DwICAg&c=7dfBJ8cXbWjhc0BhImu8wQ&r=wlaKTGoVCDxOzHc2QUzpzGEf9oY3eidXlAe3OF1omvo&m=XpLbXG83zwtZs3uGGCdFOUHtgVGdsHL_-p1VdXjQIrs&s=9fAWECR0St-s9ShfmRXAMsyhAPbuZpSVEK4iD_rb35Y&e=


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
