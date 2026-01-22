Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE00CD3EE74
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhHRuW5twsQpd7MrkAR5oObMNlQXjz+IS3IP7U0CSrg=; b=HQmJqoc08fy496
	X3eeNNcOuXz+kyOC+DEP3hVhJgNR/MqAm+2kDQAYmlY0VYdAfqA0Pfx733iBcENohQ68Qrtm/cPci
	oRr1Lo9a4q9St6Sqj7hweBRi/SsxBNQNeO8HsHzYCQojC7XmIoRQUh63/kuO78LfkiDc6oGilEkyM
	bmFusjZWYS0wsHQ68IzMw3QniE471gQRkhLYGFb4m4u30Ej9sShtcWUvmj4HLZbSmxC1Svn9i1nZ5
	zaNmKkbJkYgqECoosCbXH1tWB9ZMUtpsEuEvZq4tQ+yX9eSFhafK6MNKDdMd0HK/GSG7hnLyEKUfD
	SoVTYLa5PbN/uCJnlw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwev-00000007LMb-3Bdh;
	Thu, 22 Jan 2026 15:31:45 +0000
Received: from mail-centralusazon11010032.outbound.protection.outlook.com ([52.101.61.32] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwes-00000007LLT-1p9r
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 15:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAWWM7xiaCzawsPIZAB0bCB0cvMc8AfhsHHNRH5HHWbXxx4SP1FeM+yTUHHhfAjA2b5ubeHtrWjLyo7wV9pV6qnOr8g1YedThAjnqJX58zhu8WqVK/SRnbf3/6Mvqpa3+M/44mMCPB28bW3tJ4e15txbwPrH8tlMN5ciwkLZI4sXlVp0XBTVYf9Kw93yQqLF4OdRxGjcd3xSIJQNleCe5tD3ExPZLsWRbADlTbGU8Vc1kO/ZGQbzDC1VdXzgRG/2DHIj6QZ5vSzLcBFgIMKux1Sad/yTOlpGDuObpGnr6PnbFbm9sK2aJmkOgs6ZE00QWEgUcxskhPiTxYdzdSolrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pEk2sai9C44hkv2b+3leqH1g7YoEpzQEbY0FBYHFfg=;
 b=VzM0sc1KFgo37i8wd04G8mQ+ZseapYP4xFontbVVKd+dW7Aa5rOD2PgOVc0FOBqvWtAMcY6XvUMqcuSLu2hLV+4UrJGCTB9ly+pP1h4uBVE/1/S0xZThyYE8QzrS5ntiYKfngEynkfHkJ46Ae22MjQPrHFnLJ9DMhMmh3mlRC9/wWa6ZGowbwDQowI3iDUleMKJdUB4gnvl8zFyZrcvvDgVmNIem7dHUKo0YKDhpsanng9WSVKkpXsoPFW3gaJXJPbGS8flODw/apNfnBb1Uhxmtg6ps4DRDR1zfRS75vKx+64pvdfaVXdVn9f3o/CfdoUL/xcdOT6+jMhvVt1Tdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pEk2sai9C44hkv2b+3leqH1g7YoEpzQEbY0FBYHFfg=;
 b=AKYz8+16m81+jwK0aYOrJIVCbwLen9nCID2oqEczZVkHCSnwrHBHXtrQumfNScFUVGe9Zw/+3nlLA1gcOEEzsrNZt07PLWW5T2DiPrDK1bFfoyQvmk5fK77iEukqgPogE6LIMw3XgG6lSUSW7+XS6slee7BPrDloTKGSLvZm8JEoZUauIdjmnMURDiZ1weDPWLQzf/VTqtdXfeSRnIxAzt+tSdyjbBRWXnGexAJ3c8weR3ACPUcyJf/83HVVGEFuKp7U6yifO125lzzSaiYivSeYo8G/HL5EicSBMJYV7QzNwkXJo3/8b9OTWGFczQ+fO+EVEgtMGL3Pu6c0p8Ea4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 15:31:35 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 15:31:35 +0000
Date: Thu, 22 Jan 2026 11:31:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>, lihangjing@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>, patches@lists.linux.dev,
	xieyongji@bytedance.com
Subject: Re: [PATCH v2 0/5] Convert riscv to use the generic iommu page table
Message-ID: <20260122153134.GO1134360@nvidia.com>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CABvJ_xiUK9BqUJS9-Sk1sS4vhVhyXN8P8NooZ0t_Zp7ycG0bAw@mail.gmail.com>
X-ClientProxiedBy: BL1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 885c674b-4c01-4a0d-0846-08de59cb5403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?icf2Kl9Udm8Lzst60Fl9IIn+3CBnNxtE7QtqKDqp4pCEXEiyUqaGefKVx1IU?=
 =?us-ascii?Q?MyLmZQHGftRWFJ4NOuSCV7AjJUlYSfnbGOder4tuspiziW1ii5bOgYm2etN7?=
 =?us-ascii?Q?nTYAlv943eik+EY+0fX22IxSyfk/5oBt26jBb+fhq8aQfZ9J4iNu/EEwlPGz?=
 =?us-ascii?Q?n5Mv8KaTTVrH6nKfZFn9UZNK9kFXeUmmp9IN3hSB43VQeNHJX0JRO6yrr379?=
 =?us-ascii?Q?hTiX/NnXHDkCHIaesL9iO68UcXhmY2kPpvBcB3QZqK8mjQJWcMGvXn59hG27?=
 =?us-ascii?Q?DhwY98n/c+sP7WfM9inzKVTxH2xTwo+F4BJBlrj6vUdhEoJDEEZgIOiqhiTQ?=
 =?us-ascii?Q?KUEVUnrL2Fi79GtFY1xfQiLvJG2gZzPYNF07jKx6fBW14FyFWUDpfUnQ0fau?=
 =?us-ascii?Q?PVGw73d31BIAzv6PiksCs8cQGXMz1Zc/4mm9oBSeBU4Y2MMi7jJUTLNNNa83?=
 =?us-ascii?Q?pOu/2vzPf1oo87GEMgKTmgEDnAUN9zq2xIZUI0MV1fVpGr3YnXQLcl1EvPZ8?=
 =?us-ascii?Q?//utLpFLPjZHAigJx97Yfy3XhqryBt9sCGJAiP0nbVPDc20aI8QgUsJ+lBss?=
 =?us-ascii?Q?g4teMPfe0E6ui1PBsuK1ycUbdB0hSksGM0PvokuqrcuRv0KuKe5emXIC3Q3h?=
 =?us-ascii?Q?ywIGa0b1KoViC6xOTAbb8w50Ha/42FzhVMfKY0Y+xxmYGUKhtFCpzGY+2hJ5?=
 =?us-ascii?Q?FG8F7x1iKPWgKobTCbZVKy1CzGkDAkoW48DwxYsS312hBrTA3bbFXO5Dfg4O?=
 =?us-ascii?Q?FXLDW/LigZUAv3fu8hXJowT4Yym9PS9EZQ5pk0kLYkRo0vg068bQdzH8lX6Y?=
 =?us-ascii?Q?05LUM4hmEEb9hrf7Y1F6WdaVJBlCPxDJ6vpePgElKMxu5wu+587b5COVDI5x?=
 =?us-ascii?Q?1U3euGt1xfQKv/7SXGA/A3B3WFfo4t13SCsu1Cs640hzTZmaQPY9EVF1Ysr2?=
 =?us-ascii?Q?IindSgRX/RnljMc4a2yFujdAC2RSHtIbps8nJZiiLeir8to+Wl7unq8FvuGm?=
 =?us-ascii?Q?DmFTlP/A2hUztNyV1s/fXnOvdVRuBUUr0syNS3yMhueLxweHZZGwQelBp/ad?=
 =?us-ascii?Q?w39qy9DyzyKaEBsvAA2NEEz2nMkyLXispxA0ENafmVlg7gtoSUQhVDhjis8i?=
 =?us-ascii?Q?Ruz+4f0/dFtD60PBqUBCPv5qBH+3SRRbWXCFWm/jr130xOzRarqGBnKcmuzm?=
 =?us-ascii?Q?g8EmAdZohuA723b/aECca8sn+UJTGpfHmWAkbtcABrS5fOn9JW7ZWNtax0jY?=
 =?us-ascii?Q?5/VdVZIXl1UgfsqaM1pe4aqzyKvdhEZ0n7OYOfdBvkl64B1i0VO6NkAg0dQh?=
 =?us-ascii?Q?Ho7DlOD7REezvlx8rEYHqDCMx9d3N2ynXEesB4HbF/QVyYBGtfNuCkncDpB1?=
 =?us-ascii?Q?oVP0fKZpW7I2cfkVV3lZ2dqnH9ZeOc/OoOQKrIadMcAgv2WltO7zyHhVa0wP?=
 =?us-ascii?Q?qsWa7le2VVTdA7LhEvHt49sDStm5/XwSH93YoPuyNWIQsYpJQ+2LC9RQAeF4?=
 =?us-ascii?Q?uoSDjB/Oqd3Pn/K9SNUm1YDeQeHo9XAE5ylm83384xLH0Uh+aE9ERnipiwMY?=
 =?us-ascii?Q?i8mAONCvdpALo0ZMRCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RtHlPVxjA3aVonGhWpHuymdHf0ZypcEGG4XXAwAKcS3mH4DCjOloNYQIzP3N?=
 =?us-ascii?Q?n7iI23jVPfcA+trAOZdrTzQTbykl18u2Hf79KdRWznU4A+TTbphJXx3HMIvL?=
 =?us-ascii?Q?mCYsdeCRxNa5apUkNce1O3JAESoMPnOPiDM4VnuaS3zWiMG7Ap0wBAl4Vje1?=
 =?us-ascii?Q?gHTpWSm6IQPhugwdV2GT4u5ptiIPDGiJabmOv+bcoFTSM0H3jsHTE3WDkZNe?=
 =?us-ascii?Q?ug1SKZE3QJJEsGgyU3Xww+yVRJ5T/nUwjF86J2b2AnGC7hAm6kBJ4eyZlrII?=
 =?us-ascii?Q?2sXPu54wPL/5rVcK33Cth3PqOZbGLoTzU/g3ofIu28GAzwxepTSq8XkNhCd2?=
 =?us-ascii?Q?V41bnYf592M/o9BDDY2DNcnoMkRPLcztSfRHkzd6LxgfvEvK61DnxVk0tDVt?=
 =?us-ascii?Q?myTW8WDwGwdLSNPBhXx2cL7kApd+fo2Ytfn7YzIyN+jYsduzF52Wfx43rgjt?=
 =?us-ascii?Q?W3tftIMsxYv9em/OsokFUsvWwz438LFx898MWfrHhHDlB0gEmPjwzeYMRd2E?=
 =?us-ascii?Q?C3XVtNx71l5ALoo77SI/vT49OQXqTRHLniUqFeltqSc4yYoWMQZKDCop4bEG?=
 =?us-ascii?Q?WD/gmaUTAxQ5IiS87m4OZFcX58unnI0/zNt84TLrohseb9ZjJkgT9hMZ8tv4?=
 =?us-ascii?Q?QDhhG35Y4h+Ima/k9yKRMMwOYlCr9Cg8ClRd+EXQT9aBpY2xf00g9UILpiX8?=
 =?us-ascii?Q?sqfUW25RUIqAbZO7tyPA7shEsvP4LE26/sHZ0ZBN2vJfuxfqn46QJWUvp00C?=
 =?us-ascii?Q?dhD3Sz82rlX8dQXyU8UeAlY8A2oXVV+9tUA6vAyBLpPooO27eJC07ayet5Vk?=
 =?us-ascii?Q?DLpgrOGDOeKfkbUp1h3oU61Df9zss2G9x1i7Upsi5YuIJzCIcosbON7kPjf0?=
 =?us-ascii?Q?DhqEXeRVeR71tsYYIBUrD0pN37PtQbp+NWucTjVbfRjv0uE0SNlPgVQRZMK9?=
 =?us-ascii?Q?qle5coXRdEyhk47mb0dGFaCD/ql89bbKd4WBBx0AFbXCLcd+zC3cqUZefun4?=
 =?us-ascii?Q?BVkAitkG6Hblr/A3UepphwRvs8WBBS+eB8jH3kWZTTelOah9MjfZja9xRBBM?=
 =?us-ascii?Q?UPXJaZSGvlGQvVLd8dc5Fq3K9/PfbsquMog2CE4n4YDAX1zhkEKhP73yOyBC?=
 =?us-ascii?Q?iOiyM49x5dnFR1RpdTMXh6Q0TUSqiW2pN5e2Btu7HeiB0PwHMB+st6NqlIwf?=
 =?us-ascii?Q?HcNpq0yDROn24d2jYxVKH/7QkB718a2HYYL7U2PzPAUMGhT4YxAgYHa2SgJE?=
 =?us-ascii?Q?MGwskZz9Cmoc0Gy9g6dtqFNgJu1qlHCJ0VUO3Ek4IwEFCudz53nbzpiYKdrQ?=
 =?us-ascii?Q?KLyoPLo4+tsRBPUGVEyTKRLnVYZ+6MisLKUUWxOnt6ebo127zyn6cDYOCen4?=
 =?us-ascii?Q?f5kbfizkmwZJMSw02ibprUC6waIiNpFBTMHoTleF71zl9H9JR+yuVAR5GRs9?=
 =?us-ascii?Q?LescFCnw7jhdIu4GnpqHP5ef9w+yhYxsg3R8rbzkBfyhfvIVUx2vnRc/W62x?=
 =?us-ascii?Q?FmlYZe2s898zBIo0dIx5Njx65VqPT9iuQsrhg4v9U0jeho2j4qZ45nlb1XP6?=
 =?us-ascii?Q?fyS/i27tGUNHk0tWUXuMIDAM9NMPpFNe/X/E/YuEH9os6woG92sYWY2bYsoz?=
 =?us-ascii?Q?fTo3X52JeNxDVUbhEESgI5IFhB934uip6I3liH0D7UNrVQA6goC7C2v0czKx?=
 =?us-ascii?Q?JKjw+JOwEwfPZyApO0cefQfRh//xt8A0F+0IeYlvyvjgvMOBOk2eLWdgN+Lh?=
 =?us-ascii?Q?kppF2y8tvA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885c674b-4c01-4a0d-0846-08de59cb5403
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:31:35.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0TfzOMWL4nji3xphH8x+wTTX7489Y3MP4mOrudC7ucskjKzQqSqAcPUWzRoDQLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_073142_476390_49FE0C78 
X-CRM114-Status: GOOD (  11.80  )
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

On Thu, Jan 22, 2026 at 09:46:47AM +0800, Vincent Chen wrote:
> Hi Jason,
> 
> I tested this patch set on my side with the QEMU-virt machine.
> I used the following QEMU command for testing:
> 
>   $QEMU/qemu-system-riscv64 \
>     -M virt,aia=aplic-imsic,aia-guests=7,iommu-sys=on -m 8G -nographic \
>     -bios $OPENSBI_IMAGE \
>     -serial mon:stdio -serial null -nographic \
>     -device e1000e,netdev=net0 \
>     -netdev user,id=net0 \
>     -cpu rv64,v=true,vlen=256,ssdbltrp=true,smdbltrp=true \
>     -device '{"driver":"virtio-9p-device","fsdev":"share","mount_tag":"host0"}'
> \
>     -fsdev local,id=share,path=share,security_model=mapped \
>     -append 'console=ttyS0 earlycon' \
>     -kernel $KERNEL_IMAGE \
>     -gdb tcp::6234 \
>     -smp 4
> 
> The boot log shows that the e1000e is successfully added to IOMMU group 1:
> 
>   [    0.752808] pci 0000:00:00.0: Adding to iommu group 0
>   [    0.753279] pci 0000:00:01.0: Adding to iommu group 1
>   [...]
>   [    0.763212] e1000e 0000:00:01.0: enabling device (0000 -> 0002)
>   [    0.765241] e1000e 0000:00:01.0: Interrupt Throttling Rate
> (ints/sec) set to dynamic conservative mode
>   [    0.868120] e1000e 0000:00:01.0 eth0: (PCI Express:2.5GT/s:Width
> x1) 52:54:00:12:34:56
>   [    0.868740] e1000e 0000:00:01.0 eth0: Intel(R) PRO/1000 Network Connection
>   [    0.869087] e1000e 0000:00:01.0 eth0: MAC: 3, PHY: 8, PBA No: 000000-000
> 
> In this environment, I used iperf3 to verify that the e1000e functions
> correctly. The result shows that the test completed successfully:

This is great, thanks!

Can you confirm that the iommu was set to translating for this test?

$ cat /sys/kernel/iommu_groups/0/type 
DMA-FQ
$ cat /sys/kernel/iommu_groups/1/type
DMA-FQ

?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
