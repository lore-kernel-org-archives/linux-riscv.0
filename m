Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0364F4BB62
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgSJLx7AoxD18gtGuHWKutG2VivViVmGwGzW36sl5ow=; b=1qx+0epNFky/wd
	kEB+aRcJvgW5wQq8Z/xRs8KOPoKH2ibQwnSHi7KeZQSkb7UDEBYHFzn3mwLpwF3GNza3gVozftv28
	xuqgV3DXSliU3uNZVJbKrIxOrqxe30BmnPuGT7nspzURBXxEIcAh42ar8TwN4WVQtw0OdN+CMEiej
	Ix8JRnbnzCBnjKB6+brwLsmJzcss85Ki1FqnA94cRpXe01bLbfhv8fC1XOA9/nZJ62B3qwu6rxfaF
	QUVmIrNm5IegnXVi932s8DPLYMGx0mpn1YBEDOy6E/qMSKmxW14sfxWEqe5kr04oIem2tkCrOgDum
	nfEIAGuZUGVwqhhg0kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwDx-00000002UZs-3Tb3;
	Tue, 24 Feb 2026 17:29:29 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwDs-00000002UZG-3cLU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 17:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrrqcBsQcawLmlJ323OFT7tX+WsDlyqFVfak/CSxt0Maax11x/RcLkBC00hEo/nU8aD2IuTzgHO3P7P/XsBON7igECEMjI4awfhwslalnoE6vdrpOSDWYGLd05LQoHpbwpyTDasbrP68ur7y+klz00RPzUmqHMhaFEeDVXoMvEqKVwcSbGGAqb2c0CddTwqoUj0+3//N0VTSJDOS8n9eRjMBh39hmPwLMfIlsnqZXHosd1SJX0SywnV1z2xHws6senpSn0D6BtOPSs/a5VIXBHfEPfTjtAr9k/PCkeAjs569HCuvqS+UDk+sA1XAD4wBJvDRfKMaNRvJY5Rz0J00nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWHqRp0fiECdQRqnQo+JCa2QPlVg/9AHOGsMNx59+0k=;
 b=Mxk1jaQKH8bMPnGlitnGGKG5SXuTvkYu6FwUbBi8FqI52oZLLOjIZz/y66dH/GIRhcDd7RwFtZRc0ZURnsnLmZhCjMSy7DueASeVBPJZPcKbMi4RwMb9Fd9DSA5BHjich3EGjWg9kYFh5OET3Ro2BShf0hnst/DBOoo/MYdtFLWIHc+IWMDLihm+wkYA0kpRNoBsdhUlZFOiZK6TDjTSNoTGeNhdTPArjGXEqHeAq+idCgZLoME2ISDsGISLrwnpsUa/CwFlvwoy0E410qH+TrsgK7i64VjGX3Uxufj8ulnMSDeIK25jXocOjY2PjH0uaPiN2UEyaxZKC3e85JGDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWHqRp0fiECdQRqnQo+JCa2QPlVg/9AHOGsMNx59+0k=;
 b=tS9snNrOKnpaw0dC+qL9ztbQCTqms93vgje95IhlONZ09s71std/LOJJfU3p0f7MR1SX/qAHanYT/d3UvtNUrcb4yQ1OloOZTr+zVcqQwKkpb91K4VHrTpZ8YLIJ0ITNn6rxtR2arX9qrxuO996xDeUCLcSB0Ct2cpav9BdaAHAp3vtcOHeYXf1kew6X+VrhGyzHYQrTm5xGakKu1VZI5rxzoiv80AOgfH3hAGxVRXd9EaZ7rX+YT3r1KatfAnb757LLzVyly+dBDv529M9snZr1/KpGp890wnkb1uiI3FM49NjoWvrpwARxQ8wLSMvVbWvz2CZGNj4zSRHkC1Rr3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 17:29:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:29:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ron Economos <re@w6rz.net>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: wangkefeng.wang@huawei.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 jackmanb@google.com, jane.chu@oracle.com, hannes@cmpxchg.org,
 willy@infradead.org, muchun.song@linux.dev, osalvador@suse.de,
 sidhartha.kumar@oracle.com, vbabka@suse.cz, claudiu.beznea.uj@bp.renesas.com,
 Mark Brown <broonie@kernel.org>, akpm@linux-foundation.org, pjw@kernel.org
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
Date: Tue, 24 Feb 2026 12:29:13 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <272A58BA-445F-46F9-8DAB-D82E43D7771A@nvidia.com>
In-Reply-To: <1AB3E96B-F4CA-4B00-9078-2AC20A1A60DC@nvidia.com>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
 <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
 <1AB3E96B-F4CA-4B00-9078-2AC20A1A60DC@nvidia.com>
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: d24f77aa-4001-4a72-d1c5-08de73ca3db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3hzQkx6L1c1eCt6dmgwQVcxNWlLSFhWRlk2a0FnR1lJYnJNM3hadlZWY1kr?=
 =?utf-8?B?ZDZ1K255OWNXenhmUWE3c3dqK3d5SlN1OEZUSVYzMzN1WURab3VRSWlSVU9R?=
 =?utf-8?B?V1pjbUJFZXliYjI4UnlqZXhLOWFQMVA5ZUVkYnZlRDQ4d0VEcEx0ZSt3YlAw?=
 =?utf-8?B?cGxWclJIYlBLWWMyQjBMWG5HTDlYeGNHanhuU1h5aVBJZ28rUDQ1WTFTUVZ6?=
 =?utf-8?B?WTNlUWR0bUtKcVR4UGt5YlJHQklrSThFQ1FjdXhvWngwTXRzOUJvK0wzMTFT?=
 =?utf-8?B?cThGN0JPc2hYVUh1ak5tYUdVZm83V01uV2YrVDY2Q1JpbzNuSlhnNTJOa1Rm?=
 =?utf-8?B?ZVRNZDdRWUlDN2FrTmszTHdMd0NmOFRsUzdxN0RnSjJDS0UwYWxaVEhxVy9D?=
 =?utf-8?B?Q25iUWorV01PWklacFNBQjh4WGMweTRhVzlZNGY1d1dmYThsc1hTc0VSemdh?=
 =?utf-8?B?bkRrNVpLcUNycEFLa0N4S0IrRWxWYnY1c3d3SnpSdzRPUERHUE1FOEc3QURr?=
 =?utf-8?B?T1BGVlk3dVJDUTIrV1pYM3p5V1gxNTdBck50bGxmUC9TTCs1V2ROWm1ld20v?=
 =?utf-8?B?Sk8wdlB4cXVlMldJSmxaNWV2MHZlNFY0UktnNWpGVkdnRHVYOUdxUjRmMjlw?=
 =?utf-8?B?a1dqYXpjWVNvdkFMdkZDVVdVSVJFS2FiSEtnQWRtNSt4dDk3WGIveXVXUEZa?=
 =?utf-8?B?dUJPeWZjcms1aVphVERxSUZVNlpYKzRNNWd6YmF6SnFyWDhJLzJaTms5ZkRV?=
 =?utf-8?B?MWxBN2Q1K3hQTDVIdWxDbnhBeHlYQVEvcmFqSHpHNm9TekxXT3h4VXNrMDJa?=
 =?utf-8?B?VVpaQnBocE51Sm1NQ1Ntdi9uZ1pPYkhZRUZOVStrcnZ4MWNKckxOQlhITERh?=
 =?utf-8?B?N1pBQldkSGVOVWZQcHN0SzAxZVFyenJ3aUpvck42aldCZUhjQnlYU0owS2J2?=
 =?utf-8?B?WnVsQ1grTXhSWVkxN1JweVI5cTRNVlVCdDNOY2QwUVBybzg3RERTK21ZSnFB?=
 =?utf-8?B?RU41c0haaXVoeE00M3o3VFUwUU9nNms1VlB1TU5wSUYvT0oyWFdhc3BSN1dJ?=
 =?utf-8?B?eTVzMFdaMWpWNWRVVmsySlZHVmF4d29qZ1l5R2tDWFViUTY1dkdRVWgxb1Vn?=
 =?utf-8?B?RE1wdUNlYmR6Sk83MUxkRXhnTWNUWGNIWVlaaTZ3STlXVC9oK1BuMkx2akk3?=
 =?utf-8?B?Sm44YTF6SnlaWEdHOW9IRTJKd1pUTzM2U2NvYThxR1Q1VzlVNnFpUUhTc3M4?=
 =?utf-8?B?OWpmNkJyV2pEM01DTCt4WXE0S1B2WmZFTzJtT0tWTHc5NmlGSGNYbU9TU2ds?=
 =?utf-8?B?cFh2czNLeTdxZzQ5QlNDdVhQcWpWZFNkUlRVZmo1NlhtdnRUVUtPUWV0TGVY?=
 =?utf-8?B?NnZFNENmZ3ZUbS9TWEVFMElUY2JkSXpQQmZNZUdDRGM5cEhLMDh2U2ZGSHJX?=
 =?utf-8?B?Mjl1VUtvM211NmxZNU5nQXhOMnJVOUlvem5TL1lGS0VqTmVZZFlKZUVjVTlj?=
 =?utf-8?B?U29xUlNzazlJY3BrclRGMVZIVXlVeWFScTdtUU9USkdYbTdUM2tyY1BiU1pF?=
 =?utf-8?B?T2pOeWxXdkl5aUVPQlVjT0IxNDd2MzJ1MzJqQ3BHTVp0L1ZpQlNHeVFzUzg2?=
 =?utf-8?B?NjJuZGwvVHNJUTFLc2ZYUGUvMXphcldUelZOYkg1ZDV0L0Z1cS9QZkN3cWRz?=
 =?utf-8?B?dGtvaHJTRHV4eE9ucUV4NU9PNm9GWmxDL2VVNEZ1YzhZc0xtSUZDcDBWaFZC?=
 =?utf-8?B?Uk1IRTd1MW5VSUFiQjdabXFSSjkyZ0oyZEVuUTRtZzJkclkvd3VpSkYwQy80?=
 =?utf-8?B?ZzlFR0tuNG9xZmZsZ1ZlSlAzdUVPZW50SnZ5Ulp5L2RJK1J0Y1JMR0Y1cUVE?=
 =?utf-8?B?cmsxWjd5WGpEUUNIWHhsTFlTNzZqaklGemxTRlNVdmNlVzhSMjIvcFlDcGxW?=
 =?utf-8?B?dzdQR01IMVBxeUpIVzlrRW1pYllwWVVqUXMzN3JpMFlYWTRPMU41ejU1Z0FS?=
 =?utf-8?B?YTR6V1gxcWJmZ3FMRENoRWpLZGJFdWszQnU2V1UyTzNmU3FPTDdZLzFIdWxH?=
 =?utf-8?B?YVQ1SDhOZzRuYmg4RGpzblRQSkI3aUdwQ2FKekNsSGovLzRYMkFobGdJYVNu?=
 =?utf-8?Q?svrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk9BTVQxOUhuMGpFZ3RHTUVCWldGVGFCOGVZOUhOcWlTbVZqWFlHQ09BNVZq?=
 =?utf-8?B?RmxUaU1hcXpBSUYxYnZsWE9hNllGM1lyb3FmaXpqZ0V5UDBYNmdFZHhyeW4y?=
 =?utf-8?B?alQ5U3NKSVF3aFFYQkRIUE1iVzFNdlRsa2ZBcm15SlZuWXFybnRhQ3FzQk0v?=
 =?utf-8?B?dUVXSjdoUmhFMnhwYXJHSVdNejROWUdOQitXazJXeVd4bkdHbDc1NkprSStW?=
 =?utf-8?B?TjJyOUt5S1NVS0Y1RFJ5dkR1R3FkUEwxbW1ucFF0VGs5K2ZHRWs4REJMVm5Z?=
 =?utf-8?B?bkxQeE52QXFaMWpUd01BU3N1VVB4bG91d0tRWisxZ3NVZ0t0VmdsQVdRNStD?=
 =?utf-8?B?OWZLbk5lYmY2SHFQdndpNVRNVFJnaDVtNklFYTRHN2I0YkVmYkZUR2FFU0sv?=
 =?utf-8?B?VVhlU2hkcHVNeW03YXh6R0NucDJJVUxueVpzL1lrenkwVUs3Zm1GUEJuOVho?=
 =?utf-8?B?VXJBTXJXUTFYV2lTQmd0V2U2OTUyQmZtaEhmSXJ1a0JiYktyRjZ0VFgza0hn?=
 =?utf-8?B?VmR6a2hyN25pMHAvbXd0THJRQlZOMWRvZzNNUWt3bS9pUG51NENQUzZxRjl6?=
 =?utf-8?B?M090eWJGQlVRdkFsMnFNdVU1QjJPNjB4blYzNEFtdzNmalJnT0hUQlZMN3VJ?=
 =?utf-8?B?TXdsWFZKczRmN1FEUHpsZ3FEQ2wrbUhMdjFWVGtxeFhUOTg5UDFrRHJJVHRo?=
 =?utf-8?B?Y1JiRmFZOGxlTHlDU1R1NjFMSkhGWTUvZHdTOW5mK1B6VnZJYWtBTkpPbUgw?=
 =?utf-8?B?aHRCbW80UzdlVE1tMmg3TGx4N1lhaXVDTUxxSm9DZ2prZUxWbU5ta0dEWWt1?=
 =?utf-8?B?MVgveUNuODBkU1ZiejhmU0sraXBoTkYzb0VycWNHYkJaMnhYQlVsY2thTmU3?=
 =?utf-8?B?TVhSd2JQaWtTQ1RFYUUxMUw4NHdMSDdwejlBejFXdUtxcU9FSk9JbC9CVVo1?=
 =?utf-8?B?cGdJc1J6V0VvU3ZnMjJSUkM1bDRDY1BEYjFnTDd0Q0J2ekpBVjM4azZ0N2Fv?=
 =?utf-8?B?VnFVMVF0MU9HNmdzYmxDa2dGSEoyb2d5M2MvQ1M0RUFaWElaQW5WcjdaWklP?=
 =?utf-8?B?RUZWcU5MaDFSUnZ6RTBHTHRPZmlVT2d5SGExamV0OGdYMnRaSm5uaUM0N0Fo?=
 =?utf-8?B?Q1pncGtLak45RWsxdnVJRktQUmxpN2g0VXhEMy9mcjBpL3hRRVIxa3pObTh3?=
 =?utf-8?B?aWFZSUpmTkhCekx4RW5xYTFIT0NJYUVWWkFXSm5jY1BqM0lFcTdmaGVyMHlC?=
 =?utf-8?B?YTNYeTZPYldwOVhOYVdZRm1FdE9lL2lYOHZSek5aenlPWVJDalBPQmRHWUlU?=
 =?utf-8?B?M3RzQklxVk5ucC9vQXhkc0RaTzNkSUxqTDRsWmZPYWJxZkh5NVdqMmo3blhJ?=
 =?utf-8?B?aFNJSlhzWE15SjFNUkJiMStWZXMyK0ZLam82OHg4R1ExRS9zbGtaYzIvaHBQ?=
 =?utf-8?B?TWx5cisyMnh4c3REVjZYK1hOczdlQ3NEWmFoUEZzRk9DQ2plb1c5UjNLc1hm?=
 =?utf-8?B?VHhEWVBWbDJMNnM4VFJVSkl3ZjVtZ3pCcDl2S2ZKekdkOHhZVk5BSmt2bXht?=
 =?utf-8?B?VURhTlNTOWRsWnplY0YxNG1KaFZFaE9Gajc5RmpDMFJkaWkvNW9XQW44ME16?=
 =?utf-8?B?WU92eDhTWFl3M25PWEMvY3lydU84QkJjaWhCaVR0eGJXaFdRdW1aQlRyZXVS?=
 =?utf-8?B?MUlzdmNSNEttV3lrVFV6S2RXYWFkNUhMTUJNcDNaZkt2dVljaDR2QVBWUlhl?=
 =?utf-8?B?ank2TFlGU2dONGJzamZicDRyTGp2SVNTdjNiSFBPOHVseE5peDhoMXFyczB1?=
 =?utf-8?B?L2d0UzB5eCtrTW1rSFZ3Q0tOd0d2WWkxNVhsTyt0WFdmd2tLcFJzMjh6eVpy?=
 =?utf-8?B?NDdqNEgvbXNGY3ZsN2wveVRKa2tqaUVxemZjV2xkUnZWN1VDMjEwK3EvTFVC?=
 =?utf-8?B?Y05IV2YxV25rcTBvM2hCQ3lJbGc4dXhtaHdWQVF2dWxsVlZ3OWlpczlpM3Jj?=
 =?utf-8?B?QnAxdi8vajd2M2tNQTE3V0I1THJmYlBzYm45Ry95NXpUbkZBMnFtYzAzUm9Z?=
 =?utf-8?B?dzJ3NjNwZlBBbW9WWjA2dXVWRGIzOGxLZ1NTNlJyaUpYQzdjdXdLc3JFeVV0?=
 =?utf-8?B?czZkQUpYTTRxdCtqd3Y2aUNKVFQ1dHBZVzQxd2pVcTdVQ2pQWUF3NDVTL29B?=
 =?utf-8?B?MkYxWVlab3dCNGNtNWpkdVhzaURycU13K3dIMy9LR3ZsRjEwSGVVSUZwUCtr?=
 =?utf-8?B?VldpWVRkL3djSjNEWFFZejJhaC9GcTZMRms1RmxWUjNzK2lHUnFCdlBUMGk5?=
 =?utf-8?B?aXBjQ2hFY2tHM2R1dFM5VFNzdGlwUmpveEdIWFdiRkF6bUFhaDlEUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24f77aa-4001-4a72-d1c5-08de73ca3db7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:29:19.1230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5/cQ501SEZj0jY3W4bVHOK+/A8PMe60moCIrNgzKYJf/LZO4jo+HWmR0xtu9+O2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_092924_901214_87252932 
X-CRM114-Status: GOOD (  15.48  )
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

T24gMjQgRmViIDIwMjYsIGF0IDEyOjE3LCBaaSBZYW4gd3JvdGU6Cgo+IE9uIDI0IEZlYiAyMDI2
LCBhdCAxMjoxNCwgWmkgWWFuIHdyb3RlOgo+Cj4+IE9uIDI0IEZlYiAyMDI2LCBhdCAxMjowNywg
RGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Cj4+Pj4gRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkg
PGRhdmlkQGtlcm5lbC5vcmc+IGhhdCBhbSAyNC4wMi4yMDI2IDEyOjAwIENFVCBnZXNjaHJpZWJl
bjoKPj4+Pgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gT24gMi8yNC8yNiAwOTozNywgUm9uIEVj
b25vbW9zIHdyb3RlOgo+Pj4+Cj4+Pj4+IEknbSBnZXR0aW5nIGEgQlVHIGR1bXAgZHVyaW5nIHNo
dXRkb3duIHdpdGggTGludXggdjcuMC1yYzEgb24gUklTQy1WLgo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+
Pj4+PiBbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBzaHV0ZG93bi50YXJnZXQgLSBTeXN0ZW0gU2h1
dGRvd24uCj4+Pj4+Cj4+Pj4+IFsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IGZpbmFsLnRhcmdldCAt
IExhdGUgU2h1dGRvd24gU2VydmljZXMuCj4+Pj4+Cj4+Pj4+IFsgIE9LICBdIEZpbmlzaGVkIHN5
c3RlbWQtcmVib290LnNlcnZpY2UgLSBTeXN0ZW0gUmVib290Lgo+Pj4+Pgo+Pj4+PiBbICBPSyAg
XSBSZWFjaGVkIHRhcmdldCByZWJvb3QudGFyZ2V0IC0gU3lzdGVtIFJlYm9vdC4KPj4+Pj4KPj4+
Pj4gWyAgMTczLjk4NTI0OV0gQlVHOiBCYWQgcGFnZSBzdGF0ZSBpbiBwcm9jZXNzIHNodXRkb3du
ICBwZm46Zjg4NTAKPj4+Pj4KPj4+Pj4gWyAgMTczLjk4NTMxMV0gcGFnZTogcmVmY291bnQ6MSBt
YXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMAo+Pj4+Pgo+Pj4+PiBpbmRleDoweDAg
cGZuOjB4Zjg4NTAKPj4+Pj4KPj4+Pj4gWyAgMTczLjk4NTMzNl0gZmxhZ3M6IDB4ZmZmZjgwMDAw
MDAwMDAwKG5vZGU9MHx6b25lPTB8Cj4+Pj4+Cj4+Pj4+IGxhc3RjcHVwaWQ9MHgxZmZmZikgQ01B
Cj4+Pj4+Cj4+Pj4+IFsgIDE3My45ODUzNjVdIHJhdzogMGZmZmY4MDAwMDAwMDAwMCBmZmZmZmZj
NTAxZTIxNDQ4IGZmZmZmZmM2MDBmMmFlODgKPj4+Pj4KPj4+Pj4gMDAwMDAwMDAwMDAwMDAwMAo+
Pj4+Pgo+Pj4+PiBbICAxNzMuOTg1Mzg2XSByYXc6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMWZmZmZmZmZmCj4+Pj4+Cj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAKPj4+
Pj4KPj4+Pj4gWyAgMTczLjk4NTQwM10gcGFnZSBkdW1wZWQgYmVjYXVzZTogbm9uemVybyBfcmVm
Y291bnQKPj4+Pgo+Pj4+IFNvLCB3ZSdyZSBmcmVlaW5nIHNvbWV0aGluZyBmcm9tIENNQSBpbiBj
bWFfcmVsZWFzZSgpLgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IEluIGNtYV9yZWxlYXNlKCkgd2UgaXRl
cmF0ZSBhbGwgcGFnZXMgdG8gZGVjcmVtZW50IHRoZWlyIHJlZmNvdW50Cj4+Pj4KPj4+Pgo+Pj4+
Cj4+Pj4gVk1fV0FSTl9PTighcHV0X3BhZ2VfdGVzdHplcm8ocGZuX3RvX3BhZ2UocGZuKSkpOwo+
Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IEkgd291bGQgZXhwZWN0IHRoYXQgdGhpcyB3b3VsZCBmaXJlIGFs
cmVhZHkgaWYgdGhlcmUgaXMgc3RpbGwgYSBwYWdlCj4+Pj4KPj4+PiByZWZlcmVuY2VkLgo+Pj4+
Cj4+Pj4KPj4+Pgo+Pj4+IEFyZSB5b3UgcnVubmluZyB3aXRoIENPTkZJR19ERUJVR19WTT15ID8K
Pj4+Pgo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gLS0KPj4+Pgo+Pj4+IENoZWVycywKPj4+Pgo+
Pj4+Cj4+Pj4KPj4+PiBEYXZpZAo+Pj4KPj4+IFRoaW5raW5nIGFnYWluIHdpdGhvdXQgbXkgY29t
cHV0ZXIgYXQgaGFuZCDigKYgaXNu4oCYdCB0aGUgY2FsbCBjb21wbGV0ZWx5IG9wdGltaXplZCBv
dXQgd2l0aG91dCBDT05GSUdfREVCVUdfVk0/Cj4+Pgo+Pj4KPj4+Cj4+PiBBdCBsZWFzdCB0aGF0
4oCZcyB3aGF0IEkgcmVtZW1iZXIuCj4+Cj4+IFJpZ2h0LiBXaXRob3V0IENPTkZJR19ERUJVR19W
TT15LCBWTV9XQVJOX09OKCFwdXRfcGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4pKSkKPj4g
YW5kIGlzX2NoZWNrX3BhZ2VzX2VuYWJsZWQoKSwgd2hpY2ggbGVhZHMgdG8gZnJlZV9wYWdlX2lz
X2JhZCgp4oCZcwo+PiDigJxwYWdlIGR1bXBlZCBiZWNhdXNlOiBub256ZXJvIF9yZWZjb3VudOKA
nSwgYXJlIGRpc2FibGVkLgo+Pgo+PiBJdCBzZWVtcyB0byBtZSB0aGF0IHNvbWVvbmUgZWxzZSBi
dW1wIHRoZSBwYWdlIHJlZmNvdW50IGJldHdlZW4KPj4gVk1fV0FSTl9PTighcHV0X3BhZ2VfdGVz
dHplcm8ocGZuX3RvX3BhZ2UocGZuKSkpIGFuZCBmcmVlX3BhZ2VfaXNfYmFkKCkuCj4+Cj4KPiBN
ZXJnaW5nIFJvbuKAmXMgcmVwbHkgZnJvbSBhbm90aGVyIHRocmVhZFsxXToKPgo+IOKAnFNvbWV0
aGluZyBzdHJhbmdlIGlzIGdvaW5nIG9uLiBJIGVuYWJsZWQgQ09ORklHX0RFQlVHX1ZNIGJ5IGl0
c2VsZiBhbmQKPiB0aGUgaXNzdWUgd2VudCBhd2F5LiBMZXQgbWUgdHJ5IENPTkZJR19ERUJVR19Q
QUdFX1JFRi7igJ0KPgo+IExvb2tzIGxpa2Ugc29tZXRoaW5nIGlzIHJhY3ksIHNpbmNlIGl0IGlz
IHJlcHJvZHVjaWJsZSByZWxpYWJseS4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMzBkZDFlZmMtOWJkOS00NjY0LTk5OWUtNjEwZDE4MTYwMGY5QHc2cnoubmV0LwoKVk1fV0FS
Tl9PTigpIGlzIEJVSUxEX0JVR19PTl9JTlZBTElEKCkgd2hlbiBDT05GSUdfREVCVUdfVk0gaXMg
b2ZmLiBPbmx5CnRoZSB2YWxpZGl0eSBvZiB0aGUgZXhwcmVzc2lvbiBpcyBjaGVja2VkIGFuZCBu
byBjb2RlIGlzIGdlbmVyYXRlZC4KU28gdGhhdCBwdXRfcGFnZV90ZXN0emVybygpIGJlY29tZXMg
YSBOT1AuCgpIaSBSb24sCgpDYW4geW91IGNoZWNrIGlmIHRoZSBwYXRjaCBiZWxvdyBmaXggdGhl
IGlzc3VlIHdpdGhvdXQgQ09ORklHX0RFQlVHX1ZNPwoKZGlmZiAtLWdpdCBhL21tL2NtYS5jIGIv
bW0vY21hLmMKaW5kZXggOTRiNWRhNDY4YTdkLi45NmJlNjJlYjM3MTMgMTAwNjQ0Ci0tLSBhL21t
L2NtYS5jCisrKyBiL21tL2NtYS5jCkBAIC0xMDIwLDggKzEwMjAsMTEgQEAgYm9vbCBjbWFfcmVs
ZWFzZShzdHJ1Y3QgY21hICpjbWEsIGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlcywKIAkJcmV0dXJu
IGZhbHNlOwoKIAlwZm4gPSBwYWdlX3RvX3BmbihwYWdlcyk7Ci0JZm9yIChpID0gMDsgaSA8IGNv
dW50OyBpKyssIHBmbisrKQotCQlWTV9XQVJOX09OKCFwdXRfcGFnZV90ZXN0emVybyhwZm5fdG9f
cGFnZShwZm4pKSk7CisJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyssIHBmbisrKSB7CisJCWlu
dCBfX21heWJlX3VudXNlZCByZXQgPSBwdXRfcGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4p
KTsKKworCQlWTV9XQVJOX09OKCFyZXQpOworCX0KCiAJX19jbWFfcmVsZWFzZV9mcm96ZW4oY21h
LCBjbXIsIHBhZ2VzLCBjb3VudCk7CgoKCkJlc3QgUmVnYXJkcywKWWFuLCBaaQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
