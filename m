Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A34BC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 12:49:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39AB61919
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 12:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39AB61919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zu7SleuM2AuyWuEe7nXwRAoaLPfL4TtZ/2jph/MatRA=; b=BJGgbjqDR1DROSCyYhIqNcpER
	RCuGMIFqvhktQv7GoDfrzPGFeAEt4AqDMrnuBWZBjfm3wRSCEuwcaUqUltMdfYnG6onTiP74DwVWq
	3CWX6Taa8pXa3+6wzm5pNvSJk/wGO0+5vxbekReP7A3OgvQR+f4n23XcAnqa5i8NFg/NGBkjy8+Wa
	5uM6w766Myu0Rdk3vpnolkTfMRqnBp1N2sA/7+FpG5aJ0yKlq9MeNLFlHbPTO7uDPrrURPYFM37Vl
	iuFoVCWUyM6UAi9A4WmMMeedou6+dofY2rp6LKwi8f3z1xkDDPT1/yCH72amD60U7t2BSSl9hMpuD
	4m1VabaTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRpB-00HTw7-3L; Tue, 11 May 2021 12:49:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgPLn-00Gqq7-W5
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 10:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=chlbYSkEyGfSMsw2T1wWqUMRpPcFjcYHQqYiGyfLowA=; b=Cboqpv2wS5SLo2VzEKMuzqKSaj
 BYQeLEns/cs0ns2WsFewtcWKQFaYzWEEPMd/N0rhx9U4+R7kwa0Wj4Mf/EVXjCdJ4oxEWkrFDbw33
 PpjHJx0YCvCyx1u7pH0ZFZi7Y3oSuhCoxE/gPr7EXUQfBedVIGAujqcf9jtdOyH6srF621rRXnVnv
 AhL/IH8P6jOfm1WZYs916TiAr+7St+/wfZSqKF6UNE2XquhVTEdq0woqUixSBdpsxPf73FkqBIhNP
 V2UVTIEHOifCOjLtBroAMNqUqwziG6OWhGllsljOzyHjjLi90dQtC64GwxF3w0qkZDFn+kfssOGkv
 1iNkyHPg==;
Received: from mail-eopbgr750082.outbound.protection.outlook.com
 ([40.107.75.82] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgPLj-009ShY-FD
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 10:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gw/RL3xf41y5GwbnYBXy1pTmtQy9tWKxG13IiBoFkrQccESKs1BxRZShef8mzl6GiBe8yNhLXdU/3hMoKidD5WHS1BHWPruki+QNHn7YW/P697QxH3pVHtqMmJhgBgpAmUZEZT6qChx0cwIrv/39xd9GULHDS3N4MKKLBjMYfXkOZRyfD4I5SYM75MDdBWKX/Doclu42UWC4mfyc8rJX71yshU/KBRSSu8DWeQFgQdOuiIVMsC83kgUGaXrmMve3hSAnwmeVDGV7Cw1s60WSzbWi/QZI6cnT/r8s+49lBxd/z1QLOZHuXa1sQhIWTMNKPEyxJz2Xb2kHs9RUv308+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chlbYSkEyGfSMsw2T1wWqUMRpPcFjcYHQqYiGyfLowA=;
 b=Y6REGxI2m0jaq+GaLALzt/YNdXIKPjLcc+Vy4mIIgI/BukjlT/KKR6sxiaYdj7UKbcnGRGjvQQN0XAdQzwXASWWvV760gK9clLgJDvIXd9wCdAmNnubJ8KW3UETjLUvk8z7s7KguzRdTKUdtIpwX/h5IBgN80bJmRDF8SmlN3LLQwvqXei2e+CIgG7eUMEY6G/CVRDmoXzTzhFZ/dNgZNC5OZOc+lq9VYhQZwQWq2T+KrQom4mLi/1/RUYH5ZjPb5u5eqC2vuNJTt4S1UuIDVFkVHycnOcyxsROX1BTpkGDf6SZbAkR/ymuebBLKN5nOiLHC0otnKWJao/qzi8C6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chlbYSkEyGfSMsw2T1wWqUMRpPcFjcYHQqYiGyfLowA=;
 b=BodOTX+4Q0uF4S0nEXYTqIXWhb7uUIsjvKB3oIN5mxuc+A9h32XdT9RZQ/hvFFrWKb8qnxZiBo65kdQTtOJQbvUdL+92lqRzGjTXKDK7xDHGmV42HNAG3BIY+9FWMutXAhgDqYFregFsQ4sQUDft+X3X0OYbbG+UAPpz/kgl3+U=
Authentication-Results: konsulko.com; dkim=none (message not signed)
 header.d=none; konsulko.com; dmarc=none action=none header.from=synaptics.com; 
Received: from BN9PR03MB6058.namprd03.prod.outlook.com (2603:10b6:408:137::15)
 by BN9PR03MB6140.namprd03.prod.outlook.com (2603:10b6:408:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31; Tue, 11 May
 2021 10:10:43 +0000
Received: from BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::308b:9168:78:9791]) by BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::308b:9168:78:9791%4]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 10:10:43 +0000
Date: Tue, 11 May 2021 18:10:33 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: code patching only works on !XIP_KERNEL
Message-ID: <20210511181033.580c1eba@xhacker.debian>
In-Reply-To: <CAM4kBBJqF=AxTu50PF=EshLSyqn0=yeC2dwf4JJj_Grsi_Tccg@mail.gmail.com>
References: <20210511002838.7b3cb1e7@xhacker>
 <CAM4kBBJqF=AxTu50PF=EshLSyqn0=yeC2dwf4JJj_Grsi_Tccg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::48) To BN9PR03MB6058.namprd03.prod.outlook.com
 (2603:10b6:408:137::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR07CA0035.namprd07.prod.outlook.com (2603:10b6:a02:bc::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 10:10:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0794d99-d938-46f9-67bb-08d914650966
X-MS-TrafficTypeDiagnostic: BN9PR03MB6140:
X-Microsoft-Antispam-PRVS: <BN9PR03MB6140DB6712221F0F6D0854CAED539@BN9PR03MB6140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrjntnvAMncP0lT+wGqzDQFlYhhbPjmEDobQovAMiR/x/rASUC/AK56IGUqbPV7c4JYSp1iyLcDdtSdwZrUUe5TthTxT7k2JIQPs2zSrrSYYzXsl1dRKOG7MXpIUQ6vuUsbeJGyLb/FpsBBCUZDCcyj1+qcOr5wWkJYe5ZCuC9OKyEwO21QT8j/WqIMONSKpPddRS0t6vgqQYiIQWgVNXpN+yhIQhyOzFBooteDxVYuqGR6Wx/aH2p8dF+cW3mWQFvdQAtKFiSU/3sqldyHDbhF0Xvwpw/ioVehVk+5rArSq3V+9n0oSn2URZ6QsQfT8dLVNyS/w+KBvYQsUXRHg42T3pDnut8w+3eLrs2zlZC9SxL9vDKzDnlenTaExl7muRGoL4dZDtJFHCY9i2PF9SjHWDFTbYXtNB2lRfqerPslxE0EolsgHM+JrXcOdt1c15STZaiaHOOQLqy+2aDwU+2NLJXXNnqkAYqFSa55mzvgC/M3CXspAEXRRmHraBogcDvO7VVt1ts6d6dNReMRaEvZ9zxJ34Jo6uvdCbsTfnWpZLssQQvrQU00TUpUwoCDcNWKy15eV39mq18EXW1Eebgc8/fmOBtkserR8Oj1bhYjhY/72hNQTdocaXbLOo5SelrcBtZ1dfzp0wpyIEkPQQBtOG13pTn0a6oSVkaNqzj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6058.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(39840400004)(366004)(376002)(396003)(956004)(9686003)(7696005)(53546011)(6506007)(83380400001)(38100700002)(55016002)(2906002)(38350700002)(52116002)(316002)(26005)(66556008)(4326008)(478600001)(66476007)(6666004)(66946007)(86362001)(1076003)(8676002)(186003)(54906003)(16526019)(5660300002)(6916009)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jnHjzx3kBXGCvn4k0R3absuASyZm2VzDbELGkgOOgsWkuaXkNY2UEKUXcjon?=
 =?us-ascii?Q?mVGzfrXGxycbxetSgmn24sYX7MxcCZNdW+JHXLpz+8pJHgBYrwdyqgxg6slN?=
 =?us-ascii?Q?CxNKhXn9aw/nQ33WSGYs/3cRJhYDFgUcGqMb157w1Eh67+dzkswKHU3iTEND?=
 =?us-ascii?Q?acoE0iQY7MiIUVfrLbad1frjFFfxOJ4uV6LmbkEX7DyqlQg2itNesVpSdXH2?=
 =?us-ascii?Q?FdiDkUhJ5ABJydetSPuGN1urLJJ9ojL9N5UeP4G14FAHpMaouUiJgHkyegs1?=
 =?us-ascii?Q?2+Vagv5dvyr8uKY0VdIv9+ehi95aDL/JZnAvFw2iPUcH8bUv3pIb+rKkSMa5?=
 =?us-ascii?Q?+MygFRmeWn1WE/KRdriy9C19jcspmLUUY7C6ofB2eesU/FBx28VMRQLxwDIK?=
 =?us-ascii?Q?loeM9OiMk9euJZeeP/kgwH9Jdik0mdsnAil32Uml3vy5fYUxxC12QBPlvKVf?=
 =?us-ascii?Q?BkBskt5AoscdG+jZ+86RVjartCDLIA5akQthL9fQW9cjmsn3u968tjpFkcWV?=
 =?us-ascii?Q?nOIQSTNPPnAm58QaSmQNWmJnyjtv6Sa6JlQIWAWOvb/D9Vk/ke0SIOdyBh3W?=
 =?us-ascii?Q?Bce/tnVz6p3Yz2fWeNO+15TEB3c/Zm09seeHWOc3+ZeGWY3gnWifMv/FkUCs?=
 =?us-ascii?Q?XECwJCbrN1o+d2LxX8ONwUMiTaIkPeG2vlnvzESSHn19M3sTYX747+yomJZ5?=
 =?us-ascii?Q?maEAVrlZR1rYZzTifNe6XUc68s6GDG0F9YLDwbcuQym1C6jfd9dsxZa+QvPX?=
 =?us-ascii?Q?SoRP8MsgY5VRySxB7ZgDkkxzRRz22kBkaTgxoqdr3fiBpW1Vgeh4+V4GkMNT?=
 =?us-ascii?Q?OE+kdsRcHEdQOYxPpYbh5KOdU8Nibj99z2Dq1SUHHWnhzNtgmh8/vGTaxdEX?=
 =?us-ascii?Q?AYvQsJKJqn8XohHg854U/k00vd5oHAB4tq60WhNaT5S2lnvLW7TwWxIfP53G?=
 =?us-ascii?Q?hdkQo5NfTvD/PSq9YR+1dkKtStDzaivBeNRxYMSpg90Iph449536VrbomM+N?=
 =?us-ascii?Q?fJ5L3LpP+bV5AjuuExiiucTTGsSJZy+jgGgMF/s1zdrN7s9HLJTS816pGK/F?=
 =?us-ascii?Q?gVIYwuntG/dAwj4vgpPiaDPJ1lTLhIl4S4RE3y/6prIpIjEOx5U4e7COD6Qb?=
 =?us-ascii?Q?PQ2hGVi7ysSd7vsm4P2JIwRQaA9TyVSz8E/mQvt0f/gVvw0jk1TI/h3rDNbF?=
 =?us-ascii?Q?fbRCmU75/mTUmlno/hWXN2lbSsImeNnEsca90nrk6lz37kz5Oh/G985WTn8u?=
 =?us-ascii?Q?My7O8p2q4bIpfgk3vq1SCGGirvyei0QmA3LHOrGu1PgFKiENsl21Yu7fsYLe?=
 =?us-ascii?Q?o4buLId5v76LX2h2AcR5gLPw?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0794d99-d938-46f9-67bb-08d914650966
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6058.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 10:10:43.2560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aRagtcTEQao9gxBFMoWg92CNaGbGgAfeAJn0vwJV10uG5Hf3qFx3QzQp82myOmAPEqWFrcTkBmrIRak5OCTFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_031047_591763_42B3C01B 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, 10 May 2021 20:19:30 +0200 Vitaly Wool <vitaly.wool@konsulko.com> wrote:


> 
> 
> On Mon, May 10, 2021 at 6:35 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> >
> > From: Jisheng Zhang <jszhang@kernel.org>
> >
> > Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
> > KGDB can only work on !XIP_KERNEL. Add dependencies for these features
> > that rely on code patching.  
> 
> Since we can define extra RW sections to place some tiny code bits in

I knew this discussion on maillist recently, that's the
reason why ERRATA_ALTERNATIVE related part isn't touched

> RAM, I would suggest that you hold back this patch for a while.
> I am not going to support the idea of e. g. compiling KGDB support
> into a XIP kernel, but disabling the whole HAVE_ARCH_JUMP_LABEL is
> hardly the way to go.
> 

I'm not sure whether the solution "extra RW sections to place some tiny code
bits" can work for JUMP_LABEL or not. But obviously, in JUMP_LABEL users
such as static keys, the patching is taken on the .text section unless
patching the common implementation kernel/jump_label.c. IMHO it's impossible.

However, I can hold back this patch for a while as you suggested.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
