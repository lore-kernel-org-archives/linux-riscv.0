Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F4606A893
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rbfYJ/Re;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fFODqQlE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lv3eg4vsaB/agD2vHrT6oeK56X97UrTimXhADJLXh0M=; b=rbfYJ/ReiFeQJG3ZF9KhXQq+k5
	GrF6IEBVk1XrUyEyGzTgoBaMExhEoLPdYp5pShtOuNXsBonyFLb+SNKcfRsN3EcomNw0lwzn7Igsv
	ARx3Zx/bXAu/uop3QAKl+gk4r0ZUkSPnFtRPNl/IBqM93Y1cq232DwyAPF02InZPsohv7CTodu0NL
	SXTTc/Ld/d8FZ/HPRED7ULXSRJkYQKCSfH7ocwg+FefI3lBYu2Zi0/aDoykpzzz50rlZnmnNxkQG0
	weVpn+rkSlUVZQyFomQcuSLIT0SBRVY0/YX2rIhmnAtbkvBrpdE/uDoc+L5yUnexu+KZPGB346qHM
	o3Pzs+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1on-00000003eFH-0wWB;
	Mon, 16 Nov 2026 18:52:41 +0000
Received: from mail-westus3azon11012035.outbound.protection.outlook.com ([40.107.209.35] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1of-00000003e6U-03n0;
	Mon, 16 Nov 2026 18:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siSjalDc3H4Hn8tInk+fBFgIsW0htsC51Q2+r5UGkWX3Uuu7vIzW6+4X7UMWtZLJjoN6jyjDULgh88fJwRZiI3/3vcqLQGZXk53Oo0F71CLBeboJ0CVcqpk+xZCmWYv1Zd4crB650FBQ/DPc3Gxiuu/m/N1AuFAiM7wdSFFaDR5DomyoExro6toZYapkpOLjy/t5vrLaB0NipaXRXEQIu2MpzKGQwlEgsevafTp7MfOgkcq+4vVbX90COmUKKNr6Pu/PXgoYqast1pyygpoWaU78Pjdz96Sc3lLysr7YS3u3KZk/vlexCc5HhoQspvlYDP9XQEfih5UZutl5NLmWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmBCSbYy4laHTdTZxG2LXdJf8RKiZCGEyjnxDgE6QXk=;
 b=NMhKHSZNMXIRlmbHEVwA5htAGOAzfasEBFOfih14g+FtAok38iKaKrl3l8KEO0wQbyAg+0m0CRLt0Rxnkm/gDqpJt2lX0QtD5lpFsbfXEXOajygDV9TiTHTEWUWaCgJm50BBpdr8OhCLr8w8N/ouLBxY0VuRT6URJbd1QaPZylpSIWjj7mRaC9LPmR25WjDFXI2bRp8o9xxYEKXWnt3nYFYve6FV+Rkt+01XdZppx34q/RBwFO08xE0p7cgPYkJNf/DKxylfxFz3XYVTEBUvbSY+W7Pj650jSbmHCjqxocdRA/tkYw9x0szGmjZW5jDx/Tl5Qf5pmamNDFPjCBImhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmBCSbYy4laHTdTZxG2LXdJf8RKiZCGEyjnxDgE6QXk=;
 b=fFODqQlEHxqaBjTvKLBJxJiuD49qBshRka1pOTl3OncXIAH0cBzGnFFBz26T0rp6YpMIUTpwkmm8Yp8uGQbUg7rn7ejc2iYOM8Wd8c1mogK2/IxZWdIGanGoFmyNawtD4NpS7LUwUlJBonmFnaHusbbb5OpMtUrjsn8Jzb2Qu0yVLLEPj4yTfX+0GSVSnAo6DgK9Ld/M2fTNxIpD3K2J6lByYxoHIrJObH7DDppPdBj/tFyljdae1Liz5nvaELNMCDl4ORyPGnfOvBXX62Zr9Nv2s5BAK/OR2eEXlKWOdk/INe8tsoKA0KLjhUW2t35r5JuHA+qMu9oIg6vMMtvHyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA1PR12MB9062.namprd12.prod.outlook.com
 (2603:10b6:208:3aa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 18:52:23 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 18:52:23 +0000
Subject: Re: [PATCH v3 03/15] riscv: Make _text point to the start of the
 kernel image
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261116142618.1687025-20-ardb+git@google.com>
References: <20261116142618.1687025-17-ardb+git@google.com>
 <20261116142618.1687025-20-ardb+git@google.com>
Date: Mon, 16 Nov 2026 14:52:15 -0400
Message-Id: <179485513558.2274641.17944863419211208201.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: MN0PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:208:52d::9) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA1PR12MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: cd258eef-cf7b-4d79-8649-08df4412bedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|261102123227099003|261022115727099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: cvCaVhNaBx7bc3CkSlWw68ydGcUb3eouTesKU7iJ2ZmpXmaQfr2ChXn+yBBcI3iUogQiK8ACy9ifppjHNnL3IZh2DyEVaLefVCOzZ1mi7V+h3d42ovscMExycN8o/PVgMLLuEbPUjRIrME8x7WPiUrqRXfSceQ/RwB9sBlX+s+ugW22NjXxAP9NJJkkuN7dS+7/xylMCELB0szF8hd29n29xc/q57kXK2lTQ10N+JJPA/Q2ZARt+ZuEV6+SiMqL2AUvVEo2rE7ljLnOxtWyy9vwJYaUCsgmizczwuKkPV0bqSdpiYx6tqJUpIr2zm470PSXzWNkoF5xAGML5ccHf04R6VSuVulhXihC/lai61VVGWu5vRNdXIIdiD9vYA+5oSHxXCQZy20m/qCKryu+ZWQYs3CfIfKCXG1Sp84ThvVYBjqXXaqKaW+0KF8c3QbomgqwAl7tQ9k9WvrXu3rnPBY5iTfQrS5k9WQH2/NGJUdgI7jvnNyAdu5KdJwrxZzoNOG/ER98AigO2CvPurJM5nfO8T3ofyMuQsLpx/MBuect/e2f9BPe8u6eeKLzU0q1RiMqygMrrwYRRjyn/rlHUo/efg8ZJL8ijhN6OT3pEQK0cg3fIBo0tBX3Kv/z9ApuePtyDI4QdVRYnGMQB1rAX/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(261102123227099003)(261022115727099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdpL3duN2FINng0WkJqdGZGcjVBdC9pRUZsc1RLanFOaUhyL3AzV0Q0ZFkx?=
 =?utf-8?B?UEF3aFBFSUdleTkzZW1rSVhlMXVxdEtna3VKNlBVbkdyN2JkT1FpdlRhcTZj?=
 =?utf-8?B?dVUvVzhocHVsMkFWcHFXTkQ5YUpsT2FSYVhPWDREU1c3U2xLMnlvdWxJckVT?=
 =?utf-8?B?WlVJVVZ2QWRSd0xha1BBVWtlSEFsVE1JUTBVSzZDV1dyRVBxZGdEcDA4VEhD?=
 =?utf-8?B?Z2x6akZXUmJYOFpxTG55KzZXTlJhRnNENkpBZUR6U0h1QWM5K1RETmhZUzZr?=
 =?utf-8?B?K1hNeGlKbVAzTTZTSkJtVFlGS3N0Rk0yVVhQYm94MWVHaGl6SUJkWFNMbEVk?=
 =?utf-8?B?VS9jTC9HaGZoVWM1TncxMTd2bDhvaEwyQTJvaTFzb1VSSkUybDJyeDNnQnhT?=
 =?utf-8?B?bjBrS0VPdmpTa3dhS3ZtZG5kZFdCaEVpbmgzNDlvM3pFMVY0Rzc5RmNxcXJB?=
 =?utf-8?B?cjZUTTJTQmZ5RVphTjhRSkduUndZUnAyMVNoN2FEUzZDamRTaWhOVHZhWG92?=
 =?utf-8?B?MmVsZmY2ZWR6WFdiUjdLUHhBc0FzZVJsNjVFRW00N0RrR1Bna2JCcXBMTTVL?=
 =?utf-8?B?am9MRTB2dmc5Y0U5eG5tU3dNd1A2c2U3ZC84SmZWaFM0RU1iSUZWL0dzVk95?=
 =?utf-8?B?d3dCTTA0RTBFK3FaQ3Mzc0ZHN0JMNjk2SnZXV24rV1JUd3RLZEVyUnFJM1Bz?=
 =?utf-8?B?c1ZLSmhRdno5dDYwYllyaEh4N01BT1c1ZzQ2UzFVc3pvaFlONFJmNXlGcU1R?=
 =?utf-8?B?dzdSU1owZ0puSElaS3VVM1kxaEtZVWI1eTV3V3ZJcGRaZ2tvczNpdlpORGN1?=
 =?utf-8?B?eXFGbWo2RUduMU1HYkNrTHpUS29Rem9teVlHQmpUdWxraWNKeGY4TzFsbXBJ?=
 =?utf-8?B?Z2hEa0tZOEJsRFRpb1dnK0JUeWVuZ0xNUk01NVY1d1VnVEJaT082blBpSjFC?=
 =?utf-8?B?NWN2Q29OSFdERzJDNnJaU1RnSFFaOThrelhhTUhGYUxyZzh2cTlTMGJkZjZR?=
 =?utf-8?B?TjJLbzBLTld1azNFQnVxd0ZpT1IwRUM5dVVqNUlOUHhFcXZLeStpbnNCV3Fr?=
 =?utf-8?B?R3VQVVZxUnluV3V5WHJ4SjNDRUVKcnEwNGd3N1dXSFQ0MGZCMkd0QWhIREdn?=
 =?utf-8?B?TkVUdmZUSXFzZzkvSUdqMmJrd3owN2RHNWhKT2F2SXl2aFg1bWpoak42ZVNI?=
 =?utf-8?B?NXpyYm4rZG5TY0NBNk0zTE8xUktOV1JIelp5U2FtRHdPd0NtMWplMlpZSCtu?=
 =?utf-8?B?TlNUa1VIZ1N2R3g1c0JhNGVITGRNQndZUlVwY0MxVDh2R0hpcFg3VklHMklh?=
 =?utf-8?B?Nml4R1lJUUZUcnFEWHNNWHYveEhJYXVzZzZZbDNmVmE4RDRRdXcreDZ6ck1B?=
 =?utf-8?B?OUJ0aEpSbm9seXZjK05sVzJLS09xMmUrYkI5bXdvdGlBZG44aXVScjgyL2Jt?=
 =?utf-8?B?SUNRV0tDVG1vS3V4NmxsajFxR2h1dWFPNUtuMVgveXhHN0RXZWZNR0JOMU9u?=
 =?utf-8?B?OHJRNHlYeDRnUDdabzQrQmZ6UExBMW1FZHJua0pkR05jdGQrRVRzTTZsdUZL?=
 =?utf-8?B?ZHEweVlPWkZpUGtjWVBiczBranpWcGVvL1JaZWhUZWVkZjNORHZHdmhkLzFY?=
 =?utf-8?B?NG5rUWRMaHRPOW5LN0hHRllKQzdSU3F1UE1zTHVCeXprSzN2WE5XVGNFdTcy?=
 =?utf-8?B?N1lzNWdBbHBIaUM1VTExck1Va3hsQ1c0WDJYNFI2TmYzZEtjRFV6TW5hdjEw?=
 =?utf-8?B?RGVtalkrTTNOa2x4VzNYN25VTStGQ0RIZEI4VVJWY0NkVW1aLzhiOFRGMWVJ?=
 =?utf-8?B?em5ibjVFOFIycGp3VE9uRDlkY2JqcnZSQjMyRkZZM1pwZDdGNGo5NFVFL0kw?=
 =?utf-8?B?WU9xZHpWZlRJMDB5Ynh3ekwwZEloWG1FQWU4UHdIcTVWMzlaQW9aQVo4NURR?=
 =?utf-8?B?L1B1YmNpSVFudEFacUczNHRNckZaenk2eGczVWQwNm1lQjJ0cU94bXlPQnRH?=
 =?utf-8?B?Z3F5SnppMllLM0g5cXRHTktDR1h0VkNlUnhhQ3lncnJYN1l2S1VIeDFtTDJk?=
 =?utf-8?B?L05VRHdNa21IbDgvalE1cnc0bDdrZTFEMmE5UWpBQXcvQjVOa1hxK0J2a0VY?=
 =?utf-8?B?bC9QM1UwaGpmVDc5TGptS3JQNFhhTEVGRXdOOGkreG5hTjZ6TFNydUVtNXI1?=
 =?utf-8?B?NmJ4Z0g5ai90djdBTG5mRzAxUFdoeTgvVWVBejNjMG4rYzNhU2RDSWtobFdI?=
 =?utf-8?B?TzdKTk9neHp2YW85alFNNnBmSWd3aGZKMUlVaEN0R1NMQmlsYjdMY1pkNEpS?=
 =?utf-8?Q?eKulJJTeb66zjK+5cZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd258eef-cf7b-4d79-8649-08df4412bedf
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 18:52:21.3434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTsGc8jw8AE0gcuSA3pZHJZ17J+XQU/1e9w+AvYmy/3QA2IwvcbUvAlzCIax91gc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105233_063649_99F18A3A 
X-CRM114-Status: UNSURE (   8.43  )
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

On Mon, 16 Nov 2026 15:26:22 +0100, Ard Biesheuvel <ardb+git@google.com> wrote:
> On RISC-V, _text currently refers to the start of the .text output
> section, which is placed after the image header (.head.text), and is
> therefore equal to _stext. On other architectures such as arm64, _text
> refers to the start of the image, and is used as such by generic code,
> e.g., to describe the kernel mapping in /proc/kcore and in the ELF
> headers of the vmcore, and by the EFI stub.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
