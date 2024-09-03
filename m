Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F110ECD3420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuqPLr5+99WzsRRscIx0StebuWlBqTtN4c6YotPOjzk=; b=M/TwkTEZmDZ92K
	jxz+ByDmCrEuBDqdoMHefLeN4XppGJAIdKF6OiPpWblVer5ULKUN/88ypam1hD/YO5829ZY0cIyDL
	t2Y6qkpFTEirN7L03wyTqDaYwVQj8eyovSDwHe7geZHstBdn2lS+Vly7O+aAoZbVligKJn8SvjnHX
	I1mzDFvL8W7HZ0XNli1k3l/4aBh0xHMrNKjNwe7yILvuFCo7P+3geYzGpdNrbkxuaF0GOOAtcBaTd
	5FrBdPTI/MSsTjPfMBfXjDjInazRIdxxpI3owIcCbzfH3jwf87oupIYkzPn9kqWYZ7ga03bJh1It0
	/NNeIp9zoVmM+ICmz3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slSRb-000000006PQ-1p5R;
	Tue, 03 Sep 2024 12:15:35 +0000
Received: from mail-am6eur05on20623.outbound.protection.outlook.com ([2a01:111:f403:2612::623] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slSQ8-000000005oz-3VXX;
	Tue, 03 Sep 2024 12:14:06 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OwNrlJR1G1tmu9NJa1S6xQvknlYHHKIVkBSIAo7JHL5c+Q90oI6wVWcCJ51P1R25vMG2QPZXL2UX9P7HWTXfSJGhn7ORLWmrm2KiD/EVi67mHoKwtr1WT9L4pq6kLlFXvLYV+YYfudUvMf35AEbvUyGWFsN3rqE8R4jZKeb34JmYVWia0CxRrTpaSGojkeO3mPzVqEBB5NYve6LloqpIsREjzZt+BvnVIg5oqWqU+McTKSCNlhHsZXT/e9cMkJbK9t6mnytInkETZBctLApep7UA6v+p+3k1/xpOnE6nC+OFnFNV2yT2g85/An7eeQ4yUw0lDPTqqpp3UvbbDPEs5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epg425TY8ThFknnTJUOScLPyiBCiIk1XoF0wKby/ko0=;
 b=u7huNHwI9uXFmE31GLfjLeiEvgUOpDu4qjJ1soy85mgC9rEJUBz6s9LKNxjMQajVojl4wLxnJMKIEp0cj70YWNVQnNzh3zO2Ksr5+li6pa+11ugOWbF2kL4NioRvA4zzkXHlhRgiYI7Igh47kIwG3dNkpI+axRNyBCpycMVAFQiwtwvIc/+Ko+sjMHZwltcj9LssN4QQLOnIEPHA1WWOblFT330tZP6tb9L8JJBFL1wNy1BRtUUYJbppbvISoGcTZEW2qC4adPTbb4wKO5hSHo++HkMQOiTKfQeI9iQjw4UgIhoZqHzDvs19Z9fo4P4g4IXUca7vpLh3PXehGYJBjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epg425TY8ThFknnTJUOScLPyiBCiIk1XoF0wKby/ko0=;
 b=EQ9hKuhpzcbseLYr8bvf8Hke0QJjP0BYTRxgsxHKbhuKzZ1pSf2D8UpdwXcH3SXf2D39YQe8O5bvV6U04d06aw/mzpTlF15SxYglCgKSV1koI69Ydsax1X2BFn0GAvVgwpiK1h4c57Gv2WZy6z4fVMnMr93kM9iLqlgTcWY3l/o=
Received: from PR0P264CA0134.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::26)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 12:13:50 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:100:1a:cafe::ad) by PR0P264CA0134.outlook.office365.com
 (2603:10a6:100:1a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 12:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7962.2 via
 Frontend Transport; Tue, 3 Sep 2024 12:13:49 +0000
Received: ("Tessian outbound 97d928cc87dc:v403"); Tue, 03 Sep 2024 12:13:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28daf87b48a464b2
X-CR-MTA-TID: 64aa7808
Received: from L0abff40add27.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C8D8A4E4-9BE0-4964-8CB7-890C598D964E.1;
	Tue, 03 Sep 2024 12:13:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0abff40add27.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 12:13:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlpnaYD15kk8GyPjtmcvrvzHgp09h/EVNpdasxvUhKAO8nbOy0u9H8MLCDf6ZU0f+yRcTF7Y8eDsBedXdjJN5B1b+8ie+njcYRU2QpiEDPrAhVwNXNHbqmW1tOJXsT1JOLzuoxTbCuvqvkHCVh9cFhwCbdJFiJo7BHy+Q0Y5X0Z98usNbDOn+o24J+7h7ECXIeeM8dIJkqO63OdH8oFW2SK7/u5zmP3bznBZ1NQZQpXEIZ/09sxN0ESEymc5oMX8hKFf4IHa92cJ/zxpdlpCjFQip5Lv9a/oIrLydjly65PSBDB3jSe8RVbc3cI76GiWad+ORxEDdRUGcWSdlRh4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epg425TY8ThFknnTJUOScLPyiBCiIk1XoF0wKby/ko0=;
 b=Nx8+D42Iw+TKTLNTgGU8ixyFlJnSydM8v/bG+x8WYFK0cqsbAQwUs0pZ/0i3fvLYw+qlK+mJ35efTWL9PqbENqpxSUMQ9LvoOuUSJ2AqhQMxhIzIl8IV91nxKhF2Rqu3bFb1ZfOKcMfEfGEEl55UClcljOGSYr4oOhHtNMoEJCEL14houej2h0SAGzzESQVw/KkB0aW7muv7x5G7JoupYjC+1taQCnP4S3npoLkfVV6HddT9mnFj4lzyzcf3Gj4r+D8HEy4ykUZKmYMqllbwvfO98MKIoNrEBjAOeNjEn+tc4HfYE9UOHgyZ6cBqCNkMVcnzWaicpAPFq+uPkOBU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epg425TY8ThFknnTJUOScLPyiBCiIk1XoF0wKby/ko0=;
 b=EQ9hKuhpzcbseLYr8bvf8Hke0QJjP0BYTRxgsxHKbhuKzZ1pSf2D8UpdwXcH3SXf2D39YQe8O5bvV6U04d06aw/mzpTlF15SxYglCgKSV1koI69Ydsax1X2BFn0GAvVgwpiK1h4c57Gv2WZy6z4fVMnMr93kM9iLqlgTcWY3l/o=
Received: from DUZPR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::18) by GVXPR08MB7678.eurprd08.prod.outlook.com
 (2603:10a6:150:3e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 12:13:32 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::96) by DUZPR01CA0029.outlook.office365.com
 (2603:10a6:10:46b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 12:13:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:13:30 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 12:13:30 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 12:13:29 +0000
Date: Tue, 3 Sep 2024 13:13:28 +0100
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
Subject: Re: [PATCH v12 25/39] arm64/signal: Expose GCS state in signal frames
Message-ID: <Ztb9aNvPZQsRPdB7@arm.com>
References: <20240829-arm64-gcs-v12-25-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-25-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|GVXPR08MB7678:EE_|AM4PEPF00025F97:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: 3907d1f7-6938-430f-3564-08dccc11de5b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?DZOqgoROdYpgohQ8x5V79Yx9Hbh/tdqVp2CanyPkjyfnqxjP4sr7Ww2TCcZM?=
 =?us-ascii?Q?/XQX43tCZYAfg0r+y/DdrqnXd8w4qAzvsp+DObw246XsBR6l1g+rNzmfnDKM?=
 =?us-ascii?Q?7eGI4ExOpzYuza1mL8cuk1g1EP/bwNqo+ZUdiR+A9o9faJSVcKWls1b3cZIf?=
 =?us-ascii?Q?/8/g0jzY1iyYSvrpzEULdgzbmiGruyNUhaxbgiZPr70Db/JYG7QmLxbuZH9y?=
 =?us-ascii?Q?Zc1qLikuCGCCjry2t5r0GF9+BdKyZJDUCwEQKPMMoxohiBHaYY9zGNwbai2a?=
 =?us-ascii?Q?Zt1iBXxU+Jo7VMJortGLkQcBzzxAoO+OEfF8c83mj8aJdIo9qfoYkDUI3jQO?=
 =?us-ascii?Q?riF0qdDx2yXSiK9/kc0TklwYbS5ZNUEhc/OCIyj3bIJ6JaG1tTU03WqK/g+L?=
 =?us-ascii?Q?lLCvc7bn7GKN+/tnCrOecV38aSaAJggjH65yqQos0/ZBoQWjytBVsVmev3uq?=
 =?us-ascii?Q?JDJ1krF3lsQrKSIoTpbAg7VQlhbOgGVtol8FHuimQDF/1ViXMTfzMAfD+ReZ?=
 =?us-ascii?Q?h8fl8OO8XCJx/69TeQp+hctK+0N6wVWueeZ4LE12UHfrAGoa2yfIiYXtLZnl?=
 =?us-ascii?Q?RQVJbwbhpmfBCluPuSYuK61ffDVXyBvRTunw+wl7BYiXLQS2yD+HpIMTuG8k?=
 =?us-ascii?Q?UJqLloRZuvCJAFLsVtwsh+LHcHJdmhPU8GLFjy/Hs7as6JUgnw7oNeFTN2/E?=
 =?us-ascii?Q?FwshQieBP/h0YFSvH4FTCPuC/y9ajhPIS/Ly/CSfP19f/xl41rznt4joVwbs?=
 =?us-ascii?Q?8kgR09fB1oCRSsW0kOdM177km0EgBnkg6snecaKS7W93DiDebph3/B0X7eR/?=
 =?us-ascii?Q?n9vUSH2zy02gdavFIRzy4/lFDOeqL9VwQJsQnXdggxLWOsgDb8a/jipVoePq?=
 =?us-ascii?Q?fFMslkDfxMxH5fH7uNs7MtCJKpzQjx5e50do8BN7Y1L0sdNKVw8wSaA2Jkx5?=
 =?us-ascii?Q?kuBmSuEzMLmb6Plqk1gr0XQB4ECyXSovRwYD+SLl3o/cyLzlkvwKR9Rw9RXl?=
 =?us-ascii?Q?dA/3lHmRsFQ0VIvyDxv0Z6dKPaBn6qrbdgEr9eFIhDxUGwprCKZ62BsyNuYT?=
 =?us-ascii?Q?1WL6izNDSMCNYW1qyZGEN3PYeKOo+blS1PnL34+J3Bc48g3VE7YCZCrMTZxe?=
 =?us-ascii?Q?v8dFl3cx+nZhYbfG3mp6KNd9eAB1DT9MprQnZRR7OmH4pn+KJ5JIhb/vHenZ?=
 =?us-ascii?Q?y29sOeLBLcPVGqaPxTluGCoMQj+xDS4AluJBZMIESbjdiCMb2GU7ju+TCwpb?=
 =?us-ascii?Q?NAakLrLElV7Ixnj48EHAcowo6JNZI5HfKrfB1rppST/xV2MV0OT+dkGxqi67?=
 =?us-ascii?Q?AUH+wxSeG0dRP36jgXs5ZK366qiG2CLBsz+siYZXnSx37sWavYcTVm8RPThX?=
 =?us-ascii?Q?LHL4Z9Yw6HZsdWBXY2AnMbAg5uyJIqJk1SanoRxg17RcLtFYhp5Qk1qNZHD1?=
 =?us-ascii?Q?NS0k1hrkVoLXvdicOSbhYYh+fijyt7yb?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7678
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:46b::18];domain=DUZPR01CA0029.eurprd01.prod.exchangelabs.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3008b241-3267-4aef-bb3b-08dccc11d34b
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MdX7cQCmNerJ+3AoZiJEHnDi15sh6wGzqNKlZr3KnDbMuLNl7flkT/UgptNT?=
 =?us-ascii?Q?Bsd1jPm459wtj6QC/eZ43DhiFnCRepoyR3b1+NL49jy/X7USBGQxdJ0CQgZj?=
 =?us-ascii?Q?SxBI/+jNyu82f/lH5duPfOi8CyIfH8wJDVcZ7VlNwPpy84KOonsdRKYKFIZ6?=
 =?us-ascii?Q?lTTKX2ni9wifvc3mCzcrL76y7dLi4+No3blGTRns6g8p3Aa9WLT4oaerN/uc?=
 =?us-ascii?Q?2oGqNDYaRwcJAPbayxGcaneyC7mRJjeaI2tHDH8z2e+E6nJ3XoaxQf++C9US?=
 =?us-ascii?Q?/xnAs0xl8k3O+uJ427t9gu1eN17srQY4H6o2MfyirwY2D3QmMg+DW+rUZtKt?=
 =?us-ascii?Q?KBSvNHUAJISKRAtsKUXEBzfex2MSpF4PvWHZWHS04yeRr5ac3K4YZjCe7/1C?=
 =?us-ascii?Q?RmktWiyndIfXlv8MMuk+6mPdLD+Sg1u7VdCDzroBq/Eejusc0ZjT/qxkT83H?=
 =?us-ascii?Q?2j9WRHwHaENDZvUpC0AUyMoyzo5hrD5tio7UBCV/wu3RB+CRktfZtnvz0jTR?=
 =?us-ascii?Q?OLYZgQ4bOkB8tJibOJw2OjajBke15+T6AoLAjjGphfcVg8XJwfaDvZ50fpkG?=
 =?us-ascii?Q?1mEbY+HY59a5vikiDvcAs1z4KihOJ9A2YVjBqCPn3D+OIa96wWJMni7Fqzzf?=
 =?us-ascii?Q?R74Q7qjK2qoh6JazU4qAGxu2GoYCrg4TFP/7TvHCju/ysjwUELIXXa6/ngJE?=
 =?us-ascii?Q?uBtY3gGey1VMY04+9c5BHoe3AtAIum6r9In0ZuPW4ZN4Sl2pTG497gg5sVQk?=
 =?us-ascii?Q?ssFX4QLM5RvNjrOKZhFakck3OgyyVyzMStbqzkeoZVVXYUXShhVN0Ill5UtP?=
 =?us-ascii?Q?jzyrvL+kRvoKAU2kwMG6V4wUpJMZ2sPUAv9UO7LkJR3zZy+jMx07pfJSfPrD?=
 =?us-ascii?Q?WWZzgMEBERhX5pFeLLKbq3k0N1XQlJXf/zHHzR2cpnWtGov1CIbiOy7XdGMq?=
 =?us-ascii?Q?/rS+EU8gia/RPdvNhHK3dRRWQ2gePZdSHH0Mg60FAvsLYKfefEE0m6qOn0Is?=
 =?us-ascii?Q?DbvQNU1iTeqhWqxZ8YTk1Y4pmJIM4wB7fNeV3ClBGGnGuhjqOQI7BZFlZ8s5?=
 =?us-ascii?Q?CBEd6fDc/mNnqJTe7lOGCB2bGcMUXOuMDihDpadM0ywFdTbf6496lzAWxU/k?=
 =?us-ascii?Q?ymQrxxSJVQIisX8v7EftqB/uaFMhKVARuVw/mc7JW3csa/mSXvtYfqlqsqnN?=
 =?us-ascii?Q?WmyAxy3dkyyWovLUjrAbAuHk6QY+OORI/8pr5D+SBDTrZm7m0EfyRCKvujoL?=
 =?us-ascii?Q?Ays0KLHrJMp0pbDregOQWMsq613wLzoRWRPlLW2bL6voCI82fWKjMWiurXxk?=
 =?us-ascii?Q?CQowZ56igBRsj6ZaiyFgNOq9LDZt26/6uhpW1e96K1iw5wrDziDurgncDBSY?=
 =?us-ascii?Q?GOxBVDrsWEe2FGOS5fmEBwUOWaJ93Miaaf3B8a100sxkPCsvQVICkyu/7oLt?=
 =?us-ascii?Q?tzzPhnHS5DdxRrfPxkctTZ10MvUX7+LY?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:13:49.5860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3907d1f7-6938-430f-3564-08dccc11de5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_051405_058992_4244C957 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, Aug 29, 2024 at 12:27:41AM +0100, Mark Brown wrote:
> Add a context for the GCS state and include it in the signal context when
> running on a system that supports GCS. We reuse the same flags that the
> prctl() uses to specify which GCS features are enabled and also provide the
> current GCS pointer.
> 
> We do not support enabling GCS via signal return, there is a conflict
> between specifying GCSPR_EL0 and allocation of a new GCS and this is not
> an ancticipated use case.  We also enforce GCS configuration locking on
> signal return.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
