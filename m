Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78121FCA177
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 19:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzknRBwXnQ5tJFIC9FSAcyM/CTifxijGa/c33UyeQW4=; b=kPbEn+mIITABBK
	fhXxG1jqLf5di0As2Le4hRVmzLQ0PUezoG/oxG59Q4QQLwOXP+O2Z//DVkCiTb7tWEIdXFwlVTaUj
	x10coO7qWLSrCKVQ3TbIeV1iqCqVf56JrgJ6wLcHRXh3xFAcgw8VWFMVf41YvkNvqpEcZu/wS5i4y
	F7WJeudI96xZj2m4ihKihAcF+T31Xa7qwQif5Zua33hZ0TuhZBOmqBC4osJWDThwtTi2R9BY6tzxR
	9MkZNRqWW4T9IZINFkzdpJYLiGAYu8BOwd6yc9D2mQg2gbkymMhV5HzuITEulvm3hWjwF0x7gkjEX
	l8jxJhl+EtaSWnzSfuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfzj-00000007yt7-1fDE;
	Mon, 09 Mar 2026 19:10:23 +0000
Received: from mail-northeuropeazon11010036.outbound.protection.outlook.com ([52.101.84.36] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfyy-00000007xZd-2QaP;
	Mon, 09 Mar 2026 19:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHY1yiC0CmwhdXa9WuNiDEmogzsd//23QvIcF1YE+Yfre1RAbqLzm8NnHZre0LtzLwca1woastQBEP/DdDZbtjTRMQ2rLL5UDaLwgTMEBo6BdrIk412oR/3qhthJXHCU9jSZb3dH9o7VElkNQGpob8wpO7fJfBEiZJR0NnDxfey85IdKKP4TV1sp2VeH/ue8eJu8tdZhMBRh6eOcyX7GDZeIOb0QUtvsU2Cd2L9gdXBCRR+9ByMsbE8u/omk3q1t1SiK5aOJZy5pN+3Wrsm7Hkm1Pij264FVDXedjhGfFKmDy/E5wScrsHTojFOPKUFhvM7tDcjR/trALX8z7yvu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmS9KBfQea2O+dTupwy5sE9Uj0fLSTJYjZsAJfwOkdg=;
 b=dza4iUTUMJaIBdTJKsNyUr4hikHz5I+fZq+tqoa196OTR3U/wS9lvHZYG3IuxHvi9YqRhN+9KMcnE9+OpxkFR5cnJlSCpdKUvjszG+w7/4PsAYFBmG9WKAm2yBOdJaE+9rsYSshTEMceEuOGtVeSU4xZJTy2fRjzYNAEEcVqfD0MsHdtoOhn+6Q35wh9+BcZ4EuUAAYbyMaaVXITniBf/ksv1jrQqy0bRv0nsyYq43X6KXrIGcF7nQk7+/+zq4uegZ7kOsAQ78TPjuQW/JOc/gwSMadkUxftIZT9r/RpJQBYkz0H0YlCUL8LwQq58wr35imLI7R/JF5hTaD+1ElLSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmS9KBfQea2O+dTupwy5sE9Uj0fLSTJYjZsAJfwOkdg=;
 b=BQ1b8tFEfLU6431Qe6MOefdNb+qMjriP4kQLlTrbmxxauw2JxGaUIpYXHNM1C5g4cGtHKnw4d+kBEg1VeiI1VFx15aAmhQXaJZzzO7+ZblbFxYhRuY7b5SaYR1NyUSLq6BgEfNyEQo4kKfWnWV6teleoIjMbvphY1Gk+BImG+RQ85NwfHwlShbTQ+KpxejiAgXDFFKdIlnITuT4YJCA00hBWrN37F3qmKEB+ttsdmUivoVD5MGHzC+61PBySflPEgiI2Cm0ZPmPhuufHUne5hZLFEHxMXp2PMIDIgsyG2vkOWlYpXNoU2NJ+2BHCqMipDYrsWvov909lS846NXbizQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:09:28 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 19:09:28 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Mon,  9 Mar 2026 21:08:28 +0200
Message-ID: <20260309190842.927634-11-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309190842.927634-1-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR0902CA0044.eurprd09.prod.outlook.com
 (2603:10a6:802:1::33) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eaf30cf-b5b6-4c6c-1e2d-08de7e0f6314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info: XYO9VnbvoybktQ4Furv3KSo4w8ZCgs329K9xDBh3mrn3arsSmBVGwfVKixjKlo75ZAag+5143gs3MhdYrToQ2wu6jG9rrikuwqEtujOWTSUPsUuCVrscPVUSW/mS5FyDAU1ypsT3WxfNKjkpUr70SZ9JP2TU5/2QMWhfwu5c/ik10SX2t78SpjQYCt7ueApctsD6YN2gTBPPzUcU5AV8jK6kJtGDBVoCH3fzKIAjxgPgiv9IXxDAXS4mb5IjRCbivL3Tjmo7uoRlhleWXMzCyzwHEvAkmGwGfBxQaIVgVLDatYNqUCtyB1h4nyRtJTwvmg9dDd4c3IRdc3hNkETQfKSfXXa+FLyFQuDhV/W+35cCul8IR7rZFRJzJZv797ifc/k9PJy2ieXivtbs2ZP9UuqKtcDbUgL23elZFYZqRjMqvNUMJSrqpA0xWHHFCAp4mZ9ddEN9hP9gRebIN/87Bi1lX8zUDf4SRWJPiJEk/TP+XOB1U2McLiFj6ik7OiF/+C+Q/8/gb4hoUVVt1CZkSpGSO70f3XG2JgSNdrC6DvOn2lrA00DoIzgjbyH3kiG4+BfT4SQJyQQjVY7xVJKdl7lTi0sOXHrjlT3hgfxQm+1pNZ9i0D0Xy33C1RvGhBVsWoILmig+qvbBl7aoqjTundf9+aVXZ1+bkDdewMMaGfzHv3tVJOUrxmhyjoWCnUo5ANos5osdZ/LFo1ABtHfH2/cmiAGSVCZ9V4LQE6omVWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0h6WkwxRGZSZmcvSTAzZE14c2swVVFnam5ZNVpxSXVoNE1sbkZFQnNRdExJ?=
 =?utf-8?B?R2pIY0xRSFpxYlJLMDlwYklLdjJjYXhvbmN0OEtlWCtQdHNLampXazRWcG5F?=
 =?utf-8?B?aWd1T0ZtTGZ0em1nRWtjdWhMcGd3ZXNWODExdFg4bmkxWVVIQ3pweXVhQ3M1?=
 =?utf-8?B?THFCckQ3VjFIUEJJZzNvZVlrM2hkbUFzU2Vxa0RQazN4aGh3QnlpRDRQaUVi?=
 =?utf-8?B?NE12YlF0elFLYkxGZmNubmM2UHhFdGdyNUU2NEREY2lMRyt1UmthdFIyN2k5?=
 =?utf-8?B?Y0hxR3ZnVFVteGJWTllVVWtidWU2ODgrdUwyQlFqN0h0aXV1REZ2bFBoOWMz?=
 =?utf-8?B?SDJWekw3cVU1ekxMU3pIWFJWdHcraGtmYm11WHlQQkN1cU1hdVhBYWRwaVBC?=
 =?utf-8?B?SEhEWlVkYThCRTEvQXpFUXNrTi9pTklFQ0RUUGE2dzk0WndxN1l4VjBMZnFR?=
 =?utf-8?B?Q1M4K2ljb1k4VlI5aW40Ui9hanMrdTd6b1J3NHRHSlBmeStMWWplR1cvMUZx?=
 =?utf-8?B?Z3AvM0ljeFd1eEtUUkROWHNpVzFqdS96UzlqS0JJUVpDYmQyWG5oeThuV255?=
 =?utf-8?B?SjNOQUFtaXc3NGRKMEZaVXA3M3hpT0hOWDRTOXp6TCtaWUNCRkJCdkQvYjhM?=
 =?utf-8?B?NDVWeW1sRmZPdit1d3BydDJMUkZ2U0Iyb0NHS0pzVmk0L0t6WVlsOG1YdTNE?=
 =?utf-8?B?MW8vMEVpUy8xOExLbCtKY0thZElzOXhRSk1iNWN3TUNHTlVRUlpXWExsdDlp?=
 =?utf-8?B?NzVYRndUSTRiMzhya3cvZlQydDhjSUlXZ3FEODdNZExQWmFWZTdyZDlGMFlv?=
 =?utf-8?B?YnREL1U5T2RSK0MyT3J1REtGcHBhZS9BK2lCR0ZzQk5QcE02dzA2WEZUNFJC?=
 =?utf-8?B?UkxBZENpSk1qWWErR0lsYVJ4N2xpSG90dEM5Y041b1lKcU4vdEN4RlJtVEtN?=
 =?utf-8?B?Z1VlMDZWdHVMcmJ5RGx6WndnK3QyMEpYamN4T2dvUzBJZkhLM2krRFh1cVR0?=
 =?utf-8?B?dTFOb0VKb3N5WTdiZkg3cEtDYi9TSXBlMm1HSXd4bFlTUmFiZWp0dmx5d3JO?=
 =?utf-8?B?L1dFdmNsTGZlTThsYkNxNHF4d2dEaVJROFlJVVEwRVBHdEFtaDFzbXhGR2Q3?=
 =?utf-8?B?d29hbllIOW1EeXgwTHVzVlBoWU1BSTVkTnhaRlFmU2hod1crRmNtWW9kY0p5?=
 =?utf-8?B?ejRZSzF2TlBpQ1JXcnl6Q3VkSVNkVnh6a0M1K0NtTXBCSVA3NEtweFBMVE5Z?=
 =?utf-8?B?QjB5OXhCa1FlMzB2d2toTUJwVmdVZTMwZHJLbG5BVDFtSzl4TGYyUytjL3Bj?=
 =?utf-8?B?dnFueDIrdUxlUkp1a2FNWlVZbDQ1Vlg2SkoxYmg4SlhVaGpOcWEwTkNSYmti?=
 =?utf-8?B?L3oyYXJiRXhYTXd2TmtISFg0M0k1NThZeDFvK2dSa3FwZVdMUTE4Z3R3NU5o?=
 =?utf-8?B?OVFDYWFvT205K1BoSzFPVW5DK0VZRjJyNlMyRUZreUZHeGdJSW5tSDV4cldz?=
 =?utf-8?B?SVNLTmNrSldEWG1vUzJoUmNSYU9aaVBIcXBDSjNQZGppWDh4SXMxNWRXVUhF?=
 =?utf-8?B?dEQ5MkdtS2xzRTVvV1pqR0Z3bHN2VmRkR3FoQjhMeUdFSXFNcU5zZ20rYUkv?=
 =?utf-8?B?d3lkUEl3UllUN3J6YkxYRTBmVHRteEFKRnJRd2ZMWHVaMVhxTDU2NWlIU3V1?=
 =?utf-8?B?eTBvR1NMeStzaFBUVFhLQTc5TGcyak0wekNMTllBeHY1MXdhV0c0c0RwUmtx?=
 =?utf-8?B?SERreVJaaXNVT29KVmtHNzQ1YldRa1laZCszN1ZrSnVVRENaaHNMYTB6NjdM?=
 =?utf-8?B?RnpteUErYWoxZTRQOU5FOWV3dEJjM3J2bjQ3NUxqcWVaWDRGb3g3R0NkRjI4?=
 =?utf-8?B?SUtyVFVYVUN0WHB2V0k3bFk5eDZ5bGpWd1dieWlXQzJKTnhuMEhLZEhtVWt2?=
 =?utf-8?B?YmREMTh0dWE0SnJsNzZTU3BEbHdRMUlTeHpRa01IRzRmeVhZWEpJemt4ZDBE?=
 =?utf-8?B?aEk3UEkvN1hSYzhYcjBYQ3RzSTI3ZlEwajlPMS8ydXd6Tm1XdEVxOXVjLzJ4?=
 =?utf-8?B?SGZ1ZDRhR2p3dXZnVDcwZDRMU1d6bEhISFg1YzZhUVNQOFo4dm1PSW00NWgw?=
 =?utf-8?B?ZlB5R2tjbk9ZNGlLOVhpZVN2c3FJdXdqWmFGQmVsZ1l3UnJhQnRESGNhcUxJ?=
 =?utf-8?B?c2R4eE5CYm1IYXJHaGlSNFl3QVJtRTlLZ2hqTXZWazBidWQ3V21Zb3ljTmNP?=
 =?utf-8?B?Wkh6UFp2K3IwRHVWOVZzeUM1VmJQTjJRN29JS1VuME5hcHBPenhJVEk5NXRt?=
 =?utf-8?B?d0lIY2tyKzlZZmFWQ0lDdjVyalN1WXdJSnJqMVBETXNHQUVNVDh0d2RpSjlL?=
 =?utf-8?Q?CY4fWFVtXH8Pz3W/aNlLz687hFitI4o6tGVTKV1x9WznX?=
X-MS-Exchange-AntiSpam-MessageData-1: B4WtVxcUn2ZezDiKFmgw+vaRgmX+FQXlkRI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eaf30cf-b5b6-4c6c-1e2d-08de7e0f6314
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:09:28.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+pr+dnsQgG25StZQZZgiJZmjDw7G1CWNvAriUxqHPqHLvpslWNNeH7D9XxAsqYvvW03qr7hxylJO/wquDxR2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_120936_793839_DC9741C6 
X-CRM114-Status: GOOD (  16.31  )
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

VGhlIGR3X2hkbWktcm9ja2NoaXAgZHJpdmVyIHZhbGlkYXRlcyBwaXhlbCBjbG9jayByYXRlcyBh
Z2FpbnN0IHRoZQpIRE1JIFBIWSdzIGludGVybmFsIGNsb2NrIHByb3ZpZGVyIG9uIGNlcnRhaW4g
U29DcyBsaWtlIFJLMzMyOC4KVGhpcyBpcyBjdXJyZW50bHkgYWNoaWV2ZWQgYnkgZGVyZWZlcmVu
Y2luZyBoZG1pLT5waHktPmRldi5vZl9ub2RlCnRvIG9idGFpbiB0aGUgcHJvdmlkZXIgbm9kZSwg
d2hpY2ggdmlvbGF0ZXMgdGhlIEdlbmVyaWMgUEhZIEFQSSdzCmVuY2Fwc3VsYXRpb24gKHRoZSBn
b2FsIGlzIGZvciBzdHJ1Y3QgcGh5IHRvIGJlIGFuIG9wYXF1ZSBwb2ludGVyKS4KClJlZmFjdG9y
IGR3X2hkbWlfcm9ja2NoaXBfYmluZCgpIHRvIHBlcmZvcm0gYSBtYW51YWwgcGhhbmRsZSBsb29r
dXAKb24gdGhlICJoZG1pIiBQSFkgaW5kZXggd2l0aGluIHRoZSBjb250cm9sbGVyJ3MgRFQgbm9k
ZS4gVGhpcyBwcm92aWRlcwphIHBhcmFsbGVsIHBhdGggdG8gdGhlIGNsb2NrIHByb3ZpZGVyJ3Mg
T0Ygbm9kZSB3aXRob3V0IHJlbHlpbmcgb24gdGhlCmludGVybmFsIHN0cnVjdHVyZSBvZiB0aGUg
c3RydWN0IHBoeSBoYW5kbGUuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPHZsYWRp
bWlyLm9sdGVhbkBueHAuY29tPgotLS0KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9jay1jaGlwcy5j
b20+CkNjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+CkNjOiBBbmR5IFlhbiA8
YW5keS55YW5Acm9jay1jaGlwcy5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogU2ltb25hIFZldHRlciA8c2ltb25h
QGZmd2xsLmNoPgoKdjEtPnYzOiBub25lCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3
X2hkbWktcm9ja2NoaXAuYyB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCmluZGV4IDBkYzFlYjVkMmFlMy4uN2FiYjQyZTQ4
NmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hp
cC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKQEAg
LTUzNywyMSArNTM3LDIyIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9yb2NrY2hpcF9iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCQkJCSB2b2lkICpkYXRhKQog
ewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2
KTsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2X29mX25vZGUoZGV2KTsKIAlzdHJ1Y3Qg
ZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YTsKIAljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
ICptYXRjaDsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXI7CiAJc3RydWN0IHJvY2tjaGlwX2hkbWkgKmhkbWk7Ci0JaW50IHJldDsK
KwlpbnQgcmV0LCBpbmRleDsKIAotCWlmICghcGRldi0+ZGV2Lm9mX25vZGUpCisJaWYgKCFucCkK
IAkJcmV0dXJuIC1FTk9ERVY7CiAKIAloZG1pID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNp
emVvZigqaGRtaSksIEdGUF9LRVJORUwpOwogCWlmICghaGRtaSkKIAkJcmV0dXJuIC1FTk9NRU07
CiAKLQltYXRjaCA9IG9mX21hdGNoX25vZGUoZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHMsIHBkZXYt
PmRldi5vZl9ub2RlKTsKKwltYXRjaCA9IG9mX21hdGNoX25vZGUoZHdfaGRtaV9yb2NrY2hpcF9k
dF9pZHMsIG5wKTsKIAlwbGF0X2RhdGEgPSBkZXZtX2ttZW1kdXAoJnBkZXYtPmRldiwgbWF0Y2gt
PmRhdGEsCiAJCQkJCSAgICAgc2l6ZW9mKCpwbGF0X2RhdGEpLCBHRlBfS0VSTkVMKTsKIAlpZiAo
IXBsYXRfZGF0YSkKQEAgLTU2NCw5ICs1NjUsOSBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcm9ja2No
aXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlwbGF0
X2RhdGEtPnByaXZfZGF0YSA9IGhkbWk7CiAJZW5jb2RlciA9ICZoZG1pLT5lbmNvZGVyLmVuY29k
ZXI7CiAKLQllbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9vZl9maW5kX3Bvc3NpYmxlX2Ny
dGNzKGRybSwgZGV2LT5vZl9ub2RlKTsKKwllbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9v
Zl9maW5kX3Bvc3NpYmxlX2NydGNzKGRybSwgbnApOwogCXJvY2tjaGlwX2RybV9lbmNvZGVyX3Nl
dF9jcnRjX2VuZHBvaW50X2lkKCZoZG1pLT5lbmNvZGVyLAotCQkJCQkJICBkZXYtPm9mX25vZGUs
IDAsIDApOworCQkJCQkJICBucCwgMCwgMCk7CiAKIAkvKgogCSAqIElmIHdlIGZhaWxlZCB0byBm
aW5kIHRoZSBDUlRDKHMpIHdoaWNoIHRoaXMgZW5jb2RlciBpcwpAQCAtNTg4LDEzICs1ODksMTcg
QEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tjaGlwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBz
dHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGhkbWktPmRldiwg
cmV0LCAiZmFpbGVkIHRvIGdldCBwaHlcbiIpOwogCX0KIAotCWlmIChoZG1pLT5waHkpIHsKKwlp
bmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgInBoeS1uYW1lcyIsICJoZG1pIik7
CisJaWYgKGluZGV4ID49IDApIHsKIAkJc3RydWN0IG9mX3BoYW5kbGVfYXJncyBjbGtzcGVjOwog
Ci0JCWNsa3NwZWMubnAgPSBoZG1pLT5waHktPmRldi5vZl9ub2RlOwotCQloZG1pLT5oZG1pcGh5
X2NsayA9IG9mX2Nsa19nZXRfZnJvbV9wcm92aWRlcigmY2xrc3BlYyk7Ci0JCWlmIChJU19FUlIo
aGRtaS0+aGRtaXBoeV9jbGspKQotCQkJaGRtaS0+aGRtaXBoeV9jbGsgPSBOVUxMOworCQlpZiAo
IW9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCAicGh5cyIsICIjcGh5LWNlbGxzIiwgaW5k
ZXgsCisJCQkJCQkmY2xrc3BlYykpIHsKKwkJCWhkbWktPmhkbWlwaHlfY2xrID0gb2ZfY2xrX2dl
dF9mcm9tX3Byb3ZpZGVyKCZjbGtzcGVjKTsKKwkJCW9mX25vZGVfcHV0KGNsa3NwZWMubnApOwor
CQkJaWYgKElTX0VSUihoZG1pLT5oZG1pcGh5X2NsaykpCisJCQkJaGRtaS0+aGRtaXBoeV9jbGsg
PSBOVUxMOworCQl9CiAJfQogCiAJaWYgKGhkbWktPmNoaXBfZGF0YSA9PSAmcmszNTY4X2NoaXBf
ZGF0YSkgewotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
