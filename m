Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4C606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NMuur1PB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sbr99STDBpFP2vGjIh3JLA7K4iTdByd9GBJokT2Yx28=; b=NMuur1PBN6Y/3kg6qU5pQOzGhW
	rvsgh0CgN+ZsXhBGofci9DH9MhXd0BRb715L9ZJzpFz26h8WqVE7AbQZjNXaE2zy2nTXvhQfJrVc5
	mI8Hx2s1raNYike4nTrjMjhFdid8c4oPkJQoWHHRW2lJgMFQqlmcYrBkJv/rQJOsuaK71kzoOwItD
	2SURLd3xDZNouvkY8/2nR1Ih37cDfQVu93FpKKeVis3I58byCFGZpxxnv7yqcK+kH1NPqrnxqLy2Z
	JxjHyzZ1BJGPHuWsdq7AvgVTC/pPH40xQgYSB2dutjjTezOeTUGZfsSQIxZ+k3sBn/QVGcPDeJlBg
	bDhiaXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKWP-00000002Bjy-14In;
	Mon, 23 Nov 2026 03:15:13 +0000
Received: from mail-bjschn02on2072a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKWK-00000002BhE-39fc
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 03:15:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLmTjprBq/QmLizQ5pLGVtqed5O1pjMLs60HuXlaTCtnbocwRH9/S4bkHuHVpwVuOUEyHWAgP/19PY3OnA1PGfnow+76pZm2FJdvKuii2q83mkVnNibuvUZZEZxGOv8M8Ojr2hIh2Jv+hDgEKCcTmuHncHfK1uFSCA86ItfHV6W92ix8GtXFEVohoTW4kpgXNC5+504483AYaDbfEJ439cO/LC2IImgfrjOMVYR0h2fo11FIlcFL+4bm8myayMGsheJoIepjQoslnPvyrcfy+AitcPfe/XFSKfrcK5sJ86q7uyRTuvPw6efwy0FwyDWffgFdsjXU1h0qRjwqMiMorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbVDFVdfoZw0yv/mdmyIg+RS94OUUsv+WkS8iC0pIQo=;
 b=eC3Yg1w2yavmwNa1cOHzdzsG9ggm+mSnwOBTSD1Jisa+nRxfBpZZjyXtK65Bxv/TrV4iUdGT5LtkCUgX3/3xaZtmz5a1KY3nBuZlykKac5eIugzkEPInoWhf0FmrToCqer8lp9F1Sjtgx7PI82xE7DgFH7dZWf3U0+njKJ8ZXJ7aH1FOIVpKxF+kTL7INXhinj+n5f7vSNtVOnnhk1yRyB5m2/D2UdGrMGBjapfuxqFDr5CqBxLkt+ZNW9VtSCDjHk8VicLqvPN6Ia2KcVj35W4WafjgQCgavao7fSS42L/Yj++TRDvtgqcIi5nmvg60a+mrRVPK5qrhVruRk0BDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1040.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 03:14:35 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 03:14:35 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Maud Spierings <maud_spierings@hotmail.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v25 0/2] Add OpenCores PTC PWM support
Date: Mon, 23 Nov 2026 11:14:26 +0800
Message-ID: <20261123031428.20536-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
X-ClientProxiedBy: NT0PR01CA0021.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::9) To NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1102:EE_|NT0PR01MB1040:EE_
X-MS-Office365-Filtering-Correlation-Id: d058dae8-60ce-4bed-af75-08df490fe6bb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|52116014|18002099003|261009223027099003|56012099006|261102123227099003|261028144727099003|261021123027099003|261022105027099003|261026121527099003|261022075727099003|261021121427099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: 2fMY0IOeLzsbaEv68FeuOdT57w+LZa0U1ZN9sjfEKYYZh1+W8sZVfB2lwuz6j6By9uadMXsU3bjlNBCCzkXXXM8XF/EDu52br4BZ+W1h9nAnXucdwTELFcP3kByGrBzi0uuk1oeEfDthz77xeK0ZTen7KpB5Ga9qRfhRhYc6jVYIt78Ro6hgOzv8kECXbB7EztVAKbYdTjbc3dFVsuT9V3dce617UfvsAqJDWByVbaBMLtplUejvIN4dCGwOvTZHoaiS5qjDgdu10b5FV+3JQWFFxaG/qhBBoPa/AyLwSW31qFUEe5L1D0Tg4yvTRxr1dZLbJelICRTtE/bJ9yLACinyz/N+QqDmw4QT/IlIw07pwGUu/kJb2Qb2rml6GMGMkUvwNDfXIKYMzsHsz/x6CLC/1f33WeG9WkW4RPJwfqtLBTJr/PS2tfKWogViucoicXGlG15xg9oM8094ZxWPqpih1K1k+oCJYw7+Qe6r73FwcRpj24VLsLp/NCz9L2IRzk3XLG1txgVZrSFaxKdymzAh/lxtMCrf8mfUYeaRJNY4NPFTz6KglkpnyCLEFH8w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(52116014)(18002099003)(261009223027099003)(56012099006)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WvuTYYu1TrNG18u0rsex/oHhaHTzqfZ4sV7yawQ5CK29hHctl1VUgVC1UPvD?=
 =?us-ascii?Q?udQiYAuHAwCwKMDFEwEmp6raKF2To0RPHsoDUyCBpZqYQjy41E9CbmysjtsV?=
 =?us-ascii?Q?UFRkXyEdTpzFiv4T7chHCyXb+YjLtqBRLhptuTVPj0kycn5vZaKJpcbt2HJO?=
 =?us-ascii?Q?AmmGdLFYpa9gTdiNTIddX6YQk8z7xg6bQt4jAlmULqlq0HnER/hZAxWcK3aT?=
 =?us-ascii?Q?ii2N14W1EYByi/I99doRRd0J0+HTeYo01RVZU7OY1Yw+H1ggl0WLmtCg7vQj?=
 =?us-ascii?Q?kGWlRLtkoebG6pMrtJRAJE6Ndt7uGjNVWvxb9dsPgEb7HLYHMNMzeMN1yWH7?=
 =?us-ascii?Q?bZqhbuYngRO+AyXWz4cEQLt0KEIampKkWbh/Eg4xAxxxrgFJwnTLYDEcdg4B?=
 =?us-ascii?Q?Y1KooJYavGBQtGVnzHnUEZuzhaRyk6vLqurMbuNqCoPi64FaBv3ts1q24EtW?=
 =?us-ascii?Q?YTBT9Qbzn3lfyHr+4kOZ8rMUokvrWnihurDIPW1QyIAHyBNKxAv3sTvnuD0r?=
 =?us-ascii?Q?1eS96k/xWbqcuIiUOLVQLXhXHMQQoKY9k+fHAsrw1yKswnwVEc/B8CcTWfzs?=
 =?us-ascii?Q?s1OXcFR1NLAWKSCgOHzqtQj1ECzI7pOU9ndmpBMz612uBTLwUQVraw07ebFk?=
 =?us-ascii?Q?OPndGaI49oA+VcniB1pKkovHnWG+0IiY4E9rkKYc43wkJLEvSd+NmGsLR0MX?=
 =?us-ascii?Q?cMavPQS9WoGKyIllBKMyaNoV0D71LcymAE20p3VB5mgo58SfbYQhYxZNlA1d?=
 =?us-ascii?Q?cnUhVdj8KS4QEz5F63D5K7s3i5QWGUidOiB8ywOTbZWEpL18ZdTA2Ks5ybt+?=
 =?us-ascii?Q?NQxj40xDet8leMG7MnbNgimN+/0eNYQFTblHDlBGYTs1Hfq9c6ZNYr/wrNru?=
 =?us-ascii?Q?T4uUFtKQxvYp/WakRp2BhCvEEI0qWzG34bLrJKsc8Mu7PtkShuxsuB/RZmyM?=
 =?us-ascii?Q?Rawd2HmiuRW3jpd4e4jU279Pp3z1mC+CqcedENp80exEX/Tt4XHbFBu75/8b?=
 =?us-ascii?Q?N7vgk5+BNG8JqwfzqnYHhZv4MaRJzha/+LeeWl4fhJ3n5QLhNLOIcOCoV7mr?=
 =?us-ascii?Q?zzf2kKWxOMB/C4pCRP6CV30VwuLuPpRpEXuMo6l+zrVLeIXjSMufr+1Jqu/l?=
 =?us-ascii?Q?QdUU9oqFnIwKpEhWYSDEo1wVv9SjFGartlJf11U/yryg5o27vhhybPJGeklU?=
 =?us-ascii?Q?oZ08vwWQgUI9FWyefUV7+wvPLjRTsMjJjG6hiZaKhH8AGRRMyLM8KlT6pYXE?=
 =?us-ascii?Q?HZoei0keGNP7jRWHq3JnTZgnEEK2NAS+iqvWX8QQF/nEYKIUE0l/G+DCSVCb?=
 =?us-ascii?Q?0zWd5kTTLSBurE6Zg7uD4PjGXZxLYiZvd7+SWz+0lBWN96s+DCzubK6tJ+Y0?=
 =?us-ascii?Q?eJSRkfch/ZgApXU80dNFnuryOIzJqgLBDFrIyHfZ3Cd5hZj2lgiFLb0hcHR9?=
 =?us-ascii?Q?WgNciqOB27c9QhLwvmdN4AmMNUscFYWHxoRmH6fWnOP+9KOMGF1f91p9XUgm?=
 =?us-ascii?Q?GdCUcOjNjjSHtHsDmVHiOG8dp8cxm1vlCu7nAcUn9rqna60IDM0ofNWy7UAU?=
 =?us-ascii?Q?Jqzl8AznlsIuRvAmHxwzq+zT791tiv+Xi8lhLXBTELHciLS7BH1Rj4CPtDbD?=
 =?us-ascii?Q?oop3SwiLlXQyBqnuxeVndTpxXxMTIytYeg/MYloUE8D4QCY8KgGbEyqZV4aS?=
 =?us-ascii?Q?EHzeg8UY8+ea/MFX0p3xslsuYOWvb4PCkfHUhISXhAjgQhCD2/OLtYM8kqjG?=
 =?us-ascii?Q?4dZRO8Z2HwKVlRDHMRpg/eDR8R9A3kQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d058dae8-60ce-4bed-af75-08df490fe6bb
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 03:14:35.6505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0QdWBdS7gtRskS35tcR1zXUOj/BnY6Md3O4H1kUoAIOuE0WOyoXPiMFyWCDCUKMNjy3orhVKQzk/6FTHv5bOaicEu8ZETcKXoDYjD3D3xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_191509_590603_A1769613 
X-CRM114-Status: GOOD (  16.54  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add OpenCores PTC PWM driver which is used in StarFive
JH7100/JH7110/JHB100 SoC.

I will maintain this pwm module in place of William.

Changes since v24:
- Acquire clock rate exclusivity with devm_clk_rate_exclusive_get() before
  caching the rate.
- Read and validate the clock rate after enabling the clock.

Changes since v23:
- Drop the Tested-by tag for the dt-bindings patch.

Changes since v22:
- Drop patch 2 since it is already merged.
- Drop the starfive,jhb100-pwm compatible from the dt-bindings, as the pwm
  module of JHB100 SoC differs slightly from the OpenCores PTC PWM module
  in polarity handling. The support for JHB100 SoC will be added in a
  separate patch.
- Move the polarity check later in .apply().
- Add comments for keeping the reference when the pwm is already enabled.
- Rebase on linux-next.

Changes since v21:
- Allow non-zero duty cycles shorter than one clock tick to round down to
  zero.
- Drop the .free() callback to preserve the PWM hardware state after
  pwm_put().
- Update the comment.

Changes since v20:
- Fix 0% duty cycle support.

Changes since v19:
- Drop the oneOf construct in dt-bindings.
- Address Sashiko AI review comments for the OpenCores PWM driver.
  In ocores_pwm_apply(), handling disable requests first, then calculating
  and validating period/duty for enable requests before taking a runtime
  PM reference or touching the hardware registers.

Changes since v18:
- Address Sashiko AI review comments for the OpenCores PWM driver.
- Fix runtime PM usage count handling on probe, error paths, PWM release
  and driver teardown.
- Reject period or duty cycle values below the hardware minimum.
- Restore PWM registers across system sleep resume.
- Return the real error from devm_pwmchip_alloc().
- Preserve bootloader-configured PWM state during probe and keep runtime
  PM active if the PWM is already enabled.
- Use synchronous runtime PM put before possible teardown.

Changes since v17:
- Simplify the code. Make it more readable.
- Restructure the driver to register the pwm chip for one pwm channel,
  because each OpenCores PTC IP core only supports one PWM channel.
  Drop starfive compatibles.
  Add patches to fix the dt-bindings and device tree.
- Support runtime pm and system sleep pm.
- Disable the pwm module and reset the pwm counter before updating the
  period and duty cycle.
- Improve the descriptions.
- Update the dt-bindings maintainer to Hal Feng.

History:
v24: https://lore.kernel.org/all/20261107031251.98972-1-hal.feng@starfivetech.com/
v23: https://lore.kernel.org/all/20261014110429.52762-1-hal.feng@starfivetech.com/
v22: https://lore.kernel.org/all/20260810030714.48100-1-hal.feng@starfivetech.com/
v21: https://lore.kernel.org/all/20260701074442.7714-1-hal.feng@starfivetech.com/
v20: https://lore.kernel.org/all/20260629063601.63917-1-hal.feng@starfivetech.com/
v19: https://lore.kernel.org/all/20260615155759.129210-1-hal.feng@starfivetech.com/
v18: https://lore.kernel.org/all/20260515054723.25024-1-hal.feng@starfivetech.com/
v17: https://lore.kernel.org/all/20250106103540.10079-1-william.qiu@starfivetech.com/

Hal Feng (2):
  dt-bindings: pwm: opencores: Update compatibles, examples and
    maintainers
  pwm: Add OpenCores PTC PWM driver

 .../bindings/pwm/opencores,pwm.yaml           |   5 +-
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ocores.c                      | 305 ++++++++++++++++++
 5 files changed, 326 insertions(+), 3 deletions(-)
 create mode 100644 drivers/pwm/pwm-ocores.c


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
