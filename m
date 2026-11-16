Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF4606A32F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvR1nOX9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JulS4qQW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+h7y5mIG5Wf4jAllX36VI/nqex7UiB+7TNxIPLUTbpE=; b=vvR1nOX9XGUoxEeVJHJJIjjZM/
	A6bqdbybTjm0h3DGqAAVSYIc2mi3c6QK3c+ieMj3oLStRZLKal5InRSAtGx0q65cE/KLDcysqAyA3
	+1iNZCPNdRpeBWmYiqEjAutakImh2o22+3zol8qbmpQchM1GbNz03i3RMMHyVkWj1wTHCw3Ua258X
	rYIj3u0/XLWtqGjVIrz9/1z5WXKqmBRflwn3KymrX3072/kXTeijqZQ3SgOfsJEXmbTiwD1EbsF2W
	GzkHRy82CHwddyR/OQz3hIa/lOj8cjFbQQ2hN4rjqpY9a/6ZV7PiSdTHFg8mYuQrO7Pgv9EEgNZHN
	Jo3uqPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1p0-00000003ePc-30qr;
	Mon, 16 Nov 2026 18:52:54 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1og-00000003e6l-1TsR;
	Mon, 16 Nov 2026 18:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTSlVOZ6ssEvUEqLDhNw82C/KEw63zlJBUb7tMXbvEenmttOSmMtIrXPEVa77cqAQbwJ+jqExrxKZjzJMgU98OTC6LNplTll1ZFsLT0y0EAy+Tt8sErZ1AjgpgV70W2BDnr0DfbdK3ofYT+9vjvPpcL080o+X2HT6P0VtC1kDXUcX77d5lv5/YB0SKhldaG9haKyY9llKYLKLvQlp6TNndCIZ8Nwl2Z61L3LwlXLS2g+1Fwim4Nn+n4vCG/pxc6U9HpfjidRCI4eOeJ6GbCH6uQaMzTKNq6D/RBwL7lB+vJImzt0TL2s+cUvyVCQKPauxb+6f33yqLX2iVfyr1h4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHVtlraUPQQ/HvMidNSsNfaagp1kVbbuWFsoMLlFz3M=;
 b=ZIXd0aMNVcbJf8Zhbtm0cgbHqLSL4sFUZAwzfrlWaKjPeNVlui+chmYADUfKIENUZAxFIhau8chZ608qnnqV+c1uEv7nuAnBgebUrxdJt4dDs3qZi4n+CNR8ijBVeHhWMOZQu7tIXyfCJe0UuxDnXTWWRvYgBAAS4Y5FQLoeioQR9jE6+wT7O1MpdrPuxzTdHqhozOi1/efZ8Pyv5FCnEbmOfPHg4X1gGoW3dAjKTJ8gFXacFcijsqJD2UKPPL8PymAzKAsL1ib4f5AmjA7XmbV02tB1Jtlvr+Dw6Y675eGFf8L0XO7b1r9nAutR6DRldXNG1Eq9+UCGrX7gt/HBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHVtlraUPQQ/HvMidNSsNfaagp1kVbbuWFsoMLlFz3M=;
 b=JulS4qQWzcBQXcMF3uV7DR/M433m+Vt8kI4seMCn6jEWHxZafEIkngRyTZOFn+B0FyYhbZVygms42KWFwe0P6l0mMB7UHjh9nEmbVwttzmOM8tMS3rdms8AtyI/0+UG9eotCalhBuPD9JEYYuUBsumvnumZCfXfQbVXcjdWaTWBfc04EcYUFTqSH+5xPsy++vG+yr+JWfWMF4uxqgr2UQmbRizZhHgl64X9x1XZporaBL5Apl7ri2F2Eq+D8fXP8cEaHjJKMIeS0CR2SOrosGfzq2DlW1jf/zugfZmpF74CRqfWes/AQf7vX2pseNFjGsq0oggU0hOxsEu59J1cI+Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV8PR12MB9641.namprd12.prod.outlook.com
 (2603:10b6:408:295::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 18:52:20 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 18:52:20 +0000
Subject: Re: [PATCH v3 02/15] riscv: Use _stext not _text to denote the
 start of kernel code
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261116142618.1687025-19-ardb+git@google.com>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-19-ardb+git@google.com>
Date: Mon, 16 Nov 2026 14:52:15 -0400
Message-Id: <179485513557.2274641.15719456959562825612.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: MN0PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:208:52d::27) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV8PR12MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: 54321fa3-528c-435a-b0df-08df4412be31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|11063799006|4143699003|56012099006|261022075727099003|261021121427099003|261022115727099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: tzeoBo4NZK3sm0TfSuGXMq53lbwMPMzrcTDuMU+/FOI+0ZBeL67ltnEAxuly9ZlOOVqd01JdqPJWgDkHWE2VGGbzMn23O4dehvjXsVFSrY/mUCZa7cx/MAOAiyibtMTmu4BbAmODAamTatyvjmxLZ9iZtsaxT8H4U3+xYaEk064012hBGTx97j/LNX1lqPiOEwJmscY2ln1DQCBJuXuzP7CH9PRoi2iCdo3FH1fa+1gMfYSwoWz3DS+iMRftcYBDrRMXu4MGpYoiL1XSkJTGkn9uNIzc+9tgoUln88ck03uy8tO2ddyTmy7YI8tooB825G9ZElZ3yCtomxuceCpA0lFrCBDdbwxSaI/9uBhMWw+LP3On6fH4y5kmNxNBWuhSxB+GkBaEGacq1rUkaomqZyJ8EyMGhBsKB4meTX3z8XzqozCEb1ihl5sndJ75KuOxMHKNbKil66XUjXQ+QubwAarkq5jBb4E4zssqVuXOmlAL7zoQxAgwahqHTT9PxObhIQnCdrh4E9pIo7xW4R//77Ns/33meqflfLz3XwBCFAKcTtdp8i/vhgPCITj97hHLzRgytY0O54/mfWiW3z4w0IpaCs4RBBL6cGE388iHK4P6gQcGg4LxcQ7QpJTZpkJ2HUtIz4b46KG/gdP6mxCuyIsBRY2JkkqFOgo1/buGSlI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261022115727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjd1OURvOE9OSTQxTU5WM1ByczFkVys1Yi9mSGVMdmZaMHBIek5LaGkyakln?=
 =?utf-8?B?RGdVazIxS3pkK2lMUXQvMzhDeit0NjRRU2cvb1BMQ0lnd0xjQkJXb05pejJz?=
 =?utf-8?B?cHFpMDh5ckZ4ZW5wS2Q1ckQrdGFXUWVKN012c2Z0aXIxcHpYOVNJd01ha2lx?=
 =?utf-8?B?N2kzbEVDUEVwV29sUHI1SjRDM3NTK2FHL2YvbUw0WmRnS09QalNUTDlNdkJ5?=
 =?utf-8?B?UHZSTDNBUGJYcHZWTm1wR05pYkJiT3RrS0FSQ2lyNTByWE9iQkhmUHZhenZC?=
 =?utf-8?B?M1ZFTmdEYzJCaGpoWGttak1tOWFwYnhEZ2k5Sm5UbFlwT0NsTko0N245VmJk?=
 =?utf-8?B?c1hFbVJqd3FrUkwwQ0pDdUFaSDNRc3NhYWlMNVhVZFpNb0pobXVNZzhITVdQ?=
 =?utf-8?B?QS9wQ2dLU211RDZkVjhwWXhQakg0ZkdiKzdTOTZRL0VHK05CNkVLWFJLYWpS?=
 =?utf-8?B?OWExaXc3WGtHek1TektzMTZpaEdlNjR1NUgyVE94S3dERlQzNlE3ZUpNSlNB?=
 =?utf-8?B?MVZxZ3RmVzNuRUQzdmpDVW5oN0loSEdIQUVscXpxK3dHMS9LUHpkdEJKbWoy?=
 =?utf-8?B?c3pVV2tTZVJqSVBlZzJtYVc4S0RPOWhOZk9KbDV0bm93MlRTZ1laK0ZlcUFH?=
 =?utf-8?B?Z0lCZnY5M2FVVk9DVTl6QjFIa2ZvUE1GV29Ndk1QdkNKR0V3R0FTNmtBM1Fv?=
 =?utf-8?B?amdGN0FBT0dBckdZY0grR29FbFN6NExyeHlFeWJ3M1hOdlFoOWNEc1ZXZHZD?=
 =?utf-8?B?enVWQU1EL3VZSTBIaEJmbVpFNmtySDFScndNNkRvektod1VCQ1BMNHE4Ky9o?=
 =?utf-8?B?NGNSMHRoOTNwREt4WTlPTXFzMHBHSlBUblIxRUhOYlpyM1BaY2xhbll1SUNq?=
 =?utf-8?B?TTJjZ2p6RVBZNXN4cSs0WkFTMmNtT3NET2hHOGpTU1MwRGhUSzdZVHg4clFF?=
 =?utf-8?B?Ly90WHBZWWh5NXh1eFFBaE5XMVhCaWV4Y0x5ZXpZNWF2V0dJdE1PblZCWGZr?=
 =?utf-8?B?TGdhRVVBV1R5bFVOb3J5UkgvYmxKTVRzU3pHcmZKT1pWN2czelZ4YzhZaFRU?=
 =?utf-8?B?TlB6V1M3TEl2Tm04NTlYUXRMSEh5b0FzbG9aN1lvd3RYVFkxT2FEL0dBU2R2?=
 =?utf-8?B?TjBHL2pGbEx2ZDlNbWxWZTBDWGVLT1JWOVlzR3FBMjhJTjVZWGl1ekI3VWlC?=
 =?utf-8?B?L2dxVTRMYXVqWHBUTGxhN0tXeUtDNWp4clAraFJwRXVxUUlDYk5ESWdwdHFR?=
 =?utf-8?B?T2d0cDBjL1lXaFB5VldPb2duc2xGb2d5K3B6bzFaWmdZRW9XTVlaOEF6ZXY3?=
 =?utf-8?B?OWxxZ0tGQjgwZTJDeVI3THpNcmlDdGlwVzhxYmwyUkxmQlZqWDdOQWJtYWRR?=
 =?utf-8?B?aHBzd1ZVR09FV3ZNcDNydE9pNzdPdUxxRDVya0hZS1VldjU2VkRFSVVCTHly?=
 =?utf-8?B?T0t3dXIzSG45OG4zL3FGSTNuSVNheUpNTFZ6bEh6K2ZSVnhVSmhNZStVbHRU?=
 =?utf-8?B?RmxXalRHeEJCRVhleVpvM2VwNCtESS83dlh5UlVTbk1ycHphcWxtK0Z1WFdJ?=
 =?utf-8?B?NWkzVG5aRkI1aHFNajRMZWxMemk4R0FIdzdncWdIN2REK3RrNFJUNmJ5VnhH?=
 =?utf-8?B?OTdCaUhadjhRWWJEYUhhTWQrbUllaUpKZlBXR0xxRTRnTXY4bHBKVHcrREtV?=
 =?utf-8?B?SXlOR1cwcWp1TUx3SnhOOXpDTFlEMkRYUktkUWFZeHp2UHdFZW5xRWNCT0xW?=
 =?utf-8?B?QThUTVkyL3c4VkxjK3JoaVU5SGE0d3NZbFN3MWdZbzZ5OVNadUErT0tHMHZD?=
 =?utf-8?B?TXJ3R0VpU2JDQS9NOEthK0FlWWtSWmtEbW9CNzRmWDdwZHhlNU5MWVFYTHFZ?=
 =?utf-8?B?ZVJZajgybVg5R3RrZWZKcWs4TlRydEJNcXNWZXF2TjBFU3l5dVVrNFNrSllK?=
 =?utf-8?B?S0JSdmkxNS9Eb1Q4SE9VMERlUi9pMXpVdzVxL3hQTWZ4L0FLdEJmT0g1aXNz?=
 =?utf-8?B?RUg3ZDFHYjhtNWpPQXM4NEUxUmU4bkwrYUI4VTM4akcxbS92LzVsaHI5SlNB?=
 =?utf-8?B?VzNydHVuU3hxKzBqTDFLZ3h6RDMrb2IyNzhjNzB5TExxdStvd3E1R25pdnVY?=
 =?utf-8?B?YUliNUpIRmF2bzRORmh4MEFScXFOME1zb2svbmUxbm1RUEc5QktCL3J3V1lt?=
 =?utf-8?B?YmlMWGh3dXdaRHc3QWo1eVRiMFJjRzZDLy9zUDhVSWV5K3hGMzA1YWZFVlJT?=
 =?utf-8?B?V2RqQW9yUDFKV2QvU09hckdsd0xjOFp5cVNHQ2RXdW5saHJ1MzFYMVR6TW1t?=
 =?utf-8?Q?gkNCN2coGzzR3b73ut?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54321fa3-528c-435a-b0df-08df4412be31
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 18:52:20.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SU062MXMmLPuN7raDUdZWa9U9CSYzg/vLywWE5vlUrZXxWOq2HmuW9czBpSCrErr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105234_445639_2D132F7D 
X-CRM114-Status: UNSURE (   9.92  )
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

On Mon, 16 Nov 2026 15:26:21 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> On RISC-V, _text and _stext currently refer to the same location, i.e.,
> the start of the .text output section, which follows the image header
> (.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
> refers to the actual start of the image.
> 
> On other architectures such as arm64, _text refers to the start of the
> image, and _stext to the start of the kernel code, and generic code
> (such as the EFI stub) may start relying on this distinction.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
