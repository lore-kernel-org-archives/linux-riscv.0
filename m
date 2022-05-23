Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56F7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wB8VP8mtxmFVhoHc5S3A3pSAlwIUyDqgcPhQpj6rOIE=; b=msDApg2cl4XbXg
	xcIwXzyMl4HN6SHEOVs31O6lfoIwphmi5r8jn3FLW23JyQAAhVkqrTroYehJfwwBDLUSJBzUFUyhX
	dhIgFpnCM1NBNmiWdIUXcscctrclaCLj6KpXCZ8X34SDnnBjGDHu7bX0oQ7h97ggm2DPYc2hrilsY
	TQ9f2Wh6Uon+enevtK2NuWWiqCJtuEgab5MsNfEda2neJokAaaF1h6tLJaVVZfLx6W1LgSwCQkANn
	qxzsCb7Aljgf63wr8UwyrY0K4oOXMVxdIJLYG7K0eemVKabFxYr8nkwQS72Ktqs+FniGspvQzOuu/
	UiNqNqg8qqktufY6zwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9zz-004wc1-Pu; Mon, 23 May 2022 15:29:35 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9zw-004wWD-8g
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 15:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653319772; x=1684855772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xRHcdziVTuv4+Sj3Aj0UVNlQmfHwfyvdBivCvUIxNc4=;
 b=HWKrnCSngScNtQfF2ggXlB4egjct3s3ZAkH0BMO/EdwpsU7jsZ321XO3
 9nAcpxU5CAdzYlQMYYWVZS/ErzL0y1p8K7sp6GP7Nd6O4v/ErbiLLu9o0
 cxEuz2jcSNRUZUWnIzqQVZyAdZ833/YS981QnZ9rVRdw/ZZ7oP7H+5HD1
 1hRiTJemhnrfqSlGO6FGdi5LOSEvMRXLTl5cg/uw6z7/wajjDgMP0/Xry
 +ybYz/XT0umtnzq45SOu4fNKCbTQIB6YXoRJdx0qq/rT4ExFF4xgP8U8Q
 PW1AudFUU1I2VMsNP5JGvE1uETaj6OVJXtR9SBYCmytokf9DwRI5tyydJ w==;
X-IronPort-AV: E=Sophos;i="5.91,246,1647273600"; d="scan'208";a="202013175"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 23 May 2022 23:29:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D18N2vITL6kr9bO/5l2u0rAsLFYIjUpCZHnNBrmDsMQ7Qt1+FdorBUmkSgA0fvEngVqVNYAhV2qUHpQp54Pd6az96XYvUO21gdbUMbDBAWET8SbwNnfksWqbFApPDoenOqbdmONrwaiXyiC3pzJYhZaORFWiUie619Q+MObANdKBsttuUPyV/4G9SVmfTuup3qcQoVGPaA71f07DFeCpkVvg7FBbGSFXH4alNXbkjvkCbNKtbxO/N6JIka1wngvaB5/tWAwb3O1Kq5bO69IM4WL8j5M3ra1QbwAYDqcvr7SS1AzngHAAZcYvzYkYnUmLz5I9uoTmIuFokEVAEAnV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v/7q8fCAANNt/17kDNbfNPvrGfKexT0F3QzLYZEo9A=;
 b=Dzrflee4RJLD0YP4MFjZM4ur+80vA6sXJf/V2H868YlzJOVrbKthYAeXi2LtAQzQQ/HdwzkGalvaCFWshj37rFOMmAB3P9MaV7+YL9E3IQPfx+C474tQ9zubhGVOt5pVqAosMr1NApo4BZX+oIf89+GfSQH4+xSppNgUUcKrnubUXFRyOsbrW1kWmWq1eLTcFtLoCnXEuDcqVxPaCsS8CRm/PK12aZsnGK4xyucKqPATJws1gGOyoZ7yUM12tSzQMfb5qfNulwFJc4g49dUtmdHrisCWUlm/3O4IiI/qh6MWaWT3jdC/0THF7ZCXArIKbbmw7QP1Eak/WNyG2hBf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v/7q8fCAANNt/17kDNbfNPvrGfKexT0F3QzLYZEo9A=;
 b=j7nBOu3UpK1Y+QHl4QFuob2mUCTWGP/EUxNanlVGJC8DYsWQpPSds4YM4ixfSZuTxASjwCzydvJC88vbcGp6Gyu3ARL+wjoroFRRYP81u26NriLXMX5SDrYqcUS+jh4qDMpRzj99O3nbUdFH/CaGIwYHuUAZRXDfTnJnlJTwHLU=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by SJ0PR04MB7503.namprd04.prod.outlook.com (2603:10b6:a03:323::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 15:29:25 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::3cff:7ee8:c1b5:b4e7]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::3cff:7ee8:c1b5:b4e7%4]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 15:29:25 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Don't output a bogus mmu-type on a no MMU kernel
Thread-Topic: [PATCH] riscv: Don't output a bogus mmu-type on a no MMU kernel
Thread-Index: AQHYUCVgqXTwnyQ4sU6VhQiQRdC2Ja0qB3eAgALMAIA=
Date: Mon, 23 May 2022 15:29:24 +0000
Message-ID: <YouoU8BDQTVcnosb@x1-carbon>
References: <20220414173037.1381927-1-niklas.cassel@wdc.com>
 <mhng-f33607d6-1b1f-4cd4-b90b-d25f16900881@palmer-ri-x1c9>
In-Reply-To: <mhng-f33607d6-1b1f-4cd4-b90b-d25f16900881@palmer-ri-x1c9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8efa97b-34b5-45b2-0832-08da3cd104a9
x-ms-traffictypediagnostic: SJ0PR04MB7503:EE_
x-microsoft-antispam-prvs: <SJ0PR04MB7503E26A7F0BE83E9AA8DAB3F2D49@SJ0PR04MB7503.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WDkcDfk0FLkDv2h/23I2pkCxAagGn3m1HW2FiIVe27ylgFxPCfdt+IGzUq18NdMf6IUVEkPAvN7wRDP0UlxRKJdIi72gWvvqtuuOiJZ1rGRQ95xwUQtkd7dXwDxG3ic1rxUUF+507nnXBivNKvpHMywXwMeCYz2rtqZZF7bGwBFVkivyuKaUdb4rBpPyMxurtI7kCp0y/ar8ZZgAwYXaqTL3EMuyroi670PXN/pu91U9Z5HIA5JkkUhaeWRPh3+/8Uzo7zIyotVFBa8Lp0IPM2EqKDdIL6tSzYVJafZ4uOOjIOKMekGvohlclvkxqIbNkT0FeYVlFeHW/hZqDBCsD6o7CJClEl5aPRtJ9BO/BshY7I/O0PRJKuu7JXyhGWT4uyXrrhrvaAGt9bXeuPa87VthMyCrFpcCI70uUBrYolPW9utui2JKjl4qy+DIqD7VOcxw0v/J8PBsRsF/q5jeGjRttBQ4NTzESP9jYhvA9P8pJqBzngMUBtttRFNZuTOz/QBhwJDd2l2pvEs7uklPYrfECgRYnthUiV4ovs8amXwH61YQc77MlVWPkK3RS7UCZfdslifq5TmvnUWFVQlkK4Y7u7Mrz/YCwAK93YFjTqgGNr+i0o1OK8Ko1IP2/ROdBVyc/iF/MZ+8gUXhSOPUKpba2sjDa+PWeZ/lv4a1GGwnQ8KyZaiJCsAguOselwKbtEfxy1NaV/Gs5XsPioKcP8WyD2Iftan868X2j3+zjDHVjA/i4vBZSiMQSalvzVlwTUBK/Devo1MXhM2ZGtVIbzL1uFfyj5pOsTu53yf4Eyc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(6486002)(5660300002)(71200400001)(8676002)(54906003)(6916009)(83380400001)(316002)(966005)(508600001)(91956017)(82960400001)(122000001)(86362001)(76116006)(66446008)(4326008)(66946007)(64756008)(66476007)(66556008)(38070700005)(6506007)(9686003)(6512007)(8936002)(26005)(186003)(33716001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b8PR88gOHWZHSnpAFaEigaqUgR4L6HRhE3ApRkykm1Ms5CmrTlYQdISHyY0G?=
 =?us-ascii?Q?VKf4wVaR928uhWMR4n5Fyfu95MuJIF6gnM9+8tbiCzhGQ6OfCyp3KXO0UvPM?=
 =?us-ascii?Q?gVzY8pquUjvRw3Q6CpWtaU3uEeSjYPm9IKukLNOshmJU9p25kKSol3B4OZGB?=
 =?us-ascii?Q?KrkHDJeGf9ls5PhO2PZ+s7bpPNQHa2cpA6CqVM96Y0c5A412wJphFAEhOmFM?=
 =?us-ascii?Q?19tkLMrX5JDo4Yygl4m9lXLWf9i+DYZcBcyOdhYWoP4nuTKzcl8b2E8/qwXA?=
 =?us-ascii?Q?3XiSLV4hTzFzDE7KA2yS65Cy27MC19tV23RK/AAgWCTdzDNbD0ysDeJbfQX4?=
 =?us-ascii?Q?9bF9zBCN0lNFL4R4QxZHUfnVB1TEwmyYsXmk4LmWzwPr2d+HZtGPu9foGyC5?=
 =?us-ascii?Q?07PqlVprX4ndblqhfKQVWl6nzuFhj2ZKzYTQDZxCeaefbcJWwOTLNt0tlu9g?=
 =?us-ascii?Q?zXbmb9e2LsoobYLT3jIYPWWMLIENzR17Zy79WhQ8fWAPtaFP2rAc0yotbR35?=
 =?us-ascii?Q?1gDiPsM3inUHmhct9QWn9XSYk0OSQCKlqjmrmTaNV+JHvQ+GlhiGb+odR8Bk?=
 =?us-ascii?Q?EYX1TTXlzBQJ9MdPwOMJhCmZ7yzS9Pklr18tdlNZrICIm5mPPEbJthpsjAN2?=
 =?us-ascii?Q?O7yr3KAcEfNuocLLx13GJIiURoUvL0GHPi0QFx5xnKYFKZygdNaCk2fcC3Hk?=
 =?us-ascii?Q?/MmkIFhf2SLjdGHYLUIlPqcVwQm0dnVkzP2tl5MRx/yDgY8pNsHFq5NWdOc2?=
 =?us-ascii?Q?oy7c7DuheAlRtP8tsnQ554BEnF3hyk1bW3Wrg3gqwvuOmzsBaCr/41IYkan1?=
 =?us-ascii?Q?z51wtjxgGNEBC7dNdilEbvZi/H3zvfH+5YmRIRLPwI2M4CeUQ1qVygA4NOwj?=
 =?us-ascii?Q?ucd/O4NjbucVSpWz2zzo7J/HhswYinQDBWFxWhJgu+uWlVXEbBZ0JLySlIUt?=
 =?us-ascii?Q?5WejvhxV1sBSi7VMXNuoB0Lqx2K4R+TImhFtt+NEfPWy9KXScdo5ECwTTPeq?=
 =?us-ascii?Q?1mbm267YW+3sEe9rYtx4uDnLLTHCp4Mx1nKkPyPajnImpYWDxOeKXaJq8pLr?=
 =?us-ascii?Q?Sgqf8CYIu0sEIsdSJ4ZoawqPhjBiIM7aTmQx7z1ytSvFZDsnuMs2xVmZkoKx?=
 =?us-ascii?Q?NBexcSp6gzTyqmX1yX9yf9mhAL0xawpacx8CJorXdsX80mvETP+DDua094f9?=
 =?us-ascii?Q?h81hDcTM/KGibRB5/KpRxVchqJsdXcC2/PUnL7ITEWsa1369Pb6huFjDGv6j?=
 =?us-ascii?Q?/7xuLdR5WuD67BXYB4CjJkWJDBHVyMI3rPPBtG7EF2eLGvr3rfCxTIjsEAN7?=
 =?us-ascii?Q?XWZwlRV1UHdHmCV4+lGM9jTGowbTC65SnbW2jefIyBykD9xyTEUsneubBDwt?=
 =?us-ascii?Q?XSoaQ3tl6zMf2XC4MvtC8QiE/KveXdPJBBItuh0pR721WThWLR/8Udq0icSA?=
 =?us-ascii?Q?8Gj17FheN8AL9PEGnFMwHdHLqKAXImcXezxzbWF/IY2PWL/BAdt40no5dbT9?=
 =?us-ascii?Q?d2nxfTVjas3oOwHgnLE+7MYVpH/WNag/MYsJzjuqQBbJW7Rnixqtu16yo4V4?=
 =?us-ascii?Q?bcLKgYxI9BA2MvR9v/LsX+0Pjhq5iGVUbnCrhlqkcqPY0Gc8aF7G0eaKd+Z0?=
 =?us-ascii?Q?T98LAf4yYkvEdkSA4MxAu9vy3uaxJUyiXnL7tGeM+lWlSNSMKeq97kdqhI4x?=
 =?us-ascii?Q?gIr0bDkuR2Z5l0y3XYZpZBFGGdmC07ePmXBDSDiHWVSeNHaQK4fVE5p8/f32?=
 =?us-ascii?Q?Ylux3nzNQzJIqYJJ4/o6j/D6tG7gNeA=3D?=
Content-ID: <7B19589173828B4D8418C57718B2B041@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8efa97b-34b5-45b2-0832-08da3cd104a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 15:29:25.0052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aAeInFuL7GRqs6seLVXF7BA46hJdm3kqfgMOwdiEuxB2A+YgUF8N+NcSEcH3gefossi6r11qS3oKSu2CI1Z6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_082932_630573_DAA76975 
X-CRM114-Status: GOOD (  23.13  )
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

On Sat, May 21, 2022 at 01:46:43PM -0700, Palmer Dabbelt wrote:
> On Thu, 14 Apr 2022 10:30:36 PDT (-0700), niklas.cassel@wdc.com wrote:
> > Currently on a 64-bit kernel built without CONFIG_MMU, /proc/cpuinfo will
> > show the current MMU mode as sv57.
> > 
> > While the device tree property "mmu-type" does have a value "riscv,none" to
> > describe a CPU without a MMU, since commit 73c7c8f68e72 ("riscv: Use
> > pgtable_l4_enabled to output mmu_type in cpuinfo"), we no longer rely on
> > device tree to output the MMU mode. (Not even for CONFIG_32BIT.)
> > 
> > Therefore, instead of readding code to look at the "mmu-type" device tree
> > property, let's continue with the existing convention to use fixed values
> > for configurations where we don't determine the MMU mode at runtime.
> > 
> > Add a new fixed value for !CONFIG_MMU in order to output the correct
> > MMU mode in cpuinfo.
> 
> There's really two ideas as to what /proc/cpuinfo should be: do we show what
> the HW has, or what we userspace sees.  This sort of thing is a perfect
> example of that split.  We've been kind of vague about this in the past, but
> IMO putting what userspace sees in /proc/cpuinfo (and HWCAP, etc) is the
> right way to go.  That does hide a bit from userspace WRT what hardware it's
> running on, but it's more in line with the design of RISC-V (ie, a lot is
> hidden from userspace).
> 
> I've put this on for-next.

Thank you Palmer!

I did send out (somewhat) related device tree binding fix:
https://lore.kernel.org/linux-riscv/YoH9TE%2F4ruFQw3fV@x1-carbon/T/#m894179b986b2e1ef8ef43dd4a865f872e2564c18

Any chance of that getting picked up as well?


Kind regards,
Niklas
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
