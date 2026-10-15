Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AEDC2D0A6
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kN9BihCKxQQhOlI1Iw9yDoKsx1xGsrJV3IWSEJQzMZA=; b=sGYmJWRvCShIbNkPjgZQ6jz77m
	Crp+18MewceUHO54qh4HEKMUaAEyWMoka3MQe+TXF1EWoghXkro+XHXEVx2NusUGxSIK2BSlsKT30
	bG8LuaO7oOwx0niWzAN2E0wzr/ZTrgguaZD3oiSXjeUC4XrG4zzYPlc65QwR83zcmEMwu165G4J/E
	EaivZBzkul/mC7DJjZOgF/tGaMrVqYjF1uY1+2eNxDqIMxDNQc3fQGtJshrcD53KVsCX/OFwdXr+Y
	Vp87v2SwGCtbXlfk145SHLNh+ugHaCER1oirWf15Cdl26eTVv7C6QXo8Ubl/Yvk16AqsYY4SXdkp+
	twHZ3fWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPxL-0000000170g-34mY;
	Thu, 15 Oct 2026 18:13:31 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPxG-000000016xf-3lZn
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 18:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvkyZmt+L99PQrUG4jGW2fLc+MpbuTV1qNP94GA3XtCFXplpwDZMvfm9Y3LTQ1Lq+okf3ySdOyCecMmW145pKVUSGdJY7jcLAZVNh1kDO8191/u1/VxhL6yRUySAtprOwc/3aUh7KNShDs3p8im/5pSZUPXH0QplKInTCWMYs8+VyGaOW6T2itCxWkyHzEwusHJuvDeK6DtB3fZ8A+Vop0JudS6AKxt1BurCBDNVEAi7Y/+d18lFdOv9lwOY9k09KWVxDFhDBFpgonRtkCQps0FqnsBx9x9Sn3k+S/YEz9xYWSMRnS8iqU7tjCTj/SeOzLzalTjY9kvu0DNPIJKKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjQRMzjmWhwFyO/EkneVh0xWt8+hcaTn26d1Fi2mBg0=;
 b=d0iocx6XYG2bzL/DVkYjqxDxv0tcLAxuA+P7nC0+39HNCH2h0NJIiGiKCfejTAJ2cAL68aMJcLE3KEvKnvYfG073gSEVpozmltUtyuJgWBkD9xMxdX11nP9z2xoQb+1+d0S/guLM9dyyHxw6VPmFEEcQs1uWa6xHAl+qOAzhDqW6w0BQhHtO5IOfWxzZUaNThiEq+dKET2iauhsi+SH6QC3tNrjCZhk9j14hOnOMKc9TEf8m4sFF3GX/QMlvBH5dTH/rfVcG1NFZtC4oOkZ/dPYlqx0LVdtbrmfzzGrjPQvREcvB6sbLnk8dxkA3Grt95PWEVlq8m+3PkTAslrSm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjQRMzjmWhwFyO/EkneVh0xWt8+hcaTn26d1Fi2mBg0=;
 b=drS4tK+9p3m+gi8D9YHgQWdPPSralJyV4hZSarYYmOJFpHpyidHYZvHXglkI8+dRO+jsSTszf9xaGhvREny54zs4mG03Ln81OGo0NRSRh0eKKrHGtRYOfYAggPrm3CUME/Dk6eCJcBlt5jCBi68VYvGa86EK6KxcnrUJjQ8Ykexbbz6+xFEDHbPnKiH+OXXsEOYEqr/XNQhOoxf+Bx+47fBnxONEkc72dWG5c7eM32ILoZI5Jan5ul4nbe7XgfWm1qEg2jfAEQ5sK6jszE2Qea2n5bzxrnHJi2qPeTVd0U4ngbRZcrKCMpSBQjyszf5eVKnHZEUy5A170xpxHIuMZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 18:13:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Thu, 15 Oct 2026
 18:13:13 +0000
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 15 Oct 2026 14:13:02 -0400
Subject: [PATCH for 7.4-rc2+ 2/7] riscv: mm: don't let GUP-fast follow
 invalidated THP PMDs
Message-Id: <20261015-anon_vma_uaf_fix-v1-2-7b977303b42b@nvidia.com>
References: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
In-Reply-To: <20261015-anon_vma_uaf_fix-v1-0-7b977303b42b@nvidia.com>
To: David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
 Jann Horn <jannh@google.com>, Kyle Zeng <kylebot@openai.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Zi Yan <ziy@nvidia.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, linux-riscv@lists.infradead.org, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: YQBPR0101CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::34) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3ccb48-1394-452c-9e57-08df2ae7fa30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|921020|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EyxtQlTXCxPQI0x7pBb5R3ujKfkedl3RDfsHOHGoGPFPeC4JVh+qeb//+q+6AxaTk5JK27tmbkvyKnZMTrG+qHzgvq47zCbrVIRTmLXYKnNAKIntW4+TG4kWjjC0l+GAW0Pc2/4S+QU5dnT568RioItUuUvSn/GJMqPilNiEWPez08/3Q5hZRp0z2oqUEMfDf2R+K7oNbTQvqqH/E94bs+ZTUuNN+z6jxlM+vejZ46xXWqzrDYPK0J+grf7KjBBKUF9GUj2P+HI3vXdJK9klXyDvX0vcP6I/6qrhPAvHd6b4h70hul3duA41AOcpmm+usCPq3AUb7LJt5JIHHXVBu3Cmo53nCfMNQNw5qbWarFKYepCbH4AttWHSnwWkVM76Alvky0knA7AbZlu5uvviet1mpJeF0qJXe9kNucRml77+iKOCOlVjb84EQ5QoUathLlP7yHmQz+fBIl4rYBkmNU2vR05MHZfKdYgA0loVigSq5woiE7nsL/WVnXS6kP7g4xEg+SPyAe/tPoGFp0lk2oCusJqKVR9EdwBoavh1/GH84n4r33q/tzVxnkzYGA9MTzhfogWbF/rck4ja8mI9QFO4gfeus+VlcljRxVCkyI/iYX+ErtoDLc8F1PAXaTVbc19pb16AaB/onXieVwbnNf8Fxc1+ckGWTFSzWUnwf2zbhbRKft5g2lQiNWiHomFPFHvqjUGUM/v5YKHogdsytQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(921020)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1JYdm42UzE5bFd0L2o3WTBnVlRHNjhZUEpLM2dTQlZyK1hOaGVudERzeVVv?=
 =?utf-8?B?ZjltRTh5ZnlIbUlRWTB1b202K3YreG9IVG9aQ01CcnBEbUU0emR6Tjcwamhu?=
 =?utf-8?B?L2t0SzlPTjl6Q0dZaXk0OXhqRE9ZdWtEeXRGeE5nS1BuSEMwaCtjSFBjLzZG?=
 =?utf-8?B?ZHMzNjdPTFZwbGtnWnpwQzRDMlVlZkhzL1V2TjBPanNoZTk4eE9ham9VOGwv?=
 =?utf-8?B?a3FFWDZrbVJ0S2c2Q3hXb0lUbTVab0NRK1NNdzZrTytHL01meVgwUkYwRjU1?=
 =?utf-8?B?UVlDOUNJcTZrQk5VdElTRGJRdEhVb0oxeDV4N2ZRR2pXUnp6Y3hEZDZVTmR6?=
 =?utf-8?B?c1diNENBOHFVbndvZHkzT0JudmlPOEYrMWNHOXFtMi9lcFc0SFZ3T0ZyZVMw?=
 =?utf-8?B?QmVRVWFBdHVmQno3SWFkbkh2clcvU0QrYzhXZEQ2dFg5UkFJQ2lTUmlMSjJt?=
 =?utf-8?B?Yk1mbC9NQnZDMmFhRXA5d3ZrNVpNekMzUDhwekNTNVFMT2lmUjBKdlVEVllM?=
 =?utf-8?B?VHlUQnlPem9pUWFMTUVtakFFaDJQR21vbEp4VnZxajFyVHlqNWlDMC9wcFI4?=
 =?utf-8?B?S21xN0l6bVR6MzlnenVhVThINWJXbUZqVVIrd1Z3dVk1ZXV3SzZid3daNDFV?=
 =?utf-8?B?Wnp1c3U2Nm1VejdXelpPUXB1MVJYK1VHZVpST2dqamNFQzg2UktnUmxscTF0?=
 =?utf-8?B?NDN3ZVhCKzVUc1h0WFhsMWg4K3N5S3dmS3llbVZtcFBBOHFKMXF4QkdLbi9u?=
 =?utf-8?B?YUViT2dtZEdIUE1uSzhDZC81NkFMVlE1SGY1ZTdKNkZQMVVkTlZMdkZ1TUlF?=
 =?utf-8?B?OTE1T1J5a0FDNStPbWs2ZlVZOW1RUXhEVzdIbHdhMHZreW9QaEY4Y2NSNHc0?=
 =?utf-8?B?ZWRDcWdjSWNEZjRWZTdpQzVzQVlzb1JWRW8xMHd0MGg3dm9ZZ1JkK2wxak1K?=
 =?utf-8?B?bnNOUzI3UkFKKzJtVFErVXcrSllEVnlCZnp1ZVVjVkRySGE3ZjFhdDExbWhG?=
 =?utf-8?B?L3R1QkJGSitTdGVGaEYwSVRTYU11RUVWNTR5NTBpL3QrbmFjTnBBTVRUQzJi?=
 =?utf-8?B?QkdEM2l1U0hGakRuWnRtM3ArWmRwMU5QYVRaM1YxcmFDNnZCdEtMbktjTk44?=
 =?utf-8?B?eUFiczh6Mm9tbUpoQUplWTE2OVFUSndiVk81NitBRE1tTi9YRTgzZXgyd0tz?=
 =?utf-8?B?Qlg5ODNMeE93STdyMVRqamJKYVMvbUlyY0JyRzNKNnUyWm1wbmVNblFvM1pE?=
 =?utf-8?B?ODMxdzRFYlowT25jZi80bjRLem1TMTdWOURCVnE3Vml4RENqZVhHbWsxclFN?=
 =?utf-8?B?Q3FFL0hEdGdiYVJ3ZkdLT2h5dkU3LzliRTlIa2F3VzFuYWppR2puaUllRFRv?=
 =?utf-8?B?WDB6Y0pMMGQ4ZHdWN3hQU3NxQWdKQ1A1dVcvTGFIc3ljRHNxMlQwZ0dHRDJp?=
 =?utf-8?B?YnMxbmt3WWZtYUpudG1wbkpqazFoVkxyR0hRb3J0bkdLR2VSR3k2bzRDS3hP?=
 =?utf-8?B?VlhMZmM5VkJkelNSRXk2ZEpJSE5xQjVocWQ2bDRTSU95QXpna21mSDR5d3JC?=
 =?utf-8?B?UHc4VFI4b0V6ditJRmFEaTUzNGpGYmxkUlF3cXJ5SDVtME1CS0xvRlBNYzNT?=
 =?utf-8?B?YmhHVm5kcXdJR056NTJ3WSs0MWo2YW1zb1lac0hObHBQNWNqVWdLMFhjV2RZ?=
 =?utf-8?B?VFM2azA2Q3dwK0NmWlVMVnZ3TEJqaXNCaVdzWUxLaTVMZEoxNlUxKzJQSCtB?=
 =?utf-8?B?TzVzWkpMRFZCNU5tMHZ4My9XNkN3c0Q4YnJCWWY4MDlZWkZQZTUwdUpmNmdY?=
 =?utf-8?B?VWVqTG5XZmwvc0E0dEl5TXFzeDZySmltTU1sMGZydVFXZzREcWxOVERGdjZE?=
 =?utf-8?B?SEZ2aGU3WldVemhRNG1vMDNPYWQwRGoxWVl5cnNZVkZCVVNjYjFGM0NWSWc3?=
 =?utf-8?B?djMxTVpuWTFXd3ZiT2MyL3ZaamVZY0VIVXh5OWFpUHFQQ201ZXdKVXVsQTla?=
 =?utf-8?B?UTl1TFFURTF5VFlSdHdtUEVxeDliNWpDMVZQMThxa1FoVGRvWkR1WnNrQVZl?=
 =?utf-8?B?V2hCK1BDc2wxMVRiQ2c4T2ZrNHdhRldaMTh0NW1Odkh6UlpEdEJxUlJpekd2?=
 =?utf-8?B?eWpqTXZLZm9zTjRVanlOaDNYVDlmazRmM0VwMXVtTTRXN2hSUVZWdTdrR1Fy?=
 =?utf-8?B?S3NkTHAydHU2SWJmRW1jVnd5dmF4NTQrb2FPS3lnK1JqZG1IY2dyNlNhbnpp?=
 =?utf-8?B?WVo2U1dsclR1Z2NyeDRRZS8rRDFGVkdDVDUwaU1QcDY3SFA4OU9YTkhoaE1j?=
 =?utf-8?Q?Pd6u0z9PNkEwyjP9La?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3ccb48-1394-452c-9e57-08df2ae7fa30
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 18:13:13.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpB20jfPFlr7SWLkuY4nhllwaeLxXuUtulVbiGMCTr5qTA+vm5uPvcvMagWh0gKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_111326_943116_48BBD834 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

pmdp_invalidate() leaves a PMD whose pmd_present() is still true, so the
generic pmd_access_permitted() returns true for an invalidated PMD. Then
GUP-fast can grab a reference on the folio and, as the PMD value doesn't
change until the caller finishes, the recheck after taking the reference
passes too.

Code that invalidates a PMD and then decides, from the folio refcount,
whether it may drop the mapping relies on GUP-fast backing off from an
invalidated PMD, like it does from a cleared one. x86, arm64 and powerpc
already reject invalidated PMDs in pmd_access_permitted().

Provide a riscv pmd_access_permitted() that requires _PAGE_PRESENT, so
invalidated (and PROT_NONE) PMDs are not followed by GUP-fast.

Assisted-by: LLM
Signed-off-by: Zi Yan <ziy@nvidia.com>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d48f90140841e..66aac56631f0c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -816,6 +816,12 @@ static inline int pmd_write(pmd_t pmd)
 	return pte_write(pmd_pte(pmd));
 }
 
+#define pmd_access_permitted pmd_access_permitted
+static inline bool pmd_access_permitted(pmd_t pmd, bool write)
+{
+	return (pmd_val(pmd) & _PAGE_PRESENT) && (!write || pmd_write(pmd));
+}
+
 #define pud_write pud_write
 static inline int pud_write(pud_t pud)
 {

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
