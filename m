Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4E5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 15:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E433261039
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 15:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E433261039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BaJynYMip6uKMjzy5iqy0aUTlkBDy8H/VJAWTs7kB4=; b=SMbvF636mJv5sP
	93ZVX21mt1DDO/870icnDu1TS115y4QpnHu4IVYHgKSywCGCjgImnpWBvgHqUnYmiHyCYlT32Hsoz
	SyyI1SdwmX/Ujg8oW+Cgvn3ajT5HSoQEnqFq4Nzb26K3GhgPuLZlyujRRdQ+o+yQCdc4u9FbddhpI
	L0Kn75UYQdAmtDWvi4a78JespvBySAmTNM5HEvLmvbF+4dsIxTKzru+N29gB61jd92sDR/0ay0jQ1
	swDvyIobVx+12jW0Jt67ruXbCveXM0HL6lWJD/Zwdx6qdYkQ1JE6NgfvwHfjousGcO9TlbwA60AP7
	S8/Fb4LJV+G7nQe7bz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmkK-00Ev2b-FK; Fri, 24 Sep 2021 15:04:16 +0000
Received: from mail-eopbgr130073.outbound.protection.outlook.com
 ([40.107.13.73] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmkI-00Ev1p-3q
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 15:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbCQagoyWNGksdmPoMgT7Yu+YdxVsowymlrGUIxBRvsQuemB2vCLnXjwEBPSO4bwJzmlWIKOI6Vi/88OQ03/GOMhy2C22fDIbTmWHDlHBBOklVq8PZGfHEsSjc8svq/TfEHOp2YxVbG+gIWaZQP6k1AX5BLx0xY3sFnPseXQHIv3iGMVG5+SsIW9FOx08TnvL3y9+kMtCuM8/wzJlJp+EaZbdIrUvmbKZOV7nt5YJ8M49l6YlymumIc5bYGRIrgLV1icKgO5hMhp2WYEuHPFLEeJXNeCdBxkyJDfUY1unTZvevhZNOeMkQWiROMczjkkHqZnRkzOueSCjQzUjWwKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=aEKarb87p7OxEgPKNp53/nNw6uS9hruPDLTZhWD3Ows=;
 b=H/v6PSCHZMj2KN450jhKhZoNPRwiYhOIK7MnpE7siqKdJh4uEosQHL5r3CSgV2tsLdZvKcSOtuqcH+TCP57J2Ls2QgTH77v9enX9saZEOc0H8IDXYzKKB1w9g1qOCPNpIlmsCrPu8h+gvqoNmb0ojEiTSpUUUXVzNVTnBm8Ro/sL9TX7bxuyawyy93o/FayMYfYH34FEECEDpR/aG7/FYcSkqD79CUSk6Jz3258Bh4ddblqzEHIr40GX84yIeXh04yHsk3Ns4qzVCLYVjOS1L86duHeWQhs5WHhTUd5TBme8LtcOejS6ofmejivDzHPmXrjH4StokJnU7+K+gb/PTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEKarb87p7OxEgPKNp53/nNw6uS9hruPDLTZhWD3Ows=;
 b=atUjANOeTBzIQFRAFYelP9Y+Ow6tariAB40apESkRRMBI6SbnvBgATlxRNP4UT27DszaOO/LpF8V/v7wCgbsq0SZAGXUXcBDsX5X3LZF3Qd+NpYhpqk44ERIAEWs8j6gtr8GlioXQO5ktYgTQV6B8XJ4pTmzvJbTCa4q7jaVXmw=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DBAPR10MB4251.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 15:04:00 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 15:04:00 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVsw
Date: Fri, 24 Sep 2021 15:04:00 +0000
Message-ID: <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
In-Reply-To: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f1fc696-b643-4717-db91-08d97f6c8a61
x-ms-traffictypediagnostic: DBAPR10MB4251:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR10MB4251625AB1EFCF4C85BEF502A7A49@DBAPR10MB4251.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uuRyBiUi7hOANS6v0ePO9r+V7Y7KYeNV0kfxSjGxb6mTyvLDhsyne9T1rWIprWjRo2A4PWdRcAphInkpVnDf/L1NCoMwabpY/fEy5o5NAQmZai/zfwC3Z0P7L/vURTCJ7RlXRvB/4X8ea3u0YLPHmw0JN8IsPKMmU6ajj2fSsNsK3UkV3U/pMZfSE/ah7JTfB5zuxEY4kA+BJhBr1CbB739qtk8N6HMA5mFij1KoSFiCycmZX0g7tMLOXsB7HgjwVBRVoQMN/64RdV0lsXaImBl11vvTfwJFFn8DMSZ6LXX+uaMesUjl3z8rFSmKg6HfVIQZAfjVPy4P6kpwRyoI1OHtlFXXlUL3m1MFhRrWs9YKRLkybIP9SpU5AiR9CFxX6IFf/uIc2IYny2X/Yyp6LrwzPhLpBOUMNbRZomQTWIjpUotTXQ57mJKca+Dc/AXVbY6dVNf3uO/fmY2msrXsQxzO8mLbHjFuGQDrQayXQcZtBDxMibAyNNKel8nvWCZWQqXx1jwebVZNqiP5vu3pHBn45iQi7yWhA6V9EakaTiIblp3ecjMhJZN94B08PuGyRau9rvQpWF1GUcnkGm8KLlV0gkR64Qp2p+QyKSs9/skYGrwWc7M6jhKW1TOCnotUVFC+AsiI/eFo+0L7h28ubM4luuSDNEf7qSwdJNlsj90HWLON+HATtS2Xo6jMLx2m2gkksAy9gG2WIxaWGaYCvOazQNk6v4TxQL09Pk3HC3Zklx7+9hPAP/sVBTyItozrxqmHfSkfiTuNGWVMOL6BAPU79UVzYJl3PH9e8aZI1O0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(52536014)(26005)(66446008)(76116006)(66476007)(66946007)(66556008)(122000001)(55236004)(33656002)(316002)(53546011)(6506007)(83380400001)(38070700005)(8936002)(9686003)(55016002)(186003)(508600001)(8676002)(5660300002)(2906002)(38100700002)(64756008)(86362001)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O65vgxjXJkTMaaYjNIhKJ8XsaGnGRwalum8nEuAMfsHeqT/+/PQ32XYXGM6g?=
 =?us-ascii?Q?2L6Jr0Ntn7vKwFtbvfRQyjZL5Y3N+SYNskOloK6XmjPKSNuL+z9cKUJtqUQ+?=
 =?us-ascii?Q?ViqWN8t0QtoQB6zGPjyXLPXubJSCDxmYcZO14QGMvs84QyecDDhwEHBYycse?=
 =?us-ascii?Q?MFaMfGUcP77xhBMZd1tAQn23kaZY59MQLRPOeuHtyXgIlLI8lf5X/eCo9t0q?=
 =?us-ascii?Q?Q766vtjP386qrsnY7PhwzAE6WU280GOUu8hscwssbBZBp3EkRU/PNP5znHpk?=
 =?us-ascii?Q?0fpTgoRzP/Jp6AydLcIfrlJhu8lKUXOqPqaTtAl/CrA3qTSEBU1IMvOh3sRA?=
 =?us-ascii?Q?HhCtmTT8tWP3aEV4Q/mJ9jwvvAUN8MclycnmrMD2HVIL1cAd06gS+J5yRpQN?=
 =?us-ascii?Q?rOweeiPAOXjUJ6eWCZBvytC6YzP5kknGnOklegb6rDfORsBVbLz1f0+8xZxB?=
 =?us-ascii?Q?cfE5Dvl/gXaB+VJNQzw1BL4rH2It0g57adjCUDD4yk4rFTbK3nAogsmptxXL?=
 =?us-ascii?Q?2Qn/eCGlYi8P1jbOFVYBoKbDxGg/NlIHkZVaX17tMnxjsTU6O4Ah4ntRa/MU?=
 =?us-ascii?Q?CuRSkal1JwL2aPY7iqsiedM615hDJfl14CLYcpZwYTjok6rnIzfUAkSS5u2Q?=
 =?us-ascii?Q?3F1tizIjJBeaLUdFVYv7BebxLShOUiLMdGig3AVtF7Ip41RzD8Aq3NSKjppM?=
 =?us-ascii?Q?jh21u8fviyVdLN8pl9sCQHVzHNT3YVOAchf8WB5kUwuLbRbaRhoEGECyV6FF?=
 =?us-ascii?Q?JPN+qSmk5/64taH39TzXzFoTbAhdTJaXtBIjmFDAu9adCdlzqLGdDTGkWylj?=
 =?us-ascii?Q?wjySNr7tLh474DeM/H/oHpd8ZmLN6kU0dms8mp6n/vi5ZvIXdNN2Nuef7cZC?=
 =?us-ascii?Q?EiPMNIT5ZmKZbL/RVxikGmbTlv/dnAYciorQBukvGtfhW0LBCqzs1Dj7xZm0?=
 =?us-ascii?Q?I1hojLaolkJqbgTwj5y6+N+LNsm5QLmciSrfp64K+kLpxLo0KNyvnM/Uh8m4?=
 =?us-ascii?Q?6dgdfAdD/xaJTcNGhj6+4gi52MiX+ZScTXfIQuBMFOge2z7S6ZmQU9zcqecw?=
 =?us-ascii?Q?aJ0fpw/QfLZsQN4UP9Mi6/STK7oUACS+Kcj4gxxEjaIFaTKIO2kK59C4li4N?=
 =?us-ascii?Q?HopaW6vx8/p+QeeVIxH948sGFzxapHohfdf5sghaYzXgooZ4Gg2E0A5nTE6t?=
 =?us-ascii?Q?srsN7rQpdlVVXYM/z6sBohoQJ76lJo7pd0bSr0pzd7Wy4M/eaV4EmM0wmcAf?=
 =?us-ascii?Q?0uHpvyHpeIz12+Y7qJrSgygRHiuPjtAZ7iyM7BUc5GsxidwoWvTBhZioLNvF?=
 =?us-ascii?Q?mg2TYUbpTHsDo8jT/k7UolM7?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1fc696-b643-4717-db91-08d97f6c8a61
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 15:04:00.3166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P94DCSx610iNQlMNPMxqIvStr6Q2Effa21tGqh6e/OcdP3OX0fux4CetwhtTtD7akbUI5UzcDjdIj83S9ZMYSlflJyvxRPJ7iX7tISicxBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_080414_208467_8C5CC800 
X-CRM114-Status: GOOD (  17.91  )
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

On 21 September 2021 06:34, Alexandre Ghiti wrote:

> The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> notifier that will execute a small i2c sequence allowing to reset the
> board.
> 
> The original implementation comes from Marcus Comstedt and Anders
> Montonen
> (https://forums.sifive.com/t/reboot-command/4721/28).
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
>  include/linux/mfd/da9063/core.h |  3 +++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> index df407c3afce3..c87b8d611f20 100644
> --- a/drivers/mfd/da9063-core.c
> +++ b/drivers/mfd/da9063-core.c
> @@ -20,6 +20,7 @@
>  #include <linux/mutex.h>
>  #include <linux/mfd/core.h>
>  #include <linux/regmap.h>
> +#include <linux/reboot.h>
> 
>  #include <linux/mfd/da9063/core.h>
>  #include <linux/mfd/da9063/registers.h>
> @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
>  	return ret;
>  }
> 
> +static int da9063_restart_notify(struct notifier_block *this,
> +				 unsigned long mode, void *cmd)
> +{
> +	struct da9063 *da9063 = container_of(this, struct da9063,
> restart_handler);
> +
> +	regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> +	regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> +	regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> +
> +	return NOTIFY_DONE;
> +}

I will talk with our HW team to clarify, but this sequence looks to be very
specific to the needs of the platform in question which doesn't feel right to
me. As was mentioned on another thread as well, the watchdog driver already has
a restart function to reset the device (and thus the system), so I don't believe
we should have multiple of these.

For board specific sequences, there are machine quirks I believe which can be
used to handle stuff like this, if this really isn't a generic solution to fit
all cases.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
