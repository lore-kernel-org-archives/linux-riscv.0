Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF7C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 07:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2B761208
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 07:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2B761208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wt6K+FLcJ+DbJElqpSSGIoPfAJ931xHVIVo/Avh+0hA=; b=iY/hVqot9nHxpl
	0IWi2xqWdKFoCcozrAwIHMdGiNN6pb7uVQDYW+QuYkVEtOQfTMpJxD+X+Z/09Uw0vkRqgvFGVUuef
	btBoSMM79SRWI6nKJDv5SpnBJKF10peCWn6VRWANZrSZTRNk5MTmqK76idwDX0fnXSHZyXNNSxoc4
	xkAgEjh6s/fnxROXgNNthZIfCv40y1tH6N1+Rt9towqc63+vibMkgQ9OVDx5+lHzr6M96rPhF5um4
	uGgd4GDBbyXi23kXBzc5HZuwnHcr7vdpCokeWCsTFTx7aJAdADOFuoBL/gaTtIxQKjKSEioWV6DYu
	HKAf+g47A7EcEwmQC6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWb7-006tKV-Mb; Tue, 08 Jun 2021 07:56:29 +0000
Received: from mail-dm6nam11on2057.outbound.protection.outlook.com
 ([40.107.223.57] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWb4-006tK3-Uz
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 07:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYRkNt/LgnvOzILyRBKuI3nkAMeeBRJ9KB+mzlCkRW0LYV88PsteaAfpW0UfAbqIalGyH52nETvFqZNsAy76qYC0Lo+C8SXr+2gVCqcEG24PHMEx9Db059htiGYwfboTto7yFEJRkxvwDggO7w7QTo0LaTJ4sRKQgJFs5edtNJAvhzFI5Q1tFH+Ac4v5SQSYdCqvWieMUIcEXdxTIvGTNfUotXHO5FI0MEk8vexclQxFa630XRpa6lBK+LMTsAOsoX50dZIDtAJnJtWxFvimX4NUzzFGCeoOV3QNIqzpC/uub7nPr08XUh2LBQ+a/8g1FxfKRiTftrKgjKyg1yZv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqDpTv1ra9bKJRsXSsuXtoJ2toYyb89FrMdSs5Y6Mko=;
 b=PImzVyoU68/VQ2tyypUfww2lbnP+/ZmLpEjvJj7541+SW71RGT/LXSFqQ9GpzNuVEshlmG7t8QKaslzu1/xIJXkJsvsm7n7zIRiMOUnA+ShDaWgSTk8XWhuSieXeLSOsXMbk2E8EyXvwtBSHtKxMMYchqsruz5vQ0QHX0p/DG0dnJRydcznS+qFtEf4OiRzS5/2bDXxUt2Nwo97ImEXZL+7KnX8KGJksjXB24b6+f3GQkmUxoZQZDr7+W/3NQHX1nT/JFWaDBLIVCjQIX0JkLZpr6BgoBS+bz2GHYAmxTZ50tqWDHvb5z1HSi9BEs2WigLH3PI4mvdFLp6ySnZCZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqDpTv1ra9bKJRsXSsuXtoJ2toYyb89FrMdSs5Y6Mko=;
 b=ZcRJDAsrEvoRe09vtgvtgaOZItrhFaxZ/vEFZD1Kdmf8q6EuHYfmyfO6wCMEYUv/1Xp0oB64MyO7SZbNe+xA87gu9ZlhlHcN2skrEhc6uA5IN5tT+9hy6HoG8+9onGiqOaXhjV5FdEna+LBLGDLpWbLZ7dcoXh+2H3PLq8UT3e4=
Authentication-Results: mail.ustc.edu.cn; dkim=none (message not signed)
 header.d=none;mail.ustc.edu.cn; dmarc=none action=none
 header.from=synaptics.com;
Received: from BN9PR03MB6058.namprd03.prod.outlook.com (2603:10b6:408:137::15)
 by BN3PR03MB2194.namprd03.prod.outlook.com (2a01:111:e400:7bba::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 07:56:23 +0000
Received: from BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::502a:5487:b3ee:f61c]) by BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::502a:5487:b3ee:f61c%4]) with mapi id 15.20.4219.021; Tue, 8 Jun 2021
 07:56:23 +0000
Date: Tue, 8 Jun 2021 15:56:09 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, Jisheng Zhang
 <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: fix typo in init.c
Message-ID: <20210608155609.27da406a@xhacker.debian>
In-Reply-To: <20210531081140.4e8b409e@xhacker>
References: <20210530132217.7851-1-vitaly.wool@konsulko.com>
 <20210531081140.4e8b409e@xhacker>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To BN9PR03MB6058.namprd03.prod.outlook.com
 (2603:10b6:408:137::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR13CA0179.namprd13.prod.outlook.com (2603:10b6:a03:2c7::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend
 Transport; Tue, 8 Jun 2021 07:56:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efb7f085-af58-4738-cb71-08d92a52e922
X-MS-TrafficTypeDiagnostic: BN3PR03MB2194:
X-Microsoft-Antispam-PRVS: <BN3PR03MB2194A75A80EEDDC9EA9D0514ED379@BN3PR03MB2194.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0sVGTXHf+NQzoSqify8wGDKAp9cHgnP7vnOm0G5oTcpuv4bXffUlh/TZo2U/D1twTlx7KUm/hpYZDyu49LzzWLy70NQi0bJqlZe1h8A5+foIxydX4wZWBVgJgM+YftpOvbd8kthBcq0i6ph3dBKHd+TPUzfJaVQ/jpmmpa7TcThPzfirv6RjwkrJNTAWK1woQh5mXiUQ4amlYywcOuN/iQLS+e7w6R1iRiFj8UDmmSUUvB1q6FylwbmIoTX+afd4Vs98us0gtR+7pC2RAV+7BZc7+gFfuGFSH5iMyBWvvsXZemXJLT0FOZKzXqDVkiuUgDeWcHYpBVXekYZyHycS5QG+fT3a4cORAiuwv9GYTgPc2HHOaWyNfJlTXGTCrfCppJb7MnM71nl0VPDlMqldtc5ZT1AQ7vGKcEsj8eP2duxpp6gnFgfwjKvadgqTteBil2k/BTt4tqVjQayTDaX+Cfk/wGmhJUie2PS0tbtU+m12kLuz113D3W8IHsXVHfiWX7xRvPToqrF5OE/u1Hb+BTckOLKWGIwuTsaRVysYXny6h5lDv6XKkSiNi9lZI3E8O9dtJq1JYk0NsQSqTiW9D827ZSH95+jaGyjBZnMenvsW23Kqc1fechApFVUd8KiZjm0Yl8l3W0x/okFnTi3AKwpvHfN3YJGiPJHDtpuv80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6058.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39850400004)(136003)(396003)(376002)(66476007)(5660300002)(9686003)(66556008)(55016002)(1076003)(956004)(38350700002)(2906002)(38100700002)(7696005)(6506007)(66946007)(8676002)(8936002)(54906003)(52116002)(186003)(6916009)(16526019)(6666004)(86362001)(316002)(478600001)(4326008)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LVW6QoZQn4MEaOH5xy4funq9yB6gYYn4lXkpSti9HJvuU9O0YSGYrSz9xXgP?=
 =?us-ascii?Q?S2BfevWhx8yaiqfft/KvZxco57rmUBqvnO5iicPs5p0SMyGKq7JQPegceNTE?=
 =?us-ascii?Q?S8UtsVwUpJNJV2KVFUXRde/+y9Nmd0fi0xSeFXHeQpoVEBdLiHgFnY0PsRPe?=
 =?us-ascii?Q?vYzao1KHVlJAK5KqhdN50GpD4dAuht1DsZ2BT+RRSeCw7/L3OIHkBf67c8bW?=
 =?us-ascii?Q?jmIpsS1xiQuZKa1e+mj3AVTjJxrX86ctWZ7vegEaVS7+l7yxz43s6D/2umCO?=
 =?us-ascii?Q?OFYONY3xjYHKCtkUkHHrCX8MY1KGgH5rIOKXgi+JVIEsF235ithwUrfhwzGi?=
 =?us-ascii?Q?WHVkWALkJSvK5HyhauljWDky3t54DY+y3EBqMQe0sJ9kKU6N61iXSetEvR77?=
 =?us-ascii?Q?a7Dc8d0IGAt1Ghk+m7DlrER2NakRscqlV0H0ehSt+TU5ovVRj5ExQdjCdBYJ?=
 =?us-ascii?Q?7yoSuluo7CZocyHfsFNq50B7bh0VO16q8tdP+KpU48SlL8ho5xzISQv+6m0p?=
 =?us-ascii?Q?Vtz7lrUa46tClvgFtnX3+wCwx1OY4J7uqYBs+pGLap6wp6tguEavWuwCBMy0?=
 =?us-ascii?Q?T+T6hari0lLyYlEfp82fNaz+E2s0Xka8LOs8pfXIHWhkA7s4Bo0TTOGp9BEJ?=
 =?us-ascii?Q?6g38HGwChlLdKMmn4eDKcSHW6rpjKbVvh2WQk6uEtq5XM+xoT5ANbV+p8iRX?=
 =?us-ascii?Q?mEDdhHM/dLprjmNKqBW3Fc3eXsbSwV50nolsd0deabWW/3j39ZNEc8RN9lzO?=
 =?us-ascii?Q?YkTLC/7jUmQ3WXOLN2ndne0lh53o0astjFjMKMPfLsBZKGzwv6RnrfzgDnMN?=
 =?us-ascii?Q?A4Ze+Z+z87K00pG1tOJ/lohWdSKkPK0s14GOfl9AsmqSsE6bjg7AmuS+KHta?=
 =?us-ascii?Q?aus/kDyllkWQv+t52IilnOEK5UICMeUcZaXRqxNAmtGKYCzylrDoxB8Lfyc/?=
 =?us-ascii?Q?lIFoTSQk1NiuNgPEmuALAj9Nig6dCrWUOkN/ljuEIkGVVHDMw0K7zmyKyMTU?=
 =?us-ascii?Q?uBw7tTlzBrGbSep7/viGASOiWOYFBGDuKcug450EDGFtGMay635czAoxLO74?=
 =?us-ascii?Q?eWtggGmmvPLGMFeMmV0dzpmxO0I9ZpYU4/WPhed6Gc+YcBV86Ylv+bLf7f27?=
 =?us-ascii?Q?PbvHQpr5NWIl407GCH2YpVr5QXZmDD6AmFNjtgMy4pqlHhLwGOKEciOCsbhW?=
 =?us-ascii?Q?weYkp+anrnAuElyRmmZ7oeE2/c6zHo0bJfLAsjlCJtAKzXT8NdRl5NkSD2yu?=
 =?us-ascii?Q?ckNwRLBHXuP8kgB/piZcKzEE9N3jbOC0VgYa1ngVlayxfTNheCkJp1A/0hmz?=
 =?us-ascii?Q?2qc2UZMzWEA6DSOI9jpTvNhT?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb7f085-af58-4738-cb71-08d92a52e922
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6058.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 07:56:23.7329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJXtdtXMJKZzRp6YJ0mZWM85+Y+HokiKvwC98h/WQGTC18vTH/2Z5evKbrjIlwibi4Y4mx4ONzymH1hAVOVsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_005627_029875_25C8BCBF 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, 31 May 2021 08:11:40 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> 
> 
> On Sun, 30 May 2021 16:22:17 +0300
> Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> 
> > Commit 010623568222 introduced a typo in "__initdata" spelling
> > which led to build breakage for XIP. Fix that.  
> 
> oops, nice catch! Sorry for that.
> 
> >
> > Fixes: 010623568222bd144eb73aa9f3b46c79b63d7676  
> 
> This "Fixes" tag seems not correct.Should be
> Fixes: 010623568222 ("riscv: mm: init: Consolidate vars, functions")

Hi Vitaly,

Could you plz send a v2 for this?

Regards

> 
> After this change,
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > ---
> >  arch/riscv/mm/init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index ae32f78207f0..e7b136abf90c 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -451,7 +451,7 @@ static uintptr_t load_sz __initdata;
> >  #endif
> >
> >  #ifdef CONFIG_XIP_KERNEL
> > -static uintptr_t xiprom __inidata;
> > +static uintptr_t xiprom __initdata;
> >  static uintptr_t xiprom_sz __initdata;
> >  #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
> >  #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))  
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
