Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E907FC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pPm8jHa2WYYxS4xMzIAXj+bygHjqfGoymnVqpOtvMpE=; b=ETCP8uYvFrcnIK
	eUh+q43xRIZ9DWTJe0QA0eDh3HCv8UCwFeUk7s/qp6Vv9W9oVNxXb5tpEt4u+j0G0qYymW2Q7tehk
	jNVtbN2djgewAjxnYULzB6PdmLJnpRKX0XBBJmE7IGiB61Ec3GvKgxa66QgEfDPB/YTqy1zLGs9jE
	epHJErZev/pok9QzjDNthG2h6YVZJEh3CUbqgn/0+Fh9CPRw3xzWpau/QGySDmkUkBqpRAtAAdXay
	FVUzwmONKXbWDjD1PhZbn12k0gRouhu085tbYYfMzt7RBnQ20Zi/HvUX21DmB6IYlEomnPjTTmwTp
	p+U9ADDkAeW8ZtyU5asw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdoP-000000074LB-3c9O;
	Thu, 30 May 2024 11:19:13 +0000
Received: from mail-dm6nam11olkn2070.outbound.protection.outlook.com ([40.92.19.70] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdoM-000000074H3-1U9N
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 11:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9G8bValoywm89fbKdMFkjniOvaYUBkzEtkNw69fQfPxgURpa9EDxqRuZezF54co5J8CwhOmhUqaRzLPvgAZ+i5Al2rvALJxRApkB2b5rFJzkN8V1AncSWCvcSf3UN85rz3gj/wskSK1isYa1wDQKt38GbTCqxdRqcyIMy9WSqK5GP3sHAlXI4oCWv9GeuchNghwMGca4DkZdy/HllniDVb8M4GOZlHlUmrcYQ3u7w+WZAHpVe0/Z6y3sMNeStcCTk8J2hnxCz+/vsjd2HQjLAIhRtLVGmkbnXpqIpBhlCBB26KZHQ7JjjIMTpQMmv7icDVrLss6+/Xe6FmqHT1Pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1g3dcYVIGes9Pbp4hU9DcM/1/dmc5+Ay2jCxUQHq08=;
 b=az3Lq4BZcFQQhPwLvexqoqyE0zAZ4z9JXPq8slkEed9TZbbm0Ptw8Cky5Ot46lpUKzy3Iu8W/chuW1C7ilPSxq/B8xaUEra9SWjd6e1f+3Pp7gOm2Jrd7kMwLmuCqT8ec4wJAO4nwvEqrn7YvU8YuzIOPMCzg1uYP0EhwrHJk6aIWTepH/1bgXTfdLW8OxM6b/GF+vPrqtewW4YKh7ZZ/TT94PBV7/2FWxR0KS7iPBEP/C4oWGajShT7c2SJMknVsMwyhUfkiRcDyyJG8I3yOcrFymk0s59jqh+2DhUVcEepOzVnPcqNzhgyLrMD0rFdWLL+24HI7ZZjPBMjkZoHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1g3dcYVIGes9Pbp4hU9DcM/1/dmc5+Ay2jCxUQHq08=;
 b=PD4ux0nOzYGSZi497ao/x+wqg4Qa2PUGS58TWKc4bnKA5QWIkY5GfLOO/IdFJEjydgiKXKxOUUsNmaZIWVdbVFdAvm+EONFmnQ/TQGtLxljU+jDqSkJQVYUjkEqW6uBFJpTqQORAE2NjPSZzMFOxnFzf5oXaVdCWMa3vFs2x3n7BiY0eWG8Kq1PmjwPYzwPH+N/QyGRJnWzRvbb5k0dU3XcaQ5H8ttlk17FJ41uWLFaqgRYHjtinDR9zWTuBxc4rZ0AuXiegsXT4y+DSBF2xMprgfWXA6C0gMvm9e0KGIuGSPrhzWalxtmyvSLsZ+sb8N/xewuSF/DzRm9SCiywO1w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB6420.namprd20.prod.outlook.com (2603:10b6:610:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 11:18:56 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 11:18:56 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: thead: th1520: Add PMU event node
Date: Thu, 30 May 2024 19:18:35 +0800
Message-ID: <IA1PR20MB4953BA3638A0839FCB0EF86BBBF32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.1
X-TMN: [Ybx/Ue/KoV28DTWdmY2k1N2+n6V1EsDwYJn3psc3r/Y=]
X-ClientProxiedBy: TYAPR01CA0007.jpnprd01.prod.outlook.com (2603:1096:404::19)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240530111836.297712-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d15887-b981-4235-1584-08dc809a4ba4
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: hIId+rXnGJGDh9GNR+pu/JuIJShmIaFhXi1iGqj1e85J5K7YUA/HI7al0oNjYCJXU1zh07f7nPuX9v4O4OAyGakxT8etqmTlvTWq+mbv2A8MYUOryC1cHJf2wKxQ/+WwoSDyCkPAzGbhAK9yzSHNh7FDKnTq9q8jjYTR+K85tEex9PHKs1OjG2ePn9AxQ+cmo84dvKl3NHayMqJ/Ua3Rr8fz3jXR3CjvsvLN3wIjymPGPtYh90jq0rO0vBJqthGvVhMqexSx45zB69SGIPg12tPqTZVEB9xnkpfA7R133AS9w2Vw3P/g6abtUY2WioCqjJUw/PYl2YSdNBQQ4Q39lNKWQn/tvWhYmO/7owRKbIrbtLcctHjNzZynmM1Kk87YaHJ9+MdA9tdNt/TccwJdXx5bkgKSc+NKiAQgh+ev34xr17jgbPdvBFbt1IYc/orgfeRAvNqYf/coDxBsfMFo4AzhQR+HfkElKUBGM/Q30U98JJzsEsi9P+DxGkOgUi+X4J+ZkmDrDHcUKkHMfOT7WlNSZU1HT+CnCdmUWcCyfsd2C+Mnka/+chPqi93jrrlxbMfqIK6hYdXlcoG39R/DJ9f6W0QHBZdGq/ybXYIVEGLbOQFT6ZUlexRGxlJGi1bF62fGvLwB4XLUt+bpdmhj0hV3HaYgWH1PuPUEVkpzADnQjZB/MyOvxt7vTG0W30aA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/SBS4HDsYcrWpuysI2HVpn+aSbfGuCBhO/b2c+vU5ZLzYT87o489cBWMAI4?=
 =?us-ascii?Q?KJFg0jVKlT8j2Blh6O504Mmri0vWIX8MWurRujAuAME7wOWP+DZOOucqY3AK?=
 =?us-ascii?Q?BFORUvMZGDU3/rAy1D/QBV+XeXrwW1SBdq0onlnpwMsurgt6tlU1iE/iqdbc?=
 =?us-ascii?Q?17hibpqn1AezU4ztefpEuwCIFnbr2VEIJ5/R3tb0QXOCqDteSc+OW0gaymO0?=
 =?us-ascii?Q?m3fOuUoCfPZUV5w6hvXuGWQ7ENZJmOIDKt60CiEFZ3C3QFJC9egQyRt1bfeh?=
 =?us-ascii?Q?3FWmm4014c+V2kk8nNzaT11La7IHl5uiphXjVsdQ/fYkIpND5+LbdTuPYk/h?=
 =?us-ascii?Q?L+bl3QjueKDXsfQdKS4CJmUS+Fmw9WMsSL3QhFdWLCvHps0GNcaJCHg7WStf?=
 =?us-ascii?Q?4Qy3bkYcvq0bOQmvS/dTi2NhFDXMVzizRHyVltq7BKdYEUVZBo3xO5lk5jo7?=
 =?us-ascii?Q?2zz+W4oGn1iXRyBVh8HJF/oUWA0IMoewRiSmGGZAD56rSJzO/4RmDufkdrLs?=
 =?us-ascii?Q?FRr+DyVoQRDqLNO87P5opUb+ddBaxfsooK7u/tTAAOO625RyLZ40nR0uXVm7?=
 =?us-ascii?Q?NQSkjtC683aKFKV5gPxDBdEmrAuS7hL0grdgT0h4N8w/LkCEUXyKR8+Fcgs8?=
 =?us-ascii?Q?AsLvtdTu1BzwKrtSDgbLWPMvpH1SRU0cE0Y51IKb48MDJaQiO7Qld1j0KhVW?=
 =?us-ascii?Q?7I960oHs2F7sqY4M2rvi6NWR3fDc0isw1UnGxwW1ppW1yBvmCGs4MrbsXb61?=
 =?us-ascii?Q?75zziuVPnYoQyZg95q/r4QJIkNFZt67Z+oDhiSL/SByf3fY/FCHMNqX9rQ3H?=
 =?us-ascii?Q?jfSc95/ULxSxd+MrS3IvA8eYY943FB5nEO1GxFvP063If71ZutV2TDq4TV4c?=
 =?us-ascii?Q?WLFgEvN+iiewmXUFakup3B2e0J4Io76ZZwKNnL1RUCzNVDQCCy1BvJ37+S4g?=
 =?us-ascii?Q?iEUwgaz03DhNB2D3R71vN+0DGOthg6DvU3S6EaQGobl7M8t6N5kBoc44pwWu?=
 =?us-ascii?Q?fxvvVJICpDZJhbH+wmnHGSvC04FvggRekcBpl+CFd1qOEG3qB9w6VMsWSIs0?=
 =?us-ascii?Q?Htsd46ssAcGx9jP1KLilqg9RTqRszeHdFg9LrkmdKWNLnDbch752H1EPG8pz?=
 =?us-ascii?Q?S29Pgw+hBvPbhp1LCaCeMjx1LVZWSpEs5wnCZjpk4fNtlSp9OOaSPxOrmHkx?=
 =?us-ascii?Q?dE1HsjlPI9zAnoXXT8DyfdkhDL39V8guWY73kRffipQK66xr5L/pxsGAWbe6?=
 =?us-ascii?Q?PKTlJCqNKbcHysNALEzq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d15887-b981-4235-1584-08dc809a4ba4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 11:18:56.5347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB6420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_041910_512193_6F0CAC2D 
X-CRM114-Status: UNSURE (   6.53  )
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

T-HEAD th1520 uses standard C910 chip and its pmu is already supported
by OpenSBI.

Add the pmu event description for T-HEAD th1520 SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://www.xrvm.com/product/xuantie/4240217381324001280?spm=xrvm.27140568.0.0.7f979b29nzIa1m
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 81 +++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..3c9974062c20 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -122,6 +122,87 @@ l2_cache: l2-cache {
 		};
 	};

+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmcounters =
+			<0x00003 0x00003 0x0007fff8>,
+			<0x00004 0x00004 0x0007fff8>,
+			<0x00005 0x00005 0x0007fff8>,
+			<0x00006 0x00006 0x0007fff8>,
+			<0x00007 0x00007 0x0007fff8>,
+			<0x00008 0x00008 0x0007fff8>,
+			<0x00009 0x00009 0x0007fff8>,
+			<0x0000a 0x0000a 0x0007fff8>,
+			<0x10000 0x10000 0x0007fff8>,
+			<0x10001 0x10001 0x0007fff8>,
+			<0x10002 0x10002 0x0007fff8>,
+			<0x10003 0x10003 0x0007fff8>,
+			<0x10010 0x10010 0x0007fff8>,
+			<0x10011 0x10011 0x0007fff8>,
+			<0x10012 0x10012 0x0007fff8>,
+			<0x10013 0x10013 0x0007fff8>;
+		riscv,event-to-mhpmevent =
+			<0x00003 0x00000000 0x00000001>,
+			<0x00004 0x00000000 0x00000002>,
+			<0x00006 0x00000000 0x00000006>,
+			<0x00005 0x00000000 0x00000007>,
+			<0x00007 0x00000000 0x00000008>,
+			<0x00008 0x00000000 0x00000009>,
+			<0x00009 0x00000000 0x0000000a>,
+			<0x0000a 0x00000000 0x0000000b>,
+			<0x10000 0x00000000 0x0000000c>,
+			<0x10001 0x00000000 0x0000000d>,
+			<0x10002 0x00000000 0x0000000e>,
+			<0x10003 0x00000000 0x0000000f>,
+			<0x10010 0x00000000 0x00000010>,
+			<0x10011 0x00000000 0x00000011>,
+			<0x10012 0x00000000 0x00000012>,
+			<0x10013 0x00000000 0x00000013>;
+		riscv,raw-event-to-mhpmcounters =
+			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000004 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000008 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000009 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000010 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000011 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000012 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000013 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000014 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000015 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000016 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000017 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000018 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000019 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000020 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000021 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000022 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000023 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000024 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000025 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000026 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000027 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000028 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000029 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0x0007fff8>;
+	};
+
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_24m";
--
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
