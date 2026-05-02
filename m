Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C46CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 01:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6TfHDtDTa2KC2wN0NaHmgb833vcnxxJus4/0935XLs=; b=BD3Ea0jKmZkzUu
	AoPRoX8bzHxryRrK08b4oxXgwtTvfrQeB0TsSTeGnsNIR6fc6nr77La/MqbCIYYXCZKyOEttcoqgy
	e7N99I8ZdaOkIES2AV6rEoeII5XSrtVQaoTf16PDgQHc203jm36jB4ZZB98IOajbwRfPAf3O79KKD
	h3mie3AjWzihV9oNWvirOyybASZ9GooWg0CcVokADnN7IT23BvlmXngjTQJAat7HNev0/+FSfieV6
	vQpeG3tk6qMhnZ7A7ZPUQN/Z0ilA4tV8GKHn+iHmspqEI2zojvF3+t9+wjCrtok6dRlfMfbrPwPBX
	AAQ0hnuThfxRYSkXcWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIzLF-000000080SZ-1Bnl;
	Sat, 02 May 2026 01:40:25 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIzLC-000000080Rq-20dh
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 01:40:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyZmTIwEFzqKUSzEjIYgO/+b499yKqkyhvoFPV2fmFpwRymDnHma3C3IADf/0ltV8xEiTUeyF6ird6kVhkA53upuLnVOA4LjgQMTa2T72FRErvO0Q74j7gOZ/hAnksOE63YQYA8xeHK2QLiu0UCLeAcm/iOlT1Hk2e3Jjucvrc1Mz8JOqG0an9kHU1+pCXSSRQfLouQPQqHjgESd8DYFQPucbJbJ3H42AIK4H09Hdj94WUWs6QpCsELJ9FFEEHh1YVmLhc3zNqrt53AtvpCWrdUAG1RvzVTgOvMmqnYYHrXDQhcK062XAAtLC1bnuds3huScvIlOli4MqDwri3O6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUNzZqyB1P+rsckaUA5Z0suBRN/bKa2GIoBig/CtGkc=;
 b=TBjForPAtfViL8GEJdy/Ttwyw3/0mQ1zmcSDmWdePC/M+hSHhj8WMPHNV87SVz6wsfa5OZn9i29ju261W7B4ZV2AhN6tfG9uMO5Ej6jAaKunOpIOc/ZTfArcCd9K9XWzZ+zv9C+ajmgWs2NrcMMSzXvJfiBf8r521tABqFP8XRWQ7T3c5kL4N1Zgjh6fQMokRytNAezgl7CXam+xC0Dti+bxVInVwto/m9LZ0i05skpLR0cGut01x93sUY7JfJByEUl32TiBz9x591HjC+qbK3vG44Qdr4r0HtCQ+EWVEejQ8OP8+r/sgsBp0L1IwwWV+bsOUhtCxrJMZwKTUV/GXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUNzZqyB1P+rsckaUA5Z0suBRN/bKa2GIoBig/CtGkc=;
 b=nHq8p11ZYnqusIXIv31KqKOriWcLKmIYd41nzMPpHXvCAg61fv8ISfR2c2N2+hdlqB6BILYygnEVPqdsaSKCSvYZ3/tO84OMX0W2Hh13R49A4KU8gmX0+DFGgtpGR5NtgJpjiAOwYV3UGd+WVpB7d8MeEe3q9vuYmpdRma5BOiEXrf1jE/O8wm9V7kV6PksFAYJzYLRA/C9PiNnDmvZq3u7TSxPAQWKk0l5pG8FWFT1K2flFCeWXvku/pYBX+B/F5arufXimmdH2fryHjGEGA0o5ftWgYMTjjnrvjC6j05fD5WwjO8EXspydD9nL5SjeD1158PsWN3twdRbZj+jUOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 01:40:03 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 01:40:03 +0000
Date: Fri, 1 May 2026 21:40:00 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 0/6] lib: rework bitreverse
Message-ID: <afVV8LaelVkqgnLr@yury>
References: <20260430211351.658193-1-ynorov@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20260430211351.658193-1-ynorov@nvidia.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: f8133d8a-0614-428c-6f32-08dea7ebbb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: w7yqP/UZAj3/lNbAccOFyoKOHiVfZLwVCKF2/21rg6rP3vh5x6u420bZYowKrnuzu78c30q+SBIm1jL4eEzMF1cSVpxrCSmMNYsWtme7by4EG63ZLQ45Ii6/2VAWNKiE7fAzjSaqd6FshqpDf/4d2a70BSuWuZDuAPV0TUdYmjaDLijMvmyGzG/V2c4vVIvY97Xq6PfoRmzJiWnpg0sOSwGZVesbZAuvSPRxRkeOH3fHPrzU6Oa36LCyozMKrIz/LFBEa6V8p0l2cSPHzVRlwffT6nKwfodppxg7f0N6+dIfO992G74nNTl4WZxw7XzehXVIXVfOX12e3jx0JuxGMB07Iq1Mt3gd5Qo6cOAOL9LU8AprmMj0ITlM++zbuXVwVmRR8FGTh8f/7CTJLJEcRsM3d2EUJi2ybjHq7f4tRtNzSoUqu8WzpVPn0wpMHGwDrInJMg/SgnK9bquyWeyhqTnPOmnVAUBF7LjlCL8mWuHOdgRJ9NPo6ijbkJ2GR0KsbWDUa/pfUDACd4KB+fz222q7tQYTLmCtzUyCkttJT/RpxahMCtrJblZIjisSK0kfmuwpOQ713v3805TfoitcvOyLa/AyAqK27qPb9NUoeqr2POPaHFe+Ni3q4SRCQGoZ/E2sCEQQCW7UZ6fMm2xfb9fQyekwuRy7JrtlKvHBuHqieJDdlT2ATP0zyCFCFmrKNP7IgS1IgvtpPIovlhA0/b2izBNXaPhg3QOB6VpJUCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6hFs/rsgtk9OW1AIv+14XVhFLYNcGHY+SCkYGNBX5mYrt9vSXGphd4X5Qw0J?=
 =?us-ascii?Q?8oCOHB8B4nMVm2rTIjfdOI16yW40w0Ub9knahAIZHAxCGJmdTCvgHrXgu7DC?=
 =?us-ascii?Q?wwsotZg3sNNgW3Vp4Fo1MEm6JTOKedDxOLgMDBaHaeyCgm0uhHgYVa85A+aO?=
 =?us-ascii?Q?11HLggudfhqU2cKjRnUSdZ/4MxEVDA4WxAuH+HXrLD2j17/V7tOoR1PnLKda?=
 =?us-ascii?Q?VvAlkfPdloAyGWZ+rWTTvpMsY4uhImupHgyyG3Q/b9ySdJsdaqHcHgYedG9u?=
 =?us-ascii?Q?Zx3wu7zDzw+jq25OxZsVKVsesqdX/zTAHcD1MkIw4mzT41CsnRsyjCkaIWtC?=
 =?us-ascii?Q?+6v+BVONDauP3ji2bZjglan+0Quhl/F+4X/MBNZDgHS+HzMXCa+UWQQc5rQj?=
 =?us-ascii?Q?4hPLa8D6WnIq/pNKfHSICS9k5pDQ65Hh3gyndKHwmzwDxIrjAlX9xd39/YD5?=
 =?us-ascii?Q?1dWMrnPeNqPs5s5n9bp9iQmxZBqUAYZ8wdou8EUs4zqGdL6ftvffvwNlxcNL?=
 =?us-ascii?Q?Gqyqjazr0UBiTklzk3t52AslIs0qsoI1SYNzHv15GQSky8p4BA2WhH54n1uw?=
 =?us-ascii?Q?y6FsOpnBbSh+9N80+lnyTjgGA3ZzvRKr3MwCCD/ejM+EohVBL87LfYWY+gJu?=
 =?us-ascii?Q?L61F+kphO+hsAKQBNJUJ8/wGnh5pb1nInyN+rtL9BCFGjM2Rafd22LOQg/r2?=
 =?us-ascii?Q?+z2nkFW/llAn/l6uJhTdiUk9kLZLW/dTqEuvmxgYa9yxvu3uDO0bHNqLkj91?=
 =?us-ascii?Q?PUUwPkrOUs2VgMaKnPwb5QwM6EhXXRoEqu399HWclpZcZ+qscmVX4ytxwGdw?=
 =?us-ascii?Q?8VUmr17DFDwda78qetxMWRS4pSUIMpiStMo9CqN03TzWMHFf/vnI0yzDn90T?=
 =?us-ascii?Q?+s79Ju/ctkQwb42NFZ+zyL/2UD0voc+bMRVJCaiKaAXmMymAZBWILUX1oU2Y?=
 =?us-ascii?Q?TQZ2owGZ4TefFIorw04zGx8NL7JjsTBu5MHoib4W8HU2+TJzea7gajedBzyL?=
 =?us-ascii?Q?RlyIUbRYN9prLdADXHrj0gi+y06GFkhf8QPX/JLZ1HGJKC1Hb9aZQtD0eu50?=
 =?us-ascii?Q?KWAxcaUerXyhEf/CHYAtE5ODJS0VcIg2ZjMF/tdOKhzx9nXwazqb1gu938Wi?=
 =?us-ascii?Q?AECSjUTWPIcavruY5orJ2ZvlppQ4alm5XtHObmyd/7T0la/IUs9HjayPkl2U?=
 =?us-ascii?Q?8xZdYe+9PMqD6iFGUr6AT1X8PdimgD93+WrtbFdktZBZVkuV3NC2xU5BOO3z?=
 =?us-ascii?Q?xM36eiivPU4/XLawEBvrMF18O48DFBeJ5q7RhCMd00QMwAq8LlaJj05luRYH?=
 =?us-ascii?Q?spxP9YK4GVgJrpahhzgVDQcn8gRDc2uceel8Dn8yz7fYf/Dtn0tv93QCDMYR?=
 =?us-ascii?Q?iBAs1KzuH6y7KcRYlY0DGD8P9PTUKAgUU0K4U2Kxqj4exVIFTJVoH7FYbtfb?=
 =?us-ascii?Q?oUo4+hlzcjzxMbVEg033dfOXKp52Z1isPT43CS8P1UYu0A5R17hgYDBFLtjO?=
 =?us-ascii?Q?nusX+E4GaNPib/qsawqBzkeocwoa/8WViutkNjS6BYMLPnSAMK+edpYCF2Tb?=
 =?us-ascii?Q?h6cxwECfs/ygeoP2X8uK6kC8tdHbOLVOOUepgUN+6tRXgrGKLz7PT7S1XeAd?=
 =?us-ascii?Q?h0O9ywGt9SZYg51yIJROI9ATSfRWm6SWJILkhlhr7GhsOj5wi37H6wkYSEmW?=
 =?us-ascii?Q?iF0pz4JtmB8evmZsnlAPT33iVVITEQXdcV9rCqep57Nf5jMvxNDRJMW09cSE?=
 =?us-ascii?Q?QQmMtEIZhilUJZleKZH/D8+qLQVHJqS+ImbMj3y0vKGg1yfxlYR5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8133d8a-0614-428c-6f32-08dea7ebbb02
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2026 01:40:03.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH1Sh37d3VDG/k6E3pjQcwu2jxnrR9HR5EkjZxGqPqKfFKU79CwY6x5CbLbJJSshnmI3wLn/+ECpE7s8Znpnpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_184022_522924_6E7537B3 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, Apr 30, 2026 at 05:13:44PM -0400, Yury Norov wrote:
> This series is a resend for Jinjie Ruan's "arch/riscv: Add bitrev.h file
> to support rev8 and brev8" [1], my follow-up "lib: compile generic
> bitrev based on GENERIC_BITREVERSE" [2], and the fix for a build error
> reported by Nathan Chancellor [3].
> 
> No changes, except for combining pieces together and rebasing on top of
> the tree.
> 
> [1] https://lore.kernel.org/all/20260421130752.607500-1-ruanjinjie@huawei.com/
> [2] https://lore.kernel.org/all/20260427205210.397471-1-ynorov@nvidia.com/
> [3] https://lore.kernel.org/all/20260429202922.GA3575295@ax162/
> 
> Build-tested against x86 tinyconfig and defconfig, having disabled and
> enabiled CRC32 and BITREVERSE, correspondingly.

I've got a feedback from sashiko bot.

1. We need to do #if IS_DEFINED(CONFIG_CRC32) instead of #ifdef,
   because it may be a module.
2. Selecting GENERIC_BITREVERSE without BITREVERSE causes the unmet
   direct dependency warning:

   WARNING: unmet direct dependencies detected for GENERIC_BITREVERSE
  Depends on [n]: BITREVERSE [=n]
  Selected by [m]:
  - MYCONFIG [=m]

I'll send a v2 to fix it

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
