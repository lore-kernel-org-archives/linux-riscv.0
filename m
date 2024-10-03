Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16F1CF34B0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkcBve9ag8OtayjJR7EJvfqPyWOXZZmPxNs136Ntubo=; b=zVyTPqfrteaIOp
	2n5P/6X1pFw4IdJQn8a7h/VGDaMnBDvvIGNrhH0cnX7hN315qvqhHCmsMfkvxriOVakITvY9tRZsT
	KhCOQzxnoEqHA8v1iLwQtKkFWAwgdEc/iOnVvsddnDnDYgQXTVyUcNRzgUfDb/XPYxQRrT0dV6gnp
	LlmJfMMJmbqXEvhXZ5TYVTwV6BVW2FAIQw4z0xEpAms6JwdHRNhbcVkcXFwAvf8gkC0OwNFvs0sGK
	6TKUaQPFzH3Eg6lL0FQU7v3+TqLlXLlj3QWmifNueuU81v/HdRJw/KSc2fxJRMdRry2uGvcLE/U7t
	bMU486kgWRdKoKLmkYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swOfp-00000009ouO-2OgP;
	Thu, 03 Oct 2024 16:27:29 +0000
Received: from mail-am6eur05on20631.outbound.protection.outlook.com ([2a01:111:f403:2612::631] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swOeX-00000009ofA-0UR1;
	Thu, 03 Oct 2024 16:26:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Jk/kMsjHBEbJAqrG6rjI1swhxBWIHwvTRB5xOgFS35q0oaMaSw5xiV6KAvi+A1Lh3ctW+ky2fMfHyCaifclQH2do3XMsViSUsgHPXtoV85+4A91M4AzsibD5LZJ8BEKL6gUK2ZdkWZGFT5GK61fEr6eOZS8LmqtUfsMhZy5iGF4Q7wSPXX30XyrRkys8JMlcW55VoiHmvd2RS6UcSFJ405d33IcZdRrORdj2lcdOUN39zd6Etyy1ttsXMx6NT9QML5tUayQn7xtJTMz76f1mi6IdNo2ASr9wj/zs30Pnqm2eVpCAa+Np7CvvFBukRzWhA+/uNg2iz44YCg/uExHBxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8bUP8pfbQz6muJqZlHMDu2399IoR6iXiLCJQPxtKjs=;
 b=iQ1n9WHB8053wPhdgVmQ/fNS1kkOo6i5yEmkQQ1M/u9TMqv+c7c5n0Zl20PaB1Q2KwddB/2omxoewo8cZTTgoJPF5DcuipQp0YIduSP/+7dAZ6075cIYcy3nyoknj4o1H69BTQOyLXa2KDo8sTGZq7p7pOk9TGomQBP7TqeJmkHx1CP3zT4qGpbgcDEVj8+Y9po1hZhA4PYFsVuou30iYBeq9o506NrHpzefTIv5rX0F47cX1PRqR6qI+6zlVen+9Ef4RVakw7P4wv6CzG+56vKIWS5y0SDcXYr1oEyjBtOhZAxmdxvOLjJuawT4/9Njr3v+M0825hIZ8vZ5AlDnNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8bUP8pfbQz6muJqZlHMDu2399IoR6iXiLCJQPxtKjs=;
 b=T729HnV1d3YzZSFdybokhO/nxZhmgfEhNbWvg2OlXUtyjkCBEfRQ6CYUkn5AaP6RuixBBkAS9odU729qi4yu4QAvmiW//FvnKJVT3Z81KR+XGhQyptQi/FnucB22sX+/wTn0vILAXGjyf8zbudF/tMbE74UYcDs1v+A8SHTaUK0=
Received: from DU7P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::8) by
 AS8PR08MB9292.eurprd08.prod.outlook.com (2603:10a6:20b:5a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:25:56 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::d9) by DU7P190CA0022.outlook.office365.com
 (2603:10a6:10:550::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 16:25:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.11
 via Frontend Transport; Thu, 3 Oct 2024 16:25:55 +0000
Received: ("Tessian outbound bcce15e2414a:v473"); Thu, 03 Oct 2024 16:25:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e90799dea60ef9e
X-TessianGatewayMetadata: IF406E2NVOIFiXRMbuixlvdY0LfJgZR9AMmShAAlmhttGJfQeAYOYSCbZhYh2Ti+nmHbQBBe3HifxkkepticuSgFiZA2+glvO/u55hPCMAJrqK/14zh7nhcimx+xz18rBvCOz384enzWSWLP3e8yjw==
X-CR-MTA-TID: 64aa7808
Received: from L6f6aa0bf32e9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7644A89E-DC81-43F0-9876-09150D533089.1;
	Thu, 03 Oct 2024 16:25:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6f6aa0bf32e9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Oct 2024 16:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUbYYsWhR5PBnawqSnkZON6nMJr9GqcHbnEjrZJLcKGaF52TVkVnWDPkcMqfp5ZWEoEIXamTJaJde1fdOKunjuqxUjWMrEsjCrHG7hu23VFS7UKKSkGwFaLHJqw+Lwo/JkikJLuDRWk14yraZz3jDAUWIe8QqJMnj0j18OOOkNTvfLXjmrkY7h42dQk235sYIJ2r9GN+AlK+1BiSSBWwHMb2d5tAMS7XzCnHGnbE/cu4u35hyKmZiiWMyDlStzqcyKLt50bK1PjJ0Cv4R8Oq7WvZByxkMCkmuzoqZ9pLsQfXAQBk7xxGMOglbf1hMjCwf2uFyx9+eRWiQrzpiU5akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8bUP8pfbQz6muJqZlHMDu2399IoR6iXiLCJQPxtKjs=;
 b=ERsQT13DCust0Y//m7n3jtK1gDMcshDsRCtA8cIMPJ5Z0PKVDJY5f3vvtjUrSsPAg2FJxmDSLDYLsGlEXfAROBAi1k2ys7nlv/6/yd2FQ7+HXNC4oA8c8SKGLC5FS7bT0AyMlaHN2Fuln9aPpzmXKbhRdJCaXsidQYkz7M0VNR6yZkYzajA5pv3TPseVy2DR6uGl79y6pP5XVV9x1FWEmt7hQ5xLIE/VvwmUE2xiMksaOkyg90VNmvGiHXsOwZ59e/8iYvF/PXyDCCmtIwSeWderOgQsW2F0/9eD4MtX+HAuVk0xBja8R0rtIYdOdz9L5aTDviroRPySbBhc24I+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8bUP8pfbQz6muJqZlHMDu2399IoR6iXiLCJQPxtKjs=;
 b=T729HnV1d3YzZSFdybokhO/nxZhmgfEhNbWvg2OlXUtyjkCBEfRQ6CYUkn5AaP6RuixBBkAS9odU729qi4yu4QAvmiW//FvnKJVT3Z81KR+XGhQyptQi/FnucB22sX+/wTn0vILAXGjyf8zbudF/tMbE74UYcDs1v+A8SHTaUK0=
Received: from AM0PR08CA0004.eurprd08.prod.outlook.com (2603:10a6:208:d2::17)
 by DBBPR08MB10507.eurprd08.prod.outlook.com (2603:10a6:10:53a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:25:42 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:208:d2:cafe::64) by AM0PR08CA0004.outlook.office365.com
 (2603:10a6:208:d2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 16:25:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 3 Oct 2024 16:25:42 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 16:25:41 +0000
Received: from arm.com (10.1.26.195) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 16:25:40 +0000
Date: Thu, 3 Oct 2024 17:25:39 +0100
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, "James
 Morse" <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Arnd Bergmann" <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, Eric
 Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta <debug@rivosinc.com>,
	"Ard Biesheuvel" <ardb@kernel.org>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"Kees Cook" <kees@kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, "Christian
 Brauner" <brauner@kernel.org>, Thiago Jung Bauermann
	<thiago.bauermann@linaro.org>, Ross Burton <ross.burton@arm.com>, "David
 Spickett" <david.spickett@arm.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <linux-fsdevel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v13 18/40] arm64/hwcap: Add hwcap for GCS
Message-ID: <Zv7Fg7BkP18O9CdS@arm.com>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-18-222b78d87eee@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001-arm64-gcs-v13-18-222b78d87eee@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|DBBPR08MB10507:EE_|DB1PEPF000509FA:EE_|AS8PR08MB9292:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b62cf9f-a82d-4a31-a5b0-08dce3c80e80
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?hP7p46UKxp2ySWE7jzcxYuYBJyVfWkRIHtdnwgcT7nr9bz2ll6nBMdoMjbq9?=
 =?us-ascii?Q?YqVp0YJy0qN3B6jzG1STi2rJInulzOOVt4/i6gG9qkEiUYs3VzFVmpPE+Kjl?=
 =?us-ascii?Q?Hx9TpAz1ynXEOskGxvbL9drKSNHhBCufatzPSoZS12JtA4xH+if9s96jGZE2?=
 =?us-ascii?Q?fd8L72ji/xuOU8xSFWWLhcUmeOSmqgav/vJXDhwWyOrqo4UoRi9vsvglQbZH?=
 =?us-ascii?Q?AqnvGsl8v0bUvPVxZ7FMJrhi67XMDt47S1MrKAAQuoRmpqIN832ErUosaKed?=
 =?us-ascii?Q?vDmMVsFY0QTNSXP9AIutjvaXVsiiOMWqJl9O1J8qIjrF8erHU8r5gDm9rjsD?=
 =?us-ascii?Q?m7RUcCW4UxhflJHaTauojOT8z9dnTo95meT5cIesTwFi0rQi+1ZEEF3vvKnj?=
 =?us-ascii?Q?SFqJzkOb9E4VG93ibkGGj8ovPfvu4Mc+RauauueiqMDSzFAwijGE6G1VdgH4?=
 =?us-ascii?Q?sxTPGDIyfnuciiPIK8Onav3hWWg+F+X6K3A3WyefZFCPh5oKy3OjqcRjEV9Z?=
 =?us-ascii?Q?f+/Tw9KM4F/9Wtsot8atK7sEy3mUB/kWkVv2WkAbz5g9JWr/PZ0rYpc555pw?=
 =?us-ascii?Q?kF5BBfJXLjegRwx132AJ1Vqc+2mF7WQ8BOfN6jk7bYcufPTe1LFApOxkFA9y?=
 =?us-ascii?Q?Nk3DM7zIfG0iGZZ0Rl3KwL7YGGDA7Z8LRu6SarhMUJ76DmIeLwiFQ54XwpD8?=
 =?us-ascii?Q?WhwMrN5JIqnItB32YhENIhkNaBhGAXpjgxmzTPM0uQakM11cns2Np7sJDMz8?=
 =?us-ascii?Q?2zJXbd4Andy4M4pA+OBUB9OK+XOVh3e18iQ1VG62vTxqlefJKKlNwWaxDXu4?=
 =?us-ascii?Q?h25vb25ucxIeJ8PF8iJ557J7l6OKMic7syjarHpywFkzhA9iXy74vKm1tWLT?=
 =?us-ascii?Q?55pHIrqOGrB+YZk7kYpJgN55WcH8+Ju02MxUFNDChfCC9UY/LIH5DelgBF9j?=
 =?us-ascii?Q?IZJloaTyPdWPYJm76MWMB6Rox7Dzg5vwExWk3eNZidtBiun88dpckOAZDTxQ?=
 =?us-ascii?Q?2SjESxrYPGfYDW09LCtrnB5YHC7YvqpGqZrpeEJ6yOuieCProFKyhLWCZBof?=
 =?us-ascii?Q?118hsuPMQnfnIQWJwAJ2k7isM/kha03nIvnSn3T5PL5J2D+zRj1bzJOFbZVa?=
 =?us-ascii?Q?hs5irVxunnI9Lq+fq8AfyarXjKeP8HL55fcDbYdjwQGw3G5wqyymjc71W1o5?=
 =?us-ascii?Q?S4G9llEvkIi8THCwHPKT08KimIOtPF1iy8gmXeSWE5UulZ7Bp+TvTIY6dOYC?=
 =?us-ascii?Q?Z4pjduByNtVopwI0vtRN/D+3P2RvaubuNfQquzF0fGEQTRCmogGfm3Fea2s7?=
 =?us-ascii?Q?DE0vV3wy9PjCqyCx4PVfhqQ5JeL/1BfVdyTJxKyQSxhVQ8ZOO5dE6RngAf8Z?=
 =?us-ascii?Q?kD9u/LBBpU7pX/4/985bZ9RVqo9F?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10507
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:d2::17];domain=AM0PR08CA0004.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2d6d03c8-dddd-40be-a3b0-08dce3c806bf
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DVjA/owBwtcltSgZjqzw+S3UvpbQ6UEOgNCghZzAr99RooYyClislpRmKykm?=
 =?us-ascii?Q?G/k7RwoJeO6WzWa2SMOYzuW+LQe20EuDR1r7p5w1gYPo/1UFVOa5uUP+PjQ2?=
 =?us-ascii?Q?m3AYFNI4o1y1R3oo2tF6y1U5e6DL1YwdTsgF9d/HW7wORtf1096+Sv6ouGn6?=
 =?us-ascii?Q?kNLxLTCUymdjZs82KnqqUi7K7dH/AvESEejpGXyR6YVLPlfkanAqqRSkmz1H?=
 =?us-ascii?Q?fv3sQfOQT4e7YcDgxbvUs/FgoFD/6Zg7HemC/n+yrmEL1IcsnG04Hf907x+P?=
 =?us-ascii?Q?ogk22ugoTRO+5MDZk/4ycdG3Ownvch9utiKLzsc5iOHXiLLM9iFw0xjDF3Ok?=
 =?us-ascii?Q?wD0e2LFKal0P0G9u5M22C/K53+PZ13XjUKPDsp5NCUJcj/RWA0Dz4kMUU1pN?=
 =?us-ascii?Q?NNpJmH5hbWdPYsOAb7TuRtuA1pIfHNRezGBJKKMaRNIr6Qb3ZAhtXyg7YWzN?=
 =?us-ascii?Q?Xw7FyN7ZZIXiODiwreyq2+jhiE0teQ1ps3GdhycfHuV/GnNi8b3lQDy6KsbJ?=
 =?us-ascii?Q?Xb+w3brMfIwIwJozKDdpK9kzFIQp+K2WrJmWxiH4Fk/B3u9jmkR/GYVUBGqM?=
 =?us-ascii?Q?NBpCeVyDibEuSuuliT+KbCySasy1PaCMJbjjT69nZeunAZsMUP/J2CA6WIpr?=
 =?us-ascii?Q?uAFlqTt/HIwt6vbqwBV8jqHAcu0Ce1qse6FO+rD1EPjwF8G/2eOq5pwgSc4R?=
 =?us-ascii?Q?vWDpsh2iN3lAeXTnKuLeewQ5FWswjDGCfaSFsOQ+butIqlIuvT5Tyb0Jz+Q5?=
 =?us-ascii?Q?g0gchwaO8mIkVMKBzWDgNiav99NmzGA5u5vQ6xZBzO699yZ5wXkevmq7NZtJ?=
 =?us-ascii?Q?51IO3NNDvf8EXx1eHLA+bVRHGR92DZ7y+ri5run1H72QVKD05TPfWPJZy7d9?=
 =?us-ascii?Q?DT0m18ny7hVJh7YQpSWCUD9ifJsxCG36slQ9MF2ONxhScUR/rX0BrzzhiEuz?=
 =?us-ascii?Q?tjxE517GjIZRKa7qVSkm2JIVRwrN3ZB15IItABn8LxaW3/9tSnqd66WWrZ08?=
 =?us-ascii?Q?n/9EWO3WcDbB/hjMesovliIAB2ysIZRlL4fJcMIK4HBqp9Ht8tR39Q0bndBI?=
 =?us-ascii?Q?D16WX6+9VfSx/lMejlqLV5a3C9BU3e5FtZeMfKCnR3PqMnrZxuXQSUE8Qwxu?=
 =?us-ascii?Q?oRkRW+BYuhFAhFw0jtYgh3pmr/geZvkSI6MMYyaM629PiZA6M7WpLT2KPEHM?=
 =?us-ascii?Q?ZScdybH4F4YR9LfkTSwjxUiG86wnj5yVMxW8QxXu1a3BLeGtIVQWGyfeMSOO?=
 =?us-ascii?Q?kYO9My/euXruZU0cQ0LHlEtpZTHes23kz/aTu96W/8Mt50mkpfxDE0DkL8AZ?=
 =?us-ascii?Q?QwjJLkSaaBSRHX04a18rjRyuN8iYwQvBhyOqxEfNfloXCX8ENamJa07bu7cV?=
 =?us-ascii?Q?J72jXuCkL0umPo4f2D6qgFwwG0A9?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:25:55.5731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b62cf9f-a82d-4a31-a5b0-08dce3c80e80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_092609_326569_C8A9BD88 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, Oct 01, 2024 at 11:58:57PM +0100, Mark Brown wrote:
> Provide a hwcap to enable userspace to detect support for GCS.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
>  #define HWCAP_PACA		(1 << 30)
>  #define HWCAP_PACG		(1UL << 31)
> +#define HWCAP_GCS		(1UL << 32)
>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
