Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FE3FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUNV0XxKcLgJZKto2hhefyFtgJZemddLuu69ud7Rt4I=; b=aqmuvVPzwf28ZH
	PwbpxMiQ3V1l8BMGfYkZMDY31QODxfytyjYBVNi26ejKQ0mFIjWbuOZDSwrVNGd2ioQyqp8wCrACd
	r872ptkPGO8XndDx0LOpNHCFaJDCc5wHEnUOCTcT5y33JZ+yUqSs41BiKjIAP60mDdVwZAUIsm+1w
	/My14IVXgWewolxf8I1TJBp66VP+Humi+ghH+cw1IcR8KKA3YfPQTDdE2s01+qHfiEWsYqYGbiThA
	gnnXguZZSodBXguGubdEluh9DbGn88lZLqPFUZaCAORQRI3S+TMOOCb2vGuDpXBrN/ijIVDfgze8p
	4lbDaJ2IE3fZou5VAnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPFl-00000005H58-11xG;
	Thu, 30 Apr 2026 11:08:21 +0000
Received: from mail-swedencentralazon11013007.outbound.protection.outlook.com ([52.101.83.7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPEw-00000005Fjo-31cY;
	Thu, 30 Apr 2026 11:07:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJePuW3H47VYLIPvSGT7+Z0vF9llBL8Toew0zzUsLU5/0nUWcrWxv+ptHqmRgJwJkgK/JzUSKvBf+MsnXkuaC8uNKdKVQWhiyUqqRZxIeV68Fxeid7Z5JKpbhsInE9tsQv+Eue2XHTQvddrWhPqbS1BzOxEtRh1cQTW+QiDUaBlaMy0qWv+o899Dptxq1e2O+AUKWQOLZoz+j20Oh8YkN4iC6PmAvI1r4OdcAlwANTiPzeJXavcJIC9+rzrXe/fX51RCgR3F2yp0MingL3bK3+AatjOoxxmfihnCYkcFF2ZKTnGuqwpCH3DS76ewBf8f4jPEAtb/r5H7leWEUYnTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIWImDhFoFRUTB1MQmQH08WbG1zXPmUNoZw37U0hNq4=;
 b=ZNck74F8N75zWWwjtoqVsq3EJNWjIAlfXr+6IKgc5txb2DTJM1GNF5uz/sUL5oxL3ycQK9ixaXgcE3P/G99VOco4tKxVzS2rilnijA/t8yCrDabgTAmmYe+rVU/NBIQaHPkskshrAPZDoXhTXR+1pSjLSFWKQvY0pdJ8ckSPBO8OOlS5AnvIQ3CLkX9uTqtTi+NA9mPnBfTb3fRvHThHZlD/BtONhRvbM0qbvkkLky9Oxw7pduJ/oruPlCSFiw0NWqwRE5AKAElB3owi+Dr6Jh8OWJxXX4QiZ7cru1j9DM0U2Z5wpjcVZP4x2EIPLr6DkK6Bkry/tX8jH4amXdQRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIWImDhFoFRUTB1MQmQH08WbG1zXPmUNoZw37U0hNq4=;
 b=TOV9+q1r/Yj8Ijr3K5hKEjO/eghLo5OPUvlLixTC+WNypF+vbxWZ91Y1J7xn0uQ7X3249UhcaI/M/qm8xV8Jiu9o1FKMp3ESP2Ak97XZs8ZT7vVyEbshU13zVx4ioPuy9o1GMY3XpFLJQ9YLLCLUL1qDFq3qaZWNs4eyzWFsJlbOdrru/oQZQAZSzJlNevhAw4FlzEZgQK+0aY0/d0i2+d0IdVTmjCMVrzDRB6UYm+SUN6hq6IMz2jlRpZCuOeUSbTdKRYZdwk/1QaIB0avmL3BIzK0n0WQLdft7sfAoYbX7c2asW9ORooKQgle+5bangk4f4pJKwkwGLRtLpzdwjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI1PR04MB7182.eurprd04.prod.outlook.com (2603:10a6:800:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:07:17 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 11:07:17 +0000
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
Subject: [PATCH v7 phy-next 12/27] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Thu, 30 Apr 2026 14:06:37 +0300
Message-Id: <20260430110652.558622-13-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430110652.558622-1-vladimir.oltean@nxp.com>
References: <20260430110652.558622-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AM0PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::35) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI1PR04MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: db646d73-fd00-4d41-3668-08dea6a8a431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|19092799006|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: IVUr3iPHMjqRHlgO4H8Az9DKhkUSAxhJOPyaD8WBtG4rkKLcdFrpE/XuBgy3eUL5x/uQZqgJM1C8NKBTFZ5UvR1E0fimyaqAliifN9KUJneC0XQXd86O3/e7sdGhfKPxQ6hEBKJxg1LTbu+icQyLXh4fI1NS8lQAO/BFjhv9xrUZARyJ0NQt152qJWsG7gQuZr9haBm0ib48NC1Dukexh88LU/A+8D5UNro+iKUgMqI/hS/lri0fMTXPLOnDJ3fpffUX3zG/etTnblR1EVjRK+CAFT3TlfXR491eDsqyDdDa7Yj9U7Oh1PZaaPS1bqwUh6edo+VtphpuF8w/GD0zmLUwKlYpQ9iK1ljV7456VX3Yu6JmAZhTRgWZlsXT6cXBE18kiloMONbQJPoqqRB1DtY//2yw5FV94njQwdnTMG+VJj7fQS/kPCPoobf5YW1Z2p/4OvWwrzL6CjL8PW5bF9+JsRAVNwF/erHJsXMcsb8/9w+KMPWJoKQz/PISJwqJDVVBbazt07O26KmJeyzoh+VHDQHgDthSTMs7wRP6xwZWV01DZ/Jw5sj2jr+K3dYa7MzduySNJe6eBX4OKpzAgCja+BM5bctTdrDKMNUAVjZ74DQq6/0zVr5MXAnPFdVF4H51rTNEniqppHIXN/R7R62KpUpie38X7XF9c+3/4OQ/Nea+HyOUXysrvqZ4yCE5II1UZ7Xo9XrjRHP6tjdvioR5QMBJO90Xd1kXrBtBdks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5YdmlwZ3I2RGxLdDM5YkNnOENaWVpxY2U4VmVjTWNrc2VIR2M3ZU5vUGhl?=
 =?utf-8?B?V1ZLWUU3TWo0WjE5OWUwNkhWY1BuTGZoUFpwWU9valNpLzFwUXBvUmc4STFr?=
 =?utf-8?B?aFJMUVUyTzdWb3ZLOHNXUmR6bE96UWhOMHc1V21VM09nem9VWWd2NS9BVGV2?=
 =?utf-8?B?dUY5NVF5OCtyeGNVWUFhN29tUURiL0IwS0tVakxVMEFBc3RPS2tieG9KcG1K?=
 =?utf-8?B?TTRWZ1pNQVoydWJrMHVoNFZtUjFBVFRTYlllRVJCWmdzRVlHSjliU0Z3UlJF?=
 =?utf-8?B?anJ5azFIaXBRUTlSYmJ6STNVZ1BPdU5pbUhnOWkzUGYwR3ZMOCtUVG1mTWwz?=
 =?utf-8?B?bHc5b1l4WTdvRUcrUy9WcnJkMnIzU1dqMFNzaWg3MU1LbUU3RndlQzk5dmNP?=
 =?utf-8?B?UXZFclJnK1plYVlSRUZmdzROYWdDOGp6K0tsVmJOM3hJTVlaekJlb0E5UjF3?=
 =?utf-8?B?Wmd0UEdWZTlFdGJGVVJvNnRYaTk2akhydGZoNUJmSzhzbTNNUi9IWkFJRnor?=
 =?utf-8?B?Y1RhS1BGUXd0YzBqbWp0aThCb1hFRFBDeE1GaW1ZYWExK20xREVLbHpmcTdE?=
 =?utf-8?B?aVNnb2t6QVhlS0ZxUnExQWQ2T1lHR0s4dkFTMXVybUtNdmlTUnd5b0dDT3JW?=
 =?utf-8?B?eVBQTXFOYUI0bmptUXova2dYQkJveGxydm85QzRFOXZ5c1ROSlgvYU1TdHNL?=
 =?utf-8?B?eEpHNVk4ZnRvSDFRbVBVaktTV1NVYWhWdXEvdlpPSnVVajMwUlp6N3lYVGZo?=
 =?utf-8?B?Y045b3RHcklqUU9aYnpvY3NJNkNuY3RFNHVyY01YVTNiYThlcGpHbXdsMksx?=
 =?utf-8?B?NGgvNDNMYW1hVG9CQXJoVnJGODFVRy93VVBuaXJqamZINVpaQmh0dDJ3c2Vt?=
 =?utf-8?B?RW5EQWhlRTJvZ2ZFWTE4MUhacDZKZ1AzUm9MN0ZtRnllRDF0bG04b09PZ1NY?=
 =?utf-8?B?c2dJUm9qL3ZkWjZyRDc2SnBhZC9qWHF4ZHU0SlF4NVIxZGNjTXRicmxwOVgy?=
 =?utf-8?B?V1M3N1grWHZmeHE3S0xvMWM3WWxXMlYyR1hXbWp6MWtXLzV3UmhSbFJ3WWND?=
 =?utf-8?B?QnJBbEVTM1BYaXo4VFEyM1VmWWlJeHllMzhaM1NtTTVQbU1WYk16cU9YSkYv?=
 =?utf-8?B?TDEvSm1YK1cvSE1kOExVUVBFMi9ueW4zQUEzWFNKUWl5U0pGeHE5alZ6Y3RY?=
 =?utf-8?B?VitGejkxaXREcUxWazZpbUUzUmZiZGdybncwam94cTBodlg2M3ZIYllJald5?=
 =?utf-8?B?TlBNQThLUDRVR0NubGpwb2F2S2xNRUlaRWNhUWs4WDc4U0pLSXZkZlZmQWsz?=
 =?utf-8?B?ODd2T2xJRlB4QUhOUUtDbDVzOW5XVTIwdGhIY1VVb2E3WVlPbmh1TUJrSDYr?=
 =?utf-8?B?cGFKVHRoa0I5N3J2QzM0bVl4b043YkJDY3VKQVhwWE0ycld4YU9qU2dlVXA3?=
 =?utf-8?B?NGVGMUJHajV4dndxK1M4dFE4aWt1V1JjNXRXQk5XMnNjSDIxek9TdllFcGpP?=
 =?utf-8?B?NWZIakwwczNuVHlzTEFSVEQ4QmoxMUI0QnJROG9WdWh6QkZDazl6RFgyaTJm?=
 =?utf-8?B?WEoxR1J6TWRxcFgxbFIvUXdJWk9xbXZseU1GZmw4QkRFQjQxZ2dLTFRnUkY0?=
 =?utf-8?B?MHprWGs0UERaaTdsdVJVZHVoWUlRN3ZqT3g2RWNoWGNuT3Fqd3RISmUyQTQ0?=
 =?utf-8?B?dUI3TDI5Z3krQlh0RTlTV0ZsU2hTbFQwaEZPMVJXaHEyZyszRDBleDJqVEdD?=
 =?utf-8?B?STlVODlwcGpMY3AwUzU4NlFSN0xqb0JaZHJJY05UTkE5eDJid2RlVG9yb2ZL?=
 =?utf-8?B?bEhxNXFJTGdrbm1ZY0xSYmdtcVNJSk5NVkQxTFNRLzdRaUhwa0twQjh5TkJo?=
 =?utf-8?B?UGNKWDZtUFEwZkpjUW9kd1RIcUpoMk1JaUlMTlV2UVpKSXpMRlYvVWVSYW5I?=
 =?utf-8?B?Q3BSS0xYZ3JTVHFHaU40MkFHcmYrSnNuVWtEUVltM3dwWFErbi9UenlkRS9Y?=
 =?utf-8?B?NEVUdURSZEF4WnBMbW15SndCbXdqT204TGRLdENlQ0cvWUdrazAxb3hGSkYw?=
 =?utf-8?B?UHhzV3lSYUlZUUFvZzh4SG9XVGZCam5COG9FaHZDV3lNcFZmOExqUm5oNnA5?=
 =?utf-8?B?RHF1YjJXQ1dNRkI1ZlhXUHkvb29aUzBNN2tCK2Q0Z0wxRDYxbGtsL0J5NnNQ?=
 =?utf-8?B?Q1JHZmFMSkhucnpYL0hWM2k4TWEyR0E3VWZaNnMwckppRlBlbVpHL3VNajYz?=
 =?utf-8?B?UXFMZE5CY0FPMVRYRndzdDlHUjJ4NG1JTW9SaVc5YVF4bFd3d0U1VUd4UVNF?=
 =?utf-8?B?dUJkRkZPM0ZPTXNkMi9SZ3I4WUFBUFNjT3dsMkdpSEhDNGtuK2pReXE2WnFJ?=
 =?utf-8?Q?8KRej92DgZHDTgXm7exCTSOp328P31xJ8KgQN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db646d73-fd00-4d41-3668-08dea6a8a431
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:07:17.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tezv3psilxXrmigSU/eM7ogguU80nYMJxJjVEs+eMYMSOE11cy3ZJQ28Bqa9MlyEvBd+9ZrAh1nP0nnseilUmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_040730_777068_E76EBD93 
X-CRM114-Status: GOOD (  17.07  )
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
Nzogbm9uZQp2My0+djQ6IGFkZCBjb21taXQgbWVzc2FnZSBjbGFyaWZpY2F0aW9uIG9mIHdoYXQg
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
