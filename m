Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17F606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vtCcNKdJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tnazY7Ag
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8eAJzqqIaK+gyAteIGISyW0wu46AccCRUEU2JW0TNkU=; b=vtCcNKdJOjDc2CbV87rH9vioJv
	jRxtbkJAk6Y0IWJb4vKT6u6RRjY0v76QBJJkTYViEwyiRxy4Rd4KoZ5XpK8iiK1tJ6dfu2wVRgaR7
	rJxnc6gbmVTHbQbgvSAu3rK8VV35pvsD/kPxkZ8LOLX+w7u5Lmr0KgJC+ymceggaYias+9ILkn+gA
	mnZPgh7L3AoZ8NwoaaH/hIB7bzBGOD5EZORHNaNOGTruVKIakXMGooBwff0HWkG5wSzn0O+fSygLj
	58tAzxMXb3OkIWAdI7/aL3faBKW2ceXN9VZuX6GI9QwdreRYOb1QEiZbGuSzBwTkQDrLFnPDUdW9n
	vRNca/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1p9-00000003eis-2URd;
	Mon, 16 Nov 2026 18:53:03 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1om-00000003e6l-19ye;
	Mon, 16 Nov 2026 18:52:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFQIGtEpyOf4lO6FH9iApyLWxRGXegtAznUkIXYK25iOa/Le7FgzG6pv+meDltoEvI/5rAj9/xr6GeRQyQTdhZh2yXuti9tsa3tOiXsAKWeKZAb66uyldcd2/GsY6RFw9/Si1Vwgk1v9Wgf4H6v5oF0+U9aqPrQfcdQgU0mgg2vsWYF/v+2r43H81+eEKRz3sYU3cP1otJFa4Slfc5t3jdcKkRG76H5yi0G3EvC/sqhs+i4mJBbhLvskwfLNpBko+pzkzqAhFVulwmb6x9ek4dA11SdSfBo2HslWKJFxGmFPUJ6+XsYDwOT5wuFxCLgHDMtmroK24X66WH2Hss1sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W03D3hPmg6zHG8flEZQxMr7hJPzuO7qbkwH3K52Tg5U=;
 b=ZJp0NXTlHtPGTLhS01jjLy5LpE9kVE5mttnix2vsDuKNm6gpJgI0fb2XVWFgty+me+i3kLz75GA0grR5p0zAvjbmBrUQeU3ye8Xxldwg6uS33wjGLG5gQ5HRPE9su6n/HY6kAxOGXvSqAI5Khf67QOis3UJhE0cl06id4pdTzYJBiaJzZ0SKEJJxjkxrjjrkFgfg1vQtfHOZ7pU6lF/c/mpHK5uhSq/iTeHYz3e8FpwheQ7bpSl7NqIrKbB2dgIK0uhBFh6Ce2TDo25CL0MBrVggxfsjKwtK35jHlGMaCx2TAajrXGrqIqUrboNTSYwhDxftqLwIn8W8xR7Yo47oVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W03D3hPmg6zHG8flEZQxMr7hJPzuO7qbkwH3K52Tg5U=;
 b=tnazY7AgqvQJXfpo/7mfpuldeeQRAE571vvYIdnqy1LBlovM9pSjqOCHiLcl9VJcJAMAo3yd/woh285zyVWJ7wUGdBVUBCVujZl1+G93GAeZMInx7M0gxGb9MOaksITvC/inz8vAIJExVEMRLIPCVEztE3uuZqPMYolBHNgOtWbZf1faAVV3pCTsWSKexvbI3yRORRzH5HmZldfSqt0S6JoIJTaURKXIbsT1950ZMbH052IjGpzI+XiUAT7WemxzAgJ9eiUx5brmGXctqLwWIFA2DtQ7RpepwvjGD3pPx+H4feW3JLqLIUwzq+vttkD8o/X7sQtYuo+JrRp/YsFurQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV8PR12MB9641.namprd12.prod.outlook.com
 (2603:10b6:408:295::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 18:52:21 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 18:52:21 +0000
Subject: Re: [PATCH v3 09/15] efi/libstub: loongarch: Use struct
 efi_image_info to access image properties
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261116142618.1687025-26-ardb+git@google.com>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-26-ardb+git@google.com>
Date: Mon, 16 Nov 2026 14:52:15 -0400
Message-Id: <179485513573.2274641.1768058073712535792.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BLAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:208:335::28) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV8PR12MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: feb37622-e220-4c4a-0a37-08df4412be46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021121427099003|261022115727099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SkALbsjykkLIEQftx+jKN34VT5ppu3mPPN4Zytj46i9VXA5eWyXDIGRxwL5rCmXLBZZs1xj0WLGWV52mJQM0m4UY6SfH14/3LZ7PRvVVq/Md8cbmqTLgYGlsoB34ScoKrHA5LTGnDiJRcOzdPd1XuqPWAZfgO9NmJvv8Ubhurj2RE0Jjra77vHHxr1lkd5DnbjC5GifurmJCKOdQH0t/aYabklMaE8Uic1ygLEgU8NYpisyOXkMbr/ggEhzJOQps6ssNEBNqTuh4WBd45QuXWkV8kC775L09znhyefugYPvlR3d7+ShiTy4tf86WbwQ8v8WE5ct9U8TPPl3M7Nomou0gfF1o/8B8kQE3T6OjaSnFZfpuYfXkZyCDUZgybABOyR5Pi2qiAAZiRN9smvvxnHz1RPblT65PNCMBP9GFgdz3teRWj5X6uisFv5ww8lH9KyrYl/Xb4RNJ2KAIckJ26Y0ApgQ2ZEBWonqaHyeSQLVbOfQKpGYaz8lEu308k3/syDb4uSq1NivOfa05qFdVAGMtfJY5bFBVbEf2u4eRr94tcQ/4xh5VHrDizGE5p2gmr8THAn2cJGox9Aegun3AsGy9wJMUTlNnaKOVvUon6ZPIvUzmhV+A2/IsJKpuCkpVtgrhfG+SVVfXgCzRa5Xz2WsGqhuFN93SuOaoc1bEGiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261022115727099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JaUndjV2FYV05NWk1udkpVdHNkV05wNVVBS3p3R3ppT2s2d2IrSUlOR20z?=
 =?utf-8?B?b1VvWnNneVR3OTJnT252MmhXVy9McVlSaDR6bTFXYW84NWRHcHV0a2FIZkY5?=
 =?utf-8?B?S1JhMU9mZExlYTFKVDFxSitVMktQekZXWkN1VW5qTVYrb3JBK3V5VTNqYmF3?=
 =?utf-8?B?UnZhR1N3NW9uUlBLcmtRclh3ckMzOW5FckVZMTFMVG5BQkxvVVNyZlRYRE5n?=
 =?utf-8?B?RUR6WnlTQVFnNVJobVFYbk1xTEdJVkFkOFFxcGQzRmtlSnd5OXJRMlhrZlJT?=
 =?utf-8?B?SVFSa0hWSmQxa3ZSeC9pbTQya2tRbXBKQ3pjRlFaQ1F3akEvOWo2NzRiWlVq?=
 =?utf-8?B?S3RKbDY0Z05kUjFUdHg2SFhxZU5xa1k3UmNpRjZBaUR5Q3V6eitOVVd6Rjlm?=
 =?utf-8?B?Z2kvc1JFN05ZUzJmcERZdFZkMnMxVHV0MnVjNjRqSTVNQzVUa04rZzYvcFkx?=
 =?utf-8?B?S3dnZy82ckdTM0JWbS9LbllGVXlQdG1JTEliZktCczcwZEFJUGdpOUNDSnQz?=
 =?utf-8?B?RGVmTmltS2p2cXJuSWlxVDVUQ1l4K0k2dWN4bC9McVJiZWxOSzNKUXZoenpt?=
 =?utf-8?B?UEdJK1djYjVvQk5sL2p5WVk2ZmVxbDRycG1VY0RYWmg4NHBEZkxNL0pXNjEz?=
 =?utf-8?B?TjZxSE9LTk8yR3JibExYcUIyL3hNNXU1Y1g4bzgxNVJpMlh3VVp4Q0wxS3ZR?=
 =?utf-8?B?Q2JrcjV0VjBjWFl6TEV2d3VMdzRtVU1aaElUTFNpMjc2UTNEci9KSkRsaEVZ?=
 =?utf-8?B?blNxUXdXNzJFVnBsREJTbkVpMUwrc2Y0WVVEd0xzTGkvV015R1JpUDNQZC9p?=
 =?utf-8?B?TUN3UFB0aDZ3YzZaQXNLdmQxUWJxMGJXRkxiNHRIaERGSVBacUVjUnoveXNj?=
 =?utf-8?B?Q3hiamxraFhwUG9uNWJ6ZGJQK0xYamZaMGxZMXpMYjU4R3RTd29DMWdseWVO?=
 =?utf-8?B?Q3FQMzdkM1lBK0QrT3BFRGw5bWQ5VUlXNStDb2pqZzdqUHlaTnV2dkgzWTN6?=
 =?utf-8?B?WGExV2RzclJ3M0dNVUlOR09ENStPZnFjQzNDbGVOWDA5bDRuVm4ya1ZYVkNt?=
 =?utf-8?B?UWNUOFZWYzJMRDF5RzljMzdTUStncmxRZGJPU3lKcnR1elp3dXJQOW9EUkhJ?=
 =?utf-8?B?blUzQ1Z4RUtlVS96TGNLWGZreU1mUnRoU3RRaWV0ZHNrV0VNYkd0dEhZYVV3?=
 =?utf-8?B?SGVFcU8wWGZRNll1TEg0Nmh2bERyOFBPdjZHS05YNi83eWExbGJiZmVEMXFr?=
 =?utf-8?B?RytIUDE2ZFlDd0tHcEp0eTZZK25WU1lUZnptdUtUK01pWGFVdnppU01SSjR6?=
 =?utf-8?B?UjVhTFE0ci9uOVZsMEdsejN2bnJLaVZYT2F0eERTVGlnTElPNmhua0lBUFdX?=
 =?utf-8?B?bWlPQ0lMb3NtczVQdDBNYWRVSHd2Z3ZZTDQxRWZHZnl2K1dXMHNWNHc3T0t1?=
 =?utf-8?B?dTVwRC9FcVZsSENQVzlKOVBhWU03cEs4SUhYZU9qOTl4bjV6WWI5LzNBZy9u?=
 =?utf-8?B?RTJIM3hQZDZiQ29qTGxsWDZMZ0JFZW90ZmFiUVlKRUJBanArMzFmU0kxMEVo?=
 =?utf-8?B?UEdsam5GNXo0cEVGSXUzZFVqaGplWTJpaEV0WmNnN2hFK3lNdFJ0dUhuaVZm?=
 =?utf-8?B?bVNpNTl6YjJpbFBTU05Gd0puNUZUQ1hxd2dKQjNxeEJza1pTcDBDczNWK0V6?=
 =?utf-8?B?QWdmK2lLY3pqL2kzdEUzZ0ZTOXRuaTR6dE9weDVSVXlHOFpwTjVTOFpmcGlJ?=
 =?utf-8?B?R1NJS1l5bFdUa1ZNWWFML0FIdkpsNDlZejVuZmxPZytiTzIwRDNLOVQzRWIx?=
 =?utf-8?B?L0ljTzdDTk1PTUNLNy9TZDVkZXlKeVhTVGtFZmFIZ3d3bUpPV0lTTDloWDZy?=
 =?utf-8?B?S1Z3dzNPYWc3aDJoQUhZdFhRa3p1Q3JtbE1KR2poaEhkSE9JNjc5cjVMUmRR?=
 =?utf-8?B?SWZMcm9pdHdwelA3QlV2SW9vWEg0Q3EvWWxhVyt6QTdpUnQxb3I0Y3JpNTdR?=
 =?utf-8?B?UVhPUWdqUUEvNi9ZclFROHlGK2ZDUkdONGtrUE0xTFBVZTErL0xZejhVTDNM?=
 =?utf-8?B?S1RKdGlXTGJMdzR6aGx2alhQMTJmQmthakFhQU9Lc005WUNDRkM4K2JKNWdC?=
 =?utf-8?B?Wk1nYW8zK29iZlN3RjRmSVYxZjc0a3U2V2hCZWRPbHE0SU4yNmc5U2QyTWpT?=
 =?utf-8?B?MStpWFhLUVlLRm00ampBQVhnV3FCRzJUV1JrV2d3NXkvQ2lzTFQ1OUFOUTda?=
 =?utf-8?B?cERVUXZaQ3Q3SGxOaVNpWnlFeHkxYTFyb29objlpU2thTmxxYU9TT2hKZzdo?=
 =?utf-8?Q?Xzl8OmP3Jv/30pfDwP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb37622-e220-4c4a-0a37-08df4412be46
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 18:52:20.3431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcdQZrhx7nEn5SDqp5fzUoL4UWrd7fctN8uvhZaXBMRlk+nHXFhmZBfyAmz9ZXzp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105240_332523_9B65F344 
X-CRM114-Status: UNSURE (   6.77  )
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

On Mon, 16 Nov 2026 15:26:28 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> Instead of exposing individual symbols to the EFI stub explicitly via
> the linker script, use the generic struct efi_image_info, which accesses
> the original symbols via PC-relative references from the stub itself.
> 
> This improves code reuse across architectures, and makes it easier to
> add new references in a generic manner.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
