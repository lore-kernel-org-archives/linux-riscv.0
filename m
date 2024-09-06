Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9211CD5BDD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 11:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZ4dlhPachC9IGoj0J7Vb+8fxrV9IVVa+fv+Mpr0bqs=; b=RSdSNd6fn3LUzG
	7Y1uipAohT83n65fM7PJIhv+C06obktidisxwUvuFxIFy4vbJjg96yqRNcQxxrXXUAApGOzjEgmTr
	4wKgLforhwYf41pxzjw6cLFdUc+drDfFv53hpjBSPa3vD5o4MkbtKpP6B+AvE977Y+qp+rffWVl6d
	wtRXPmfBLt/rZnSvsgK3ebtpE9hxZKFpOXQXacKtJ9I+EZSWewAHv2yT7XH7x+1zzAn/E+LNj+c6n
	IOZaue4LYExiYQBey+bDBiryw4IVskN8jIRRkavXWxZ4HhsO924VHn8wk52IDojiSXITjtBf0gZmw
	hZM/LKOY1diQFaBh3CkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWy8-0000000BvtD-1iVE;
	Fri, 06 Sep 2024 11:17:36 +0000
Received: from mail-vi1eur05on2060c.outbound.protection.outlook.com ([2a01:111:f403:2613::60c] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWpL-0000000BtvW-386t;
	Fri, 06 Sep 2024 11:08:33 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v7NbSlTpie0gUMrYRn9rLw7AwpHOTsFP4sRmeMYhBxBa7QXqyd7YAhesnNN+RbHIFXFE5wcXQQZiueCKYnU7lpI9M4ebZC5rorsRJSNCosiQICw57BBu1Is5RNs5FHf6uTtuzlKrWh2BHPVjDcTB1HBuFWttgr6oKdt+coX+B/gOEa9tnRjTqVEVZe7gwa25Hwev9tVRIGbK0zAI5CWEqoe2QLog7xJdUtp1CrVq8E0k8tiq31Lg+8hvwRszSUMGPyL3v2Ubq7XCdbsoLogLUoNEfxJ7Nklq8F1b2i5B+UzeesuWvOqE8h+8nyfmdgoX24X31L2CUj4MPelyqjRoQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuGZavkWIIH1h02+xTDKXt3DJz7tzsCjDU++TkIxlUI=;
 b=Zh7aRiU1VB4iTFCO8KSm88+tzsErwKYrv1DF+VeL3r8SOYS8B+rdRSZq44haEbAJX/89ospKoSnIwloV8CLS7blLwjm08lMDjH3WkkJm2ZNWbg4WHdlZ/3kz3vTSpz9CLAhGcVVqfNXuU7vv8jz3xNQtl5y9vjm3SOe+imoaQ5uWjhm9h1rF4Xg55FbAcxPXI4/wlNoMft/aATIynB1cSvubML19MkV4yZ9yYVaGkDezzuVKENt2G+1OXei00CInE6/zk1+Bbo+T45+m/7xL9Hlk/qQeJRnnPppDzcprJt8CQOeqOgFNY+uoqM/xypvydFXb2D9B7wNBuKvLafx6tg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuGZavkWIIH1h02+xTDKXt3DJz7tzsCjDU++TkIxlUI=;
 b=D2kECHoM21OD0D0NzMlAsSasCHhz643+AitqPdswj4VnuDfhi9IY91vT5bthBJxR3TO5JJTbwmp+q8OLUK2Wqyy5sfwjtKDc8HaSRtJyxEmexXT8tyuMsEnWKANXDqyfo6K+8cyRpv5jn5+DFTf31vCkRMs8OTgCSnD9sMP7nAw=
Received: from AM5PR0101CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::25) by DB5PR08MB10138.eurprd08.prod.outlook.com
 (2603:10a6:10:4a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.13; Fri, 6 Sep
 2024 11:08:14 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:206:16:cafe::a2) by AM5PR0101CA0012.outlook.office365.com
 (2603:10a6:206:16::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16 via Frontend
 Transport; Fri, 6 Sep 2024 11:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 6 Sep 2024 11:08:13 +0000
Received: ("Tessian outbound a13c34f08745:v437"); Fri, 06 Sep 2024 11:08:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a912932261d8174
X-CR-MTA-TID: 64aa7808
Received: from Lb668a72e7cf9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9AE62DB3-54CA-4EB5-B219-749B3FE139D6.1;
	Fri, 06 Sep 2024 11:08:11 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb668a72e7cf9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Sep 2024 11:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmrVnQETqhcT1uAlEKkasOnHhTf9PcOIHgaJHfe+JyL+MtMsYpd9lvjaz3ARbdGE5rXqHPHVUTbYs91wC8S9smf9wsGzrKxeTnF2Z8KqsI5v6m22EF1nMXiZRNkjgoXI/Ee+5WDTEL7GyL9GfT9yZj1O7uK7pCg9qnQbcIzXpBBglptISmMMpI8hL/XIX2MC11FNkeaJAsld0irpDuV4bHvbYx/ci/PeXBBI1QamFYXzg+ksV3jAYhLKhVK4c3NfTbYkGRSqiSlMrGbUYg+YFy4EOLvofCtzNNJpKJsx21Neb0Z0j5A0BPyqDp4bcNYsAFN6rDAZls01iNYkRw5fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuGZavkWIIH1h02+xTDKXt3DJz7tzsCjDU++TkIxlUI=;
 b=l9omlfwFvI1rqtOAGIwyM5iFOk/Yus4ZSk7O0Mpn9jSMDRNiN6HOQ9R90mudAaTMMPIMdU/NkyHRXe+YPwyydyiSITHJ5K8q5VODVAIyHFpkR5F4ZpMzPQs+J5j44OhKAmOcGe444cxMbG+WT5Xo0SoqMtJJU+66FjzwPs+vMfvFm2Ad20uAYgaLEfWeyAAZhdURRHjn1/lZDzDCN7zpasxcZpNsIQuYXLr4u/7Quw0CTgfKVlM4rxVQUZwlA2N9AqZ8UsgY0aKZXCEppVwNWdrBxwrl8YKCpFjTPPNKT83JsyezFUnk8JuSPKzRuoM/GRsK6FkrhaPSmky4QzpV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuGZavkWIIH1h02+xTDKXt3DJz7tzsCjDU++TkIxlUI=;
 b=D2kECHoM21OD0D0NzMlAsSasCHhz643+AitqPdswj4VnuDfhi9IY91vT5bthBJxR3TO5JJTbwmp+q8OLUK2Wqyy5sfwjtKDc8HaSRtJyxEmexXT8tyuMsEnWKANXDqyfo6K+8cyRpv5jn5+DFTf31vCkRMs8OTgCSnD9sMP7nAw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by AS8PR08MB10269.eurprd08.prod.outlook.com (2603:10a6:20b:63c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.9; Fri, 6 Sep
 2024 11:08:03 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809%6]) with mapi id 15.20.7939.016; Fri, 6 Sep 2024
 11:08:03 +0000
Date: Fri, 6 Sep 2024 12:07:49 +0100
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 21/39] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <ZtrihWQFyb2/XrQV@arm.com>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
 <20240829-arm64-gcs-v12-21-42fec947436a@kernel.org>
Content-Disposition: inline
In-Reply-To: <20240829-arm64-gcs-v12-21-42fec947436a@kernel.org>
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7179:EE_|AS8PR08MB10269:EE_|AM3PEPF0000A79C:EE_|DB5PR08MB10138:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f350abf-0a85-4c91-4217-08dcce6433b7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aTBoNDBnUkp3R0IvTEVEV2IxSHZKQlZRVE1JNW9ndFcvdHFTWThjRGdLeEU0?=
 =?utf-8?B?dzMwWGxZbGhXTHR2YUwzK0lIS2pwUlhqOWdkckpsaC90Y3pEeXdCbDUrMFVm?=
 =?utf-8?B?WldpTUVaT3Z5VFAwMGljRlU0bGh3Z3owK3RVekh4ZGVXNFIrNWZrZ1NnaFlw?=
 =?utf-8?B?NUpoQUVSTmVqQ0x1ZXhRT2FEdTRlTlptZ1ljLzRnMmJhVnpIMkVvc25HZHhn?=
 =?utf-8?B?UjJ5aitlekx6bTVnc09rQWJWSjAyalUxUnVURVVhR3FGVzk0MjZZZHRFRlFI?=
 =?utf-8?B?M0NTbmREc2FnVlNnakQ0Q0NLaU5MMU8vQk1DM25YSnJCTFltUWY4Z29Lb2Vx?=
 =?utf-8?B?Qmo5SXJtNEhOYmZpaElENDdpd0NyRWNCS095NnpMYnRHQThKMm1EUUEyVytn?=
 =?utf-8?B?R0RPYzdXOWo4ZWZhWG5sN1NQODJ4WnRVSzM3SGJSSWhlektDZVp4QnduSlBl?=
 =?utf-8?B?VEI2Nk5IbXhNMnNWV3IxcnkvdFBPc050dFZoUkZmSjE2aDVBM3czME5rYkNH?=
 =?utf-8?B?a2tKaWl5cVlEaDNUMTFSWkZCc2ZnK0ZLT0VsYk9uVnZuWDlLbFNaUllJNkdn?=
 =?utf-8?B?SVd4ZFd4N3AvYjZMWFgzbTBpcmw4VjBCdTdWU3phK1k3MTNCeW1UWTFtWXov?=
 =?utf-8?B?aGxtaU1EdkdzSGNqRk0vck1JR0dneURhdmpuWStGaFAxbU9Edmk3ZGFyU0c1?=
 =?utf-8?B?ckJQSFo1Nm45ajJDeEN5Z0hIcWJ3dmdsek9abW12SGZwL1dKK0crcHEwSUJl?=
 =?utf-8?B?cTJCZXh4My92bkJJb09jMy9YWk4zNDgrQUJVZG45SVhndm10UmhBb2orSHRE?=
 =?utf-8?B?Vk01YVNrbjRXcmpWSHZrM0FZdlQ3bVdaTUJxVFZZNlVheGozcVdyZlEwZ1dy?=
 =?utf-8?B?bHd6SlQ3NmxOeXhzeHl1TS9MaENOQ0FBelZZbVJOOGNMcklJcTRiRHVpMHFO?=
 =?utf-8?B?OUYzV3RLSFNpd1R0VjlDZllFOG14aW5aTnkrWnZ2UklieFFnK2tkM2FLSTh5?=
 =?utf-8?B?NnRpMEtETkVlUVJqWUxldUFSb2JsVS8yQ1h0TFl0YmZJaTlkK25QaFkyNlh1?=
 =?utf-8?B?SnIzMEorSW9aZDJTYXdnUzVFL2F1dGtqajN0TXpqQTVvNk1xVFhja0xLaExB?=
 =?utf-8?B?ZW1Wb0VSSWk1QmhtRnNWQUxNNjIxeU4vRkhGTGtaVFFGQ05GZU5mc0c0TXF3?=
 =?utf-8?B?Q2xWREtXTm5tRzl1R0l4MlJtNGhhUFhqakRsdk5LOE5VNVd2WERUNTNQRXht?=
 =?utf-8?B?S3FqZGU0b25NYlBoaEdYSVFxc1luQVpyWUZ3WU44UFc2d0cxNkI5ZUNMS3da?=
 =?utf-8?B?V0FmQVltQzFTSU4xeWtOMHNhRStnTlEzVjVFZmMwNnVOdXhpK2dxaHk1aWJL?=
 =?utf-8?B?TittOForc1ZnT1llZzdqcnhNSWZNcWlrM29DMVJYdzJaVzArRWh4aU5KVHlT?=
 =?utf-8?B?N3BNUW9ZeWJEeUJmaE8vZmdvaEhqanlJK3NCQklNMmt5QjNRTWdXQ29iejRp?=
 =?utf-8?B?SXhqK29GR0EwdW5GNksxc05OOHVSSnpBOEhINWl6K1AzSk9jMi82czFHNHFT?=
 =?utf-8?B?K3hvVUo2UzI1ZC9QMjRvcDVSSnNZbEtIeGwyaDhjZGdybnBhVGluV3NVME5v?=
 =?utf-8?B?alZWcEhMQmZMN0FTbnprMmp4MFp4bGRqQ0ZFSFFKNjdENlNGRzlmUVdjN1dk?=
 =?utf-8?B?Nnl5bjg5YlV6SUVnSmlQT1VzQmphaEdwaGFCb1d2ejNBRW9EcTdpRGk0SFM4?=
 =?utf-8?B?M0d2QlhSd3lOSTV3MmQvaDBmM0hFM1JXVjlkRlcrVlJSZERML0xJVmVlRnk4?=
 =?utf-8?B?Sms5ME1KRDRqd2ppV0xSUU5JczVVRHdsTEVNTjdQWUpKQXcySm1MTCtYV09Y?=
 =?utf-8?Q?EkULOeDYPt909?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10269
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:2cc::19];domain=DB9PR08MB7179.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8663ad94-83de-4d14-3bb0-08dcce642d17
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUdXL0FqWTNodGlMdVZmYm5XeUx2SkVDZDA3eFlNK3BMdThyVEliQld1VU9S?=
 =?utf-8?B?V3d4STZqcGk1Z0dMVUpoemtxNmE2cTZlVmJ2RmdwcGNURm9NVFR6UmZKQlc3?=
 =?utf-8?B?RTJ1RGU5MnhPdjdlMXpSSEl6dVJNSG5zVGo1bGxIZmN0QzB3bFV4bXNpaGl1?=
 =?utf-8?B?ZUZaWndjSG1HRXk2aWJwRU04SGVpNERYZHlBSDRWV3VneFZudHNhVGJ0T2k2?=
 =?utf-8?B?QlU4K3ZwTmFQU0ltU2lqclRkRGZoYWQ0bmlqYmxmcDZVcFNtRUlaUlZwVml5?=
 =?utf-8?B?VU9yc0RmZzg3MFZvNzdzTVRvYXNTM3RTWldUdkFkUTNGY2xzdEIrSGJqRCtM?=
 =?utf-8?B?NFRMRlRpWDFPand6SlZmN2dabFIvRC9xdUhiZzg0bWczSmdERDB1MDlCd0Vo?=
 =?utf-8?B?VEdsNnlieGJ0c05BZDk4MVFzMzgrWi9ZdEZ0YkJyd3NXa1Nyd2pNTzBBRVV5?=
 =?utf-8?B?bzdFMFpjQUMzb0NrNmFLT0xvMUJLajNpbjJ3K0Q3ZWdabDh4cWUzWFVZS0ww?=
 =?utf-8?B?SEFMTUFuUXpBSTJzRDA4NnowZ2tCK2ZUUDJpM0E2TG94YXZ6ZXRZTFNvYmV6?=
 =?utf-8?B?TXhtVmtKa3drRzh1czBVRkhKRFE2TnRIcVhNREtLQmZYR1JPV2t4SjRQY0pF?=
 =?utf-8?B?MnRjV2JVOElIV1NTMDZWcDZMTDQvZW91NU9XTU9HWnptLzBXZTBqY1R6NDVQ?=
 =?utf-8?B?d0ZUQTYvOGpuOHZ2LzRhaXhzQlIwb0tmbUlhb003WDlBakNwYkExSnYybG9D?=
 =?utf-8?B?Z2xxWGQwMWpLN2JWUmc3VHN2YnZjWEYrNElIaXFDNkprSHg0UHZlZENjei94?=
 =?utf-8?B?TUprRUdxTmVyZFpRRG5OcW5lYWVOZFRGZ1R3V1M5R0hMTzREcnFPb0k4QWVp?=
 =?utf-8?B?bEI1RS9vTEtFUUtYRmVTTXVVOXJnSDkyRm5aREl4TjF6VWZhbXlleExsem1l?=
 =?utf-8?B?Ukl0VmVDN3ozSkhjVWwvUjhIS2RhVmUvZEgwaVdWQnNrNDFUbTJWcERUVDg3?=
 =?utf-8?B?L0dkb2tFK0dWeXNwaEJ4MXRjVHcxZm9FOTBTREhFcG1SZHptU1RvQjRmRjJX?=
 =?utf-8?B?NjRZY3JSM2JSbkY4MzZvN05KL1ozSDR0dTB1aUVoRkQ1TlQ2UTB0c1BtczY0?=
 =?utf-8?B?aEx2YUNKeE5PWmlVNWlwOUc4WTNCVnJiNEI1VHY1emZHdjh3Q3VjOHcwVWky?=
 =?utf-8?B?TVMxdklJSzFwNnRGamtjbVNUbklQeFZTc0N1MU16a2dMS2diZmxuYTJ5Nktj?=
 =?utf-8?B?VjJZUklEYktiTHhtQnR1TWpRUi83MGZtRS9vMlNvYjB3RU1QWjdTMWlPVmVo?=
 =?utf-8?B?MXFKU3BxN3pxUjVrenZ5aEFTMmJtaGZZS3ZPd05nYWVZREJrRTk5dFgzYUwy?=
 =?utf-8?B?SEZmcjh4L0V6L2RPVkJLYVRLR0F3dHpxOUhlaEF5MVpKSlNEczVUWUc2VEVO?=
 =?utf-8?B?a2s2UXlGQnZJWGd3QUlzbmN2Qkc0K3NVMlRJc2pxU2ZTVTlRdGpwRjN6dUZo?=
 =?utf-8?B?cXlvVXVnS0hLcDZybzBOK3FSTXVvcU94YW53cFYvczZCMXpOSGRMWVV5ckNS?=
 =?utf-8?B?aW0wR1JiUE9VSEhmYTJOdGhaQUVib1hSZkRZL3lIem05Qk1TdGZvY2RUKzA1?=
 =?utf-8?B?a296ZFlOTmExOHB2VzdVSzQ3VUQ4Rk1icW5VR1htQU5UbnN0bXQ4cHBNMWxE?=
 =?utf-8?B?dGRpNnRmYjdTd0EvbGpJMzNFTjNsZW56V09EVmlMNU53YTBuUHhPdzB5cGNX?=
 =?utf-8?B?UmMrbld4Z1hYS24reHdsNVZXSEZUNXdqQmFBME55NGtBT3VUMVFERithY0JY?=
 =?utf-8?B?emREMDJJRFI4OEwzczRKaTFCd09zOFk1WEh1akREV0JPNmNuZzlOMFlzUzEw?=
 =?utf-8?B?MWYrRUhIQVdtRFlmWHpFWlJINDdFRW5zNG1yRDE2eTdNcUZFcnpISDdxTG9O?=
 =?utf-8?B?bWx0ajVLMjEwY045cWNFeGJZQWVRT3ROR212bzhRZjdWS0VFL3hxaDdJL2h3?=
 =?utf-8?B?VlZObFhyMGZRPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 11:08:13.8529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f350abf-0a85-4c91-4217-08dcce6433b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_040831_995694_C62D54AE 
X-CRM114-Status: UNSURE (   8.30  )
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

The 08/29/2024 00:27, Mark Brown wrote:
> Unfortunately plain clone() is not extensible and existing clone3()
> users will not specify a stack so all existing code would be broken if
> we mandated specifying the stack explicitly.  For compatibility with
> these cases and also x86 (which did not initially implement clone3()
> support for shadow stacks) if no GCS is specified we will allocate one
> so when a thread is created which has GCS enabled allocate one for it.
> We follow the extensively discussed x86 implementation and allocate
> min(RLIMIT_STACK, 2G).  Since the GCS only stores the call stack and not
> any variables this should be more than sufficient for most applications.

the code has RLIMIT_STACK/2

(which is what i expect on arm64, since gcs entry size
is min stack frame / 2 if the stack is correctly aligned)

> 
> GCSs allocated via this mechanism will be freed when the thread exits.

i see gcs still mapped after thread exit when testing.

> +static unsigned long gcs_size(unsigned long size)
> +{
> +	if (size)
> +		return PAGE_ALIGN(size);

no /2

> +
> +	/* Allocate RLIMIT_STACK/2 with limits of PAGE_SIZE..2G */
> +	size = PAGE_ALIGN(min_t(unsigned long long,
> +				rlimit(RLIMIT_STACK) / 2, SZ_2G));

has /2

> +	return max(PAGE_SIZE, size);
> +}
> +
> +unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
> +				     const struct kernel_clone_args *args)
> +{
> +	unsigned long addr, size;
> +
> +	if (!system_supports_gcs())
> +		return 0;
> +
> +	if (!task_gcs_el0_enabled(tsk))
> +		return 0;
> +
> +	if ((args->flags & (CLONE_VFORK | CLONE_VM)) != CLONE_VM) {
> +		tsk->thread.gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
> +		return 0;
> +	}
> +
> +	size = args->stack_size;

no /2 (i think this should be divided)

> +
> +	size = gcs_size(size);
> +	addr = alloc_gcs(0, size);
> +	if (IS_ERR_VALUE(addr))
> +		return addr;
> +
> +	tsk->thread.gcs_base = addr;
> +	tsk->thread.gcs_size = size;
> +	tsk->thread.gcspr_el0 = addr + size - sizeof(u64);
> +
> +	return addr;
> +}
...
>  void gcs_free(struct task_struct *task)
>  {
> +
> +	/*
> +	 * When fork() with CLONE_VM fails, the child (tsk) already
> +	 * has a GCS allocated, and exit_thread() calls this function
> +	 * to free it.  In this case the parent (current) and the
> +	 * child share the same mm struct.
> +	 */
> +	if (!task->mm || task->mm != current->mm)
> +		return;
> +
>  	if (task->thread.gcs_base)
>  		vm_munmap(task->thread.gcs_base, task->thread.gcs_size);

not sure why this logic fails to free thread gcs
(created with clone3 in glibc)

other the gcs leak, my tests pass.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
