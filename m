Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2234DC5B552
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtxL16vz1thhux/6kKxgdDZYIPSqFmX2otBsUaCgbDU=; b=ZhAQEcIw/s7AIV
	VU+DVEOrsBEZtMTwfHBxKKGDeu7fIUB1w3Xp2HOvUt0sQjcWA5ZqOA9nplpMmypK4W9bBuHldRGrh
	lgaleqT5JeR2aqrn3cJK99pdOX6Y65eazo1gS8WZmzrmlUl56p5m9d7LpkzinhK3CgxB5w9uV08R0
	enSQT1SSR4L/HJH76/NL0lLZsJEZ4TFmBFvzMoYRxQYZGWx45OCMXYDpmkzlYRrtF2CtKmqsVzBV+
	pmr1XnqEmUZAwo/YI54LCa53zGphxnId2vOuj7BWPgype4LwkS2v6dN9PFefsR61oEnWAy0JhAd/k
	//75mqTzfVND9LG5ebQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkIt-0000000D15h-1OXV;
	Wed, 04 Jun 2025 09:20:59 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkIO-0000000D0xj-3ULF
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 09:20:30 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548fvVE017036;
	Wed, 4 Jun 2025 09:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DbHfcI1eRgLoxp8xk9+XXjwB8uAYe3E7oI9/tmRwUSA=; b=
	AphHktA1hrU8CP2/TX9KZuSbD9GVxtT3mADVvaVUbTbVHVJASk3zghFqeW22FzmM
	UNF7vFEUpt11Yq6lTLjp3hdYanNK5j9pfCkQ/BsooUJlYMky+muzatlz+N78HN1O
	0H5OKFV2DuTbL1erhGUfflGr9ZaKvrJmlrcOlv8+0UuPv2gMPVU2s8GH2fRrfn5i
	RabIN+3bIiy3lWFKCQSfOHd+YSPPZyYU/uHAEY4Mnh7glvpJLLi2wmRbm7KRqYqu
	Jrs1d/22uBUB4fBSUuyrg4SdgM5CR3fhoTsVLfn5ddR40O1Ur55u7FBLkDJYVe9q
	aDTNze08/xBBgkI1tGkVqQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cuj2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:20:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5548Fd30016143;
	Wed, 4 Jun 2025 09:20:08 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ahd6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:20:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPeP2xAv86acpBSqhYZVDHR85Dekx6sRna310poMCGsz6VBuqgMnQw05EyjISisp8i5JSMLNvxk3HRTzyOC6BiPbMe8vNZLyT4X3z7+gQLyIYLhNvrOG8TUcQdwB5XJv+YcoTjrTPH9dFDsE2ONmkVZM/XuUtJeGqrITSglv6SOsVlhyxJAfhdcCfQGyNYvLWSPcG+if9Kxdus1ZmzKPj5GSXN/bJ/lOmy93oTVoZeU0Scpx6xnPe6U9aOFyg+F+qNWPUociYR9yCuyaf0dUpPNLhfhyWcxIoI1IGzaKC/+2/+syhiUPiT2Et8ALgWPxTQ5V9+Ylm/SQRHhWF2YskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbHfcI1eRgLoxp8xk9+XXjwB8uAYe3E7oI9/tmRwUSA=;
 b=p9b+OikTGSJC08nVCW5MFn0jDuprS0TCurltEiILb5qaByRiNbXXFv1cEEsaoY9i/IEPxBbjrfQmqTX2imyGWnWEAie9vyRTZHKWBmyVJw8fgUsPqP9j7QBKpppjBEjhywnAUA+v5v3oEcCTE2wgAUOaMq0DMENecCR9f8Hlm/CyVBD8bhBv1WJQ+hAfnNR9qcRZZ/3kKtVqMrKLc7IUJxhIbsLZ62HVt2GUbXAuKcRYyq4fUZ0thATvZgE15yZSQvxqtPAJI9CTCiQ0On4liALmwVttAyFCCuUQWN64UkDhUW8tp6h7AHkc+fre+Ac/tYYJK9vr5Ya/tIEWd4XerA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbHfcI1eRgLoxp8xk9+XXjwB8uAYe3E7oI9/tmRwUSA=;
 b=ZT5f3deDx4Qc/JDeOjzuC2S0uXT0nkxxoOrVnzSvUPijh/UiwvDi3lYDiV9pMkFQvV0rNcG9wGC8flTshz4Dm7RLEXjpg0//uTPY0mibArhr7FlqMDuNbPHxyR4YYSJ394ZLd0ZWwrVxfiY34cvMa/QcN0QHTbwlK7ky81Dn0UA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Wed, 4 Jun
 2025 09:20:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 09:20:04 +0000
Date: Wed, 4 Jun 2025 10:20:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-mm@kvack.org
Subject: Re: [PATCH RESEND] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
Message-ID: <db00bb89-a7f4-4749-be2f-7a98c7636070@lucifer.local>
References: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
 <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
Content-Disposition: inline
In-Reply-To: <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bde6529-5fb5-4ac7-2019-08dda348fdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?endyVEo2YTBxL3NjWEgxeEEzdFNyV01Da3owQkZqU1pJb2c1UU8rdGgzOUJX?=
 =?utf-8?B?dUNyTGRCa0pRNkRVUWZoaElwQy9KMUVRdm5FQ0tyakpURXRMcEdYSitYTlB6?=
 =?utf-8?B?L2xTVWludXlrakFuRkZRQ2k5VjFrQktLV2Ywb1pxblNMYWp6Rmc2MVAwL2tz?=
 =?utf-8?B?cUlSdmlPSVRRKzE2VTZuTTE1MVQ2dU40YTNNWmduR2RsRzM4NFdXU1BzMDg1?=
 =?utf-8?B?MzZjcElzR25jbG9NOGJsQ21oNEZvMFlqYmM3djl5a0JhNkdkSGhjNDJlZjdC?=
 =?utf-8?B?QjB2dVNzRDBHYzhQMmp6K0ZLUlpRRFRRcnBkYStET2dNMUNxS2VMU1lyblVq?=
 =?utf-8?B?YXcyUEE2WnN5QzRrR0NFVjQ2ZUg1aWdaSEoyZ29NL0taTkFJZktjYUx1OEJa?=
 =?utf-8?B?bm0wTExudEZDNGhSRFVpeVh5VjRxd09aUGYxU3NWcHg0eVA3NGxMNzFHNUVj?=
 =?utf-8?B?cFJicjVTMG95NmFTcGNyU0VPRStQb2kyNitpMFY4MVloTHhmUkRtVDJGZXVi?=
 =?utf-8?B?bEdDNUg0UjdHUXBJaGo2TVdIbzRydTNldktIalJ5T285dEIvMFAxMndFd3Y2?=
 =?utf-8?B?YTNTL2Q0TFp6aE0rN1JRd0hmQUp2RWtBK1FNaXdrQnJRZ0IwMWM1Qk0yM1lE?=
 =?utf-8?B?Ti9FTVJBdVYvcGZ5ZXNsV3JTczNubTJXMDBwRm9rNFp0ZHRVd2tLTGYyK1Zz?=
 =?utf-8?B?ZGQ0eTBBNzEybGVQSi85c0ZBeE45emlOZUFsQXEwL2hzRmo0bHQ2N2twSFIw?=
 =?utf-8?B?MEVjVFpsL3hwRWxCbkZnU2c4RlJHcGlNU0dBSnF4cTNzeTEzVWFhNzJnZ1Zm?=
 =?utf-8?B?MnNOMSs2T1B6NHFZUElTWWJ2WlZlRnc5QTV6NDBGR0FETVdRNWpWVnBLL3o0?=
 =?utf-8?B?YlNmZWwrOW5kSjBXdlQxMVlBd3pyUXNveUFiUXAzdWlIQ0FLZFFDclFiVW00?=
 =?utf-8?B?NWhOM1NUdmpYcWh6dkxpZFl2QUZob01rSU9TNlpjU05WZytjSFdGVXVndFFS?=
 =?utf-8?B?M3pWa2RhaENsSDBLdW1aMjljcjVNZXVzVGJQVmpqdFY0bERSMWV2aHVPcjgw?=
 =?utf-8?B?L0ZhelFjdUd6VVkyKyswcjhNZ05uY0xTRnhYWjNGUlQvakVKSnlLT05Tb1F1?=
 =?utf-8?B?emh3dHVtU1krLytuSFQ2K2pzZHcyVXZ6WGVsbWIwTFp0aHVsQkE4VW5NUzhM?=
 =?utf-8?B?UW5MSGU2YjdveStuOTlKWUcrMU5HQ200aFlpOS82MGV5emdLT3ptWGp5Nk40?=
 =?utf-8?B?bUM3RDRIWUxoK040b1h0b3hJaHVrcWpsSUlRNHRXOUp6WjlLMkFrUFFwUXlz?=
 =?utf-8?B?S3grNkJjcFlRTERURjAzOEtmc1ZaaTlQUTZzSlFyUUw4aVgxMldhRVBYOE1W?=
 =?utf-8?B?Zk4wUUp0ait4YUx3NEFkVW1WQmJSZHJDOEtaQmc1dkp5TUNMMGNBTnorT2Zl?=
 =?utf-8?B?bjNDWlh5SUcvN080UHc0SEs5eEVmRy9icHhkQkZNTmowb2djWTltTDRzemxW?=
 =?utf-8?B?YXNXS29qRmQ0ZytrMzlNemxuVWVCUFNhWjJUWlRRUW0yZTlmS3VERUxPeTVa?=
 =?utf-8?B?UlE4eGZhS2xGOUV6U3U1Y3pvUTg0VzNXcHNWNXZGT0NSM2MxZHFpRHBUQjVh?=
 =?utf-8?B?WFhzUWY4TzRFU1dBV050YVhFUzZQM2hmNm9Va3k4S1d2Rk1YWE1SNXRLQW8x?=
 =?utf-8?B?c0VkN0tmcUNMOFQxbjVLRDNPZnpaSEYxeHdmMnpDU0xHZDdiWmFOY1gyQVBm?=
 =?utf-8?B?QklWWEh3MlRzSDhjbkZNMEw2MzNaREhYZm1hcGgzRkd3eWhFRmRRcUZZS2ti?=
 =?utf-8?B?ZGpUMEhuWXF3NjR6NGp4RU1uT0kyanFnaWFWd3AzYVU0Um9kU3hyaFdqMEN4?=
 =?utf-8?B?Tk9udUMyVmJESXNHWjdPT1h1U3BBV3lxMTFLOXYyOUdvc2k4bk52aTQxbklS?=
 =?utf-8?Q?ZvNLQTHgmgQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FCR2Y1V1BmZGQ0WHJkZ2ZuQjFKVFBQK205ejM0L3ZldUdqMlRSUEhNSkov?=
 =?utf-8?B?N3hQeElzZGFEOGNyUnN2RnNCa0I0cklJbDNNSXZpNng3aElzT2NRenNUMGhZ?=
 =?utf-8?B?NzMrK0RucW9VSURMbEVzeDl2b0hrc29XeitlSm9sVERtLzBJYUErYzJhZDVo?=
 =?utf-8?B?clkyWjFVb0RhS0dKUEtZSmJVOHJWcnFERDlpS2F2ZTIxY0NEdjRKVmhVVEE5?=
 =?utf-8?B?d0FuYjBIWnE0WDRWVnhNdk1WbWdKdjdSL0c3TkVvR0xXVlFmczQ0V2ZNOWd4?=
 =?utf-8?B?aGtOU0FWeU8yS1dZZHNzbFJQZ0htTDc0V1phblE2alc0VGhXRjFVUnM2dVhq?=
 =?utf-8?B?dXBUcXlUMWc3WGJxSW5lRUE3VlArUEs5djJoYnJnN2kwQzBvVUlnQTYvT25K?=
 =?utf-8?B?NWg3NElPdVYxcU5CTjJsSU5nZ1doTEJib0hJSGhKQlMzR1JzTTZPQkFvelM0?=
 =?utf-8?B?VWRJMVpGNkcyM1MzL295aGJhMjkvUEFQeDhaUTB0VnBpZDFXR2puZ2JNemNF?=
 =?utf-8?B?Rzh2UGZ3Z1JKeS9nK0ZpS2RET21wcW9VNHlZaXNLMDBQVDN2NXJlaUZzNzFX?=
 =?utf-8?B?L2dPNm41dU1vbFRvTG9pYU1qdS9JMU1BeDVhNGkxVUJ0REJ0YmdmRTdxK2dr?=
 =?utf-8?B?Mi9qZHRIdUdVMTVzOHBqaS92NDNMMEJZMmIvMm8xOEhucE5ycGozV2hJZlQx?=
 =?utf-8?B?c1pTaWEvK0xuRzlpQURuZjVoaFJpLzIydzZXaFJLczVlOVV0WUlnN0NNTW5i?=
 =?utf-8?B?bTRCNHlTWFN2UlhaaFJJVll4dVI3UG5hREhOcFBaTEtPVzVBZGVoeFVkZk8r?=
 =?utf-8?B?NktDWVN0ZmkzV2RkTWN5MEpSR3dHcnZFZnBCUHI1RkZwQUVHVnJ0anBhay8r?=
 =?utf-8?B?a05HTmxSWXA5dGNBNXdiZzUzSDM2K2sxeXFDS25NcUhXaFo0TkdaSFNDMFNw?=
 =?utf-8?B?VEZQWHNyaVp1azFZcmhnc05zci8rZFAzdE9paE1nL2VORWxjRXhEQ1AzZzZo?=
 =?utf-8?B?Ris3U3huSG1hWjJOc0Q2dWdSNWQyTGkvamdRN1FidnhBVGFtV3dMMktnRDgz?=
 =?utf-8?B?Z1had3czbVQ4clI4ejUwTytpRE1sYW5XM2xGTGo5cXZac0xFNTVSekltdFdI?=
 =?utf-8?B?Q2NCSExpRTNmbHJPVjc3M1BuSEVnVmlNRUk5YnNrQUE0aGhxNVdVU1FIZlhG?=
 =?utf-8?B?dVM5YzlwTWhpZTRUQ0dKaWNoc0lMZVM0ald4T0JsOGdXRjFsaDd4ak4vRGhG?=
 =?utf-8?B?VnhGMnhJeTRFelNsSmFUb2pSQWJndlRPbmR4aUJqNVdMUldlQ1cwMWFwVDg0?=
 =?utf-8?B?R01na2IrWDYzSDJrbUVWZXBqYXM0WGdFYTNpN3hxdmM5UTIrT2JBdWVPNnQ5?=
 =?utf-8?B?Slhpc1pQczJNclp5SlJWb2lEeFMvcGpSdGpqT044Rjd4UmhBbml4V21aVzYy?=
 =?utf-8?B?UXlsMnNPQ3BBT0czMWJEYkNQSW1pSy93aS9RUSsyN0YzMnE2TVVXSGdTTWov?=
 =?utf-8?B?VUt3Z0wrOHJtdldSVHN4ejZvZGIvelA2TmE0QWsvbC9GdlE1cVdwL0treWts?=
 =?utf-8?B?SDZpT1JiVDA0RktWZjdiSmpUU2pncng0Qnlrb1BMem5oSEx4OUhPN3FEb3Nn?=
 =?utf-8?B?UVR6d0ZYb3JDVm5TQXNFeXFXSkgyYTg1Nm8rY3pNMU1Sdm9XSWFwaVpTRVBH?=
 =?utf-8?B?cTJrY0NNLzVCeXBjMmYxWFVRWFZTcVo4bGRpM3NQMEtFb3Y2WExFMFBvdVdG?=
 =?utf-8?B?Z3E0QWJDL0pSMk1Ma0RDMjFyWG56RDJGL2Y3RmRCK3Y5akdyUjdXZ2RtTU1Q?=
 =?utf-8?B?eTNGU1ZZcmtwdS9tR2ViZVRJZHAvQVFzMk11R3daVjgyWTFWQzZleXo0RWFo?=
 =?utf-8?B?RlRaUWU2MFFhTXF1WUFSenVrL3VGT2U4alVPRkJzUFE0UXQ2dWx6ZStodFUw?=
 =?utf-8?B?N0xTSHhzbEw0YlZSVGV6dFNTc1F1NS9FV2lKNkhMWlhlSmtROFdValZ5c3pv?=
 =?utf-8?B?dlJNWTNaYjcrbDNWQ3NPSTlMdnFyWWcyRk9nWGx3TzZYekVGbkZHNmQ0VjhQ?=
 =?utf-8?B?YW9BN1d6NHpqYTBNWlFCR2JkeGMxTUQvOTZMWmNpS0xsb1h5NnJLMC9FMGxC?=
 =?utf-8?B?ejg2c2JhRHRSZGR5UExVVTh4YnNTWndpaHNEaGlYeGRkTytxZzFSL3JNalZ4?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2kDaEXkYYNuWMW+0DYjDxGCjh979XTbuKbaTR0PVvVLi0vTZeoDLd6DN5kPFfDxJmPuWo5ziYtj5AP18WtUHTgOrkGmhx/iOC6+R8fcG2y0Kh/DLXKZZFxQkHJbFopuIA//usg1WjAYdm43lL/Z/KE/i8RNEZzujUvuyOvnRLLW4ZfMgP+qULyOO/uK+gyF7QeOExSkHKkCtOq1Ls1DkgERBcfrjaWbIkih7NtFGzxS6c0eEmzKm1pcB7wwgDQHaFq5vR+buqLz10HvS+JlVqYZIfqY/JZ+byWu8vQ7OIrRqI9vCld1Iziv3D811d8fcA8lsmv//CeQrjwQMxLzteFaXf3ohol0KhAFGs1wyMKrhg2CnE2/dbQ822jY/30jVkDKG+sqAJwiiesbUQil1Ke/fLKXZ1tEYVoOGRTy90iJ4qPqTv0RlK3/tHvT79p+j+Hdss7MpVzWz88ZDyS5fvsODDVTypH+8+sJvvbxJID87BNQXH1JNCr6QA3WHMUhl1igDO08N3UwAvo3LfHa3mYLPj0u1LdTNIE7rnJ3Usy3KitZTXcP/iFh4IF0vbiGErMp8eOOimedCo3n0LCZJhTUnF8sGp1DzhyH+3E+82zA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bde6529-5fb5-4ac7-2019-08dda348fdd5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:20:04.8913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOw9Iy8uVh0RLp3Ztu9zb7Fj7lrnb3m/duJrjyBaqB5us6hpQCFo/EjK3zh49xMIOa3tOys3U7uOelSmqDwpJUE08X+FZ2ZnNFTatUPaR8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506040069
X-Proofpoint-GUID: wSsH2IpNOPMau16sCGE5E-Bxc9rzZkgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OSBTYWx0ZWRfX23xGa2fMqDFY Bc3z4t6ed1FRJ4KqZUmhQAatTF2VBAKqlgczvuKmefDq+xL7QyHRso6D6HVVxU/5SSZo0VC90jl EMZowi+B58+SE+jmlNrK/rebkttrGrqzyntaMELYl/Hknp1gH1qqlyosst/rWkvvWVPP/Bof810
 6ykQ+EyrRCTJ99q+r92JVu1s3wJthCUAsrwcIslahCmOOJe2GMZNHi75nJ3QR4M6hxgDlVzEzMZ gFb4Q0aEK58EJ+XSeFCria5JOo6fMSbm/FeoA/7aeqJcNrFBhMBvbv3Ap/wsE2Znm/zSONYZEhY RMAMBgBEpM+p5ozUPMG0G+k0sDGAYJdWhDRQZDuud3bCtEhakuesCxwEG2pV1L9XIpdBCmXnPV0
 fXG0u5Yv6LedFw8TJGC98RuyMRFccN7EJpeoBRQxMJh/mJ6wqV/Sx9voHJ6PxsmNUFSZyw0s
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=68400fc8 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=CCfztaf_0IYdkkqjBkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: wSsH2IpNOPMau16sCGE5E-Bxc9rzZkgJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_022028_876900_FD70EE21 
X-CRM114-Status: GOOD (  24.29  )
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

T24gV2VkLCBKdW4gMDQsIDIwMjUgYXQgMDk6Mzk6MzBBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMDMuMDYuMjUgMjE6MjIsIExvcmVuem8gU3RvYWtlcyB3cm90ZToKPiA+
IFRoZSB3YWxrX3BhZ2VfcmFuZ2Vfbm92bWEoKSBmdW5jdGlvbiBpcyByYXRoZXIgY29uZnVzaW5n
IC0gaXQgc3VwcG9ydHMgdHdvCj4gPiBtb2Rlcywgb25lIHVzZWQgb2Z0ZW4sIHRoZSBvdGhlciB1
c2VkIG9ubHkgZm9yIGRlYnVnZ2luZy4KPiA+Cj4gPiBUaGUgZmlyc3QgbW9kZSBpcyB0aGUgY29t
bW9uIGNhc2Ugb2YgdHJhdmVyc2FsIG9mIGtlcm5lbCBwYWdlIHRhYmxlcywgd2hpY2gKPiA+IGlz
IHdoYXQgbmVhcmx5IGFsbCBjYWxsZXJzIHVzZSB0aGlzIGZvci4KPgo+IC4uLiBhbmQgd2hhdCBw
ZW9wbGUgc2hvdWxkIGJlIHVzaW5nIGl0IGZvciDwn5mCCgo6KQoKWWVhaCB0aGUgd2hvbGUgaW50
ZW50IG9mIHRoaXMgcGF0Y2ggaXMgdG8gZGV0YWNoIHRoZSAnY3JhenkgZGVidWcnIGJpdCBmcm9t
CnRoZSAndXNlZCBieSBhcmNoZXMgYWxsIG92ZXIgdGhlIHBsYWNlJyBzdHVmZi4KCkJlaW5nIHN1
cGVyIGNsZWFyIGFzIHRvIHdoYXQgeW91J3JlIGRvaW5nIG1hdHRlcnMuCgo+Cj4gPgo+ID4gU2Vj
b25kbHkgaXQgcHJvdmlkZXMgYW4gdW51c3VhbCBkZWJ1Z2dpbmcgaW50ZXJmYWNlIHRoYXQgYWxs
b3dzIGZvciB0aGUKPiA+IHRyYXZlcnNhbCBvZiBwYWdlIHRhYmxlcyBpbiBhIHVzZXJsYW5kIHJh
bmdlIG9mIG1lbW9yeSBldmVuIGZvciB0aGF0IG1lbW9yeQo+ID4gd2hpY2ggaXMgbm90IGRlc2Ny
aWJlZCBieSBhIFZNQS4KPiA+Cj4gPiBUaGlzIGlzIGhpZ2hseSB1bnVzdWFsIGFuZCBpdCBpcyBm
YXIgZnJvbSBjZXJ0YWluIHRoYXQgc3VjaCBwYWdlIHRhYmxlcwo+ID4gc2hvdWxkIGV2ZW4gZXhp
c3QsIGJ1dCBwZXJoYXBzIHRoaXMgaXMgcHJlY2lzZWx5IHdoeSBpdCBpcyB1c2VmdWwgYXMgYQo+
ID4gZGVidWdnaW5nIG1lY2hhbmlzbS4KPiA+Cj4gPiBBcyBhIHJlc3VsdCwgdGhpcyBpcyB1dGls
aXNlZCBieSBwdGR1bXAgb25seS4gSGlzdG9yaWNhbGx5LCB0aGluZ3Mgd2VyZQo+ID4gcmV2ZXJz
ZWQgLSBwdGR1bXAgd2FzIHRoZSBvbmx5IHVzZXIsIGFuZCBvdGhlciBwYXJ0cyBvZiB0aGUga2Vy
bmVsIGV2b2x2ZWQKPiA+IHRvIHVzZSB0aGUga2VybmVsIHBhZ2UgdGFibGUgd2Fsa2luZyBoZXJl
Lgo+ID4KPiA+IFNpbmNlIHdlIGhhdmUgc29tZSBjb21wbGljYXRlZCBhbmQgY29uZnVzaW5nIGxv
Y2tpbmcgcnVsZXMgZm9yIHRoZSBub3ZtYQo+ID4gY2FzZSwgaXQgbWFrZXMgc2Vuc2UgdG8gc2Vw
YXJhdGUgdGhlIHR3byB1c2FnZXMgaW50byB0aGVpciBvd24gZnVuY3Rpb25zLgo+ID4KPiA+IERv
aW5nIHRoaXMgYWxzbyBwcm92aWRlIHNlbGYtZG9jdW1lbnRhdGlvbiBhcyB0byB0aGUgaW50ZW50
IG9mIHRoZSBjYWxsZXIgLQo+ID4gYXJlIHRoZXkgZG9pbmcgc29tZXRoaW5nIHJhdGhlciB1bnVz
dWFsIG9yIGFyZSB0aGV5IHNpbXBseSBkb2luZyBhIHN0YW5kYXJkCj4gPiBrZXJuZWwgcGFnZSB0
YWJsZSB3YWxrPwo+ID4KPiA+IFdlIHRoZXJlZm9yZSBtYWludGFpbiB3YWxrX3BhZ2VfcmFuZ2Vf
bm92bWEoKSBmb3IgdGhpcyBzaW5nbGUgdXNhZ2UsIGFuZAo+ID4gZG9jdW1lbnQgdGhlIGZ1bmN0
aW9uIGFzIHN1Y2guCj4KPiBJZiB3ZSBoYXZlIHRvIGtlZXAgdGhpcyBkYW5nZXJvdXMgaW50ZXJm
YWNlLCBpdCBzaG91bGQgcHJvYmFibHkgYmUKPgo+IHdhbGtfcGFnZV9yYW5nZV9kZWJ1ZygpIG9y
IHdhbGtfcGFnZV9yYW5nZV9kdW1wKCkKClVnaCBpdCdzIHRvbyBlYXJseSwgSSB0aG91Z2h0IE1p
a2Ugc3VnZ2VzdGVkIHRoaXMgOlAgYnV0IGhlIHN1Z2dlc3RlZCB0aGUKbW0vaW50ZXJuYWwuaCBi
aXQuCgpCdXQgYW55d2F5IEkgYWdyZWUgd2l0aCBib3RoLCB3aWxsIGZpeCBpbiB2Mi4KCj4KPiA+
Cj4gPiBOb3RlIHRoYXQgcHRkdW1wIHVzZXMgdGhlIHByZWNpc2Ugc2FtZSBmdW5jdGlvbiBmb3Ig
a2VybmVsIHdhbGtpbmcgYXMgYQo+ID4gY29udmVuaWVuY2UsIHNvIHdlIHBlcm1pdCB0aGlzIGJ1
dCBtYWtlIGl0IHZlcnkgZXhwbGljaXQgYnkgaGF2aW5nCj4gPiB3YWxrX3BhZ2VfcmFuZ2Vfbm92
bWEoKSBpbnZva2Ugd2Fsa19wYWdlX3JhbmdlX2tlcm5lbCgpIGluIHRoaXMgY2FzZS4KPiA+Cj4g
PiBXZSBpbnRyb2R1Y2Ugd2Fsa19wYWdlX3JhbmdlX2tlcm5lbCgpIGZvciB0aGUgZmFyIG1vcmUg
Y29tbW9uIGNhc2Ugb2YKPiA+IGtlcm5lbCBwYWdlIHRhYmxlIHRyYXZlcnNhbC4KPgo+IEkgd29u
ZGVyIGlmIHdlIHNob3VsZCBnaXZlIGl0IGEgY29tcGxldGVseSBkaWZmZXJlbnQgbmFtZSBzY2hl
bWUgdG8KPiBoaWdobGlnaHQgdGhhdCB0aGlzIGlzIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZl
cmVudC4KPgo+IHdhbGtfa2VybmVsX3BhZ2VfdGFibGVfcmFuZ2UoKQoKWWVhaCwgSSB0aGluayB0
aGlzIG1pZ2h0IGJlIGEgZ29vZCBpZGVhIGFjdHVhbGx5LiBUaGlzIGlzIGRvaW5nIHNvbWV0aGlu
ZwondW51c3VhbCcgdW5saWtlIGFsbCB0aGUgb3RoZXIgd2Fsa19rZXJuZWxfeHh4KCkgaGFuZGxl
cnMsIHNvIHRoaXMgc2hvdWxkCmhpZ2hsaWdodCBpdCBldmVuIG1vcmUgY2xlYXJseS4KCldpbGwg
Zml4dXAgaW4gdjIuCgo+Cj4gZXRjLgo+Cj4KPiAtLQo+IENoZWVycywKPgo+IERhdmlkIC8gZGhp
bGRlbmIKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
