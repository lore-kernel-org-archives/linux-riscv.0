Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C619C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofYPQGqG0WL6/5YlEXD+z8ISqccFkj5fjELk2RN/ygc=; b=MqhiyOt6JI0Fd3
	ze0LfBwEdy4Ny7f7h2aUen8ULFCheV7VRWIA+LsjPzZTRMwxzbdsjHxwYeWm6SdD5R5MGf2pqoxIx
	e4r001OBM4KZtsfDTszM9rdqljzqzJbhNG7Gl3ygBKhbStdUlup2v1dtelk67LayrsWK/sFa4D4cV
	MIsL1mrHbSC0N7UhS4E0uSKbXLT8e5qh9JLjADK6aRCDwmYovosIKlX5I7oTrAu0YUkPwRJ2zevMZ
	UOvkol0qb0bDF8iPM+BxGX3d+jzXTGCQlQmX1mL0lI9gyNW+2mWI1eo70pcrAYoJ+ljjMHLpXvqVA
	NRNfQQKD4vAYBrmgdbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbj8G-0018HQ-9g; Tue, 05 Apr 2022 13:22:04 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbj8D-0018Gi-Cg
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 13:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649164920; x=1680700920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=12dKFKuhKPPzA9YtbdFBdGQEL7o+ZquzCruTw2xOacg=;
 b=AQXTEAyefhxPT2u2+rvOvxfgXZaDw5NqlYPrpe5rXO2Vq8W0/WihOcVr
 Zl546Bf1nVVvVAdh0dXbOY0oz1t1sJLI2nh23MkuWLlnujTD4pDkzJIXw
 Hb8CacRstZD1TxCZmlss9NtfXxSo1ZNxZPYj2164YwmYDgY3nIiJb8rK2
 0fflPfscSJL8jwVe3DYOVpzb5dkx3Kl3WQMwg6hG+mdHsW71D2u3pBkIz
 2+yyMMbKJypSEL4VAips//yVevchhinhETXCiBcTRFMEWYU3MDAnhVs2p
 m48NyjnMOpQMpD+Gcc9nEdQrd1ahjH6rU9eZ2R1MqABYib5mpmcPgrYTc g==;
X-IronPort-AV: E=Sophos;i="5.90,236,1643644800"; d="scan'208";a="197141018"
Received: from mail-dm6nam08lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2022 21:21:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqDeuOOd6DeGx/ZtdZyxDGW01NnUuylqbPn8JBDOUNpWHdqmU+QxA9X4vDZKnh3LVTLuRzNN7YTulm8EguQbJdRqRHxS0FyzAHNXLFvEpG7tZEzEVrlCuSACVVDSq83j395RApgLl/DBgIbs2fr5wtN9fyR8f0SDx7CsfYI5203RvlN8ufBvO9jR1BC2ruzlvpAJ8eCxqi4FfnFzzojG4eJUzWpRXDa/xP4o8U6k4/ddym0lTHO8ZjdovT9JEjP9oXWTN4o4mfQZ62ipK8DH3qABPDn8b2vjRO+3f7rgKaOUkAQZVE2ZgeNDzkgznDVaar5nldJ/Qu7rbgK/9HhBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdcprroKCrIuiY+0ZCC42YR3x0ZWETxldJTvbptv+2Q=;
 b=mo/7zrLnglQDg4vdTtP6k/BqxEeO58LZvfVbeso+XD0QxTbx0ErCMc5ZN3WTJ3jyOEhUkEQruK7pOzUQ+xkUtr3+D8HS7mm9S0OJs496aoVdlUuymIJxGGCZ3sPYUUIjt/ZVV10OQy9VE4/wccRAeI6s2RR/EYBFnguZ7Kdp+p0+uOoJjXRola2mvnztpjCJWL/KvUADn6rGexLLxqOs0Sdt525ETU4dtlQkais2pW/9CjdPX0jrAYx+h+etcu/lyE/sJpEuaGht0eXPNsoejnRcOiWbemLxC+nIOv1h6cu4DnG95OK3msPC3EZbbUOQemOfrNzVmWiwH2ROQnAECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdcprroKCrIuiY+0ZCC42YR3x0ZWETxldJTvbptv+2Q=;
 b=aUzumXp1EEEeNx6HRX9x4PbXiaY5x5vorKqViFtDyEZED5yFKbAMX4+Xp5Iyf67kAqk9bJjZ3Xk2XbDymlp7K/aL+nHujbpO2agtxEChG78kbA/vizc515ct4Md9JW/57m4+I5y+rvXbD2SikkOrzKtW+PpoyqyT4n8gHq0pJ2g=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by CH2PR04MB6602.namprd04.prod.outlook.com (2603:10b6:610:66::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 13:21:58 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af%8]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 13:21:58 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
Thread-Topic: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
Thread-Index: AQHYSOhuFV3VWYd5AEiJlbzlm2Re1KzhSRiAgAAB4oCAAAN0gA==
Date: Tue, 5 Apr 2022 13:21:58 +0000
Message-ID: <YkxCdWx5ftLuKhZj@x1-carbon>
References: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
 <CAMuHMdW4BKSxucwgZS0TUAKd26kmrWbpsMbDmDYSs9yo5tWH=A@mail.gmail.com>
 <Ykw9+03YFl2Yd982@x1-carbon>
 <CAMuHMdVswU_BiMwLHSB5YD9XZB4=AqEgqMRNLWYDaFSyQSwoKA@mail.gmail.com>
In-Reply-To: <CAMuHMdVswU_BiMwLHSB5YD9XZB4=AqEgqMRNLWYDaFSyQSwoKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f93271e-99b1-48aa-e075-08da1707434c
x-ms-traffictypediagnostic: CH2PR04MB6602:EE_
x-microsoft-antispam-prvs: <CH2PR04MB6602D1256CB211FFF4964031F2E49@CH2PR04MB6602.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o2dF0CniRg4WY4EOnB0RSPTKGu0tV5Snp8bdkFt4Cnya29mCpZl+f+IYktW6Iu7A9Tlu9EMpy1TmqmySAVNGIMpPrq+PNGtFF1zg0IuhcRYeGGeQ3pttQH83+KLYbR9i2qk2XgO4wcuUibPeBxpmOxmZPueCeeTTGrgQvPGuiIUuB5ePMQ9bF5Ps/piSabCQGPe0DwQI/QNUxr1B3u9RhvjP3G10sepSMKAtMuokg1J8hkaa6t/hwQ2uvW7GUCzHt5tpbmw9A6FJLBw72XidNpKJI5cJkPHpoQUedrwj4deYMlGSWWbEellE0QxCO7MGkVz6jSC8mBhPjuwuxmt7NtLk2BzQWmsiHOmgP4086SORKpd1wMmnVedeEK5YwssykAOPeQ3I+ndVsXsW4y5Feu54/CefoGF8/JX04zvln2R+CZx1aeVW0Cgf3onPG0Hs67BsQ+fuT8AN3kowA6DZiKlwvdz4vraqUMfTiyYnocM7tjssEKlQNzNQ8SqgxrG9bB11xnMxdbtBrurh+tZ6N0YPx7L00bowSvQiO4IFjyvC23zNWF1Cnd/j6RrZ47nJQtvkMCfiaama/eANK+uMlpdE2sevbs5cWez7YB7qgxeqtIUB7afdSi0pZS2+wb7odJObuip1eFqsYgq4YlEQthWebHV5ACAlSdPQoUhh5TarftijzIe1NZdM+eXlfG7DZ5gR2zBJh7E0adYB+//XhaQavFA935dNavuyGWiVYA0HDLL0ZtZ8Yn1AQRByXXVA7t/nsyF91QqmdvDqf342iDXf7PS1XdavCR90MSw5w4CWZ8LWJOxanQBkB6Jf0NG1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(86362001)(54906003)(6916009)(26005)(508600001)(186003)(83380400001)(316002)(38070700005)(53546011)(66446008)(8676002)(71200400001)(2906002)(38100700002)(66476007)(64756008)(4326008)(8936002)(91956017)(9686003)(82960400001)(122000001)(6506007)(66946007)(33716001)(66556008)(76116006)(6486002)(966005)(5660300002)(6512007)(15398625002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q4p8WSgfLLe6aiXDd8k2AD/WoT1DHT4dPc0UzglajY3RWAXnFw63n+iwgufl?=
 =?us-ascii?Q?jiNz+Z+HiDpqBIsiDLmamFKvf13R3y1unFlY3kfoScGAyoZQKCW6QlzaZyI2?=
 =?us-ascii?Q?5XtZv0s/NObmJo399E9FFkamE/zoeiDp9F9P6A1f354lZW5sZyW2s8zr0+Yz?=
 =?us-ascii?Q?bvMKXa5X8oRwLQMH27Jp/RgkaWDJTX4A6oF/kMB6ocgE1i0eS3TsLOKm54nw?=
 =?us-ascii?Q?Gw11+Jw8bTDB5cgJ12ONe+lTRnJmfS+zDkJ6kjQOv1SwjxfdVJE0mH/kIcDe?=
 =?us-ascii?Q?t3tfggCOdWPPwdyjhOtOVVaYlnuEU9T67TxsrMKLSynRj+3nV3WxZz0FpJ/M?=
 =?us-ascii?Q?NDAZcpBOHcHQEhwYPkDqLztZvmbSBUAliFfCAxEhmi2v8XUdCeyFZ4NkJwUn?=
 =?us-ascii?Q?Zw1r92hJv5d1G/PLHt0fRBafnvHd9pknDThV3j3QioDUK/lIMBB3kX6EygFj?=
 =?us-ascii?Q?JmtZlG+93isVo0BvwCHqfplJf+gyYlC7c8VgD/FeFIe8JGEQrs1bXoi/x1e1?=
 =?us-ascii?Q?rEdZnoVNYtvuGucLgyen4W0ACdVyim1HW8KGYdD0CRZb/7xu3R8+PMVx1r9c?=
 =?us-ascii?Q?TUAZ7ODmnGSaDz2HA1wQhO1PVJG7l2FDd4n6LgwYrudgKolEICueaNFrBrnw?=
 =?us-ascii?Q?5iF0OAWi+smOYJUIibcDHCmE+z82VvWWYuBkADEab3JZaa4vLKFbuePh7A1y?=
 =?us-ascii?Q?/hL3e5jW95LAtdGkuezB5PwfKdSRP/R4bawDTyjSvCI0NeFziLZvU+7VA/1j?=
 =?us-ascii?Q?F9k9H+wsqGlShBk7nX/nRMT8C4khkODeafhOjo/ORx2X4SZhLOPDx+5sdLAm?=
 =?us-ascii?Q?U/aB25sahVU07Vg/fDluhqqzioqm87IB/2q6iT4kEwa8jQddTJ3gDGtsvjdz?=
 =?us-ascii?Q?fMh4ozlLUh5O65/W1RdKsVfcfZdVRoeIvWH/+NL98440lyy3lmj7yd0+JzZo?=
 =?us-ascii?Q?sk3jG55VntHR6yuM7FzXO06mdDdaxB5gu6jJujmmudf4TYEpSe6r0lNZR42z?=
 =?us-ascii?Q?TaGaeh9MNyr8olzF6s6BPaMpnIfxAmIJvLaN/vX6vgCt241gBW7+/BvAeELq?=
 =?us-ascii?Q?DGBWbR15o8ULmY72I/M3ikLieYywCgnVu9vSIBiHWfRFCkc58SemGEFxs8Pn?=
 =?us-ascii?Q?QKl/VT0lIctMII8ucfrtdUWh3HSQVIZccxpWVZ/uMvTckGAlRxrCquZZoenr?=
 =?us-ascii?Q?wN/c40R2vAJKf3jI5WkI3huEXX5fPrXR7Kc3nFgzO1sBq0D3xbDhGZbxpaDC?=
 =?us-ascii?Q?hUoLUXVSXcmpRnFhIIVlFOn5nomS0cvRQMCUoNWwEXyBaXTsbF3ksYhwXben?=
 =?us-ascii?Q?R/z4k+FtA8TXKTzh8wfUsQ251iVex6mNzcR2I2upDpVS7FAgU/eRjTy5iRAU?=
 =?us-ascii?Q?LTU4hEr6MKRCClNT7c6yebSGZjwdTyLWep7ct+cox0wFiYbYxCW7AyDnoT93?=
 =?us-ascii?Q?cB2rj6ip3tV0joaUOJW9xfw/H2nHWh4aOIbKwCzJlElxoDGK/dob3cdHz/9z?=
 =?us-ascii?Q?cAyfqvRtf0Cq/PbmxxyppXKOCv4k57MYbobTiACTiQPrVVus+ry4pbwSx+8q?=
 =?us-ascii?Q?jAMUh4SeMwMVadt0FUb/ZglB/mU9L5pwUwfZtc0/i6GtHjq4pLC9VJlPmXlq?=
 =?us-ascii?Q?yWEVx5JHv8d4Z5tlB0aU9uf/zhBHjJMM2sDRkf43LV6/gLbLNk2Zj9w32MDr?=
 =?us-ascii?Q?Q7q7F70RlqQRhm/5iz0Q3n0It0ZBM7N6OZqt59gL1zfrZFbWtwgThyo2Mmnw?=
 =?us-ascii?Q?S8KAY5im+fvEUXjCmtDlLhbcgznAlx4=3D?=
Content-ID: <7298FEEE451E6C499511DC924FC7DE46@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f93271e-99b1-48aa-e075-08da1707434c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 13:21:58.6262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jh7V2PnW+gTMqbaJpDR/L4wFYmbhATqVnLQMoQR5eEGNwzcWqsCb1LKUiQLPvmuEzGFxQRv5PkIij0zoXg/L2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_062201_502022_FAEB93AC 
X-CRM114-Status: GOOD (  29.56  )
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

On Tue, Apr 05, 2022 at 03:09:35PM +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Apr 5, 2022 at 3:03 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> > On Tue, Apr 05, 2022 at 02:26:53PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Mar 8, 2022 at 2:30 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> > > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > > > According to the K210 Standalone SDK Programming guide:
> > > > https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf
> > > >
> > > > Section 15.4.3.3:
> > > > SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
> > > > SPI3 supports: standard, dual and quad transfers (octal is not supported).
> > > >
> > > > In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
> > > > connected to the SPI flash.
> > > >
> > > > Update the device tree to specify the correct bus width.
> > > >
> > > > Tested on maix bit, maix dock and maixduino, which all have the same
> > > > SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
> > > > would not make sense for this k210 board to be designed differently.
> > > >
> > > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > > ---
> > > > Changes since v1:
> > > > -Add the new properties directly after spi-max-frequency for all DT board
> > > >  files.
> > >
> > > Thanks for your patch, which is now commit 6846d656106add3a ("riscv:
> > > dts: canaan: Fix SPI3 bus width") in v5.18-rc1.
> > >
> > > > --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> > > > +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> > > > @@ -203,6 +203,8 @@ flash@0 {
> > > >                 compatible = "jedec,spi-nor";
> > > >                 reg = <0>;
> > > >                 spi-max-frequency = <50000000>;
> > > > +               spi-tx-bus-width = <4>;
> > > > +               spi-rx-bus-width = <4>;
> > > >                 m25p,fast-read;
> > > >                 broken-flash-reset;
> > > >         };
> > >
> > > On MAiX BiT, I get:
> > >
> > >     +spi spi1.0: setup: ignoring unsupported mode bits a00
> > >      spi-nor spi1.0: gd25lq128d (16384 Kbytes)
> >
> > The device tree is supposed to describe the hardware.
> >
> > The Synopsys SPI controller and the Gigadevice SPI flash both support quad
> > transfers.
> >
> > It would be incorrect to adapt the device tree based on current limitations
> > of the drivers/spi/spi-dw-core.c driver.
> >
> > Likewise, we shouldn't need to update the device tree if the dwc driver
> > ever adds support for quad transfers.
> 
> I fully agree with that.
> 
> I was just wondering whether work is underway to add quad support
> to the SPI controller driver.

Hello Geert,

Not planned from my side :(

I'm actually quite surprised that the dwc driver doesn't support it yet,
considering how popular this IP is, and considering that a lot for SPI
drivers (for other SPI controllers) support it already.

FWIW, neither nommu_k210_defconfig nor nommu_k210_sdcard_defconfig have
CONFIG_MTD_SPI_NOR set, so at least the only people who will see the
warning is people who are explicitly enabling support for the SPI flash.


Kind regards,
Niklas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
