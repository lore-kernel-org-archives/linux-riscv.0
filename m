Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B1606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTsAeej/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dNqXAw8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vtEg/JzM5qW4ndKjmSAWOYhHC9OYvUOCUmqSz7ePVMM=; b=yTsAeej/ea9onT0rlT4ckwlJZc
	KwNYT/V25JIHdVDklX/1NgNcSOOooW7i68IJEEik+72FHbRG7XSSUWJOSF4ZvfPZhYRTpL1bQdjVX
	zuNAWvrEj7rFOG+NdUf3VQfroFwgM8zn6VVH6VeY+UTeF02OxvDILjmkcgzqsejmY93krsihYc7Fn
	8OI+0WcNhWpXHEHoM9nt9b0mBKYf2D/9CGhJesrAqMIaPifduWMAu5p4JN3BE8Ru3AjaomhNatmSj
	WDePNQ9Tspoho6NByfn4kfrzu1iCpOfQ6KK4RkCEv/FMK5zwhqPM+30UU8vw8BpygubPR9lLmXN4y
	TnL12jMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvu-0000000DKWy-358u;
	Fri, 13 Nov 2026 15:11:18 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvQ-0000000DK6v-05s7;
	Fri, 13 Nov 2026 15:10:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdnfOAameRNUn95AGlzh79PB2rG9vvqoQIMlO0jDQH/kHmfofe+qV+JXRfcjxGWeLJ4LgFUPdW9q1Jv3b0k8r3Jkc5ShIjjsy4/VpSkTdT/qIY2CIOwXE80pFiA+9EimeUIW1OMPrv5EOrUPXa205K3y9D0ASzgTkE4w8YUJoqq4mb3CShDlfUl6izm8IPkmGlFR+tuiH0PB5EcjT7brLiZd1AybDXwK5hK+sCrLcI+KGi0sr/KMHlQOADX5A2jEeZxF2BPz5btIMdejQ3u4LArs0r7TOhJK4X042TmHPLInQVPW1PVkSEhrHtpwSdXC2f2AMiXPXSy+mpcfHb1frA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayUAHA1oXAz4KjpS3kE3aE8a0OoegROjvAffLCjo/uI=;
 b=XIa5AuOVPVgUZC7bsszQb99OvLfg351R37ofaPz32vLGm4JagrAwwsR2GY6ZGbCQcIUT8SAYgojSZ2kFpW3SS9+5Up4aRT9NX8AVh3ma+tvJ8OH8Wv1AflaWpAZwI/WcE8OUITyDQ3gXMJHjpHscZhfnx87Y3zopO6rniPcEEfNsWHDEdxDTGJCCF0Jx8KM5H2zN4GTqBrVJ+dAmlTH+UUHdYPXW7KtUx3kqD7qNbWkfZhVHUUaNqjudZ8ndsxoI6k0IXc+rN4ZQKEnSHZ8ipIBojwyOUzjvIWtCwqE36kXSGtiUqjhleXqL5/NsuIutEBLaSIyef4pAXMRQFKh2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayUAHA1oXAz4KjpS3kE3aE8a0OoegROjvAffLCjo/uI=;
 b=dNqXAw8TM92ETnrw1B+jUxNvlVoApKWJpKj/VztToTd/nZuumg4ck0nNDnYPVxyea3PxFYcZKvb1FreybheHNF78C9dazq4loIFJZrshsT7Uj+mQzS4wAbnTjmP6D0nJnzjPwLLCiNy8cLD1GIZcdarO3xlbzoFO80fXHo8KPcKzYqZxQQXgzsOMNGa8ApLdFUUvFuXJnLpOvGtJ5Gk3FwJgwIW6GIiUW/tQhpb1DRtjJ9OPWeQuuHPWPFIJz2r10RJxv2O3/YmsNIMEFQtEkT19KJ6YAZTSbDIChbrntXUvkGAYyLo4LXoCLL6csmhbeecT9TSlAwyx1oSmzK0j7A==
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
Subject: Re: [PATCH v2 03/10] efi/libstub: Avoid _end section marker in
 library code
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261110121731.2728824-15-ardb+git@google.com>
References: <20261110121731.2728824-12-ardb+git@google.com>
 <20261110121731.2728824-15-ardb+git@google.com>
Date: Fri, 13 Nov 2026 11:10:21 -0400
Message-Id: <179458262195.3625095.4302457109469048720.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4PR01CA0276.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::13) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 9add6f37-fa75-4d20-9509-08df41983ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|11063799006|4143699003|261102123227099003|261022115727099003|261022105027099003|261021121427099003|261028144727099003|261026140227099003|56012099006|261022075727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: nG+RyIlWoJ7qsoe+MjqR4/ai7ZW9lcflo/gxJ5hpxGPKwwbm19T/dPHMLRlfz0brgB/UU1zPimndORzLDIKMlTV3S7TqRKyBusY9B0pofAq1169H7OvA+MG2r51v4v8tu10IUmEB3xi8kHxatDHUP8eGUu1eQHPlQzt6xwtNf0oVHl1MMEcH3mBsP2HbLFB0AdRDXDBEWpFxgxOLtJ93ku9sK5xqZFXxSrA4zVij7qSDbatjm0P7FHhg/WBuVTDd/cd9zoH/ZMDQDNwbMbpdgVVPDAKBx5lSQIHZBQN1kwP2JlDukf2PN8JFhktgtc6VRJ1uvw3wHOCAcEUsitmJKzDUXLpzYYWQIuhoZsOB7PnQq/19yDSqPBic2NAjxbGAZCtbkI2IF4a0IAasuKuja50oUu6X9yxJ92ylKF+PIlEXl8lQTbrMH6qF4Sx2lNtwja7BiW/suK7xmB6r/oSlYsqIWnynNJJ7KlZA7zSIQTPGMlJ+FDhjPnazvxibiI5PEMI2iBDrCy67rhaalWX3aEjj/gAL10UNCwulvsc1HwBhnsjSI6Ym0K3GdT/2BW1IJXDWM20/C106QwlIivorxPuxC8gY0W4LHcSPkDjZdWotDnH44Sh1TD/fEsp/6RebwZ0ATx/Tvm2VMjSJO1hFotevRCWqpTqq2yrz+O4htgw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(11063799006)(4143699003)(261102123227099003)(261022115727099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026140227099003)(56012099006)(261022075727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c21LMVJySWx3ckxHVUVuZGhhVWo4c21BMzRIL0w0MXlPVVNOTFhpb2ozdWcx?=
 =?utf-8?B?bFROSTh4WTZrRDNaZ0VRczFZcWFvRUswMFIrR0luSWx3T2NVMFZrL3Arb3FY?=
 =?utf-8?B?UnFzVWJEODRWbWpEMkxUL09kYUNpSzUweG1tOE9OZDk2WWIyU01aZUZDMlRQ?=
 =?utf-8?B?Ym5jaThsK2p5SmNqZHcyS2dvcXowTzJFN0Mva05vNGx5VHkrRm00Zk9pa0hM?=
 =?utf-8?B?dWNBdmZhdVIwL2NoOUFma2J3T29ydkxQcStabGROOXdhZ3BwOHU1UXpBUkhq?=
 =?utf-8?B?bHUzMWZqclZtRUsrU0x1T04yeTNad0FHZ2tIT29JcmZJdkZrL3VPN0NDdlJy?=
 =?utf-8?B?Wm5LMGhkS3Q2d0JoRzJRc2hkQmZEdS8rUEUvMW90ZHVCcmtiTDY2MC9YM3po?=
 =?utf-8?B?ZXpQdTN5TkJVcnpkbG51ZnRETnpTYjRZRDRaV2NyaVhGait0U0ptNDZoYzhr?=
 =?utf-8?B?bW4xUC9FSnVLQ0R1dGwzWllNQnNLdVpZTXFKNmNZWHV5WE1yWWZKeDJBdzh5?=
 =?utf-8?B?N2VxWWdnVm1lSlBBRjhDbUJzRGVPZTZlWEFJejd4R3FOMVU1YXc1Qk5ZNGhQ?=
 =?utf-8?B?eUdpOGt5OWd2SjV0bUZsbSsrQlc5MzRJZW95a25Qa25yc1F5Ym1XVmxtR0Uy?=
 =?utf-8?B?RTFETlo5QWlwcTA2b3NpcHgzZVNxT2dvSVZrdVFIdWVJd2wzMkJnbndTT3Nx?=
 =?utf-8?B?VUhlMm9nU1g3SWJ1ZlNzS2ZYZ2Q3clhleHZsVVpXN245bXNjdGVTZFd6WGhh?=
 =?utf-8?B?aEJZcnFFRS93TVpua045VEMzeVgwZ09idFV6SGJvNUpCb04rQnJiekxXdFF0?=
 =?utf-8?B?N1p1WlJFSEw2MExydWMxUURsV1NUbnZTVG9vY20ySlF2S2lGb282Wnc4WlRS?=
 =?utf-8?B?VVlZcGVhQnZEVGl6amV4bVpVS3RrRU5QRE1rYjZnQUxPNWprOW8vL3VqOUNL?=
 =?utf-8?B?UWFQejQvZS93RHowa0lNMm9tbkdBY0ZrSHVLbGRnQjI3b2VIbkVsM3dLNkZw?=
 =?utf-8?B?MHdJRUFZdEh5Yk1QaFVoNUhvWk84TzI3RjBKbGhqS1E3YnAvM1p0R1l4OExj?=
 =?utf-8?B?V3IxTmF1YzU2U254YzFlcEsxSEJTcnBKb3lzSElBbFhpNXJjbG56V3R3a25U?=
 =?utf-8?B?KzA5ckJ1eU1TUTZteEZLM1VkZUpuajVFVWRKYUhnbC82MmU2aTRGaUNNaW1t?=
 =?utf-8?B?S2g2MGVJQTdPT1J2eS9yM2xnL0lkYlJZQkZ6Y25ZYnYydW9CUVppLzJtL21V?=
 =?utf-8?B?dTI3MEhIOERpazBjQThvZVJIRnZRWU5JNzFpQVVqZU9ST0tuUEcxTlhwK09C?=
 =?utf-8?B?NWcwTDRsOVM4TjIxc2pwWWNucCs1dFlma0d3b201Q242cUFIL0VINXhwZkto?=
 =?utf-8?B?R2Mvbkh0MlpRUzVhR3B3VFYyR0ZuN0pHbHVLbkZ2M2hEZnpoNFdjT1NjUDRB?=
 =?utf-8?B?NmswanpvNFFYd3RFMTFuWUlqazk4SE5EWUcyeERBVG9HU3ZxdEdCamdZYTBy?=
 =?utf-8?B?NjdWM00raXZqVkZKRVFqT2FZNEM3eFFoS0EzT2xxSlRremdNc3NDRnhZWWhW?=
 =?utf-8?B?akJGQndVM2toL0ZqY1R5ei85ZGY3eHBPdEowMWFLS2llbjZHNUtEQzJ0MGd1?=
 =?utf-8?B?RHM0cjZ4Qi9DUVZMNTlVbmhoZEd2ejVqQW5sa09lazZ5ck1pTTlNMWFQNXZS?=
 =?utf-8?B?NkpiMU5OWVVnWndPY1BBa3VNdlNnTE9FcXJzUXpJWnZkUnRrNGVRSlBwL2V3?=
 =?utf-8?B?NERpM1ltMkpBb0JxaTI2YTBvMGdWbnBZd2VHbzYwM1JMUkd1VTA5TUNPZUdj?=
 =?utf-8?B?MDRnV3FPSDR0MDNLYnNVL21FQ2hJQ2VKaXM3U1k0cTdSbW9CdlpKd1lxSjlX?=
 =?utf-8?B?ZExZNjE4VDNtdTBqd1lwVFlYUVU0QVBTYk54blJTTmdjNzlTR1VSc25DbFZa?=
 =?utf-8?B?U1VORjdMNnFVckMwMTlJSTdLOG1VeGd2T2I4cXUvVHVLT05yVk1GY25oQUUz?=
 =?utf-8?B?V0pzUzBNUUVaVW54ZHZ0a1FXeWp0NGdMN2ZMR0VYWlVHVnFiMEJDSGp6eUYw?=
 =?utf-8?B?aHFsbk0vUUpCdVhTcCtmM2xjZHNLYmExVU9VeVM4Y0Y4NFE3U2huR2VaMzFS?=
 =?utf-8?B?aFVTQ2gvVFJqWFB0eGxtY2UzWnZLRHJVM3FTWURqdit6aGFlN0NESUpnOGcz?=
 =?utf-8?B?TlB0NVB2RFB5QVFPcmprMVJNRlRjay9Jbk10ZVlocW43emdoRkVIeGtsWHZa?=
 =?utf-8?B?c2hISytaZDlSVExneDNsL3RDcEF1NVdzM1h4YWI5S2syUjNiK0sxaUowbXNJ?=
 =?utf-8?Q?TXKvzErZj45EP9I+BC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9add6f37-fa75-4d20-9509-08df41983ef4
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:10:25.7890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB3SfTVoKGYxVdwGO5+hgutAdLRUJ4IcJOwFGXqVstsS9JzJnTL8cOC6In9n3rtS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071048_093631_9D66C2A0 
X-CRM114-Status: UNSURE (   7.98  )
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

On Tue, 10 Nov 2026 13:17:35 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> The _end marker could point to the end of the kernel image being loaded,
> or to the _end of the zboot decompressor image, and so it should only be
> used in code that is obviously only intended for the former case.
> 
> So instead, use kernel_memsize and the image address to obtain the same
> quantity.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
