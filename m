Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB3EFCD0D1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/EAD6w4ll0VL+8kQGTWRfA0PnmbDkot3sOz2+pphY9g=; b=C+FQ2x1N61y02gAE2O75qCy9MD
	II3CMCMshawxIzgCeITa6coUVLnPw4ZEaC+xqWPKOr7+ZYiscVUspFKvh5UkZxFJ0z2tYyNKOWFBx
	rslU8Hgl3SM8xUhcm1S36O4t2MWyydStvBJ4VP929+mjWIj5UbZjjVZwKsYL1Z4/gVQwACcJZRr0h
	nzRpEubplM8XKF1UwwQl7VuXAvq4tiXEpm8NKQA3UOHrtyUKS188sECoquiH32C1af9+Ykcct48jO
	u5t54Eztz6CRbR9O5+4GhbJS8zfjLUOa/qvRc0Yj1Uvl3BrtmWF3meRj/BaO96YZjdpfK/sbOqAIX
	f096/FCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lvR-00000007zXh-3EEr;
	Wed, 18 Mar 2026 08:06:45 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lvP-00000007zWQ-3LFx
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 08:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gc9l62ep4SI1ypT/Dv3LXiA2/O4mvRoAIfxiIvNEhhxz6yzeWOxxezn6fbb+98XSU09N2Qcf2h88BO+hxhY4MGPo5jcPlk9Sl0NM49AW0dVUHf4uxMgHDdYnmHINrxM57hiRZ4hjnFRiX7Lnv1md8kVsjgFm3oR35V5Qj5bwMyA2mIqoMWGawPfp6aT5if1DY7+y48pSAdT4nQ2vXUA4fqBV+Pf74KJDDYbTbawD62kmpGjJb98hlIdcRlGLPIB3T9w1G3uTjlVzNGjd1J3YwrDANwrCUFdtXaoHVsoDmmw/rWGE70W2c8GFQMtdCCYc357CD7o6ch6jkguDm8bwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpq8/vHr0CK2gkMgu+NTDMG3p7gA8gjEKzC8EW2D5rA=;
 b=DC04z8ELeht6inyH4zrGTjd9R9jszuANxeOE8b82+ln6nPPP3vYfIGXk2qLMkDH6DZwbNTIq128/REQ5M2DOuAp7ogKTOu0iVSH3zTU1vqF1eJgNqrHf90iAILxSdb5QxTeV2ZXCeDF81R6bdEF59KeH1JaQtnqsmc6fLDj0+q6maRls93iHYGUFDPL40GHndsTP+NNi1ZcZbSLMcpHlwg+ixXdmgJFQPzkUxBYj687gJ1mMNizZU+9QX3WJFxI21tLSf5M2trfL3dN/EkpegEZSaM494VXkYxdi3opeuFNYb/kPR1k6SatTqSrifCXkFLIRMtqWDo/EF6eXYKodLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpq8/vHr0CK2gkMgu+NTDMG3p7gA8gjEKzC8EW2D5rA=;
 b=O2k3ZGc4PpIYf35tzYeO3NtDP+TRkAAS6vRAKZqKPaDvtsWlFkortaruezHNP7MgUwI8MtGKmNxWdxbHAI2Jh4tbd8jM1b1ky29OzXNoGnsHmfugbmgOEzSWXp2euDIh9HYtdNrf1DNvh83Y5IJG2k2aR+exMkCjdUvWiUb1LRxkeIx8KksU1mEwefWFfDmYzbh2MUtI4zH2qbnBMLEvjA2DpLD/wyCJ8x3Y6hmd8iwQKmyc7124aTFM/UXksQt3ghTSY9BfaW8uNmRD5MzhiDO0C8qfpoAMbeTZ0417SaPkbu9B+S1uhmh5s+aCwLMt/xNoFRGJuQk9pZWJLWAOSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:06:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 08:06:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 18 Mar 2026 17:06:04 +0900
Subject: [PATCH 6/8] gpu: nova-core: convert PDISP registers to kernel
 register macro
Message-Id: <20260318-b4-nova-register-v1-6-22a358aa4c63@nvidia.com>
References: <20260318-b4-nova-register-v1-0-22a358aa4c63@nvidia.com>
In-Reply-To: <20260318-b4-nova-register-v1-0-22a358aa4c63@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::10) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: d67085f2-0871-4886-594d-08de84c544d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Jii4DuK69aUmP0cjmVtxVTRISLUvE3dS6uY/MFZGqq+OXK6DCPicZU8yLYQUH2eQoddK/oDctmHWDxwj6CCKrOf6qc3D0CHf64bl+YNYcO6Buq4MICVojPy8B3y4hCPmY0HnlnATL3uxZDesJf84C0UId8crhi9x8VsyiUVRW5qbTf+/SmxqGerU94hx6q30gQFme21nQo93kd3YsQugXLUkHGc6bm7oTYTW6+greONrcFRuxmJ7ERn1ryHhFh11kgV0iscA3Ot+SwOhrfg8h7pu8etB92G4k3Qtuukc+3LmjBi1PmpeDzwA0o9Elo1emtR55w09GpEHJ/H8jbtXU59bpl5v/b5T+z+4qLs1jR98cSAS85UvBnSYIVYm+ynnZmGnL/iUN2Z6HAdVcuZ0VyLza7KJvTnffdplcL5BHV1RbEwuOhjWKsJXkZbxPHTGcLv3RPJcLureEQosrioli15adZ8sItzQ4euxb2aQ0p5q81P2qri//81N1wkZKshU97+7W+Z5T6Vj6qTHidHdz7/jPNuVTyRdLAh5hzB0mK20B++hJCUeVlJ9AH7bOVb++wr5RmZUDBJfm1jkFG+paDfkbyn4WLR5YnAwTDtSPux7LN5NYAzHQJ8vUhsO59s2ThFA9a/zAFK5kRo08vmASkI69GrBJBXOiO9RnfxLr5EvfcQjI1OtEmERYPARvyc7ZPxIF0VpQEBacvxaHLTNvk8hVlfJoEYQ6yNaNcy48zC26MrqJ/9t08IFbY62KPEGeeDSqBeVYAUm35AUKPpDqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE0zbi9mYTVpUnVaNkRHSFRnRGlTZHdmc2VyOU9yTmdTWmQ0VjF5WXh1OGR5?=
 =?utf-8?B?M0t3cVhSVGRKRGFYdWdrUW5SWHhCYUh2KzBNVGxlZURaY0lhbDBXYkpMYWlT?=
 =?utf-8?B?SitNdFF1M28wRDV4N1o4bVpuVEMzdXpTR09FL0htMGdQZVJndXAwTU5FYy9v?=
 =?utf-8?B?UHhTVit5WnNSMFlLdko5SzkyQ1FhRFZJTy9VcmpFRWdZeGI0eVQxU0FMYVpQ?=
 =?utf-8?B?MXFZVFNteGRweXlZRHNYWDMvc0UwcmtlZXJjTVM4WmFic3BYWG9FUmJqbnFo?=
 =?utf-8?B?dEJ1SmoxR3VmeHErdHR1L1RYWFl5eW9mYjNaWlVXL0ZmUjBOTWdHOWZlQkFs?=
 =?utf-8?B?NnVLNHdMRmZjZCtiL3FtcDdOUitKM2RyUDNxODVxQStKWC9SZWVBUWJFTmxl?=
 =?utf-8?B?aFBibmZjOHIySGV1RVcxVnhQTnJPa2FyT0lYcmlmZXo1Nzlkek1NUS94QjU5?=
 =?utf-8?B?TTBYR3V6WEEyb3duNWk2ZFZaa3E0K01UNVd6YXVnOEtPVzl1R01RdWE0ZEU1?=
 =?utf-8?B?RDlXcnNQK2Z2VVFSRUlJVWk2cWlXQWpqQmlXczlGMWsyMlc0N00wRk1sRXJS?=
 =?utf-8?B?ZlZHZ082ckFSd0tFaSt5TVZEcEVFZUplSUEyd3Arbmt5Yjh2K2NJRm5ETjU0?=
 =?utf-8?B?eFZtcGx1YkFHR1NjcGgzY0xTb0Z0U3ZnR3YzSHIrYzlQaExQSk10Vmp5MVY0?=
 =?utf-8?B?dEdVSUZ2MTJHd1cxMmtnVWxQRXE0dXJCclZBeVNNQmxMUHVnSWN0T2NWZ0RR?=
 =?utf-8?B?VjlJQm9xLzRoVmliWUc3SDlmRHBKbEIrWFV3aW9lR1hjaXd5Z3R1akRNSGZD?=
 =?utf-8?B?OENtSjY0YmRvYmlSTE0vV25EOHlKTzRrVUVTcHFodWQ2d2hlUFp0MHhNeHJK?=
 =?utf-8?B?aWU0TUNVbnliTVhIQ29zcWsyR0sxTWtaN2lyUmEyclBEaHRaY3FyRTFvaFVO?=
 =?utf-8?B?K1o2YlNQWVF0TWd4SVptdEtGVFk2bmpmMVVyVzFlNlc1aHN0cHBoNUhqcHRo?=
 =?utf-8?B?WTUrUDJpdEh5cGkrOG0zMWpRclg0Z0MxT2FmTWh0OGZsZEtaR05nV2YxRUM1?=
 =?utf-8?B?Uk9TeDJzSW5keFFHays1eE1ETFdBL3BLUlFYSFBkZDJGcHBDUmNBVjRCdDQ1?=
 =?utf-8?B?V3RqTjBYZkVxK29ISGE2V0FTaml0dmJvU3AwLy94M3N3dExxTzhjLzBxcU1Y?=
 =?utf-8?B?QVk2UWRPWDFtNTBXbzd3Mm55M2UyWDJtZS82WkVOOUc5bGtKcERqZlBYRUpr?=
 =?utf-8?B?ZTFEcnAvdFQxSjJadzlrSm5HMkdzY0ZCcGNyVDJlZ3FDTFpqR1c3WmwyQmpL?=
 =?utf-8?B?WFZESWR5d2s1dFZOVFBnejR0MUlpclp5TVNFL28xMWF5bkplN0hjNzhHQUo0?=
 =?utf-8?B?RDdsMFNQWEhiQlkrMXpNS1hEbXN5cDRYc0VKd3hVZi8rSlBLZ3ROV0ZXU3cw?=
 =?utf-8?B?YklicXlaaFhwRFFQaHRmVHl3SWR6VmErWGNEZWU1ZTNYUVIzOGtkVjAzMXda?=
 =?utf-8?B?bE0wYWJsd3RiRmJMTlpNZE5ERnhWb2I1Q0t6VXJEcXRmMXZlaUdod1J4RFNU?=
 =?utf-8?B?dFNGYkk5UzVhbkN5ZjByZUVVKzczWVdVdUVXL0RGMW0wdmQ3dlY0dER6Wm9a?=
 =?utf-8?B?MkMyYXJJR3IzcUY3eWFIZ0hRdFd0M3BBeEsxQk1NWlB4R2RsSDJKZEJGMkE2?=
 =?utf-8?B?cmNQdlNETjNZbG4yU2lMZ1VoNno3alVpMmVLdWJmQSswV2ljSWthd2dOc2dL?=
 =?utf-8?B?ODFqc1BBUC9mY1ExT1ZMNUlpcDkvc0VMb2YyV0UwYXd6Z3BtTVVRaDJBUGZP?=
 =?utf-8?B?a25MTHhWMWtBZGczaWJ3Zjg3YkhpR0ZVYk5UUWFzZk44Zzl0R2cxVDFTbVVE?=
 =?utf-8?B?QzNoYlYrakFZcnIzQVZXajZVS3pFQ3F2RVpwU1VDcUhuZlJTbGhLb0sxSGZP?=
 =?utf-8?B?NzVKVU5MSlBlSlNFTWVxQlQwZlFoQ2t3ZGhucHRJWjRud2w2cTRBRjdZWmhF?=
 =?utf-8?B?dFZqRGNLb2RMTTZJT3B4L2NKSjduQ2NpdktoUi91bERUR0VFMlExa1NCcDZ0?=
 =?utf-8?B?V2htc3d6bGhKN3N4VjdpWkVFdi9KQVZ3UjgrbWJwRCtJdWtZOGtSNVZXZXV2?=
 =?utf-8?B?RzhzOURrRWtjY3pVbFJkM0MyM1lwNFBKSG0waXpXRkU2ZndnbHdPTUx4Mm1z?=
 =?utf-8?B?T2NYdWhMSmROajNUZ1R4WkpLYXlrczdzRlRkd2Q3RUZrQmRXYk1CV1BCRHNF?=
 =?utf-8?B?TzF1TUlpUVl2QVFoaVByM21zVTZJR3FoZktmNDRVSmQ5NW1rM3J6bnZIT1hi?=
 =?utf-8?B?VFQwUCtnaXFWTGdaS1c4K1I5RThQNWdTNlM3MWxQSjBGRkRvS3JGMDVQeS80?=
 =?utf-8?Q?pCIiwPC5xvBq+32V4/khyxdpNHPnAON7eS1nOmCmvqhHK?=
X-MS-Exchange-AntiSpam-MessageData-1: FbCX93L7rAqMUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67085f2-0871-4886-594d-08de84c544d0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:06:35.1287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4Sz4LWYr8CyqL2NojDgiPkg5nLXy9WPol/EAqB7YRgzeb+GWxc3TEWNmGgFcFfF08H7m9cgCyBbhRlHDMOVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_010643_845681_6939F166 
X-CRM114-Status: UNSURE (   9.48  )
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

Convert all PDISP registers to use the kernel's register macro and
update the code accordingly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs   |  6 +++++-
 drivers/gpu/nova-core/regs.rs | 12 ++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..62fc90fa6a84 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -8,6 +8,7 @@
 use kernel::{
     device,
     fmt,
+    io::Io,
     prelude::*,
     ptr::{
         Alignable,
@@ -189,7 +190,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
-                    match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
+                    match bar
+                        .read(regs::NV_PDISP_VGA_WORKSPACE_BASE)
+                        .vga_workspace_addr()
+                    {
                         Some(addr) => {
                             if addr < base {
                                 const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 9682a94b8b77..4ac4e9126db8 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -274,10 +274,14 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 
 // PDISP
 
-register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
-    3:3     status_valid as bool, "Set if the `addr` field is valid";
-    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
-});
+nv_reg! {
+    NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+        /// Set if the `addr` field is valid.
+        3:3     status_valid => bool;
+        /// VGA workspace base address divided by 0x10000.
+        31:8    addr;
+    }
+}
 
 impl NV_PDISP_VGA_WORKSPACE_BASE {
     /// Returns the base address of the VGA workspace, or `None` if none exists.

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
