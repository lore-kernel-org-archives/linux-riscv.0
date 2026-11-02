Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EF606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjnnp/sn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RHLJ6ASpb71HiMsiJCgxty7ksJM7mBlAbpUrIRHqHfI=; b=kjnnp/snAVMSVsuJaYxr2N4Od3
	OyYCVmx6WCXnrm6R/A1mnl+i/yxf5/63YJGWCbFF5omw8TPoZ/dEg2HctMR10844C5kXGZR9mbt3h
	u/drbnVns8H7Sbd2uhE8W/FiV2ldicwqk3Uvwn8M/SoI9pmabow8az4KE7dd+Tr5WZxTVfgFvyQRx
	t186mznzZS9Izcf4iw3GX06KsLTMR7DZ9AjxgU+rUNej9mfS4Cm+Oq6W9wiQdC/7eaF7faDxSqiub
	+E7jzCg+v2W4TprwVdl3vOjtjWLbia6F4PeahlQSpV+PjEB+B9YP2JgPTyLKaM+1+YhoyftJbFP35
	qWOhZlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhWl-0000000FOLi-2y2C;
	Mon, 02 Nov 2026 02:12:03 +0000
Received: from mail-sh0chn02on2092.outbound.protection.partner.outlook.cn ([139.219.146.92] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhWi-0000000FOLC-0w8p
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 02:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+Gwe+BnlNo93GbyXbtvk3AMqufMsMnhQJbqjqc8xHbpznDjga9i7+wYsxe/PJ6RJVL4pNetriujOQWkKv2MI2Z45jpbuxKplZBwb4QDGMh2kCohicc+tcd+axiLrzNN2i2IP3Eo5poKboN7iih1sbL5U6RD9N8dMNBTc4D8v1/6xuNAQ8hxD/NB2gxdOwf3WVDAHX0ysrbsEckrbJ/ZsUa9GSmzg44nEeWV+TxzvPTWHQeqCmKQiCg9mSIdIUvIC/LMz0IgqTvLfpHVi251oh4VH0Ld5dif5+9aFf/Zd89Gwxqd+s0Tz2ugZkfQ6lCuQadVorxb3ibdKpXGakf81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB56xPcMHiBrdSd6zT9wNeOvso0rPW7msyfvCfwp3ug=;
 b=Zvlcz/8oUpf97WuIMHCV6OZ0JyL+lfH1GsZhvVFEmAE30hYq0/I0TVziW0JCOh/k0k+O/W7egI8JaJC0oYygimFaeVVv/6qQJU7OkcTyU+ehnTFQ0BCJD4DtFN/9QdANw9pnp/hVHqyS+eK99p4zj9SzzLONQOv/MgLGsJ/7wzv8n5zPcQbpO53oNA4iHgGt4O0k+Pztrvem81dedfz02R5v4uclh9//5fhNhuz9gpM9Q+IFgsoBpu0ZI2yShhhz/oTBEheD966/NtcDirKk8jb0c9LaSQjwuibTaHmH3g3vvispM/TCvsHLZ6hRR6jK+YXBVoy/Vj+7DQ/og+3NXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1120.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:11:46 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0569.011; Mon, 2 Nov 2026 02:11:46 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: "patchwork-bot+linux-riscv@kernel.org"
	<patchwork-bot+linux-riscv@kernel.org>, "conor@kernel.org" <conor@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"ukleinek@kernel.org" <ukleinek@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [RESEND v22 0/3] Add OpenCores PTC PWM support
Thread-Topic: [RESEND v22 0/3] Add OpenCores PTC PWM support
Thread-Index: AQHdKHVcUHYiMwEYKEiLBGQTFfpjtLcaTHiAgAA6KyA=
Date: Mon, 2 Nov 2026 02:11:46 +0000
Message-ID: <NT0PR01MB11026FD52BC4266EFFEACBD5E66A2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
 <179357141185.2624073.8394896290201314670.git-patchwork-notify@kernel.org>
In-Reply-To: <179357141185.2624073.8394896290201314670.git-patchwork-notify@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1120:EE_
x-ms-office365-filtering-correlation-id: 1a86316e-d988-4ee4-0c34-08df3886a592
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|38070700021|4143699003|56012099006|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: fojYtCq1weEuVke97FitqTqrf/fbUdZ4L+PNHhcOonGHS0TPh2ximwm29hpbMA7wTIVaweoPQtQsdxW+DnU6yAWvQR2S6pMOxqfA7VkfC4P/uviGKpiSq1o4WebPQZSYyFTx6MkyKJllF1xr3BQ0ASSUdmxJ4lsm0a5R3qGqa/nyaIXpJHRY+3ulS+qpYneIO+Pe2vmzuRlmM/CSVJ+O99i9i/68QkgSF0l7nFFKtaXpyDTCl2b2b8rSWBitLAqjbnJEO1zMB5PZLVkxDZKU6+BzIEG94P6tDB8mFpuMRV7/Ctf0DCBD/gJHwPv4WmvG+OazqbMO903DnKnO9BEFGbvsCl3AiFXIqwU2qaj5f4GPGNdk0rb5XkzcU4i4fJRvvHMPF6No6hNKfuzCFX0PdqfQ7D1wCaLgcN7HDN5ltaZElFNY1Z5MMGUS4121dyxwyHHmEzi29KpRGls3Vyf3sHVx8V1smoXc2EPY/xfdEXCSB/1MP5XaUoqnN+hNVjtAym7qn2N3I/ZTC7pu+rvB74dMTSE/7hzZz7vnMDXm3+fQSyL0kkrsDBIPXU66vZWF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1NiL2tja09oOGxxbjV1WXVTcXNCWitZR0JocnZLWTJCVjJCcHBaR0Y3a1Mr?=
 =?utf-8?B?L1N1MjQ3VjZobXFTQnlUL0VUWUJCYVN4bEFxYmZqUmV2UzFyaUNhYUc1ejl3?=
 =?utf-8?B?eG9vK0hadVlHR0hwOFlxQ1hTSmp3a3NRbG5RRUp4U2sram9DQ1dVd0FkTVJ5?=
 =?utf-8?B?NE1TSDdiNWhYbnQ0WnlGTHEvRFVJaGoyeFMyZTc4MVhwUEFtSElha0F0ZzBP?=
 =?utf-8?B?ZWVSTFBWV1FtZFVCUzJoQmxENmhReU53R2lMeUJ6UWlXSDNjOGxwQk1MbjVO?=
 =?utf-8?B?T3o0SG01V2hmQTNYUzgyWk1yazgraHVMdzNLdXRYUUFNOGRKVWxSR2dUZ2tW?=
 =?utf-8?B?bW1FTXpOVkg3MEQxUXNoMGdDUGR3cHNqRXJsWkhkbFFTYU9qZGNCNWtPMlJj?=
 =?utf-8?B?eVZGL2c3bE1xbm9GRmVlZUxlMG44dkwzMXc3ZzVZYmcwMkdHaFZoRGxUQVpv?=
 =?utf-8?B?NGo3cWlPcUYwSEJsNVh5NG5rTmdFTnZ2ZlJWSnYwVFJxazhVdmVmVDNZcFN5?=
 =?utf-8?B?MU9PbTlQbVdLQVVHdWtqcUlHaWZ0OWFnRkZjUjliR29pTVVXdkhMVmdlRG5q?=
 =?utf-8?B?SFBjanFBMFdtVEp5L0pROGlwSXArcVpxRlZ1dTFaaS9MSXN6ZStkVFlFZFZ1?=
 =?utf-8?B?TXlFQ2ttejBLczB5aHRzbzhicVBibmVCUXlpTlZyb3Y4QzMyWkVqbXlhbGxn?=
 =?utf-8?B?OFFiUjEwMkJucUgzNWlKMVZoV3c0VDBCakQrSUg2cmdhWFRSTkZURnlDdUVT?=
 =?utf-8?B?c2FhdThoNDhaSVNObHNpMGRYc2tKTFJiWWVWMkNuUS9GdDVCc2h5M0pqTnRF?=
 =?utf-8?B?NG9tdDRhQXljcHlwU0E5cEUyUktTQ0oyemg5QXlYZHFXOFp1bVdvb2pGMitM?=
 =?utf-8?B?V1FNK0MvUmRvM0hYSjlSM1J4QTlwSmVnanpqVVZRMm0rcEdmNTBTaC8wNDNa?=
 =?utf-8?B?cTAxZjRvVEo4VEp6RzBoc3dBRlFidWhCM09ZVmJMMm5EejkzZXdpcXd5bEl6?=
 =?utf-8?B?enE2NHZSMGlYSDhLUWNPV0dFVjkxdTZySmJFcVFMWXZJVVA2aVJMaHNLQ2Jh?=
 =?utf-8?B?a0IxNWRXKzk4azE5VEJRQk84eGtwWGNHWm9LRk1sOXNGSEpvYkM1TS95Qmkz?=
 =?utf-8?B?TU9Ga3IwM3M4SUZtNnpwamlLbmw2S3gyeWMycXlCVko2Z01TajE5aGdyM2VW?=
 =?utf-8?B?WjdSV09nZi95NWVENkxMemdrVE16Z3F3ZVI2WlNLWDRGcys5Myt5ME9TNkNa?=
 =?utf-8?B?dTRQWGdXcUp0dXNMQ0xkUVo1R1JMYWpHZkhnTXhBQURObTlERlIwRHpIYUlx?=
 =?utf-8?B?MzNJSzVockVHRVBHVWJVRVBLb2RDeUJwOVVzVnZucWtDRWdmQmUzcVBTRjlI?=
 =?utf-8?B?dFo5NE9YMEFoT21COHljN1dxQVhodG5IZUY3czBhN2s3MzdVanp3T3dCS1NT?=
 =?utf-8?B?QWxzVTJLMC9FNkRObmlxRFVLcS9oMGQ0NlNRWG9RUzRyN0tZWExWZGN1U0E1?=
 =?utf-8?B?SXN2K2xycTUxQVRnREhmVDFCdnB5YXlkbVlwNEtGOGRSSnI3YzhsVTc2TGtw?=
 =?utf-8?B?K0pYeG9XTi8rRlhrNGg1ZHNlOG5DYlNqODU5QWlUdzZkWndVQ1cyeXBSOTZp?=
 =?utf-8?B?L3pESGxITHFkYkQvemYvM0pKM3pONlFudWhDcm45aUtNMkVSNGZNK3UzWUlp?=
 =?utf-8?B?OXRxWDlrZUNDVSttTnAvZHJJZXBEZnJBdFZ2NWNXbGpscTZLT1U4Q0lrZFg3?=
 =?utf-8?B?NHNCRGt6Q1hYR0x4enhuelM1bnpyek5iVEFIQ0RyV2VQcXRmOFVMclB5ZWZw?=
 =?utf-8?B?aTJMdzFrNFZCYkQ0YnZsU0NaRlV0TXFuY3VTMjJMN3ZXV1lNQVZMdzhpMWx4?=
 =?utf-8?B?RkpMN0FnZmVmVGMwV0xpM1JqOXVnc1dCa1pxNG5Oa0wzbUlnNWJ0Z3RuaUtn?=
 =?utf-8?B?cEtZNjFTekFDam1vVm5lUkdPTFF2YTl5VC94ZVBPNzVjYVVKbHY0S0FqZFlo?=
 =?utf-8?B?THdzbUNaZ09TN25YMnNJZ01TTmpUZkN6UWZhUUZiT3B6TVpQd05teitBNk5v?=
 =?utf-8?B?Yjl6aDNWWmJDbzY0bFdaaWNTZVF4WVVldVpnbEg0NUVIVStZL3M1SWFSRXhx?=
 =?utf-8?B?MGZrSkJTRW1PQkFCZ2U1WmhudzNFT1lZTTMzaUkvMzRZTm83MC80V05CYmcy?=
 =?utf-8?B?VEZ3K1NEMktJejk5a1VsQlVoS3dRR3NxVW50UUpncTNUeVVzQzd0aGFaenVr?=
 =?utf-8?B?MnhUN3pDMjllN29ManExL2owcXNvWXVkS3A4QVhNTFg0TitvSHdMU1RtVGpN?=
 =?utf-8?B?TGNSWnczU0x0a1ZUK0FVcndwakpuQjNlOVBSZWlJZEthZDhPNnlpZz09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a86316e-d988-4ee4-0c34-08df3886a592
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 02:11:46.3947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjqHCxl2Ylp1fgyJVhYNCETL+01pcNhZEh7/hTYc7HINuT2WMtdbM0mUYNUBOtXpHvTcyJLb3vvkoP+z/OtFMrXDSwQxEjTxqNm/+gcs4W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_181200_265221_B85A79B6 
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On 26.11.2 06:17, patchwork-bot+linux-riscv wrote:
> Hello:
> 
> This series was applied to riscv/linux.git (fixes) by Conor Dooley
> <conor.dooley@microchip.com>:
> 
> On Mon, 10 Aug 2026 11:07:11 +0800 you wrote:
> > Add OpenCores PTC PWM driver which is used in StarFive
> > JH7100/JH7110/JHB100 SoC.
> >
> > I will maintain this pwm module in place of William.
> >
> > Changes since v21:
> > - Allow non-zero duty cycles shorter than one clock tick to round down to
> >   zero.
> > - Drop the .free() callback to preserve the PWM hardware state after
> >   pwm_put().
> > - Update the comment.
> >
> > [...]
> 
> Here is the summary with links:
>   - [RESEND,v22,1/3] dt-bindings: pwm: opencores: Update compatibles,
> examples and maintainers
>     (no matching commit)
>   - [RESEND,v22,2/3] riscv: dts: starfive: Correct pwm nodes
>     https://git.kernel.org/riscv/c/2186ec5f59c2
>   - [RESEND,v22,3/3] pwm: Add OpenCores PTC PWM driver
>     (no matching commit)
> 
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html

Hi, Conor,

Has this patch series been applied? I've sent out the updated v23 patch series, but
Krzysztof pointed out the Tested-by tag should not be added in the dt-bindings patch.
Should I send a v24 to drop the Tested-by tag tag, or should I make the changes on top
of v22 if it has already been applied?

v23: https://lore.kernel.org/all/20261014110429.52762-1-hal.feng@starfivetech.com/

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
