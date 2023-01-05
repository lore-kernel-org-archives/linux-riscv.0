Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE9C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtIWKFaWsLH0Ag966bfVY5tVc4zbJd04UhFa6fIFYwc=; b=FwkcMDBxYlEzb6
	soUaCm6FKeXImJbMsZopUsTpBAD2Ed6J5eY4KGZMZqEMdJckJKztEo6ahR1tilYu65VUCIQZRkwYS
	KO3NMr7D0s7Tu67kmN0mwmjDDidrt+fMrIBQQ2tOIaRcP9X3iKYRWu5B6hUn4YBPMCzCHR37/DrKY
	8FeJnTBt/sJyIGErE3g4sm3468QwL1FvGxLSR2VrSD1efZj0mUZYwIEed+WAiu82DmSH5KmMQgHQx
	HY6St3ffhvHRrxFumzFQJ5KuiZ6wjwvHJaXdOX+HBG1vPVXcHjqrTHopPQWNfjoRBw5w1HQNEJ+YL
	058AKjKo3kDcrj/TWhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVBo-00Dl5L-L0; Thu, 05 Jan 2023 18:42:08 +0000
Received: from mail-dm6nam11on2069.outbound.protection.outlook.com ([40.107.223.69] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDEwa-00FbyM-Vr
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 01:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiC/ecREwZHzv5DdqPUVRzjQBVBkYLIRxrICIJ2gFNclQSMKlx7d5AftXjb11XB+29bXRTO+PNZ69C9rXeWDs/kvjiRAkPAmsbcWsDOtp0+5p9nFjDNoG8sZMZ6tHU/drc/e1vc7O2mjNnaglboJKdrA/XGRZjluHQhgnId9zM1VKf3QEvYZyRImubFuydEMEuWq05GhDPxS+w4LYqwEouJ3HfuA5fFufXjeMCbR+2nRUiwmQQNiCSGjHGmYjW1IGiq2XvCxmDUYyvo3VDydCZOpnzQut/eTCpXcLfqyVzbE3fX8O5dYFHIeueVTCdIt2c96EWqnkx+ijmjV1wLBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQskZp85qdJjpQEJ0BKPw+RuSg+mJk2lJ6fc9hmNchs=;
 b=GMLOV6ovQxMocF3Lh11AcGfVW/MPso6ogxN+RJGUUEmyKpmeGsCwYnCFjB2xOhyeqovGcoBGT+lLW01gzeXeAFQzSuX5lquPX3sr4vjoYEfYipkuL2HSl5dxIe8nGUQ0a0fcFhSdH6jgkQi2NdhnlpmOWFAdNbpELl39RDNtTJO89qiA8y2Ik5fPBsxDZDjIusOgt70o4Ux/tpm4tv4f+hZUcN3J7aMOFv2hC6xra5Ym2c9y0z8bdDkQEUzC2cHMxzAbTXTZ2kaR99RN/FBfW7uTBQNzYlERN0nEE4RgszZc51uOamxPFNcTuOc/Zbx6+WWj/voQzNz/5rTzbcUMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQskZp85qdJjpQEJ0BKPw+RuSg+mJk2lJ6fc9hmNchs=;
 b=n3Qz5M95jduH6KP1NqALGoqG0uUKwS6ETQNN6q74NT1StRAjBfoG39nqy3PWPzU0TELqEZM6MI+0J8OnPUnQzzkOJChf1veh4Gloxn4RTi1euuyQSDKXi8toD+AOZwWpN6jb61V3+v9B7/YtAaH6EzG2VjjuFkiJwcrjjGbmnVrXuuTLGg7vkDZTAzJkz/T+tEB9VHO4bIew0sf5ei5xseJ2h763kN0mmGKTHsd3hBRDI0z/PdMwb9JeEkKvC7PS1j4WgYCjjhfEluImDi2vXW37i7wEMa8GbrOvLr7R6F8Xgf6MiPvH2FLCB2HdKotD89y4Gtr43Zc//lz71vPxPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL0PR12MB4913.namprd12.prod.outlook.com (2603:10b6:208:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 01:21:15 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ecfb:a3ad:3efa:9df8]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ecfb:a3ad:3efa:9df8%3]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 01:21:15 +0000
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
 <Y6A6KqXObGKxvDrX@dhcp22.suse.cz> <Y6C6B08nTWusK3RI@monkey>
User-agent: mu4e 1.8.10; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Michal Hocko <mhocko@suse.com>, =?utf-8?B?SsOpcsO0bWU=?= Glisse
 <jglisse@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, netdev@vger.kernel.org, David Hildenbrand
 <david@redhat.com>, Peter Xu <peterx@redhat.com>, Nadav Amit
 <nadav.amit@gmail.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil
 Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>, Will Deacon
 <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt
 <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Christian Brauner
 <brauner@kernel.org>, Eric Dumazet <edumazet@google.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
Date: Thu, 05 Jan 2023 12:14:36 +1100
In-reply-to: <Y6C6B08nTWusK3RI@monkey>
Message-ID: <87bkndvks7.fsf@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:a03:332::35) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|BL0PR12MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: feb7a98e-c59a-4bff-9c3f-08daeebb23d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ftSKaxtp4Fe0L98M+VwsC+7qeHjI4/mavGJXlF27OfSzLjLAzX20TENea1Uj0U7m6X+RGsPSdogPWPhxO6pzOAC4dt001uScq1gJTAITRfiQMKhioKw59f1qvULwSbbw4BIZ+b80sQwBNWR101dninY4/Gm/zfnEY+1JtycZarkAV65eGgfllGBoF14SVX58wlLVEjhjFAW4/iQILHs43GolcTKsKcGBCXPpqHj2cYGNhIj97ipg32eAwGg2gzRADS1gDgJsoYUl7efoCbHP4buP6FGnYfNawqZedlygnmrwj5oZyqokTA1L3SLxMfpSfRtqTUITdt+PYAjbOuQgbMMSae3sTIhN9tqQkfrI89pyr/EgLUxV3m5u9q3bR4sTXpnaCh+e9kqPtXgXCcAMa78Zs8zDuV8dioePVRI6TxA3g6b+VQOEdS5ElMfJwlo3phfjBQwhmngsyXR57X83RmSBMm5Q82WMLboJxmMTQC44gNDQr87zPX+eaM6fvi3bsZlXBjohm1pVQFX9M5kzeSTJuxaVgiOKV+tRulAe9sv3uITVP1OlnNj8HKVf0wKZlXwIHfD+6QZhITY4pyO/BZzPjc7TiOQwqmmzTkvRCd4dYzrsfFeM+7VVns3hO0NSZssVC4xVhzqGqsKepW8vhJ1IH+Tg08aCtXKpfWlYyYLSAee+npYdVBK3WJ6NPF6AKhBDm2GBLl0oCTAWZpEtog==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(2616005)(66574015)(83380400001)(86362001)(36756003)(38100700002)(2906002)(6916009)(54906003)(41300700001)(7416002)(5660300002)(4326008)(66556008)(8676002)(66946007)(8936002)(66476007)(316002)(26005)(186003)(53546011)(478600001)(6512007)(966005)(6486002)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?YU5kRWdZWVhpdm45WTc0TldldmRiYlhnb3ZTK1JXTVdsWEZCQWk4K0ZEWE1L?=
 =?utf-8?B?d0xpeDJvSWV4TUFDbFMvS1d4ZFdIUkoxdnpiYkJ0NUxqaHdlb1gwQUpKRXFM?=
 =?utf-8?B?UjN6OC9MZ0RETWplUGNQOU4zR2RlazM1akFvRUd6UHpRUlJYMkpzZVpMamxt?=
 =?utf-8?B?WnVzRURIYmxmcnVWRlc3aG5YTzVhSmNFblpjeE5wUkh1ZVFHQmhHZ2JiUHZH?=
 =?utf-8?B?VlBpR0ttc3BTU0k2L00xM2RoV3VlWlVDVXFMeGlFZm51SjFZWWdQeVZVTko5?=
 =?utf-8?B?aTlOVHBYc3NnZjdCTllSU3M5amo0amk0VkJyRldqeEVqMnZ1akpyVnRzSXFR?=
 =?utf-8?B?d3ljUXVBMWhtbzRmTDRJUy9lR2JzYkwvM2htZXdla0NCRHpEYWVGVGlvOUR3?=
 =?utf-8?B?amliS0cyYTVzSjNLYjFwUnhHQ1BNdWNyVnZTcEg3OCtHeHBwNVVmNlVzRXdK?=
 =?utf-8?B?VEkzTmlveHZSTmE2QzdPNzdGd1VJMEw0enZmZCtEZGoyV1FDRnFGZk5ZLzJN?=
 =?utf-8?B?b1ppL1NHeXJjdWFHSHUyNXArbXd4Q1h5U09BdE5MSk1Ka3dvbzcwU2MwVE5v?=
 =?utf-8?B?eCt3ZWFHWCtzRDRmK084RGdhWk5Jb20xNmhmcjdJRDk3MmdqUkpuVGVlYk9V?=
 =?utf-8?B?MHJxTzBZWDh5OW5zSnJFUkQrZnNXbEhWeWphakxsZEJ5RXUrV2QyRG1GUkNY?=
 =?utf-8?B?SmFGMXRhUndScS80RW15YmlmUHpEVW1tZThBVUNoVFJjSlZQcGVMNzJvSGtr?=
 =?utf-8?B?b0tucVNVczhvbHVrR1F1NTVPY1dxVGhCdzExd3g0SnJKVDJsVGJqa1FtR0h5?=
 =?utf-8?B?cnd4WW56OE4zcjVVK09JQ3lFd1AxN01sdlhFU2N1eEVwSnZBdW1TOFZJbm5n?=
 =?utf-8?B?UXp6RC81MkN6dzkveDFCbWhDbDdnYUtmWENXYTl0SlIvbFZJZ0NhdDNKMlor?=
 =?utf-8?B?KzZ0dnZSVFpOSC9IUkR0MnNFZ05qK21jd2t3aVpBTkFLKzhXQ0tOS2JZNE96?=
 =?utf-8?B?ams2N1ZPZmNJZ3ZGQjlRajkrVDF1dEg1RjV3ZjRQQ21QSlIrYyt2QzRMUUhu?=
 =?utf-8?B?ekJjRmFvYkNhSk5yZml2Tk1Oa3RiT1pPN0svRTVSSkdPWC9PK09DeDhjVncz?=
 =?utf-8?B?YVp3ZThmdk1EMzZPK29ZdlRzZmY0S0ViSDlHbG5NZnBCem1CZUxHeDQ2WGZT?=
 =?utf-8?B?bmlldHNzeDNJUkExL0pteDdMdWJvU1EzbE8xVzlqS2NVa2o1ZjJRRkplajA3?=
 =?utf-8?B?NnJFbXRxM3dBR0FGTlNTOGI1Vld0KzNKZkdaM3dTbkdUUld0cWNpU012NnBV?=
 =?utf-8?B?VEhVSitlODhWcWlaODd6NVVvWSt5M1o1Q2wxZnd3ODY1L0pZY243cDhFd2FV?=
 =?utf-8?B?MTlZUzIyK2QxRkNnTEExT1JiWlI2WjR1RUhjSWJNN29wdFFEVHVtQW9HZzdV?=
 =?utf-8?B?OHIyejdGRzIvWmYvL2ZQM3h6RlRReXU0V0p2VHZ5QmlWaTZZdHg3YkxYekVh?=
 =?utf-8?B?Ung5Y0VGZnpZWXZPQXg3aVV1alNwOUFpeFptYXVYRU5EMnhNVGNKY09sTERZ?=
 =?utf-8?B?V0dnYnpIUCtEUjJNR0U5WUowczlqYUxRenBQL0puOWFjQk4zWEpiZmNZUjlQ?=
 =?utf-8?B?ODFIK05qQnVOL3d5Vmc4eUsxb1BSb3pYQzlodFhQME9PK0FDeloxekpDYkJ3?=
 =?utf-8?B?ZmNtcnpTTVhmSlVQTlVYWnlEV2FaTkNGNjY2V2F3ZHJsb2cvUkYyQndaanUw?=
 =?utf-8?B?NmJyMnFTRW9jaFQvbklsVmVLK2JrSTZOY2VldEE5d1hsZWQxUzVISmYzYTNH?=
 =?utf-8?B?KzgzYmVMaTRxWVBuanNBOFgzSXh2Z3BEZlFua3JUYWoxMmd6Q003OXZJUVNi?=
 =?utf-8?B?ZGNMV3NwTlNSU0xnNHVMTzh5VUlpalRxY3hrNFdxRFU5czRzZUtKV090ZWR4?=
 =?utf-8?B?Y1FKRDFwYXN3Ymo5UnYxOFJ6aHFUeUVkU0pscmZ5SzdoTzBDd0kvOFhHbVRu?=
 =?utf-8?B?VXl2OGhMQ1pkRnFPK0VlL1pGY3orOVg2UTBML2J6WlN1WktwZDZ0YXcwTVBZ?=
 =?utf-8?B?NncwSVRibkVPeWRnSXIrMUF4MFViWVJQNXY5MDFnWHFPQ3B3N2JETVlSaVgw?=
 =?utf-8?Q?GtsSAXoANVX8ukXZZUdVakW7p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb7a98e-c59a-4bff-9c3f-08daeebb23d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 01:21:15.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfPiGGIpTyBRdhKV3uOxQH9Lh9YyGg4y7iW9/NtRgYvCEBj/BzI7e4XNwy3Sdig+7DcWtUCaEXeLb+mFwxjZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_172121_475241_96F6A6C7 
X-CRM114-Status: GOOD (  18.50  )
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

Ck1pa2UgS3JhdmV0eiA8bWlrZS5rcmF2ZXR6QG9yYWNsZS5jb20+IHdyaXRlczoKCj4gT24gMTIv
MTkvMjIgMTM6MDYsIE1pY2hhbCBIb2NrbyB3cm90ZToKPj4gT24gRnJpIDE2LTEyLTIyIDExOjIw
OjEyLCBNaWtlIEtyYXZldHogd3JvdGU6Cj4+ID4gemFwX3BhZ2VfcmFuZ2Ugd2FzIG9yaWdpbmFs
bHkgZGVzaWduZWQgdG8gdW5tYXAgcGFnZXMgd2l0aGluIGFuIGFkZHJlc3MKPj4gPiByYW5nZSB0
aGF0IGNvdWxkIHNwYW4gbXVsdGlwbGUgdm1hcy4gIFdoaWxlIHdvcmtpbmcgb24gWzFdLCBpdCB3
YXMKPj4gPiBkaXNjb3ZlcmVkIHRoYXQgYWxsIGNhbGxlcnMgb2YgemFwX3BhZ2VfcmFuZ2UgcGFz
cyBhIHJhbmdlIGVudGlyZWx5IHdpdGhpbgo+PiA+IGEgc2luZ2xlIHZtYS4gIEluIGFkZGl0aW9u
LCB0aGUgbW11IG5vdGlmaWNhdGlvbiBjYWxsIHdpdGhpbiB6YXBfcGFnZQo+PiA+IHJhbmdlIGRv
ZXMgbm90IGNvcnJlY3RseSBoYW5kbGUgcmFuZ2VzIHRoYXQgc3BhbiBtdWx0aXBsZSB2bWFzIGFz
IGNhbGxzCj4+ID4gc2hvdWxkIGJlIHZtYSBzcGVjaWZpYy4KPj4gCj4+IENvdWxkIHlvdSBzcGVu
ZCBhIHNlbnRlbmNlIG9yIHR3byBleHBsYWluaW5nIHdoYXQgaXMgd3JvbmcgaGVyZT8KPgo+IEht
bW1tPyAgTXkgYXNzdW1wdGlvbiB3YXMgdGhhdCB0aGUgcmFuZ2UgcGFzc2VkIHRvIG1tdV9ub3Rp
Zmllcl9yYW5nZV9pbml0KCkKPiB3YXMgc3VwcG9zZWQgdG8gYmUgd2l0aGluIHRoZSBzcGVjaWZp
ZWQgdm1hLiAgV2hlbiBsb29raW5nIGludG8gdGhlIG5vdGlmaWVyCj4gcm91dGluZXMsIEkgY291
bGQgbm90IGZpbmQgYW55IGRvY3VtZW50YXRpb24gYWJvdXQgdGhlIHVzYWdlIG9mIHRoZSB2bWEg
d2l0aGluCj4gdGhlIG1tdV9ub3RpZmllcl9yYW5nZSBzdHJ1Y3R1cmUuICBJdCB3YXMgaW50cm9k
dWNlZCB3aXRoIGNvbW1pdCBiZjE5OGIyYjM0YmYKPiAibW0vbW11X25vdGlmaWVyOiBwYXNzIGRv
d24gdm1hIGFuZCByZWFzb25zIHdoeSBtbXUgbm90aWZpZXIgaXMgaGFwcGVuaW5nIi4KPiBIb3dl
dmVyLCBJIGRvIG5vdCBzZWUgdGhpcyBiZWluZyB1c2VkIHRvZGF5Lgo+Cj4gT2YgY291cnNlLCBJ
IGNvdWxkIGJlIG1pc3Npbmcgc29tZXRoaW5nLCBzbyBhZGRpbmcgSsOpcsO0bWUuCgpUaGUgb25s
eSB1c2UgZm9yIG1tdV9ub3RpZmllcl9yYW5nZS0+dm1hIEkgY2FuIGZpbmQgaXMgaW4KbW11X25v
dGlmaWVyX3JhbmdlX3VwZGF0ZV90b19yZWFkX29ubHkoKSB3aGljaCB3YXMgaW50cm9kdWNlZCBp
bgpjNmQyMzQxM2Y4MWIgKCJtbS9tbXVfbm90aWZpZXI6IG1tdV9ub3RpZmllcl9yYW5nZV91cGRh
dGVfdG9fcmVhZF9vbmx5KCkKaGVscGVyIikuIEhvd2V2ZXIgdGhlcmUgYXJlIG5vIHVzZXJzIG9m
IHRoYXQgc3ltYm9sIHNvIEkgdGhpbmsgd2UgY2FuCnJlbW92ZSBpdCBhbG9uZyB3aXRoIHRoZSBt
bXVfbm90aWZpZXJfcmFuZ2UtPnZtYSBmaWVsZC4KCkkgd2lsbCBwdXQgdG9nZWF0aGVyIGEgcGF0
Y2ggdG8gZG8gdGhhdC4KCj4+IAo+PiA+IEluc3RlYWQgb2YgZml4aW5nIHphcF9wYWdlX3Jhbmdl
LCBjaGFuZ2UgYWxsIGNhbGxlcnMgdG8gdXNlIHRoZSBuZXcKPj4gPiByb3V0aW5lIHphcF92bWFf
cGFnZV9yYW5nZS4gIHphcF92bWFfcGFnZV9yYW5nZSBpcyBqdXN0IGEgd3JhcHBlciBhcm91bmQK
Pj4gPiB6YXBfcGFnZV9yYW5nZV9zaW5nbGUgcGFzc2luZyBpbiBOVUxMIHphcCBkZXRhaWxzLiAg
VGhlIG5hbWUgaXMgYWxzbwo+PiA+IG1vcmUgaW4gbGluZSB3aXRoIG90aGVyIGV4cG9ydGVkIHJv
dXRpbmVzIHRoYXQgb3BlcmF0ZSB3aXRoaW4gYSB2bWEuCj4+ID4gV2UgY2FuIHRoZW4gcmVtb3Zl
IHphcF9wYWdlX3JhbmdlLgo+PiAKPj4gSSB3b3VsZCBzdGljayB3aXRoIHphcF9wYWdlX3Jhbmdl
X3NpbmdsZSByYXRoZXIgdGhhbiBhZGRpbmcgYSBuZXcKPj4gd3JhcHBlciBidXQgbm90aGluZyBy
ZWFsbHkgY3JpdGljYWwuCj4KPiBJIGFtIGZpbmUgd2l0aCBkb2luZyB0aGF0IGFzIHdlbGwuICBN
eSBvbmx5IHJlYXNvbiBmb3IgdGhlIHdyYXBwZXIgaXMgdGhhdCBhbGwgCj4gY2FsbGVycyBvdXRz
aWRlIG1tL21lbW9yeS5jIHdvdWxkIHBhc3MgaW4gTlVMTCB6YXAgZGV0YWlscy4KPgo+PiAKPj4g
PiBBbHNvLCBjaGFuZ2UgbWFkdmlzZV9kb250bmVlZF9zaW5nbGVfdm1hIHRvIHVzZSB0aGlzIG5l
dyByb3V0aW5lLgo+PiA+IAo+PiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
bS8yMDIyMTExNDIzNTUwNy4yOTQzMjAtMi1taWtlLmtyYXZldHpAb3JhY2xlLmNvbS8KPj4gPiBT
dWdnZXN0ZWQtYnk6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4KPj4gPiBTaWduZWQtb2Zm
LWJ5OiBNaWtlIEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPgo+PiAKPj4gT3RoZXIg
dGhhbiB0aGF0IExHVE0KPj4gQWNrZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29t
Pgo+PiAKPj4gVGhhbmtzIQo+Cj4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
