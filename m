Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EAEC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyjNv3jTQmWc8RWLpHM5qPyWo9jlLsgD7JtiKHgiN8Y=; b=XFXLxFhvMdsIiL
	6GkMjrUjPNEVvt9BOPSWerK17JAGpr3wEeRiJ3IAANQh2RwhpEuu5tITsCOHkkmh21PzJLzhOxFjW
	sN/F0MkFkjuStyxUzQf8N4QYX3INaOW/w7QFOWIypG2mzlNnABt1A51ZmldIEryMGgOZFRXx/nzop
	RDeXdql6sF5y2/J802XceT2mMZqU1BQAhtN533GZkBGGSFJ1b3U+F/QiYQ1p9ntrry97895TBBGdF
	aBP72/odCd2ra/u7AKXwXCgtSa07nnQpKwXKP9W6K2/VY4HzDwIn2tS3QBRXYut8VYkDS9ASMrS7A
	/pjgyRS0M9F5VL4Yex9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5gQ-00000001VaN-0YYZ;
	Thu, 08 May 2025 18:09:22 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5gM-00000001VYw-48lU
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 18:09:20 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548H22CU005238;
	Thu, 8 May 2025 18:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Zt04qlFNPIui7SQgF685LqolVO0yMwBOFvkF6h5pa4Q=; b=
	JOBs4/VicUeEqNNQE7zpKgy2++D1tG45AJw9VvVTSifLgNuCm1Q6MLE32DJcWvql
	xKLbeSrF/PimmJClXb1GBW7JMXK8UMd013J07ZD+DGecgw+QFHNAp14fP9HOdPX9
	853IwdCKXpAbOC6id25NjIhYtPFsV2OCUCmKzruKgH+bMBpskSXefTt8kNd7jYZY
	Krt0anRAPFrdC9beyreT0y52fWkvvlh1nyvA3Xg7VXPy/BMpQso4zwPWkU7+6XIS
	Lrx60KSKSCe56pf87mdyNS0RxJjLA/jjt/rPmrwwhZN5yvOWwHATIW1P2zHuK8mh
	pEGhzqDwDzI+KIf2SzgvkQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46h0nc84fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 18:09:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548HpWrJ025122;
	Thu, 8 May 2025 18:09:06 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010002.outbound.protection.outlook.com [40.93.13.2])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kj8s1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 18:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCL1o/q8SVWRC0zgVDxQd6kOjzRAKellg6OA3DD+Y52YO/jjfigFuGvAz3hiUHRw0U5qw6tsl+hFQ2ogI1fYSPajy+IatQhoEgTIvI8ufmoHbcuEFIOm0jzbY4+E+gkMS86Dltc9HCHzJ1N9+f9LNUyO+TTV16ILkhCgEL9kjyKJ/+3ukUpVeiDhYz3NXrzagPEO9644LVnxM4VbP1XpK+PRi2gKvc+y/pv7/ijjAY5JrkigPFxOqnEZAlRlovtNpKVEcajCGWMrh+eK3wJnKG3OvvpEhN4Wt1LaYy4JDf1/ru9xvMklTkDK+QmGatICzu98uTvH3iqud/lsTT873A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt04qlFNPIui7SQgF685LqolVO0yMwBOFvkF6h5pa4Q=;
 b=JFCrRAzYzVLs7KBmdB25pLUoJGBgJLlzSlnlJSKc7zFMVH0jk6vp+uCiLve+AJ1oMtHmobPEB7H00mrv141gvfE0+Pq4toMP+iaS2sdRdbF5YLKTjvmyWJzoBXjmlLnupBYXxv0sVNQCYXnJyCkWUen6Bc53gdfyI9ftzLb1/maF3OwEjh+Bx2YD0V1hcyR/nQLaiXRWlw2XCkFcraOP9c4z/9F+3wEMbCzsFQ2u34iBIcZvpXY4tfbezZoTXxg1Ic4bACRjTeyAqA/tKvLP4sccSySURCKH9mMTuKdZ6ycyM+NmLQ/J4J2r5WKAdpLWJGA2TIbjcUmBqvWJXK4dEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt04qlFNPIui7SQgF685LqolVO0yMwBOFvkF6h5pa4Q=;
 b=fnFZlF1yIQ7Z5C6AVeV7sieH9hfjRNKpn8kxmH4QLg9t9yfupoaZkd/HIdF1LXa2qtlUVrOZE5xAJ+ZT7OKbOl1V+6iUKynvZxDVss+PGPdxIO6xe0DkwBkFv+4j5sc5ju02SHh/zQ4DWfjq5GbF49M+ikGKnHQAhiFcPok3S/w=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7977.namprd10.prod.outlook.com (2603:10b6:8:1a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 18:09:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 18:09:00 +0000
Date: Thu, 8 May 2025 19:08:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: jeffxu@chromium.org, jszhang@kernel.org, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, kees@kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        alex@ghiti.fr, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: enable mseal sysmap for RV64
Message-ID: <26e04390-058f-4174-ad6f-3f0afd803fb1@lucifer.local>
References: <5e7f2acd-2eef-4e69-9c11-ba8d1ec0bbc5@lucifer.local>
 <mhng-db41d38d-d3ec-4515-99f9-7368c82d46ca@palmer-ri-x1c9a>
Content-Disposition: inline
In-Reply-To: <mhng-db41d38d-d3ec-4515-99f9-7368c82d46ca@palmer-ri-x1c9a>
X-ClientProxiedBy: LO4P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 806479ea-57df-43c4-2ff7-08dd8e5b684c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmtabitUS3pQL1BKeE85VURTN2xGUlQxL1UvbzlRWnRWMjJhU2NXaWVZckgz?=
 =?utf-8?B?RllweWJ6VnRXb01RZXhublN5UGRXOTJNWkVwUWw3aEt6cS9YTys3bDJnR1ha?=
 =?utf-8?B?WFUxaUlRSzF4MXdWS2ZLTkFtWkNPK0RZL20xN2MySnd1c0Z3WENwSHRUUS9z?=
 =?utf-8?B?WVB2elRmLzlmRlMrdlFTN1Z1dElXQzFEOVJKYTlid20ydVNRc3VIVUZFSEpM?=
 =?utf-8?B?bDBsdXhxQU5EdGJYRnF6QTBDS3U0N0tNOGZqN3lheStUQkh3MEN6dFZiSWtY?=
 =?utf-8?B?b1NTVlZGZTkrY1lnUXBWVUY3UUpnVlYyc2ovaTBJOUQ0S0o3WnY3c1IzQlJP?=
 =?utf-8?B?STNkeTFGSGV1djZEdTRhTzVDMTYxUGhpVzhQSTVCbmpoRmNiN0p5bUU5TExK?=
 =?utf-8?B?RDJiaE9oUkt3Yk00ZzQ5ZStta1VaeDJ4S25JK1BVbDZqWUhvZ1N1b0VOQ0sr?=
 =?utf-8?B?emZLVVBmdXBmSzJqUGg0YmRFQkdwL2s3eklWTGRWdmdmQmZrUDJwUVlMcGVr?=
 =?utf-8?B?bkVyYWNsSnFWZER0bDZhajFvdGFWWnNDNnhLbG5Sa2haT2VZd1NZZDg3WUNJ?=
 =?utf-8?B?MjZGQ29DTzNCYVpRbHVJYkwxTkZqeGNkUkVFNUZPamJnNnpyekUwQ1l5ZENw?=
 =?utf-8?B?aW1lRE91Nk0wLzJJeEM2c3Z1a3FmWk9mZ05YZzVFR1BjZXRPTk5XS3FFTUdJ?=
 =?utf-8?B?R0FidmVPQlJVRjB5ZmFIdEJYZWhuM0sxbFJ3QUVzRzNYM2VKM0ZjRnZTbU4r?=
 =?utf-8?B?MXNmQXVvQ3VJTmNvZ2ppc2NDd0t0U1lEWE9pckthWlRYSkJuSE44cTRhU1Ex?=
 =?utf-8?B?a1ZVaHAvNURmdW9LZzVmT0Y3d00vVDZWaHNPMEhqYkUrZzZRR2hkSFYrMnRi?=
 =?utf-8?B?eC9pSjFwSjBGRXVxSmp1Q1hRNjlLMzViSnE2Mm5LVSttRjhMbjRxTDNnL3FY?=
 =?utf-8?B?a0w3M0pOVW10aEIrakhPSmpXQ2kyNllDYkxMVnpoTzBhWGxPRGFvc0E1ZG1m?=
 =?utf-8?B?MWQyR1NQSjAzcXJkcTg3c3RNb2lNZTNQRzlmbThJMVRybU9BUDJ3WC9JZXVT?=
 =?utf-8?B?dzhFdkd3S2Q1R3duTG5hNnBRd3lLbFcydzZ3WWZGaHBZL2kwaDVuSk1yVjBt?=
 =?utf-8?B?ZlFxOFFGaHZSTE1pU04vUzRIVjEwLzE5Z0hHQXVCNjViQW1IblNuUi9pYlZQ?=
 =?utf-8?B?Y1VOY0tZeFNXTzRqZGw3M0RUNTRHaHBXMlVxbGs4OW1iV1hGcEtRWFhaeXZG?=
 =?utf-8?B?Tzd4QVA2bHR2SXZWVXExdWFKZXBDOFNDdjFMbU0zQi9RamVJOG4rUWM2dmtn?=
 =?utf-8?B?cEJ2d2lVMzdYN1lycEp5Nk5rTWg2RHU0U3U1M0xwbkgvTStKRndocHkxYWhF?=
 =?utf-8?B?WUw2RFJZM0F5QlcrdzkvYUdEdkRWMzVLMjhMR0FDNjNBQ2Rhc2ozNk5mMjZq?=
 =?utf-8?B?Um1HckdOT0c4TVFwOGE1bEliZFdsYjBuWkNVbWRwYWJkWDhkZDVaNWtOL3p3?=
 =?utf-8?B?aktUZFpUcHdNSXR3KzIxb2ExK25ZV2JQUTFmYzhvLzRCejJLQ2xJQTJHNSth?=
 =?utf-8?B?aVNWdzdPaHdLcEtiWjV3RFVjQWg1dDhJajcxeHZvcTZHWUZxa2tOMHQ4ZCtL?=
 =?utf-8?B?bFdvaUVJWXFEeHdNYlp5UTBsN1pxMDVDbDFIeHpQc29nVHpHazQyZldxM01t?=
 =?utf-8?B?K1FaaXBjMURLbm5HR1Y4dktTOXZVZG0yYkNIcUhFN2ZkQjh6NTBRZlgwWno2?=
 =?utf-8?B?dFJ0UUFKSzNXVlVlVUdQZzk4RjZBRWc4TTA1c2tsaTc2YWI4YnZTNG5qcHdZ?=
 =?utf-8?B?bE9kd0lUem9kUUtCL0J0WEY1dDdsV2VFL2l0MklYMjQ4eTdnNWJKYStsNUVJ?=
 =?utf-8?B?d213VWhKQTFRRzd1VGErRUg3ODZzTDBKS0Fudnk3ZjdlZTNCbXBvWW5QVUN5?=
 =?utf-8?Q?i4igrkS3QW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHFnUlYxTGltdy9wSnBtQnkwc2F2Snp5SXMwc0IrMDRENmU2VXJFR3dMWHpy?=
 =?utf-8?B?S1FIbEROMUJzNnEzOUY2NU1QMU91OUUyOUZFeFVUeGQrVVUrcC9NeTJqbGs1?=
 =?utf-8?B?b1pDQkp4eE04VWVvS1RtVEY3MHZGMzcwb1BycXNING5uZEEwYTFsQ2hvZTBP?=
 =?utf-8?B?ejRrNGRXWHdCeWkwSVpHU3hRS2s5RXNSN0wwSnZydTZCdUNkYUQ0cTJqYUZk?=
 =?utf-8?B?UHk0VXBuTlQ4RWNXYm91T2szN2Examx6aDRVcFVMaUo0TmVpRGpOMTVpcWYy?=
 =?utf-8?B?NGYwVDRVNE9LSmduVExEMk9wZkRtS1AvVDI5eEhEcFYzU3p0anNPZjhmN29Q?=
 =?utf-8?B?TERXcDJuOUhxOHAwNCtzUkNlNDVtRFAyTCs2MXF5V0V4OTdKa0ZtaVhjK3VW?=
 =?utf-8?B?c2hjYWpaN0JPNnFGa3l4Y1dKc0kxaXBHZ2FZVm8veG9JOERwdXVQS21ta0V1?=
 =?utf-8?B?Mk01dUt0dXZTRzlkcmREY09tOUd0T1Ezbml5S1FIYjd4ZE5ZT3BHMXNVMDJn?=
 =?utf-8?B?aE5VVEhnd0Mwcm9VdUg2b09NN1ZXcFF5eUVUa0d4U1NYT0k2M2Z5S2I2UDc5?=
 =?utf-8?B?eDRMcncwVUsraWI2NVFpeGlkN0M5OUxaY0FCR3BTRTZuUmJHV0VRSGZ5WXpp?=
 =?utf-8?B?Qk5rVnBPYkZqTXZGbDZUMUtTcS9EbitzNXlRRHFNU2M0SHhONkxvRktZN2h1?=
 =?utf-8?B?cG5kaUdNeSt5TXlkS3kwa2xTNE1jSlg4VDMrZE1sUUpWRzV1YXcrdE5pRVhv?=
 =?utf-8?B?VmZOb1B5RWlWamZENHlxV3ZPKy9EM1pOc3JHOGFnM3NFbXJqdFBNazdBUEgz?=
 =?utf-8?B?ekNUVnBtYjRRdFdQRDE5TGw1ZWZRQ0dlZzBrb1c4cDhmN1FLTE4vd25XdFRk?=
 =?utf-8?B?YmpYcHlYeC9KMVFHVmhJNWV6UGsyZFFUUVRzUjhtcTV0VWU1UWpXVHhYS0JY?=
 =?utf-8?B?UExocGJPOFFmTUl4czdNSkhnU3p6cEp0OXorS2IzdG04UHB4T2g3aGRRRXhQ?=
 =?utf-8?B?UkoweVdCd2xhQ3A3SU0zbGE2bERJeHFwS0NmKzlSYmpJMjlubGdpUTVNblJm?=
 =?utf-8?B?YWRJaUM3QklUd0dQWnZnT080ZEhNeE5hVFpqZXBVMEQ2YUxscEZvUXczdnk3?=
 =?utf-8?B?QmZ5TmV2ZUhrRHRNZHVmZDJ6LzFicDZ5UGo4aVRtaVA5V1VUZnFUQVlPYjB6?=
 =?utf-8?B?LytUd21IdjF1dkJpTkdnSU1WQmY4NlN0QTFGbytBbmdVcFpSWTJEYmJzVWlF?=
 =?utf-8?B?YjBPdnB3cEJ6UnJaajhxQXFaaGd4a3IyRFlzSVBSTWJSOXdVK1JjWnpIQk1C?=
 =?utf-8?B?bTVabVF4Z3luSTErQW1vYU8vRWlUdS9ESzlUQTlBdHJiaFV5YXY4WHhTYXJw?=
 =?utf-8?B?L3ZaNzR6aFdEZHd0VkFGMUYzOStYVjFYZEN0UjJsREw4RnErMThiTlYrZTMy?=
 =?utf-8?B?RDRONXF5TC9RZFpOTFJJNHhTQmdZc0dlSU1lM0Q3WGFCL2FEYm9wZWFVeHJE?=
 =?utf-8?B?OEZLbG5hc1EyRWxUOXVqbWNBdFNVQ3BYeGdwNHU2dnNSZGc1cW9rbFVJNkkw?=
 =?utf-8?B?dUdoMFQ1NUZRMTJCWEwxRUdsYzJ4Njl4bjVNTU5Ndk05Tk50eTJtQ0RkcUEy?=
 =?utf-8?B?L0VhcXJZall6U01ONGEvTzFIREZIajZrN244WHc2bXEyckNjN2pxbjJiZVMz?=
 =?utf-8?B?ZzkwaEU5UlBYcDJYeEF1eENBU3doejY1dGRZWE5qR1Z0aWFFciszTmNNLzlQ?=
 =?utf-8?B?VEFwa3NqL0FTVnYzYXdnT2JMNGtyRzk5QXZUTndrZ2VxZ0tnaTEyTnNCOXIw?=
 =?utf-8?B?OTZ3YWIyN1E3cEJzMzNOb1JLRGhrOHJDWWsxS0dBOWFkMWREL3VvaVEzWXFL?=
 =?utf-8?B?YThxUXMva0RjMC9qV1oreDBYZDZySkx2QTVjTmV6YVpZV1BWazlkc3pKNUsx?=
 =?utf-8?B?OXBpREpEYit1OEhlcm4zUnZhK3MxVXMwNmJndkpLR0d0bmtoMTN0dVNlSllM?=
 =?utf-8?B?ZGtZak5qNy9QUXc0WXNxc1hsSGVkczJ6OVZqZStGR2JpOVozRWQ0NGtyZVdo?=
 =?utf-8?B?NVNHYVd1dTA0MC9GdVIzR1p1bWxIQUtwYXVFaFFuT3hadDIyNGVJRmxycU5j?=
 =?utf-8?B?R2diQ2VsdWZuZGxkVGRZMERpMFYwdGErSEZ6d3lmbUYzOWdqKzI3U3NKN2V4?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 08e53EpblpJ7+r2JbJLpMZOocRzfEN0pSOOeKjhcLzYIBVauwyryovitYKUN6DCh1yYcDxEKTpSfhakWkAD7GKe4CU6MHz6WVxJa2nMxfg7oTqDfGxb62Bop87Tsq94LVIhayuiEY/liFqAvIFdMHdgrOOquNANR6XKJsV1Jpfar61N8vdj4JFsheEhnvXLaTXrdsT9A/Nu3rBFHYN6OS//jH/h00ixhN56QjpN1bNApv1ZxRkotYobderwKzbKzh3IdGe5Up0ZYoOvd2nLUcytb6Ort4VuNePdqnBx5IF8/RDp8Z2nrOzvBbsXVzUN0P1hs5NJnZjftlhJbxo4n+9mUASFi0tiialPLI1WlS9l0G1TrgoL3VzIdDWJS+24WnAULHp/yAsHJuOoFOlQF9Rl3DHClIu1YIrKHH/pk/5/X5Wk/s3Qp9vTIemxm5XVpPNVXkl+XZOEqj6RVzHpIvM9Qc4CfKA3OyRTJXXEMrSn7zwHBEYHU9n55UrvMIrZivQszsuYbasW1ZwubFuLw7URgPLyQ7jcSSBPhxLspcTcn0/zGcBxwSYnoJ10TxEyL6WgXho420Y6V+YfVIb8FKFncyAsc7tKOM54QbRCbrWc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806479ea-57df-43c4-2ff7-08dd8e5b684c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 18:09:00.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJsAHBAiyPwq1GTVif26qEBidbpoc1Dl9RYGHcx0Ip1lUjeCSqcaORFSgvYWI+ViLS+JpPgWcbh326Pe3AyEwsyVumTLkjVnQpyTYCme41I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7977
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE2MSBTYWx0ZWRfX2ksNkl2bDU37 L8i6+mgNB566mDSQz8K+AtnG/mFlxTgE5FuvLkTDOCbB2r+VSeHJEOP91iXYqR+jblP7vXOBYBR IwqTMk2jyZjZpL9cofKgks60IcJHcJ6sddFtvEkxW2CLULsTb/Ok7H9nHm6lKPb5z6+0iQYEyFP
 grYH5rKNe/AfMGJgtyTR3N0fvlEWjsUS6I64gr7LRUMy3ZcbUb5snV+EeLy3klnATGzka+Tyhpg xbJq5XtvW3srz9snzTU6eO10P6voUbG+EBIdKhidEMv946D7yOR+l47YE7v04AiQsNk8eJLKNQx aJUWaeunm+UCAjAQB/Lqll5tZZjqcgykx127wwHHQ7y+8GCIe9HP4gd49BxPI16dtzuj0abk9x4
 +Sf4YrqUM9EwM9B1N1ZewYe4bXH7q9V40RbyZLb8pCofpxzn3PwtU2GlEmGujykC7FR7Fc1b
X-Authority-Analysis: v=2.4 cv=UPvdHDfy c=1 sm=1 tr=0 ts=681cf343 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=iHwBjlyiAAAA:8 a=yPCof4ZbAAAA:8 a=cm27Pg_UAAAA:8 a=FF7RMkhVkAU5Bw5vpBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uNSKXYNwxGiU6LD0JREI:22 cc=ntf
 awl=host:13185
X-Proofpoint-ORIG-GUID: Zjrapqca3hyWvqO-sshNyHU4fPL5AYcQ
X-Proofpoint-GUID: Zjrapqca3hyWvqO-sshNyHU4fPL5AYcQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_110919_154831_D33FA035 
X-CRM114-Status: GOOD (  28.29  )
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

T24gVGh1LCBNYXkgMDgsIDIwMjUgYXQgMTA6Mzk6MzVBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gV2VkLCAwNyBNYXkgMjAyNSAwOToyMjowOSBQRFQgKC0wNzAwKSwgbG9yZW56
by5zdG9ha2VzQG9yYWNsZS5jb20gd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAwNywgMjAyNSBhdCAw
OToxODozMUFNIC0wNzAwLCBKZWZmIFh1IHdyb3RlOgo+ID4gPiBIaSBKaXNoZW5nCj4gPiA+Cj4g
PiA+IEl0IHNlZW1zIG1tIG1haW50YWluZXJzIG1pZ2h0IHByZWZlciBhcmNoIGNoYW5nZSByZXZp
ZXdlZCBieSBhcmNoCj4gPiA+IG1haW50YWluZXIgYW5kIGdvZXMgdG8gYXJjaCB0cmVlLCBhY2Nv
cmRpbmcgdG8gZGlzY3Vzc2lvbiBpbiBbMV0sIEkKPiA+ID4gZG9uJ3QgaGF2ZSBhbiBvcGluaW9u
IG9uIHRoaXMsICBhZGRpbmcgbW0gbWFpbnRhaW5lcnMgYXMgRllJLgo+ID4KPiA+IFRoYW5rcyBK
ZWZmLCBhcHByZWNpYXRlIHRoZSBwaW5nIQo+ID4KPiA+IEppc2hlbmcgLSB0aGUgbWFpbiBwb2lu
dCBoZXJlIGlzIHRvIGVuc3VyZSB0aGF0IHRoZSBhcmNoIGRvZXNuJ3QgcmVseSBpbiBhbnkgd2F5
Cj4gPiBvbiwgd2l0aGluIHRoZSBhcmNoIGNvZGUgaXRzZWxmLCByZWxvY2F0aW5nIGFueSBvZiB0
aGVzZSBtYXBwaW5ncy4gSXQncyBwcmV0dHkKPiA+IGVhc3kgdG8gZXllYmFsbCBpdCBhbmQgZ2V0
IGEgc2Vuc2UuCj4gPgo+ID4gQmVjYXVzZSBpZiB0aGlzIGlzIHRoZSBjYXNlLCB0aGUgYXJjaCB3
aWxsIGJlIGJyb2tlbiBieSB0aGlzIGNoYW5nZSBzaG91bGQgYQo+ID4gdXNlciBlbmFibGUgaXQs
IGFuZCBvYnZpb3VzbHkgd2UnZCByYXRoZXIgYXZvaWQgdGhhdCEgOikKPiA+Cj4gPiBJdCdzIHJl
YWxseSBsaWtlbHkgdGhhdCB5b3UncmUgZmluZSwgYXMgaXQnZCBiZSB1bnVzdWFsIGZvciBhbiBh
cmNoIHRvIGRvIHRoaXMsCj4gPiBidXQgSSBzdHJvbmdseSBzdWdnZXN0IHlvdSBkbyBzby4KPiA+
Cj4gPiBBbmQgeWVzLCBJIHRoaW5rIHRoZXNlIHNob3VsZCByZWFsbHkgZ28gdGhyb3VnaCBhcmNo
IHRyZWVzIGFzIGV4cGxpY2l0bHkgYXJjaAo+ID4gY29kZS4KPiA+Cj4gPiBUaGFua3MsIExvcmVu
em8KPiA+Cj4gPiA+Cj4gPiA+IE9uIFNhdCwgQXByIDI2LCAyMDI1IGF0IDc6MTbigK9BTSBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gUHJv
dmlkZSBzdXBwb3J0IGZvciBDT05GSUdfTVNFQUxfU1lTVEVNX01BUFBJTkdTIGZvciBSVjY0LCBj
b3ZlcmluZyB0aGUKPiA+ID4gPiB2ZHNvLCB2dmFyLgo+ID4gPiA+Cj4gPiA+ID4gUGFzc2VkIHN5
c21hcF9pc19zZWFsZWQgYW5kIG1zZWFsX3Rlc3Qgc2VsZiB0ZXN0cy4KPiA+ID4gPiBQYXNzZWQg
Ym9vdGluZyBhIGJ1aWxkcm9vdCByb290ZnMgaW1hZ2UgYW5kIGEgY2xpIGRlYmlhbiByb290ZnMg
aW1hZ2UuCj4gPiA+ID4KPiA+ID4gbW0gbWFpbnRhaW5lcnMgbGlrZSB0byBnZXQgY29uZmlybWF0
aW9uIHRoYXQgdGhlIGFyY2ggZG9lc24ndCByZWx5IG9uCj4gPiA+IHJlbWFwcGluZyB0aGUgVkRT
TywgVlZBUiwgb3IgYW55IG90aGVyIHNwZWNpYWwgbWFwcGluZ3MsIHNlZQo+ID4gPiBkaXNjdXNz
aW9uIGluIFsyXQo+Cj4gRG8geW91IGhhdmUgc29tZSBkZXNjcmlwdGlvbiBvZiB3aGF0IHJlbWFw
cGluZyBpcyBkaXNhbGxvd2VkIGhlcmU/ICBUaGVyZSdzCj4gbm90IGEgdG9uIGluIHRoYXQgcmVm
ZXJlbmNlZCB0aHJlYWQuCgpBbnkgcmVtYXBwaW5nIG9mIHRoZXNlIHNwZWNpYWwgVk1BcyB0aGF0
IHdvdWxkIGJlIGRpc2FsbG93ZWQgYnkgbXNlYWwgdGhhdCBpcwpiZWluZyBwZXJmb3JtZWQgYnkg
a2VybmVsIGNvZGUuCgo+Cj4gV2UgcGxheSBhIGZldyB0cmlja3Mgd2l0aCByZW1hcHBpbmcsIGlu
Y2x1ZGluZyBzb21lIGFsaWFzaW5nIHRvIGhhbmRsZQo+IGRpZmZlcmVudCBWQSB3aWR0aHMgYW5k
IHRleHQgcGF0Y2hpbmcgKHZpYSBwb2tlIHBhZ2VzKS4gIElJUkMgdGhvc2UgYXJlCj4gc2ltaWxh
ciBpbiBzcGlyaXQgdG8gd2hhdCdzIGdvaW5nIG9uIGluIHg4Ni9hcm02NCBsYW5kLCB0aG91Z2gg
c29tZXRpbWVzIHRoZQo+IGV4YWN0IGZsYXZvciBvZiB0aGUgdHJpY2sgbWF0dGVycy4gIElmIHlv
dSd2ZSBnb3Qgc29tZXRoaW5nIEkgY2FuIGxvb2sgYXQgaXQKPiBtaWdodCBzYXZlIG1lIGZyb20g
aGF2aW5nIHRvIHJlYWQgdGhvdWdoIHRoZSBtbSBjb2RlLi4uCgpUbyByaXNrIHNvdW5kaW5nIGdy
dW1weSwgYW5kIGl0J3Mgbm90IHlvdXIgZmF1bHQgb2YgY291cnNlLCBidXQuLi4gdGhpcyBpcwp0
aGUuLi4gZmlmdGg/IEFyY2hpdGVjdHVyZSB3aGVyZSBzb21lYm9keSdzIGVuYWJsZWQgdGhpcyB3
aXRob3V0IHNlZW1pbmcgdG8KdW5kZXJzdGFuZCB3aGF0IHRoZSBmZWF0dXJlIGRvZXMsIGFuZCBJ
J20gYSBiaXQgdGlyZWQgb2YgaXQuIEFuZCBldmVyeSB0aW1lIGl0J3MKYmVlbiBfbWVfIHdobyBn
b2VzIHRvIGNoZWNrIDopCgpBbnl3YXksIEkgZ3Vlc3MgbGV0IG1lIGdvIGNoZWNrIGFnYWluLgoK
U28gaXQgbG9va3MgZmluZSB0byBtZSAtIHRoZSBpbml0aWFsIG1hcHBpbmcgdG8gbW0tPmNvbnRl
eHQudmRzbyBkb25lIGJ5Cl9fc2V0dXBfYWRkaXRpb25hbF9wYWdlcygpIGluIGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28uYyBhcHBlYXJzIHRvIGJlIGZpbmFsLApleGNlcHQgd2hlbiB2ZHNvX21yZW1h
cCgpIGlzIGludm9rZWQsIGJ1dCB0aGF0J3Mgd2hlbiBfdXNlcmxhbmRfIGRvZXMgaXQsCndoaWNo
IHRoaXMgZmVhdHVyZSBzdHJpY3RseSBkaXNhYmxlcywgYnV0IHRoYXQncyBmaW5lLgoKTm90ZSB0
aGF0IHRoZSBwYXRjaCBzaW1wbHkgaW5kaWNhdGVzIHRoYXQgdGhlIGFyY2hpdGVjdHVyZSBfc3Vw
cG9ydHNfIHRoaXMKZmVhdHVyZSwgdGhlIGZlYXR1cmUgaXRzZWxmIGlzIGRpc2FibGVkIGJ5IGRl
ZmF1bHQgYXMgaXQgYnJlYWtzIGEgYnVuY2ggb2YKdXNlcmxhbmQsIHdoaWNoIGlzIHdoeSBJIGlu
c2lzdGVkIG9uIGl0IGJlaW5nIHB1dCBiZWhpbmQgYSBjb25maWcgZmxhZyBmb3IKdXNlcnMgd2hv
IHJlYWxseSBrbm93IHdoYXQgdGhleSdyZSBkb2luZy4KClNvIHBlcmhhcHMgSSBjYW4gbGluayB0
byB0aGlzIGFnYWluIGluIGZ1dHVyZSwgd2hhdCBJJ20gdGFsa2luZyBhYm91dCBpczoKCi0gQW55
IGluc3RhbmNlIG9mIHRoZSBhcmNoaXRlY3R1cmUgY29kZSwgTk9UIGF0IHRoZSBiZWhlc3Qgb2Yg
dXNlcmxhbmQKICAod2hpY2ggd2UgZXhwZWN0IHRoZSBzZWFsaW5nIHRvIGJyZWFrKSwgYnV0IGZv
ciBpdHMgT1dOIHB1cnBvc2VzLCBmb3IKICB3aGF0ZXZlciByZWFzb24sIG1vdmluZyB0aGUgVkRT
TywgVlZBUiBvciBvdGhlciBzcGVjaWFsIG1hcHBpbmcgYXJvdW5kIGluCiAgdmlydHVhbCBtZW1v
cnkuCgotIFNvIHlvdSdkIHJlYWxseSBuZWVkIHRvIGJlIGRvaW5nIHNvbWV0aGluZyBfd2VpcmRf
IGZvciB0aGlzIHRvIGJlIHRoZQogIGNhc2UuIEl0J3MgdW5saWtlbHkgYnV0IHVudGlsIGVhY2gg
YXJjaGl0ZWN0dXJlIGlzIGNoZWNrZWQgd2UgYXJlIGJlaW5nCiAgY29uc2VydmF0aXZlIC0gc28g
YXMgbm90IHRvIGJyZWFrIHRoZSBrZXJuZWwgKCEpIC0gYW5kIGRpc2FibGluZwogIGFyY2hpdGVj
dHVyZXMgdW50aWwgd2Uga25vdyB0aGV5J3JlIHNhZmUuCgotIFNlbmRpbmcgYSBwYXRjaCBzZXR0
aW5nIEFSQ0hfU1VQUE9SVFNfTVNFQUxfU1lTVEVNX01BUFBJTkdTIGlzIF92ZXJ5CiAgZXhwbGlj
aXRseV8gc3RhdGluZyB0aGF0IHlvdSBoYXZlIGNoZWNrZWQgYW5kIGFyZSBjZXJ0YWluIHRoZXJl
IGFyZSBfbm8KICBwcm9ibGVtc18gd2l0aCB0aGUgYXJjaGl0ZWN0dXJlIGRvaW5nIHRoaXMuCgpT
byB0aGlzIGlzIHdoeSBpdCdzIHF1aXRlIGFubm95aW5nIHRvIGhhdmUgcGVvcGxlIGVuYWJsZSB0
aGlzIHdpdGggYSBjb21taXQKbWVzc2FnZSBsaWtlICdlbmFibGUgbXNlYWwgc3lzdGVtIG1hcHBp
bmdzJyByYXRoZXIgdGhhbiAnSSBoYXZlIGNhcmVmdWxseQpjaGVja2VkIHRoZSBhcmNoaXRlY3R1
cmUgY29kZSBhbmQgdGhlIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBtYW5pcHVsYXRlIHRoZQpWRFNP
LCBWVkFSIG9yIHNwZWNpYWwgbWFwcGluZ3MgYWZ0ZXIgZXN0YWJsaXNoaW5nIHRoZW0sIEkgaGF2
ZSBhbHNvIHRlc3RlZAp0aGUgZmVhdHVyZSBpbiBwcmFjdGljZScuCgpJIGZlZWwgbGlrZSBhbnli
b2R5IHNldHRpbmcgJ0FSQ0hfU1VQUE9SVFNfeHh4JyBzaG91bGQgLSB5b3Uga25vdyAtIGhhdmUK
ZGV0ZXJtaW5lZCB0aGF0IHRoZSBhcmNoaXRlY3R1cmUgc3VwcG9ydHMgeHh4LiBCdXQgbWF5YmUg
dGhhdCdzCnVucmVhc29uYWJsZS4uLgoKPgo+IGFuZCB5YSwgd2UnbGwgcGljayBpdCB1cCB0aHJv
dWdoIHRoZSBhcmNoIHRyZWUgb25jZSBvbmUgb2YgdXMgY2FuIGJlCj4gY29udmluY2VkIHRoaXMg
d29ya3MgOykKPgoKVGhhbmtzISA6KSBZb3VyIHNrZXB0aWNpc20gaXMgYXBwcm9wcmlhdGUuIEJ1
dCBJIGRvIHRoaW5rIHRoaXMgd2lsbCBiZSBmaW5lCmZvciByaXNjIHYuCgpJJ2QgaWRlYWxseSBs
aWtlIHRvIGhlYXIgZnJvbSBzb21lYm9keSB3aG8ncyBjaGVja2VkIHRoaXMgb24gYSByaXNjIHYK
c3lzdGVtIHdpdGggQ09ORklHX01TRUFMX1NZU1RFTV9NQVBQSU5HUyBlbmFibGVkIGp1c3QgdG8g
YmUgZG91Ymx5IHN1cmUuCgpUaGFua3MsIExvcmVuem8KCj4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gPiA+IENjOiBKZWZm
IFh1IDxqZWZmeHVAY2hyb21pdW0ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2
L0tjb25maWcgICAgICAgfCAxICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIHwg
MiArLQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4gPgo+ID4gPiBQbGVhc2UgY29uc2lkZXIgdXBkYXRpbmcgZG9jdW1lbnQgYXMgcGFy
dCBvZiB5b3VyIHBhdGNoOgo+ID4gPiBmZWF0dXJlcy9jb3JlL21zZWFsX3N5c19tYXBwaW5ncy9h
cmNoLXN1cHBvcnQudHh0Cj4gPiA+IERvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tc2VhbC5y
c3QKPiA+ID4KPiA+ID4gU2FtcGxlIGNoYW5nZSBpbiBbM10KPiA+ID4KPiA+ID4gPgo+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+
ID4gPiBpbmRleCBiYmVjODdiNzkzMDkuLjNjYjBiMDVlZWY2MiAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+
ID4gPiBAQCAtNzAsNiArNzAsNyBAQCBjb25maWcgUklTQ1YKPiA+ID4gPiAgICAgICAgICMgTExE
ID49IDE0OiBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzUwNTA1
Cj4gPiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkcgaWYgTExEX1ZF
UlNJT04gPj0gMTQwMDAwCj4gPiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19MVE9f
Q0xBTkdfVEhJTiBpZiBMTERfVkVSU0lPTiA+PSAxNDAwMDAKPiA+ID4gPiArICAgICAgIHNlbGVj
dCBBUkNIX1NVUFBPUlRTX01TRUFMX1NZU1RFTV9NQVBQSU5HUyBpZiA2NEJJVCAmJiBNTVUKPiA+
ID4gVGhlICJpZiA2NEJJVCAmJiBNTVUiIGFyZSBub3QgbmVlZGVkIGhlcmUuCj4gPiA+Cj4gPiA+
IE1NVSBpcyBub3QgY2hlY2tlZCBieSBNU0VBTF9TWVNURU1fTUFQUElOR1MsIHdoaWNoIHdlIHNo
b3VsZCwgIHRoaXMKPiA+ID4gY2FuIGdvIHRvIHNlY3VyaXR5L0tjb25maWcgc2VwYXJhdGVseS4g
SWYgeW91J2QgbGlrZSwgcGxlYXNlIHN1Ym1pdCBhCj4gPiA+IGZpeCB0byBtbSB0cmVlIGRpcmVj
dGx5Lgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzdFQjA4N0I3
MkM0RkJERDMrMjAyNTA0MTcxMzI0MTAuNDA0MDQzLTEtd2FuZ3l1bGlAdW5pb250ZWNoLmNvbS8s
Cj4gPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvM2RlNTU5ZDYtYmUxOS00NGJj
LWJhOGYtNGM1MmQ0YmNhNjg0QGx1Y2lmZXIubG9jYWwvCj4gPiA+IFszXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvNjQ4QUIzMDMxQjU2MThDMCsyMDI1MDQxNTE1MzkwMy41NzA2NjItMS13
YW5neXVsaUB1bmlvbnRlY2guY29tLwo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4gLUplZmYKPiA+
ID4KPiA+ID4gPiAgICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0sg
aWYgTU1VCj4gPiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19QRVJfVk1BX0xPQ0sg
aWYgTU1VCj4gPiA+ID4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19SVAo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvLmMKPiA+ID4gPiBpbmRleCBjYzI4OTVkMWZiYzIuLjNhOGUwMzhiMTBhMiAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPiA+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvLmMKPiA+ID4gPiBAQCAtMTM2LDcgKzEzNiw3IEBAIHN0YXRpYyBpbnQg
X19zZXR1cF9hZGRpdGlvbmFsX3BhZ2VzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4gPiA+Cj4g
PiA+ID4gICAgICAgICByZXQgPQo+ID4gPiA+ICAgICAgICAgICAgX2luc3RhbGxfc3BlY2lhbF9t
YXBwaW5nKG1tLCB2ZHNvX2Jhc2UsIHZkc29fdGV4dF9sZW4sCj4gPiA+ID4gLSAgICAgICAgICAg
ICAgIChWTV9SRUFEIHwgVk1fRVhFQyB8IFZNX01BWVJFQUQgfCBWTV9NQVlXUklURSB8IFZNX01B
WUVYRUMpLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAoVk1fUkVBRCB8IFZNX0VYRUMgfCBWTV9N
QVlSRUFEIHwgVk1fTUFZV1JJVEUgfCBWTV9NQVlFWEVDIHwgVk1fU0VBTEVEX1NZU01BUCksCj4g
PiA+ID4gICAgICAgICAgICAgICAgIHZkc29faW5mby0+Y20pOwo+ID4gPiA+Cj4gPiA+ID4gICAg
ICAgICBpZiAoSVNfRVJSKHJldCkpCj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQ3LjIKPiA+ID4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
