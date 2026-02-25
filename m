Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB3F55434
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 02:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDBxZRNi3QOoLGx1ntsUx0CvdaW5WlBV7RwKCd/B+Yo=; b=QfILELFTXLAI2/
	rlP+bKJ2GJ1eKeoD4FaOQU7OHU6AQnuHXTFGPVWfJOj4GPhBXOZmB56QcehXWWj9OSZrAiRdA1Ndy
	GLRknyWakI51oVrwWBqIj5MZC5uN+vL0n5Ek4VceZPjOhAUmE+/cGyUCyA8rj+1YrX0wZ9KsSyIPT
	pNlhu6WJtoWgRbK4Z/B7cmpawr67yhy6Cuzw4eAj2JfaY3PYEQM+UoKN9iSUdSMoBFvNCAGc08zB3
	7keTWzDXkLKPJNJm21hyKHZX52c0MNXTpqXSGKF0MeEwS+3CuLvJ6TCT8rGho1owowCazHZI3IlVi
	oXeziK6WcETau+5FtWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4RB-000000034pv-1LAd;
	Wed, 25 Feb 2026 02:15:41 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4R7-000000034pV-45r4
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 02:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7adorKfjCfKAO2S3+08w0fzgBh/07oQEt6A2mWEb74idOPJpTE6JrZMupfyp/+cEU886tsgU6022ZZNDeFMPoRjCadYVlGCkCPlb8WPXa8NDW52NS4n6lnpjNGxMmNbVM2b4Ai5xGmmrg8TWDOq/jXsycgGQT6JOEUY8mVFjDaLohzgvA55zMBUL40CeDh64liwQre6mQeFH41wHbH+28k3/u89ZZqzd/s9y0LrL1ogyS1zYVd5G+fvcXghliHgvwjLHtSwhODhBLEpdd2glMma+GDfnikvVFZaRLqDO+8DOAL+Ne28G/1kKDbSSnZ+kud4LFbvPEsJJXkiqqZrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nO2mDJN2Hde2T/EVznUsoXL43PXu3gxCFVTCyg950p0=;
 b=POT5WnSaFUJyhj+Ps3DN23QPZQ/74znVAhpdodlDDvqJ9KWx5UllsUOABVO9bzM2wEd8kRxHjlDbjc4dvtWJ33YLQfvR7vMwvDdqDw9Bm1cJu4wqfTPkj0gHF2hsnIxuLcjtuT+2JaMY4RD6jiQWLpHZwQiMfkWf1MiLOMo9s2QJo2f9qkFqm25mbFO78+fhXhpC5wTBPGzp3GnqhVLOtKfp8gZCefRh59D3KWl5b1vk2EgjsvipZrbjGXk7DUVImr3LRUpJUebMdosK+dYPxjOvIJr46oiXIUgDTlpiIhhbNswkGGi+miybXcy7KT3BWi1I0E1OfRSf94mAQh+GVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nO2mDJN2Hde2T/EVznUsoXL43PXu3gxCFVTCyg950p0=;
 b=R7YrNO1y2iqLBXhg522lt8+dQbZ9KVOju5bQQ5rwH1jk9GCKylg5UNQx0QiSJqhqHXmor1GbIXqZcHP8MixtQz3qyOGMHpSGzPYRFWhxwpZwKa4RTCk4WLq4Cc7YbdbdHxZywxhei2prIwcdsc7sQhaXaY+ij+sie/7HgVx5ajHOEdHrwPwKn/Dlcu1az4XugEi526w8C2gHxmDr/uhaiqGdXnxl2cRgMBRPqBcwdUKYlY8AlH9ijy71eF+Anc5MTE4nXfi+Eki/p4RnOVpdXj32bIS/f1gpeze0kSky7jv01O66RgkP47ibOgCgg06d05HpdvEpiTMtOa8oaQV2aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 25 Feb 2026 02:15:32 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 02:15:32 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Ron Economos <re@w6rz.net>, "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, jackmanb@google.com, jane.chu@oracle.com,
 hannes@cmpxchg.org, willy@infradead.org, muchun.song@linux.dev,
 osalvador@suse.de, sidhartha.kumar@oracle.com, vbabka@suse.cz,
 claudiu.beznea.uj@bp.renesas.com, Mark Brown <broonie@kernel.org>,
 akpm@linux-foundation.org, pjw@kernel.org
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
Date: Tue, 24 Feb 2026 21:15:30 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <04EC5689-3354-4139-9911-A3796C772B28@nvidia.com>
In-Reply-To: <4b219cd0-9391-4edb-83c0-b6a1c60d0790@huawei.com>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
 <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
 <1AB3E96B-F4CA-4B00-9078-2AC20A1A60DC@nvidia.com>
 <272A58BA-445F-46F9-8DAB-D82E43D7771A@nvidia.com>
 <4b219cd0-9391-4edb-83c0-b6a1c60d0790@huawei.com>
X-ClientProxiedBy: BLAPR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:208:32d::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: e9de996e-a4c8-45ec-1247-08de7413c101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjBsZUFFNDhMTklpRXU3VXRnM1hicklsVmVuby93UEhUY1loUWtMTzJCZ3Zj?=
 =?utf-8?B?MnhDMVZlVHdmVTZDVWZVQ3RKWjFnMFNTcWhLSUZsQ1BMcDVUWEsremNEZ254?=
 =?utf-8?B?d3hMUTZoMVVmR1NBL1hWSVN5djErWGVaRldvZmtrRkk2LzRVeFFnaWhpR3ln?=
 =?utf-8?B?ZEJGVmNhV0hnQlgwQWI0NVhDVWx4UWJYU2JxOGNuMUh2YWxER1RYNUR6ZitR?=
 =?utf-8?B?MzJSMXROeUFBWWUyYjNWWVZRdnRwVy9scmE1RnRvMmdkTmVQOG1vVGZIK3I2?=
 =?utf-8?B?dTVNY2VudHFYNmhpRHM2MVozNUZrT2RiLzQ3TU5kQ2NVVUhVbEVkNVRvK1Yv?=
 =?utf-8?B?T2hnLzJVVGdXYXRRcFVra0pZQlA5ODQ3Tmp0am9kK2tuOUhZZXZoWFlCSnpt?=
 =?utf-8?B?U0c1TXBaNXFwaFc0amJBMThBYWMydzNVeVViZTBOVW0zL2dBWGlCdmNZV2dW?=
 =?utf-8?B?Z2RmMDZtVHc1U094SnNxS2ZhbGRtNkZOTnlyUFprREZsZjZMeDRXYXc1Kysv?=
 =?utf-8?B?YnVEaFIvT2UzdExjWlhIYXA4ZnJCV2ZQVW1BUlQ5Ukg2bWtBZmJMRXE4YTEz?=
 =?utf-8?B?MUU4R1psM1lmdVJzZUxnMzhCLzJHZDA0Sm9YMEhlMm4wbnljL0Nvd0RxSkUw?=
 =?utf-8?B?R3V0RFRBM3VxaStlWktsUTNoOTZ4T2dFYTBISDU3aWxlRklHai9EMjZka2Vz?=
 =?utf-8?B?NW1zS3MyT29qSDRReVF5T216eDh6cGNNRlgyL0wrbmF4SkJPMGpJVUdmNUdi?=
 =?utf-8?B?NEFiUnNHSXl5QVdPMnMwdzVheEVtby9QU3NIdkVxWDlCdy9hUURTaWRKcUpn?=
 =?utf-8?B?NDFUb1ZuZi8zWHJHRHBHMVdaS3R1RDJFTU9wWExsS3ZXTE9ra0Q2ZzExYmli?=
 =?utf-8?B?ME41cUdNV1pFd3dCTHJXaG9nbGl4SzJxRE83SWhlM2l5MnduQlFFV2FJcHVR?=
 =?utf-8?B?Vm01V09WWnIrdm83WEtrV0J4UVliWmF4aUoyNWVFZHFCZWJMN1RlTmxIWEJ1?=
 =?utf-8?B?UEtXWnBkOW9vTUZ0dGR3aHN2UC8yM3VRVDlwYno5dlkzSTRpbVhXaW5QYUZY?=
 =?utf-8?B?dWt3OGJCdzlNZU9UR3J1Sk4yWGROM3RYNUFieGNCUmhQQ3IySVJTQUhNVGtE?=
 =?utf-8?B?d0J6aUdtUDRGUG9va0RGNjZHOVNEUTI1ZzJzOVl1bWNLSEtDaUxjbWdFbnZL?=
 =?utf-8?B?c3RCWk9DY0ZLd1htSUZBQWw5THhETlVuT3NsampWT0J4dTBtaXpqVytJUGFY?=
 =?utf-8?B?R2hUMm9TOWozdVRrbzhEUnhob2NzRWRUdnoxRkY1VE1DNGttcHBzQjlQWlNu?=
 =?utf-8?B?ajVpY1ZTMjBOeVgzKzd2akdsQlhSektjaWppbmJ0WmxSdkFqTnM1c2xUVmpw?=
 =?utf-8?B?VWlBSzlrR3ZldkxoVW9BL0ZhM05oSnlUb0tZNzZJaVpkMHRsWklqb1lNWlI5?=
 =?utf-8?B?ZHQvVkRhVUFob0Rpb0EvUnpOMjQxYWZTK1laczA2aHRwM3FKUE5ZRjZDTVNt?=
 =?utf-8?B?UEZ1QUlpdVlhWG5nZ0UvUStWSlJmaDRMckszeWREVjFxTjd3dGJ4ZEJ0aE1z?=
 =?utf-8?B?SFo3ZS9NRzRpSmZSaDhJNk5PN2xJS2QyOExvWCtNbUhKcnVmYzlibHpVaHBq?=
 =?utf-8?B?YUxMR1FrbEZyZUx3RzRJNVYzWDg0OHU1Mk54bXN4cXhLQVlRQ1NEZnRmMUh6?=
 =?utf-8?B?d0VUdVF2b3ZwN1MzNjMzR2ZhUnJTdGNYS21VdU9CUTNvNGIxcXZBWWZtVVN5?=
 =?utf-8?B?SFFUL1VMK2YwNENiOWJQbSsxQjRMMW1DS2N5OEtkRC8yYzZYamRacE0yb1Vm?=
 =?utf-8?B?RHErSkRnOXlKVjdRZ2hSYkNUWW44cFh1T2NLZkN3SzcxZ3pycW1SblBGOURH?=
 =?utf-8?B?d0lHYm03eWMvdWdNZktaOHhkVHBWeDVJVWduMDd3YTBvLzAyeHNEbW5XdmxS?=
 =?utf-8?B?a2l5K1NEbmJ2elJrME5Ea3ZnTU1yRkdWVnp5WGtoY2hTMk50c2sxWklHSTl1?=
 =?utf-8?B?T2Q2ci9rblUxWll4UHYvVDhVTVNQUU9VTjBSM2xhakVRdC9TN2Jkc0o5ZVJY?=
 =?utf-8?B?MU5MOHR2TnhMTndyL2J3dVlkblFZTkpNN3JtTStiN3JFUWNTMCtQanpOUXF3?=
 =?utf-8?Q?cN/c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1BHei84ZzNES3IzYTFRQnhGNW5CVzVLYTNQZTZiMWxUQVUzdDlwZE84S1k0?=
 =?utf-8?B?aUNFTnFZUmx3UUJEM2FCTUtSOXZteG9JOStVdXN2RUF3aWgxZDdPR1V6S1hl?=
 =?utf-8?B?akc0N1RwRG01VTUrejl3S3NSVmxCNFRSWW1WRkJvOHJUMVZpZUpURGxNamxl?=
 =?utf-8?B?a3kwUTJNa3k5SjFLQTcyUFVyYURKN3dBaFVpVWtMRVA0SXpUYklLMEdjY1Ft?=
 =?utf-8?B?dlhaSi9aUHdnVXA1WnpCTmNCUkFucDdKZzBiY0FJWXYxYU9qbk5EOTVjSFhx?=
 =?utf-8?B?Vm1NeXc4WGRmWkNMTXlYNnRhRFlreEsvQW8zRzN3SHM4ZXRQczBYR3NHcmpt?=
 =?utf-8?B?RHlXOUVWS3FGdWl1ZGNWK2Z4Y1ZpV0ZZRGppeHQvd2xYSTA1OUFiU2JDVkd0?=
 =?utf-8?B?RW9DaFYyVlRFcWszZWRCMUgxcE5CMDNBT0E5ZVJXYzNpNXJ4YkdsR1FZT3dJ?=
 =?utf-8?B?OFlBM0NJeE0wMUFIZVJYT0YwRzRjUVNOeVdHQm54QlE4b2U5MCtwc3E4K00z?=
 =?utf-8?B?VGlXaXV3Ynk3K3NtclE1WEpoU1BIUVRBcUx1TzdHWC9EbnVGT3ZCVWxabFMx?=
 =?utf-8?B?bnhxQjYzN3FmdyttTkx0WmhiM2U2QjhYdHM1MDB4Rit5YnRnMjNZUGhUbDZo?=
 =?utf-8?B?TncweFhhYi9QWVJpVlVkMVhka1UySW95SXFPNzlHenNSd2ttcjJhdkxaK1B5?=
 =?utf-8?B?SWZXUHdOSGxSZjA3amNxZVZGZy9tNUZ2T2R1NXliN2xKMitEdFpoMUpnM3Iv?=
 =?utf-8?B?OW1qd2t1ZE9ESUtCMEFWYnJzTUcwMVlKR3FQNGRHd1l1TmY3RGN4OUZ0aHVV?=
 =?utf-8?B?WFVWWk1qbkQ3RDhYUjRhUGtIbjJrREIweTkzQ0hQWXRZWUwyWDdIK1oycWd0?=
 =?utf-8?B?S3ljTHRVSHBYUHdZRlYvNXExSU9ybE1raEdhVHNZVGhXZUcrNGRhamp4RlBP?=
 =?utf-8?B?dHBaeHRaT0srekJmMWRBV3Z1M241UDJRSlB1RkZ1cGducWpvbDYwZVJ0bTE3?=
 =?utf-8?B?VDFzZDMvUDBJSG9yUWxPSjBXRFcwZzZMd0Y1cFdvQU9mYWFIeEhSS0pKS1h6?=
 =?utf-8?B?ZzkyQ3VuSlZOcDk2Szg2TjhQUmdRbkluMHh1WEhGd1FXY1g4TWpyQzgvMm9i?=
 =?utf-8?B?NEw4L0lzejc4djRIdUwzYXNCWFNUek1hMVdNU3FINXpvY2luMDdKaEkxeXRm?=
 =?utf-8?B?R3AzdUZzSjNEVzIwK1lHYllYbExQOW1yaWFwWjkwcG5wa0Z5NEcySDJScUVw?=
 =?utf-8?B?dnk0b0tLSmF4L3VGQXlvVkoyMjBGTXM0YlJEN20zcVJRV244TlNRd2hFQXZY?=
 =?utf-8?B?Q240c0EvSUxwN3I5b09ocklyWnZUQXZKSlBrbXhJcHFwZWlra1pkN3NVSkNF?=
 =?utf-8?B?bUpQZEhFTnVhOEZjTWJrMDFyc3Rhalg2UkNtdWxHNXZxdEYrUmh4cnAxZ1cy?=
 =?utf-8?B?ZnJpeGhJY2YvUExlM2dISWJWL01xQUxRckswR0E3SWdZaUlUaVg5M2dHU0FV?=
 =?utf-8?B?cjlVTnFsd0RKNUtweWZnTVlRVVlVWm9sY09ieFdGUWtJVGM4NmlPbTZpZEpk?=
 =?utf-8?B?WTVaU0RGMndNSHcvc1JKTlg2YmlReU9Md0RqOTEyN255cHROL2F4NkRKMkxi?=
 =?utf-8?B?dzlBRlFNVS82elpBZWg4U0tXWVllRmlLbE9zOW5nWHNKR0NEUHdLYjZhTmJV?=
 =?utf-8?B?QnNnUC9sQ1FKQm9DTWpYazg2eTFOa2pNd3kvL3k2VXRxSkFWdUt0Ty91OGpt?=
 =?utf-8?B?ZWdwTkpDQlJHUEdhK3Z2MWdHS3grZSs0VnM3TXZCaVRSMHBvZU1qMFhBekRS?=
 =?utf-8?B?U0VNVklXSVlPbGI3b2pxdEFoUkgvaE1JdklFeUUzdGF5eGg0RTBXYjFqa2w5?=
 =?utf-8?B?WE12UmZoRFRDc0pyZGhMYVJmM3dIdG44cGZGTjV0dEY3dFMvWEFzSThMMS9z?=
 =?utf-8?B?WFM1eVhEYXBZMDV3U0NYcmo1cFF6L0NZTDNFOWdlaVAwbVlSaFd3VGx2YlpN?=
 =?utf-8?B?VzBOZHBzeUhpMkJOTjZHSVF1NHpiZDBRaXQ2Wkk5QlNmeHg4bU1TcmQyQXBy?=
 =?utf-8?B?L29lK1FpendOUUJlb2pZYkRvWGlZUlVoZmUvN2grQ2tpMS94cHNQSkZ5V24x?=
 =?utf-8?B?VnZaNWhMWVdtSW5Oa0VrVmFZU1VmVmhqQWVYcklDT1p4NlVPNFBnLzZld2Q1?=
 =?utf-8?B?NlI1NFpvUVZONkdPcVhlVWFMU29vTGVHakFhNFdYb0tnTmNwand5MzlSdjhk?=
 =?utf-8?B?T3cycVF6OW1xMFVYNTB0bVlkWGRYMDg0cWxmWWZMSHdCVXA5K2g1VzZORnZW?=
 =?utf-8?Q?bqPZEdhi3WK3hOhO75?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9de996e-a4c8-45ec-1247-08de7413c101
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:15:32.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vV7f1/HsTJWrOtj0E2GKIXWclbIgd8gMK3KGnarG4p8LBngC0wftD414E0Q5R898
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_181538_030042_3B6A4725 
X-CRM114-Status: GOOD (  16.43  )
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

T24gMjQgRmViIDIwMjYsIGF0IDIwOjU4LCBLZWZlbmcgV2FuZyB3cm90ZToKCj4gT24gMjAyNi8y
LzI1IDE6MjksIFppIFlhbiB3cm90ZToKPj4gT24gMjQgRmViIDIwMjYsIGF0IDEyOjE3LCBaaSBZ
YW4gd3JvdGU6Cj4KPiAuLi4KPgo+Pj4+Pgo+Pj4+PiBUaGlua2luZyBhZ2FpbiB3aXRob3V0IG15
IGNvbXB1dGVyIGF0IGhhbmQg4oCmIGlzbuKAmHQgdGhlIGNhbGwgY29tcGxldGVseSBvcHRpbWl6
ZWQgb3V0IHdpdGhvdXQgQ09ORklHX0RFQlVHX1ZNPwo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBB
dCBsZWFzdCB0aGF04oCZcyB3aGF0IEkgcmVtZW1iZXIuCj4+Pj4KPj4+PiBSaWdodC4gV2l0aG91
dCBDT05GSUdfREVCVUdfVk09eSwgVk1fV0FSTl9PTighcHV0X3BhZ2VfdGVzdHplcm8ocGZuX3Rv
X3BhZ2UocGZuKSkpCj4+Pj4gYW5kIGlzX2NoZWNrX3BhZ2VzX2VuYWJsZWQoKSwgd2hpY2ggbGVh
ZHMgdG8gZnJlZV9wYWdlX2lzX2JhZCgp4oCZcwo+Pj4+IOKAnHBhZ2UgZHVtcGVkIGJlY2F1c2U6
IG5vbnplcm8gX3JlZmNvdW504oCdLCBhcmUgZGlzYWJsZWQuCj4+Pj4KPj4+PiBJdCBzZWVtcyB0
byBtZSB0aGF0IHNvbWVvbmUgZWxzZSBidW1wIHRoZSBwYWdlIHJlZmNvdW50IGJldHdlZW4KPj4+
PiBWTV9XQVJOX09OKCFwdXRfcGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4pKSkgYW5kIGZy
ZWVfcGFnZV9pc19iYWQoKS4KPj4+Pgo+Pj4KPj4+IE1lcmdpbmcgUm9u4oCZcyByZXBseSBmcm9t
IGFub3RoZXIgdGhyZWFkWzFdOgo+Pj4KPj4+IOKAnFNvbWV0aGluZyBzdHJhbmdlIGlzIGdvaW5n
IG9uLiBJIGVuYWJsZWQgQ09ORklHX0RFQlVHX1ZNIGJ5IGl0c2VsZiBhbmQKPj4+IHRoZSBpc3N1
ZSB3ZW50IGF3YXkuIExldCBtZSB0cnkgQ09ORklHX0RFQlVHX1BBR0VfUkVGLuKAnQo+Pj4KPj4+
IExvb2tzIGxpa2Ugc29tZXRoaW5nIGlzIHJhY3ksIHNpbmNlIGl0IGlzIHJlcHJvZHVjaWJsZSBy
ZWxpYWJseS4KPj4+Cj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzMwZGQxZWZj
LTliZDktNDY2NC05OTllLTYxMGQxODE2MDBmOUB3NnJ6Lm5ldC8KPj4KPj4gVk1fV0FSTl9PTigp
IGlzIEJVSUxEX0JVR19PTl9JTlZBTElEKCkgd2hlbiBDT05GSUdfREVCVUdfVk0gaXMgb2ZmLiBP
bmx5Cj4+IHRoZSB2YWxpZGl0eSBvZiB0aGUgZXhwcmVzc2lvbiBpcyBjaGVja2VkIGFuZCBubyBj
b2RlIGlzIGdlbmVyYXRlZC4KPj4gU28gdGhhdCBwdXRfcGFnZV90ZXN0emVybygpIGJlY29tZXMg
YSBOT1AuCj4KPiBJbmRlZWQuLi4KPgo+Pgo+PiBIaSBSb24sCj4+Cj4+IENhbiB5b3UgY2hlY2sg
aWYgdGhlIHBhdGNoIGJlbG93IGZpeCB0aGUgaXNzdWUgd2l0aG91dCBDT05GSUdfREVCVUdfVk0/
Cj4+Cj4+IGRpZmYgLS1naXQgYS9tbS9jbWEuYyBiL21tL2NtYS5jCj4+IGluZGV4IDk0YjVkYTQ2
OGE3ZC4uOTZiZTYyZWIzNzEzIDEwMDY0NAo+PiAtLS0gYS9tbS9jbWEuYwo+PiArKysgYi9tbS9j
bWEuYwo+PiBAQCAtMTAyMCw4ICsxMDIwLDExIEBAIGJvb2wgY21hX3JlbGVhc2Uoc3RydWN0IGNt
YSAqY21hLCBjb25zdCBzdHJ1Y3QgcGFnZSAqcGFnZXMsCj4+ICAgCQlyZXR1cm4gZmFsc2U7Cj4+
Cj4+ICAgCXBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2VzKTsKPj4gLQlmb3IgKGkgPSAwOyBpIDwgY291
bnQ7IGkrKywgcGZuKyspCj4+IC0JCVZNX1dBUk5fT04oIXB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90
b19wYWdlKHBmbikpKTsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKywgcGZuKyspIHsK
Pj4gKwkJaW50IF9fbWF5YmVfdW51c2VkIHJldCA9IHB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90b19w
YWdlKHBmbikpOwo+PiArCj4+ICsJCVZNX1dBUk5fT04oIXJldCk7Cj4+ICsJfQo+Cj4gTWF5YmUg
d2Ugb25seSB3YXJuIG9uY2UgYnkgYWRkaW5nIGJhY2sgdGhlIG9yaWdpbmFsIGNoZWNrPwo+Cj4g
ZGlmZiAtLWdpdCBhL21tL2NtYS5jIGIvbW0vY21hLmMKPiBpbmRleCA5NGI1ZGE0NjhhN2QuLmE3
M2EyMmQzNDIzMiAxMDA2NDQKPiAtLS0gYS9tbS9jbWEuYwo+ICsrKyBiL21tL2NtYS5jCj4gQEAg
LTEwMTQsMTQgKzEwMTQsMTcgQEAgYm9vbCBjbWFfcmVsZWFzZShzdHJ1Y3QgY21hICpjbWEsIGNv
bnN0IHN0cnVjdCBwYWdlICpwYWdlcywKPiAgewo+ICAgICAgICAgc3RydWN0IGNtYV9tZW1yYW5n
ZSAqY21yOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBpLCBwZm47Cj4gKyAgICAgICBpbnQgcmV0
ID0gMDsKPgo+ICAgICAgICAgY21yID0gZmluZF9jbWFfbWVtcmFuZ2UoY21hLCBwYWdlcywgY291
bnQpOwo+ICAgICAgICAgaWYgKCFjbXIpCj4gICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsK
Pgo+ICAgICAgICAgcGZuID0gcGFnZV90b19wZm4ocGFnZXMpOwo+IC0gICAgICAgZm9yIChpID0g
MDsgaSA8IGNvdW50OyBpKyssIHBmbisrKQo+IC0gICAgICAgICAgICAgICBWTV9XQVJOX09OKCFw
dXRfcGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4pKSk7Cj4gKyAgICAgICBmb3IgKGkgPSAw
OyBpIDwgY291bnQ7IGkrKywgcGZuKyspIHsKPiArICAgICAgICAgICAgICAgcmV0ICsgPSBwdXRf
cGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4pKTsKPiArCj4gKyAgICAgICBXQVJOKHJldCAh
PSAwLCAiJWx1IHBhZ2VzIGFyZSBzdGlsbCBpbiB1c2UhXG4iLCByZXQpOwo+Cj4gICAgICAgICBf
X2NtYV9yZWxlYXNlX2Zyb3plbihjbWEsIGNtciwgcGFnZXMsIGNvdW50KTsKClNvdW5kcyBsaWtl
IGEgYmV0dGVyIHNvbHV0aW9uLiBMZXQgbWUgdXNlIHRoaXMgYXMgdjIgZml4LgoKVGhhbmtzLgoK
Pgo+Cj4KPj4KPj4gICAJX19jbWFfcmVsZWFzZV9mcm96ZW4oY21hLCBjbXIsIHBhZ2VzLCBjb3Vu
dCk7Cj4+Cj4+Cj4+Cj4+IEJlc3QgUmVnYXJkcywKPj4gWWFuLCBaaQo+PgoKCkJlc3QgUmVnYXJk
cywKWWFuLCBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
