Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A4CD3420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXApTIbzZB5wgpWef99vXiOZ3uZl6MEmADLXj30g3ow=; b=L+JAsDH51iYW07
	eg9EzrFjDIkEKT5ljSZVYU3MP4cN3i6k/yKM7Ef2I7kHrmqB1VuZuEmws6Rm6RwrygI4ZV19G5Hw9
	y3apwc9U535w3Z2ukIE7G/p8sRC/sVPoYv5S/KwTLozjL0D0gxreffOSm2zc8rxecx9ym4VXk90kr
	EzOThh0rRlZs3NoUw6xXqjlaXlRQuvCmwNNURuJqwkUmvjFN+msxWGYdLx4XNa4jrH+FKAWE5hvK/
	04G7dTx1HCShmSpqq40QKdZohGsgVes4rnbGkJrebmvFnFaKKyxg1FixRp/PfK+WQANW3pVjYDRNZ
	zYUwYvwb4FmqeB5UYufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPPB-0000000H28i-3vjY;
	Tue, 03 Sep 2024 09:00:54 +0000
Received: from mail-db8eur05on2062c.outbound.protection.outlook.com ([2a01:111:f400:7e1a::62c] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPOG-0000000H1tI-0ytc;
	Tue, 03 Sep 2024 08:59:57 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZCAsUEVBGptU/Y8Bof5EYFf2GOp4EYyhNPGX85yXXYx/HjDh7tlOVbT96z5mqLtP2yq4SLOu0Etru19aPPTqpycLZTtpfhGzY/lyr6m8CnUkE/LOxHHIuCiSJHY0xO8SC5QNslkNY5mfYDmrfYngaPnUwweQ5g1ySgC1JYAhdvqXQ3hQlaRQYikn6frnjBNfGHHYXR7o3UyeoL57m4ZmquFabBZNic7QwSvzNdcemkas1yWJyeog8EvgXt+uxowD3sSQ1ZkeQUwcWHmMyvcqRbJ9+9buIZhZuF02R1h2gRev3h1U53jBD9hUCQRooBjSv4hrDdxrRBR4GL4TdXiVLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/SgidYbx5KvfjOVnSHraJQCl9k5fI/hYvTUxgdL9mU=;
 b=ZfBYyvZhCQYNubqx7B3gO7Ug+GBaSq8Zftd2HFS26MufLPDecVws2Iab546jCrI79FO5199n6bb0vBrGOF3GdH/ZMLNa66uvlbYbgij1INgy2xNikkD9htRrDKG4ZgPlwC9vx816Suoart1B8XFd9iKyNKr4dGKrszK05OmdymM/Hlu+GJNyWYwOut8Bdnzc+fegP5sjnASX5INCtKgijKOlA+IVv8g+TVH9UTqTUZ+z4LUO1sszYs+SOzBwJzCxBmPIlqA2BQAYPL7fGboUw5iHzdnk3IRlqUXW66aJXz+bPHH5oc1bjR5DSjgP19yuIN6dkk/L6ZrSNpZyvMOsTQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/SgidYbx5KvfjOVnSHraJQCl9k5fI/hYvTUxgdL9mU=;
 b=OtMx3czdVb2Aw8M0JAM6+ZWAxgIZM6HeSILRpmc9IhLlRCF0o7pZg3V7GUB5gcrdsyNaQIbMW/c2VEimWcGgz5y0M4ndpjqOIRj1rKmYXLLTWU4FsUpxmsSsuFURmc6cN4VVj4MutzEDPguhjus8di8HsgDZMK5SURR+b4DkZPw=
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by VI0PR08MB10426.eurprd08.prod.outlook.com (2603:10a6:800:20d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Tue, 3 Sep
 2024 08:59:45 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::f2) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 08:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 3 Sep 2024 08:59:44 +0000
Received: ("Tessian outbound bc251c670828:v403"); Tue, 03 Sep 2024 08:59:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3658db58a5709976
X-CR-MTA-TID: 64aa7808
Received: from Lf3bdea9c928f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C0D68F0C-EBEB-4E1A-BD63-AA6D48D2C02F.1;
	Tue, 03 Sep 2024 08:59:38 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf3bdea9c928f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 08:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJAO6HjuZvBj0WhuuQQLFo5LrBmkPWJNuMR4wBGTkk8xD1vvA4kDWzniShXAKjAg6Ly+Y5EgKfO+6/We8XLjFUwrWPv9I7ZmJiwylPUIvQtl+CZrH+2EHYxaAzYww4D/DRjevhkryptYcRnWwu7ioUpS4fcMHa88wvHp8xNSRf/QWJq3pq6d9iDAsaML5UjbfKhuMyC+H7yDNBYmVfA+9ilXysrI6+unWCvaPgS9OWKd4vjhf52T7YzW4rZJ48zUwrVU47+OpkjulVG7oAQ+C8cNc+oXUjIAxtyIO+7pI7ChRnno7wxXEubCGZ0HMikcDGMhayJaUhcXXBz47Jv/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/SgidYbx5KvfjOVnSHraJQCl9k5fI/hYvTUxgdL9mU=;
 b=trlX37pqjgsg2d/zJczs4er33StYZgec7hC/KfpQ55lSy/MI5io4OIQIagtAXxH5UrggZYcn4Rt/A27B9ni08ZtrTMbOoH8jjwEaqQaVv1R+AgtpiudJrlgQQ/L4vTs0t0LuyeDKr1IVyBdxl8o1+YOdGp/2FwJDtmFsr0HKgYI+rho4U9n4BeKhdJX+F26sGfS+PHjTLFurC/dCqb2AKIquC7YzzPPqUP0I7X0x/nqnCkRKQweSQ7R7pS4RztPZlpH53r1G6JFqs4arUOFdjjdaKwGpafyPqhDoUdEYGG97oyNmv5dkbitSQM/7TrRmsqvGqJE6Erk6OceAu1ZODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/SgidYbx5KvfjOVnSHraJQCl9k5fI/hYvTUxgdL9mU=;
 b=OtMx3czdVb2Aw8M0JAM6+ZWAxgIZM6HeSILRpmc9IhLlRCF0o7pZg3V7GUB5gcrdsyNaQIbMW/c2VEimWcGgz5y0M4ndpjqOIRj1rKmYXLLTWU4FsUpxmsSsuFURmc6cN4VVj4MutzEDPguhjus8di8HsgDZMK5SURR+b4DkZPw=
Received: from AS4P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::29)
 by AS4PR08MB7506.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:59:30 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:658:cafe::74) by AS4P192CA0036.outlook.office365.com
 (2603:10a6:20b:658::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 08:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 08:59:30 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 08:59:30 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 08:59:29 +0000
Date: Tue, 3 Sep 2024 09:59:28 +0100
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
Subject: Re: [PATCH v12 6/39] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZtbP8CAOPDanw6-o@arm.com>
References: <20240829-arm64-gcs-v12-6-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-6-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E1:EE_|AS4PR08MB7506:EE_|AM3PEPF00009BA2:EE_|VI0PR08MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcc3d0f-b9a6-4f8e-e1c8-08dccbf6c155
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?w7uhcZb5zn+2LXSvvsvj+/E7Z22yrs8NNEKAVHq4yKJKs1guieTgBIGjpulO?=
 =?us-ascii?Q?rvHV4ceJ4Ihmg22eG+NK4vPhxyxhE8dbcia/yu2Vt15ORtsPzeRu6A4535eN?=
 =?us-ascii?Q?QssdCgUnuAvFpk4vFAcAQ2pyDb4bmwnPELaNOT2lZywGL2Abx/LaYOHGlFzE?=
 =?us-ascii?Q?4yJUnsJdNz3MzQz1M9gn4EYGkmpV4MaDGyfLijphu80ckMfCnqrYVFZiSK/J?=
 =?us-ascii?Q?hr/jhXPuww+392aO/d+ZN2qp9IFYHoJ5MzQ04o7OQKc2jHwhYf7Dhro48OVK?=
 =?us-ascii?Q?uLhb/4hzVzAFK0msteuZ+6VP/sDTeGMLNwwDT5gcor0rVBzsRtWlKDUc2+A+?=
 =?us-ascii?Q?asCRxwFmjvQ0FuTm7wvJn1S9DIyY4AQDtRVTyIPW7WfUL7UXXYf2vUGQqU7f?=
 =?us-ascii?Q?Cbe+VVh6smpQQ6XfxtyudNMVUfLtNTlOUTCZMcOMP1ci+knk5RSnsG0faFij?=
 =?us-ascii?Q?IC7VUjdtUtHMytA1y22dVWaePT2BdD4WzlLrAkfKzNM6Tp4jUpbuqP5X2Qc/?=
 =?us-ascii?Q?KkMm/bCdpM90ftTckZz4S9aipk+/ExDmAZf+woOK5udCDv/gaoPDkFBuufow?=
 =?us-ascii?Q?gjG+o1Wom+aGah8BDrEucFsoiY6/LG/W1kYeZvAZGrXVA/VrNuS6T0x5miwY?=
 =?us-ascii?Q?EicsO3EIkoAsTEcpJHN3WshRYVFJ89erCsxXt13LnNlzg97R2a7cDDcTf1KW?=
 =?us-ascii?Q?ERhllegIU8XVKeeoWmxhlrZ8ripA50Y/gjaoDuHeu9Wdd47XFf3+CEcZLdI/?=
 =?us-ascii?Q?NKZlcjpyTz4/ZjxVZjWjx4EM0joyPXcDmHhxfTh/eC88/iT8+ldDM8iR367P?=
 =?us-ascii?Q?wYR1/7yVy+isPGU9Wmcimnz6J3jgKsPZ/JmK/5o0I3oixa7n8sB15KDxBVpq?=
 =?us-ascii?Q?/fe7uZP6TDq2OW0ZKlk23LGrIVGvogwdGqMVbOtJSMJScW67lgRLiLrnUoUV?=
 =?us-ascii?Q?3JJqyc3WH//EiFa4vpDquK+Ea98jFvZOpXlPowQnYDQe36Br0XXAkNA+Kmyc?=
 =?us-ascii?Q?anoOcShnEKHozDQKh2r8RyuubbsmiOzZm3Cyy72shmIuZX3vzVOdlvt1q6p4?=
 =?us-ascii?Q?qEIasn70Ae1nkImpMDv45EuoW529pGAJkIQTXdI2wL0XdFStOYHxgF4PO5z8?=
 =?us-ascii?Q?1rrq2Jn14Eczl0wOPzqdSOZyevXv1BYhoXki6WwwTIZ9Fip1sl7HG3db+S84?=
 =?us-ascii?Q?1NbJxe5RNtbs+6Erk2mV/TMXI96VXurlHUayCjNdWlem+9EQmAyN+6iWO0dJ?=
 =?us-ascii?Q?srqbCy8PG4pxWKlbIE3IjzNwNGBVfgv1RM3nVN3aB3+QEx/pFuv4TDJ6cMQO?=
 =?us-ascii?Q?oPCdex33MuvjVxcYAOobV0BOMVxy0Zu01KgMj00CQlLrSygrc4+hv/tSsw11?=
 =?us-ascii?Q?Hanis2BGdUKqnMaUJI1DTkcazc8Xv4uRQ8QLUzFIufws8c06iYbPvAVZWryt?=
 =?us-ascii?Q?pladoRTL4Jc+F3NH2j9Vwr4+H13ggXgB?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7506
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:658::29];domain=AS4P192CA0036.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f4d5341-ad86-43b8-ac0f-08dccbf6b919
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tTHcp3Zbx7yGlAmr0AGIJx8tiRAiwOtpzLYYb/ENR2rqODiwPeIHIYzheHpv?=
 =?us-ascii?Q?jP5cWMimfLmnsIc0OZBNBFQwjHiPkmr6B+VseywN/6YfWRDJasX/eVDTyUrQ?=
 =?us-ascii?Q?QWd6zTiunsncCQWJ8gLOBJ9ASRYIi2S+Rut+QzIUe7j5B2UwvBAoB/sECxkb?=
 =?us-ascii?Q?Nu8v8lGPpy333BmDNB3oIdB4cX9SEvWTQ3+PoNTddjvmeVT8S7LFG4WKdlaW?=
 =?us-ascii?Q?6/btF2TQfrSu29E1ICSMsg0WxBbijfNGPSnH+OyRFO0/LnIXahFcFHMDkJB5?=
 =?us-ascii?Q?ZlCxopMYAGtjBbVzLE0jfATWyrrkVpcnmOnuKOU/zr57kE5Tclj0IeuWoIT3?=
 =?us-ascii?Q?Aj2iSnroab43Eph7MHABgHaBdsCR1TkAY5fXYEDWDwTSuNIVnMRYaL6W4s3M?=
 =?us-ascii?Q?odWJ2sAgv5os+6KY7MILVgf/NaaF5wAkHfjcb9ca7lNboSC92yE1oINPMY1a?=
 =?us-ascii?Q?/AOywOXzsBw7G/ukswilyApG8IYxZ2G3LxC23zv90RxAmis6QcWHL7nbnwUv?=
 =?us-ascii?Q?x8aKUKSTis13pLVWyOn+LiyYlGAGTCSbxQchHr5IlF7B82ODRbxJzCwryaSS?=
 =?us-ascii?Q?8KhaI+xNtenNd0LmD+Zg/0+Gm7//vt0eQdJghrh3zIbgkN2sTvlsn51yMSND?=
 =?us-ascii?Q?bt8yp8ecIeJ0WdgiJ4qzkijaTpKZoiIZv3/WYJp4ZuSGVsQGDS3VfiQP88gO?=
 =?us-ascii?Q?02GGUTGlMfSoKktz6cNHHv3DdUcVyGa6u7hVWc4R5BHyxw0/OX0dVDkGmjkT?=
 =?us-ascii?Q?Lf9tNrfdfg8CePZA4Y5sLF7XkgrGfCTBqrFAjH6xmJMl0F+qEkhe2UdHizJx?=
 =?us-ascii?Q?CIAvXI0K6JOLLEI1gdeFLZQGgiQWvaEZqLQv0e9vbLE8rDuI6YkwUncRuEBU?=
 =?us-ascii?Q?7i0jDu+OVPgt6xDruPTJTeiQSeKvjpODUPRHkMz8WqDv+qOdmc2WixQMCoTe?=
 =?us-ascii?Q?gXzDqpSE38qbESjTYZGSSK4UPhA7pabCCXeG/63un6Gzffjz4T6WgEIxHYtl?=
 =?us-ascii?Q?MbDAXHM0D1ASqlQuS23HsOFicNw05a7Str0FLpG5zCh+TGdkv0qqLGcwFqos?=
 =?us-ascii?Q?1oe+XzA4gE3WYG3s4nuF3L6u2jPPQJRZ/pvj5AzZ4fTr49EhRCcdrTFsGjN1?=
 =?us-ascii?Q?cG4Gu9u4ygswdqJ9Dswiok34tX9hfAUpRACxOQdx5ganmY+iVNXYacmYiJ9M?=
 =?us-ascii?Q?Os9qUL8XO7UkDLraRnTbjBBTlCnl3i8r2C0pQJmYTiiYFXGLdd+0ZWwyOxka?=
 =?us-ascii?Q?8VFtG85BehrktR5JaBZv90BD63NnaGAUusiUyMsRGHIWxA+1AFl748+bauYE?=
 =?us-ascii?Q?GCoBxwe4gCgGJu/evMLKtBddzF1DjGew6oGCtggLVpDJvNw2kUAqSmW1Ni2o?=
 =?us-ascii?Q?1tpAMcBVYypq83JHrHqg1d05Wo9qWXBINezVphTeeb16LQInKJ1zYdESpbJd?=
 =?us-ascii?Q?d5E/ZpSeNDR2oWtGOl4d900M7OMf+obe?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:59:44.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcc3d0f-b9a6-4f8e-e1c8-08dccbf6c155
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_015956_453637_463A8568 
X-CRM114-Status: UNSURE (   7.06  )
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

On Thu, Aug 29, 2024 at 12:27:22AM +0100, Mark Brown wrote:
> Add some documentation of the userspace ABI for Guarded Control Stacks.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
