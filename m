Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69E4C55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M6NbskW9P65gAhqNtTeUEFwZ4ABI3757uVlv78x80k=; b=c9ACQ5yYVPwJj26ZeHCNSFtK2K
	u44geJgf2NWrZsQ5yeYSblbO67/3vDPw6wRkPgtObzdq5PSwA77+p7Hf2fBvuMv8NgQB3Xljzwz4P
	M3L9dLxZA4ni/vcKyOFiQiPGhRLjXaJIJYA4Tt567x4+lf2ONWdPKJagkKNW/9BH37G1Mz391PEsJ
	uj2DVIwF/rKL5t8UFsPr6++1aQxzmDxUBhIhpfQqqBfAGLO2HFrI4s082CpsfGTRb9QFRsukVKeAl
	PO7KhvuX8D8uharlCU+yzrT/1sPO8GLowKXTdmS1zbe8aXg++DMIIthp2ZZp9XtkfvuKFP9OBdGV2
	MfgqhRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwgN-00000000G1v-0Uap;
	Mon, 03 Aug 2026 17:42:35 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwgJ-00000000G1F-0FoH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 17:42:33 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ghoWDUDyd3AjZID23vhJQWrUT64K6c4MeR1XjjWYFTfQH5zFTxoFnIzOpoVGlEEzDiNvyIAOElrj+ffEI0h93GpvhDvjNZiD5kfpBQf35BCi9G37vdbgWJclWx+75vNYZ2f5YcT0DBimpdKBHTKkiEgSfT+6q4ovrZ0+TZUrBtV9ozGkVYh0nBvUdKfCGBW26DFMHx7ARORwGh45dXh/cZe2XX39qJd8mL4QrAxaDPOYa1JxJxCYbwP56eI+YNTA/z7EFZObCNTvez6XN0Uwr+CJva5nhMne4UvFEgPdeMQEBnJX5zVXATrLt2R6YOqvtXeWHm5DblsBPHBtcCOGJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=hVAHiFD6blKlUTALyon2BJ1cOs5ef5BtR9Crw38RAoVaaRTxoM9ov+wdSi1eg9LaHyey4/OLPjZVoQubVd565hJIAyqU9ZK05cELzSwp12FJesHo8aPErqjsId6T8Dh0vD4+2P/ta44r7Yxv7r+relaJBAzK4Vqc1XRwdDqw2++GV3Ckgv3XKupIKbCuQlmvELR3Un02/pxMlJDznTTbBqdPJQpzARMSK+BKFokw0OqclL3MGs1pV4I7a0GT53y2urdBeiyT6XiNqNvr3OBhbhAYGesEEHgF5CagRghwt4SLI3hrWAx4FN17uIzddYid7we3zsBz1tFKf9JMpuqWLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=OY7E9xSIvGw3gvGbTArojdt/1etlIVYWWtXSyhCWW4oPddyb9BVKOrflBxgQmeWQSMcxviCJ+ePI9Qptcsu4pugy8+YtdIN/+nYTaFTPFIe2uYSnA5duMnmXW1etuwg3mJWzbeKPdBjz91qdw9J/thUhEz3zr8e7t4vtLOJDBcE=
Received: from DUZPR01CA0308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::19) by AS4PR08MB7578.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 17:42:17 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::aa) by DUZPR01CA0308.outlook.office365.com
 (2603:10a6:10:4ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 17:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 17:42:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkZq4PFjpnOQkj6+NiwH0Daa4NmYhAavjmmW+5aQCdvdupbcdKwqEAlrTNOcX+O6qfR286SptaH2nOplv3apHwWJnPsDgtU+fZuyHI5nxu9geT56trIxhjLIPyVtPuhzx+Ua+jfeMEl0yJ1EsY1mHnFMTJ+R6WIL8Q90Hc3SP6SGbJe4r3zOD/I/KL9sQ0Z5RcbxMbv5SJxXMfwlzR0oMhUzVresT1A8aet9P2UVpcCDfu0xenOnm/WI9B7kXDA77OfIcifN/ViXpPZWHHGHQaZ0hKnXbrrDUPkx1CMZ10BKsAHR4Wp1I6h97/vyZBtxKecJOuvbQrMdDHaISV4oVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=B4XhXCSNRZEItgFuXanAmdPX8/I9MlhT0Dr9JSIJKhHCEpZdvCNEwIUxw/VvvsJQezo9HeKsi2bpXhClBPH1ESRx0OxC7O43BeC3c6O/gIPRlppZh84jJ6F4Cgtwvc86eBdwqEjiUhxHJB1nlhJR6SF+qRDUgglaA60+eTrixELfLzeYByIVI6sQTdkRBM7R9+xmFanwxOlKlrSQtuhbXaYqHyReQW9dGlu8nR4opQw39GButZQPGMqbqEmfOAEMIykN7jWgfFJdqzBXHPJiOMgjih79l/OiATtyAnBRGLZn8Om04j88eskWmfk/QJl6euGvx6MXNbelizf8/w0imQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7YyT3mms/ACJvVoNWMzPdsBLRs0R6qfciAASpqRTV0=;
 b=OY7E9xSIvGw3gvGbTArojdt/1etlIVYWWtXSyhCWW4oPddyb9BVKOrflBxgQmeWQSMcxviCJ+ePI9Qptcsu4pugy8+YtdIN/+nYTaFTPFIe2uYSnA5duMnmXW1etuwg3mJWzbeKPdBjz91qdw9J/thUhEz3zr8e7t4vtLOJDBcE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by AS8PR08MB9814.eurprd08.prod.outlook.com (2603:10a6:20b:615::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 17:41:43 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 17:41:42 +0000
Message-ID: <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
Date: Mon, 3 Aug 2026 12:41:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "pjw@kernel.org" <pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "mingo@redhat.com" <mingo@redhat.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260714154740.140431-1-bill.roberts@arm.com>
 <20260714154740.140431-2-bill.roberts@arm.com>
 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
X-ClientProxiedBy: PH2PEPF0000384D.namprd17.prod.outlook.com
 (2603:10b6:518:1::6e) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB9829:EE_|AS8PR08MB9814:EE_|DB5PEPF00014B88:EE_|AS4PR08MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: a64a7825-929c-46dd-2a7c-08def1868f93
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info-Original: BeqYaUvwl2otg4LBYefHYvI4FZ4Gwp+IC6ZLx38BZxB9TUR4ma+7BtogYVQcsZgn49hTBem+FgwplMeCA38o0/0r5LEmynRDHnb4wDXSCZtoeQzADP1qzqcLckm1mVkz4aRufo5y/cT+L8DZkerGxDEBQsBVWBKlCCWCw0wp+LvS3k58tI4vF2OcA7CPDP2JABZfzbe+Xf53k+L9GoWr5Xv+srFXdGkj4DWnbFcRiYW6qCzbvOlqyswcdF41VoZOg1SYQ63b5Kp7cuYi92MgniotCXuM5WPYE3dM6f18Q3u4WDohbTwbujuJT1Zf1cWem2VFQvKVJZzbIMINApTA6xiWZFCuzzLzRqpcGZqV00/5LsZ6iVHsIDN+p4/y6LJp4BO5ujNWCf4cjZsg9mkWHNzD1H3z1dIJIrOkwJMzG9AhpiSNiwXGyIbzb9qZxFf4dFPEivzH8yHh/IEFfRNysL7EiMXFvKJxyitWHvppVVCx4bI1UjptqXZAGAMfe/KH3ydw5E9NufZopGT4fRdlO0Hu7RvoZjHK9Zap/cEUfQz3GpHQpivc+RKV3q47Xk8+WFaRs1FUwX8yiFAFnOIEPt2GoIEfkPQQYLfczZYJhqC1q9i6junKPleUnmJogdY5XLDt3ZTPsL6JCsw14z5hF8fwZCWn1bQEcNEvnvK9kAg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: OuSYZTFD0WMG+bO/u12oW296fHhxv+RO2IKTZAmf8NaGQi1h8mweVxXcZtKzmLhMVnbwY9tvdtequOL9Fdk2kjoXntha8ORH1FURosQn8haddbCbsdNnQKA/yM5l2MhRlNlT8lh2CXXyfGGwMmuGtz/Rh7rMAGInbFVgzs/umcrQ1sV5dUv6rsZw3tDngxxx5SGgsxZPcof0hjbyKWRtC6YpjVLcfFyUqt4vrp6cYp1nPFTwEm1VPujfMlqIgKnHm0q3I4W1aN9hWjuNQbN8hb5HSq409nhnxmaSM2FXQR2hwq/koh2VxxZ0Iir7wLcdFUmR0TSd9m5UI/UVRJtFxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9814
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 16d9d83f-4e4c-4799-a8c6-08def1867b0a
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|376014|82310400026|14060799003|35042699022|13003099007|921020|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ILaOovfYFC6cBulZYbR8XYWgJ3c/xmWJGY3zsFYhubatoaH0DgCupaC8I7oW22VZl2aHxhTFL5GX+4I4ZWRNKBookyi3Yd6LsM0XYbwQn5AyCeZ7x2TQg0EiI44cFk8xGNeyD3YBNtWShn/07dX3npoRN8x/8ufe+4BQhmVAIUvjeNtlASoVdqo9zRW6sbxmePIERFpQYgpDPTZV8moWfgQShpunukchRogJ2swg5o93ipgcfRCzf51MXcrsg+N2DCMHc9W7bfQEzf9vo7xIceKz7n7QEkl1TSvFVnQN1XkIntLcViztPnVVVHM/JwJNELy/S1yIbQ8PtdbK6GVIAVcoykbMpZHI1Odt0+zgrLP+rreRxyQSYoKr9mJs/iVERXscxCrA64YbrSwNDkhCBnauFW/kYXGUGSJEUWd3W5HptifuhU/10iDJqZOxqHp9jKhmrCxCGx2hhmXCZY3VJXYJ/rmYMc1EmNnsCbHe8M+2hZ9PbwP6SaE5Rq3OVwtUMsnKHlp7DXn0mFqCvU47am+LFEzuY5zbuuW1pnEArlzSC7KWjz5uOAtHMAjj/cMk5LAPuTZ9M6FO586X9ZiNJEL13MmB1s0ZUQL2mAqYtOGrvt7+OGGbkqNO3QRBpjIO6w/FY1Rl3qZYsxSGec4LUtWZNZ4WQvji/ozfpPKR0Ld1jXxioqCOk9FtPsyxhPb3EW/03nh0kM+Kc/LuRVsUrw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(13003099007)(921020)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9bTG2OaXtvU7aOxflTqWMwKhwWGNRt3HMEHY+fby3BdsnyF9v5z9ENVXzB1C8dQr0EETlr0SuivfqMPrkSvSWooqxTE8d3v3gYv3cGFHvJS+h7tT887PSQGpYMzh1Mn6GoTePzmTOhok1Js4Xxw88aGKOprdNxc2r/ClkyGvgGSCOeBFqXEEPNmfHMKlGVAMoD+Lh0vzQcKOBfmjIAOjLEXZnD3NqLyHTt+AFDN7O83eu7wOsRAF62I85bnuqwa8LCR626wEB9zT2TbTt/0MoXVo4dsO0BhhL80Pvs6KRfs7MtmvIiysLL/NiIiauP507bDVY+jp5VYYCpGnb5EfcJoRi6qT98MjF+v1f0Uw7VrGwHLeWPfUKwGNkcBzAyB59hX/dr6LIvn1z/stJtQZhiqIpWNITSKemg9TdUvvFW5GDgAo++uFLOu8yrhs92Hr
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 17:42:16.7568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64a7825-929c-46dd-2a7c-08def1868f93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_104231_371757_CC86E719 
X-CRM114-Status: GOOD (  28.44  )
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

Ck9uIDcvMjkvMjYgODoyOSBBTSwgRWRnZWNvbWJlLCBSaWNrIFAgd3JvdGU6Cj4gT24gVHVlLCAy
MDI2LTA3LTE0IGF0IDEwOjQ3IC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6Cj4+IEhpc3Rvcmlj
YWxseSwgbWFuYWdpbmcgdGhlIHVzZXItc3BhY2Ugc2hhZG93IHN0YWNrIHN0YXRlIG9uIHg4NiBo
YXMKPj4gYmVlbiBoYW5kbGVkIGV4Y2x1c2l2ZWx5IHRocm91Z2ggdGhlIGFyY2hfcHJjdGwoKSBp
bnRlcmZhY2UgdmlhIHRoZQo+PiBBUkNIX1NIU1RLXyogb3BlcmF0aW9ucy4gSG93ZXZlciwgb3Ro
ZXIgYXJjaGl0ZWN0dXJlcyAoc3VjaCBhcyBhcm02NCBhbmQKPj4gcmlzY3YpIGRvIG5vdCBpbXBs
ZW1lbnQgYXJjaF9wcmN0bCgpIGFuZCBpbnN0ZWFkIHV0aWxpemUgdGhlIG5ld2VyLAo+PiBhcmNo
LWFnbm9zdGljLCBwcmN0bCgpIGludGVyZmFjZSAoaS5lLiBQUl9HRVRfU0hBRE9XX1NUQUNLX1NU
QVRVUyBhbmQKPj4gUFJfU0VUX1NIQURPV19TVEFDS19TVEFUVVMpLgo+Pgo+PiBUbyBwcm92aWRl
IGxhbmd1YWdlIHJ1bnRpbWVzLCB0b29sY2hhaW5zLCBhbmQgbGliYyBpbXBsZW1lbnRhdGlvbnMg
d2l0aCBhCj4+IGNvbnNpc3RlbnQsIGNyb3NzLWFyY2hpdGVjdHVyZSBpbnRlcmZhY2UgZm9yIG1h
bmFnaW5nIGNvbnRyb2wtZmxvdwo+PiBpbnRlZ3JpdHksIHdpcmUgdXAgdGhlIGdlbmVyaWMgc2hh
ZG93IHN0YWNrIHByY3RsIGhhbmRsZXJzIGZvciB4ODYuCj4gSSB0aGluayBnbGliYyBkb2Vzbid0
IGhhbmRsZXMgdGhpcyBpbiBhcmNoIGNvZGUsIHJpZ2h0PwoKRGlkIHlvdSBtZWFuICJJIHRoaW5r
IGdsaWJjIGRvZXMgaGFuZGxlIHRoaXMgaW4gYXJjaCBjb2RlLCByaWdodD8iLiBJZiAKc28sIHll
cywgZ2xpYmMgaGFuZGxlcyB0aGlzIGluIGFyY2gKY29kZS4gSXQgd291bGQgYmUgbmljZSBpZiBj
b3VsZCBhbHNvIG1lcmdlIHRoaXMgZm9yIGFsbCBhcmNoaXRlY3R1cmVzIGluIAp0aGUgZnV0dXJl
LgoKPiBTbyB0aGUgcG9pbnQgb2YgdGhpcyBpcwo+IG9ubHkgeW91ciBTRSBMaW51eCBwYXRjaGVz
LiBPciBpcyB0aGVyZSBvdGhlciBjcm9zcy1hcmNoIGNvZGUgdGhhdCB3YW50cyB0bwo+IGhhbmRs
ZSBzaGFkb3cgc3RhY2s/Cj4KPiBCVFcsIGZvciBub24gc2VjdXJpdHkgbW9kdWxlIHBlb3BsZSwg
Y2FuIHlvdSBleHBsYWluIHdoeSBpdCBuZWVkcyB0aGlzIGRlc2lnbj8KClllcyB3aWxsIGFkZCB0
aGlzIHRvIHRoZSBjb21taXQgbWVzc2FnZSBmb3IgdjIuIEJ1dCBhcyB5b3Uga25vdywgdGhlIApn
aXN0IHdvdWxkIGJlLAppZiB3ZSBsb2NrIHRoZSBmcm9udCBkb29yIG9mIHRoZSBob3VzZSwgd2Ug
c2hvdWxkIGxvY2sgdGhlIGJhY2sgZG9vciB0b28gCm9yIHRoZSBsb2NrCmlzIHVzZWxlc3MuCgo+
Cj4+IE1hcCB0aGUgZ2VuZXJpYyBQUl9TSEFET1dfU1RBQ0tfRU5BQkxFLCBQUl9TSEFET1dfU1RB
Q0tfRElTQUJMRSwgYW5kCj4+IFBSX1NIQURPV19TVEFDS19MT0NLIG9wZXJhdGlvbnMgb250byB0
aGUgdW5kZXJseWluZyB4ODYgaW50ZXJuYWwgQ0VUIGhlbHBlcgo+PiByb3V0aW5lcy4gVGhpcyBh
bGxvd3MgcG9ydGFibGUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyB0byB0b2dnbGUgb3IgcXVlcnkK
Pj4gc2hhZG93IHN0YWNrIHN0YXRlcyB3aXRob3V0IHJlbHlpbmcgb24gYXJjaGl0ZWN0dXJlLXNw
ZWNpZmljIHN5c3RlbSBjYWxscywKPj4gd2hpbGUgbWFpbnRhaW5pbmcgYmFja3dhcmQgY29tcGF0
aWJpbGl0eSB3aXRoIGV4aXN0aW5nIGFyY2hfcHJjdGwoKSBjYWxscy4KPiBDYW4geW91IGV4cGxh
aW4gd2h5IG5vdCB0byBpbmNsdWRlIEFSQ0hfU0hTVEtfVU5MT0NLPwo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvZTEzNjI3MzJiYTg2OTkwYjc3MDdkM2Y1Yjc4NTM1OGI3N2M1Zjg5Ni5j
YW1lbEBpbnRlbC5jb20KIEZyb20gd2hhdCBJIGNhbiB0ZWxsLCB0aGVyZSBpcyBubyBhbmFsb2dv
dXMgb3BlcmF0aW9uIGluIHRoZSBjb21tb24gCmZsb3csIHlvdSBsb2NrIHRoZSB0aHJlYWQgZmVh
dHVyZXMsIGFuZAp0aGUgZmVhdHVyZXMgYXJlIGxvY2tlZCBpbiBwZXJwZXR1aXR5IGZvciB0aGUg
dGhyZWFkLiBJZiB5b3UgbmVlZCBmbHVpZCAKY2hhbmdlcyB0byB0aGVzZSBiaXRzLCB5b3UganVz
dCBkb24ndCBsb2NrCml0LiBJZiBpbiB0aGUgZnV0dXJlIHRoZSBnZW5lcmljIGludGVyZmFjZSBn
ZXRzIHRoaXMsIHRoZW4gaXQgd291bGQgbWFrZSAKc2Vuc2UgZm9yIHN1cmUuCj4KPj4gU2lnbmVk
LW9mZi1ieTogQmlsbCBSb2JlcnRzIDxiaWxsLnJvYmVydHNAYXJtLmNvbT4KPj4gLS0tCj4+ICDC
oGFyY2gveDg2L2tlcm5lbC9zaHN0ay5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gIMKgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9zaHN0ay5jIGIvYXJjaC94ODYva2VybmVsL3Noc3Rr
LmMKPj4gaW5kZXggMGNhNjQ5MDAxOTJmLi5lZjNkYjk0ZWVjNmEgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gveDg2L2tlcm5lbC9zaHN0ay5jCj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9zaHN0ay5jCj4+
IEBAIC0xOCw2ICsxOCw3IEBACj4+ICDCoCNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgo+PiAgwqAj
aW5jbHVkZSA8bGludXgvdXNlci5oPgo+PiAgwqAjaW5jbHVkZSA8bGludXgvc3lzY2FsbHMuaD4K
Pj4gKyNpbmNsdWRlIDxsaW51eC9wcmN0bC5oPgo+PiAgwqAjaW5jbHVkZSA8YXNtL21zci5oPgo+
PiAgwqAjaW5jbHVkZSA8YXNtL2ZwdS94c3RhdGUuaD4KPj4gIMKgI2luY2x1ZGUgPGFzbS9mcHUv
dHlwZXMuaD4KPj4gQEAgLTYzMCwzICs2MzEsMzcgQEAgYm9vbCBzaHN0a19pc19lbmFibGVkKHZv
aWQpCj4+ICDCoHsKPj4gIMKgCXJldHVybiBmZWF0dXJlc19lbmFibGVkKEFSQ0hfU0hTVEtfU0hT
VEspOwo+PiAgwqB9Cj4+ICsKPj4gKy8qIFdlIGFzc3VtZSB0aGUgcHJjdGwoKSBmZWF0dXJlIGJp
dHMgbGluZSB1cCB3aXRoIHRoZSBhcmNoX3ByY3RsKCkgc3BlY2lmaWMKPj4gb25lcy4gKi8KPj4g
K3N0YXRpY19hc3NlcnQoUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSA9PSBBUkNIX1NIU1RLX1NIU1RL
KTsKPj4gK3N0YXRpY19hc3NlcnQoUFJfU0hBRE9XX1NUQUNLX1dSSVRFwqAgPT0gQVJDSF9TSFNU
S19XUlNTKTsKPiBUaGlzIGlzIG9ubHkgbmVlZGVkIGZvciBhcmNoX2dldF9zaGFkb3dfc3RhY2tf
c3RhdHVzKCk/IFNvIGNhbiB3ZSBwdXQgaXQgbmVhciBieQo+IGFuZCBleHBsYWluIHdoeT8KPgo+
PiArCj4+ICsvKiBIYW5kbGVzIHRoZSBnZW5lcmljIHByY3RsIGludGVyZmFjZSBmb3IgUFJfU0VU
X1NIQURPV19TVEFDS19TVEFUVVMgYW5kIGl0cwo+PiBmZWF0dXJlIGJpdHMgKi8KPj4gK2ludCBh
cmNoX3NldF9zaGFkb3dfc3RhY2tfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWdu
ZWQgbG9uZyBzdGF0dXMpCj4+ICt7Cj4+ICsJaW50IHJjOwo+IEl0IG5lZWRzIHRvIHJlamVjdCBp
bnZhbGlkIG9wdGlvbnMgZm9yIHN0YXR1cy4KPgo+PiArCj4+ICsJLyogeDg2IGFyY2hfcHJjdGwg
aXMgc2luZ2xlIGJpdCBhdCBhIHRpbWUsIHNvIGhhbmRsZSB0aGVzZSBvbmUgYXQKPj4gdGltZSAq
Lwo+PiArCWlmICghc3RhdHVzICYgUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSkKPj4gKwkJcmV0dXJu
IHNoc3RrX3ByY3RsKHQsIEFSQ0hfU0hTVEtfRElTQUJMRSwgQVJDSF9TSFNUS19TSFNUSyk7Cj4+
ICsKPj4gKwlyYyA9IHNoc3RrX3ByY3RsKHQsIEFSQ0hfU0hTVEtfRU5BQkxFLCBBUkNIX1NIU1RL
X1NIU1RLKTsKPj4gKwlpZiAocmMpCj4+ICsJCXJldHVybiByYzsKPj4gKwo+PiArCWlmIChzdGF0
dXMgJiBQUl9TSEFET1dfU1RBQ0tfV1JJVEUpCj4+ICsJCXJldHVybiBzaHN0a19wcmN0bCh0LCBB
UkNIX1NIU1RLX0VOQUJMRSwgQVJDSF9TSFNUS19XUlNTKTsKPj4gKwo+PiArCXJldHVybiBzaHN0
a19wcmN0bCh0LCBBUkNIX1NIU1RLX0RJU0FCTEUsIEFSQ0hfU0hTVEtfV1JTUyk7Cj4+ICt9Cj4+
ICsKPj4gKy8qIEhhbmRsZXMgdGhlIGdlbmVyaWMgcHJjdGwgaW50ZXJmYWNlIGZvciBQUl9MT0NL
X1NIQURPV19TVEFDS19TVEFUVVMgYW5kCj4+IGl0cyBmZWF0dXJlIGJpdHMgKi8KPj4gK2ludCBh
cmNoX2xvY2tfc2hhZG93X3N0YWNrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2ln
bmVkIGxvbmcKPj4gc3RhdHVzKQo+PiArewo+PiArCXJldHVybiBzaHN0a19wcmN0bCh0LCBBUkNI
X1NIU1RLX0xPQ0ssIHN0YXR1cyk7Cj4+ICt9Cj4+ICsKPj4gK2ludCBhcmNoX2dldF9zaGFkb3df
c3RhY2tfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQgbG9uZyBfX3VzZXIK
Pj4gKnN0YXR1cykKPj4gK3sKPj4gKwlyZXR1cm4gc2hzdGtfcHJjdGwodCwgQVJDSF9TSFNUS19T
VEFUVVMsICh1bnNpZ25lZCBsb25nKXN0YXR1cyk7Cj4+ICt9CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
