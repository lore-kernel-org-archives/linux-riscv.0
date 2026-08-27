Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE1C61DB9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 17:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1dDGWW1XOltMj8rUfLgiMBlDRGyKoHbw9DxpJgOcxO0=; b=idjM+MGB2ALO59bQgpprxHrCBg
	SKq/wdCTCj4cJzZ94OlG26/FlxprSE4VWJzUy5LzRm7N4LW5jLL8I/hj9f+/XC0I5/XmmGdC0cT0Y
	44736dnL37NV94FeHWyhYLwuLUNlv8XSZ4Qy06n45HDRRDhfzyWAOthTZoOTbdLa/RrCmPe89YlwU
	KLOY4gpaJQmCB2bnEmCawAmVSxNorscTkF2nDU3wysNT324vVJLb3xEcqa8d/miiULbpjR3Jnkdg1
	fRTp68bAcAsY0vQMyYD8R4mahJsXv4C8fdfv7wY0S9mSy+z6UhfPosjPeEeHkoZq+jOBH8U0TXJ5U
	Be7KF3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdiQ-00000004RSy-2TAB;
	Thu, 27 Aug 2026 17:16:38 +0000
Received: from mail-northeuropeazon11010000.outbound.protection.outlook.com ([52.101.84.0] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdiM-00000004RRh-2aIN;
	Thu, 27 Aug 2026 17:16:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a/IAtq13G5k56zbhtb+p9iPCqqus83j3eqhpjbfR+CPAwSybQYpV1TdNUq3Ulyl3qhWU9nWU6eR+TXm4BhOl+o8PjKn6BZVn0GlKj8Ke5+/UW57tjwjBPPiw62hhnIq817L8i34pfvBHM3if0a/ErOW7fZUXTTn8JiviI2mirJzQ1q6cw49F0jkt/3KiPhD+7A5WOZCnw2ikxbiKvuQdDzsY4skiCP4hwbJE99kqbFxfNLy8hEm7CzB8JqmzpICXNb471fFZ0jGw6B2wP9MtLcX9RaxNbrRcjNPYNr5w187Mvtml1upTGngVU+wYfcF/TjpGCG+0Hz9qnUdzO2j2qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qo4B0YotpOd/gH5Ae4pR1kf0CJUniJlPcUYNGObA/XQ=;
 b=xd6sKFLzoKNMdpdKi/+MhxGAooBgM0OpcbdLDkX1L4PVZ5MTDLB9NpdbjZvRTgPW1bExrZwQoutspMxng9z0Q3KEH4Z5HnM9XjRYNzWV4Uktgj3/JHBRY/tNifL3R9P9ZASyBgzc5X12TM+hnmXHJbuKHcemmcv78FvJmykaBca8EWVc+RYp7ULdqXVUk7oMxtT4jRHtLuike7gTPoljZRVoEHKR5AM0lb7nF84Oo7eVaP+8MRl/7DahNP0Ok/wUmnGEBIddEm0CZ4oa4Zt4WvKQRnKGj6P8+ikgiXg4SuvxZ31hQZ7uk9us5j0l/t5xaSCPqSKZBfqaJjowSiNWmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qo4B0YotpOd/gH5Ae4pR1kf0CJUniJlPcUYNGObA/XQ=;
 b=d3Q7jIP0LPBv5tryDESE/yfayJ54/1T0Z2DWpkX3RuK1A4dLyRU7ZmNKnLNAdjiOVycfcpwkbdC9TL84rZ+zzGkNvBmwuL1DgElk3ln7xdzhahJh0iB0eWYxxAUWYWtfruTAeRoT83n1RhfSh1d19wbs+Ej4L4MqwSYP5cap5j8=
Received: from AM9P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::19)
 by PAVPR08MB9481.eurprd08.prod.outlook.com (2603:10a6:102:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Thu, 27 Aug
 2026 17:16:25 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:20b:21e:cafe::9d) by AM9P193CA0014.outlook.office365.com
 (2603:10a6:20b:21e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 17:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Thu, 27 Aug 2026 17:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hw1UN12zt+XPuvsOzZpK3Cv1BhIp9Q3BDpNN0UY+/fo8+yXnfEpRPQZy5QeaPUiiPqzrwgjFurplnmXE5aVv0i2T0krRNhmEo57mLmDP+howQbkAFhJxE2zyvAnTgK3K7rsAiEebt1bUMxF7pRmua+xORAYaElP4PNugBkfym497yebLlLzoK+9D7G9nGZ4IHw0HE4XmeECX63Fq9Dgkc/geDu6J2oJyVBfP6bir4DoI+vYK9mjfdoHgW82SDXfRD+vn9whvrO1eP3lp9806DkCkL9WSrAz5M/vs4FiNwYsx2nDTPkNNKSYBY+m66ptxhcDGZ+Cjfcq4kYhRTV2Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qo4B0YotpOd/gH5Ae4pR1kf0CJUniJlPcUYNGObA/XQ=;
 b=IPl6JSnIbu2mC6g95BltkIDoo0gInVkNdiuFcNMEaR2cTF8X+2a6rROgmXyLl0lD4JtCtx3Mk+mo+LDpd7/Txcv9u5QSs44DDgy+IKrb55PlcS6CNmAW1SUIYcjN5MNK+79spXL0Elf5q1q+4zPFyCQGeEXgWeYgukpSWqEStQj8htG+8U52wbxxuqczwsLzER5sIeDwN/jWoKcNfsGiB8oC4EYlKEjJyd6bW0bZuiTGKUtLdnROftXkmvpXFLslCONauPcnlPjiPeeBIgsKnzRDyOHDApoTJ2lkj/eV8Wk14VdKZUe6h6ue0fwEYs1UZscJgSpbASRooc3aSlFW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qo4B0YotpOd/gH5Ae4pR1kf0CJUniJlPcUYNGObA/XQ=;
 b=d3Q7jIP0LPBv5tryDESE/yfayJ54/1T0Z2DWpkX3RuK1A4dLyRU7ZmNKnLNAdjiOVycfcpwkbdC9TL84rZ+zzGkNvBmwuL1DgElk3ln7xdzhahJh0iB0eWYxxAUWYWtfruTAeRoT83n1RhfSh1d19wbs+Ej4L4MqwSYP5cap5j8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by AS2PR08MB8456.eurprd08.prod.outlook.com (2603:10a6:20b:55c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Thu, 27 Aug
 2026 17:15:53 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%6]) with mapi id 15.21.0382.005; Thu, 27 Aug 2026
 17:15:52 +0000
Message-ID: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
Date: Thu, 27 Aug 2026 12:15:47 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org
Cc: dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com,
 Mark Brown <mark.brown@arm.com>, debug@rivosinc.com
From: Bill Roberts <bill.roberts@arm.com>
Subject: Shadow Stack Locking Semantics between arch's
X-ClientProxiedBy: DM6PR07CA0127.namprd07.prod.outlook.com
 (2603:10b6:5:330::28) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB9829:EE_|AS2PR08MB8456:EE_|DB1PEPF000509F3:EE_|PAVPR08MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1bc26b-5d47-42b4-6bb0-08df045eecb3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 8mhlwXgR3NRzNZ7nxA+px0cCwSgnQrxnYIneOYaeZNove/9/nqUZjEaxnzaFwa8OG6Ir4WE3GkduBpH987BUHyQvqROEPIiFeVknEBUHzh2NCJQWTTBjGUUnX26vIxys35Jwha3tru6iN0rgz1XqD4Hjgt3wWMr0ZjRg+x4X+nQEtiUfWhKZNhH9PLYuLBWtgF/5tAaxeyaWvHT3OyUmxcFUvCQ9rCF2DbIl9PbxfLkcPeDWfqeHGJ/5QiRcirwYUEL3SHKYZjPK486t2tBiGz83HjxVcm4xe9El2CwhXkwVudMgPEF/uBBFOUhpYv4xzzEuyPbFlSos0juopy9hypPj4rIEFwHT+NGXPw22en+Og8lpqOVwT2Bv+H4A4bgTARR8mcxpVTgrMnANpmK1JEXBLw7OD2vEkFFqiuROIz+xAciZaoCj37miZdZ6UQquyi735N6OAQ0r+rZovUDPpNJv0CulAt2u8yyDeSrdzsJDcy6yEvTVkjF2sxZtP3vTnsoIYOLW2lUa3Vst5na8pQDlEe4o5y+uU1nmhtUuJrZF/awRz+9Pj/3w5I/xHYF9pL4V/Q4hiWts5AwCkXU51sep2hXkclOuKTvqFUdZgBbt6gVcmR+qsdohBQhkjdOqLvd3IipHhUxax//xGXmUZvScQmh1kctu/aBVTpi2DGc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: gFqk++jddEBbmrejfl65nVNKvlZvPhKQoSVPBQT66lHg8lDYBPBnHbVnyCO6ky9pPKzGMc6lVhpOdvAhZ8sbNkbqfqgy5i1yXyd2EDzh2Ns43qg7vxHBbohBxuscNKgLpIdpgmG1lF4xk6j3bCxT7whVg0oQBfeqvihb/wKenC9m6wg7IiJaIj91hHy0wGFz/ZSXpvLaHQib7mhzK24NIyOZSNECuTRdBwmFuBIWLAQGDG2HvLCtE3UanZdB6grEn24cFsm8aMZkpuUVa7D3cpicS5srp/hL3lFOSZL9B5xdS4O9YoYC5W8DRiQ01HVlmhpRMnTtMi22n0B96W2oIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8456
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66c46398-0f76-4e2f-a24c-08df045ed8c3
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|35042699022|36860700016|14060799003|376014|82310400026|10067099003|56012099006|11063799006|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info: k2ipGqGgP94bI8X7fOXWmUkYpHj2ozQGXjcv2+D0pbzyt1xCVLYXJG+CivN24HCY4rhXRrSUlvqEMqxTLyF0j7cAANSA+BVdHQ5lR/b/NS7qcbAvZC+qZ21GlwW1hrA8bnguwA2TbJU7ktf9Umw7HvY4AeY70HfoOTfkJSlBUt0bQkRx7K60xULC/jVjMwL/S5wHEIEB9Qh4vCSbAl38KU9x+ooaIpoyIs1Kvd/P/uLnuokRJwFegHTqmp0VlNH/ThnILd+yoEic/2KgYWJoA1maVY0nvUFJ+R3TMFCbcFHfYvOeNI+CDV/p1SugJkdw7WHagY2/ix/xusLXaJxFMcH6DFpO4eLHB5sp1XL6qaNORywgQQ39NgB6CE6RkZHn+RipETQqUp7qYzYTAoScqZRDohAb6aq6jM/uttzO16aDQNaAq5iu/deZdLsE0u2I//6TTttdRPK5/Z3/QX0EmAfzBSFp58Kfy+wj7HGA4gUDVZSYg73NP9g6rlg1oShFoDH0qfM/IzMYT2bKrX59XfDp/iLcIDpcJIUR0NQFYIVXVrgKZiFIZbWps+5Hbv4lDFM6cm62/DMmVPmn1R9zVLe3AZZCiydOf7nxS3B8hKuOQ6j/Ge0T+Y90IjbOmqi/S5GnWmWzorfsnZVfDCRkvsNNreJbzx0pmY56G8A4hYcQemRvmUHvOvvnYJcPKPbJvyza4TsJI42GIuy34tKPLA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(35042699022)(36860700016)(14060799003)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iCIGMUWlJrHoKwV9rUVH9cxCWNn9/e7xJJr5OM9Gwr6dgg0AoGmXfcgL+pEdX+EmPSsXZ9q+/hL7SMONRuXJHH73cvBt2rgo5Wfl1AUBqeWAHMUHW0fkhZcGp1M+icxbzgZx6OZYccAWerJbwevRjLu0KPyk+/xyfzSIFi1efSfXZTYpRfeBrk9jQKvNQzsPnYFmW+wegn9CRT9hELNiEalxbMJkn3ElLkAE3kzBbELHqbyVDWBv1dOYSHvqmHMWTx8KgHnQn5aK3ipELnChLyDiJ0hWuGKNku2eYU96WXxdzBxbMRZ5i+35ytaJ1o8v+nWh9tgQepz6xBuwF72+k4uEBspE2DeCraVLQup6I+9baolTbw/JqU8VLdKKSkrucB6QhFHnC1kY/ZXKR1igFVxnmxslxp3TL/i33NX1Kxw/tKCRGDlP7NkdO0GFfN7K
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:16:25.3509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1bc26b-5d47-42b4-6bb0-08df045eecb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_101634_753017_BB3510FA 
X-CRM114-Status: GOOD (  12.70  )
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

SG93ZHkgZm9sa3MsCgpJZiB5b3UgaGF2ZW4ndCBzZWVuLCBJIGhhdmUgYmVlbiBmbG9hdGluZyBz
b21lIHBhdGNoZXMgdG8gYnJpbmcgeDg2LTY0IApzaGFkb3cgc3RhY2sgY29udHJvbHMgb3ZlciB0
byBwcmN0bCwgYW5kIGl0J3MgZ2VuZXJhbGx5IHN0cmFpZ2h0IGZvcndhcmQuClRoZSBsYXJnZXIg
bW90aXZhdGlvbiwgaXMgdGhhdCBJIGFtIGRvaW5nIGFsbCBvZiB0aGlzIHNvIHdlIGNhbiBwbGFj
ZSAKTFNNIGNvbnRyb2xzIG9uIHNoYWRvdyBzdGFjayBtYW5pcHVsYXRpb25zLiBGb3IgeDg2IHdp
bGwgd2UgbmVlZCB0byBob29rCnRoZSBvbGQgYW5kIG5ldyBpbXBsZW1lbnRhdGlvbnMuCgpJIGhh
dmUgbm90aWNlZCBzb21lIHNlbWFudGljIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIGFyY2hlcy4g
R2l2ZW4gdGhpcyAKZXhhbXBsZSBvZiBjdXJyZW50IHRocmVhZCBzdGF0ZSwgY3VycmVudCB0aHJl
YWQgbG9ja2luZyBzdGF0ZSBhbmQgdGhlCm5ldyBmZWF0dXJlcyByZXF1ZXN0ZWQsIGFzIHNob3du
IGJlbG93OgoKdW5zaWduZWQgbG9uZyBsb2NrZWQgPSAweDI7IC8vIEtlcm5lbCBUYXNrIFN0YXRl
IC0+IExPQ0sgV1JJVEUKdW5zaWduZWQgbG9uZyBjdXJfdmFsID0gMHgzOyAvLyBLZXJuZWwgVGFz
ayBTdGF0ZSAtPiBXUklURSBhbmQgClNIQURPV1NUQUNLIEVOQUJMRUQKdW5zaWduZWQgbG9uZyBu
ZXdfdmFsID0gMHgwOyAvLyBVc2Vyc3BhY2UgRmVhdHVyZSBDaGFuZ2UgdmlhIHN5c2NhbGwgLT4g
CkRJU0FCTEUKCnwgeDg2LTY0IHwgcmlzYy12IHwgYXJtNjQgfAp8IC0tLS0tLS0tLS0gfCAtLS0t
LS0tLSB8IC0tLS0tLS0tLSB8CnwgV29ya3PCoCB8IEZhaWxzwqAgfCBGYWlsc8KgIMKgIMKgfAoK
QmVzaWRlcyB0aGUgbG9ja2luZyBkaWZmZXJlbmNlLCBJIGhhdmUgYWxzbyBub3RpY2VkIGEgZmV3
IG90aGVyIGlzc3VlcyAKbm90ZWQgYmVsb3c6CgpSaXNjLXY6Ci0gc2hvdWxkbid0IHJlamVjdCBh
bGwgYml0cyBpbiBsb2NraW5nLCBpdCBzdXBwb3J0cyBzaGFkb3cgc3RhY2suCi0gc2hvdWxkbid0
IHJldHVybiBFSU5WQUwgb24gbG9ja2luZyBjaGVja3MKClNlZSB0aGUgY29kZSBzbmlwcGV0cyBm
b3IgdGhlc2UgYmVsb3c6CgppZiAoaXNfc2hzdGtfbG9ja2VkKHQpKQogwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmV0dXJuIC1FSU5WQUw7CgppbnQgYXJjaF9sb2NrX3NoYWRvd19zdGFja19zdGF0
dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdW5zaWduZWQgbG9uZyBhcmcpCnsKIMKgIMKgIMKgIMKg
IC8qIElmIHNodHN0ayBub3Qgc3VwcG9ydGVkIG9yIG5vdCBlbmFibGVkIG9uIHRhc2ssIG5vdGhp
bmcgdG8gCmxvY2sgaGVyZSAqLwogwqAgwqAgwqAgwqAgaWYgKCFpc191c2VyX3Noc3RrX2VuYWJs
ZWQoKSB8fAogwqAgwqAgwqAgwqAgwqAgwqAgIWlzX3Noc3RrX2VuYWJsZWQodGFzaykgfHwgYXJn
ICE9IDApCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDsKCiDCoCDCoCDC
oCDCoCBzZXRfc2hzdGtfbG9jayh0YXNrLCB0cnVlKTsKCiDCoCDCoCDCoCDCoCByZXR1cm4gMDsK
fQoKYXJtNjQ6CjEuIExvY2tpbmcgZmFpbHVyZXMgcmV0dXJuIC1FQlVTWSB2cyAtRVBFUk0sIEkg
c3Bva2Ugd2l0aCBNYXJrIChvbiBDQykgCmhlIHNlZW1lZCBPSyB3aXRoIHRoaXMsCgpJIHdvdWxk
IGxpa2UgdG8gZmluZCBhIHdheSB0byByZWN0aWZ5IHRoaXMgc28gdXNlcnNwYWNlIGhhcyBhIGNv
bW1vbiBBUEkuCgpJIGFtIHByb3Bvc2luZyBhbmQgaGF2ZSBxdWVzdGlvbnMgb3ZlciB0aGUgZm9s
bG93aW5nOgoxLiBXaGF0IHNob3VsZCB0aGUgYmVoYXZpb3IgYmUgaWYgeW91IGhhZCB3cml0ZSBs
b2NrZWQgYW5kIGRpc2FibGUgdGhlIApzaGFkb3cgc3RhY2s/CiDCoCAtIEkgY2FuIGFyZ3VlIGJv
dGggd2F5cyBoZXJlLCAtRVBFUk0gb3Igc3VjY2Vzcy4gSSB0aGluayBJIGFuZCBtb3N0IAphcmNo
ZXMgbGVhZCB0byBmYWlsdXJlLgoyLiByaXNjdiBzaG91bGQgY2hlY2sgdGhhdCB0aGUgbG93IGJp
dCBpcyBzZXQgaW4gbG9ja2luZyBub3QganVzdCB0aGF0IAppdHMgMCwgaXQgc2hvdWxkIGJlIDEK
My4gcmlzY3Ygc2hvdWxkIHJldHVybiAtRVBFUk0gdnMgLUVJTlZBTAo0LiB4ODYgbG9ja2luZyBz
dGF0ZSBzaG91bGQgZmFpbAoKSWYgd2UgY2FuIGFsbCBhZ3JlZSBvbiBpdGVtIDEsIHRoYXQgbG9j
a2VkIGJpdHMgY2hlY2sgY2FuIGJlIHJlZmFjdG9yZWQgCmFuZCBzaGFyZWQgaW4gb25lIG9mCnR3
byB3YXlzOgoxLiB3aXRoaW4gcHJjdGwgaXRzZWxmLCBiZWZvcmUgdGhlIGFyY2ggaG9vayBpcyBj
YWxsZWQsIHdlIHdvdWxkIG5lZWQgCmhlbHBlcnMgcGVyLWFyY2ggdG8gZXh0cmFjdCB0aGUgdGhy
ZWFkIGZlYXR1cmVzIGFuZCBsb2NrIGJpdHMKMi4gYXMgYSBoZWxwZXIgd2hlcmUgZm9sa3MganVz
dCBwYXNzIHRoZSB1bnNpZ25lZCBsb25nIG9mIHRoZSBiaXRzIHRvIApnZXQgdGhlIHJlc3VsdAoK
VGhhbmtzIGV2ZXJ5b25lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
