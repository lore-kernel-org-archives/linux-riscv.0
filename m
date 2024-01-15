Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D09C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVTCj5RXOaEWphQICbTyU+0VwxUGoSTI8zrLQgXJBKg=; b=B+N28ItENQVqfr
	pN3F/CcD/SAI5YlhavdVS0QeZCWeoPZYYp4li9nj968Mkk/Mq2yEr0p+caCKQ6/TAM7l8f6V8jtb6
	39lp2LrEzxYoDqpPpdeFd7eFZqStL8m9z9ado1g6vhECjKP4GGxd1N1VDysUG+ToZEu9jRb7BOs7d
	WIunu5ZY7L/D6zuW+q50plZOFdAUMl/BTk59acPvC5ISw8Y3uud/B/k2uLnTg2MycyBsoinODDIUP
	FMSTHAo1KuScD+B3xiV+YUG1xzHFWr9ljkTx9RaMjSRlNC/iy3DPlc8cEVXMjjQZSvbzKTEY7f3KU
	qgvK/wXEr7o/Oq+82dGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPRFN-009s2B-22;
	Mon, 15 Jan 2024 17:59:41 +0000
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com ([2a01:111:f400:7eae::600] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPRFK-009rzb-03;
	Mon, 15 Jan 2024 17:59:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R17Qka/rylLOUkUyaQp91yKUuZzVpS75yLHTMXO4PUgdrN/hW+I3udZhKCeUT+c4cHjFUi0nBjwWczHYPYAJw8BGvZmQ8bNBFNU0TJKscGfM3APnAe9myk1LQZPUgJ7mmNzfhY4l/w6F7mtYFjVZkDdpVa3uWiDfeelAQiusDJDUqBHAXiQcPOR8KjZzIGUrQDCqDwvXp35mTHjwRf7BkxBD3Ufg/gF1KwRc/hLkjhaKK3hG78qWQwS0dODXWo7eFLQ85w5mOifhOz6H8Kr4CTLAcLPbhVB9eH0fZV5eGc8GLoOMyItaQSAT7iyrluNG+/QFeTgavpwTlEDtiLkXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksLpePSBq6PmjKCW2M5ZXa1Htde2E50HKivahBQ1Bmc=;
 b=F9mCn5sBiyytU0XeS0+c/DemXWxlD56ffTOwVyBqroAHm+DxqbpvUenyA6O7SFm3zZhsupQ7GXK1Er+eMyyHMtt7Hf4KrTYO8U/GPBbBGSdhQxhdBUYPQWKDUvj1YD3MwjpY9kUyC7S3BSlfziVZBjwIC/karVRvp082WNmL99kYby4Mx13H5IOHa1RXv8DAVs/TFjxanHc400Jgs3xBdEuKLMSMqY6OFw3Vijt6yvGIPVmBUACfhnGFTDLb89/G8YN5I8NUBsePDUPxXnW1HMnZPbC9oR4q9ER5LYqHZ8pNYZQOmTnGY3xr95+6W46Hy8/mU4rooaThWQdC6FiExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksLpePSBq6PmjKCW2M5ZXa1Htde2E50HKivahBQ1Bmc=;
 b=SQASNvCDU09gG/AlbvBR+aLjw2e9TKnny4IW+2hSa9NsX6sRBisDU9r3Lm9M58v/F+eOeiJt0QOJkpF2xVW62cJW+q0rylGupFJ6V3677CAFRnzTEWh3JEECAy/4W5K8D2zuqhyxgPgp4XY4yvYZoesUoJUtof8sc3WGCF/u8N9Y9I4D+2AwSYe7m/FM+lzf2/9sz+qKNQurdOEzneCTkZzu8AaE5C/HL4XcI5IOEEe6xxEaV7Rcn45jFUdWgDnKVa5fq86nMdeFq6JgecdHpRNK+k+aXHRsaUi0ugcgg8CdJbqqCKIaNt21L7Fv2IQi88QAEPc/dkDoAQQVHVMwbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 17:59:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:59:30 +0000
Date: Mon, 15 Jan 2024 13:59:29 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
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
Subject: Re: [PATCH v2 04/13] mm: Make HPAGE_PXD_* macros even if !THP
Message-ID: <20240115175929.GQ734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-5-peterx@redhat.com>
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-5-peterx@redhat.com>
X-ClientProxiedBy: MN2PR15CA0063.namprd15.prod.outlook.com
 (2603:10b6:208:237::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: faaa8dad-fea4-4bb0-1971-08dc15f3b8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DcKa+wRpHTJ+inz0qDwjVN+ozM5Y75YTSNe9FudoYpRKLX/6M766n844UDiyw3QewU12+3k/d7QXkyLR19S++8ND+Bw3BPccDTBirU4J5bIBeo8ZZb08SeoynS8EgEnynDyTjaF0ybnHf+OEsXbs7L/x5H1zcm0/v7QhBKYv0w9HM/2SERVxbagGkKGyY1MBffTC6SDR7ceLCOKC2v6rWrOFUtat0Q6V0ElS33h4lpGMGIcqZ0+vngsB14DqyD0eNv9K8W4ixThRkLTUzouhkT1y1Z35CYIllJX29cXm7TGZEGlwmln72aO64WK0i2pJ4D/+c5GhiOKodNsYg5sHvqestCcY8sxMqsRy9NE92u4UxoUelniKizT/iNclT3jQi2u1deuRPiFMWH5s1R6O5CgvS8DFBYFJPCp6jBswA5Uim37IPHZVRFKBHptq+BlfQzEyAe+/1n5oo7SKwM6dcmK8fsobrFEWBRBOK20inDy6NbsfYyhzgwxfA84/BY0Szf7jfmSNAwMDZxhfi1tmViV82uL3OHVB1mbXQigiiTIE1Jz5N+1u9WOssaNaB7lBugpY+cWkJpT8rUwwJqHvfWSjzwv4HTXhVtkNsBMBbFS5L7Jv2RnG3OxKJmdBOiyY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(5660300002)(2906002)(7416002)(4744005)(33656002)(6486002)(86362001)(2616005)(6506007)(83380400001)(1076003)(26005)(36756003)(478600001)(6512007)(316002)(4326008)(41300700001)(38100700002)(8936002)(8676002)(54906003)(66556008)(66946007)(6916009)(66476007)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VwBIHHNaxz8P3ZKJyy+BP3O/i3l15Ec+UPvMiMccJsW7okBHBJg4VXZEzUO2?=
 =?us-ascii?Q?q1//rhxv83SGO4CjpnrbAhpTpWrGWpV6OFQR7cYpu5iZPDyCjxCO4qNX5Srz?=
 =?us-ascii?Q?sdr7932rAEnvKtqXJT3YX8+574oPV+yah5CMwm+N17eTjGfVddiwCgs47JZf?=
 =?us-ascii?Q?tCYP1mWKKD/YxaW4Rg6Odmor0maLUYJMkJWD3bLytdPRxK5LZwfqgpy8K4bh?=
 =?us-ascii?Q?mSeZriVMCS0m/GO9GrepGs0YDQTnmXutpMSwj9Q4LroRfeqhGUbTkVMDAtU4?=
 =?us-ascii?Q?2pyb3spwKMeVgeirDTfW74VzjcvuY9aoRDL2xprFd6DFQTeojq02UDYMzFPN?=
 =?us-ascii?Q?qRCn2SgSRkBfRG4imRRt4A7m367Kve0NMebqZV3kt+Hy6FEclh4pk5U46b8U?=
 =?us-ascii?Q?4JmCvzs7TfXF4nlRCFDMs/g47f5Q+TNwFMUVnlfKQcwYDfQaetqOrbvfOY8Y?=
 =?us-ascii?Q?p7rydTsBQKNcqR8tJYpJ1S+kkKuWLgycWrZcbm5IK5bu7fief1siJ3lg1OAV?=
 =?us-ascii?Q?rR79BljsXmSpELhsrPRjUhM+JM7KOxBWVa67nAr4VGGScASJFFpTdwBfgLHp?=
 =?us-ascii?Q?U5aUYzYmugRcLTgEAQduKbR1XvNseKdjl/gk1I0dXWpsETZqlnX7KFo1PcSQ?=
 =?us-ascii?Q?G0nQCCuquOf8kNk+IupcaclH/Hev3wkJL4kKj6yMjDnv6BqtWCvPjt+1GHEv?=
 =?us-ascii?Q?059upiAHwIvg/Rko599l3b6mjJ5ivHH3Sr1B1fXOdgU2niwmoPDDMkG+PCWd?=
 =?us-ascii?Q?biNG+UDSVa9iTyon56oS192vFhBCjZ9wFNhHb/9oC7P48nhaCAT+d07MyN8R?=
 =?us-ascii?Q?2VwAuHal69goITBylee/G9jYgweD/QVOLW2Dg9MF/QAssZyKOptjxpFj1iEQ?=
 =?us-ascii?Q?ZleFABEHq+Rlv1NdHwjVmPqz3JDKOa3PMb8nFZo/9Lik3juBPanntDem6wGe?=
 =?us-ascii?Q?aWeaXoCiv0JPzjLkyAvYeYHqgtcjNUSdRbmSojnqeEwifskhPt/6ZBgDUwZo?=
 =?us-ascii?Q?+31clwO8uZlVLkGRvnb/EztWweHo8h0Vb2nVQiUkVSByjmdjv+u9ftVFQgTI?=
 =?us-ascii?Q?w+vHKPR9mwMaQxj1Wwhq1DTFxMNar0lyMPjrNxoGAcGCRtb2UnoI3U7j/cO7?=
 =?us-ascii?Q?wS9FhCADISJ8cI8KCt36z89Ud72flA89uYdnE435jpWHGPzG/Tw+QFEKFQnT?=
 =?us-ascii?Q?Km96TX0j4mhOHfRAlYQanyp6hrAnWj/kEpric/y5Z6M0HHEY3ppvGj6pfM86?=
 =?us-ascii?Q?mmwU94q39fTiDy8f+HkUs7GxUNSpuXrc6c0on2L1RKjmSVWAsshOmKGNNrZ8?=
 =?us-ascii?Q?GpNbz6fVXJbTeHfNcZibNrUtZd9rYJCwoVv/iJxKz6/G6oNUm41tPF5b4s+2?=
 =?us-ascii?Q?W217ajxEFfa2lfh0xAPPewE8ewQtTNkapHFbCkgBDgVAYvm+2sRExO2tGdFt?=
 =?us-ascii?Q?xTmRP8Gu6O4wa/gMFOElCPsAdgfHik1HtctJazm38BiO25Tt4hCoeDU3MT1d?=
 =?us-ascii?Q?GrvYdcxnxVUqRxuRxPSsZ+4bLkyOBFw7V05T3/tASy7oB2ohtzs6pWnjGaTE?=
 =?us-ascii?Q?CVtFOmUDXhZsEJfPEuOapDj/Qzq5JaU+zZEu2qYA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faaa8dad-fea4-4bb0-1971-08dc15f3b8d4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:59:30.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0xMPm6PzUQr0909ReNgMfD5+dpRNn55evNuKhFVlyrndL5W/LNmjry1oiBsmkdw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_095938_058021_619672DE 
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

On Wed, Jan 03, 2024 at 05:14:14PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> These macros can be helpful when we plan to merge hugetlb code into generic
> code.  Move them out and define them even if !THP.
> 
> We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> Reorganize these macros.
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/huge_mm.h | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
