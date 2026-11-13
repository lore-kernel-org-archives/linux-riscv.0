Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322D4606A331
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bibRVNr0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PMyGAsdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IDMqJpjwByKUSa9jn64/cIp7zREBX7AogHTqnEDxD+o=; b=bibRVNr0hTychrCCphUQW+BHBx
	tpX+hqpq7TjftSmxd+Hy1XVFD54xqUNOJhJ9U2ZESqqGzvBh+EYejny3+yKrFSdX4yk/JzK1KjOJg
	PaNxAEnPW+Rzp7Rl8sNbbTEYXV95jAqoJ66WjuU3hUHcW/oj681L8wO+Xg2X/85tdQ7LhhLN+2LT8
	rmNI/Ttq6QVKBdwFmDYqXxh+Mpk5hLp6U0HXuFd8gPv5/fZGtWRbn6yDPAVKWZG11bA0wy5EYppD8
	HMXucjOv/U23ysj/MlbQTbsWA8fgNw1vJLU8EKCyLkww0iC1ph9rbs3Mj7hNgt0hEmxNKQr5cDQSo
	HZYCkd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvm-0000000DKRP-0kWn;
	Fri, 13 Nov 2026 15:11:10 +0000
Received: from mail-westus2azon11010058.outbound.protection.outlook.com ([52.101.46.58] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvP-0000000DK9C-44lx;
	Fri, 13 Nov 2026 15:10:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xE5iYvDXnfaVXjK//GxfFOyBrywQEz6Kfiyy63r96OvpR1wPv4v05tFoiviujcJZq44ENbLtlZH6We86jRjzuUSyEH7PcMeCEtYgxmMhDoKDek/hI5rPj4Lq04fE7qqf804KzN/y/c6swPqbyFpVxjPbaZikV6CoEJzplwK+KTr2BUDxUSgYAV3CQznaqxtGX7m9UU/6GBelNQ6wOy0rFTBMIp0auEhJTMutw5E47lKHlunQKwowAL88KuWdCJvb1CSfHLX9M8GXk785/QSiOus9wlziLhUUaszYgMo2lYcF7Yrxj6dQPdlBhV3vxpRbNlpAfgkFExT3w618Rmzlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7HBWkDKeLtJPveFqtHPnJOjDe/1YPf7zdpjxOy8T64=;
 b=C+lOjuxsmI3Xfsx8OnHCRYtvw1kR6KWDTvld4ms3YE02V87R3KvT1744+1G0YUeCNAasWwLsc6sNoiJExmsgfSUWXpPqW1ACfdUvU57DSzO00Nt09jHbiAngbXDXxYmuUE4vom22mrUQgutmvtYC7X+wHQLe+Z7Sg2f4hWPSns0wvnNQONoqJjs6ou9mphKvd+cNca3YiKiTLJ47bGjYc/EQ6wOBKaSxnVeZv+lrhKIgLcITNejukwd27YTejgcRBilhxUqHvw6+Y0RRPZNGRZqA7Arty/fwAtvj5l23bFS/dNu+f8yFRglfIAA38lkjh0C6/v0doRi8dkOMZvcFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7HBWkDKeLtJPveFqtHPnJOjDe/1YPf7zdpjxOy8T64=;
 b=PMyGAsdf9waIY5s5gezDZ15Hsc5Ic4ya03LFQ52iyCWJjTBXtACKHbUGNXfQ2UGDuzX7p7Zj8uSn1NgSBXuUJpPZzFrgFifwi7ifbqUxDx9X7FeNNJx5Ve0l6Op8Xo1Ga/ldBUzI28qX+2IGJlG4fDSPr+KrF852DgBDVpYKhi7WWdY5aJpjtnq0a1MiaPF7e/16E2mcU2UsDSLJUayCLOufdHhmlOom2uUBHQ1yZKKoUQiYEQVySpb9sRvMhVjBhYU9Ho5SS5xIVGYwTE+cdm2ETrdzZ/j0Dz8w+wkD3outY4MZIknEBhLySzxofYMkhVT2SyVJDLUMsf3/f8TqAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV3PR12MB9332.namprd12.prod.outlook.com
 (2603:10b6:408:20f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 15:10:31 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 15:10:31 +0000
Subject: Re: [PATCH v2 08/10] efi/libstub: Make efi_remap_image() return
 efi_status_t
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261110121731.2728824-20-ardb+git@google.com>
References: <20261110121731.2728824-12-ardb+git@google.com>
 <20261110121731.2728824-20-ardb+git@google.com>
Date: Fri, 13 Nov 2026 11:10:21 -0400
Message-Id: <179458262197.3625095.9864111551590308665.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4PR01CA0320.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::13) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a41b124-e762-4a4c-c2b4-08df41983ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|11063799006|4143699003|261102123227099003|261022115727099003|261022105027099003|261021121427099003|261028144727099003|261026140227099003|56012099006|261022075727099003|261026121527099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: UKiYIdk+fUazdQPu3fnpj4Nj5ONZr2QfezE3YDycFPayq0SGmtpO4yKbWlwfxcgv5/z35ALkPxpxES3/nL+GjXy/2nvbzkTVZcnQC6uu6dwPq7DdU9b48SB3esIKa/hyMtYsq4toNjaU61I4p+368TCuMTuganKduMEc6kvUMnYNtc2c/E70813a3P3LF5ju5gAzYyT5tTXRHbBxxEuF+LrcjlTrxLx84Z1vARcUNcHr6NFvGNUS6etbOw4cemJ6sZl2+qCMw09xV/LnhwpbCRrDtzW9wxm2whzXvfHTNSGGZJ7KgaeVVOt9a5heAfr3h+NkXsxzbLyBOYO0ZftWqGRQZVUU9uX9mojVxeZcHcKjIj1oS6ouqSi3wefSSBomEFDjdEtxMlUTDPoFBDd1O0vCbdp+l2HCZJjyl6G9r2rHwdG7meb6B7UF5/ZMZ8aA+cAqf+tsOHWrOJNtiNhQvux3r0lKIt3E0z4RN9IVllqvKetVZzV8EKjdQmyKcde3rLPxS7IufbTNBuDfAyf9M3M/+hH9L8vMrsro3Py+03qTG4KYNR3qe0xVkL591+576OHH7vlMkYrp3JcD5QSZE2gu/I/figzADO+lrHuQTfUqEeAherQk4wyFiquqHxZn4i1cW1B0T6/fPiaTGd1Q7rzvF8G0APmrA7KhB1uuJI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(4143699003)(261102123227099003)(261022115727099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026140227099003)(56012099006)(261022075727099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WThVRElPYVdRbXBFLzlUQXZqR2M3a2RCaGlQb0FMVGZaWFo5YVZoZkZTK3Iv?=
 =?utf-8?B?OG9OZ051YTM0S1A1Y2lHQlJqeklRaHRHbHhMU29NYi9QRjZFMnoycmI0WW5t?=
 =?utf-8?B?WlR0SUZsem5FdG5DZ09hbW81MHpNN0dYQnRBZ3ZKR2lvd1VJenRXMFh4dlBm?=
 =?utf-8?B?Rmg4Vzc4elZ6TTBPMkp3WXJTUlpQL0o1WHd6dlJxY3owazltNFNaZyt0Si80?=
 =?utf-8?B?aWxNVklFU0d4N05sdU01NVk1WTFvUmNPdmtHS2xMaDdTdGoyeFVLS090cWFH?=
 =?utf-8?B?MnRGR0phWmVwcGdTMko2cnNoL0d6aE5QS0RSS0tUYjhaWGxoZnhIdzdmbW1h?=
 =?utf-8?B?RjlET1I2Zi9FV0xQRDhoSCs1N3NWOXE5TzVBRUJEUjlpUHVtVXNqTlFJYTZh?=
 =?utf-8?B?Visxa1c1MmJMNkV1ZjE5Zm13cFFmVFh6cDFWSmgyRXdmcFl1OWgzUDBmc1BP?=
 =?utf-8?B?cUFEbnB4NUVlTC9GNjdHRENrN0Yyc3RZY29WZmlLbUtGRlZ1UjFPVnVhclFj?=
 =?utf-8?B?dXBmZXF6Qit6NFpzcWJheTQwRjVsQ2dMeGR1QU1ZeVhrb1hXMDJYWHh5TGFU?=
 =?utf-8?B?T0hiQkZrRTRpVU1RQkVjSC8zL3YweThKZ01qUnlkQnpEYUtieXVCOThiTjA3?=
 =?utf-8?B?YmRKL1QxdFV2Zitid3NWK1pySG1TelBESmNQSEFZdlJLSEFxbGJoeW5xKzhv?=
 =?utf-8?B?YXo5ME81bnRuY25xNWl6VGRzcFdmOHhZYW1ZMTI2cm5uRmtPRFBMN2VXbVE3?=
 =?utf-8?B?WkRidkJyWHlDTC96V1FRdlgzWklKRFFQOStmZEpZVmRnU2Yrc0N6Z296TnBN?=
 =?utf-8?B?VlU4ZENrUkxyaFVNUGFWWVRnMm9zYTMwWVVORzU1QXBzQy9UMGV2V2tONzZ1?=
 =?utf-8?B?d3RwYjV5OXc5OEJQQ0EvdGhqdDN6TGtuZXVVZTB5UGVrWXhFY1I4dU41MjhW?=
 =?utf-8?B?SGZ1UjhJZzVYbDdPMGpjTGJTWGZEc24vWHVlaVcvdnpDaTlYUTVwR0RjblJE?=
 =?utf-8?B?KytNSFNHQWM5NnVEbUo0U21rTlg5b3BpM2hicm5lZ3JISWJhamNpRFBtMWUr?=
 =?utf-8?B?ZUNaVWVyNXBDN00wek5Pclg5dkMwdkxEay9WalpDMituM3NuUWNmU0ZKRWFP?=
 =?utf-8?B?aTV2STFWOGZwRnJZVkVSbGFOQUR3aFM2VE5jK1NJcERyTmlUVStJSmRPd1Q5?=
 =?utf-8?B?VzRQTkZLejBFVGt6YjJWZ3VzWHI4M282ckxLMUJ0bmpqdkYxOUtSdkVBSCsx?=
 =?utf-8?B?U0xobFZqM1lWZ3RDZlNUeFBoeFN2L0kvWEZpbzM1N1p1cW0rK2ZYam5RSFZi?=
 =?utf-8?B?QWJ6cStvZWVuWjcwVTBhbWozMVFUcXRZbGlRaHBrUXNHeHppZ1hhNkEvOFUr?=
 =?utf-8?B?QmFEMVkzYm1Hd2o1WTFpUmNudTAvUUEycGYwNkZQaTNBWTE0SWVtYkE4K25E?=
 =?utf-8?B?OWZKYXpwQzlTbWZqcXpYbDEzZW5aUHlLdHNzY0hJLzBEUWZnSVhPcmFxUnVj?=
 =?utf-8?B?VW9RZ0YxcWlNcjV4M0drdHdOcTNyL1ppc2hRUEU5TE40aVhPZzdkUm9Mcytq?=
 =?utf-8?B?NWMyMzZLdG9lTGcvQjB0OFduc0M4aUVsNG4yV2FTUjR0OVpSbTN0aURhVW5y?=
 =?utf-8?B?VEJMSDZvNEVVejJTQ0g2Y0IzKytnMFRXUUZtRzZsMGY4UXl6MkdWd2xBM1Fm?=
 =?utf-8?B?TXNCTE9sdHJaQ0NoNSt1V2s0Zm13cHRBRjNwSm9lSUxuNjB3Z0NyQjhkNU1j?=
 =?utf-8?B?SGtHaUpmekd6RUZpdTJpZG9kK3JHTHZkUFlRNU9wMGEzN3h5bks3K1c5RlJC?=
 =?utf-8?B?ZzIyNmNESW1IODJleGRKVk1oS1pndzFpN1djak51aklMT2hwV0hwUmlyUUx6?=
 =?utf-8?B?UzFjNVZiOEZuRCtCRFBjMVIvNGorbXIwM2U1V3FTd0R5T3NaM0ppbGZuZUN2?=
 =?utf-8?B?T1VhWDBVWkNOeGwxcCtXWEZOdzZrNXFCTlFnTTlZcW9QS2xLcGR1SVNCZ202?=
 =?utf-8?B?QmxnemVReTFsZllkeTEwbjZDdmMwS0JSTlZIejVVV1Z2VDJHTnFtVmpxbjNx?=
 =?utf-8?B?cEhEL3pLRUZSQ3NFNzFqVVpLNUE2RGNDbmI1OU1icDJGWXd5c1N1LzQxSFlC?=
 =?utf-8?B?MEVtTHcycTljR21KdTk5OUNlNmZIWlVZVlB2R1ljeStoZVFzOUNEZE1oUW9r?=
 =?utf-8?B?dDE3cG9oQkp4bGhJSDlWT3JWY3BiMExxTmZUQmE2M01RaGZBcUZhbjUrd014?=
 =?utf-8?B?dk1HSURiOGFEckR3N0tmNGo0ei9xU2QrU1NiUlBUK0RVNlppVnhNVDhPN2xY?=
 =?utf-8?Q?XImQW0VNSidbM0PvL0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a41b124-e762-4a4c-c2b4-08df41983ef2
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:10:25.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/nLRrBrVlpCnG4tJix/l3xSiwwnMopWn9eoTOLbzx1NLfuzBHFkGEyf+htuY/W2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071048_047535_5F3C0632 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 13:17:40 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> efi_remap_image() uses the EFI Memory Attributes Protocol to remap code
> and data regions with the appropriate permissions. This could fail for a
> variety of regions, all of which are currently ignored.
> 
> So relay the failure status code if any occur when invoking the
> protocol. Locating the protocol itself is allowed to fail, as remapping
> the image is likely unnecessary in the first place if the protocol does
> not exist.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
