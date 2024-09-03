Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0192CD13CF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPKlhn9QNkxDyGnbhq2seFo+vpHS0ueEmgktsMYEKkg=; b=S3ZlUjMnjhfRaH
	/fAb7fmK5N0l7ocOdKsllUh6IMTV34eiGssTkT1zWpQwJyggaiy7WzMEtI1U/9/7mDlQRIP9mBASz
	Jvl22ETJ6F5Fyh5jqB800zsXe9L8xLws0BWN/sJ0+bYY1jsjRS3ga1nT7OhvtB9kFi6NUzJbbgzq8
	9W61FR5pqqoW5R2W12kKCOMl1FN7vSAqXapiatmQpNxUncz67GUTpgkuDULVlzWlUsBCPxwmEwyPz
	pa66IyGXUVN1DzOm9wiZ+wNhDI9VYZTbbRJTNH73xN7dtZU25+HngQEmaIHK3cqHNPms1FCu1qFOE
	yrDoXbHtTZ4r7s9q+utA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPTi-0000000H3OC-2d2P;
	Tue, 03 Sep 2024 09:05:34 +0000
Received: from mail-db5eur02on20631.outbound.protection.outlook.com ([2a01:111:f403:2608::631] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPSl-0000000H37j-1dkA;
	Tue, 03 Sep 2024 09:04:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X1ho1n1b295eiZV/P/GqtivVX2OLBYfkKhTbk179jwCnS5dCvMOptX7GdaOd1m+XuzD+82wFzs8SzJcAGv2dzt05y6bBPSwRffnO0tzh62EjJ+n6aG6loNjDgviO2i/ReUtssxGeUUfIMirc6GXb07/cR5lPtaFENL+VoCesAfbxdy3kHiaBtMjmWz2WFJ1cgDjPVDe9kX5ZhYbMYWX1tidshWw8j/wMtzWDdrDTTwU6J/7BZTadkG/yZYFNXipX1nA4E+d4LM6Rmhr5efcbliFt9XiQFRZvMOus1DFfqn3x/oqFt47/5p71O7RCUxz1+NWFkIW7+44NakVgW9cDbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5r9xHQHG+scXrr2lbtrROl2d6zj7h3adAv4PeUbXxA=;
 b=dqeHT87pifPymqSCsjTKsxHCw4q50zf7QeDxj3qmaZ+EVou7XKkpUUoFGCPTpfjU6GSVo7egAmnBzmabIr9qag3VeWgwx8XhFDTn4azete2PUWLREIF7ulOzRzJLLhLfS8BQ0Wv6GE+otwO4ZNQe4xVxM9AHJucX1gOUdhNK1ZP+QalvVCd0qHYQLwZosSdfElOGz5Pnid13qkeXWh4vBrPhPycqGDBFlayOZcUa2qalE0sRvsiY7KgpdgaFEB6oJbYVI3DsjTCmyBztKz0BGF4xwVO7KYh1ARkC6bDkC0CjxrxxR5hMz04hiYHF2JwDGi6mQPwaHLvRkckh0lKAMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5r9xHQHG+scXrr2lbtrROl2d6zj7h3adAv4PeUbXxA=;
 b=UyTZ3ao5fXyaGax8FnJq72YkUOJ+jfUV3TvBMEEBDFpQ59EzfXHSGOqt2+pu2mPEPi9HObaBicA6R4BfbGM1Qd2H3qHq04wQX9hdYmNFGjiNMG+h5poaLx0qWAJlw3cApixdihqFJvYCPrd1npvnczn9fKtqMnG/rcd7lvggL34=
Received: from AS9PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:488::8)
 by DB9PR08MB6411.eurprd08.prod.outlook.com (2603:10a6:10:261::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 09:04:24 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:488:cafe::b9) by AS9PR05CA0029.outlook.office365.com
 (2603:10a6:20b:488::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 09:04:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 3 Sep 2024 09:04:23 +0000
Received: ("Tessian outbound 7d86ec5dfeb5:v403"); Tue, 03 Sep 2024 09:04:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80ad58ed9b07736d
X-CR-MTA-TID: 64aa7808
Received: from L9b17469c2d2f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 347FD1DC-81CC-4A6F-9EB7-015C880B5A28.1;
	Tue, 03 Sep 2024 09:04:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9b17469c2d2f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Sep 2024 09:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGnSc1tcK1mWJ5kalmbTGs6wPcIQgHIZTsHCQLt4DRB4b5BNcC19lPN4QGqwgL5faDT+kOouF8v0MRzD4HyEpI3vT1vj+pGw7ZD3GyKPKW1utzHMJTT6l13sjg/z5Nh9VlDsQFDKXxx1gWHQZd8k1WfafLSMmQvk/2F4sb3ZUAc50IzQ/pIFJYWv/Y6aiK34oRN/+26hb9djKq5SNKDWBzuqBIoYkAsXSMCOOT/MEyltptBzTvCU8wl2qrD1QEQ3dhrSJa1c7aYWIL4cuDQ85+6zd6o57sTffG3lqG0o6+WTJGdgvHs9OU4UQAygL7yq8lwFhQa2dycIOknQOSzyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5r9xHQHG+scXrr2lbtrROl2d6zj7h3adAv4PeUbXxA=;
 b=EK0zmy27VTjj5wU/9TCYZ89FU0lnlhEzKptsAfJtgbruaa/VHLWROd8SdNZe5wPbUgm+aKU7KR1x7aXf6QfneSbQix9DgPCFvFrlwBdED0k4cBp7eFn559eeHymC8MabUpCBqWJGp4JySQMTRnLii9pl6a9oHvoOfgU8pgb1fKkz6kSbh444dg9iJLyor2VOZepcHRZnEQSeYyNskbGXs8I0IbqQqvfkPtHWd/0ANgTxuY/UPJhxmd+e94DDaU08eLHmo2rPCKKQSxdViO/NUTpsJ6QhVHYgHKeGffZPasNAHyzFvBqFt8Am2l9ufefrIsYuksalVIVhBYHb7l3rGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5r9xHQHG+scXrr2lbtrROl2d6zj7h3adAv4PeUbXxA=;
 b=UyTZ3ao5fXyaGax8FnJq72YkUOJ+jfUV3TvBMEEBDFpQ59EzfXHSGOqt2+pu2mPEPi9HObaBicA6R4BfbGM1Qd2H3qHq04wQX9hdYmNFGjiNMG+h5poaLx0qWAJlw3cApixdihqFJvYCPrd1npvnczn9fKtqMnG/rcd7lvggL34=
Received: from AS9PR07CA0041.eurprd07.prod.outlook.com (2603:10a6:20b:46b::28)
 by AM0PR08MB5460.eurprd08.prod.outlook.com (2603:10a6:208:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Tue, 3 Sep
 2024 09:04:12 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:46b:cafe::e7) by AS9PR07CA0041.outlook.office365.com
 (2603:10a6:20b:46b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.13 via Frontend
 Transport; Tue, 3 Sep 2024 09:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 09:04:12 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 09:04:05 +0000
Received: from arm.com (10.1.28.157) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 09:04:04 +0000
Date: Tue, 3 Sep 2024 10:04:03 +0100
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
Subject: Re: [PATCH v12 21/39] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <ZtbRA6SUWjo-WTO2@arm.com>
References: <20240829-arm64-gcs-v12-21-42fec947436a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-21-42fec947436a@kernel.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|AM0PR08MB5460:EE_|AMS0EPF00000193:EE_|DB9PR08MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: bc788aff-2d21-4ba5-a711-08dccbf767cf
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Sz8qv7zs7o6n0qixkEqGeIyau7O4NlbbTN+sbG91v3+nFVpbgoDhMckdSs79?=
 =?us-ascii?Q?+1qAGjnDGwd9P1KiCuwnXB9NThmQy16eVxA64IGKj19QFNciXYC+SAdW359A?=
 =?us-ascii?Q?81O/P+SUgcqURGW5V1TWjaCZEWvwZeAieBoB2VYG8P19/MhCEWR/CkGmPTRX?=
 =?us-ascii?Q?hxBX9uOecY3yZFzspKU1mibpCv4RdSOdRvH3+TuJ7CEM5vWFv0+UZX5oM1Mu?=
 =?us-ascii?Q?9BLiWurFQQchLA5HyD6PWdYIgActaqCE5lVbtZFTdcn4qVdavHE5u17qCmeR?=
 =?us-ascii?Q?BeyeuvbUjZpiR/Uw0G0b5EEKwkTHvonW2BXRhUsV9ozTUVIEtF5qmxNj+LhY?=
 =?us-ascii?Q?O9HJYDLg4yW1rWlYe/SGLpht1eiPq8AyydGhtzJhTz9xH34n4nH7MG1rU/cs?=
 =?us-ascii?Q?Ah3vLkUt+vKXrWTX+yJG9DGoibBJGfI+3/eu5yH0dNJbL/S6MBJlLi76TB8C?=
 =?us-ascii?Q?n4lkBSDvOJvzgURLCnsoTzF9iaiB+LmbJyby1WR3D/L6o1j40bY7oq50+7k3?=
 =?us-ascii?Q?Dap+Rwtk+dbs3d5lJSQ7uZFGJR95OrHiTXBFdKyyo0C+GsJxevjmx5UX6+o4?=
 =?us-ascii?Q?qpcud/mCtDCZwS6gFCFo6UXpLC0FsWN/zUHslcYHHmfNWQ4ke2KBeAT+gkN6?=
 =?us-ascii?Q?+Q02ZrOfcfEkLRs+WA8RB3OS/5890whhX3LsS8ZOai98vmIsm1reWZRkWgoz?=
 =?us-ascii?Q?V+IkreOU9kEK7sxYZ7P5uzEb5dXUn6nIhyQALR7ojaXKjku3s5LxORdm5/hZ?=
 =?us-ascii?Q?o/xeYtlon4vL/9ByLkNjgS290gzQGTnupyZOqlGXl/409xkT/RdydBLScWKl?=
 =?us-ascii?Q?QltOMTZU1KFQZqcEA+io16WlNwP9PCwgkysi1dWQzqCvp9/s5WHR9Xs5Ciq8?=
 =?us-ascii?Q?h8PeB98bsPNnPtMIcb54rdKat0J2jdWEDu3HljjAolisiFYIzXgiXFZIHyp2?=
 =?us-ascii?Q?07Gahim3WYlgj9a7cfnv3E6uxWTIaqNKISX3Ln5rDM4TbIH4kjXDqRPlsH7R?=
 =?us-ascii?Q?zbwgDI3KtX9CHtYJDKCFzPUcK2XdiqKbcdKa1in/fkLMkmu0YmZNaiJ5PY0B?=
 =?us-ascii?Q?bZZDiWRYjlEZgY1hnET0AJN4DV7SIWHSjr6O8Ty4A7oNXXjRH4hWQsB2pD5T?=
 =?us-ascii?Q?796Ira+XbZHozsw09BaHvwkkuq6e/UPqMBHqFa/EqeChu7JTiU2xAgO+rdAg?=
 =?us-ascii?Q?LESqxThbpeJuNrFXGUzemoozvYRu1ffHV9RJvWcDhGijqIS2S3OMSJHl6ark?=
 =?us-ascii?Q?X3s9K8W2JM7kum0pCVYyxF0sgThQr1aw/irAQwqRoATrgDfHDz00vtknDNGa?=
 =?us-ascii?Q?GqdLPLsZf5NbduMS874QU6OpNLtUVucaRol/V7kxiwvcJyiwdFDsUuFkHLz2?=
 =?us-ascii?Q?/7HAI0FJsGeBXOGRL8ZwUfqaghHw9NNgNRlwietq589CkeCRpeG6cJptAAd4?=
 =?us-ascii?Q?ZLBCnX1WmlkS0NBzarSA7fRsEddgAc2D?=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5460
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:46b::28];domain=AS9PR07CA0041.eurprd07.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f68233a2-0c1a-4af8-2748-08dccbf76132
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ed6Eo7KR5bPAjsRHAnAxiq/l4rc77ziwvwmeAq/t0cn7WZZPs2sZrJWUONWk?=
 =?us-ascii?Q?qLfOP+2LWR0HDVoJwNSx1L7mXtkmI/Cfi4ETZk47Z2/jsiKH/yDh4RAJBO5s?=
 =?us-ascii?Q?7rTed57GI8IfQgdnTEOpCB3TA5XgCjcQxMR9LtWX2eusdB/m6bnhN+J+TR9P?=
 =?us-ascii?Q?Mb/dk9Jv8XwkIAM5Tbb2VrhJtdLnrR9grX1IMm12bigDk/0iKBfDZAuIteeH?=
 =?us-ascii?Q?mIJeSLm7MC+sUk+i1WxXbGLn45tLe4ymN56WxV7XGeBnPd9SSzB8b7RqRWHl?=
 =?us-ascii?Q?nSdUCachGGDLDY7wHba7TP+Y+cZz+EZ8/fYIMBwXeVQPP3uM5Elg31OEti2P?=
 =?us-ascii?Q?5KdBuYFq/VlXEdbKzCCtLneo5IEr77BRXRd6oBIJl3qW8KRhn6zuczUqlPSv?=
 =?us-ascii?Q?++Qpfzfv379wvcqxaQCE/SDehSuEgy4dLR9v0XDVseAbJ6ceULVnC3beb3ta?=
 =?us-ascii?Q?qIa7OGUUEO++Kmzn0TYzciAwNMFidU3xcgDRw6/8TR1kRCrmvNG9PFUL/4/3?=
 =?us-ascii?Q?7jd9G2xIAYJ20BOiFowM4uSq9p4vCHaGIPJ00HLgRVs6ogORy8yow6wTF73q?=
 =?us-ascii?Q?R3ks9IXAtCtXw/UM7Cq3cAiJzu8pJ8/7TB9V15WUaDYFStzS2nBsrtDYGA5Z?=
 =?us-ascii?Q?rULjE9b3OAzwQp+uhe/n2St9zqQeSAqlSQO5HpozTBOKuHp8xd0IBKZHloET?=
 =?us-ascii?Q?JC4gDjmdr9mHqeJePexrcowmq/fIlDLofZy8kQHewA4cqj1OahwpnBdCxwPS?=
 =?us-ascii?Q?tvGzF0g9iSQtZtx9KChUMPYPdMR0IXfHebxI7HqIos0J90jibPDbOnAXwbP5?=
 =?us-ascii?Q?B6oxXGY58TFzZJOX8UHYzTA80VebwovN5RtrVI3t1L2QOV3NXFCZ58nuhMzS?=
 =?us-ascii?Q?g5khtZr3flCoTJaL5pVSELnIiitAcNh7armmIXR0zJnzYqLUFyYbDJ3Y2HBX?=
 =?us-ascii?Q?ufYVn7Xhzduy2Owi8vn0wHDMkplvFrqvnkcEFZIailha66AWY78Q6+qmHWAN?=
 =?us-ascii?Q?ieMTi7SjD3wsOcDBFNXILu2poSnBC3QWX5O/K+XtgZF3b4VafWKj4bv2Rm5m?=
 =?us-ascii?Q?q7SMxdvBBMmxLQlYL2c8MwVRTaL+LytIxZEXhEg+nsS+T1hfYHEwE0r05VNx?=
 =?us-ascii?Q?LfwCP/wWX0OOE8sQoXpAP7fasqzP/4hifPmk/88ysYbbFD88k63Lu8APoIPM?=
 =?us-ascii?Q?7H9pwB0HlLEUPl9gVZZgPkcVJpvR6SXEQZgC+dQRFaLURJJaok+7Nf/wi4cN?=
 =?us-ascii?Q?v7vFWOl7z5uEj0SXYQJtXBdY0p8+ubm6Lm13Z+31krK+QwtKMT6BR23p33SQ?=
 =?us-ascii?Q?A7TzwzvRyDfvwIfnfnLn6N2OumWix95jc7qcue12sTFtO4aTEUU1aYraptJz?=
 =?us-ascii?Q?SluoFZoFQNL0szz5600yfmv9hUpSyojd72P4OH6QpBnbvePYeR7uC/lVCz/H?=
 =?us-ascii?Q?S4igWdq2yudfBJINt52oO7h4qpuYbqL6?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 09:04:23.8165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc788aff-2d21-4ba5-a711-08dccbf767cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_020435_611771_D0C75A5F 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, Aug 29, 2024 at 12:27:37AM +0100, Mark Brown wrote:
> When a new thread is created by a thread with GCS enabled the GCS needs
> to be specified along with the regular stack.
> 
> Unfortunately plain clone() is not extensible and existing clone3()
> users will not specify a stack so all existing code would be broken if
> we mandated specifying the stack explicitly.  For compatibility with
> these cases and also x86 (which did not initially implement clone3()
> support for shadow stacks) if no GCS is specified we will allocate one
> so when a thread is created which has GCS enabled allocate one for it.
> We follow the extensively discussed x86 implementation and allocate
> min(RLIMIT_STACK, 2G).  Since the GCS only stores the call stack and not
> any variables this should be more than sufficient for most applications.
> 
> GCSs allocated via this mechanism will be freed when the thread exits.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
