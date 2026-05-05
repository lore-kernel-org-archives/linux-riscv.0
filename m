Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6182CD3436
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOo0U4bM0X2n333uMHeis1hoWV1eaCeGVr0M+67N1ss=; b=wFuIsONki4Akw2
	LTZZcHHBQn3+3geMpiu0oFR8GsnuXsO/IsCRWiH7Pzk5IFgJKlC5TfcPLxzFP1GE9aWeEnkCFTV7I
	GmATN0M20nZP3eYAnmRQCTK684GFvW7OA+qnAYqQIysncXcgVt8taxF5or8QKCIDfvuSGFM6D5P7w
	7erX+4aWbSBIqz/qn5owhN6GeoDH59TA37PNj+vQIZc+rZHPe4UzVIACysYw3e2sE3j2fiD3CR5Qu
	KYmi5d/gTeYeQpBkMQMhMK9aFTjl4Xr8u7PYDiG2+UPTpE1n0hZ9ODJmaO9T9nXtdGM75M7QS00gC
	2DG7pGuJMFhCUnvMrMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCgQ-0000000FmgH-41ix;
	Tue, 05 May 2026 10:07:19 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCfa-0000000Fkdf-41SE;
	Tue, 05 May 2026 10:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcQFGQpzZ/GzkOX0Ok1zah9S2bL1las+yCy2cSLtwZ7rFEkh29EW7olbCtrcLxnH7vGyIufxvL6BBYhKxgHIZSC1ZUqPR18Wg5URXeRCUmdZNVK3xsxQ9/KoWdXEzWTwYdUiHafoAwFLZk3tTqi4K6jIcZxEuZiF8ORCWcLLlfNQHZhO5vUVKoNdhqFOsfXWlRHMn2Yu2vCgrtvHVHcyVcpF+2S9HEZRBlFxPDP2TMQn362zdeHAvPLOicOPYI17lJN8TaqkKc0dxOfm6uH9MfEpxIXBjqVDBiZskBiflq3oJksimxpqnrKuzQCT0a/TWCvSmF0btKHacNQKJvF5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weEL2i1hxJGgS7vYKMcDgw10jYGVvvghvREqdK1mtnw=;
 b=VDj0/wpsiGj/jrf3prqjc73KlNj+i0169+7/fhKcBAlhd1ZBZQ/kwbN5v2qSsdFluKz1t61AdPfmv/4aWjZdDsPRi8Af5Fasm8GCNn+A4hntNa1y3WMrC9OvorSeASvFANMiUQJuF7z+WsRKPCH8CWlDhFUgqW21fsZyWgdRAYhph6HgCqTuiQMf/iGhBo3IDBLsDZzgsm4xdI8xbyW97fVOE1NZxnb9OwYP9FXEdXbI/wirzNjAPj9I1NI2+6CKOxPJaFVxXQet5yOH9sB1juOME+0xL7CJ89lx+Fp1taXpe62G6x7DiStnHlruYQusR5DcyzBN2Fz7mhUxcNSWiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weEL2i1hxJGgS7vYKMcDgw10jYGVvvghvREqdK1mtnw=;
 b=mWqKXI4IEyGl6jFikGfGK+Y4z0flmVn3hQTps4magKszUXNbO9idM1qdw2xWZzdW7baCIMtV19E5LF4WHJ8oI9kwhq22wnPfmjZKjBUbgZPTcDM4EGmECV/hOT359O36rA8ngxp7tyjopcuy7jZe1a/1nS3SnIwofcY96UmfUs2uqdIk0vdPNcKyjklCGOPFops57kYQ42mQpffOHOMQNIV0DKWdVl+PIxVjiGR7kJ3LQBdNotO1WFy9RhDRrc8U1MBs8AmvSc/rDUTGXRJcnY72vyBt8FqA67HyvmYdkp6ifnhMjGLumWcH3pjWhdP69gqcupjah2+JjAq858QJyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 5 May
 2026 10:06:11 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:06:09 +0000
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
	Heiko Stueber <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v8 phy-next 15/31] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Tue,  5 May 2026 13:05:07 +0300
Message-Id: <20260505100523.1922388-16-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: FR2P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::21) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 870da5f8-44a6-4f9d-d93c-08deaa8dedb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|7416014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: u0NM0OmiL2uEkl0JKrW/x8bqQIGgXTfgEFALncSozU/TOAOriN30VcpKhecBk4/86NEUZXHNf02VMpgYkYA1Yor0qiqK0s2Z2+fsbbSPmNYg4QM5Ni6MbTCQBHKaO3IuWFuowP8VOCqQw3nWGtf7Ci42G+UiOplO8zHmF/Va7pbc/fUcoGU+83o4BDF25P+hmo594wAexusZZmj9htlxIYhndnPMm97Ks5Kh0FwW3e9Kqt2FjesdbcSpI4cM6/fvmWnYoQSCZFUfNZkjbQyN1zIqxj3n+jvLKktIMGXIKzLp7jxXjnmid4uxrsIpFWO6I1rNmBXTBmc3PU1Ro2O3LwRp++/EJKWITADcprBpxGFaC2ORcByTdWsdPrym2wef582M69z6lZ0TswkewyT1N653mRS2TjCFpEmyjUw+om1o0lTX2lLRe3cycctP/rHtu76NzSS+NUDKMbLyWV208PMHlB214vrwz7XNOt4+qfFnwlufNH++bUqQzhleJ8m6vr5LdLHoQbeFfhcRJcUyJdjNJwd5f26rft3QgfWs8hn4Z34M3hK13+duTG6C6gbWI4LesfJlHRDp4lTdxdFWFaPUvKSA6iJ9KkEyyEFKB+0Ret6maRuZ26pcoi534f6IbGq9flca6S2USh65h3xQfKA/q1G9tuQzPKua/m6Kv2jEoH9v+lHA0/br15dn1zOl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(7416014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck5VelJPVFpydzcybTc3S0xGQmxQRjdFbExjSk95cktKL2dmblVNTkpoZVFo?=
 =?utf-8?B?RWVObWNsQmU4akNtOUJwQmNmMWdqSkRhZWFBN3VZU2VmUlVlL0xIODlWdlY5?=
 =?utf-8?B?UDVEUk1VWnAvd09FdWZxQS9VWCtzbGVkeWRKdlhiZEF1TVJaWU80djVUaGRj?=
 =?utf-8?B?eXVmeW1YRzF1QmRsOU9jMll6Qm9lU0JYcWVXNTVNajVzait4T0wxdkZKOFVK?=
 =?utf-8?B?SERaMjBNTVlVc3RyQkZLb2Vmd1FTM3k3QUFjc0laY2VJT0pGV2g3R3pQc3VP?=
 =?utf-8?B?eHMvOGNTYi8zbE5ZR1k4SlVmNGFHdWlta0cwODdSWGdEUmpzRDM0SGF6MHYr?=
 =?utf-8?B?eVMzdDg4R3JmVlJ6YTJ1WU92MkJRVVowUFgxYnd0NEJiZ2lnZTkxMDl2VFN5?=
 =?utf-8?B?VlJSVzZGcE9Xb25uNmpqU2VTeXhBZGpDZDFBb1F0MzlrSUtxaWR4UmVFcFVT?=
 =?utf-8?B?Y1lESzZhdnVkbk1XNWordFVkV3JWc3hmMWdZRVlmTVllazA2UDRoQ2JUajVv?=
 =?utf-8?B?ZEJPSUs2eVNqNjIxL0dUbWVHWnNqZUtSc05ldVZVVTdLMVluRGtFeFl5dlFw?=
 =?utf-8?B?djJPQlM2SzBubmV3aDk2SHpWT3JyWkRrM0ZvSGhxc3U3Y0FOb3hTMTBuKzZJ?=
 =?utf-8?B?dEtRTXZYaC9HT1JyNVkxYjlNTW9tS3N0aE4yUzM0MXp0cmhTYytzcHlMTkFL?=
 =?utf-8?B?a0F6SnpIb0FEc0VHeFY5RWZSU2QzdFF6YnZpemcwT3NRTVl0L3p2Q1JRT0ZL?=
 =?utf-8?B?UFcwV3BlRTc1NVprMmREcUJCVGYxMVJwWUVrWDhDNWQzbzlaZFkrQi95ZEFV?=
 =?utf-8?B?ZDVtVFdsK0dwUG9OY1RKWFNNL1Arck5yM2g0dEdFZktUSXVQT3VOS3hlb1N4?=
 =?utf-8?B?OUsxUHBFdUZSTjFPbGxoVzI0Wm1ZR09POHZmbko1NG0yTkljUmVhUVFnWUFr?=
 =?utf-8?B?b2lxNzJtWUs4cmg4YmkyQ0U3eHpvTEUzQzluT0EyUE1QQWlxaThLeFppQzRI?=
 =?utf-8?B?K09RWXN2U2M0eU0rNWIzazF0TGZXd3lmcml3amN4YVh5STFqYmVyQlVQUGZj?=
 =?utf-8?B?eWlwTXZkOFFGeE1TOHpzb0dhdGJqSXZjdVhXWUtwUSsxdmV1OE1TV000ZFR1?=
 =?utf-8?B?ZUdBVzBKcTBNZkVFczgwbzJJUmZnWW9POGhmZWlPNXVoRUg4eE1GU0RGdS9G?=
 =?utf-8?B?cS8zTWU0V0tMaUY0UjBlSmV3YmtldldLeGtmSTFnaCtOWlkyeC91RTFORjdG?=
 =?utf-8?B?bUZVNVhqYkVCbDYvME9qQXdBSXlUamhFOERKNi9zWVVWVmRLRzZscFpNN0Mr?=
 =?utf-8?B?bVp2NGJoODl4QThqWWVRODhERGZtcVlRak43RWlLMTlmcFRYTEJGQ25PNFB2?=
 =?utf-8?B?WlBSOThkT3hHMmFuTFlJUTRKa3lYd1hlbUxMSFhWNURDZENmcHljM2p4M2Rx?=
 =?utf-8?B?VGtycUEwcmxJQVNON2tuVWhlR0JvazlMMDFHZHI0UXhTdngzeFkvN2Y1bm5X?=
 =?utf-8?B?VEhKcFRYVlZmT2U1eTZ0VGxQcUt3RFRXdWl2U09KUVN0L3hxeVJ2WFB6QlRq?=
 =?utf-8?B?bWJmU0N3ZWRBNkVhRXJlUzJrSVpadTZqREQvYUFLM2RINWk0UmV1TVI4TVBQ?=
 =?utf-8?B?TGE4SmJ4UC9sTVhMUThxVE9BemZJcVlRNjJsakhxekp1TE11Nzg3QzNuS0Fy?=
 =?utf-8?B?bjkvcitXeEsvQlROUFIzNUZkU05kQlp1c0ZZUjhYVkZzUUlraXRXSWxOVUtT?=
 =?utf-8?B?bVlaMW53cXY2ZWkwZU1WcDRDUExDVW1YYnhUUDRzdWVKUDA0ZWEzU0paUFAz?=
 =?utf-8?B?ZmFqQ0hGNXRZeHh6eFRnUUFSUzBhU0RwOXhyam92ZEVxRG10QXF4N2Y0OWM1?=
 =?utf-8?B?YWNOOUZsYXNDQitvL3dMSVVNdE04MlZodnNJejNJMDl6RHNqZTdZR2UydnhV?=
 =?utf-8?B?YXRYbXNKSWIwSytuWnVRZ3BsUXdkaW0wdk9HSm1YSHdmZzVYL2FjMWc2djBT?=
 =?utf-8?B?VzlVOVk0ajNNc1hVK0lkd01ic1Nuc0N1dndKTGo4aWpmdmY2WCtGemRpd0lX?=
 =?utf-8?B?NitBeXJMd0FDdGdqNE56b2lYM3JrVStUeEdJVGcrR3ZGOXI3emZqbi9sSFp2?=
 =?utf-8?B?OU1sNEVVYjdqV21VMzFZRjUyQityWk0ya1J0MDNuM0NuUDdQL01TT01TU2Uz?=
 =?utf-8?B?TW5adFBIZ3VvYmJueXhNeDZ2cFZMdG0wQzUxcWJWTHFvWFVwa0dKMDFLZHJo?=
 =?utf-8?B?RU5waHFSMmJWdVEwVHhBTG5vMk4wa2ZsZVFKVlVwZDdENUhnUHgvUE16b0lN?=
 =?utf-8?B?dm1XSC9VYmN0akhhT0NuWG9kbXJxamZucDJZaTRVaXlOMSs5SlV2QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870da5f8-44a6-4f9d-d93c-08deaa8dedb2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:06:09.0236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VE54NA+2Sy1ZKD9hVo3xgupbnUsTDWezPvbMNAUlnvYb17QEvxjZy9qAFjmznGYEaikADoW2u7+/y+k2q1SZlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_030627_042022_0E63F9E4 
X-CRM114-Status: GOOD (  16.67  )
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
b2FsIGlzIGZvciBzdHJ1Y3QgcGh5IHRvIGJlIGFuIG9wYXF1ZSBwb2ludGVyCndpdGggYSBoaWRk
ZW4gZGVmaW5pdGlvbiwgdG8gYmUgaW50ZXJhY3RlZCB3aXRoIG9ubHkgdXNpbmcgQVBJCmZ1bmN0
aW9ucyBvciBOVUxMIHBvaW50ZXIgY2hlY2tzLCBmb3IgdGhlIGNhc2Ugd2hlcmUgb3B0aW9uYWwg
dmFyaWFudHMKb2YgcGh5X2dldCgpIGRpZCBub3QgZmluZCBhIFBIWSkuCgpSZWZhY3RvciBkd19o
ZG1pX3JvY2tjaGlwX2JpbmQoKSB0byBwZXJmb3JtIGEgbWFudWFsIHBoYW5kbGUgbG9va3VwCm9u
IHRoZSAiaGRtaSIgUEhZIGluZGV4IHdpdGhpbiB0aGUgY29udHJvbGxlcidzIERUIG5vZGUuIFRo
aXMgcHJvdmlkZXMKYSBwYXJhbGxlbCBwYXRoIHRvIHRoZSBjbG9jayBwcm92aWRlcidzIE9GIG5v
ZGUgd2l0aG91dCByZWx5aW5nIG9uIHRoZQppbnRlcm5hbCBzdHJ1Y3R1cmUgb2YgdGhlIHN0cnVj
dCBwaHkgaGFuZGxlLgoKU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5v
bHRlYW5AbnhwLmNvbT4KUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWViZXIgPGhlaWtvQHNudGVjaC5k
ZT4KLS0tCkNjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgpDYzogIkhlaWtvIFN0
w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgpDYzogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGdtYWlsLmNvbT4KQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4KCnY0LT52
ODogbm9uZQp2My0+djQ6IGFkZCBjb21taXQgbWVzc2FnZSBjbGFyaWZpY2F0aW9uIG9mIHdoYXQg
aXMgdW5kZXJzdG9vZCBieQogICAgICAgICJvcGFxdWUgcG9pbnRlciIKdjEtPnYzOiBub25lCi0t
LQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyB8IDI1ICsrKysr
KysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1p
LXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5j
CmluZGV4IDBkYzFlYjVkMmFlMy4uN2FiYjQyZTQ4NmMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKQEAgLTUzNywyMSArNTM3LDIyIEBAIHN0YXRpYyBp
bnQgZHdfaGRtaV9yb2NrY2hpcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLAogCQkJCSB2b2lkICpkYXRhKQogewogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gZGV2X29mX25vZGUoZGV2KTsKIAlzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0
YTsKIAljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsKIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZHJtID0gZGF0YTsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7CiAJc3RydWN0IHJv
Y2tjaGlwX2hkbWkgKmhkbWk7Ci0JaW50IHJldDsKKwlpbnQgcmV0LCBpbmRleDsKIAotCWlmICgh
cGRldi0+ZGV2Lm9mX25vZGUpCisJaWYgKCFucCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKIAloZG1p
ID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqaGRtaSksIEdGUF9LRVJORUwpOwog
CWlmICghaGRtaSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQltYXRjaCA9IG9mX21hdGNoX25vZGUo
ZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHMsIHBkZXYtPmRldi5vZl9ub2RlKTsKKwltYXRjaCA9IG9m
X21hdGNoX25vZGUoZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHMsIG5wKTsKIAlwbGF0X2RhdGEgPSBk
ZXZtX2ttZW1kdXAoJnBkZXYtPmRldiwgbWF0Y2gtPmRhdGEsCiAJCQkJCSAgICAgc2l6ZW9mKCpw
bGF0X2RhdGEpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXBsYXRfZGF0YSkKQEAgLTU2NCw5ICs1NjUs
OSBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcm9ja2NoaXBfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAlwbGF0X2RhdGEtPnByaXZfZGF0YSA9IGhkbWk7CiAJ
ZW5jb2RlciA9ICZoZG1pLT5lbmNvZGVyLmVuY29kZXI7CiAKLQllbmNvZGVyLT5wb3NzaWJsZV9j
cnRjcyA9IGRybV9vZl9maW5kX3Bvc3NpYmxlX2NydGNzKGRybSwgZGV2LT5vZl9ub2RlKTsKKwll
bmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGRybV9vZl9maW5kX3Bvc3NpYmxlX2NydGNzKGRybSwg
bnApOwogCXJvY2tjaGlwX2RybV9lbmNvZGVyX3NldF9jcnRjX2VuZHBvaW50X2lkKCZoZG1pLT5l
bmNvZGVyLAotCQkJCQkJICBkZXYtPm9mX25vZGUsIDAsIDApOworCQkJCQkJICBucCwgMCwgMCk7
CiAKIAkvKgogCSAqIElmIHdlIGZhaWxlZCB0byBmaW5kIHRoZSBDUlRDKHMpIHdoaWNoIHRoaXMg
ZW5jb2RlciBpcwpAQCAtNTg4LDEzICs1ODksMTcgQEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tj
aGlwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKGhkbWktPmRldiwgcmV0LCAiZmFpbGVkIHRvIGdldCBwaHlcbiIp
OwogCX0KIAotCWlmIChoZG1pLT5waHkpIHsKKwlpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0
cmluZyhucCwgInBoeS1uYW1lcyIsICJoZG1pIik7CisJaWYgKGluZGV4ID49IDApIHsKIAkJc3Ry
dWN0IG9mX3BoYW5kbGVfYXJncyBjbGtzcGVjOwogCi0JCWNsa3NwZWMubnAgPSBoZG1pLT5waHkt
PmRldi5vZl9ub2RlOwotCQloZG1pLT5oZG1pcGh5X2NsayA9IG9mX2Nsa19nZXRfZnJvbV9wcm92
aWRlcigmY2xrc3BlYyk7Ci0JCWlmIChJU19FUlIoaGRtaS0+aGRtaXBoeV9jbGspKQotCQkJaGRt
aS0+aGRtaXBoeV9jbGsgPSBOVUxMOworCQlpZiAoIW9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdz
KG5wLCAicGh5cyIsICIjcGh5LWNlbGxzIiwgaW5kZXgsCisJCQkJCQkmY2xrc3BlYykpIHsKKwkJ
CWhkbWktPmhkbWlwaHlfY2xrID0gb2ZfY2xrX2dldF9mcm9tX3Byb3ZpZGVyKCZjbGtzcGVjKTsK
KwkJCW9mX25vZGVfcHV0KGNsa3NwZWMubnApOworCQkJaWYgKElTX0VSUihoZG1pLT5oZG1pcGh5
X2NsaykpCisJCQkJaGRtaS0+aGRtaXBoeV9jbGsgPSBOVUxMOworCQl9CiAJfQogCiAJaWYgKGhk
bWktPmNoaXBfZGF0YSA9PSAmcmszNTY4X2NoaXBfZGF0YSkgewotLSAKMi4zNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
