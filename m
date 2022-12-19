Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E54C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=133jbF4a7OJ+dEW6+34O4EgKnyBoxruMzi2RfH9EQK8=; b=GzvrYfGdzesSTQ
	hTZRX7FlPJLJNsLll4SWyAoI917Gr7Iq+iSfU+H+4OxvROWZyzKdwCEASm/fn1flGb/5Yfhym2n/N
	NTf9+ku2KbBkI3FO5n1SbQdq1/MLn4spx6yJR9SrGe/FZQT2dg9l2nN1KBojyqia/p3a4wSk8sUBk
	Uc1OZUTwJP2re/HpaaHMhFhN3TLNZHroejB5Ck2J50YEgwWMDuN2ZgyrWKGRGqC/s6aVujsTROTFd
	2J3nqwrOvvrOoVMfbdJd67QPuTrMbWT/ZLu7u40v9uM/48DAUybo3x4Z04ZlFNzGTYsGsXn+sx01n
	3yLuUSRS8htqU2wN3KKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7MJI-001YYS-7V; Mon, 19 Dec 2022 20:00:28 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7LjQ-000uQV-Gc
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 19:23:26 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJIwxkW007687;
	Mon, 19 Dec 2022 19:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=SlWWY7t2+2YgwdzarOOQstzXkTfP5P21pbnljBQ7tlE=;
 b=0OxptIEqjnm1bseqLKEuUhJpj0/UyLtQI5HyTLM0paRfo701FalT/BEwWv+u8T72aRY1
 5BKDlPGk8sX3We5PjGSVxfwGESomJFm8K/cqgpRotCtm59h5Tw6467BBTt8DKCzx/55P
 ZUetTmRc6FGwvnXIzoWemRHlbGdS6Xe2i8mBu5cD0Se1OGcmUc4B5fwcRhggvFLmKnzD
 vMqoRGHH36z7Ey1Ma44zfv3GdHrF51yjkhce6eNdzHamlyNnjKV3/cjzIIXTUYexIpgi
 8Topnv3Nrn9bQxi2S09EBclCVnQWCNSXRsakxuoN4hsdVa6FjYqX9zFJ1MHtjyOUr0TX Bw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mh6tm3pt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Dec 2022 19:22:56 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2BJHt6iP003454;
	Mon, 19 Dec 2022 19:22:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3mh473yxh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Dec 2022 19:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEukeyVKrTMGl6WR15zDq7yKKP1Xl2ireNnSuFfZesGUtECAKJgAwBodkriSTsKetn2leygfvwVRnJ0pfqizfN83EAQHg27X+z5Btw5Q9LGP8+yEtI/n45Sm5LvS44tVzUBYV3/JrKBsX7wSJ2bmMQkjIdIdCJY1g3gwfDouPqCe4FSpRGVp8Aw9nhwHaZ8J6QSU0k1rmJ9y9kic8hgX77YYJ02rAqsWuTpxmTsStbv7OtEORBYxw7lsHg8Zz3rHgCOuYVRld8xyvGHf4b9YAjZZVAF9JGfkgJL5t8BFl/cyoZ+CB8J0MS1lKy6OHvLLJM9327YXAkQI4IzExPK1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFj8boNVCdt47AAYwo2owRRmTQOIZbkSIZy1UEoRjeg=;
 b=BSAZKQnbirUGALmPEQaAoB2O9jXOpJa8QjogMXJl4tVaXo6PnI6L8gIOMh5UFMHjmeJhMOXB2SIx+iwl6q2LPX1TFpqLwuado7BDToWoS2/kVzdTkBJzR9qTInaU3gFgoM74IRI2C2/l7GqOrHpuVhnheRbQX+AQ4l24qQqLoana62b4m9HT0H1SZcYWCEltrxrFl24ALvC3FDyVSW9wu4YWnCJWMRk2iTRdOap5C4YXkbFH78EB8UBDHD5tyvfpJS7N4aoxgMZpMn88dHQ6JISaB2KvRV/wusFYgJSRIiBi+Z/bMyj0ZhlTHiksK8t1SEwPlsTjtVB5b3Tq6CVEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFj8boNVCdt47AAYwo2owRRmTQOIZbkSIZy1UEoRjeg=;
 b=YQfsu0pq4rUCmVegNHf8B44P2gwb3m7tMKECnDkQyizKUzQJeUIW1HN/yLL3cWwVSMNMNpyt0y2kuOHiQ+XZsdmebaX/V7Y3dH8H+gtFGc1BSE/gIYqzt8ygPjjF4lCHGXRAYtaI9V+kDyZdbQtsvSziZouol+zJmsUM8pzECBk=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 19:22:53 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::8d67:8c42:d124:3721]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::8d67:8c42:d124:3721%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 19:22:52 +0000
Date: Mon, 19 Dec 2022 11:22:47 -0800
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Michal Hocko <mhocko@suse.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, netdev@vger.kernel.org,
        David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
        Rik van Riel <riel@surriel.com>, Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Christian Brauner <brauner@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
Message-ID: <Y6C6B08nTWusK3RI@monkey>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
 <Y6A6KqXObGKxvDrX@dhcp22.suse.cz>
Content-Disposition: inline
In-Reply-To: <Y6A6KqXObGKxvDrX@dhcp22.suse.cz>
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|SJ0PR10MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1db3a1-9c4b-4cec-562f-08dae1f66bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RVA8FuHVq8M6ma2de51gHpPsESP3hciVufbSxkmOdg56EoBV8nPeLc37BteYHjwzWmLxXTz2tADI5FDn8DNByWSVArX+2qiaQlNF55WboLdYrtv/PTouDknIDpyUOxaXnWNTzpoHMGZSxRR9yGnGf3GTxR5+p/ghqXW6JNUaRLjcCJf3NutHtZaMGNb3eVezUGLM+ejhx1tSJU7FUY28ld0l1rzT3GpRdy+PTSzlKd4oKgJswkJ5An7iffSSV79DDlaPirJYTjI4R9Co8UbKFP/B4zhtuu+284QHP8RnR2mmPlPubUb/pRNtNQCHqctiYG2dZHSGG9rFrtCg0P/G/7YpORp8i7Klyv/C2Rq7XbqxGOHaWPEmm17jJh8B1SkNGMcpq9vvpl1SHLAKeQIZPKDx2LaJnxwmXWfHniRM6SIZe+SBka8Kdj09//mBSs6aCERJbReGFoZvFw/iER6Fi63PDTiQMkj26q/iMylj7E+/FkWJrxs5wMVTaIgXN/xzxZHh/2V9PhbdY9Eu75rWwTWxbufYeIvIimI+FsVW7GbdvXADR71fp9AON1cNEuTxN11YHzH9AvHGjuqfuxD5QnLQi1L1XFcYdcLpBkvUSS09AM5cfp9BjSKVQyX88fQEPVcTVF8PRqEk7ox/W71S4XzygxbodN0KMzZhsR+wPZs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(8936002)(41300700001)(66574015)(9686003)(186003)(6512007)(110136005)(54906003)(316002)(66946007)(4326008)(44832011)(86362001)(33716001)(38100700002)(83380400001)(7416002)(8676002)(66476007)(66556008)(5660300002)(2906002)(966005)(6486002)(478600001)(53546011)(6506007)(6666004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?/hVNmuwB9+o9K6QTCPA7AevS8LE04A2rg3/2mFF79DHCbZeXOcyIG8gdO9?=
 =?iso-8859-1?Q?eVBrZr+PbWUI6KDIn2aHLLyj81NWeJ98VLUfo4QxoUXhSovX8vnoyNa++F?=
 =?iso-8859-1?Q?9F3LHpImeEvPvtifvKeIQ5rXNQKPlH4Ljdgz59GXWbbkWmFLJFfsvYnf52?=
 =?iso-8859-1?Q?SCi9zXwt7qb3qP6I+gq1hxqhoVS1fLqcxyXvX4jNa3LwN9E1PNQx5+9GNr?=
 =?iso-8859-1?Q?I+U2LenkB0hPsDUEa3TOGuLKRiiW73W/CG412EdPmcV/od6Ph4Liq12wR2?=
 =?iso-8859-1?Q?k32DZjT1mgkWyCq2/TWA5Bt1V+d0hVS6d8GfT/UBjQt6BzinAT85Lk6xM8?=
 =?iso-8859-1?Q?yYBxCgRFondqXBH6OQE3PesGrVCFf7VdEHnvws327EyEc4+KlwuKxyxqws?=
 =?iso-8859-1?Q?7SLXOIQs60QWWkb0oO2n4oH8Ep9ltjNZUQPU9QCHCPDgVPd6O5TolMIEXV?=
 =?iso-8859-1?Q?LDVOR88BZpvwdS66G+sGPflSeIh6DViVUm4mkGAwZBQDIabJ7mEmALBuYH?=
 =?iso-8859-1?Q?eZpQUjMG9xJnGMsHfTRM8rtUSAcj442qHR4++V7OXpBCH0M1p7DVlWvCI+?=
 =?iso-8859-1?Q?gT9awH+pDgVQwDFuqiNHJX8BXlIMKUmCgyx23JBFLbNx7AHQlGiOuOu58d?=
 =?iso-8859-1?Q?/D4ppWq7D5GrWixQFhEdhHgNEVUAUT56cF75RY2sz+WFvFwn7LsLl2W/jj?=
 =?iso-8859-1?Q?Ldgu88LYPNEP5RleYLjlC+bJtBP50eNlSZ9OJyYw5KZFdUlmTpQbbH57bu?=
 =?iso-8859-1?Q?/LFCYdvnJFpE2kArCLQS3lUic9IHs16yOtyKySoBiEenyZuFdA1nn1ixHQ?=
 =?iso-8859-1?Q?yUbmoY+pKrjy9jmonz2OoyEC84sK8WnZ8HPqDk+PMEXfj9/emMHs2L/BHm?=
 =?iso-8859-1?Q?563GMz1RkNwhYaVFgXlcbAxDEpNsJkG4QP7ktJuGKfshtXHH1v0O7jFL9R?=
 =?iso-8859-1?Q?c35xLObcNbrvj7nOURdghtrH62BJh/L3MOuCUBHjlReUImrv0DhQX6RE+a?=
 =?iso-8859-1?Q?PHo3nDnGLE1MCWE46JSaEw/+IrBnJKgXCX+hNbKWrZuU2hrTvaacY8ybqR?=
 =?iso-8859-1?Q?B1ot+1RBeGv4080bLD3hN7GC2uXChSGvZLIsiuIbuU7uBJo6LVOnoIdlbv?=
 =?iso-8859-1?Q?yokgBls+EjSvZ0X1Fy4GmYStlL04oU4UwJwGWNqmZLMQMXes2RrENXLs6p?=
 =?iso-8859-1?Q?87PQBBfXu00lFFRGdGDW6jUXw8fjjD+NNl6YMdte36Acs9FaMSZmgt5mSk?=
 =?iso-8859-1?Q?s93in/dFoQp6OkQ1085qFSWeUG/sQj24AcUII7ruJ0UoWN5SRZCiQ6dtIc?=
 =?iso-8859-1?Q?6Yj0le3rFWkIK0H8Q28F8D3Gq7nw6Jhucck/AoQG5MUGLPXfQwa3vwk7hf?=
 =?iso-8859-1?Q?1U9aCOk0PZbo+cL+arajdlWWF4sUie14NW9YRxwz99FKbK4jNNX7BJ+oxd?=
 =?iso-8859-1?Q?ANpZHGdjZ3GxOVmvnRkeoZ88b20RhI7ro+YIi4+6xjHLj1X2/u8bCtaIR0?=
 =?iso-8859-1?Q?oIxbjkSybIZJB4pt+RHztHJh6/olzFKACpZLcATXBC/VKeWL2JRx16HLgJ?=
 =?iso-8859-1?Q?MwzMw1H0qW4Jm1X5lsXKDUlialIHPusrWiO4TUe6V639VV+O7AvnK0cCv5?=
 =?iso-8859-1?Q?W/WFx7vtdzFEJA8RZNwhaKK7wBFHQeJ+O1LIXDZTvadkijrSOVVi8qxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1db3a1-9c4b-4cec-562f-08dae1f66bc2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 19:22:51.9805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ca6o4sLz+HWPiq//yOqMs8dwEVB0205yUdETFnVWAsjwmNrBfVt4pwovsst2v81cis09FFnBx7YR8kIUBMq0uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212190172
X-Proofpoint-GUID: 4wAKUmjGiA2Tyfd4C2xWtgZTWvB4HmLf
X-Proofpoint-ORIG-GUID: 4wAKUmjGiA2Tyfd4C2xWtgZTWvB4HmLf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_112324_689379_B5D34E62 
X-CRM114-Status: GOOD (  24.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/19/22 13:06, Michal Hocko wrote:
> On Fri 16-12-22 11:20:12, Mike Kravetz wrote:
> > zap_page_range was originally designed to unmap pages within an address
> > range that could span multiple vmas.  While working on [1], it was
> > discovered that all callers of zap_page_range pass a range entirely wit=
hin
> > a single vma.  In addition, the mmu notification call within zap_page
> > range does not correctly handle ranges that span multiple vmas as calls
> > should be vma specific.
> =

> Could you spend a sentence or two explaining what is wrong here?

Hmmmm?  My assumption was that the range passed to mmu_notifier_range_init()
was supposed to be within the specified vma.  When looking into the notifier
routines, I could not find any documentation about the usage of the vma wit=
hin
the mmu_notifier_range structure.  It was introduced with commit bf198b2b34=
bf
"mm/mmu_notifier: pass down vma and reasons why mmu notifier is happening".
However, I do not see this being used today.

Of course, I could be missing something, so adding J=E9r=F4me.

> =

> > Instead of fixing zap_page_range, change all callers to use the new
> > routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> > zap_page_range_single passing in NULL zap details.  The name is also
> > more in line with other exported routines that operate within a vma.
> > We can then remove zap_page_range.
> =

> I would stick with zap_page_range_single rather than adding a new
> wrapper but nothing really critical.

I am fine with doing that as well.  My only reason for the wrapper is that =
all =

callers outside mm/memory.c would pass in NULL zap details.

> =

> > Also, change madvise_dontneed_single_vma to use this new routine.
> > =

> > [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.krave=
tz@oracle.com/
> > Suggested-by: Peter Xu <peterx@redhat.com>
> > Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> =

> Other than that LGTM
> Acked-by: Michal Hocko <mhocko@suse.com>
> =

> Thanks!

Thanks for taking a look.
-- =

Mike Kravetz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
