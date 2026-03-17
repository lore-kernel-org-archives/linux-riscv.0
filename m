Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4ACFF6E97
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 23:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xv0+TdOaW01dXM7HvwbhFjSga8rCdU94ZGw4xAYhmtQ=; b=Qnmn0f+CcS6rp4
	NJvnl71lw5lYKnkI2vJdqurW4nY/NyMmHICq8geTu1IUdwukD55vuHCy6QVViO0TO48oPhu8rLJPT
	NzPJawc0IVzMGH7oW0SflzyVh7n/u+2rWB0Y4o3K4I8RkBvjjG8nmUHGcAIOJ2tHG4X6knjc0s6Xf
	6Bk/qqc4Op4sT3v8x5ZKsZaduVBgXfI7ylykAw02DkNVGRpfGr6BEdi6A3jwr81bboGLzapJITBoP
	gmSZrlkNiA2y1ieRMI1WzSO1BK8wmdH2OCGqpSWpFKxkJnuJ5eGtdTkYO+bpW3Jq8fYXQ2laRwasX
	jci7GT6PYHJFwbjaV1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dUd-00000007NNn-2Eg0;
	Tue, 17 Mar 2026 23:06:31 +0000
Received: from mail-northeuropeazon11010027.outbound.protection.outlook.com ([52.101.84.27] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2dTm-00000007MEC-3mDi;
	Tue, 17 Mar 2026 23:05:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uop+/OUFPzi21FkaWwVgOsl9+NXLqYTdd9aLSC8mvV3SWgVYfnB/niz7gFiBzcUJhvKyTA23rKSfYUoPEURX3FqTuW4p7ewYbzsqJGwIO3wdE1faaA7NLZhIRNWxQvujYuazUgS+wrAjAds+Ex/Jw/5N7qWzPwh1v3hjYrn0yi4fWGrssxGWr6/7xu62CM6XGNodqW7WSxsDc0ldpOzpxEGGUa+OTDwa781CdZ827n5nZuIPI3HmXLGC5U0mgUNm3qdspbo7b8Bve8DlIXjAbhqizq7c8FaCNTYIxObrx3RirH8UWeNlKEfV0gRClHPO/qhCUVgIVYIcqyn1lOXQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj7gQiNNffFQp3eOaqRbNXvhydrUb1dJBJh1TF999t4=;
 b=gZQVS1+GUGI3ZMSwF9exLRF7kMW+ZvQ0X0bZD/i39I/pljduBHt2kEgtyLDTrcDJpcxUopuPcIWaMF7zbtPNh+O5HJjH4puVEF7Gml5OoY8CIiEFFW8Em4gBlSkQXi0gUAHKS9bNG+lWVkJUkQYKonr8WRwz7zaULqjVPsJZ9GAgfavbLuQCRn16+aAKYU4QXQaG+8IC/BWr8TVkLdHvBPF8qf6aIW+5lpGywvG+Dhvph+WeeBmXdahhwKa6QDlS8HeJe6UhQSDn3w2leRM3TIb8tCzgGpc33q1eKyepU9L9SvOR7roDSqV43sDfGXP12AjrA6Uo+VCBGKVrqzjU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj7gQiNNffFQp3eOaqRbNXvhydrUb1dJBJh1TF999t4=;
 b=ejCzzTKsoeukpKT0S3as9jI7Q57jtWr6L9Lzeh87z2b1KCsmPqCi6zJciqiWsDzjDIr7/XIMQYd4MN4RfpaENVIvLnZXtDo5a07wY5oTC8oqHzcX2BPaSzuWPAzDKYnrUZzh7nGmdRHrsexpdywXeJxYeCIkTy9GcCO9xZ6v8BSh4B3ICY2P7ifw6l/O6ZKtCA1QcAwrPy85Df18jPvLGbSJmwy3Yf5JsF2Xqu/OOqEZa5pxtyhhUFrMaq6IZtGWo53zgdehdtOGwLs3Nu50dZlSk201QanqB9GKVrDq5JA8cXYv6TZ7uFw7y94jFbAFXUC0MAQ47Fp1l0nyeV2/Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI1PR04MB7022.eurprd04.prod.outlook.com (2603:10a6:800:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 23:05:31 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 23:05:31 +0000
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
Subject: [PATCH v4 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference of phy->dev.of_node
Date: Wed, 18 Mar 2026 01:04:46 +0200
Message-ID: <20260317230500.2056077-11-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317230500.2056077-1-vladimir.oltean@nxp.com>
References: <20260317230500.2056077-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR06CA0178.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::35) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI1PR04MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d73884-a1e3-4fea-dfd6-08de8479afd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|10070799003|7416014|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0OwxsAGG/7nAUXTZVN9Bn5YrvZ7eteunuZEDyTt3hRBhIc6WO0dIDR3iXoQqzsxoo8XbG4M2cAuJEhCU5bTKdJQ93C3T1i5hiK8mAkBGFVAcsGY9GNHcLk62JYxNb0Z599EQ1ym2jRY8R2hsxdAL1pk25HzluiIhQhk7TpIoJh28V5GIPwppPe/FQ+SNBXTPpi3Utjik8sCJVxGVTJZpDzf6NgmEnpja4LIQkaOfkvyJ94axWVMsx7zwh0chTl+75a8uwx5GawZrobT9eeb8DHQmlVe+TN3IQ6Q5dfDTZSRiNVQlwWlvP1X5fuEIbquzLJG5a8+IufKRGMSjsQGZAGRpfIZqcJRpJaNnbQhRojNtiv1IaxazD0JidTh2fyroylLZD3ahxZ2WBOHfaFc0ckg0SBEL2qa0YzB6IR8PCZfiDRLQXiuBCXS44HewUmMFuepE5rNYa21kr+2XlaCviX3qVvmb7UvagsdDGZEBOaqueP8jLtPaoq3Ee2QHbdlwzELbG2fglMzSz0RIvM7TUHhXQDsJSQaa68ogcl/sbPB35+XvWCMd1yC/S87/1QMqsSuhzFrecgP3pSU1nURXV7OCIiw8KJBhwRjz+rDTFnlVSivO+A6yy6I5VvDjO85tA5ps4PVY7uPe18PgAFOVincrT3ZSOoO0vnwYpSMcWLS/uXMHxFP5SHimq+LQPKyxtxg15lhCMNXJz9ZiIjkVz7hPAqY0KRKnevVwV8KdpV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(10070799003)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXErRnEycnRzRS8zTVVpUmUwbDBOT0l1Y2NyR2U4dW0zWUNKOVJiaEYrSVNI?=
 =?utf-8?B?TEFka082UE9Bb3IxeGwwbGxyRFNJbGx2QVhOekJKVE1hMTRPcjhsdHQ0Qkg0?=
 =?utf-8?B?VFhTWnVWSnlxd2tTbjh6cjZ6UHJDckVHYWFESVBVZEMySWdjbW5MWFE5WnZK?=
 =?utf-8?B?UGFoazlRdE04RVNnbjYyb2hRcUlaaXF6ZC9sTUV1QUdpZXY3WHFDWk91T09F?=
 =?utf-8?B?VlFrYkZhYXlNTTBDSXFUOU1ETlgraktsRFk0TGlsT3JxelZqSk1mMkY5dm1j?=
 =?utf-8?B?OU9tM0VSNisxYWMrcERKS3NFZXVObVQybTZUS2Vnb3h6aDlDWkw0azhxZUF4?=
 =?utf-8?B?ZzNiWTVPUThnWmt2V2QyVmp0Ylh3V2NXU3BqaVAxUFlWa0hhRzRnbG9TdnlQ?=
 =?utf-8?B?MGFNYUxmTFRXbVhlOWxEN2U3eTZRaWxTSS81MjVua29KQmlsdk1nTFhCdG1V?=
 =?utf-8?B?aFVCcUQyUmZHUE5VS2IwTlRqbVNuOWgwM2gvK2dydjExOUoyeWVkSDhTdk1F?=
 =?utf-8?B?TmFmVkQxVVRTU1FvUlIvOGhkQkFySnNsbEFaZTdFSjJOOGZvM1JtMXpYbnJw?=
 =?utf-8?B?SkxKTUZYMVBDa1dkOEpRSk9wQ084Ukx5SUtUSTIzZ1dKOTlqYjczbTNUMy9R?=
 =?utf-8?B?UWhqL2JhdUhoeStaWUdTSHE2b2h6UXRNd2ZqVUpESXhka1pkQTkvWFJmZ3lN?=
 =?utf-8?B?MlpFYUxYZFJxMmMybXdPd3dHQTBqOGN5VlZ5UEljSDZVcDBJRklWZ3FEZ1hu?=
 =?utf-8?B?YkRjRm43Z1ZUclh1SU5zUVlCSDk0bkJRQlRDUmlwWTJIUzFnL1RZblhEeTE0?=
 =?utf-8?B?Mmp0S3VVMDRrek4wN0MydlRCMHpMVmYrK2EwM0dOTHdTU2dRVTJGWENvUlFm?=
 =?utf-8?B?bC8yaWlEOE5ERWg1ZjZzRmcycWFCUXVWSjRpUVg4ZnpPQnFWL2hYWkU2Tm10?=
 =?utf-8?B?aEd6aGNtUXcrdm5raEdUd1F6MFhtUU05RTdpb055WTZPODhkVUp6UCtmWEli?=
 =?utf-8?B?TlNHWjNlR01TeE9sN3ZOQW9zQXVOMmRkRFZBRVA3NmR0UlkvYmlVVFNaMlJ0?=
 =?utf-8?B?QzkrNUxDV0NHV3RxcVA1MXVmQlZ4N0M2RWlYRTdGME5HUjZwUGlYdEpGTkYv?=
 =?utf-8?B?Yk81c1ExU3NsUDQvaHZsbmQ4NGVNK1JQVmRJdENKRXkxc3UwbllSY3BPc3RU?=
 =?utf-8?B?bUpNbkk0SjM2UDh6QlErYU1kbVp3OUs2U0Y1YmxENmNrVlRsU3haWGR4NGRL?=
 =?utf-8?B?SmxCZ1Z1NXIzNzE1NmZOWm90SmlXVVVJSUF0dVhsYVMwbHZOYnlYdXVham9H?=
 =?utf-8?B?SEtINVJ1cGthNHJyZzA0MkV3RExYQnovaWlTdm9oM1VYN1RJTkNTcXplOXdz?=
 =?utf-8?B?TDRCTU9ZSE14R1hIekFGZ01EcEFGNVZHajhTWmJzYi9nTGQ4M0xBdHJTdEF1?=
 =?utf-8?B?K05ZakViQzN1dkJOQTRVRS9JdGV4b0YvSlVabmZ5dXZPOFpoY01uaVlvTGd1?=
 =?utf-8?B?QVVJWjdHbE11VTBjdnVBek9vYW41SHcwbTBkYk8yakoydmVnTkphV1FVMWVh?=
 =?utf-8?B?VVVBeW5sKzk2Uk4wWDFNK1FnNzZwSEN6YlhsM293ZXZySGJsMTVrRHZLWGJx?=
 =?utf-8?B?VE93TWJoUFVpQ2NxZ0owcS9ORDY2S0pkRlFsTFVpNTFkYzBGaERURHRwZWcv?=
 =?utf-8?B?VllkWU9uNm4xaTJpMnNwd3Q5N2VZa3dMcXpoVUVNa1VMUDJYcUljYTREbXB6?=
 =?utf-8?B?ZGs2Y3ZEWmRISXBpaDdlY1IrM3RONG1hRVhycUc4YlJvSXFBbkNzdTNvN3dV?=
 =?utf-8?B?SFdJMlpqcVJGbGwvSi9rVERDRXVTN1QxdDNJeVdtbkpTbE44clFKczlBeHQ0?=
 =?utf-8?B?V1RPeVp5RXdLNFlIVGhaa2tTQWNST1l6OXJuVkFQWTUxZTB6VmNKTlV4NkF5?=
 =?utf-8?B?K1Z2bU1xTkRZSlJQemxQczdyMFdTcUlKZkZJQ1FReE4rSG5sZFIxSHU1Vktw?=
 =?utf-8?B?U0FadlcxenNZRThuRUphdnErZ0g5R1RGSlUxMnV6S2ZqaEpIdjBTTVppVWFi?=
 =?utf-8?B?cXkzc0JncndpTGJjSUJjek5NOGlQeGNkdEplNUlWbmZGQk05TGlxS0ZFVERF?=
 =?utf-8?B?azYxRVppZkNCMFlDekRzdDA0cEpFUmJtMTZodEZJQy9LN0tGWm1HQytxZTQw?=
 =?utf-8?B?akZCa3V4YXlDMFVCNXlYVkJZK3dtbTd4Wml1dmpCZWRlcUpqdlpLQnM4WGgv?=
 =?utf-8?B?YStOMDBxU3Btd3dKWXRFTlBBSTFuZDQ1bHVUU3JxSndxN29tZ2NTNE1MbWg1?=
 =?utf-8?B?M2pxNlR2ZlNySkdhSzFNVEV6YmJMZjhtMjY5TEpoemIvYm94ZEQrZ3MyeUYz?=
 =?utf-8?Q?PkoEPU5HTohozV5vLheWfVA8fCZpB8vhdLTOvDUlEwH1z?=
X-MS-Exchange-AntiSpam-MessageData-1: hXzpyB+kVTINXBQmJk7CMcxx97nhusc2S/Y=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d73884-a1e3-4fea-dfd6-08de8479afd9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:05:31.0930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrgyRr+J0ffjYm3Be8DLa6pdiDMS3kGaXp8An1Pz7ke4c9oOCf8OzJ3DVxvOhyfEBKsZGfiAN+0HRjen6PxLlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_160538_946596_B79235F4 
X-CRM114-Status: GOOD (  16.55  )
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
aWVkQGdtYWlsLmNvbT4KQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4KCnYzLT52
NDogYWRkIGNvbW1pdCBtZXNzYWdlIGNsYXJpZmljYXRpb24gb2Ygd2hhdCBpcyB1bmRlcnN0b29k
IGJ5CiAgICAgICAgIm9wYXF1ZSBwb2ludGVyIgp2MS0+djM6IG5vbmUKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIHwgMjUgKysrKysrKysrKysrLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKaW5kZXggMGRjMWVi
NWQyYWUzLi43YWJiNDJlNDg2YzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9kd19oZG1pLXJvY2tjaGlwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hk
bWktcm9ja2NoaXAuYwpAQCAtNTM3LDIxICs1MzcsMjIgQEAgc3RhdGljIGludCBkd19oZG1pX3Jv
Y2tjaGlwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCiAJ
CQkJIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3Bs
YXRmb3JtX2RldmljZShkZXYpOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXZfb2Zfbm9k
ZShkZXYpOwogCXN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSAqcGxhdF9kYXRhOwogCWNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNoOwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBkYXRh
OwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlzdHJ1Y3Qgcm9ja2NoaXBfaGRtaSAq
aGRtaTsKLQlpbnQgcmV0OworCWludCByZXQsIGluZGV4OwogCi0JaWYgKCFwZGV2LT5kZXYub2Zf
bm9kZSkKKwlpZiAoIW5wKQogCQlyZXR1cm4gLUVOT0RFVjsKIAogCWhkbWkgPSBkZXZtX2t6YWxs
b2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpoZG1pKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFoZG1pKQog
CQlyZXR1cm4gLUVOT01FTTsKIAotCW1hdGNoID0gb2ZfbWF0Y2hfbm9kZShkd19oZG1pX3JvY2tj
aGlwX2R0X2lkcywgcGRldi0+ZGV2Lm9mX25vZGUpOworCW1hdGNoID0gb2ZfbWF0Y2hfbm9kZShk
d19oZG1pX3JvY2tjaGlwX2R0X2lkcywgbnApOwogCXBsYXRfZGF0YSA9IGRldm1fa21lbWR1cCgm
cGRldi0+ZGV2LCBtYXRjaC0+ZGF0YSwKIAkJCQkJICAgICBzaXplb2YoKnBsYXRfZGF0YSksIEdG
UF9LRVJORUwpOwogCWlmICghcGxhdF9kYXRhKQpAQCAtNTY0LDkgKzU2NSw5IEBAIHN0YXRpYyBp
bnQgZHdfaGRtaV9yb2NrY2hpcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZSAqbWFzdGVyLAogCXBsYXRfZGF0YS0+cHJpdl9kYXRhID0gaGRtaTsKIAllbmNvZGVyID0gJmhk
bWktPmVuY29kZXIuZW5jb2RlcjsKIAotCWVuY29kZXItPnBvc3NpYmxlX2NydGNzID0gZHJtX29m
X2ZpbmRfcG9zc2libGVfY3J0Y3MoZHJtLCBkZXYtPm9mX25vZGUpOworCWVuY29kZXItPnBvc3Np
YmxlX2NydGNzID0gZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3MoZHJtLCBucCk7CiAJcm9ja2No
aXBfZHJtX2VuY29kZXJfc2V0X2NydGNfZW5kcG9pbnRfaWQoJmhkbWktPmVuY29kZXIsCi0JCQkJ
CQkgIGRldi0+b2Zfbm9kZSwgMCwgMCk7CisJCQkJCQkgIG5wLCAwLCAwKTsKIAogCS8qCiAJICog
SWYgd2UgZmFpbGVkIHRvIGZpbmQgdGhlIENSVEMocykgd2hpY2ggdGhpcyBlbmNvZGVyIGlzCkBA
IC01ODgsMTMgKzU4OSwxNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfcm9ja2NoaXBfYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoaGRtaS0+ZGV2LCByZXQsICJmYWlsZWQgdG8gZ2V0IHBoeVxuIik7CiAJfQogCi0JaWYg
KGhkbWktPnBoeSkgeworCWluZGV4ID0gb2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKG5wLCAicGh5
LW5hbWVzIiwgImhkbWkiKTsKKwlpZiAoaW5kZXggPj0gMCkgewogCQlzdHJ1Y3Qgb2ZfcGhhbmRs
ZV9hcmdzIGNsa3NwZWM7CiAKLQkJY2xrc3BlYy5ucCA9IGhkbWktPnBoeS0+ZGV2Lm9mX25vZGU7
Ci0JCWhkbWktPmhkbWlwaHlfY2xrID0gb2ZfY2xrX2dldF9mcm9tX3Byb3ZpZGVyKCZjbGtzcGVj
KTsKLQkJaWYgKElTX0VSUihoZG1pLT5oZG1pcGh5X2NsaykpCi0JCQloZG1pLT5oZG1pcGh5X2Ns
ayA9IE5VTEw7CisJCWlmICghb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MobnAsICJwaHlzIiwg
IiNwaHktY2VsbHMiLCBpbmRleCwKKwkJCQkJCSZjbGtzcGVjKSkgeworCQkJaGRtaS0+aGRtaXBo
eV9jbGsgPSBvZl9jbGtfZ2V0X2Zyb21fcHJvdmlkZXIoJmNsa3NwZWMpOworCQkJb2Zfbm9kZV9w
dXQoY2xrc3BlYy5ucCk7CisJCQlpZiAoSVNfRVJSKGhkbWktPmhkbWlwaHlfY2xrKSkKKwkJCQlo
ZG1pLT5oZG1pcGh5X2NsayA9IE5VTEw7CisJCX0KIAl9CiAKIAlpZiAoaGRtaS0+Y2hpcF9kYXRh
ID09ICZyazM1NjhfY2hpcF9kYXRhKSB7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
