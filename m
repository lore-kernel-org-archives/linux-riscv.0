Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96945CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxYa2WNVVYLnShBkqOFh2HkbxdsogxYSLRYBZilnDVw=; b=37IW2nHMvFFk1H
	DnaoYD0HVs0iKOoLbQE7gysbW6w8JJOMgdg+A+vKaE9HQZszfCTYbBim1/wSm4NGAANy6C1pl0Z16
	X3tV13i+rhy02v3WsdLZOEqjWfkSfFGqFSJB19+o4BFG6JWwHj5At+DSlRbIz0zZiVYzQvGffeLqA
	iGmutofSIfdIik2/SkunRXIrzHaiaT6O8MAiDc3Eni4xVS9k23yNsb5CpIqZU0ZEqQ0jo0zqTNLeM
	FTH7EHyYOoAv+f3S8EHev7iGxZQgNFFL69893Iyw7xAJlrV9gatGA7cWExxM+GLvA1Ttjro+1Ih+R
	DTAM4DaokAgB9eMK5W5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MG4-0000000E1hj-3MWV;
	Mon, 13 Oct 2025 17:22:52 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MG2-0000000E1g5-0Oyn;
	Mon, 13 Oct 2025 17:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQbWXPMxF70GMbNGkKtmXEomexWZMakrAC01ozDNEvRmnp5m00HEOwVP6zHo0qyVrwECSftyR86slsB2t1xVECxuQdvTVwx4p7f3MQAIs5W+JvSw59jkaiTPTUGYg4oH04ARaVZfG+yEXo+J7Ph6AD7FRfRt5lRWANUrp1qdBIGKGAwm5jGqnqFkK+NIq0bsQIo8I4eF+WIVzp57LV04LKKeb+rlVA0IsCfo2hfWbuoEoYyeotV7qtiw15q3oSKnsRZGaChwwdvX+mnIIesruX3BITABiM5+KkgBOrD6mcwGdAE+loVey5aS610pBN74qUk4AOjcB+mT/jpY1O7Ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBFzFjM744pvcWKfxcWjcYGUSZzANLCdtx3flHgof18=;
 b=NnRLPJRp6d1GMRUODmZE8Ilh1wOVO8rRpniAWJKNAppKuwze0PZS7jb7a8wIII858b5s9uM8pvfws3wj3/okW6asOaCBWcWR4A0D9HeHXwtLEU6xS+eX+qoIIRocGQOSOLBUtJbAP3zWJdGaKbjYg0XvqocL1YztJt40UwPno0ThwQ8eYQy91N1eZTms1sFXVheIy18EMLdq/5kDjMPC8ds/iGB3MDnMzBdxwVXnqkp62SGiKcIx2268C4OxQIf5DbzxgSE0h18wxKX2VEpbjqMYcLEvPHnGzLPG+b5UFCBxZrZCJanaLUYxNvWHGmxSXL4j38U+WEV9EzZ6bj521g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBFzFjM744pvcWKfxcWjcYGUSZzANLCdtx3flHgof18=;
 b=C2apNRhKsmlm4qx8wdkksIPbzZMVvf+2XYn0ktbJDOzXy2f/hOSUM90QQThMqX0UQg4F+LlV7ijWOBX2Oi99e7jf4NNBZIyn/w9N4PhhrMuEM8NEG/27YVglLYpFMu5SVmgN/H1Y2JIhqHCP+9wn3nNiI7b7hdlp1lIz8ovLziaasSyLVSWtrAdAjdW6S+u87ETGglPpke7yXWxmMcGTynf+4es4vmBl4Al9z853NY62zt4U+w6zu7froJOCNLfr6t2rLNeelysE/H8y1eu8m2c8f0H+ECGz3pI6GSSK4TteYpw1ybmGt8GE/Hkec6exMl7JetUY+mDzNLt5CtJKDQ==
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 17:22:37 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::98) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 17:22:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 17:22:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 13 Oct
 2025 10:22:26 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 10:22:26 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 10:22:23 -0700
Date: Mon, 13 Oct 2025 10:22:22 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
CC: <joro@8bytes.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<sven@kernel.org>, <j@jannau.net>, <jean-philippe@linaro.org>,
	<robin.clark@oss.qualcomm.com>, <dwmw2@infradead.org>,
	<baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <mjrosato@linux.ibm.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
Message-ID: <aO01TkkA7ZLDgqXg@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
 <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5910ceb6-b4c9-41ce-87e1-08de0a7d1b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZ4ZlRtT3hzakljbjVxWDlNZGtUTFVTVmtKWkdiVEtUcTJwZ2d2dGpTejIw?=
 =?utf-8?B?QWZ5UlJyZlNwNXNDT2dzUDVIZ0tXY0RKdkZielEwU1pnenFtTnZodWNxcHJ6?=
 =?utf-8?B?WmtMNTYvRzNNWWNzR1pKQm9aQjFmSVlTVXd2K1Eza0NMcjcrenFxLy8xTkky?=
 =?utf-8?B?SC94TzZ3UytPZXVCVVlIa3FXcWdOM0Z5VW1wQThaWTlqVzFVS2E3RjBjR1U1?=
 =?utf-8?B?aWV1YmdMT2RYWGQrZ2NZeXdONFdncldyUXJWWXNtU2Z5RmZzNTVpaDViN3Nz?=
 =?utf-8?B?ZUZ5S041YzAvMmRidGZpbGo0SXUwSlRxSytHR0hGN0ZqTERqbzZmOWNyQnFk?=
 =?utf-8?B?YitMUldWa1A1TTZVM2VWMjNBTzJ6UXhSN1hyRDNZZnRzcFd4SDdldWF6WHdX?=
 =?utf-8?B?K3pTY1NENk5KMEtXMG0zdmRQaG1PUUpPRm5XWGFYUmFwSGY3YkRiNWw2bEhN?=
 =?utf-8?B?RnB5ejFpWFVGbWg0STRrQ203T2U5TURvaTRuM1k3V29HYW5EM2xlL2srLzlD?=
 =?utf-8?B?dWkyN2J0WThKSFV1Y1dHQlhLNk05dnFYQ3VFWUFuRmVVUGdTUFU5RmF1SUhj?=
 =?utf-8?B?ZHJrL3RoeEZCSkU1eW9aRkxkZU82YmdnQ1AwMU5MdlhEQWRLeE5sOVdPaXdS?=
 =?utf-8?B?azBEcGNkUU9XQ0tVcGpMcGlnNWRqRVl3RksraUhwbittYmYrMkFrVjQ4cEx6?=
 =?utf-8?B?WSsrSkhwcTBCQkpYMTNWWGwwQkRCejBtalFoaThWK3ZwQlM0VHpoR05CQ0J2?=
 =?utf-8?B?Snl4cTRtS2FGaCt5UDFZYXBjN0gza2d5YS9INFB2L1I0TG0wSUVnMXYvOW12?=
 =?utf-8?B?R3ZENzluVWpQU1NDZEtzSkFoVFVNVDlITjc1OTlRNEliTGU0S2V2NTQ3bVhI?=
 =?utf-8?B?eFhpRHJLVm1qUHZoZitEL25aWlNhOURWbFVsOElPRDRWalY1aTZzb1pIdk11?=
 =?utf-8?B?M3BxYVhkdVJHN016L2tHeGhOdDlZdUlCWjBheDV2TFNNZ0Faa1A3V2UrOXlM?=
 =?utf-8?B?aUljKzFGVHVCcld5ZWhkdlhIby9sT0d6VjBvQVFVZ2w4S2VNUG5zaGhlRTM4?=
 =?utf-8?B?cG5xVFVMN3N5elBtV2w5N3NDTVhxQVNBLzU4Y3lDNkhWMlB4eTZwSzBlS3dW?=
 =?utf-8?B?UlNFTWJuQndhTlZ1Q0VYOWJLcDZBQms3M29GdmRNRVBUUE0vbVFJNmQ3VEpw?=
 =?utf-8?B?dUIyb3lCUU4zVDZMSWREZVN3WjR3UXpTZFBEVGtGRUFUWFM5UkV2Nk4yemow?=
 =?utf-8?B?MEV6WVpkTVg5NXgvUDdiRnpOR1BKNkVtWGxuNGNoTEVXTlp6MW92bGJZZ1Uv?=
 =?utf-8?B?UThham04ZFNWdzV5bWlJVDlLN1hwMXpybzQ3MG1IUjVNcHZ3RW9GalBmMkZ5?=
 =?utf-8?B?QzkxVitwSnNoL01neFh1QktYZGVVdno2TW95K0Rvd1dIRGJTTGx2MGpCa2hx?=
 =?utf-8?B?RDd1cmFlU3BieHFQQUpEQS9iNGlGQ3h2Nk1kcXJEaG1mVEJCZjhhb3RJU3Iz?=
 =?utf-8?B?M01NUU5zS2Rqc0J4dm9vT1NDT3NkL1F2aEJtZWRac1pKWVAwTE5qOEQ4MzA2?=
 =?utf-8?B?VnlyNS9lSzRicDRhN0dSZGNXV3Q0eFpRSzNxNkFsMFl1c0hycDFWTURDM1pO?=
 =?utf-8?B?eGV1MG9HVCtzZCtIaVNROFQ5OHFHQlFINHVTNHhNZTlDb0ZFUlIxTWZaR0s0?=
 =?utf-8?B?M05mTUJFSUk0cW4yV08zRWZjSFhhK2tUY3NXWXJLeU5LbE1NSldPK2Jwcmhh?=
 =?utf-8?B?d09rZjcrM1hGWjRCL3c2dlZ5a1ZvRXZPUUFZNlNoU0wyd0pnc2xucmtnQU96?=
 =?utf-8?B?dWUxdFU2RFkwdWx4Z0pHUXhZb0pXOFhvM2FvcWc1cGRFYnNpTWpJTGJjK3Yw?=
 =?utf-8?B?c3JwNFRialRaTVc1QnRCaVBCenhXUUtPV1ZxeXJBNWtBYWJtMzJFcHF5WmNZ?=
 =?utf-8?B?ZnJmSisxdWxZS2I0Z2tRL1JYK2VDMjFXM1FFMFc4TW9IYWlsb0ZXL0FBSTY0?=
 =?utf-8?B?YllmaTcyQk1LZlRhYXJwUFFtVDQzdUcxcDllTVJJVDNIWThwcnNPSGVuWTIz?=
 =?utf-8?B?WlM2Y0tDVDRvNGF3T2lMdmZnRk50UE9TeEhpZzlHRXIrK1pNQUNjSVJ5c0to?=
 =?utf-8?Q?6Uzk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:22:37.3033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5910ceb6-b4c9-41ce-87e1-08de0a7d1b0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_102250_154843_1C87A3A3 
X-CRM114-Status: GOOD (  24.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTmlrbGFzLAoKT24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMTE6NTM6NTVBTSArMDIwMCwgTmlr
bGFzIFNjaG5lbGxlIHdyb3RlOgo+IE9uIFN1biwgMjAyNS0xMC0xMiBhdCAxNzowNCAtMDcwMCwg
Tmljb2xpbiBDaGVuIHdyb3RlOgo+ID4gQWRkIGEgbmV3IHRlc3RfZGV2IGRvbWFpbiBvcCBmb3Ig
ZHJpdmVyIHRvIHRlc3QgdGhlIGNvbXBhdGliaWxpdHkgYmV0d2Vlbgo+ID4gYSBkb21haW4gYW5k
IGEgZGV2aWNlIGF0IHRoZSBkcml2ZXIgbGV2ZWwsIGJlZm9yZSBjYWxsaW5nIGludG8gdGhlIGFj
dHVhbAo+ID4gYXR0YWNobWVudC9yZXBsYWNlbWVudCBvZiBhIGRvbWFpbi4gU3VwcG9ydCBwYXNp
ZCBmb3Igc2V0X2Rldl9wYXNpZCBjYWxsLgo+ID4gCj4gPiBNb3ZlIGV4aXN0aW5nIGNvcmUtbGV2
ZWwgY29tcGF0aWJpbGl0eSB0ZXN0cyB0byBhIGhlbHBlciBmdW5jdGlvbi4gSW52b2tlCj4gPiBp
dCBwcmlvciB0bzoKPiA+ICAqIF9faW9tbXVfYXR0YWNoX2RldmljZSgpIG9yIGl0cyB3cmFwcGVy
IF9faW9tbXVfZGV2aWNlX3NldF9kb21haW4oKQo+ID4gICogX19pb21tdV9zZXRfZ3JvdXBfcGFz
aWQoKQo+IAo+IFNob3VsZCB0aGlzIGxpc3QgYWxzbyBpbmNsdWRlIGlvbW11X2RlZmVycmVkX2F0
dGFjaCgpPyBUaGUgY29kZSBkb2VzCj4gaW5jbHVkZSBpdC4KCmlvbW11X2RlZmVycmVkX2F0dGFj
aCgpIGludm9rZXMgX19pb21tdV9hdHRhY2hfZGV2aWNlKCksIHNvIGl0IGlzCmFscmVhZHkgaW5j
bHVkZWQgaW4gdGhlIGxpc3QgOikKCj4gPiAgLyoqCj4gPiAgICogc3RydWN0IGlvbW11X2RvbWFp
bl9vcHMgLSBkb21haW4gc3BlY2lmaWMgb3BlcmF0aW9ucwo+ID4gLSAqIEBhdHRhY2hfZGV2OiBh
dHRhY2ggYW4gaW9tbXUgZG9tYWluIHRvIGEgZGV2aWNlCj4gPiArICogQHRlc3RfZGV2OiBUZXN0
IGNvbXBhdGliaWxpdHkgcHJpb3IgdG8gYW4gQGF0dGFjaF9kZXYgb3IgQHNldF9kZXZfcGFzaWQg
Y2FsbC4KPiA+ICsgKiAgICAgICAgICAgIEEgZHJpdmVyLWxldmVsIGNhbGxiYWNrIG9mIHRoaXMg
b3Agc2hvdWxkIGRvIGEgdGhvcm91Z2ggc2FuaXR5LCB0bwo+IAo+IFlvdSdyZSBtaXNzaW5nIHRo
ZSB3b3JkICJjaGVjayIgYWJvdmUuCgpBY2suCgo+ID4gKyAqICAgICAgICAgICAgbWFrZSBzdXJl
IGEgZGV2aWNlIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgZG9tYWluLiBTbyB0aGUgZm9sbG93aW5n
Cj4gPiArICogICAgICAgICAgICBAYXR0YWNoX2RldiBhbmQgQHNldF9kZXZfcGFzaWQgZnVuY3Rp
b25zIHdvdWxkIGxpa2VseSBzdWNjZWVkIHdpdGgKPiA+ICsgKiAgICAgICAgICAgIG9ubHkgb25l
IGV4Y2VwdGlvbiBkdWUgdG8gYSB0ZW1wb3JhcnkgZmFpbHVyZSBsaWtlIG91dCBvZiBtZW1vcnku
Cj4gCj4gTml0OiAi4oCmIG9ubHkgb25lIGV4Y2VwdGlvbiDigKYiIC8gIuKApiBsaWtlIG91dCBv
ZiBtZW1vcnkg4oCmIiB0aGlzIHNvdW5kcyBhCj4gYml0IG9kZCB0byBtZSBiZWNhdXNlIG9uIHRo
ZSBvbmUgaGFuZCBpdCdzIG9uZSBleGNlcHRpb24gYnV0IHRoZW4gYWxzbwo+IGEgZ3JvdXAgKHRl
bXBvcmFyeSBmYWlsdXJlcykuCj4gCj4gTWF5YmUgYmV0dGVyOgo+ICLigKYgd291bGQgbGlrZWx5
IHN1Y2NlZWQgd2l0aCBvbmx5IHRoZSBleGNlcHRpb24gb2YgdGVtcG9yYXJ5IGZhaWx1cmVzCj4g
bGlrZSBvdXQgb2YgbWVtb3J5LiI/CgpTdXJlLiBJIGNhbiBkbyB0aGF0LiBGaXhpbmcgYm90aCBw
YXJ0cywgaXQgd291bGQgYmU6CgogKiBAdGVzdF9kZXY6IFRlc3QgY29tcGF0aWJpbGl0eSBwcmlv
ciB0byBhbiBAYXR0YWNoX2RldiBvciBAc2V0X2Rldl9wYXNpZCBjYWxsLgogKiAgICAgICAgICAg
IEEgZHJpdmVyIGNhbGxiYWNrIG9mIHRoaXMgb3Agc2hvdWxkIGRvIGEgdGhvcm91Z2ggc2FuaXR5
IGNoZWNrLCB0bwogKiAgICAgICAgICAgIG1ha2Ugc3VyZSBhIGRldmljZSBpcyBjb21wYXRpYmxl
IHdpdGggdGhlIGRvbWFpbiwgc28gdGhlIGZvbGxvd2luZwogKiAgICAgICAgICAgIEBhdHRhY2hf
ZGV2IGFuZCBAc2V0X2Rldl9wYXNpZCBmdW5jdGlvbnMgd291bGQgbGlrZWx5IHN1Y2NlZWQgd2l0
aAogKiAgICAgICAgICAgIG9ubHkgdGhlIGV4Y2VwdGlvbiBvZiB0ZW1wb3JhcnkgZmFpbHVyZXMg
bGlrZSBvdXQgb2YgbWVtb3J5LgoKPiAtLS0gc25pcCAtLS0KPiA+IEBAIC0zNjE1LDYgKzM2NTcs
MTEgQEAgaW50IGlvbW11X3JlcGxhY2VfZGV2aWNlX3Bhc2lkKHN0cnVjdCBpb21tdV9kb21haW4g
KmRvbWFpbiwKPiA+ICAJcmV0ID0gMDsKPiA+ICAKPiA+ICAJaWYgKGN1cnJfZG9tYWluICE9IGRv
bWFpbikgewo+ID4gKwkJcmV0ID0gX19pb21tdV9kb21haW5fdGVzdF9kZXZpY2UoZG9tYWluLCBk
ZXYsIHBhc2lkLAo+ID4gKwkJCQkJCSBjdXJyX2RvbWFpbik7Cj4gPiArCQlpZiAocmV0KQo+ID4g
KwkJCWdvdG8gb3V0X3VubG9jazsKPiA+ICsKPiA+ICAJCXJldCA9IF9faW9tbXVfc2V0X2dyb3Vw
X3Bhc2lkKGRvbWFpbiwgZ3JvdXAsCj4gPiAgCQkJCQkgICAgICBwYXNpZCwgY3Vycl9kb21haW4p
Owo+ID4gIAkJaWYgKHJldCkKPiAKPiBBcGFydCBmcm9tIHRoZSBjb21tZW50IGFuZCBjb21taXQg
ZGVzY3JpcHRpb24gbml0cyBtZW50aW9uZWQgYWJvdmUgdGhpcwo+IGxvb2tzIGdvb2QgdG8gbWUu
Cj4gCj4gUmV2aWV3ZWQtYnk6IE5pa2xhcyBTY2huZWxsZSA8c2NobmVsbGVAbGludXguaWJtLmNv
bT4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKTmljb2xpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
