Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE98CD3420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0O9FtPHUKnbQ/5H2z6zN0QwN2rNUBsfUT2l1X0zOBfk=; b=JQzHDRwpQoCTdJ
	pdQwh+0KT2rpQACDy7sT4glWwdOnTVp63nnuPDvMb+3pH008nxEwm6BYIzz4V04Q+dop8bKOGr13O
	VpNhD6BCkpnosJrgGH2KFCkicyCFOaD7/RX8ErccA0Qu+wQumWeLX0ub5b/D47O9doFs+lw1HvdwR
	S5cymPcDOHWwoZmJ4vIiyZSOMpf2g0ov9G+TVS8V4FhmLeCaFu4QHbYCDrlUUn87D5VA9tG67jxmr
	ON1+C7Zty95Z9KIhSglrDxx+38qZDM9+hCottPmRH+p5NpreAXQ7yCGNajVo8ROmQ8Nhqv4tshnWx
	MXysCK0jnhFDv450XgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPQy-0000000H2gI-3AqS;
	Tue, 03 Sep 2024 09:02:44 +0000
Received: from mail-db5eur02on2061e.outbound.protection.outlook.com ([2a01:111:f403:2608::61e] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPPm-0000000H2Kk-3dXk;
	Tue, 03 Sep 2024 09:01:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ekEdWbsMxZnXQn3GPC7DazmnC4nwYexT0lWfIhVcPrPcBkvWD790r/gKWF0yOsEDXWilgeexvMrezowk3FH5c++U6sRfhL8u/7tsvdVEtFO+RArd91eSZELCPVLfUh669bOfrheW2Z41sUumgZZXy1Zoerpeo+Te15M7YhIv4JeR1thhHdzzY4gdL4TaAZ6Eqc0g7ejw/NX0CVraDKbPa3P80dig7B2DJu4DSAWTa1ibRiqEV972lqpJmuhVbdkc+n0laWdRKfgNyS7/wEVAeytxc1UBtHUj+B/0Mx1sSTCNnLR+RKqp8/BroTa03CMJvbquQ/ZVtCocNW1zrmIPHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPZRN1D5kGw6NeRm4Sx5KT9gcnlou788LX7V+C5wfSc=;
 b=Bh4K5HSja/w5zMttztHIndi0nyOQq6Dv1vqyy1/OtuXqbxFAtpxZWEAc4yi5E6X5845ekL4Q8XH3U47mIHo9NW8pDqpmW8WgiwmYBig2r9wpLTOmhwgbeyxl8iD3ED7F6Y4WLYiygVxxUJEJwbFgaJ0YzPJCyLmkI4minaenpbvd9ylQVLdOaiUf0cVs5SHBhGLL6JDBJAgglWm/PNujsyS6GFbjKbFjYea/ZsjopSh4brwSKzLJlQgVP5CJWC+3bK9nBjPX9hrvEL3lsUueAnXXxbuqkEvQsgbwpo8AqlolowySqhKEJYGFE7vWjUG2trojz08jeWPnN3Zuj+HMwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPZRN1D5kGw6NeRm4Sx5KT9gcnlou788LX7V+C5wfSc=;
 b=WYr3riJk/3yZC1hIiGpXusAQjlRqtxdou9uuIK9AtnVlA0PoFgYpvdiSmwytnOLpRaxDoPu0mWpUi/p0Ynq6yu+BIJPUCpXfzFpNYx4xq7fqRBaXO/dS1BjwvbTJxPkBXg1vQJcJIrBbwHcIW7yoxH20JZrj5LcY035hm18V2/E=
Received: from AM6PR10CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::22)
 by AS8PR08MB8970.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 09:01:23 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::d7) by AM6PR10CA0045.outlook.office365.com
 (2603:10a6:209:80::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 09:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 3 Sep 2024 09:01:23 +0000
Received: ("Tessian outbound 901f45c3f9e8:v403"); Tue, 03 Sep 2024 09:01:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f965453a8a7b612f
X-CR-MTA-TID: 64aa7808
Received: from Le5e2ffb7fe9b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 85A8DC65-3AD2-4CF9-99CD-E2E71F6C9E2B.1;
	Tue, 03 Sep 2024 09:01:15 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le5e2ffb7fe9b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 09:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3BZi23XJ48EBaOVm546fD9hku4FX5sSC7JwULmlrtLLkbDF9iHNJQM4+xopwVcggZDNggQqS2u48QeaZbSR3quj+MtW/76ic/Lhh8YCzL3G9rgPDpH6M284znP+YzRIX9OKkVaUKD6cilkPReNv8QhchOJjBWHzHap75YI9mezj9WkLuzbhPNwpSPLRQGmUhUkVXzJwqSARIjbTpyqr3Tv92djDJF8UKhz3v/5Fp3ltPfxxPxb9I7CbY3Ci0SpLFLGbqalM5gEPLz3J45F9wlwgITwyEi/YXBc0We0Up1Ec6Yap0i+oT3nnyC/Hs/oijRjsd6sKe7kxS7dSG3K58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPZRN1D5kGw6NeRm4Sx5KT9gcnlou788LX7V+C5wfSc=;
 b=Yj2xNOPR+9cPLI4VAHzGhfFLQ7hHT9jAbFEXhAzpNla1JXahmvzJHG6+lamicSOs03o3LqB9RORhSFX9dO9DnZtl1fLsGT7Qo380h0fk0Vo795CcqMWgk2FTz4zHgeNqh3WMKC3wnaH+BMzDUhmEHLep3DcgVJylFZzMwTFvh6il3hwxPg3/mW5tDG41YaCHZJpbspe2w7XNG1Vq1m89PBy6QwpTeoZFi0EsPWnmFD+kjwhhqTsyFLIzTgQoTK4StL0t9UH6/S115EbednrpuM0g7We9aBb/djxGKvrWS7pqNnMJ6Rk4oXtM68fLpVIgQZqeEkC43oQJ1vyIs2VtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPZRN1D5kGw6NeRm4Sx5KT9gcnlou788LX7V+C5wfSc=;
 b=WYr3riJk/3yZC1hIiGpXusAQjlRqtxdou9uuIK9AtnVlA0PoFgYpvdiSmwytnOLpRaxDoPu0mWpUi/p0Ynq6yu+BIJPUCpXfzFpNYx4xq7fqRBaXO/dS1BjwvbTJxPkBXg1vQJcJIrBbwHcIW7yoxH20JZrj5LcY035hm18V2/E=
Received: from AS9PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:20b:50e::9)
 by AS8PR08MB9477.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 09:01:10 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:50e:cafe::96) by AS9PR04CA0087.outlook.office365.com
 (2603:10a6:20b:50e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 09:01:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 09:01:08 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 09:00:46 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 09:00:45 +0000
Date: Tue, 3 Sep 2024 10:00:44 +0100
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
Subject: Re: [PATCH v12 17/39] arm64/hwcap: Add hwcap for GCS
Message-ID: <ZtbQPBSl6Ym7g4QE@arm.com>
References: <20240829-arm64-gcs-v12-17-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-17-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|AS8PR08MB9477:EE_|AMS0EPF000001B3:EE_|AS8PR08MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 9184b00a-0af3-4412-2483-08dccbf6fc2a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ltwBowyxfJd+X0njlSGHHNYB1Oi0VFO8Duzg8Dzi52d5JlYTIi2Jeyn7V41U?=
 =?us-ascii?Q?VKb+3O7ganFofnUsoaF2s5P/REuKBeTAwbFH5+agqmCynBLbVFFmMEhkxNMP?=
 =?us-ascii?Q?kJePSRlq62ce8hwl+KViL1Y5Xf/B1u7rJc8ivp2ao06TvlZBf9nqPEXd2v1p?=
 =?us-ascii?Q?yEnwa/K0c7+JURurtDdxbaT9jNzyj4D3fx/tXyVBTXa5gLbWY2TdaqTEfcSW?=
 =?us-ascii?Q?vNxmVYf81tSYt6cx6Gagjn7staXsttFF797eVFm1Wz6+w1AlhL90MNAueaKI?=
 =?us-ascii?Q?g445WGZHnwb5Zq19IqgM9jbgmX92Zd1h/S+KVwOrmtA1zPoac8XYAJcf1xOi?=
 =?us-ascii?Q?sNitsQNCg34+iFU5feqn+2HApmoFdPA4DjskIqNE9iOdJLpOMgsDAtySKmjp?=
 =?us-ascii?Q?u4OUpqWBiRRzecDhVgfKd5/Byucb7xPgvppgmsI/4H7PUxVzsKhqtYjQCRZF?=
 =?us-ascii?Q?rqFwZn+yuT7UR5wd5aJca7UqTRWxmS1qWcAwu8DRQPWdlJsOTzZE8ePmCq0B?=
 =?us-ascii?Q?1Y3QZpblmcHxe2kTXoeGD2LFbNbKFtiEjILsrhPHT+/iVjyqat8wRvOXEhRN?=
 =?us-ascii?Q?urgzO+GYL6VcDJiR1hqZIQnO628nacxtDpy20dN5ezVwIhYS1arPvKd861rm?=
 =?us-ascii?Q?QkB4avirqhDXodkCuXMQPb91X3DjK17CfrbBbu4ILJSSOOe5gSingqLTrQkF?=
 =?us-ascii?Q?3gCuk2eop3mMtYMJ03SK+/ItGCgLn/IyLDcgCAifYbc3U0d48E5czI2eybsX?=
 =?us-ascii?Q?BJ+PMAMTPpA62FqkYQJrPmYw/DkNzHcuZNwjYyoVlm4wmY5MuknErWNGETka?=
 =?us-ascii?Q?KSwsCKPjw9ZDoy6vnKnmu3YwgAoLaYhGARTwcWG28LPky2z06qNJJZVXL9nK?=
 =?us-ascii?Q?velzBDH+qmDneI4p7WinQDUmzpqpNk0+VC6RPp8tgdlVbS8cZP628ITMq/Om?=
 =?us-ascii?Q?OdHJDc4Cp+YPoyJIgMtqNPVMakcj2aiU7qbcdKQSfQBbKyhgHflwmk3LvjDh?=
 =?us-ascii?Q?AxzlDdVTiZdTUmazyyUNJXVn/CLfpbxMpdRZn9nSsAKbOD9yaBOKHUBN2NyT?=
 =?us-ascii?Q?NeDkpMH/5D/XyjQxDLMZeSd6ulcTkBar9oiGN/IfxeH/qnlPStAF8hkpWCx7?=
 =?us-ascii?Q?NGQi8pr6W8dZub/XMUdO/ayIs6Ctke0bYExxqYBIlPc+mXdtig5RuW0lfm42?=
 =?us-ascii?Q?+iOgMWIlJzNtZDCb5ztKn/JBaakXbZ35/C8BYvRqfkXnXZp7NFkLBbs7zl55?=
 =?us-ascii?Q?8UrQCS/2j8xKzhVVT3Jm0vsgf9Uo5GkRce8dColjQvNMY5arySv53xVJRd6O?=
 =?us-ascii?Q?UoLIx96tY8+IbPDD1dOdFsWjaVucvWrfMPXHnZk6+PShJ+uWr0uVWUlvOfpi?=
 =?us-ascii?Q?2kAmY/A4O1d3g2dvVaVUppZqgZGZG7nfA0vplfSmWDsZo+Ve3YNOjRpX9O6i?=
 =?us-ascii?Q?8W1AW7qRSnNJPHe2o7RZymv5zoJyyS2E?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9477
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:50e::9];domain=AS9PR04CA0087.eurprd04.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f39cb02c-83c8-44a1-ca60-08dccbf6f33b
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DZqi6Hl5K+AGfTouH0/nT+5nDxBGLAZfT674wCA8BhphF17YpKgM5kL2wVF3?=
 =?us-ascii?Q?xJbksQNFJB6wz8VDxNEaeqlflBT4g6MUv5+s9tf/E91XQidqVqBI5wHn3mjX?=
 =?us-ascii?Q?ZmVnWnzUWobmP6pBD0qOA6gUNw2QNaRN7GuB60DEp/sye+MBprMqFTgCYEqE?=
 =?us-ascii?Q?BilJx8GauSvMgNw040hVYRM+1qhMMxcgEZEjG3s+ZgigTa/JfqgtIedy2bPo?=
 =?us-ascii?Q?OEBvBFH/jFN3PouVJFlMMpCqFwrQvniwQGR5Z5fh5CwHEtwkxSO99ytsbR2P?=
 =?us-ascii?Q?ktFCoWEBAaKgK87m+sCLHc1ftOB9cY2/WQb4HC2zEWOC+n1W4VdSHfEtaiua?=
 =?us-ascii?Q?nru18KfNX6o5rPha1zKfP++PtWutLg6yNKP8dAKajgEXrJxJGwlRYhbWQbuh?=
 =?us-ascii?Q?s9/QfjorU840QC/Amc/nDd2gYS5WtS8xl7c/StLZr8JH8YKJddyc56aAi3ec?=
 =?us-ascii?Q?3UVpWUWmUwCwblB63dbwVZ+IzougqcP4V6LdCuRIVeEcyVX3SG2HZvpftIg4?=
 =?us-ascii?Q?srozpwMhvXZoVuY9kFidzpqmZief5ZY7sEparcU9ya237mQJFQRL4ru4MtMO?=
 =?us-ascii?Q?9WwzMBycXjGPP1psWQ+HYSFE0OUak2yWPLGiGLsxUTiEgV+nTr/BSAFa8bV2?=
 =?us-ascii?Q?RGqJUPyPR6C6dGQlUUOZ1kJ7SHMmxM/I2JM/8DoYOxh46G3SaPhmCwdplVE1?=
 =?us-ascii?Q?zGneaPc/hRmLDfOXHZuTmynwexaZCdIdURzGnv0wQlC1O9PD1hWlZTooKZTM?=
 =?us-ascii?Q?dCrJlLtoMD+NP8fidCnd6M/tbSf8ZgSLPSFmGko50VG/OD6aSJUqX14Qqe3K?=
 =?us-ascii?Q?LKcvF0T2HJLpVgghSIeFRA+R378yCu8U2fvNaIx+WO270NYRZetVpa1qrr9W?=
 =?us-ascii?Q?QMbSUus8kcL6h+3c1+oPlyf4hhvJFEbUThL26JMr7c6EyQi9HmJ5KwMGbk+l?=
 =?us-ascii?Q?mWqoRaFF5NKYmhIWlFVNXu346w+rva9h3onIkZwWRQ5MZHB+6g9g552qMV20?=
 =?us-ascii?Q?VIQaapJF4lBqbaGk9x4V2zlJ9fllel+uoaVQSW/n2F6Nl9lH9GKv83+MflKp?=
 =?us-ascii?Q?U3wQHC9DClbP9uOhQwTFJIQmycDChZcTOGOBa+9PIta76VAyBTdXt8jUz6m+?=
 =?us-ascii?Q?hOIQHGc9YThG9dy682rPEtdPOBcBLxeOG8/4s4kHGOoBT5H3xkdczixAAMCE?=
 =?us-ascii?Q?6BrgHA7qZy2NvlTslL9CckZnnzmCe27PKrTpOWQA9dtTxP3vz/YldjXQizcn?=
 =?us-ascii?Q?wRkgGBHLv/GpM3ryZ7PCRVMjogm6PvxdIa/NOtpTd8+XaspqI64mgQfdS9MB?=
 =?us-ascii?Q?MXNRA2kbc3Azv/Ur3aVmbVej9LhtPj3mLCXfl5cMa0u0z7YmAR9/nhHRBeoz?=
 =?us-ascii?Q?RIpnTkTjDUZ/ks1JRrcwB/oUAXRT0rf0Ya6TNR8J6Fic4lJEBJf66MFQOn+w?=
 =?us-ascii?Q?AhLx1rdM8Tf4BKNFA9rWcquPnQVKVA/Q?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 09:01:23.0750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9184b00a-0af3-4412-2483-08dccbf6fc2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_020131_084872_4F7532FD 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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

On Thu, Aug 29, 2024 at 12:27:33AM +0100, Mark Brown wrote:
> Provide a hwcap to enable userspace to detect support for GCS.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
