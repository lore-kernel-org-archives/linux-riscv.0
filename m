Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB801C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkF4QR5N7w9m067io9i0n5DZvsapStlPg0BiPfe8+68=; b=dDiYO6XaXMbsSW
	cpR2JLeTVxZXGuT5ANWB9rLK87dDdQXbIV5wZWGfQNYIRHeGPTnjL1SA37GJdv51IC6e7j7DfcZhR
	i79T3sPpN07sHkn5gGdSzgg2B4GAnYD9Kefp+y87QwuDbRsnpGOc/ViL3Eaf9SxVRpa3VPjdYs8QR
	SVKOi2gzKRGM82jxMo+F5D0RaVGg7ONavke+C05efpl7/aOzk5u1fJAQE9l8ykiuKct9eiygxNEvc
	/tXDKa7rKebIGbqduqxFr795oEUI/ZeVRAW0vzmME6HhcPB4JHPiX4JPtkUa4fqTsCCm9LkDJ9bTF
	IvfrVYxiGBEvoU7WsGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmAo-00000000vwD-1VxZ;
	Wed, 21 Feb 2024 12:58:06 +0000
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2414::601] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmAk-00000000vv3-1kIA;
	Wed, 21 Feb 2024 12:58:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSGguMYZElE8k+NeCDAFY4Q6dQFB5lcpTVRiDJwsyRsVrfenWOdhRWgG9ypzdrgeh2lehnuUotC62jISAr4dpGymVREqgWqQZKsRNrBWVjDNU5RqydZVp8/VpsT2MXGSYpuxxwN/cqMTOfcWDwi2FxYyXKLuMEiDR6PHf19gDo/Vw97dr3HX92QxRponITg6+vhkJDTFAh+b8qbSJnwAbCY3tlQghhvYzgBgixYD3U8QoYBWO546NSmQfm5dzERdB+9kZg+7PSwojsdr4deSuDf04zYZhBSO01ItAbh4pUh8ihVutIuCbJ9Uh0PKdqJy01vcPi37we9Dh3TEjPKz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5dAw+ES3ad0FTa85GSy2DHmJ5PXxznyWj5Yf8rGxs4=;
 b=L0ESUvRUkIOF0E+ogHWvdPsn59YhVLz47vS0Pxfh7e7MHn9CRe18bfRNsr/vEt9y+32hk+72iR6x/0vspYWNSQ3nsYRfrNpzaH36U+kmC8qLQ1XYY9oe1A3RFqk617obKtGl3lt/YJbWowEsMPfbOr0pUXAAH0f9Kv+9FlgbkOgbxdUJJe8cv/tp6jGk5ienTBX4S5bPv3vp9zTbGYVXGbWMR1QvdfcgOu9/zJhBKgj+Es6AEAFnKTXmemYn/2Wc8lKhDm4Lz/snvrUp2vX+pvLPqsIbDWCzpkQgAEW/EfBMOK51qwLclRHq+k7CuujMW3H+M0x+ItsJgXI/+WGElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5dAw+ES3ad0FTa85GSy2DHmJ5PXxznyWj5Yf8rGxs4=;
 b=AaxCUU8cy2XbWBVnQfEpWmODAheC9zSR4nHnRcfuct28+Xb4UloRZ7ZHKPDWB9vu0yaGT/myuCCCBmM93WJskYQkCu+hNdLi68wm/kcjHDPE8YUjQRx4/Y9E/a7B0YYU8XK9AKIqwYl8bc0b8q+slvWyVW9qtYMUzbrEwlRIlaTRbOSZctDSTrocrShFjwvNlFZ81bpQYZvPNl5AaLu3FTAVBsG2FFxtePiBBYilyue6N3qq5L0Ia8n5aICcM8dbjXHaTfdEZm6eomV7Ngjt7XkX4eXHD8IcSlt/6eX64iLrptUr5Hi5QM34JD+FJo/P0CkWCTIPWLbYKfTiNaG6xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6352.namprd12.prod.outlook.com (2603:10b6:8:a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Wed, 21 Feb
 2024 12:57:55 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7316.023; Wed, 21 Feb 2024
 12:57:54 +0000
Date: Wed, 21 Feb 2024 08:57:53 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>, linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Jones <andrew.jones@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <20240221125753.GQ13330@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-4-peterx@redhat.com>
 <20240115175551.GP734935@nvidia.com>
 <ZdXEYfs_xhS_9gRo@x1n>
Content-Disposition: inline
In-Reply-To: <ZdXEYfs_xhS_9gRo@x1n>
X-ClientProxiedBy: MN2PR20CA0054.namprd20.prod.outlook.com
 (2603:10b6:208:235::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b3e37a-b0e3-4016-2909-08dc32dcb853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cf83V4BwjQNrLAqQg/8GR2pDO7J8FKrL6eeZEre27bQPXSxb7D1D0crjCXv9mT5Aaan1Vatf2O13VMVEqRG8sSF0CvWl38sMm71hLpJMT9RT9/hZQeT8H3UWtxyQT8SszpB6Bza16Gp8nsFc6h/t/Mnl9jQaLEhM+tm/tlhMwS/5QX5Ab9AikNOM6b5nD94aqav93+KvJN43ZSDsur6OQYq7iXHTH80w2xD7UYJjNXgA/242VTNi82pDck5frRKY8c9ViiavX7oko0pDPmiOlAo46HxL1+M80wu9jNsMfHQAkpGWNaRY4fPF6fBEfpxGT2Mf69HNpUVQrXLWXXVWavAUeWBMG98U5ILIKZWfhr5YrSpbWdlwkIL/NBzYD0158MRWBj2yOq6Y1l+shGg5oNMlrXbSegZ5QyEKTb0pMIzNLmFclnINuclKpdfxnYzijqs/6LpOrGsYWzxYdUXgivv0bcLhIWh/NV96xSV7A8XZwu+82HysR3v+dp1Vlh1WdLvfcNV06ctBMp1664/VuGVQWH2BLYz0zg2PSwL3nWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uKmRp6ioKBLVCDALBLLX4U8RQXnaZVRq3V46RQHO13mSaf35Z3OQJJj6J2cX?=
 =?us-ascii?Q?x7mOoQI3p/o+5plex6Kr1AErXpliKkyXBWsN6PD7pcACGLtcg2hnhypz/N3a?=
 =?us-ascii?Q?2La/zOHOvApgWeVM1KT85muGyW4SgmUPvmhOYoMo6xOZwS5k5Vxxma4jbB4W?=
 =?us-ascii?Q?ENLRWr0UO/W8lf/K/7TQ2ALQdxh732AtxGb67uwqHv1YBoFz5PRHiaGnyWVT?=
 =?us-ascii?Q?NHDu6U7/v8kGSWbgp9ytnFttZcuyvVgCUctxAW/Pt5B7R5RZ14nCjvQO5VPa?=
 =?us-ascii?Q?5/Lj41mrsgQq5W8kIYUUc6h+TyV7ZB59WLwzziliLnIGLtowq1sogc8bcYFk?=
 =?us-ascii?Q?agI95yGVWWjA1ov2i2YEt9HBAW8knKvNkKCQrrhmekDrU6dCpM17ceVGkcgO?=
 =?us-ascii?Q?aTvUrN5u1jGburBhOxJNR3ZZEzabR2p8H0QbfT0shvOJo+bHAm2N91r4kBvD?=
 =?us-ascii?Q?M9Rb9ubZiMVWr44gzNdt3wcFaSVWmn3XKBl4LEWXZGCnhdQsyGZEi87y1VL9?=
 =?us-ascii?Q?w+K0IpzWDOSU0B8hNclMtU81rPevpY896+AG5Mh25B9Wlbvx7R8eU/8idMFg?=
 =?us-ascii?Q?msspHj862q++8+sYsG5Z+LI4XwGS2nMSENAUxixjbvQlmwM+Gi/LPb/3N4I1?=
 =?us-ascii?Q?PA+mu1XQn2x4aRR8O2p2D5aHxjdU/OU8txNjkNaVEvd41B4WyaOhqqR98rMj?=
 =?us-ascii?Q?qKou10OLXgxJLxHRD/eFnpQ6yEmDk5t15VH/kS8HCbJkvSNefte2IPA1BB1Y?=
 =?us-ascii?Q?UxG9QLxxf1OPQE/bKJgHdpgMAgRhx2vFGnuAaKaQKhJhSukMbS3xFTMRI2wb?=
 =?us-ascii?Q?gkW11HmK4cj+U9Vwu1ow7Cr64AYrB48+OwBZXoYRaRStvonR2BSkSDQcVm6p?=
 =?us-ascii?Q?jIqlxlpVsikv8RVYMpN8/RsWsaHrbzLkhk6ua7TTjGKe0GQ6Fh7xSmd4Mp0Q?=
 =?us-ascii?Q?8PDdPSUmpnsqkmaa42gI5E2b87pgcO6cih6nwFI+BgxihA3K60TQnRRc8ex7?=
 =?us-ascii?Q?7o/RNRQIilhLOenRBEJap34KgQOBp/FijpcuVKcwRM6ftvx3iiQkk0oJ+rOF?=
 =?us-ascii?Q?DucRYSjkT4F1MicOh/o4mN6zgtvaCDjtX/zCnrvEekUZRRbHakkMVaOrYj/y?=
 =?us-ascii?Q?fILpC1UoWiYUs6ALV/O0kZtg3PyOpbXKkClrjPygYig8GI20HdMBaHdESJjp?=
 =?us-ascii?Q?rga0Rv0AoesxNRdNUrRYzHdSHomQCAx8RPtja8Pcnn8ntvhB4MRqBMOquNjI?=
 =?us-ascii?Q?emyJMVIYMBJP0QyBEASm1nZDxZdfFrQ+MwmIEe4AtDPJhVyO+ug+XEIpTpuH?=
 =?us-ascii?Q?rSD4rva2OHxod7FCOP4uppRSZ3pKIfscC4YRL9fPEF0sZ1l8ZZKhQb7rwdfF?=
 =?us-ascii?Q?R2YKvUbWWvKmC+bcMOwd8NM/caKGjOI+2T64+g30cZTZdHrRhWTeU9qHOJqC?=
 =?us-ascii?Q?eUfJNHQduKlSeshypO47EVa3iUDzbLAIja85Cwd3ncA2Rkf9NVme+s7PRle2?=
 =?us-ascii?Q?oO+/x9QVVoZY8OhGtK+cJ4II/2wLYvgWIAsD71sWznWI5UR1UftlZqeKkNam?=
 =?us-ascii?Q?MIqt+MIKT0U/PXBS+cmLXhCWyEU0ghhl6Yv2sCwH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b3e37a-b0e3-4016-2909-08dc32dcb853
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:57:54.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8/Xd1zMnvDEyAOKAf5NgLdYM6Jr9DqoY3pf6upYC/bKylb4BXYmTMkLHYMf1HJb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_045802_486807_004D4A30 
X-CRM114-Status: GOOD (  29.67  )
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

On Wed, Feb 21, 2024 at 05:37:37PM +0800, Peter Xu wrote:
> On Mon, Jan 15, 2024 at 01:55:51PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 03, 2024 at 05:14:13PM +0800, peterx@redhat.com wrote:
> > > From: Peter Xu <peterx@redhat.com>
> > > 
> > > ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> > > can be a helpful helper if we want to merge more THP and hugetlb code
> > > paths.  Make it a generic default implementation, only exist when
> > > CONFIG_MMU.  Arch can overwrite it by defining its own version.
> > > 
> > > For example, ARM's pgtable-2level.h defines it to always return false.
> > > 
> > > Keep the macro declared with all config, it should be optimized to a false
> > > anyway if !THP && !HUGETLB.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  include/linux/pgtable.h | 4 ++++
> > >  mm/gup.c                | 3 +--
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > index 466cf477551a..2b42e95a4e3a 100644
> > > --- a/include/linux/pgtable.h
> > > +++ b/include/linux/pgtable.h
> > > @@ -1362,6 +1362,10 @@ static inline int pmd_write(pmd_t pmd)
> > >  #endif /* pmd_write */
> > >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > >  
> > > +#ifndef pmd_thp_or_huge
> > > +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> > > +#endif
> > 
> > Why not just use pmd_leaf() ?
> > 
> > This GUP case seems to me exactly like what pmd_leaf() should really
> > do and be used for..
> 
> I think I mostly agree with you, and these APIs are indeed confusing.  IMHO
> the challenge is about the risk of breaking others on small changes in the
> details where evil resides.

These APIs are super confusing, which is why I brought it up.. Adding
even more subtly different variations is not helping.

I think pmd_leaf means the entry is present and refers to a physical
page not another radix level.

> > eg x86 does:
> > 
> > #define pmd_leaf	pmd_large
> > static inline int pmd_large(pmd_t pte)
> > 	return pmd_flags(pte) & _PAGE_PSE;
> > 
> > static inline int pmd_trans_huge(pmd_t pmd)
> > 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> > 
> > int pmd_huge(pmd_t pmd)
> >         return !pmd_none(pmd) &&
> >                 (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
> 
> For example, here I don't think it's strictly pmd_leaf()? As pmd_huge()
> will return true if PRESENT=0 && PSE=0 (as long as none pte ruled out
> first), while pmd_leaf() will return false; I think that came from
> cbef8478bee5. 

Yikes, but do you even want to handle non-present entries in GUP
world? Isn't everything gated by !present in the first place?

> Besides that, there're also other cases where it's not clear of such direct
> replacement, not until further investigated.  E.g., arm-3level has:
> 
> #define pmd_leaf(pmd)		pmd_sect(pmd)
> #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> 						 PMD_TYPE_SECT)
> #define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)
> 
> While pmd_huge() there relies on PMD_TABLE_BIT ()

I looked at tht, it looked OK.. 

#define PMD_TYPE_MASK               (_AT(pmdval_t, 3) << 0)
#define PMD_TABLE_BIT               (_AT(pmdval_t, 1) << 1)

It is the same stuff, just a little confusingly written

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
