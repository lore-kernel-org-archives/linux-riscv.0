Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F02CC55822
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do0yBD1Tw4ShyK6i6OpYWO1doqgvsUC+36XBaeuYZBA=; b=Ju+Hv054OGI6gpuXkoU9eKRbPH
	1rXgto8+5uYN42wDG+RvQdqxseuPcjUm4lL75HGex6NPXhTaa8pBkDLOsdwlMMyFznRY91HbFVOwt
	3p3uq/d72meFAl3NafLhb5r9pVYmlTowsqbtJC0ozSjIod1/pzgL7BbmCMgL5uRUcj9Hliq/mrVIc
	0nOnJOLJpPzBV5ba/pZ2R1Rk2kaX7CI9wRY+14kxQg1d5rVdhRwKmQrjxw/+UQs/+Xo8BsAovud80
	Jh1nKX3TDQ4tyQv7bqF6Pr6FeS5FVWJ8DyRvgX3umsCUfHcD5kApbKwfg9Fqq3r684SPGI7XKljXF
	goPzw6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJo6-00000002bu8-18op;
	Tue, 04 Aug 2026 18:24:06 +0000
Received: from mail-northeuropeazon11012054.outbound.protection.outlook.com ([52.101.66.54] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJo3-00000002btH-0sIK
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 18:24:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a6Reb8l3QNe0X4u9fMhaZFawsd0qW9QiuuMfKDzKPx+WkUan5A2CMYhhWrlJs0k60CRfXwJTNZMhRNzVzU6qT+kUuLl9QkQ5nTTz/IaLtqibbNUzYa5UE+hs5ShdJaFWfjnGbfaOtbCv0SH+Lgo1z88WUayUQwF5m9ZLr2IKj8fH00iJb7mfFediAM/b7uxcn8EGGdRjBda7yn99Qjk9Q300Jg3GrC0IJvoc6tV+UVgeP3BipYFTigeS0hEFjtV1V+eV03xGaVC0T+koHfxJQFJldL2LQC4UheBqA6lANNLUpJcfr7KJq7u6/vdjJ0UIW+IpV+9Za2NADNfXq7j3VA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=kovRbn+j/A5NJxiKrt4Q0hHu040XEwwZG6tFraLMlcSWy5hxMlbhPDt7ESUwfie/1jytwerxVtKvg6MkAx2i/0Y9tDUKxW7Ook0/tFReYlAbxbh0mmMVZza5Nk4zzTYJlIzHQIAqKF+8GLsRq+VZJiikrQelCfeZeT7Cxnomcp3tBr5v/EhbI3BOA97ZN/yZ8ksCOLhY9udYQkqb1EuZzQXFgr+cFJ+q+yhOIYxydxC04efq1jK9p+m9QjAHHrsF4QaR9+p9BXOUia8yDrhWIebv2pvOlzLSJZr84MUsM6U5yGhafiZsoOI+QdjVxUwR3ShWQZLZhV85ryzEQiODSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=AajXjDXbUoYqCRTuuSQ2L/uUnbdWo1tqXQVKxf4J5rOxFyTb/AxI+GB/scJZLJ4Ri+Svhy1gb4r8WHzqbOH2Xco71KGMfrO4F10h/xq3JLVe7/vvBGPVT/kSUca3Tor+E8aiBZKgjjtvLCtMf7RcgI61Ty8N0DEXFHgs+2l/5vQ=
Received: from AS9PR06CA0136.eurprd06.prod.outlook.com (2603:10a6:20b:467::28)
 by GV1PR08MB8108.eurprd08.prod.outlook.com (2603:10a6:150:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 18:23:48 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:20b:467:cafe::c) by AS9PR06CA0136.outlook.office365.com
 (2603:10a6:20b:467::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 18:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 18:23:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDiN+CDwTo2SnVRyUxA/oGhu+GUcAqe4pQfdJ27w4uFqUrK83rnZQ+wrj2zUFV1lz+DfTHM+kR1sY+NGgfK3x6C2HgVX4Vw+tLrfVIE3POI6aDIKyC7BR0YXsDjKOXTC4co8fsRQCiWw/AyRASNl8ibsjJAEmuStqQKoaZq1Ob0BzXYhfHrMQb/n9diKXH3fXzmZP5S6SNe2fItDtjxS8qTw+dyjNSsYgNyPgjlFxhsN1Uckyp/e082oPI2nGN8voqfA8wf0k2JcKUELntbUwzO4yRPsxvPA5TKN9IfgM+j4BleRJfNWVWHRW5/LC0LdLGG6JWgN9c1XHp1lndPNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=SYCjpzFpmLdVJfo9m8IfulRdRgR5gzMaVCT4GV3NhvDKEJHpHJfe9dOTsDRceELpBTeXV/HuI1nUybCXMdR17EgpCM1D+07iHcROEMJKEK9IDSZu39DBTa4r27RCqC8/XGv9mVkE4WjwQ/IDvbqEJsYclFNwsLXeCFfi0mBrpnyEuj4AavTLlbiH5VDtWbOo9VTIeD44uUkCQAY/RZiSkpnQdHE6rnN62cLE2DqZGT1FTVwHGxRrY/KuyDwG1ex1ynyFZ1yJ2Rjhsnd6mrBiIUr9pSTRpl4a6ewzPMywwrFE4ZCWVEJittZ1j1zvG7X248/ihEizGUrOl5KUSFgNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n86bSgR7vLnX+oIclHGjs79HF8dfeRulCbKeyTI1aO4=;
 b=AajXjDXbUoYqCRTuuSQ2L/uUnbdWo1tqXQVKxf4J5rOxFyTb/AxI+GB/scJZLJ4Ri+Svhy1gb4r8WHzqbOH2Xco71KGMfrO4F10h/xq3JLVe7/vvBGPVT/kSUca3Tor+E8aiBZKgjjtvLCtMf7RcgI61Ty8N0DEXFHgs+2l/5vQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 18:23:12 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 18:23:12 +0000
Message-ID: <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
Date: Tue, 4 Aug 2026 13:23:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "pjw@kernel.org" <pjw@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "x86@kernel.org" <x86@kernel.org>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 "tglx@kernel.org" <tglx@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260714154740.140431-1-bill.roberts@arm.com>
 <20260714154740.140431-2-bill.roberts@arm.com>
 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
 <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
X-ClientProxiedBy: SA9PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:806:a7::23) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB9829:EE_|DB9PR08MB7889:EE_|DB1PEPF000509F7:EE_|GV1PR08MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: e37254ae-7fef-437e-5b1e-08def25586b9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|921020|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: ssURU6+4eI8oGCUV1arEsWuHdxiUXzlkLrrUErJALovnK54v+FzA5hv2rj60kPW70vKETRjYVjvKPc1X021vIoTyGi9duyNGjv011HtD7lqBlcE0zXMffASol7+T+jKpj7UfAWK/ogx70wXoLjJnMWVxzKjRvvHu7M35KAjPKp/35CNLgCXvU+fH6x7M1JkqPsJy0T8810ko/aSOc1C1YPzgv/xU3RuToZYe3nyjqxZOZXw6WwlQcgtU/943NTlApOJLqplbpLZaT3a7gMhqjrNWEdPkkPB6I3XyLWdOR1/4kN6RBwTDjHzP2LJ0MTGkHPUKl0wbNEQVRuxjMRX9Z3tyGN3g+Q3w4RkAwDhhERQPb007WHZDgB74QB1wyrn74Eh9TdTbWQY10n03YqO69JeiHap42Ve68KIVZPLrCiD81gUXmbnZCExCN0KihEEkkn3MAti3ihnuGJA0DVNgXyN5SWs85mcd0SYNN5AF/reXxU69D62mOQXL7m3uDShHIT+vgzsX3uWsOQQnr0fe6bgin4weIu3fZpJ6mnfGNfyZ6Mmetb20Ted4jB3yDmki6yMScw9a25EvD0Gs6Sc5x1HbLucXpGk8BJwgPeFLwUDOdRzZyLWAyziO4M2lwGE6Fp39sgxPlSQqc2JNrMadzUatiC608T/TGjerymvZ9Yw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: lSbWFEO3h4BGHpJUSp6FeSaSsDGG44n632FmUAFcVjajZHcV6qt7aJ8YHq3RWuVNo0zZJY0NWWyHnNfa/f46/JenYfV+nnhMdnv5A+b3mu15j3qgFH5Fzalh8jgvE/dhvUFyygx07oOTLz0KAq/V48LJb1RRpGVw037D3Lxatsf1Z1n6fkMRlfPJb6N7ATYiBAMCWYijTDfKwvhOC6ZqTc8B2ZUcYKPWguZio58MkYt0/2/j+qJCsz4cgf+1Hhbbh8puM3MY2mHpxXZuyNSZOyreInQRAlXozZuSVKGlU+iO986/xu8PFpQHD9B4t66ujJjS9eEGnZnGECyk1/aAjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 68d5284d-e17b-4046-69bf-08def255716b
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|82310400026|36860700016|23010399003|35042699022|376014|7416014|18002099003|22082099003|11063799006|4143699003|13003099007|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info: R19nTa5Ge6BGZzWDGJdKpf7BZK6UMmdos6+A/DZKQGjF7PS5m0xi0VBAOryI2p3/lu+S3n/ZuFYBJkbCcB8hZ6J4yo31toYjUl3kLMnogYwCnccR4orEgxK5o81o2+/dxp+TwG4G8X2coAiHFG581+K8y7ax03XZIQ5TrziCpYyOLh/610hjd9lEnhl/0JQ+fAXvtN4ViIVw0YS7bG2ZffSO8eD60COfjGH5PnbibLvQExXdLoPaCBkccShpHBNjyvOc4pZH8qo9DWezS01jhnyJMsbqNGnEd0FbC0slZAdSj/0wAKvjrmWxrfwChxftopZTedS9VePCFohTqCSsAaoxSw4YIoDD4ii2q/dmw/rxnA+5QjQ+eWon8gLpJa3ufdVmI5el7h+SBGG6qeaND68R3Ql0q2Qprbchj6BNmObatGOKV6BxbuFlXHLIhiDePfAeOtTnzenmaa4qLSBYjq0R30HooWsn6KUsFVPHSOOzXNHuLYjeynaoEafv+QC/DbP9XisE9eCxdzVfRq+bv8VHZ++auTe0jXF0T4jorsrpEv3pSdXlWITzt6lI9R3jm1JUk5ume8Q2Ox8zBRsZGgX7f3vZQ8aff86oNplWWGAFrY7jEhOMJnUpxIhbx9olquQV2fhjKzWHlCyhzIeF29xuAjzGk8z4LEY2/U1sUEKMGZq7zJBIGmQcQq9GrsEBygCrX9v9eMRJxwjoR3doiw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(36860700016)(23010399003)(35042699022)(376014)(7416014)(18002099003)(22082099003)(11063799006)(4143699003)(13003099007)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Gw50IxPw4b0/PkaaHNkLb6K+MXEVuUZjCfVL7S1Wk9jp8rRtdgbOXdln11CHOf6webO/HFKrUtXk1m9NDzRUURrQ4XbQUD72xqgqd3MCJDT3l8ZuHhIQqdEEGEzOZiwZY+d35M2Q/BLyoPy8uwyyYVfCzzpx/akjHkIZeTnvuwsrkCzSTlWlzs/4CLQiA1vFB3sKYB8nENqDkmF2NpeV2NCnvv1eZNat4aN8G+NLntx48ZenAs40bCcnMrBSwRPMe2Cn7IIly6EmpoBl8WKFXYC/gPmg6zoRXjiM7mHXJSd/kxA6cRZvoTedvDslmB61iK6ag7PZ8WKrmrMM2Qt/zuDK/8ZXKuE9D8BtAGiEiJfvMbtVfM0nPQMGklhnK0Y8mYVd++tJk5qKzAkMpB1hnLwygXyjOgNfCmOJjbmTpQLzXmMli7C7Hvke4hCEnPNv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 18:23:47.8603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e37254ae-7fef-437e-5b1e-08def25586b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_112403_366527_CE4A51F5 
X-CRM114-Status: GOOD (  19.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDgvMy8yNiAxOjE0IFBNLCBFZGdlY29tYmUsIFJpY2sgUCB3cm90ZToKPiBPbiBNb24sIDIw
MjYtMDgtMDMgYXQgMTI6NDEgLTA1MDAsIEJpbGwgUm9iZXJ0cyB3cm90ZToKPj4+PiBNYXAgdGhl
IGdlbmVyaWMgUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSwgUFJfU0hBRE9XX1NUQUNLX0RJU0FCTEUs
IGFuZAo+Pj4+IFBSX1NIQURPV19TVEFDS19MT0NLIG9wZXJhdGlvbnMgb250byB0aGUgdW5kZXJs
eWluZyB4ODYgaW50ZXJuYWwgQ0VUCj4+Pj4gaGVscGVyCj4+Pj4gcm91dGluZXMuIFRoaXMgYWxs
b3dzIHBvcnRhYmxlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdG8gdG9nZ2xlIG9yIHF1ZXJ5Cj4+
Pj4gc2hhZG93IHN0YWNrIHN0YXRlcyB3aXRob3V0IHJlbHlpbmcgb24gYXJjaGl0ZWN0dXJlLXNw
ZWNpZmljIHN5c3RlbSBjYWxscywKPj4+PiB3aGlsZSBtYWludGFpbmluZyBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5IHdpdGggZXhpc3RpbmcgYXJjaF9wcmN0bCgpIGNhbGxzLgo+Pj4gQ2FuIHlvdSBl
eHBsYWluIHdoeSBub3QgdG8gaW5jbHVkZSBBUkNIX1NIU1RLX1VOTE9DSz8KPj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvZTEzNjI3MzJiYTg2OTkwYjc3MDdkM2Y1Yjc4NTM1OGI3N2M1
Zjg5Ni5jYW1lbEBpbnRlbC5jb20KPj4gIMKgRnJvbSB3aGF0IEkgY2FuIHRlbGwsIHRoZXJlIGlz
IG5vIGFuYWxvZ291cyBvcGVyYXRpb24gaW4gdGhlIGNvbW1vbgo+PiBmbG93LCB5b3UgbG9jayB0
aGUgdGhyZWFkIGZlYXR1cmVzLCBhbmQKPj4gdGhlIGZlYXR1cmVzIGFyZSBsb2NrZWQgaW4gcGVy
cGV0dWl0eSBmb3IgdGhlIHRocmVhZC4gSWYgeW91IG5lZWQgZmx1aWQKPj4gY2hhbmdlcyB0byB0
aGVzZSBiaXRzLCB5b3UganVzdCBkb24ndCBsb2NrCj4+IGl0LiBJZiBpbiB0aGUgZnV0dXJlIHRo
ZSBnZW5lcmljIGludGVyZmFjZSBnZXRzIHRoaXMsIHRoZW4gaXQgd291bGQgbWFrZQo+PiBzZW5z
ZSBmb3Igc3VyZS4KPiBwdHJhY2UgaGFzIGFzIHNwZWNpYWwgaGFuZGxpbmcgZm9yIGFyY2hfcHJj
dGwuIFNvIHRvIHVubG9jayBmb3IgQ1JJVSAod2hlcmUKPiB1bmxvY2sgY2FtZSBmcm9tKSwgaXQg
bmVlZHMgdG8gZ28gdmlhIGFyY2hfcHJjdGwuIEkgd29uZGVyIHdoYXQgdGhlIG90aGVyIGFyY2gn
cwo+IHdpbGwgZG8gZm9yIHRoaXMuIElmIHdlIHVuaWZ5IHRoZSBBQkksIGl0IHNlZW1zIHRoZSBn
ZW5lcmljIG9uZSB0aGF0IGlzIGdldHRpbmcKPiBpbXBsZW1lbnRlZCBpbiB0aGlzIHNlcmllcyBp
cyBpbmNvbXBsZXRlLiBVbmxlc3MgdGhlIEFQSSB3aWxsIGJlIHNwbGl0IGFsd2F5cwo+IGJldHdl
ZW4gdGhlIHR3byBzeXNjYWxscy4KCldoZW4gdGhleSBhZGQgdW5sb2NrIHRvIHRoZSBnZW5lcmlj
IGludGVyZmFjZSwgdGhlbiB0aGF0IHdpbGwgYmUgdGhlIAp0aW1lIHRvIHJlY3RpZnkgdGhhdC4g
SnVzdCBsb29raW5nCnRocm91Z2ggcGF0Y2hlcyBhbmQgc3R1ZmYsIEkgdGhpbmsgdGhhdCBzaWRl
IGlzIHN0aWxsIGluIGZsaWdodCwgZWcgCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI2LzQvMy8x
NjUxLgpJdCBhbHNvIGxvb2tzIGxpa2UgdGhlIG1vZGVsIGlzIHNsaWdodGx5IGRpZmZlcmVudCwg
aW4gdGhhdCB0aGVyZSBpcyBhIAp3aW5kb3cgd2hlbiBhbGwgb2YgdGhpcyBzaG91bGQgYmUKaGFu
ZGxlZCwgYW5kIHRoZW4gbG9ja2VkIHBlcm1hbmVudGx5LiBJIGtub3cgb24gb3VyIHNpZGUgb2Yg
dGhlIGhvdXNlLCAKbG9ja2luZyBpc24ndCByZWFsbHkgYmVpbmcKdXNlZCB5ZXQuIEJ1dCB0aGF0
J3MgY3JpdSwgcmlnaHQgbm93LCB0aGUgbWFpbiB0aGluZ3MgSSB3b3VsZCBsaWtlIHRvIApjb2Fs
ZXNjZSBpcyBsaWJjJ3MuIEFzIE1VU0wgYW5kCm90aGVycyBnZXQgcGF0Y2hlcywgaXQgd291bGQg
YmUgbXVjaCBzaW1wbGVyIHRvIGhhdmUgb25lIGludGVyZmFjZSB0byBkbyAKdGhpcyBpbiwgYW5k
IHJpZ2h0IG5vdwp1bmxvY2sgaXMgdW51c2VkIChldmVuIGluIHRoZSB0ZXN0IHN1aXRlIDotcCku
CgpJbGwgc3BpbiBvdXQgYSB2MiB3aXRoIHRoZSBjb21tZW50cywgYnV0IHRoZSBvbmUgdGhpbmcg
bGVmdCB0byBiZSAKYWRkcmVzc2VkLCBhZmFpaywgaXMgdGhlIHRlc3RpbmcgcGF0Y2gKZG8geW91
IHdhbnQgdGhhdD8gSSdsbCBkcm9wIGl0LCBidXQgSSB0aGluayB0aGF0J3MgYSBiYWQgYXBwcm9h
Y2guCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
