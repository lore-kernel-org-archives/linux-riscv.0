Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF5CCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JosyHDyoFhkCquGFSSrr4WEWmjdPk9inOPv3kdCzcjo=; b=f0cGjusvErpo70
	s47WBgvszzaixg+kKpsBC5jh793eD/4kY9MghZ9PMtdxO1aufJgqkRwFf7sqecpuZqATrmqRtx5RW
	7I/dI/mI37zM9SkN+EImTsLZiyI85ANNkizlIlRIADn1PlRpuispBgbdVpz6K5lMPQNM2wwcU1wig
	cpG0r2+Z4rutz52h+vesrH0Ua591QEWjhHVzPptnpmKOD8mYz7odJRJljJ4ufzPTTwll9Y5r6S+6/
	uYBd0/IqNQaZdXM5Typh6A/8ALe8t1z9Twx3hoSHNqBwIRjTd8s/h4+rHI40dHRP1Zfe+tpcSWpVE
	IeWcSr4nlToNNVgot09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0LY-0000000G5uO-0GTS;
	Wed, 03 Apr 2024 13:08:08 +0000
Received: from mail-dm6nam12on20701.outbound.protection.outlook.com ([2a01:111:f403:2417::701] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0LU-0000000G5tB-1ICn;
	Wed, 03 Apr 2024 13:08:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3w25fck0Xw5esq4kGkhlplhRtKt3Bhqc5wR4rOUIYDFeDszchdOTgHojSkhQ8Q8VNNgJHgzCYIeLCtfQT+PhnWk5CYcZNTnx/VdJ6K1/g66MfE0BiOuZ38MP8ojU8YXwz5QAmCTc5dStK/Awf/o1+DxQZPJhNMYkADcQCZ2CVzHY88dHt/86DJfbLKaVHSkcRH0irw+UFElzkc8VTelNReatVwY58LVHvrWoKwXpHr/qz/pZ6EyaYcWCNOgLS9uhLkVFqw230p3FQMjDm0UFdrWKKWQOD4CSt2I7yDJ+IbEvh3RfVRLqb57c69BPGKQtoRUKU8kBwqR+I1Kj4uO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPKLtrzmN9+lHp7by/pqxBXrsMwmMThT5Y3YwTuQlGM=;
 b=R+/ISom/+zs1gxF6ifk2YxJpRCzfWk/YuHH5rg/F6xx/3WyPn5X/jmLcpTJRNR7LyCyMZLySUFIczydeXfJ0G30L/qT0U6Ux2B9JJabXXhknXJ1DJKYeDFRbYm+nx/U1IZ+CjWSYBcTj5U/0Kaz2F7c9PDatG3uewSaZxQsXZ4Eu9ccwcIKLPRilgaoVhfvrWG5vkYN1l/0RwrKxrObbpXNS5yi872f2L2UHAa1BJ5FAY4F6mOvjpVy5B9N95ut4cD4fMLlAcmWnDh9IHzfJeRhQfLRsiTCdfRVMHMJIWdQ/Eu+klXh22wSZOnzPfIL69DVpuBdfIXNqlMc+XGMY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPKLtrzmN9+lHp7by/pqxBXrsMwmMThT5Y3YwTuQlGM=;
 b=EZsUjcmokCmLxDCQkCwetwzq8kIyQ1YN146Rv726L2IOJHQcDnvuVi+KdVxZXRq7oMliaWDFDw/NqYeCycOM61p+9GMS/5Zmx+Nhk9+rZzxFa8nzibbTgsyXFcFN9mqSRyFJQghxmLSbRyr/mrFXDQiQFQO5A0433vqccwe/0Hbc7QtPncpgJ5Hl3Hx+in0ABxn4kLDXAy24WGnjYwRIKAr5f+cjjd9qUUOyXPVmIsEZ5mgPaOkDkngZyDOwFvLOn3/FgHZb3HJTabByubeSSkcbvk+F+SaL00fck/VhZcxUEGD7kszJO35GmeINHfkM766eM4yOPcwACCW4Pw2tPw==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 13:07:57 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 13:07:54 +0000
Date: Wed, 3 Apr 2024 10:07:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Peter Xu <peterx@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <20240403130752.GC1723999@nvidia.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
Content-Disposition: inline
In-Reply-To: <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
X-ClientProxiedBy: SA9P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::12) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH7PR12MB7308:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FN5sV7ggEC4QGfJXPKiiBqIaTFE1ktvqeTVs4zje0Ra+fmuIRfTH6zQWioXqzsuz6tnnTL+kD31bhztM3zXi5FrMsLbY10BvsaG5f9tfym04f2xdYEQp0768gTs5ndUv7sfA6Li0A3QSXvXKZE1Y49GXHJ5gg1rg0ur+PH6KS0Nr+CEJ+DsYN+Xc8AEt54prP0DLph29QZ8k8ND/vz1K/LNoycgpbjlk2Nq1jHd8lLJ1SUmNK9xye4SjDwBgaB6VSMtCTW7WyQaZjBwE3ufET2Gf5XAmUvUbIVht42svTXlPKX5X8CZiTQZiXIvx4mtQiE5i1h9xgr2Fq5moPkvNkXeKxHbqwAzMnXLFilcvY/LniK/WJoyjhNCh2l1pOONIWV3s84yfkLrCnWX2jxI/a/AV7LKGvIDixUNs+M9cSWQNA+NRR8QruTSAY8Mo0lp5t8Tz/fH3cs/EGmUtXjfh8Prsd1Nd5utyDZgKue/AHyMpzvFnqsnQeDosFDcx+7PUZCQtdLishtf+OxjH/6FOawBgwJ5OT7f5jVCLxJKiDK4kNC+qzA7Jh8Vw66aokhv+o+8bS8RuaSV2N85pV8zHot+IeL9raPWLxKi9PiFalW54XdBS/XeSsmc8xO+5FbHML7GV3DspL5GaUeXh1gb6LhsiJH7FwFLBaGIkYqMik0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVB3NkR4ckdtWHhEcVRyZVA0RWpoWFIzTjZkOWZLSUREb1Mxck95Kzh6dVdT?=
 =?utf-8?B?WU42MWg0ZW92SHI5ZlR0MHVTOEJHSnNCMDJBcnBORHlTRDBSNE01bEVrQ2Z0?=
 =?utf-8?B?WlNhdk5TYXoyMU9WaUdVUExhQmJBbThxZTV2NjFITklSYjZBTktsQmU5VjFm?=
 =?utf-8?B?N0NtRVQvZHpibVhYYkR0WDBJelpPVlh2ZDJ0c1NIZnpXdmJvRWkvelJMdzVR?=
 =?utf-8?B?YXpxUzBGcEpUS3dxc1ZrMnZDUU9mdEszdU0wK3BYRC9NYkowb0tlaExySnp1?=
 =?utf-8?B?SkMrWnlwWXlSS0tyV1VNTTFsMlM5Q05GQlZSZW5YZ2xvMDM0ZFMyTTB5a0ht?=
 =?utf-8?B?NjREMW90SnRqbGpsVEZiWkhwRzF1ZHplUUdMY0FJODNEdFFYenpiczN5L0hi?=
 =?utf-8?B?bnVOSDVsRDUyV2p3K0lKZ25hVWdMeTRDQnhZYUcvSnFTRk1PM2Y0WjFxeUM2?=
 =?utf-8?B?MzRyRUI0Z3l4a01xTmFvbWNiTVp4OTJPRzNSSXlkNks1bi9ObDAvc2lDNU9t?=
 =?utf-8?B?NzE4VUoyT3J1TzZMNko3NGsxMHN6V1F6ODhJN1pnZWJ0T2U5UktCUTUxRlJU?=
 =?utf-8?B?VlRPZDhuRzJFUnpoKzlNZ2k1RnFpSk1YWjVGWEpaRzZ5eUdlejVpQWxLVndk?=
 =?utf-8?B?cUhhMVZ3Qml2MVpOZ29EZ2NybnZWc1JUSTRBNmtOZ2FkdW5WbkpPMGpuUVRR?=
 =?utf-8?B?enNnL3lHL0tuSjVhMU91VDRyKzU1dnlxQTU3dUtyMkFETE9OaERlS2hTRUpY?=
 =?utf-8?B?bFBCdWsyRDZWbm5lbE1EcndhbVdmbTZLay9YVnRMSkM4SzAyUHFKQmVEVkJU?=
 =?utf-8?B?WW13a2Y1Z2lvdTdmRk5ZaFp2RVprRDJYUW40cmRwOHhDR2FWTzIyS09XTzNC?=
 =?utf-8?B?MFpaTHYzenhTQXZpUGFqR3NFa3RWVTd0dFFHU3Zjc0lpeDROSmpTNGhXYlFr?=
 =?utf-8?B?Yk1WbXIwWG5jWjJPUytOaitFUit2NzhWOUROeXhYaHZlZC9NV3lBOTRLSWFl?=
 =?utf-8?B?T25GYnMzaU5lRlV4NW5VZnZGME8vQzI4OFBRREVmUGdTT1NyNzdGaVZkTHc1?=
 =?utf-8?B?M0FDdGJ4NjJSOSthcEV3Q1V4QXBoRVlLaUpUQkZKM2phcHp3NjZPdFVZSjJZ?=
 =?utf-8?B?RFBWZW1QeG80b3VEdHh1ZUNCL0RQK00vQjhEK0wzQkhqOU02VkJoMVRVSHMx?=
 =?utf-8?B?V1pGN1luNU1wVDA2QThMbmUzbXNZKzNuTFJOdGdmNG1iazY1TmVhTUFwM3d3?=
 =?utf-8?B?V3BSYWpKSVpGUEhRTTI3MG96ZzJ1SWRIN2JQbDVOWnhCYm1LeXJwaDMzVnN1?=
 =?utf-8?B?WnVNbHhENndmY3FJNTVvbkJJWkpvNExLNXNDTEtjbW5LU3liRENtdUVPUTBM?=
 =?utf-8?B?a3BDVUVlUFI0MnhBTzd2STcxaG43WUJiQTZlM2FQVyt0a0dsTTJJM3BucFpS?=
 =?utf-8?B?QWlueDlpaWFaVjZqd20xS1J5NGU5VzBVTzdjaDdyak1vYWFsZFFYajMxbDht?=
 =?utf-8?B?WVk4UG91aUZ0c1d4RE1yR2NNc0JHUllFcmtHdjBGRENGUVJhT2xCazVxMXF4?=
 =?utf-8?B?SlZWdW1TOW5RcUFVeTEyR0pMYnB2eUNoWkEwOVlLd29IM1BTV2xDOCsvTTRj?=
 =?utf-8?B?d0VsSmVYOVlzcjlRRWU1ZWJkTGxQRjYzMlFnNisya01LNDR3V3FZVzhaTWRX?=
 =?utf-8?B?STUvVU94cE9sQmYwRTJGR0ZIYzVCeVQ4SmQvOXR3UkVlN3dNVFlhSEpDQ2Yx?=
 =?utf-8?B?MTVzMHNIYThxZkVmRnJDTUVia1Z1SXk2Um0zRVM5N1RmQ29zalF4VFpuRm1U?=
 =?utf-8?B?UFJRYXFURnlFSWpkenpHNWFRVkpHaWpQV0RlSmxUbkszV2lkb2liOEE0QXhR?=
 =?utf-8?B?SEhCdXpraU00MnJuUERYaUQzdXZ0c2REMHZKdmo0NXBYLzlONlZnempEUUx0?=
 =?utf-8?B?aGszRlk1K0h0T1VxY1BGc0NjNTVHQWd2TTN1b28wSWR5Q2pCL051dEhBMVdj?=
 =?utf-8?B?cDIyc201dFFub3JXbFdVakd2VXJxM0FaZFpmMmdwSTNBVkVtZ21mRWdYTnAw?=
 =?utf-8?B?TEkyMFdnRjMwakVuN1ZHUndHYW82dWNEYVlBNEE1UWtIRVhnWVhHSFJqQ0FL?=
 =?utf-8?Q?WZmjXLZHjTKALExzitY+uTAbW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc4e13c-4496-485c-17cf-08dc53df1337
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 13:07:54.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6oFKsgagNWFi9pA8yE6mLHKr7nCI/bWxa0QlCbovMHfTFY3OK5bntAFNu92bq5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_060804_397396_596CC0A8 
X-CRM114-Status: GOOD (  28.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMDMsIDIwMjQgYXQgMTI6MjY6NDNQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAKPiAKPiBMZSAwMy8wNC8yMDI0IMOgIDE0OjA4LCBKYXNvbiBHdW50aG9ycGUg
YSDDqWNyaXTCoDoKPiA+IE9uIFR1ZSwgQXByIDAyLCAyMDI0IGF0IDA3OjM1OjQ1UE0gLTA0MDAs
IFBldGVyIFh1IHdyb3RlOgo+ID4+IE9uIFR1ZSwgQXByIDAyLCAyMDI0IGF0IDA3OjUzOjIwUE0g
LTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+Pj4gT24gVHVlLCBBcHIgMDIsIDIwMjQg
YXQgMDY6NDM6NTZQTSAtMDQwMCwgUGV0ZXIgWHUgd3JvdGU6Cj4gPj4+Cj4gPj4+PiBJIGFjdHVh
bGx5IHRlc3RlZCB0aGlzIHdpdGhvdXQgaGl0dGluZyB0aGUgaXNzdWUgKGV2ZW4gdGhvdWdoIEkg
ZGlkbid0Cj4gPj4+PiBtZW50aW9uIGl0IGluIHRoZSBjb3ZlciBsZXR0ZXIuLikuICBJIHJlLWtp
Y2tlZCB0aGUgYnVpbGQgdGVzdCwgaXQgdHVybnMKPiA+Pj4+IG91dCBteSAibWFrZSBhbGxkZWZj
b25maWciIG9uIGxvb25nYXJjaCB3aWxsIGdlbmVyYXRlIGEgY29uZmlnIHdpdGggYm90aAo+ID4+
Pj4gSFVHRVRMQj1uICYmIFRIUD1uLCB3aGlsZSBhcmNoL2xvb25nYXJjaC9jb25maWdzL2xvb25n
c29uM19kZWZjb25maWcgaGFzCj4gPj4+PiBUSFA9eSAod2hpY2ggSSBhc3N1bWUgd2FzIHRoZSBv
bmUgYWJvdmUgYnVpbGQgdXNlZCkuICBJIGRpZG4ndCBmdXJ0aGVyCj4gPj4+PiBjaGVjayBob3cg
Im1ha2UgYWxsZGVmY29uZmlnIiBnZW5lcmF0ZWQgdGhlIGNvbmZpZzsgYSBiaXQgc3VycHJpc2lu
ZyB0aGF0Cj4gPj4+PiBpdCBkaWRuJ3QgZmV0Y2ggZnJvbSB0aGVyZS4KPiA+Pj4KPiA+Pj4gSSBz
dXNwZWN0IGl0IGlzIHdlaXJkIGNvbXBpbGVyIHZhcmlhdGlvbnMuLiBNYXliZSBzb21ldGhpbmcg
aXMgbm90Cj4gPj4+IGJlaW5nIGlubGluZWQuCj4gPj4+Cj4gPj4+PiAoYW5kIGl0IGFsc28gc3Vy
cHJpc2VzIG1lIHRoYXQgdGhpcyBCVUlMRF9CVUcgY2FuIHRyaWdnZXIuLiBJIHVzZWQgdG8gdHJ5
Cj4gPj4+PiAgIHRyaWdnZXJpbmcgaXQgZWxzZXdoZXJlIGJ1dCBmYWlsZWQuLikKPiA+Pj4KPiA+
Pj4gQXMgdGhlIHB1ZF9sZWFmKCkgPT0gRkFMU0Ugc2hvdWxkIHJlc3VsdCBpbiB0aGUgQlVJTERf
QlVHIG5ldmVyIGJlaW5nCj4gPj4+IGNhbGxlZCBhbmQgdGhlIG9wdGltaXplciByZW1vdmluZyBp
dC4KPiA+Pgo+ID4+IEdvb2QgcG9pbnQsIGZvciBzb21lIHJlYXNvbiBsb29uZ2FyY2ggZGVmaW5l
ZCBwdWRfbGVhZigpIHdpdGhvdXQgZGVmaW5pbmcKPiA+PiBwdWRfcGZuKCksIHdoaWNoIGRvZXMg
bG9vayBzdHJhbmdlLgo+ID4+Cj4gPj4gI2RlZmluZSBwdWRfbGVhZihwdWQpCQkoKHB1ZF92YWwo
cHVkKSAmIF9QQUdFX0hVR0UpICE9IDApCj4gPj4KPiA+PiBCdXQgSSBub3RpY2VkIGF0IGxlYXN0
IE1JUFMgYWxzbyBkb2VzIGl0Li4gIExvZ2ljYWxseSBJIHRoaW5rIG9uZSBhcmNoCj4gPj4gc2hv
dWxkIGRlZmluZSBlaXRoZXIgbm9uZSBvZiBib3RoLgo+ID4gCj4gPiBXb3csIHRoaXMgaXMgZGVm
aW5hdGVseSBhbiBhcmNoIGlzc3VlLiBZb3UgY2FuJ3QgZGVmaW5lIHB1ZF9sZWFmKCkgYW5kCj4g
PiBub3QgaGF2ZSBhIHB1ZF9wZm4oKS4gSXQgbWFrZXMgbm8gc2Vuc2UgYXQgYWxsLi4KPiA+IAo+
ID4gSSdkIHNheSB0aGUgQlVJTERfQlVHIGhhcyBkb25lIGl0J3Mgam9iIGFuZCBmb3VuZCBhbiBp
c3N1ZSwgZml4IGl0IGJ5Cj4gPiBub3QgZGVmaW5pbmcgcHVkX2xlYWY/IEkgZG9uJ3Qgc2VlIGFu
eSBjYWxscyB0byBwdWRfbGVhZiBpbiBsb29uZ2FyY2gKPiA+IGF0IGxlYXN0Cj4gCj4gQXMgZmFy
IGFzIEkgY2FuIHNlZSBpdCB3YXMgYWRkZWQgYnkgY29tbWl0IDMwM2JlNGIzMzU2MiAoIkxvb25n
QXJjaDogbW06IAo+IEFkZCBwP2RfbGVhZigpIGRlZmluaXRpb25zIikuCgpUaGF0IGNvbW1pdCBt
YWtlcyBpdCBzb3VuZHMgbGlrZSB0aGUgYXJjaCBzdXBwb3J0cyBodWdlIFBVRCdzIHRocm91Z2gK
dGhlIGh1Z2VwdGUgbWVjaGFuaXNtIC0gaXQgc2F5cyBhIExUUCB0ZXN0IGZhaWxlZCBzbyBzb21l
dGhpbmcKcG9wdWxhdGVkIGEgaHVnZSBQVUQgYXQgbGVhc3Q/PwoKU28gbWF5YmUgdGhpcz8KCiNk
ZWZpbmUgcHVkX3BmbiBwdGVfcGZuCgo+IE5vdCBzdXJlIGl0IHdhcyBhZGRlZCBmb3IgYSBnb29k
IHJlYXNvbiwgYW5kIEknbSBub3Qgc3VyZSB3aGF0IHdhcyBhZGRlZCAKPiBpcyBjb3JyZWN0IGJl
Y2F1c2UgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmggaGFzOgo+IAo+
ICNkZWZpbmUJX1BBR0VfSFVHRV9TSElGVAk2ICAvKiBIVUdFIGlzIGEgUE1EIGJpdCAqLwo+IAo+
IFNvIEknbSBub3Qgc3VyZSBpdCBpcyBjb3JyZWN0IHRvIHVzZSB0aGF0IGJpdCBmb3IgUFVELCBp
cyBpdCA/CgpDb3VsZCBiZSwgbG90cyBvZiBhcmNoZXMgcmVwZWF0IHRoZSBiaXQgbGF5b3V0cyBp
biBlYWNoIHJhZGl4CmxldmVsLi4gSXQgaXMgZXNzZW50aWFsbHkgd2h5IHRoZSBodWdlcHRlIHRy
aWNrIG9mIHByZXRlbmRpbmcgZXZlcnkKbGV2ZWwgaXMgYSBwdGUgd29ya3MuCiAKSmFzb24KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
