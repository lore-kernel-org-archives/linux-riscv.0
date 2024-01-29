Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F3BC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYrnm/Z5D02M8JuazsNtg6ZcsGaWMwna01VuyF0DtMY=; b=oW1L48SgtSxY7k
	w5jMMe9RA/abSvjS5ke7y17bkr+A1+GuHU47fxqml/wJt1paBO1UcRkA8yQP8XNuWO9ftXbYKVgXs
	Kwejho0hX2tM9ymMuafIyLN0hJ9JGiBxdlkh2HMPD15340b8ueMhwWm2BuABpnodOmX0DO0cdFWzv
	3c3XyGL+vVAEl/i+pOqa4ii374ScJoo3mSZbOOojrUjhG5tPdwVkvtxG8lpw7LG3OQHBPrfbuJCFI
	YhbwU9fY9xqKzNNF7d8KPh/SMd4Nbis2K3Hhb5Hn+0uVfKV/kXyvoMLwLhCDF3o/Q6KwmK3HURCKe
	XUBn2pR9bc1zc6HYkwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMUR-0000000BgCl-0Cbu;
	Mon, 29 Jan 2024 07:55:35 +0000
Received: from mail-bn8nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c18::801] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMUO-0000000BgBR-2CkN
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 07:55:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkrI1Bq4MJ4cV3f6A3AskcWNBFlrYm6G0a6o9p2BwyhZ0d3IFxaK3nWLYPFoYSDEpiqK2y+kTrJpK46/nJ9PYU6UD/q/01CC+DTW/EYMAmX/JXxIlePtEISuiV/DlNKKX9ZjYCkNILBWM3SYEc8rRuyePg5yomb9Mwc/3cVemE3v59WQB4yV0Acdr5pzGpFEgqqsL4UsYTwz9ItnfBKO48tcUMV9Qw9Fj4fmhURBnadYPeaVaZUm/cAN97j8jyRexiLQHfY50N/MoBm3OsDxapPLl6w/8ztClZpekBGx6aUmzmOjbuTJpcpGnMqgPrdqo2Jk96VScethh+0PDxQM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjBgvvQkHFSnPomQfvg3wPkoBxvlSuTyQrf7Ad1MvYc=;
 b=Fs5OILhfKxuzzBr/o2xi5cuQGlJSSbe6qxzgZI4jPIBZ/5TYaD/WngGfWP8qp1kK8h6/EalqsK/vtbqlxqoZTnuUsd2XWOyuNF1Jj8mVrjJRkBEoMe8zLbus8AOPtCgfI0QA4v6bmJ8+lQPWLmu0DbABb0fkcTyovAZg5KwHvjtIZfOHKhgJqtWSZ4R3jGnTInHMnkaiMiOkiMm0gzh9li7B9kUCCW6Q7tauH75C4H3Exn0dcwG4xo33GN8++WrG/t4AgxeLbtroYJyOOUtYbRArkgkBW2zWm6RbrtgSGDtpf/C1EEhuRA02754XkcsC/vukUVp4ybrfQ1DMprwVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjBgvvQkHFSnPomQfvg3wPkoBxvlSuTyQrf7Ad1MvYc=;
 b=EWaydKYgaoSBvg1xUCrv+btHxRgLy+4/kBSCY15SlZym/v77xHH7HyWcemroAIt3xdHeVN2DG8qw+rtF6SlkmJVz0whZoysGkEPFsmhSVAfhFZGNBkeOgAYTGX5LASeO/8f2+N0Xge2G78ExNBcwF6EfVgwtfv4O3+OkXJehuHLQfO3SLhCi9RiUjZ64n3tZevkZ0g0oNX0bVwdpC0GTx9OzDNx10YeKs0HHkVHPfO7ab80Sb6xn5zR/vi3YWJyJV2jrySODXniHrMDAKg6+zAAwt77vqPxRUhEnHsK2pGz+SFpJltZOFuyZQX2MK5OHeAcRIsHYfhk2pJN+oqzknA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MN0PR20MB4644.namprd20.prod.outlook.com (2603:10b6:208:377::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 07:55:27 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 07:55:27 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	AnnanLiu <annan.liu.xdu@outlook.com>,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Date: Mon, 29 Jan 2024 15:55:20 +0800
Message-ID: <IA1PR20MB495332E3773A4604F95008C3BB7E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9f9a1f5f-2104-4a5c-a837-cd8d18e173d6@linaro.org>
References: <9f9a1f5f-2104-4a5c-a837-cd8d18e173d6@linaro.org>
X-TMN: [njYDWdcDowIwul1ReWr5e7RnHS7dq3QXzUYPfsrArozPUOMkbcZS1PsRdSx0W7fI]
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240129075520.604223-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MN0PR20MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8ed6f0-92c8-444f-b3cc-08dc209fa807
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT8ImFmzuH22ketkSXIUwA8oW1qSI1Hc0yVbuiguZfzYLDmcBjKppUlE72saBf3/eQFexr0yluamLweNuW4LQZbEPmJfUFgxo5dFMC7ZFy2yy3L8IOFTZs8pL2Hs4fwCKtbnaKlgkj5CmzghpHvaVt+1hDmEcy2HnvKxuLHGl1jXg5oOQiZhUyJFA/OFj2bDTeJDsBEGD/EwTIFq3Gp9XLIXY8qsvlM3DRMHnMhKXo3HCyL4DZ1tIBuqFAEJZa1qgJ25tG7/RU5nXWlJ5l92L11j/9EhOg5xkfv7/IAUuzEhkg6u54F9+npqCGeq5oAaMPmckojmx6rcwxiSawbtD2fod0UgYfEIKhe8fq22ddJMARacvmZSYrBVR17LhnV7irNWe2OYnop3WJNbASTl6ms2fXsgHEntOqO03WHgHoqkDukeEz5cuAUprHMjgEwDMTVD8N+zFoskyr7UmoSH9f7OtufiNSL5BgqA3krG11GPpIuC/hYC9MA9zvs5FmqEUMhUJoyGpCUMZvXy+YaAw4GX8ziwvbZq2YP8xbvH7qvsmHsexflW6Hl+L6K5tOWhfGMF7+pcgK0ILtAiVSqbb/g3RMgR6H2TNwwQVp/cmq9pc9PgqrH+dh+SlIo+lJ1wJEZV1nZP8x7UwWe0i9fQ9qClGFKrCDegi+k9YTtplZaXF6A46o/X7FaahyIcA0bQbq2/a+qRBaydfVkqhZPCDqlOnvGFGE1RyRIwuHzF7dYBQj/tF5y20NvjEuHknxKTTKgGBX2D+DEc1+9G56O+uCtLhERlLSBy+BG7+SMVFeXI6odVvBlxTRmQ
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBmEoIRz+DagN3abtCUgeNR/f7sbiW2AbAKiLXe5rtVEMflmgdlP3l2+2MNZ8c+brZisJ0O1RznOOx+4jRzEbhAYaNRmyTbG6le/9E+DiH7cLxxw+D+scjr9T+/n/ppMKV9vBjBdiqVyeArO7RQo+nQi+BziGlxCKLw9Bb5xoUnN3ao80GgUzObz/uc6AI8ib1ilnH3+YTNeCg6RT6thzQ4YdAnIxpQ5hRrzxgSFZG+K4UKyux6FCF9xjzbdIwSRcJS/KQYe85D6wPsQFQy/U/7ttVN/iNMLzu+7L43pyF28jNkwbn8pKO0AFXVLbGpkcJOwQCsPQEQqDE//lsQ4o9+E5652XQUvozC9agoefYgiQurzCNEPNYQ3ONDWDmpEKTNBJrilbcOg9qVDpxS4YJc/I4I6MIKlX6AfWSGKIpYP0udYFJt1GVXoLI460RpKJkUMRROVYqnt86CExtNTzjVpFiLBbzwrGMcBYOK+DLFp715c6Lkuq4gM6Iq+p8xujxXT8mui/GOp8is3QZ5gaTs23242hEg5IxPAEzTqYjLgt15j3SShz4iOcn7DDSppImCx2vTZaX052CkI59BxwfvTQNlp1SubysS5Cs4Yu23zjJHiIUz8JtI/+bni/d3+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GCebfqB+z+GK5JdmC7w1olxA9iwoa/IWHTYXMQtTpje9DJ2ZI14JhtiRdbf1?=
 =?us-ascii?Q?Oc3iryB2XYL7kx+XhnqW4k+wE+r7Tzkk8v2Zxky7l7e3lQrcFGLg4Lu3WxYp?=
 =?us-ascii?Q?lvjUIURXcqmuk83NxC8vibF4f9SNIH7GCTqDgeEH8DyECprvwVGSH1IP4/cc?=
 =?us-ascii?Q?FQNAyH/VblyrI3ar3HT5fe6uzqKlCpvGVjBI08jeDowJcYan/jYhxqtVqVEy?=
 =?us-ascii?Q?brCIZUD2RmmgoLhtC4mwsz7V7t/JQVEuyY41VPZsHccti+tI7x0oWqaugOqq?=
 =?us-ascii?Q?UBrPI6op2PiSxL38LmCQUPanZ/GrKnxmXvUabDNUXG5F0rKEC66vKTbS0FEb?=
 =?us-ascii?Q?eiefCx79MGaw6RkBxYvlhWx0S3jV1G6gedMHgCYGxMAJmZ8OTH86FfPctRaz?=
 =?us-ascii?Q?MISV+POYHKrkOLAM0oCeV7TYpprJVXfNXgAMotwkFoDQjTRjDI34EnA/iBaI?=
 =?us-ascii?Q?o+LuyUXOmz6FOHYAkNfK5KI2pdfX/sX6aXPiIZ/6yaxtGG6gRi7awl+N1sft?=
 =?us-ascii?Q?4X2bSiC+vWdfW4djOXgV2mFRbUNajYlKI6zujqa5TwxD7Xx6DjrYsbu7ACfM?=
 =?us-ascii?Q?3JgHcfKoaV4hhjHASpkOBw+FS8YLcVO+1YkzGBwWh+AJ4gWKLe0kagKRtiMv?=
 =?us-ascii?Q?3XXXL31TssYjA+lIiWBmfGxN7hOEpU8wGpNwiNuNCQ2qDZCYl4G84Z+Cls4L?=
 =?us-ascii?Q?1XT/iYui3pEma1tOw+bT79+F4g2rknr9jJSzBoLLkmZxo+BRCuCXfakNMY8G?=
 =?us-ascii?Q?72ZvcfyU/KDD0SD9pLe0oXUJw/erdyWxWD77h+pFnu45VUZovXGP0Y6A5K/5?=
 =?us-ascii?Q?ZDz2KjbxtZn4qGt459FlARg8gWdkZEZ6MF0jFg2yk82RvqrPPyWYVu51C5j0?=
 =?us-ascii?Q?c+yIPk9EpCkxIasHM4rIg+E7bBdawHspOSSMyzwye0FRJN099VCWvhlgqvCO?=
 =?us-ascii?Q?eFLtY6fEn6Sw66mGq1LlgTbUngryqxMkd/V3Nwhnwm8Et48ba1NUIz5NPCZM?=
 =?us-ascii?Q?Y5TGXsslrCN++BSLepsLqLpVp9fAt3rgcKX0N/19Gi8SgL2iiREXgwIyBlG7?=
 =?us-ascii?Q?WO3jyoaloCBcobpuFTp25/yXYXKafCH4+M4irsDqjBZ3vtlZObRoLMfyj3dL?=
 =?us-ascii?Q?nb/3dSOeYx7VhRRqKzC9W8XH/+E5w1UMahuOWkaMU6PSgOpk/pA2MMqisXOe?=
 =?us-ascii?Q?EehKtGn9JQnvNt2NYoockjl8mvOFVpmnwRTffvHW6h6dSfHVUAcd84inhfad?=
 =?us-ascii?Q?epmnf/xOXH4R1v6ntVKoYvgakeJSlvUbR63CNuj1WA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8ed6f0-92c8-444f-b3cc-08dc209fa807
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 07:55:27.3774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4644
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_235532_614289_9DD61E24 
X-CRM114-Status: GOOD (  11.02  )
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

>On Thu, Jan 25, 2024 at 01:39:51PM +0100, Krzysztof Kozlowski wrote:
>> On 25/01/2024 10:46, AnnanLiu wrote:
>> > +
>> > +		pclk: pclk {
>> > +			#clock-cells = <0>;
>> > +			compatible = "fixed-clock";
>> > +			clock-frequency = <25000000>;
>>
>> It does not look like you tested the DTS against bindings. Please run
>> `make dtbs_check W=1` (see
>> Documentation/devicetree/bindings/writing-schema.rst or
>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>> for instructions).
>>
>
>> Also, why do you describe internal clock as stub?
>
>Under the --- line it says the patch depends on the clock series, but
>as you pointed out the clock is a "fake" stub, so I don't understand
>what the dependency would be.

This clock should not exist. The watchdog may depend on the clock from
clock controller.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
