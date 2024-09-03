Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB703CD3420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 09:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaDxSscm2wPWYJ4EDU67+myBPWs0i/OsYMNFkksTJJ8=; b=XP1Imrs2jO8QFH
	JNMIun3OAiVWvSwHOUYRj+Ki/GJOmsZ9UiDKJr9cqxWED00YtSlrAnGfNkRDOjdmBH5OKXaT4nmoe
	PB4IAfeg6bV5gCvjf//7BAcZuBIAEP2Q/TZLGy3ciStP8LMw7ZfLO9wVrAmo9nUirrcOZ36HWkIv7
	e++3aY+ZcfxyTnTHhdSs+7PLYuN3oYzGkD1eNdIYnCT5t75JWzWDYsqOXK/TRi3m4o5ol4PidLGSj
	jZJmtat77yzMjjwXJKu5hZKZX3raUBsFxe0xg/Zumh3oPtIpMiuoSwxetI/OoZ1on8grsq3QxQ14q
	LwC4Ia4yW98WB8xBNsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPUB-0000000H3Zs-0IEM;
	Tue, 03 Sep 2024 09:06:03 +0000
Received: from mail-vi1eur03on20604.outbound.protection.outlook.com ([2a01:111:f403:260c::604] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPU7-0000000H3X9-2Zdu;
	Tue, 03 Sep 2024 09:06:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dmZdeVpYWsR0921x0xzoE1TdLg2zxHErhy8x8GVWwfzd4Ev2r0pVUrxqGQ1u9vb0KmaxtX6mwadaS+wnD5/RXP5xeupBNOMvB7RDmdknkfS4q32d7wgr01o9MN+RwIfu94HicYusdupG1dStRIRDJRV3JHcpQHP9/sTSwzz+IYs9Q62dC05nUQaO1a9EzrdqKpGE2FCg4A1oY3PgME0LDszuxr9fMISY9kZINUSr3om2gmj1EorZWEe3xhkXcn/jLnE1LlqK/uOzuvWKLMPFEOxkHn2Qbp8dY+OrgaNSPB2hTnym8W9JxP8nQJEo5dO9t9k1xSrEPqAdqcAoS/5pkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sfRshfcYXYAqALdhl/s+8f2cqC2vS3QZ2MqRw6p6SE=;
 b=ZNt1Pcm5NnnAOunJMXVRKNQHy1L7wFvFKRC/BVUHrB3CSTUHqelFQ0G4NmlWNCs3VDKVh8I3Dd904QtlUulX6aH+6XpVQDj+3EjO8fK+9WMUAabbsffuaq/xGdLVgThtY3j9YHD0i8nUrmfYA6LzR7AJymjxiroBQ4CVj6kiIbOghNUcSwhUQkrWdFuDAyaI0b19onYGRH7czra2bDMvbJYq3o3vLwkdlgJMXCcMgvTazDY0WYmZfzoAqxgl/oiXMzkLVfxbcjVe3BNh6QKkFCeuuth1gk3hdC9yvFmdDjsY4DQLZy8ZquJ3m7YrJAKzEQAvNhbHeoY+//tVcEsfzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sfRshfcYXYAqALdhl/s+8f2cqC2vS3QZ2MqRw6p6SE=;
 b=HQLJyB0fckVMsjQg1zqTfAoJK3PvFxhvOjbayrQkOdO8ssN2+A4iVQbLAVWzF1ErbiIhD9LwOZgEkzp5rs81jgsHS3kRo0LAuGH7Vs6JD1LqdKRtjDxYH4I2Cu1zfSPGXBuOw8DHU/+Sgc44iJRV4pK9fa96+vlJZHoDvVU441s=
Received: from AS9PR05CA0241.eurprd05.prod.outlook.com (2603:10a6:20b:493::6)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 09:05:48 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:493:cafe::99) by AS9PR05CA0241.outlook.office365.com
 (2603:10a6:20b:493::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 09:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 3 Sep 2024 09:05:47 +0000
Received: ("Tessian outbound 7d86ec5dfeb5:v403"); Tue, 03 Sep 2024 09:05:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3126d8f3a8f366f
X-CR-MTA-TID: 64aa7808
Received: from L93db8b2c1ed3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 50EED0E7-7C43-4A18-9B17-7DBDEBE09C67.1;
	Tue, 03 Sep 2024 09:05:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L93db8b2c1ed3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 09:05:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpGcUjw9vLVsJx1PxHmpykK8QIy7Iix+969W/ElQaOUz8iglvneeqIyhuY7xO/1LZtsZNFQSefq3Au46Saf49fNqvVOayoTlOnLTaVxukH+FMTizd4AZ2ZldTN1WlSe6Yc+XJB9GwU9Bd1eGa3dNFYKP62p7GpN0ZXahZX3uGO6/Ji9jXs+Wifmj+z4qE8tkK0+0eImQghzYCsXoee0DEuixedeZN3tsZQKu7yy4++ZkhaA744RlpTH8xuJEBk7IAlIvh3THamfRVk61Ki+obFPA1KlsE0E8dulv2GJilQbjIfO40grrTNP1HzSs3B3fKwJx0stQ0EzOZQJ8pklPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sfRshfcYXYAqALdhl/s+8f2cqC2vS3QZ2MqRw6p6SE=;
 b=b7F1sz8g3hHRitB7xh2XzmNythywZFDnvPZlvNxkQkbv1Vwdc6MN54lQ/RXP4UgCp9D8d6jDel4jYWmADTSdPRGJT0Pnc2K82MrWNsQA/Ve8YnGHKeSN/TNvoTfX/7qwHNGpW2IQyPNbh8EbfA51tzMqmtQBEnbBQDwkOXqHzd77tvvXNFHZacaiwUqcnsd4KNoAch2WJPKoQ5l3uLXx/1gZBHuybmmtxR3WDh+kVEdVtw6tNFTj7rqOwCms4RzzpB94cyppnqYHDpwvbq+VCiNPBg47+8Z+mcpD8rzlECk0gKBNqNdkLXA/tlP3kw5AKFrY8S4HtiUEZJPPnVrfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sfRshfcYXYAqALdhl/s+8f2cqC2vS3QZ2MqRw6p6SE=;
 b=HQLJyB0fckVMsjQg1zqTfAoJK3PvFxhvOjbayrQkOdO8ssN2+A4iVQbLAVWzF1ErbiIhD9LwOZgEkzp5rs81jgsHS3kRo0LAuGH7Vs6JD1LqdKRtjDxYH4I2Cu1zfSPGXBuOw8DHU/+Sgc44iJRV4pK9fa96+vlJZHoDvVU441s=
Received: from DU7PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::15) by AM8PR08MB5715.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Tue, 3 Sep
 2024 09:05:33 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::e0) by DU7PR01CA0012.outlook.office365.com
 (2603:10a6:10:50f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 09:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 09:05:33 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 09:05:08 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 09:05:07 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 09:05:06 +0000
Date: Tue, 3 Sep 2024 10:05:05 +0100
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
Subject: Re: [PATCH v12 23/39] arm64/mm: Implement map_shadow_stack()
Message-ID: <ZtbRQYiGCZuhQcmX@arm.com>
References: <20240829-arm64-gcs-v12-23-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-23-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|AM8PR08MB5715:EE_|AM1PEPF000252DC:EE_|AM7PR08MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: 1061f0e5-1278-4615-4ea2-08dccbf799ff
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?EUH5bqCUfaSNiOsSOX/ZyB/ApFB05j7+3+tyQGeXuDTyfJKvF5dFb+2nP/K9?=
 =?us-ascii?Q?FGdRA88HFm0mOL3UvbgP/9KD3UlDZGUv28Gq6bwhA1XmfD6kOSkCiWFSvFzR?=
 =?us-ascii?Q?jbmJvbUzxOdt29NQM7ANiHF/K8Zh+2J5oAtHzaBG2rOPh1doaxljapVPDIWz?=
 =?us-ascii?Q?qWPjK28s8nvjZx8zB205PzxabwvXt7tbNEedUeElVoEyXV2/wJkDq2F7sVZu?=
 =?us-ascii?Q?fOQM77iuzkqFQWkXwcBYI8WI34ThFhE/1LbKkBsYGGIWbYAJ/Rw9u8m0X2Fl?=
 =?us-ascii?Q?x1TuTOFOfmXC/lTxi/ihLy5vn/7GkacV6Zvx5IrJ22rvgtB5yKNniqRW2ZBO?=
 =?us-ascii?Q?kR3WdiP3nfqQmgDyYSC8I3eqI0aAh+WkqiiKSqGELP+jfMLVmUA3ubuuE8f9?=
 =?us-ascii?Q?5zhBCRL7OkHftumxEVF49sUHhpGgqcF4YZWxOK8FgdwXZx6GJ4WLoMneHqv2?=
 =?us-ascii?Q?w9TX0kwh8BCCIXxC6lv80quNVPe2TPJv3yjf0P0dpdCwJELC9JlRE0YUDx5a?=
 =?us-ascii?Q?MEtZidvYHvgYx3h/qxAtQGblwbvyynkYdsPG1T3FM25qWSo3MudMD6ebjBS3?=
 =?us-ascii?Q?FUiOTqxWkkPubgIH48nCkVyXyp3FpBxt3PPGfHgssJmgxwVL3/x37MfA/SBG?=
 =?us-ascii?Q?fPE8XJShwEFwLiDnWxpZ6vnsg2bo8Hvvg5INJdaRksNFufgW8+ykKsiw1Baf?=
 =?us-ascii?Q?OFn2uXkAogdIrpYzivNnb1B7grf+q2VrrttVZHAt/vcEmGWSvv/xlWXFA/b3?=
 =?us-ascii?Q?oG1Cko91RuiAOGuzxMBLdzBTGSFWe7eukXrWnZWjeailcSzax6CY/2rPZB7Y?=
 =?us-ascii?Q?idrs89+F7DKEqhwta8DolgQpkNFZYHmkYTE7rzOaCVAniiis+CcQdJmPx1CO?=
 =?us-ascii?Q?OfTRMIM7hvkXBIrxddfGGKG3JNI9i5XzMcyKEiBbmJ9JLbHTdiAzoKP0HISD?=
 =?us-ascii?Q?lrXqwdS72ibyeTDEcIlS/LRiRhjnIZjtQOo+mmOic6C/8kCZEfJRkJWUfWsa?=
 =?us-ascii?Q?yPopCqLKTZnNhzuLIEFiAz3wU0nFWE2PPdd/3HS5716lBDOY9hKQX1iVLNfA?=
 =?us-ascii?Q?LHb1roUjgJV2sPGm1D8/l0uk0dyVWQbM1Ju55Tbb3MlcbLM53XpyhJh3wxfM?=
 =?us-ascii?Q?T6/FutITXtckuibP7lauUty179r+zCs7Yrdcj0kpR95ZZGbDJIuxXO2N9xa/?=
 =?us-ascii?Q?oErbUtZrC/mACoyX9wZ/+zWyvVze1fmqNx1CAPhEKwwXvxcXPP6cMS38wl7r?=
 =?us-ascii?Q?kvig+n9gGTrg5v1iTbaJ0bomkuu7FVdNabyvpC6j215hQK3zON0EgTC1mozB?=
 =?us-ascii?Q?annPdDtJRRybq/CW6h568+gSLWVL0EBJQ1FiN6b1ioxzPgNh5Udg6bbJ7v8G?=
 =?us-ascii?Q?zNQIF2SwOxsk+6rLAdUxTKdQW6qNtarTmAFNL6vRI8t5r3kEDNIHFOCak9Bj?=
 =?us-ascii?Q?RJV0fDt5E0OU77u1SUvrU06g6yS85bKG?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5715
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:50f::15];domain=DU7PR01CA0012.eurprd01.prod.exchangelabs.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bb5bcc78-003b-42af-fb29-08dccbf79163
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|35042699022|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VI+GZe8iRNG9sI8AabaqMsa+u4CCkLxB4A2xZ+FDPt9EJqS3+I2oNurjdr/l?=
 =?us-ascii?Q?iRu2PFX4tvcRRFcLtPi34yUfX6TnOgRHzs8u1XUDGweE3othvTC4kp1ht+d2?=
 =?us-ascii?Q?hjZl0p+oNwkBJSldbhLEz2eo+5KvbB1eVQ0JIPJEO8s3RfC+cggv8p6J5teB?=
 =?us-ascii?Q?B0209BNmnft4SajNeXWM0FiQMcfADplyK9OdRB5jre9PPmB0fgOMH4jwftCH?=
 =?us-ascii?Q?ZJka5aIF+zU2SFpvrSGLyOLhIlCWH+1oPPhTN9hkkczOxvHlmGw4M+P2f28D?=
 =?us-ascii?Q?kDhWPW5X2KwQyq8UXUWGb1zved4l9v+CMNg14QG9Lgl4x6kgOdS6J6deJpng?=
 =?us-ascii?Q?0ljCacvIR0TDn4Xg9SBNSrhZLZ8aR3ZgQEpZBzcBcJiL5VCzZ/nmZy1WCKd4?=
 =?us-ascii?Q?cePDMv69l3GHBvtGIZfkulG+gkhT7lgE524gWkF+tygwvbJdBv0FU+09E2J1?=
 =?us-ascii?Q?DFvJVbtuGr91IyugqdaD2YzobGZ2S9fVbECqlqHfYPqi0fwjqpQbepgoBsSv?=
 =?us-ascii?Q?IcbPXGzCiSqvFPGMTz+0SN2Ujdm9aQ2fgJSbEkQNWghw/mSnWAIYp+woS1Qv?=
 =?us-ascii?Q?/HtU923R/r88F67Sd2vN/GYBAdfsAGpw2eyAcC+saDDl2JMbLRaHFw36BVSP?=
 =?us-ascii?Q?a7tNJAQzfQU2HMd9aNqdGroEx1TD4tAnGiSaujXRDSWdVQcDI4Z2xfIrHjs6?=
 =?us-ascii?Q?a+riydIeMWgiebOfwEGN015qN00wauqgfml6vCvQFiOFypzXtIqsUlEln8iC?=
 =?us-ascii?Q?Ji5R0lwY7PIRD4EeX67Yc3To2++K1dFOgZH7PJ1KTxHkpP0wK4TvAbtWyG5G?=
 =?us-ascii?Q?8GmcFO4cg77jjkhSdzWUypC/v+s6Lhv9Lhtw2IHTqxTphYLYh9TpMfL6dSXG?=
 =?us-ascii?Q?bU3tvRgvN8MGXCIRDLHq++uz9RIKze1wE0jQ0kcuSTBxG2mLRW4OhlNhuU3W?=
 =?us-ascii?Q?9bXPKR+oOBpIA5DGzfszokCr6oLrGCzzG8++Z+gTGSoffnMdP6xxVN2MQDBR?=
 =?us-ascii?Q?3Tpz7NxJKPEAdQMwovWtQPv8fTlvym7Jt98AqnaniHd6ltK6vDUugjdDNMPQ?=
 =?us-ascii?Q?wmcJ/ldN3a78X8ag2okn3s29wrx6J3SDyLppd0yhM+oTSFyeHYw0ZMrlX4QP?=
 =?us-ascii?Q?28d18CvRqJNW+huILpGgr51QGnQm/KwbGFX4jDo0bN3zutfgrwUmKMNx5jf8?=
 =?us-ascii?Q?kidVQHVefTNQYJGeT+6XOs8WUZb+QnJcJIiWeIO0kCETyZtet6KUm7Uow75A?=
 =?us-ascii?Q?PaMxwwSYIX5EdtC3/7VGpYZZGosqK+qrR3G0Bc4+aZ/aHmHQ6Jm9MLHmdduZ?=
 =?us-ascii?Q?zUHajqfr0GpO9qsVvxdOUl0tR6aMZ9fNuz/52ekuo50b5J4o49Od4FpSCpSJ?=
 =?us-ascii?Q?NxEOXff8GJ9R4hesYKL/imKJTN8EbJRXYM+ZAy5hicJtGSowZKGNVCfzco6o?=
 =?us-ascii?Q?3asVEr6G5+ZBC8KcSpYfDnMvU0DL2il5?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 09:05:47.9993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1061f0e5-1278-4615-4ea2-08dccbf799ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_020559_846354_5C572FC0 
X-CRM114-Status: GOOD (  10.58  )
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

On Thu, Aug 29, 2024 at 12:27:39AM +0100, Mark Brown wrote:
> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto the
> security requirements for guarded control stacks since they lead to
> windows where memory is allocated but not yet protected or stacks which
> are not properly and safely initialised. Instead a new syscall
> map_shadow_stack() has been defined which allocates and initialises a
> shadow stack page.
> 
> Implement this for arm64.  Two flags are provided, allowing applications
> to request that the stack be initialised with a valid cap token at the
> top of the stack and optionally also an end of stack marker above that.
> We support requesting an end of stack marker alone but since this is a
> NULL pointer it is indistinguishable from not initialising anything by
> itself.
> 
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
