Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7443DC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH5ZKuoGJoiVTIrD/DrVuY3/cYoNnsdVLvWbX3QPfs4=; b=pwRIjqNUZ61AYO
	t4bS7m4Jgf01ysVG1v6A1R7s57KwxNdwfYxfGYH5jbDl+jHACJenN1Qd3ARX5q0tamO3RNpmc6S4S
	8xHMzYiyPlvMj9IyGPrEBYipd4xsIqDKR6w6gCg2GnNp0Vpc9y5MbSn+R5hOUR7ipDCD8zgSMkb9y
	7U4utYv9CqcOYBXweKtLq3bR5FpSkz3yj9ojU3NgkV/DSCNRasUVcCPxfYpimvd5SrSGIX3hyZhvV
	hJ+rFWS7hVXe00JUgrk2yNh+3IV5sEEVsYXiDKtc6eMAuow/N9VgnskH956Zz2JEIGhXJPCJlIQA8
	F9iP1c+kn96T1wgfPINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9qvR-004gVs-LP; Fri, 08 Jul 2022 16:33:53 +0000
Received: from mail-dm6nam04on2139.outbound.protection.outlook.com ([40.107.102.139] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9qow-004dHA-Pn; Fri, 08 Jul 2022 16:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDU5SQPKgB89WXqesfrGocGCkPjtz0tfs2R8G2Zu7j97tl7JnyuZx9x3LOFNGZN+VozjvyuQafxwDYWlf7SMLGGO6EoKIg6Sgk/kLNGJ0i6YCyZ8ODmODm8KrXEetxc26abuRKOXVcI9CcYq5eJz4AGTdgFgV65C4YRgpgA64YKjg2jseN1n8RYP7q5Q8sxH8ZVlnlvV/BKf/1Bt5Bg4EducqECQtMH6Pg/Hc/R8LaNCDssSLzpywFPKTzXU2BR1qDh99TAzKhtL9GwHnecqL/Qb488XbdlvWlp9MrMXwvwdbq66jSks6h1bSGjLan78gGLEu5s5BzwOhOJJ/uzbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Goz98ACxgjA/YpN/K97UNeX8P4AA9ZmFh5ECtfE/RuI=;
 b=gxe8SuWMuL+o+JFFHK6HZV7DjBNTrjm2aV89SVXo0OnYWzM9sIrTv5govYQs74pKMVn0FJmranvUEJaLPbV8n4nt6lahNvc9QOH5ODgNKIaqqok0qiUIOQG7pb4l1LoVx0s8gleUDKT++taqcwUXTCXygM52M3810cHoR1JSpo0dwkplFlv9wp/z6UxRoDlia966kKKSNJFwFe6Yomn8+F6ytEthkC6s/3WioLTdce3aCuCT9443UD9Ou39UWkSDbHeG6AzuAb8kMowgeCugGcWjD+R9RXGlNk6q2v7XBIs+CEKY+y0aqLKjQGM2lbN3mJZOrLa1kcczB1YIiJqTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Goz98ACxgjA/YpN/K97UNeX8P4AA9ZmFh5ECtfE/RuI=;
 b=sI7ZrlBoVDcN+wbLRH9lqt9b2Rkna0Raoi1Rgz1kxf1IzFQm/kwYTl3kV4SJbfZdVqnxMYbC9i2+1R52KLZh25ZygC3tEeVdpagFa3xiuJO7bdneqOzU4ZmiNvXT/hELqGCn6wvSxm7KUXaLIsngOeOvNvBXT8rtAKmZL/BHAw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MWHPR01MB2638.prod.exchangelabs.com (2603:10b6:300:fe::18) by
 MN0PR01MB7756.prod.exchangelabs.com (2603:10b6:208:37f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 16:27:06 +0000
Received: from MWHPR01MB2638.prod.exchangelabs.com
 ([fe80::e1e5:b43e:c774:40d2]) by MWHPR01MB2638.prod.exchangelabs.com
 ([fe80::e1e5:b43e:c774:40d2%7]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 16:27:06 +0000
Date: Fri, 8 Jul 2022 09:27:04 -0700
From: Darren Hart <darren@os.amperecomputing.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 17/21] arch_topology: Limit span of
 cpu_clustergroup_mask()
Message-ID: <Ysha2AL60u8lb5zT@fedora>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <20220704101605.1318280-18-sudeep.holla@arm.com>
 <Ysd160PQdWoDIdRC@fedora>
 <20220708080424.22x2bgcbggb6skua@bogus>
Content-Disposition: inline
In-Reply-To: <20220708080424.22x2bgcbggb6skua@bogus>
X-ClientProxiedBy: CH2PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:610:4e::38) To MWHPR01MB2638.prod.exchangelabs.com
 (2603:10b6:300:fe::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c193c41f-1da7-40de-891c-08da60feb2e6
X-MS-TrafficTypeDiagnostic: MN0PR01MB7756:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iXeDRUV6+SHxIS8D39kQE7G1f72WXaO7NX1JgorvVVhezhuZzncO2YhCG6jECnIFIB7GJZq2Cfbsdq25Sjg3BqjuVuink6mlmaR6Q6Am0vVMdY6CZpblr33G0LB+s1YFLBrRN/yn08GLs6tsC23BgZGnVnMuKGb56GY0ke94sBGkfepelcgSEbSXwPcMcskFR4u1iAd2n5EaFdBZ4n67oque2xcen/RrkQLT/YLyS28+rqPIOcE4nCyIhqw031dq37Ls2JIZN4K8pscZU0hm5uQAlpa5OydAttXI82tafJZQzIS4d+gMtLw2XSXlUCCJqmfjO8ARD/cYAM7/zRk1fcWWdkj9hiI0sNTfYa6c0vm8VOqMzEg182qjBBWUX8JgbPVwJdts7ZptS00ox1zkKLJDSSKWc3qQOwsUQw2kljn/miG6r5eYrXZ2tqy/krY5k679aV7V5ftWEnLDiz+SlcmUeSRJNuELhECZZQLYaH4nZfyFfyVCe83XJ4QTAezjh3HsfJZxtPgFIT1lIj4TR3Q01wQSOJXCRXllvvr2URh7oq3s/wMlUbVDxftssTsA+5XB4pIkRvNbjNurlraNbBKqZ8pg0N3IRwnDMoXCVVHGid9PxkjffMP7eB9zabEb6d+6GqsCeQ5GKZQZSmuuRrLLq4kHK0Y7dWilbUrRDpFZ3XOquZe7R/61J2FKOKXE6MqfDowQzR36ewpHiP5AsKsOh6Cq47fyFqgsdE0rBhA9Yyi84Fd6Q4Y8yFAZnygstFKsXsoUfY1LXbthbDmwEgz75fB71oQDRd+K+pP/PfkOAFZqQOt5ZSHA59A9LJ3P
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR01MB2638.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(2906002)(186003)(41300700001)(6486002)(33716001)(38100700002)(6506007)(52116002)(478600001)(66476007)(66946007)(8676002)(26005)(54906003)(9686003)(8936002)(4326008)(66556008)(6512007)(6916009)(5660300002)(86362001)(7416002)(316002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wiAfxv7PoOgjtHEasuaG7k2remeYQcQlxlRblLSZ3cDPpnYXWOrtHD6Q2O9w?=
 =?us-ascii?Q?Qx45IilvpZEOhx1rajxlPYsgDoR+9RCUtGhqXiC80SZ+7d5QaNHAOAeoR+QI?=
 =?us-ascii?Q?7EW7ruUdwf2Wn8U/3fFR+XvET9q9Wmt5drnWiw4td3H5qhZmXIy2xbe/pnni?=
 =?us-ascii?Q?/fayz++Ca2o9+9PWFZLEu86uP8gD1En9BKfKMGsBPdxvbYy+dIaMqOdeEJOk?=
 =?us-ascii?Q?GyJZ25KKNE+8BfFlzqthSFOtu5+KJEI+Xd8aJEs+KpJlR7seO6fr9gVPl/tU?=
 =?us-ascii?Q?FRYrEgCeZkR9CRy8nLAspc0OeWoNE2o6fR9DF71nrNbXy6NKhP3ynUgL71kY?=
 =?us-ascii?Q?BFfy+3Al+QXMqe2Nx9nY33Z+/bAX7URozpvzWx7UKHWhckmwvmo6imQ30ISs?=
 =?us-ascii?Q?NKG/w/8wTYkPdanoAGdr6rHOhneKfQ2QC4OnKvzU8xkwO0NA5lGVqIBQqhV3?=
 =?us-ascii?Q?DfFP/oYn69e9bpvPpbig4Kev0wCsIswkMnR78SL3gEqsrrUP2yymF2D2+6/a?=
 =?us-ascii?Q?PYruTmkfyxZiflq8kAWd0RX6CCDnq3KJ/qJQD0z0djJbgZ0wKVKJ7x1M0ruW?=
 =?us-ascii?Q?bp48hFU0MK/rmBeTz6ZDawtH5/AM8T4WwYBApku8t5sVkHHxGc+D2Jmp7F9Y?=
 =?us-ascii?Q?iv4ic1ESAesdkb6n9SlYrBXHLr+mvu5P+FUPwkHEhk/OAYMVGkbCG0yV4tD5?=
 =?us-ascii?Q?+X0thG3kX4eJzIYa0XkjhfCecDl1BbDgaynI9Mg2S4LWh297YcOEJk6qbipw?=
 =?us-ascii?Q?OUVOZpA9bUvu5ud/sHTH2vrcKV02IWnX3MWxW4DRZKsWKFWJM9B1SkVx6PAU?=
 =?us-ascii?Q?lUVla91JQsytJvfKB51lsiPbMrfK6lpScX8fmA/QLpQH313P55BkuNmDeLLs?=
 =?us-ascii?Q?D6A4JeG56mN4P/k+Wfb/EdKGhDQSBTf0+N/vkvtjW/OK1Cm+/4WoO3/wknl8?=
 =?us-ascii?Q?ztDy+ese5BTbFoUPCyIgsn1WHJlmtjW/gryXZrXDVBlbP3cYWRLu6e988Rm9?=
 =?us-ascii?Q?LYeXKj6yW5LHxVtu5ELcT9mn7Mg92gb9Q22Idsyx+gck/IlVGOLboJFjZUU3?=
 =?us-ascii?Q?VEbbHS0WQMMMQwud/O9P/JEGgXb4ilL+BDP/6LjEZwPDXqCzQf2BQr3bNUPC?=
 =?us-ascii?Q?VY5K+ADmeMEUyFKNRtq+wDnuo7vo2FWNW+iGRhmnEnolr125JDvROMOHMhGQ?=
 =?us-ascii?Q?f90Bk4AFsnXG3Qo7TCwxJWHfKU096kavMEVoPkKGR6d2e9lfxreA2fr0U1zW?=
 =?us-ascii?Q?C2iBBNEi0M6bspRZlN/sSumqwQkRf9u40WpApkRUAIcXFGsLW6KcFQKDItpO?=
 =?us-ascii?Q?D9ommmivKmtiqGN8nhJMLphuvONXpSR5EeNjAnPwZo2PfF63Vk8jwiai6fuK?=
 =?us-ascii?Q?bTw4yXjPgJBgRJXiNeEwehOJc3AkkRXQRZACvVopxaaul0AYVE5kwqmNqNvU?=
 =?us-ascii?Q?JR3ihZAwXhYfF0eUQ0wVOgyVpEDMlDUgGY7ktMeJbJy+94QnGE9hBuQqWktL?=
 =?us-ascii?Q?FnU9u9euf9GvCeD5p8JlhxBW7n207rsdUNEg6FRYThRoUPmNdlezB3dQL3sQ?=
 =?us-ascii?Q?ZCkThnrlbwiN2+KdBBHqmLV375kFNfDNFwVmvp5yy5hY15cJuLtaSK6jDZQO?=
 =?us-ascii?Q?+hc2+VRPkK9wYQAjuIr7WHc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c193c41f-1da7-40de-891c-08da60feb2e6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR01MB2638.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 16:27:06.7790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evj1YJc0KlKvXqC56I3rGIZynQVNGDSetaJrp7AmtzpiDSNcFICrYqzMCvSRkRSAYzn/1Z47FCeDGIH0Xuw2hH7ZeY7+03XWGeArikjPDARCMNHdzrqLsVP1Wnah3vJA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_092710_893383_84A4ECE5 
X-CRM114-Status: GOOD (  38.01  )
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

On Fri, Jul 08, 2022 at 09:04:24AM +0100, Sudeep Holla wrote:
> Hi Darren,
> 
> I will let Ionela or Dietmar cover some of the scheduler aspects as
> I don't have much knowledge in that area.
> 
> On Thu, Jul 07, 2022 at 05:10:19PM -0700, Darren Hart wrote:
> > On Mon, Jul 04, 2022 at 11:16:01AM +0100, Sudeep Holla wrote:
> > > From: Ionela Voinescu <ionela.voinescu@arm.com>
> > 
> > Hi Sudeep and Ionela,
> > 
> > > 
> > > Currently the cluster identifier is not set on DT based platforms.
> > > The reset or default value is -1 for all the CPUs. Once we assign the
> > > cluster identifier values correctly, the cluster_sibling mask will be
> > > populated and returned by cpu_clustergroup_mask() to contribute in the
> > > creation of the CLS scheduling domain level, if SCHED_CLUSTER is
> > > enabled.
> > > 
> > > To avoid topologies that will result in questionable or incorrect
> > > scheduling domains, impose restrictions regarding the span of clusters,
> > 
> > Can you provide a specific example of a valid topology that results in
> > the wrong thing currently?
> >
> 
> As a simple example, Juno with 2 clusters and L2 for each cluster. IIUC
> MC is preferred instead of CLS and both MC and CLS domains are exact
> match.
> 
> > > 
> > > While previously the scheduling domain builder code would have removed MC
> > > as redundant and kept CLS if SCHED_CLUSTER was enabled and the
> > > cpu_coregroup_mask() and cpu_clustergroup_mask() spanned the same CPUs,
> > > now CLS will be removed and MC kept.
> > > 
> > 
> > This is not desireable for all systems, particular those which don't
> > have an L3 but do share other resources - such as the snoop filter in
> > the case of the Ampere Altra.

I was wrong here. This match also modifies the coregroup, the MC after
this patch is equivalent to the CLS before the patch. The Altra is not
negatively impacted here.

> > 
> > While not universally supported, we agreed in the discussion on the
> > above patch to allow systems to define clusters independently from the
> > L3 as an LLC since this is also independently defined in PPTT.
> >
> > Going back to my first comment - does this fix an existing system with a
> > valid topology? 
> 
> Yes as mentioned above Juno.
> 
> > It's not clear to me what that would look like. The Ampere Altra presents
> > a cluster level in PPTT because that is the desireable topology for the
> > system.
> 
> Absolutely wrong reason. It should present because the hardware is so,
> not because some OSPM desires something in someway. Sorry that's not how
> DT/ACPI is designed for. If 2 different OSPM desires different things, then
> one ACPI will not be sufficient.

Agree. I worded that badly. I should have said the Altra presents a PPTT
topology that accurately reflects the hardwere. There is no shared
cpu-side LLC, and there is an affinity between the DSU pairs which share
a snoop filter.

I do think the general assumption that MC shares a cpu-side LLC will
continue to present challenges to the Altra topology in terms of ongoing
to changes to the code. I don't have a good solution to that at the
moment, something I'll continue to think on.

> 
> > If it's not desirable for another system to have the cluster topology -
> > shouldn't it not present that layer to the kernel in the first place?
> 
> Absolutely 100% yes, it must present it if the hardware is designed so.
> No if or but.
> 
> -- 
> Regards,
> Sudeep

Thanks Sudeep,

-- 
Darren Hart
Ampere Computing / OS and Kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
