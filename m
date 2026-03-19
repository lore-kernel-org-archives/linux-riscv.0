Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAFD1088E58
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 01:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxIKjvikSBq1yB06+aSm/qMt/Kov1wHT3p7VcMa4fb4=; b=ZunFcp9cQcwlU8
	J65s36gbzwqfYRneeO1saBsyjqLG8LW44ItT4qpaXcZxXSBlW7ZEBdKzxKh50cPX8P1PhoauvxfBb
	IN8NOLbeqsUQdEdpEgWbnOr6LlAXGR+DKaA7H95qjq1zJLcqEgWMQ/S7BuQYa2evBjCV5qZ50Tmcz
	MAR+qAXiDxN44Q2RXBLTKCSNrFasncEMihKvuCJd/9MT+6F7h0sUPmLJ4mKP72Ekrjl4hcfG3y2g9
	H72fEu3vYpF2VftM3fDm2M8bXKztOo3JYQDl1C5rttEIwbm1UNhjpKdT6ykP9SV7jr8H3pN2SbcAe
	a0AUEUR49P/GxjG+5E3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32P8-00000009c3o-2EIl;
	Thu, 19 Mar 2026 01:42:30 +0000
Received: from mail-westus3azon11010068.outbound.protection.outlook.com ([52.101.201.68] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32P5-00000009c3M-2KcV
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 01:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xgqo4Rjmf+8MejWvoPmipit6K5F/beC8B2Lsr/TpKSMtnkjJoebPtHKxo51JyDfIt8mdtp3Vsi1+KdbORhBemH4qMOvwMfwhwfe9aYHUgg2Ox6cYPai/lAbneGVEZjPBOdAleMZWfIqtJyv6sH79CzavRbHHRFs8K6uJ+eymZed5zcn88hDUrHGHPUyAMA2/BRWgmwJ0NAGW7e+K7Z2eNVy2ag13PyLN9hLTDnZ4NCMJ/axVquQz8h0HvmwwKJTFl/xmS7YUpvjkkIgpy647HO9XM1qyr8aLR91ZHkgmC6avyEMheuYNBL0HParARuugK5OraNysnQay/R3VDXeyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DpufpA3oRlOHKRQkM8TcRZU4IRKBbB05UXlL1B+fy0=;
 b=tYO599B+PhvPIa9/ZaPD8ypv0gond8yDlO9z2PFI48nsN/MIBlTBTxh93+jrpElS36VVmHCTGWzxqWto8RayeFdA2tSLGw7/5ftpuOtjO3M4ENKjQOk4J5pZsCgp8adM4Z4M/MMeThfnHC8yJlQX7WRaiNxD5BwipnEqoPQwUYJfPG0pgrACSVDEAW16NBBJSbo0oh8X76YD0Bgrs+eswZq8a9nk/I08FZqpPMsg6LVY/tm2FrddHRMpOMWt0M8+93zuym/voZ+FQevUMQx+JDxN+lm2X38g6xPacAJGky1g4ud1adWdOcv7SOZiAYtGbEavF8VD3z9LYXpiQWhG+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DpufpA3oRlOHKRQkM8TcRZU4IRKBbB05UXlL1B+fy0=;
 b=VZ6Ky4cQYu6V3Hc5vFqr0WdnTSkeWzUic+X3QQlFOLd/bNs5VGIvXNEgAlblxCMAQWs0jopAFAY5Jjq/AG2pkgOD8HYfs+w2rPCVVhNxx9S4dzEWm2hwAyVi++Ut9SFloF5JE5wvRwRGe88EU+HjLP7TiKlfzHvmCnX893/C4ogHLxZjDwHvnx/WnppzoyEBXPkHcfnnfSNC+sdRpUfbey3pXnXzP+g7TJymfuNUV8pwulUqZavS3N/zI8KqUFMSx68w8V5mpaSXyaF4RVFJNvU4RcITFDWHMmwZ5L5xKe8pwexHL6AYomK8dLPjk/HZQ7Pa4fMGcs/xMZUeSknXnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 01:42:18 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9723.016; Thu, 19 Mar 2026
 01:42:18 +0000
Date: Thu, 19 Mar 2026 10:42:14 +0900
Message-Id: <DH6DL5899CLZ.2FMG8UQSNEII7@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/8] gpu: nova-core: convert PMC registers to kernel
 register macro
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260318-b4-nova-register-v1-0-22a358aa4c63@nvidia.com>
 <20260318-b4-nova-register-v1-1-22a358aa4c63@nvidia.com>
In-Reply-To: <20260318-b4-nova-register-v1-1-22a358aa4c63@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 144b4aca-7b2b-46ad-d666-08de8558c180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: BlVIvUezcEEY5p8H47PMuKbVxechX3QHiTvgOZrfwSZOkYuxj0COd17BTd+qaRB9gBb40BZZ4kBs7jmGi1McR0O3nzNy+kCbRsJIIWCEboQQG/i9SBhsXCqCd5oqBH3zB7Fpwetvx3aquq9x+zGO/ZzcwnFoMZC+akQ3CTE0KnS3t6HpTSwKkRCy6u/fWYKMkNplbfiWQCSFssFka6k7nwlKbnXECh2GEMvXdAOBUPWWJKMYXeMwR+WY1KQnH8tSrTq4mxOmQpniZK7ILIqj2MPnfpOy9cWrTFjz5eZdVU5rpeulaBUo4wygZIqn5D7r63q6uv72CJ8Hk5Op1UaAL2B+rO7LUPNQ87UXyI9EucI0C4EZCRfNS3fHxIOLZXtncaVeN70RjFT9j0fG5f4QCnPbe7BEkgZvbcnl/5L9C9pDGo6WGkpsPhLrwBty5iPMyIXf9haHvCwQ3s9jwFqZyclsOoYHhGlWBnNvo4Y+zrR1EHoBuFZzHWO30fgUbKDYJzw+IrqMyQzL2XCATO1klCvRzoeGmni/HMgkL++Fj0t33ZT62kvcJNgDWu0j3GFcSLLOEhpkVryfa79NYzPzjpL/MSXxxTUo3wZwdjpcqgbstVH2aJoMXP8yWYFXCrRnU9oOCWA34lgIYaTGIeAafkW7eeouXIu/LQwaoDdzik2PyyyV/heYiQzlgJ+Jt/+Jz47RYkq7Of5AluGUH/m0rnc4qlQdir7U1ilkv2WlXvx+OMS+9riAn/H+mE5JhNbOLAiUaU5G0ynHxL/w8GSTrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y24wdjFFSzBFZXg0eXZ1TjlSZkdMcGxGZ05kZitPYjRwajBleWlrQ3JHSFA0?=
 =?utf-8?B?WlFSdXRxZXhHSzZZb3pkVDBDVDhDU09jZHZZdTl3bVJGejFyZ3FrNmt3OE5o?=
 =?utf-8?B?UG5iOXJxeVAyTnFtbkZjRXVvQk5DM2Y0MjBNc2Y1T1RLVE1VUU1Wa1RiQnhn?=
 =?utf-8?B?T3VrQzJpWnM2S1ZDaTZpSElyL0RGdDdXZWRjZnJWYlRZNVMvSGNEWHdTMGN5?=
 =?utf-8?B?SnZaS29OTmZjd2NXWHozbWpXSm1ydzk1dHl4RDlPVWptblRmaWNvekUvM3dv?=
 =?utf-8?B?Vzk1WGpYSDdSU3JQT0VqUVdsZHRpOThVdGFwQTZxaGo1RlgzWlprN0N5N1Y0?=
 =?utf-8?B?OWM5RjlIazAvWTVwMFpoVDJ4NWI5WjlUVjlrUEFRcUhOd1FKazJpU2FwdHJI?=
 =?utf-8?B?Tkw1NVZGd1FvWlJwd25NMUJjdDh6aGoxblRFREN3cGlXaFBHT1NDZksxQk1W?=
 =?utf-8?B?N2swd1p0aFpKNEZHalo0cy82TGQraUxlQzdyTXdyc0JJeWVDNE5wSnB0aE1s?=
 =?utf-8?B?cXQ1bXpIU0hLWHAyUXM1cE5ENkdXRDdCZ0hlK0RLdCt5WjBvU3grY3l6UE45?=
 =?utf-8?B?RzA3SmZWQThNd0NvT3dLeWJxVkhyMk1TYVVCTzJXeU9JZUFCS3o5bG5pRXpL?=
 =?utf-8?B?b2lyRUUzNVlOWnVKeEdLTVhLcTFmd2laU0RrWUhjMHZLdFVJeG44eU1LM2RE?=
 =?utf-8?B?N2hjSVlQL1c4cW13ZHVuNVIwSm1aMVVPQlp5NlJZVnAySE1abmNiUXNvVTNS?=
 =?utf-8?B?ck51djBXU0tEYkt4cXczRDl0NnVvbGJSYzdyMVlFODJBVURhcjI1dUdxUE5a?=
 =?utf-8?B?dmtUOHpGeVVUdDR6bVdvWXRnUXFPazBoMm1nMEpLNkxCWlR6V005cGovaVpt?=
 =?utf-8?B?UWdKRUFPc0JDU0t0M3BOeUlNWWxMbHczTS84QzVXd2tJVzRybHV2ajdwZmtY?=
 =?utf-8?B?b2paSEZIYXN6RzZsNGJkWVJPblhOOUVEVW1WZzNleWVqR2VsRDFVRU44SFBs?=
 =?utf-8?B?cE5TVU9Ma21WaFhZRDlKVXN4bFJMNjh6V25wTllVR0VwWkVpMm45eDNtRy9t?=
 =?utf-8?B?QnVzaEN4RUJ2M0ZMVTcvSEVUcHRUdlJGRGNFRUdqZXB1MzFFVERJc1NEOUtI?=
 =?utf-8?B?aFZmYlBna3pWTzlNMmp3OTAyazRwY05HT3ZDZnBhUTdBUmFZbEJxWnZGUHFW?=
 =?utf-8?B?bUFhNlRORzZPY0pRUklzNHdrNVZORWxWTUpFZXlnY0ExbWk2V1VZTTVVS0Nk?=
 =?utf-8?B?TkdkT1NuZmk0K3NiNEd4elhYL2VNampyRnVISTk0M0JqL1J3T1o4VUEvTU5E?=
 =?utf-8?B?dHlEZnYvaisxdUlESFBGMktKNGVDaHZFVE5kK29hQ1U4NXNQc1BLVEk5Nkdt?=
 =?utf-8?B?UjhTT05XZ3cybWNYejZkUWFyRG5jYzBpZnM4MUhjUFBTQ3duZDRIQUFYM3Ra?=
 =?utf-8?B?UzRiUkZkYXUvMGNHclpSb2lORStRRW52TGErQ3prOHdORkRPSjJPdmJVT21G?=
 =?utf-8?B?N05GL2Jva25nVW9EcEZjdDhkMXpoQkFsMFBydHd6bEw3cHNwbHFmcXZvU2Fn?=
 =?utf-8?B?Y00yNVl5S3czRDJYZzNoZGwrMWk4VHIzcmZyWjA0dUM0RnFIRmVjdVNReDQ2?=
 =?utf-8?B?VGgzblRBbnJRejN3RWMzVEdhZm9tMTFLeUxUN3R6Y1orZGVpQkJwQTRSMytz?=
 =?utf-8?B?bWV1b1ZFMWxMQStEbUp5OXAycFdURUFiZkc5NFp1b2plVHpIRmNVU2cvVnN4?=
 =?utf-8?B?a2VkNDR2UldoL3AwOU4vdDgxb0l0ZE5XWWVwQnVkNWMxR1FHbFJBWkVGajFr?=
 =?utf-8?B?WVNtRHpHY2pMVENyZk9PMllKa0Y0VTEwZ1V0VDd6a1U1YTJMRHQ4bGtBbDBN?=
 =?utf-8?B?TmNENG9IdlZieHBGZytBWloxT01Dc0dRa0ZJdVVxczhwbGhZa08wWXN0WGlI?=
 =?utf-8?B?dTZscFNOYkY2cHVJL2VLZ0NwcUlhRXpQQjBDVlJqeDFwK3NkdWhReVd1MEVT?=
 =?utf-8?B?amY2Q3RacFp0NTk3V25YaUtCbWVXUTFEWXdoTHhXT0NHWmJkaEJTR3RKcUJ6?=
 =?utf-8?B?YllRK2gxUFdYZGFqY0UxUkVVKzVoZG90RStQVkNSNlIxMjZpVXlhdjFmRGFF?=
 =?utf-8?B?NXdQRnYxeVJvT1JxaXpieTd6N3ZRMTg0ZnVvdGl5KzZScUZheE1pMCtZUUNz?=
 =?utf-8?B?V0FrMUtyMEd3Z2xtdWdrY0lpNEVhWGpXemdoZXdZRSs1U0VtWkY2RzVKZEl1?=
 =?utf-8?B?QjdqdXN4cGVmV2YzUSs5ZUx3NWVLMjBtYW4xMHpOTUw2NmN1WWhKNlFpTjA2?=
 =?utf-8?B?cmJ5bkQ4S21nWTF2OU1Ld2tpM1QyRHM4dzBtakdJS0k4NXB0bVVBZUFDZ0g2?=
 =?utf-8?Q?dH66rLPgiodJ5QWcIE5RIJy41jgD83kAgLA7IcaUs6qw5?=
X-MS-Exchange-AntiSpam-MessageData-1: SMjlFwwMb0FjrQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144b4aca-7b2b-46ad-d666-08de8558c180
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 01:42:18.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/Y8ZpDhtHwlmNHqt/XqAxatvIP/2uQwJcNksCHljYRTsPh56G/hO2hBsvXWYe5P/Ry99TvWS+I2zQgBnGg2WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_184227_648674_4B1D9F7E 
X-CRM114-Status: GOOD (  20.63  )
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

On Wed Mar 18, 2026 at 5:05 PM JST, Alexandre Courbot wrote:
> Convert all PMC registers to use the kernel's register macro and update
> the code accordingly.
>
> nova-core's registers have some constant properties (like a 32-bit size
> and a crate visibility), so introduce the `nv_reg` macro to shorten
> their declaration.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs |  7 ++--
>  drivers/gpu/nova-core/gpu.rs    | 37 ++++++++++-----------
>  drivers/gpu/nova-core/regs.rs   | 73 +++++++++++++++++++++++++++++++----------
>  3 files changed, 78 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 7097a206ec3c..4721865f59d9 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -13,7 +13,10 @@
>          DmaAddress,
>          DmaMask, //
>      },
> -    io::poll::read_poll_timeout,
> +    io::{
> +        poll::read_poll_timeout, //
> +        Io,
> +    },

nit: // should be on the last import?

>      prelude::*,
>      sync::aref::ARef,
>      time::Delta,
> @@ -532,7 +535,7 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>          self.hal.reset_wait_mem_scrubbing(bar)?;
>  
>          regs::NV_PFALCON_FALCON_RM::default()
> -            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
> +            .set_value(bar.read(regs::NV_PMC_BOOT_0).into())
>              .write(bar, &E::ID);
>  
>          Ok(())
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8579d632e717..d81abc7de3d7 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -4,6 +4,8 @@
>      device,
>      devres::Devres,
>      fmt,
> +    io::Io,
> +    num::Bounded,
>      pci,
>      prelude::*,
>      sync::Arc, //
> @@ -129,24 +131,18 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>  }
>  
>  /// Enum representation of the GPU generation.
> -///
> -/// TODO: remove the `Default` trait implementation, and the `#[default]`
> -/// attribute, once the register!() macro (which creates Architecture items) no
> -/// longer requires it for read-only fields.
> -#[derive(fmt::Debug, Default, Copy, Clone)]
> -#[repr(u8)]
> +#[derive(fmt::Debug, Copy, Clone)]
>  pub(crate) enum Architecture {
> -    #[default]
>      Turing = 0x16,
>      Ampere = 0x17,
>      Ada = 0x19,
>  }
>  
> -impl TryFrom<u8> for Architecture {
> +impl TryFrom<Bounded<u32, 6>> for Architecture {
>      type Error = Error;
>  
> -    fn try_from(value: u8) -> Result<Self> {
> -        match value {
> +    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
> +        match u8::from(value) {
>              0x16 => Ok(Self::Turing),
>              0x17 => Ok(Self::Ampere),
>              0x19 => Ok(Self::Ada),
> @@ -155,23 +151,26 @@ fn try_from(value: u8) -> Result<Self> {
>      }
>  }
>  
> -impl From<Architecture> for u8 {
> +impl From<Architecture> for Bounded<u32, 6> {
>      fn from(value: Architecture) -> Self {
> -        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
> -        value as u8
> +        match value {
> +            Architecture::Turing => Bounded::<u32, 6>::new::<0x16>(),
> +            Architecture::Ampere => Bounded::<u32, 6>::new::<0x17>(),
> +            Architecture::Ada => Bounded::<u32, 6>::new::<0x19>(),
> +        }
>      }
>  }
>  
>  pub(crate) struct Revision {
> -    major: u8,
> -    minor: u8,
> +    major: Bounded<u8, 4>,
> +    minor: Bounded<u8, 4>,
>  }
>  
>  impl From<regs::NV_PMC_BOOT_42> for Revision {
>      fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
>          Self {
> -            major: boot0.major_revision(),
> -            minor: boot0.minor_revision(),
> +            major: boot0.major_revision().cast(),
> +            minor: boot0.minor_revision().cast(),
>          }
>      }
>  }
> @@ -208,13 +207,13 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>          //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
>          //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
>  
> -        let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> +        let boot0 = bar.read(regs::NV_PMC_BOOT_0);
>  
>          if boot0.is_older_than_fermi() {
>              return Err(ENODEV);
>          }
>  
> -        let boot42 = regs::NV_PMC_BOOT_42::read(bar);
> +        let boot42 = bar.read(regs::NV_PMC_BOOT_42);
>          Spec::try_from(boot42).inspect_err(|_| {
>              dev_err!(dev, "Unsupported chipset: {}\n", boot42);
>          })
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 53f412f0ca32..62c2065e63ef 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -35,20 +35,64 @@
>      num::FromSafeCast,
>  };
>  
> +// All nova-core registers are 32-bit and `pub(crate)`. Wrap the `register!` macro to avoid
> +// repeating this information for every register.
> +macro_rules! nv_reg {
> +    (
> +        $(
> +            $(#[$attr:meta])* $name:ident $([ $size:expr $(, stride = $stride:expr)? ])?
> +                $(@ $offset:literal)?
> +                $(@ $base:ident + $base_offset:literal)?
> +                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
> +            $(, $comment:literal)? { $($fields:tt)* }
> +        )*
> +    )=> {
> +        $(
> +        ::kernel::io::register!(
> +            @reg $(#[$attr])* pub(crate) $name(u32) $([$size $(, stride = $stride)?])?
> +                $(@ $offset)?
> +                $(@ $base + $base_offset)?
> +                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
> +            $(, $comment)? { $($fields)* }
> +        );
> +        )*
> +    };
> +}
> +

Is it really worth introducing this macro to save pub(crate) and (u32)?
Are we definitely going to always be using pub(crate) and u32?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
