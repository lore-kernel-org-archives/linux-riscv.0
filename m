Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23559D2F7D5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 05:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tgVRxs5FBRrpqUsc4ZbKwLNP00xJ4k23Mxot05ZKfco=; b=3NnUo0qBmcAaNk
	TjkWNAYsDUzTNq4GixtYDS/m5f/C8xOOGtoHfV6brICLGc3w49RBeCTnbp+wejo7BiyMt+mTlqIgF
	wIwUfR9mwh7l1S7VehSa14ZOCkiwT5VeIaekLlA/RvDkL8mvSD0Xt7D2kAO1Y/sMIUdsmsNKWKYxm
	ivmlm5uE8Ia6FJVLZ6qT6Az2kdwJ6h+aztxUNxu8n2eKBZYiDb55yrz2QSdKI76zoO5sQKJlVGPcd
	4Pn6A1eOtvJChwyT4xIfmLCgaL5o2g8pGtVz6cUvJ2guNx6fINZBaKzFKJCmMcXZGyvqogKkSSaUL
	whC68sEQWiN4k2CsnEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JOo-0000000DoA8-3U4w;
	Thu, 17 Oct 2024 05:50:14 +0000
Received: from mail-sh0chn02on20728.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::728] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JOk-0000000Do8Y-3uwW
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 05:50:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcecbOkJawIYe/ZUr5yPCm8I+yEKW4nVvymuSaSqDkzVWip1Z8zp7v6irdAQBfvoB2+A8/9nGhL7PkljRM9tzIMD0+v+rngPOvozxnBYl9V2ISPYQfjTht5cr211+fm49pTaIpdZn9zQdMd86nqTTgOMaggqGbu4YqshhsENG/RYngPWbP0Elsua0ca9qMjUNgDlRb3kTKZK3vTqul87JO3OrXWE+n2toc9M325FzYvJ49l13Ix6Y138UhoQ13etb0QJF3gWeUWGQZsClfghwGM30tlSa46rfzDxxCuMF5KiIQDxm1RVdanLm7YhYq5nbQLEm1C3BYGitIDMtxtXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61UnXYdKhoXtrfRJvUckrBT4nw7iBxV3lYqvsE1aSdg=;
 b=kUBeMM/HmOw55o3udueRJPUTNLFoJ7Xr3/0OmTgbhb6pxw9CvyEtwTdnMyIrjgAMpJP0elD1B/FZXk9vTlBTZrRxSi5xxYg7m0OiZonozzMeEtSSTR+yOrhmOkiPcPtsQc9r1GAqjA0C5Xnwb7RZNaB294VicWGIw11ALv6ILpqZNpBHTosOIKjM8nw/n0TVo7dJiYV+dbQfl/Zwf9zugxE9WT/qoLgQMrnT1CFFNK1EilxFQKM6oXkwg+NcUBcbMz38G6np7+0oR6Pd0fxr0ZWUO68lgylw+nZU0a6GNNdEeusttQRLkYZISloNNGL+pPNaBkie3oI1qfytV5r58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1143.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 05:49:56 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8069.016; Thu, 17 Oct 2024 05:49:56 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYxXSByaXNjdjogZHRzOiBzdGFyZml2ZTogZGlzYWJs?=
 =?gb2312?Q?e_unused_csi/camss_nodes?=
Thread-Index: AQHbIAerDCyRJ1WJg0mmvQeCtV44grKKI3cggABMoZA=
Date: Thu, 17 Oct 2024 05:49:56 +0000
Message-ID: <ZQ0PR01MB130298186E09DA19CC1F7736F2472@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1143:EE_
x-ms-office365-filtering-correlation-id: c72a0a12-766e-4dfc-6e12-08dcee6f8769
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: rAG/GuyFxBLHk8gMSgQ31671qZU2LdX/PF0AQSpfO7keQmOPmw+QC5ZDuedxbfxg91oL3JQ3nCy+MruwFg2K9O7sQix04t6qqQ8CDZYFIY3+f17JIWMuaRW7FFdZ3xzfb3MCC0z2NrWnHHqkslOHldVlAzQjEQ7RKSy/v9nDJ2hz2Lg3Nmq/UMCU9M18QN2XZwbR9Dy/JnD39hWXXwa6MBfpTFmjBWOyWJrxSLmrTMGgexxRDIyyHwI5lnJbN79BjFYrHPoijPBTLCaYaNU1QnNvfF3iPiQEi0zb1UWryzXjtk/A9aObC7LLseskwmpwnzpCU+P55K6xaVPCnVTs01kkzqanjMNlASBFdOPFTIv9OdYF7cO7I0C/5uWDxQQFMv5TyA17It46kWa81mI0UiJL7wy9pFrl6gEyrlwbu3qgFYPSWm/UmMHQkzgXRUJjvZ5Vg4vUwiW+bsohYG9Rc9wHE2VRHSAWRKQ7+caCdciCcCoA/v2Jt02PArN3z20kuGvDH1QJySUP7hVhGEROt2GblXdqHN+IiUA5g7bOYvAsO/bm3d1Xa+H1T888fNg7JmhKONwNC5UhDvQ/ojVlxtXaj3d/brHzjpvXhUXXwommh9CrGXSYjLFM5LQPde9J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZXF0Y1RGa2l1cXJLTTNhVmg4cG1HN1BGWUc5V29BNmM4OTdSd1Nzc3RxaW15?=
 =?gb2312?B?czZFQ2xZcEZ1QzdOWmxaOCtEVnBLVkN1NCtISHFvaVo2R0ZVc0xiZUFNaDVW?=
 =?gb2312?B?NnlpZmJ4SFdnSTV5N0xjaGdNamh3S1JLU0lpRXVvUmpHajg2TE9IUE5UZFFv?=
 =?gb2312?B?Z0xOQjdadEFwTS9yaGx3VU9MQk1jU1ZqckROdzVSUHJsNWdFZzNhYmpLajNY?=
 =?gb2312?B?UC9QcUdkekdMVExUY25nUkpDSWpVeU1DNTJEUzhtRVJvbVdIcisxVTdYSXho?=
 =?gb2312?B?cm4yaTBBTU95ZmtRK05kYnBrOEFuS2d0dDJSa1NpNDJneEVFeWhFQ2pjZFRY?=
 =?gb2312?B?UHVXVmU2UFp6cW5rajdTSCtzeE9vc1ZDSXY4MWYyMXBQSDZ2Z1BDc3lNSjYr?=
 =?gb2312?B?QmlUZmRsb3JOK0ZTMWlVYnFRRysxd0dVWVhSV1h4Tmk3WjZRYTVsSjJkY0k3?=
 =?gb2312?B?SjRhN0VsZmM5cEJraUY3VjcrUy9rUHRVQUNWZ1cwbzFkcmI3T1FabGNlRFNa?=
 =?gb2312?B?ck1BcCtWWDhway8wTGp0UmdQY0VWbzF3Zm5tRDRFRGlDRERGQkZ6SnVDSE9G?=
 =?gb2312?B?dWtEVFoxb2czVDVYL0Q1R3pwNnVzaHVvbndENFJDYm9mZ29sYkI3TXVhUXRy?=
 =?gb2312?B?YkdDT2NlOTZzYm96RyttUVpRS0ord1pvOUZuUWF2NnlKOGlqdzg1QUQwRVFY?=
 =?gb2312?B?VktrNVBBdURJTWpKcW5iQXBBckpleWduUmprM3lnSUpTSnZkTjBPckhNcFRC?=
 =?gb2312?B?a216eUhmRnAwb1lUcGppSXhlYmp6SkxQdG9OY2pSRGNFOUpnbThwbHAyZE94?=
 =?gb2312?B?eUI4eGV5bzhoaHZ6VnJZNndIUFhEZFFYQmIxVnJURkNMdEtvL0pZNkFGMEx2?=
 =?gb2312?B?djFGQTlDNGFEL2JLOUl1U0hqb3F1ZG1pTmhvcktYYUtJS1AxOFdLSUNhdEda?=
 =?gb2312?B?ZkVxc3dBUWIvV3p6d1h6V2wyck9ZU0ZhU3V2MjFoM1NTUndYYzk5MnVxVnN2?=
 =?gb2312?B?TUtBMjBQak9XVDRGa3l5YVBxWjZuM0FtMmZZdGg4ZWtVTys4WUd2VHAvMFlx?=
 =?gb2312?B?cGdHTTlIRjlicjFDM29ZeG91Zk9SVFFsOG9wM1JwS25Ub3VQSUNtMGZqSDBC?=
 =?gb2312?B?ajc0aDd0cDdQR3hjZTM1ZzFXVGxWZ0xJeFJXMGk4ZTBEZVRuM09OSFljalpG?=
 =?gb2312?B?QXdHN284UUxLZjgwZm9WRXNKQUhKNXROeXZHcFFackkzNCtQOEgzYzFOUG54?=
 =?gb2312?B?ZEE5WkhHaVNDS3VHV0NOTFRFNS9hZTc4YkpnN3JiZFJyczZMMVR2dVQ1aWk1?=
 =?gb2312?B?cUp5NzZOd2YzbVZpd01ESDZCQ0U1THlQZUpPWlcrbGdweTBhTWdrbVJsaEho?=
 =?gb2312?B?UFhwRnBoYWtyMTIvbWhjRkZoeWhVRjVBODhqbEkxdlRDaDkzbVJaV1A5NWk5?=
 =?gb2312?B?bEJkZGhkbDUxaHdlYVg5S2NVeTcvekdWYmxIdlRXLzNPVGtJeklsU2RkRUJh?=
 =?gb2312?B?d0xhZnRJWmVkTnZKcjVqR2MwZ0RZQ3BxWlhkTGpZd3p4ZjkwUGtqTmVYaUpa?=
 =?gb2312?B?NkF4eTJNVXhMcEcxNWFJTG0xeWczSzB1SnVOK0IrclB6eGRqR1Y1eEdqMWZl?=
 =?gb2312?B?RFJEUjBxOUI1QVV1KzZkUnR3YjEyRkdHOG8xMWN0ZW9yaVp5bjJyODFQeXJW?=
 =?gb2312?B?RHhLL1ZlMDdLSnlpQm5WRTlraDlKTUZKcnZSUjNEenp5N0ZDWWNoeDhBTWZ0?=
 =?gb2312?B?U25zekRVa2hBWk8wKzZLYlVVMHlBdzhkSm9UdmF6QmFDUjZxbER0Mm1OZU9X?=
 =?gb2312?B?NlZPVHZzVnlrWjNkUys2SER5aDdKM3VuZlhJVnBJVFpmTk16YllxR2YzOTNP?=
 =?gb2312?B?R1I0Y1F2clZoRkxydUJURG9Rai9MOGx0Wng3aEs5SmZvbGphZUhLcDVvVm1s?=
 =?gb2312?B?ZEdMZHR5MFNFNmJlL0ZGVm5oNlEyTkxYc1d4QVdScEdLbzRnajlZZm9Cb1Nz?=
 =?gb2312?B?Nk5aR3Q3OFNpOXJ5ZldVRGZwZTNsUHJDUXozeUVuZ1BpU2Z6ZU9oenRJNkxW?=
 =?gb2312?B?aUxVdGQ3UzF1akhBVTNRTTNXLytMSFZnbzJoUTgxQyt6ckJFT3dZYUdoZjdj?=
 =?gb2312?B?TDlkMGxkZE1TUCtOOHEzMzh4MjJxbUFUaGtUZENVUElQN3lKV04rNklqdEd1?=
 =?gb2312?B?SUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c72a0a12-766e-4dfc-6e12-08dcee6f8769
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 05:49:56.0190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dE0fm7YPRvNcwEO1rxZsUl9cm0cWtPLTZHPBhf4+amwJhWz+Nymh+ovs8pG1gg3T47tm8J3NPC+0H7EnI4a7XJrtO2WF1M9lYkhgeK25kDl4q5Qg+CdugAxGCnZNz6iL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_225011_002839_78775FC6 
X-CRM114-Status: GOOD (  11.55  )
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

Hi, Conor,

> Hi, Conor
> 
> Thanks for your patch.
> 
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Aurelien reported probe failures due to the csi node being enabled
> > without having a camera attached to it. A camera was in the initial
> > submissions, but was removed from the dts, as it had not actually been
> > present on the board, but was from an addon board used by the developer
> of the relevant drivers.
> > The non-camera pipeline nodes were not disabled when this happened and
> > the probe failures are problematic for Debian. Disable them.
> >
> > CC: stable@vger.kernel.org
> > Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera
> > subsystem
> > nodes")
> 
> Here you write it in 13 characters, should be "Fixes: 28ecaaa5af19 ..."
> 

After fixing this:
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
