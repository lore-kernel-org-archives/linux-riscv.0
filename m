Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA810CD342C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zluNZtrfDTIMuITlqsQmtxaurtMtu/8BaP+8ORjNmS8=; b=B0r0K7RSHz0/pQ
	YafJq4thXpIogBu6M5wnuzgcc4+tOR7YmyXkBC2YoANloTXU4ehBk0YaqYVC6N+MGDa0U/+tyCcTq
	eG1TvMMBAtl5A+o0F8muVD6L4Xx4koUZ8eBrfhU2IbDqlhVKQkPu4mNsrz9/T7Bot+PZnf5AZJ+gI
	I72KhN4eR/CsJbT4u2CKS2MJ4CgO2Gok9TKHBpbMa/ZJnlmdOcZ0I8PcqLEU6TkdYAozDDjZvIGpS
	3YFIGOsD+TZDbM0xbVelCptVwa5C8eHkQDSKJFaiLQZwgUdcHEOQNscu5yT/1WBDfBVH6L6gZujEp
	BpFpgnHHtZyVFvBYWUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPL1-0000000H17g-1oSr;
	Tue, 03 Sep 2024 08:56:35 +0000
Received: from mail-db8eur05on2060f.outbound.protection.outlook.com ([2a01:111:f400:7e1a::60f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPKx-0000000H153-0e2M;
	Tue, 03 Sep 2024 08:56:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hYHLmuuqLWksco5CQUnNllISkgDepk8BpdSfujNzkdTTRpyavWp6iTZkh12ypnjZemRDRbzdX/6Z6R7DIAjLA5ihq6Vnkee1ACc6+eHVnRrP65ZVxlgkm6AysPiNvI1DnvSKAWVMwEWJb6tXGEG+zE3BluEzJ+2ZWhNX+rtkiKiU9wIjLQDugYPb0hFwgXIwcdBmhUD29sdlhD37E6ksRETuDNUTudLFzaf82CTvckBnPqCz7g0NHr2OPgY5B8jvU93QhWQbGszyGnAZGUokhEJsCsuw9KD5ARZAnRxf8a+l6KLwWMFOxQOvutVkrCMqxEURojCn2N2pzMNf5bepbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM+K5DRWzHoiqfO0tTg1VWEWcBkNhd6Y7Xi2knCUkTQ=;
 b=vwwhULFr+Ou0uUwSUzAsJxrKwDvCeLCM4JO02qBk/YqYC36FFjFRcrGDPnUgXgM5O2tkAeoDN9ejNKXtkUkEvuwqBHsdQABYsKVHO9gDXRgcdFh1DiOImAp04VaKzL0AMKSOWxTJKzhkCRWQODSKARqlh/BRh3s+QKV+gm6ahchaWX1M/Mlxu1eWQ6ZHVl+dG86ypgGqKUVCOxd6wzylVptfqjMIMWxIr6036z8s3KIg40UXjLuDuaG+R4+T1VvauiANwY254V8VbG/cdcfUTflKfUf0HSZfc/egGD/aaZHjQ/xa+n1KTfrFhEUAOhNbuAflTjeshTfiEDUDXJOWPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM+K5DRWzHoiqfO0tTg1VWEWcBkNhd6Y7Xi2knCUkTQ=;
 b=YBQngHgII9FLkOhfJfxCEwIsD4S+CNC6qmmmwAJYr1jixrjnncu0+1amT2XujNfG+sj0OxAtqBw993wR1lmHN2YXeVnLOZc4xyLD/zvDTXE2sFWcFXaEy7AF7mkEGWTw78xYvhbYDAw03XXAp7kryma0RlY0Unp/D+kKoeQIHBQ=
Received: from DB8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:110::21)
 by PAVPR08MB9884.eurprd08.prod.outlook.com (2603:10a6:102:32f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 08:56:23 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::58) by DB8PR04CA0011.outlook.office365.com
 (2603:10a6:10:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 08:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 3 Sep 2024 08:56:23 +0000
Received: ("Tessian outbound 8e666bd17457:v403"); Tue, 03 Sep 2024 08:56:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32ff17592a3243b7
X-CR-MTA-TID: 64aa7808
Received: from L8d328dd1823b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DB430137-BE5C-4F79-A001-D03D74F67951.1;
	Tue, 03 Sep 2024 08:56:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8d328dd1823b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 08:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSrtVscTQY02DJViQNUf75xpm8w09NR2oHbCfw8s6hpy8Vekjh7e/IbpZ3oA4Y0YHWgZ2qrdfb5Lz13MLuWfBf52S8GkRtL0ybPosiN5T9omgnfaKCTI7ufHBhoRsTPNg/G65DDSd6RJ5V7OxUzdFYbYqlpsHm5gGcq6/8xD1rU7wrUUxRkmSFMm0fQ7vTj0h3Yqa/xpEIDGfMl//1Z8eZeYG74lfDEdcnT2v/DK02HUygFsotV/f4X77Oijlq0FRH5J5WjTYNXuJadIru7/WyWyGe7nLYd/oH7omnDhqqcd7Z9jZi+Hs/MjM5dGFYF1ubfVZzS17odilhJxI6jYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM+K5DRWzHoiqfO0tTg1VWEWcBkNhd6Y7Xi2knCUkTQ=;
 b=OizT8FpQV7aBLKuBmbcbK818lubCMQkb//OJt/UE/NhjPqYnE6k8Jg1mumpaQ6Z5JZhE7Fn1k9HVBK6X2c08BDq2VAde7+FVLl58aDfW5PD8xeYmrRyZZjNECmfuNGOiLbAa1MJkDVZrOuFNLJim27ig4rgh+HDACLx3/Sp4dU3BLDch40TSlOzi2+jTEVv+SMuh8IEWjxbb6THt2VmvUg/6SCDUBXyb01QXBUoPdXNmybRE+Y7HTz3qUIZcfSp6ViXmOF1nLgxL8OXyHAa8uPLwXgNGQ3ehYx4PG1catj+n7uFLQeCT3Pdbw5/7gpV5TVa5lK0k0T/N30XJasO0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM+K5DRWzHoiqfO0tTg1VWEWcBkNhd6Y7Xi2knCUkTQ=;
 b=YBQngHgII9FLkOhfJfxCEwIsD4S+CNC6qmmmwAJYr1jixrjnncu0+1amT2XujNfG+sj0OxAtqBw993wR1lmHN2YXeVnLOZc4xyLD/zvDTXE2sFWcFXaEy7AF7mkEGWTw78xYvhbYDAw03XXAp7kryma0RlY0Unp/D+kKoeQIHBQ=
Received: from DB7PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:36::28)
 by DU0PR08MB9276.eurprd08.prod.outlook.com (2603:10a6:10:41c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 08:56:10 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::4f) by DB7PR05CA0015.outlook.office365.com
 (2603:10a6:10:36::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 08:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 08:56:10 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 08:55:40 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 08:55:39 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 08:55:38 +0000
Date: Tue, 3 Sep 2024 09:55:37 +0100
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Mark Brown <broonie@kernel.org>
CC: <Szabolcs.Nagy@arm.com>, <akpm@linux-foundation.org>,
	<aou@eecs.berkeley.edu>, <ardb@kernel.org>, <arnd@arndb.de>,
	<brauner@kernel.org>, <catalin.marinas@arm.com>, <corbet@lwn.net>,
	<debug@rivosinc.com>, <ebiederm@xmission.com>, <fweimer@redhat.com>,
	<hjl.tools@gmail.com>, <james.morse@arm.com>, <kees@kernel.org>,
	<kvmarm@lists.linux.dev>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <maz@kernel.org>, <oleg@redhat.com>,
	<oliver.upton@linux.dev>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<rick.p.edgecombe@intel.com>, <ross.burton@arm.com>, <shuah@kernel.org>,
	<suzuki.poulose@arm.com>, <thiago.bauermann@linaro.org>,
	<wilco.dijkstra@arm.com>, <will@kernel.org>, <yury.khrustalev@arm.com>
Subject: Re: [PATCH v12 3/39] prctl: arch-agnostic prctl for shadow stack
Message-ID: <ZtbPCcpuXS1M25Xn@arm.com>
References: <20240829-arm64-gcs-v12-3-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-3-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|DU0PR08MB9276:EE_|DB3PEPF0000885C:EE_|PAVPR08MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: 104a19ff-0f8e-416f-13ea-08dccbf6493e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?HcnvkdfnCN+k1CeAXFIy4lL6cFCmGR+jNUGaEvjUb19Uf0q5NBLX+IJ1qYKR?=
 =?us-ascii?Q?KE9ks/5nHqLPygShmSas0JNol7NYWn/W1tVMTYO/jEmwBH9Ykplr1w7JEPS7?=
 =?us-ascii?Q?dhc51Rv+9amfuogbY90UJceqNy3FCgkdSt8fY3tP5iUGq8CLrYlHEtJiv6ID?=
 =?us-ascii?Q?J1shMIxm4JBTv8drBfG8b2g5Tce4w9pNVW67C8H6TjVfOPF0VRNGUXTMoEbu?=
 =?us-ascii?Q?kHyvBfJCs+tbqE9gidboOrO6jBP7PUQbVfJwozWqoS8agD46YoQ/ZNTgwLec?=
 =?us-ascii?Q?hOJ6w/je9qH6frbWZJElKdP0j9mhBGahG7GXrGoIkAyVtukekfvsCZ1Z+zt+?=
 =?us-ascii?Q?+3afuDGtA+p6LSBlyF0hteW2FmSVrhryyj7XH8kUmaTTqEFJNcVrNveEALnS?=
 =?us-ascii?Q?utksKrEA5XqEEKD3g7n0qoA4kdp4mR1Qq5MHRmnUMVkslhgxdchAc1Kkbz04?=
 =?us-ascii?Q?WDxoJ0Pki2BPTe15CqUL2hHYOdYKC+7wVbZ3pyHtH6YEH2IGZpZSLE72cm+K?=
 =?us-ascii?Q?3MqKS3+9gNKlpoVnxZluE/kZflURjSRoCFSN6xd2qa/ykHZVzPlHakadpaYK?=
 =?us-ascii?Q?iIPNEw/mAa9H24tkQZXd5p/QowVYbQZqSbMD7ivOm2jKGQTKrYLEw4LVB17g?=
 =?us-ascii?Q?vEdKFjc6PfClipYSgN92BLxpj25y5LXcDhhQPbBvBUmoaRCHB+awcODKDrkk?=
 =?us-ascii?Q?i4uxfnk+M60qBta2K8E0/xY6Iq6bxJXilZUQxI6/+Rw46hbcoAOOQRAg6MEy?=
 =?us-ascii?Q?au2OK9hyI2nvtntgj2n37sZ4c2BG8udqfwRi7uuaH2uGWmdppxXVQRotwfGi?=
 =?us-ascii?Q?dahLOof4mR+dViLrwdzXa7C+QA8b7NnMhwM2BTkZSLcb06V5oiAH7BEasF6r?=
 =?us-ascii?Q?0NWPYVHjoRCLF9wxWknTtcW53CU6tUA63xxs+O4V4j/cqHAasqvkuABnEL4U?=
 =?us-ascii?Q?6DUEf5vsQdvyVFkLsfdzHH/IWG8lESB+OYWvlxSVnRK8x64+QGCrCXTBWlQT?=
 =?us-ascii?Q?8zi62+Z/GXBaBwYvxd/sW9u0LvsN7iAqRciPRuhBGfNI6okir5hDqWzl8ItM?=
 =?us-ascii?Q?osWbkd48IVENHDye+eAViZxnbHBgLJUA+HYo/AJu0JWcjKqBjo7u1LLP93Pk?=
 =?us-ascii?Q?nz3sBFl/ymI+OSa2ZGBXDi3a7hYdOwxVAGHqIRHj4aRJvblss8qzGjvw0lsr?=
 =?us-ascii?Q?pS0BkSWnTzS34QCXD6XFT7sAhrs/1R5eT1uEm1+VvLb77sCGhsJZemy0wVR0?=
 =?us-ascii?Q?ECEK7JrUVXKMqAwGIRR9ui/6L6P0Yz73vQ7HuwXgi7lwpkrYTUlwJEdM5qlY?=
 =?us-ascii?Q?zFKwIU7bOidrGt+3hae8o9dLjKPRUa1KbF19IYBIkDsCxsg53hLEVZOIb0M0?=
 =?us-ascii?Q?e3RuB8X67yU5yOuTFQyrTLmstCcobJ+7dxl1CQ6IqL/7FcvHScBYw1oTy4+s?=
 =?us-ascii?Q?OFAN6m8/SioqzfYfmiBbJc3pezrun2DI?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9276
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:36::28];domain=DB7PR05CA0015.eurprd05.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ecf60331-41cd-4e9f-ad58-08dccbf641cc
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E00wIYyH70/0jZ5YgX88pAm76hHdGsl/MGduuq1ab6EfdTlFxbdZyKNmjDpz?=
 =?us-ascii?Q?RVlnsmScTvEOj7jxjPF3wx6YgiMNPH2NjB1fmStc4zDgqehWafCxPoFi9wIU?=
 =?us-ascii?Q?lskfLGUdumtww4bErN6y2pUoJMXRIuKvaZ6Bb8zzEKRDFA70YG8v6LS6MXvJ?=
 =?us-ascii?Q?wqw+JoJIB0vvvMqJWSAdTjK9QlmDFKzadqjE0fjrXBs6aSzy9XKgrzF2bF4E?=
 =?us-ascii?Q?9xVMDvtTGkcqZDtM0IA9XrLofgqvZnqqVfPFtK346gZMqtGDLPnV0/+P5yWx?=
 =?us-ascii?Q?AyBv6laLQJLVIw1quxKGS+h4gMrFeXXQtvx4U4AWzzOzFO2iHAoIqTlsm8JU?=
 =?us-ascii?Q?OCP0ZLpYcjMLdmIgCphPcNgvp9e9zFMxaEaHiaSkk1B59yZu5i5mIbpL7VjK?=
 =?us-ascii?Q?tW+AgJzgmHD7pnFuFpgNNdpfqBtt7futtZnnkyZrkve9yg0cl1j13peGzmtl?=
 =?us-ascii?Q?uQia8xF0Kn4D0Eu498AK1JGVV8CP9CeWFd0X9uWv0am7yIswmN1H4WJRQj5q?=
 =?us-ascii?Q?I1SrvjkZGYoxWPya+LxkeapvoAo3mbI9U+Pq5QjTEvU30GM5gtgRe4j0KlqI?=
 =?us-ascii?Q?8mI0sDX4Q2a1Y2el+EXcbD2U5HdvDD5Yx/PgqV6pnOS9FJf9Hgon93wTWoEj?=
 =?us-ascii?Q?ZMmSNb2E8CSlzAlq+5PsvqLRxzUcTGXA/wrOCvPhADhM/Bzlfx3Rf7VzLBEc?=
 =?us-ascii?Q?YqsA262QY4+yS6HIkO16V38vqpUJvLYHO9rxby7/MiWPT570mUoiEBk/Iveu?=
 =?us-ascii?Q?3VED6hD9QeqOdt5iYI8LqEkz2VipLr7KH45Cw5dlrkDXLEi7qzLzyJPaX23M?=
 =?us-ascii?Q?LCCJ384HdB/wGfnJbnQLJsPs2B0pvQXKgpJNDwosU2FHQvMsLYHqYQ1KOdGC?=
 =?us-ascii?Q?DkKcWsETNcQzkMXt+8WenSyngvbZevIp+ZBgeQifKC13F2wJt+nZgGIOd36R?=
 =?us-ascii?Q?vcLszNuXeDxiXd4Xi3dXWm3zvZIrjWDgxHs76u5YgwhQxa2fbTUF/nGRLtJA?=
 =?us-ascii?Q?Efim2zqb6Dph/ZZtLw9rY01e79uZmdVwb8jfi5QuV08vmjc6fLW0jGvD5on0?=
 =?us-ascii?Q?oV83rhmY7vM1awJvMcE8vBIX6SvoZ4cDtlgxbbKH5a3c58xh6iy8txU1LnTj?=
 =?us-ascii?Q?ajHXVNAKDLC4FKTgcyv+ozycvuph00cvqL9WPqo6It4BxUn6RTy4i8gwZpGr?=
 =?us-ascii?Q?UaPk0ZN69HqooQ+mNW8Usv3JGG35FPFzYnPCZJZwCOehSMngQ9dCOLx9xbLS?=
 =?us-ascii?Q?l204onQ1X/I0ibYVsFFw2FVEqG4OTuadUfX34UGUh0riMXg+NNAg6ENwNeKP?=
 =?us-ascii?Q?sWSBaqeWV6OtZ9cYr2yanJilIGMzxh8KsHsXNO/+N0/cB1ftKWEAjFBhLs9H?=
 =?us-ascii?Q?b2qb0tIWSJHeWCbhWYFsO0AwW8hF0Dy08ChfSbhqo4hScthdtHKqrtoBmeX0?=
 =?us-ascii?Q?96KFrTxfPrL2zeTL6oINoaXYfVLdezmv?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:56:23.0185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 104a19ff-0f8e-416f-13ea-08dccbf6493e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_015631_548636_B84C6572 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, Aug 29, 2024 at 12:27:19AM +0100, Mark Brown wrote:
> Three architectures (x86, aarch64, riscv) have announced support for
> shadow stacks with fairly similar functionality.  While x86 is using
> arch_prctl() to control the functionality neither arm64 nor riscv uses
> that interface so this patch adds arch-agnostic prctl() support to
> get and set status of shadow stacks and lock the current configuation to
> prevent further changes, with support for turning on and off individual
> subfeatures so applications can limit their exposure to features that
> they do not need.  The features are:
> 
>   - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
>     including allocation of a shadow stack if one is not already
>     allocated.
>   - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
>     stack.
>   - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.
> 
> These features are expected to be inherited by new threads and cleared
> on exec(), unknown features should be rejected for enable but accepted
> for locking (in order to allow for future proofing).
> 
> This is based on a patch originally written by Deepak Gupta but modified
> fairly heavily, support for indirect landing pads is removed, additional
> modes added and the locking interface reworked.  The set status prctl()
> is also reworked to just set flags, if setting/reading the shadow stack
> pointer is required this could be a separate prctl.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
