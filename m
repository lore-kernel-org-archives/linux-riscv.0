Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15666CD13CF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iN1s+6vNpcAwwJf1uNlpLfwpbYW6s2OeLgF24LLglm0=; b=196dP6YoMXAsPT
	uiRCtxWLYsCeFRK9tmbHSeTvtCna09UV1daP96xj6bcfayeJaQBxfiMla6cjnrdqmguqOKtmR5fiP
	hOsD03DaCboblbKYI7nY1iqpwXRDJN8FOGrV1vKncp1igPdyMd0X6GQG6egGv4aoddDR7ZNY+FHy2
	ieVen+lzGEDdDgX1iIBDIyDj3lralurSM8mELmaLTAwSwgLtV5zYlGAjoVEFp2GiVs/QdQFnmaPH/
	UkMobzyYO79i9p6Jhb36anFTOSDt0x5i5AdBUWGJ8vXS3nD2ohtQQgE9yhBBY7Y6wFmzOwmhkPF6F
	Z7YliiLOjYNGqerXALRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPMv-0000000H1Y4-1l7c;
	Tue, 03 Sep 2024 08:58:33 +0000
Received: from mail-am6eur05on20606.outbound.protection.outlook.com ([2a01:111:f403:2612::606] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPMs-0000000H1XJ-1E3K;
	Tue, 03 Sep 2024 08:58:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yR7LUNCd00iZTV2y62LooDJNOBQeeOo/NG+x+zOpJTLsNefAIGA9etw14NBi/FJCqt7nlqtnGSxZra8qBcrBgqUWFe+Y6VKDvHu4Rzx9WxAtDIXjXeZq+zqrOKT9KNtZZ1OH+0Y4V/2c5g102yoI3x0sfIKf6+eDgG8rlyuFflH/hLdGivD98ti2Zgv/i1Fj6zlE8hGNLxpCXnbpQNhP4Rf9ZQWUoTo3ZE3OOEEW16hPkncJoSueUbM030VuS+kpRe/cqIXc5Ba3n0LywoFZRbPg536YXuENiAvQUtZ5XEpA2FtpwH1b/55iQ4pHpVExNTGKGL2WiKoWjbYhxrp5Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDPnBQ5WQExdmdTq2J+jt8c83OWFnlkbUSI3uxGQlRI=;
 b=N6h/O4r4UL2XPQyFbB6HKuTFwYj7bsvXbHMiT3lx3qfTyqrBPGfP7zCneP9vwMmItccHdI9go6UIj0QVbFgiaI+T+bdxij3UxEO8AKrGj53llacQ3Tf1/emz8nhT5Rq1VzZTz4Gfi84Nm948RqEEWhb7YV00EUONhNr7SoJ9GZMzzRjOP8lgHZRMwDxnQYnO///fLSP1mNNOfJ9K1y2xHfm5+EySVk/6lHH8Rr0I7wboCJklt8QW0rs2nvfoilL/a3GgZz30Anp38Gm2HzmgyL6lubnvGIvm0NU409QE1W+YJW+m1DsDCSVSv+DYNharVLhJSY4l351gAUpwnHISHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDPnBQ5WQExdmdTq2J+jt8c83OWFnlkbUSI3uxGQlRI=;
 b=hAAXfIWH3PMoljOa5RffWnP05U+m1WrNEPX0Z+8SRJjBNSfZwJGVsg5s0R3tTKWYQ003BiUmisRTV89hzAlkM2Cbfw2YxAq7jSUyHQXFKJrq5LFgeNXesBL4GsQAOGLKYi7chaTC6v6hWPqEa5KgvH4BKIilqdWCOoRA95bqQmE=
Received: from AM6PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:f0::36)
 by AM9PR08MB6642.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:58:21 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0:cafe::84) by AM6PR04CA0059.outlook.office365.com
 (2603:10a6:20b:f0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 08:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 3 Sep 2024 08:58:21 +0000
Received: ("Tessian outbound 22f8cf4ed816:v403"); Tue, 03 Sep 2024 08:58:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 115f304ca2b5859b
X-CR-MTA-TID: 64aa7808
Received: from L189e57c3c988.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 77C2C8A8-FA91-4518-A25D-E5AA8E83FC95.1;
	Tue, 03 Sep 2024 08:58:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L189e57c3c988.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 08:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnERChSZEnshZMnz8CLMKYYPzJEWh0k0rwlQmK/IJwsCHFnie5Qs3mCZtKmRejlOHT3fOgDQxXMbla+aLv8Lgs/qnFGsyqBFgAsWmRWFPMVTpZfLfPrKu0GFmPcMeICRiAMCMjO6pH3Ityv+jIiy5djg/l8z318bAE5IJk2QlYN5LXD9jaDdBuzImlX0oNeIXwO1PV7lRczYYUyEKI75XYdQaHU/8i2H3eub5KI4exuu2Sd32ESf6ZVeqRvSrdVmJL0lI0FVPQwaY8102ei53UVvFUKlkzkgg+ZKQdnIQDMmBJKbziNzMS9YTviy/w8jPw6wUCmIMHImTnmlQdNiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDPnBQ5WQExdmdTq2J+jt8c83OWFnlkbUSI3uxGQlRI=;
 b=xIOHHW9IlnIHPKndTl45gSGLgAiEopFaKlXXzvhawUCxGp8bOaoMyTYAxtPSBvotq3zpnV55h6UaU3TtLkUN48ndMdJ8EeYQSH09fmPpfquYPevYqITQgvjAnMy8SkSl8xzcfdoOBws2BQ8msDpkXbE5nVwBI9zwBqG0piRq3KYhm2ds5H7WKGQRW29koi62GanjEcj9i9Yr7yBmEuZ2kxs2KYLSdNPz0+XFMEIm+UKRu6HKjm78dUgBNgu3T/r8newFEvb7wCHb61dNcOY5mZ8Kjn4DQ7ouL+dmm6u5cDSHs4YDZnvYVqqIl0R9GstAc4smnGaxYsR8QwaHfSZrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDPnBQ5WQExdmdTq2J+jt8c83OWFnlkbUSI3uxGQlRI=;
 b=hAAXfIWH3PMoljOa5RffWnP05U+m1WrNEPX0Z+8SRJjBNSfZwJGVsg5s0R3tTKWYQ003BiUmisRTV89hzAlkM2Cbfw2YxAq7jSUyHQXFKJrq5LFgeNXesBL4GsQAOGLKYi7chaTC6v6hWPqEa5KgvH4BKIilqdWCOoRA95bqQmE=
Received: from DU7PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::17) by AS8PR08MB5880.eurprd08.prod.outlook.com
 (2603:10a6:20b:29f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:58:07 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::c2) by DU7PR01CA0048.outlook.office365.com
 (2603:10a6:10:50e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 08:58:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 08:58:07 +0000
Received: from AZ-NEU-EXJ01.Arm.com (10.240.25.132) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 08:57:57 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EXJ01.Arm.com
 (10.240.25.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 08:57:56 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 08:57:55 +0000
Date: Tue, 3 Sep 2024 09:57:54 +0100
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
Subject: Re: [PATCH v12 4/39] mman: Add map_shadow_stack() flags
Message-ID: <ZtbPksgBZiXd0iHc@arm.com>
References: <20240829-arm64-gcs-v12-4-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-4-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AS8PR08MB5880:EE_|AM4PEPF00027A65:EE_|AM9PR08MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4cee21-9df7-4617-fc5b-08dccbf68fcc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?AhWSXm2VMT89PlasFXxfEkqWzcQVzNPzU6TuGUi6CoQeWUavy2igqIikgJhr?=
 =?us-ascii?Q?u5RFOsRYe5Kfd0HDw4Xv8b9LDTPKwHvA2R+mN2PpGlr3/0WAndxDhpK6hAIa?=
 =?us-ascii?Q?Iy740HbcrQX/uMuTpr8azefe3a1n8xDcS2PMgACMpeHFOUC3Kn7l4cUM8Knv?=
 =?us-ascii?Q?M4U6rkA6QRC0XKGFAp16K3QlgSxhIea5qPjGn9lajbmzX/HHYxa7v5aHK6BM?=
 =?us-ascii?Q?m7fni/lnxBYNHSclK7B6OyjogexUv5itFyT14mobSgjEhoe3T8vKDbwT47nY?=
 =?us-ascii?Q?0xlRp1Q8oNOuXjY9RnWI25A8aEj3pa5obQ7QlykztHljtDDRIX0Mv4GNNRmd?=
 =?us-ascii?Q?Nt1o5NI2QkVD1EmhssSPjfGRzQN1CW80DQR/8WGpbDgHh2P4GoYJocD1MKEq?=
 =?us-ascii?Q?oyyRjjQm2zc7pksBQnenQeF14v4Ot//DmVIO813GuO8hlRUsYbIihPg6neXM?=
 =?us-ascii?Q?jQaPot+GxO2Ou07OuPaBNGGv9sud3c6h4uzgNEaXCksbk51+DXFytMYT2mGk?=
 =?us-ascii?Q?KHSQ1dBrIGuq0Ws2XkMLXIeRq9oMJgYilrkMu0HW4bbZjCMAuJS69veqwChX?=
 =?us-ascii?Q?nP7apqSyvcLj9dexjAllHmIP8EFpr3RBlcqPQjUnv+WIIAavSEU3TKO+1Fgq?=
 =?us-ascii?Q?UiZoIh4Hn775+0UiB6Oto2JiE/LDaujjXSGRWW0m21sKLtULCvsX/8YlXhQq?=
 =?us-ascii?Q?QaKGKLv13G5lw6Gf6jPo9oZPW1cdsdVY8kDERk9BT4k7tWXqUjadgyLJeDHr?=
 =?us-ascii?Q?nsbu6mCI2026oEhDCzaSzJ5MITEOHQEwl20A0y018zNXyiW1j48kvi/S+Q84?=
 =?us-ascii?Q?QreapbT9hJf8ZfR0eqgJch9ECfvt6+uzW9XwgcCJApqxNOJjEynUDftCiv6N?=
 =?us-ascii?Q?Ue2JZEhZ1uJZK+Mfjq+/iJGdOsLSEocSiNUEV7aKrR5Hxer8TmAF68i9NwpZ?=
 =?us-ascii?Q?/7btE0mJyxxeLllVRcz9cPLLB+wsRSsDz2HQLEEDFvL9cjGXMJEUQgN5msSS?=
 =?us-ascii?Q?A0C3wgUO8iCGeWm1c2Cv4KhNqIolaFqJoopISPlGpipo5iu2Fr/JWu5B64Ci?=
 =?us-ascii?Q?GuCOsAbdXB5wlvStLjK8vSpQh9W/VVTME7sSqdzefTT26g4Z9DTsIRtRyKQT?=
 =?us-ascii?Q?UH4PswSHTH33HWq8tTRn7mmK7E5COlHX6MU9PpUlTCuUZ/1NdgrqRVCTostw?=
 =?us-ascii?Q?JHLdZ5AJtXQ4nNyWN7pKxafO0EfrKtMYmeTdj0XjfPz/kVVYdzwDZqjqGGxc?=
 =?us-ascii?Q?vAygHNqERUQ4L/DhzKsVjepALyJkUya0lcbHnC9sjh8YMl+3nt/nfEMTD7Eq?=
 =?us-ascii?Q?HTeLAo9LYmZmdt+H5tALWRemuus5CXwSZmSmHtMJE0YZHBCLZNH6YieVccvT?=
 =?us-ascii?Q?93jNaLD2SUjLJhhDp6Ruv41EA50vxlHSg/RB0VBZfn8AmSeET9SjrhSOzkr9?=
 =?us-ascii?Q?rCcv/HRg4+17Qiv0oijVLMGKaJe4YbrJ?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5880
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:50e::17];domain=DU7PR01CA0048.eurprd01.prod.exchangelabs.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 56e0afe5-b2d1-4cb1-dd43-08dccbf68783
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hL6lTjatQqiOB10A/c5S9hXGnFulUgZ1lHXxCFSPCocb+QPqkHSOequhWbMq?=
 =?us-ascii?Q?rxbNoCRJOm4vA8P6UsaXZAAHeWquVlUm27VzdQzHK6JFAIchPsHGsBIQLkMl?=
 =?us-ascii?Q?zMU0k+V0PJ7YIZyBrwZEbk0fP0JkfzdKOGrswiKRxlFTKkAhKpsnCbKXcKyw?=
 =?us-ascii?Q?dkay+IhRfoA019ramsqFuhEuSdi50TfUWukObtKLOlJ98Cio+tcubn7q0/kT?=
 =?us-ascii?Q?ZNykmyTAU5P8RKG5QW4kJsmWsy2GPtJftlup55wlCoIxouCxqLWRqSOSs/dc?=
 =?us-ascii?Q?arUgYgcmZACVzwzRnc0GdJMHhbYAXcxZDUx6lyEImEZLhPCnQkgGsk525Ay8?=
 =?us-ascii?Q?BCbsbm2hB1HZoXbiYNzCIhQN3ka9AqqreUJz0XUYuARgyWbEP0E9Fba7lJ+S?=
 =?us-ascii?Q?AU2OPJN8SvRIE34HkYRF+nqDF2w4nK8N0jB3fTPabC1CFcrQjtPZSCYWQzZk?=
 =?us-ascii?Q?I9AEV9meN2SZtwzYQLTUj58UOJdsviqH521gYOGdEK1EWMIk1UmYK1o/XlJH?=
 =?us-ascii?Q?7+ktD2fVNjdIJROX1FULIsLfS97v+6jLiaJpBhSddYhAT4oIm07kK8v3mDw4?=
 =?us-ascii?Q?KtccNFuXDvz8SczMbv9SgOEEvAebdRQ9jihtTs2jMy5ISDT9+D4Ut2/8/TtO?=
 =?us-ascii?Q?xbKArY6hRAqaBf96ociA+YEscqH7wF7EoKEiTynUHGfkNAf6xbTWZT4ENCVJ?=
 =?us-ascii?Q?nYP5+bqbwjHYb9d9VCSQHH7DE35KERHmtncjqdi0C0dprZBH46G+e/tJYGXD?=
 =?us-ascii?Q?MbBAmKrW/7axrl9uFsw40czpbIf76/XPIxoxPqI0Uj3kr4X+rA0ebu+23wwo?=
 =?us-ascii?Q?hDiGVMceomztXoM6dOhRHYiQVH237NHYILwkxWswH7TcYZbiF0Gu5BSEDpIh?=
 =?us-ascii?Q?fdhidTpT7F/IzzBMAqa0CsyDsUgO5dfbilGY1KoEya5qFUWxp2dLxT+98P9z?=
 =?us-ascii?Q?JsMiqoDjIVkVRtBcjcbZ9X9vBBtu9O1sg4wVOc7aDtEE1VCUFKd426PwIjMo?=
 =?us-ascii?Q?+pYyKqHSoBz3gK56jmRisRYHBA9IZruaUIBIFzRSEVKLbWJqteTZUZJjq9XA?=
 =?us-ascii?Q?YL534P4MekrKC2BWExI7U74DsayLdNWFE290CSQkW2oGeA6DTuJWDjBz+YAY?=
 =?us-ascii?Q?j2OcglB5BQytIfcqKe6hrOBMisITRWaSM17zM4Ed8/KZzsXu9EzcJAlKXJIO?=
 =?us-ascii?Q?cdQm8TcGHLnE7+RQIc9g9f6afCl9yAZIfGpukZDHuxgyvXjmPpcc57NKmxoV?=
 =?us-ascii?Q?dffvY0/xaduau3LXxEw7Q5Te5lHBZXZVut5cUyivkO2ttti4It/sQXkiLolO?=
 =?us-ascii?Q?DVZw/0iaySTJXNw6vi59xVm73HfLDoIUY1EmxLDv+kCIvdATr6WolfjZbX6/?=
 =?us-ascii?Q?PnH6AgYzQTZX718Dy0YBnAR6UCnnmQ6jotD3WkAMyj6jMQ5z2OEAX/bQu/fd?=
 =?us-ascii?Q?nMCOT1T4O245mLn7JZgMTCF1ztgiXD5Y?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:58:21.3799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4cee21-9df7-4617-fc5b-08dccbf68fcc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_015830_510253_74DC7CFC 
X-CRM114-Status: GOOD (  10.49  )
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

On Thu, Aug 29, 2024 at 12:27:20AM +0100, Mark Brown wrote:
> In preparation for adding arm64 GCS support make the map_shadow_stack()
> SHADOW_STACK_SET_TOKEN flag generic and add _SET_MARKER. The existing
> flag indicates that a token usable for stack switch should be added to
> the top of the newly mapped GCS region while the new flag indicates that
> a top of stack marker suitable for use by unwinders should be added
> above that.
> 
> For arm64 the top of stack marker is all bits 0.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
