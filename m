Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0077606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yswSfc5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ecMrMAAbzkkYF2yFYhfzjYsFb1d3hfAKiTnhvjWHcIU=; b=yswSfc5pqFOtU8x08nO9LmICtm
	y2+pisNboMvRg0X0iI64/ZiB/TMt1kjVtq5yZDw1OQ4WI/3fUAUwmfHBMHPuDz8tc5Lqoe+oLD531
	LIFMAmFZjDLAo8YZy1XcL66APbv4aymSxcFdr6HJZGP63glAEs2AM2qlnpmRnkbjkECecXUSYtxHP
	+fSHTXymhs9oix1wd9JDszKi7856IDBsEA0mHpNVkmqsZnbyqQXzrsIV9SXNOoZA5YyIdreOPJtdu
	Onkd/oE9XWtCwWy9hQaIibym99C0nIbFPc8G9AfCO4iYmGNDG3gV5oppDLNG6S1Kk9jksQviyHbKw
	spnomU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7vq-00000004J1V-009d;
	Tue, 17 Nov 2026 01:24:22 +0000
Received: from [2406:e500:4420:2::712] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7vm-00000004J0k-44c5
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 01:24:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boxx0S8fMVjK4oQB+WK/U5ZnSSsZMKis3dpEK2XDTp+LppKpGhlsZGLJFrQpoaryVyffEeTj+GQUHmlIis7L+kX4F3YNb++oNvqz0+1JlpwzK8jn+5tpRF3+4uxDTMxqsZqbOHDRjLUak/E7ydOlcIu6I+LbKjp5E3vCxuBooln50Ftp2aVhkVS86MFDj4i17HHc7eWy+qZkYO/FH5mE92QpIwZpYe/4iURl1bmL1Nifd3HPVX+oobebJyr8wVeMYLkdeeTXYo0OwlT1RBaecpU1pe0mrkW/dnrbDwDAYW89sYH1wvxT385L/abc8QLIxQUGx8TKTADLtEXXw2LBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXlF77/f5ozgL0FiNHDnugdW3Zkr4fiJ0Nec7/LAck0=;
 b=m2ICutZURO8PcYPlypvIqj7VN+D6gTXmXoSCwva2utOK0sqlN0VwbljZ0txTpwkKbJvNjdmAORPK8LPh+TaB9gbDLHNM0zg97ZaKrNE/PEGLl0ckXMYlvU+nSUBA7p1HjyDKZeLOBQUMkro94kpSuaKC2p8/xXEDvvNwsxeYby8GpcY08YDgA3DROfhZ078AQ6ceVP5s6oKOmRd7TKZndQZeGFDQPAFv50mvfOTWw5uDjRflv0faPPvsHkfyV2k+iEHrzLfbCy7OWcwr+/bN2mIGS6onQ4Ps/2SiBHIE/XeFQWb23bvsrypiFk42pa8EqxFoYM5GWBhTCAdtFdA4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1331.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 01:23:58 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Tue, 17 Nov 2026 01:23:58 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Hal Feng
	<hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Topic: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Index: AQHdWv1uA4scW39GXUGR8HsEG5hmTrcvYmMAgAJMQ3A=
Date: Tue, 17 Nov 2026 01:23:57 +0000
Message-ID: <ZQ4PR01MB12027C86A7EC92969661032CF27B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
 <179475230833.3873592.13070196353304136001.b4-review@b4>
In-Reply-To: <179475230833.3873592.13070196353304136001.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1331:EE_
x-ms-office365-filtering-correlation-id: 9b024f0c-e8c2-4f80-3bd9-08df4449741f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|261009223027099003|4143699003|261102123227099003|261021123027099003|261022075727099003|261021121427099003|38070700021|56012099006|10067099003;
x-microsoft-antispam-message-info: fU5mc3TUQq9QOkTVW1VZ9HPdMVt1ANYsPfYMDAXt39iD3kof8rR9j9iMziEOcqAvHH2zzSDIM6JTVfbhEayQLL0N4LT+0eVwXIkPD32LPKMcYpx74yRa0LLIV9bC0UGSNvRGyZugEeCepXiJrC5Dpm8EmrXDroFRQ9nZmZvo1N9ylPsgfLH2HUjuCF80Cp1Wkw01jIdawZBfmz/eUxb1PnRRtbEuSaXu357tjKuQ2Pb1Kb7JuEj/p1iNU47x9sLl5fnCG7ludlDYAFXgX0TV5E7hqnIB0UtI7jiPure77daUYYpGr3f03Y00BCIJWxNJADk87lehBQQYdOG0MrRCV6ILr6yct8rdVFCVbsPpJXZILXriBnwZ2Kr3uOxpU03aYV4WbaAOXF5gi5ajOkYrwbYGJkf2XorJ/v+Gc3ZYxZGqMAFyt9fVtpmYfGWdlYG6iM2amAiTJHR6e5hI3cLsTa1nXXSb1Eo4t8QvTpWkF2/EG0DAta23T5sKL2rlEh3GrMrL3aM6d7poQ4v85t14EjXVNRdVWkjp8LfCUy5XnQH+WHzuchH8TdDx2gOa485K
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(261102123227099003)(261021123027099003)(261022075727099003)(261021121427099003)(38070700021)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2lwRWZGcjdnbTdJUkJ3QUIwWUVGSlNRVVJjMEo2N0Q4c2NuZnl6THgwY1or?=
 =?utf-8?B?Q2loVC90TTQvRFM2dHdKdm9QWFIyQllQZTcvZDhMaFhuQmppbHdhRFFEZnNT?=
 =?utf-8?B?ZWpOUS9MYjJRclRVNlh4NUhWdHFMTUI4Vm1rUzIwYStuRWx1NG1SZFd5R2h6?=
 =?utf-8?B?bXRkemJTNncxN2Uvd1o3TXpGSEpmZlg0R2loUTJqM29oeGpZa2pXLzZrUjl2?=
 =?utf-8?B?MUU3R09XdFJFTVhIcXk0VG8zbVF4cmhiTW1Nc3FSdnphZFFMdWJOWjlRQTM5?=
 =?utf-8?B?OVNjeDBtZ0s4Rk50bi9XNnY0WEVyejFDbHlQNTQ5OGhUOFZiUjdoS3dmdkdy?=
 =?utf-8?B?QXd6Uno5eG9ob0djZ2pjb0pMYWhsUmp3aDQyQ0FuVFlWYkhTVlJ4L0Z5NFVI?=
 =?utf-8?B?S2hGV3haanhZWDdFTkg5UFpXai9lbjEzczlFMlZ1SlVNT1dlaGd0TEVKckt3?=
 =?utf-8?B?aUxUNi9vbmM2eEdJVEdyY0dLa3dnTUR0Y3BROHN1Wk1uZ3pPVmQ2Zmh3bXpS?=
 =?utf-8?B?Qk15RzIxYUllU1pEYStlRXg4Sk9PVmZOQUNyalJza2VMbE9EWmQwNk8vcXdv?=
 =?utf-8?B?c2lJdXNZNGRZZlJyRUtZLytKZ2t4a0k4aUJxS1dBcGN5clVFeWU0TXEzdTk5?=
 =?utf-8?B?elIrWldOUlFIV0Y2aUVwTGg5dFByZ0dHaWRaT2Nhd0h0cXNDWmR2KzhNSktW?=
 =?utf-8?B?RU85OGZCRWd6aFp1M1E1MXk4MFZLbENjTWVvVlUyMmt1bnNGYk8vazRCbk05?=
 =?utf-8?B?WTdqV24zcDVJV2FVcFhuNTJ6Mmp5RmZlWUNwelpqVlFlYUxnY2djWnErZlJG?=
 =?utf-8?B?dW5VMzZxR0t3Q0ZCOUlrSWhubHFYQ0FUcmtxMFVhYVhTU0hrK3ZYMHMxMkgz?=
 =?utf-8?B?dEE4a0hJd2V5ajJZN2hkNm95MUZKcVBOS3FlSXZMVlhWeHRXQkplaWw2Z1ZP?=
 =?utf-8?B?RXptNTVmTUVjamhLSVY2QWMvSjFWWmhDeWlXVWEyRUdPTW0xR1lhcm9WTDdv?=
 =?utf-8?B?WWl3UkhGcEhYazFFaTdwb1dqbnlGZ1ZNcUk0cTVUSVBRdWhoWW9uN015bFE1?=
 =?utf-8?B?T2FwMXFJeWhxQWhPSHVpNmNPRVF1YUxXbEhOenpBT2o0NGM2aVkwZTFuMStq?=
 =?utf-8?B?U1h6Lzd3SSt4SU5Ua3JjTHlWMXlncnZPdTNIMFpRT0hrOURidUwvV0tuUEZk?=
 =?utf-8?B?amRnRXRYRGNxMUIva1c5TzJKWGlDWmovc3lwNnVwNjZTYk11VDZjZy9MdGc3?=
 =?utf-8?B?RzZYbTRlSmtDU0FzZWZiTTBBenhaa3lYMkdPNEo3ZmdCcTZnSXhDY3hNM1NW?=
 =?utf-8?B?TkJLTWg1ZXdDU3dreFF3ZE5UbjZ0ejU5TTMvNzlTaGtaZE1kckY3LzVMMm1D?=
 =?utf-8?B?VUI4djF1K1M0Y2RqZndRUzAvdFBYUGIwbFFzZVRLZWU2RWpoM0JLRUNtcTFw?=
 =?utf-8?B?MGd6VXk4L1B0YitsNXhQTTdDMW9MVm9xUzVBRVhLQi9JYzRuQkNBL2ptSG9D?=
 =?utf-8?B?dzdMNmNVQXpuNjB5Ukc5OStnZG0yYjFhSExLSys4UzU0VS92VFZidkxKMjl4?=
 =?utf-8?B?bjUxaEhHZ0xFQXNNby9mUFRsYmsrdEFlWllaZmc0TFNvVkg4MEVaLzJiT3dJ?=
 =?utf-8?B?K1Jrd0piL0NLM1VpVU1lY0NCbTNZVGJIY0xmSG1VTDVZa29uV0s5L1Nla051?=
 =?utf-8?B?MXppUFk0bjRPM05lQjl2RVRURWsvSXd0L0d1a3NUWkFJUFcwWkNyWnE2YXEw?=
 =?utf-8?B?SVFVeVgzbER4SHkxTXdDdXpwYm56bU5xcDZEemtSSUJYczdia1FTTEZFOGpS?=
 =?utf-8?B?TlFNTkVUSkRabzdEcWF0K1hKQlRabTFYcTBxRGZMVTdacUZyRi81L1FjTnZE?=
 =?utf-8?B?STFVenVudTl3N3A0RlNjeDEvaVdRSERBZ0VpKytsTVVMQ0EyY01BSVdiV3hz?=
 =?utf-8?B?cmZsak8zcWZPdjRTbEJhTXhaek9zbjNjdjhNTVpxTUREVEhDU2s4UlpoeHUv?=
 =?utf-8?B?RldyQ3NJejMrcHlxZXQrNURHQ2s3M2hLOUJrUS81UytTOTZEdzFITEdXTk5k?=
 =?utf-8?B?VHFTNjFzNUlmY21mdjJ6enA3Q2hkWnNNN2M5dDRvT3d0VjNzdUZEc0ZLdnZG?=
 =?utf-8?B?TUppQWdKYjRIS0JXcklKYjhzVTJzaytsQ0VwdXg3dFMrdkVlMlFORDgzMEVV?=
 =?utf-8?B?Y3JhQ1g3VmFZVW1NYy94ek5pcEZ1NEpNK0h1YlU4VW5RK1RaYzdGaHljdU0x?=
 =?utf-8?B?eVVoT1h1ajBYbmd5QTNrUVUwUDhXazEvclk3WFAyRk9lLzc3WnZIWTJteUlB?=
 =?utf-8?B?aU5pQ2NOZVlaaTdJV0lkVldEcW4rZ0Y3bDRnN2RlR1hSb0JjSEx4dFNQeVY4?=
 =?utf-8?Q?dxHzIaS3oZUvj1Gk=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b024f0c-e8c2-4f80-3bd9-08df4449741f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 01:23:58.0552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 077CqIDor/xf9pCa5IMXqhnN76S1NFLvdXPXH8SYxl20oRSRX4z3dLbMz1hREj/nhTCsNvRbEj6rUsrtbX3LHhSFuhDx0yv7ruQ7UkapOH+ONuA36DdARA7Qtqe02w8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_172419_064860_1696EF89 
X-CRM114-Status: GOOD (  29.60  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Philipp

> > jh7110_reset_controller_register() is only tied to the JH7110 system
> > clock driver by its location. Its logic is generic: hand the CRG
> > register base to the reset driver through an auxiliary device.
> >
> > Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
> > so that the clock drivers of other StarFive SoCs can reuse it, and
> > make
> > CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> >
> > While at it, replace the open-coded auxiliary device allocation, init,
> > add and release handling with devm_auxiliary_device_create(), which
> > already implements all of it. The register base is now passed to the
> > reset driver as platform data of the auxiliary device, so struct
> > jh71x0_reset_adev and the embedded auxiliary device go away.
> >
> > The auxiliary device ID is dropped: every CRG already uses a distinct
> > auxiliary device name, so the ID is not needed to keep the device
> > names unique, and it is always 0 now.
> >
> > Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> > device names are prefixed with "clk_starfive_jh71x0" instead of
> > "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
> > JH7110 reset driver in the same patch to keep the tree bisectable.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
> >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
> >  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
> >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
> >  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
> >  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
> >  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
> >  11 files changed, 45 insertions(+), 83 deletions(-)
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index bd29358ffeec..51716655554f 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -2,6 +2,7 @@
> >
> >  config CLK_STARFIVE_JH71X0
> >  	bool
> > +	select AUXILIARY_BUS
> >
> >  config CLK_STARFIVE_JH7100
> >  	bool "StarFive JH7100 clock support"
> > @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL  config
> > CLK_STARFIVE_JH7110_SYS
> >  	bool "StarFive JH7110 system clock support"
> >  	depends on ARCH_STARFIVE || COMPILE_TEST
> > -	select AUXILIARY_BUS
> >  	select CLK_STARFIVE_JH71X0
> >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> 
> You've switched to imply for the new controller you are introducing later in
> this series.
> You should probably be consistent and align this one too. Not in this change
> though, it would be unrelated.
> 
> This change otherwise looks good to me. It requires Philipp's opinion as it is
> touching reset too.

This patch touches the reset subsystem. Could you please take a look
and give your opinion?

I will send a version along with your suggestions from v6.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
