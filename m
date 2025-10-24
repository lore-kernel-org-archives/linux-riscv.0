Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33146CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 02:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BC64Oaxa/AwIUXCTG3EkdwcFOHePJX82tfeJ8Rv4Y9c=; b=dJWdNXXpglCxZJ
	mEeLj1nfWiQJFBPJc34Mux+Z169C9sGseZVxYR4D9Bz36blc1+XamnnNahSb3yGEmmgdPyVbH0HIu
	tuz8DwSDzbtqRi2Odt0MlvVO70/SPm/+uA44XKi8fqKOHiYwKrIJ16MaO/CJoL5jFJUhFOVOXGzbO
	PnM48m+d6Ut3rnSsycyNjxtrYuspjVHsxyZHGOt0zEaM5DMoPFiBzo8+TGMzR/QWVrQ4Fd5deTMtd
	wIjSgwvAylQbOqUZPog5tsssYXynA1V+UBlSMGDX100t0ThuzodOX6Cbk+0GKDb+0AOHPKRkqa3Rg
	h7Fx83VZwXl+sp6nqLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7D6-000000080XI-33Gq;
	Fri, 24 Oct 2025 02:07:20 +0000
Received: from mail-northeuropeazon11010029.outbound.protection.outlook.com ([52.101.84.29] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7D4-000000080Wq-1a85
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 02:07:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOSuLl+FIS9Lwi7/S1eFO1fJGMzauPjZCIXRZnhKEIpCbQIgZh4tVzk13K63zxdnw7GAUPL70bL4z10g2yxErLKwDDupzVwDyUZQHXM8bO/t113Q24Z+Bbs0K0d55y4gx38OQ/FxtgSMZRpSkIhhuHAUElqozJUw/ooVYrC1c3g8i0ce2huPEQoDIfAf3UVDOahep0WmM1i3WEoUlZcfC43tTMP9szDQe8xktdjX0N2Vog4mvVvi3iAS8KDBp3dO00vKkf7Bu2cwLWVK0/uxziMmH+3szsg5Dxh70a1SjLLRUPfduHxZku4MmCzmCQANLn3cro5R+BibHxoNsTDsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGeuFEHi5yeEnx9T6yX1q0UtwOzKqhxi5pns5PpYYEs=;
 b=tdWo8Nd7m6vdv+nR4pJjnXbOAsmsueZGR+M5Wpk+o1YHvSIOk4yVYcNAY5nxTiSwaEWx9eRoo6/VoMWW/S5ww/X8MUgj53as0JcIZYFPwzU+YMuD3Oh24gpJ6L0UydwmueSy1+cVdBFk1J7AVu5JmhoLlU+dV+DfcqTjLwQegJsuCk+iVmAyLQKu3FLLCJAjS+oP0JRAYL1HYG0oFEwVJWdow850sezNeeg79wXCaY/GFEMkKK69thzVU26lwQdzy0uOzmgWCeZlhthdbHZaWovk7T6jqOZiDjveaal+Dr4ZgjWLV5CellDJ8hk1AJU0SG9gIdYjyesbUVjHui+B8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGeuFEHi5yeEnx9T6yX1q0UtwOzKqhxi5pns5PpYYEs=;
 b=W2ER65QHPBeOqx+nOhmtBt8NoAfU4uSep1vV4lKoaRwqyHUzNSviYUald421G41ZOWYFQTUcm7p0Fx8skTjizb/IIUUNCQxcjcKUPac75BQxquEQs7vpb8i8JMvAKKEUYjpyT0rx3tttnftCa4DnxBarbQZgpZL+7/0eoiK2R+YKp9ef2f9iKQkqSHbxON2NdwYWEInWO/hhtNuFhhE8mgWtfb/dgJFIDdEBEUKShqH1gy3D/X3hqn91ddu65w947F0bJefKcmFHAOv/5tQpH0u/eBFt+Nl5rNERS8g4yd8LwnZX6R1d742+YTQaGoSkJb4baHkD3GASxleOOmtT3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB10996.eurprd04.prod.outlook.com (2603:10a6:150:220::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 02:07:12 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 02:07:12 +0000
Date: Thu, 23 Oct 2025 22:07:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alex Elder <elder@riscstar.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
	guodong@riscstar.com, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
Message-ID: <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
 <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
Content-Disposition: inline
In-Reply-To: <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
X-ClientProxiedBy: PH7P220CA0161.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB10996:EE_
X-MS-Office365-Filtering-Correlation-Id: f707b49d-3122-47a1-1c52-08de12a20b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|19092799006|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zu/EjPuENNbULCPnlVI/wlchRb3SOX9dtm2QE6FdFBXHRn17jddXGRIEKsql?=
 =?us-ascii?Q?pGxKdQEgzcZYj/1MptyMiuBUp4Psc+TQr1H3/Ubb4sabkamuvjSZ0eSx6+5z?=
 =?us-ascii?Q?zzPKUW7tBhrJxwoogjm57gJFBxXq9kGvdQYszdBko9MX+bssrR11Bq1paDd5?=
 =?us-ascii?Q?NaRTxsb8nAL9qljYcoV6D/7BiAd4FiyuUJ3e+Xn8rY2ZRjMQZrof+eP6l2Um?=
 =?us-ascii?Q?1aCqPZbLsyEN1G4uwqbNLXKhmS2d6oi+EtDrZrwlsmm9f9WwQ3jdWqtucFlg?=
 =?us-ascii?Q?/UNu3KTiBugnr8MFQ1FFAFxVtNzY3PJV1KX4ugCxq2nEBbvxm/FJdkf4D8UJ?=
 =?us-ascii?Q?tDWAycFx+NhXNjt4sSvOLboihVfpczdWBukwQWfJ1dvwrkofkCA45HOvbeXP?=
 =?us-ascii?Q?0Wxy2Jood9YW0rnSjtbWpiJUYpvK/RrWneCdAioDQW0+bXNfEndt3w3wpMS4?=
 =?us-ascii?Q?u2gE5KXB91SgmSv3nByx9c7irep0hLQr91hj4adHm2+RAedQJepsz/4CbaYQ?=
 =?us-ascii?Q?XfdqLgXx02I9d4j2EXAwW7WTLT3hFdlm5VtBVYkS3xNEin13WdVfR7P0qR5a?=
 =?us-ascii?Q?hzqaGwxhUx0umSISGq+ujQ303QJySAmFjrgeEf+xp+3+g8AAuojWSLx6SFlo?=
 =?us-ascii?Q?U+CVV9mzEuAwCwYzy+NMSmO3VCd/v7t/ATNoeSus9G3rm6kahOkHZzWNDPgI?=
 =?us-ascii?Q?+uCFPiNTiHkuj68onR4Kz5XDLvFiSrJR9wixvcpAHiuCoauW/AQnbR6htxFT?=
 =?us-ascii?Q?+lKIBM5Knt++7gHlv+WvKBWJ5j+hfvzIW4ErnN8juEVmkOvjcb1Aleujn0h6?=
 =?us-ascii?Q?USDkhhbY48NhvWglsBvtE61Hv4FDgB908zW4H0fiBsBQvRZUTGAZCa1S5JA6?=
 =?us-ascii?Q?xZmwBwurxDDjw5vCb4VwvCsLqMmki3KkD7SeSkJsCuLOWEHwo6LeeeMPOeQo?=
 =?us-ascii?Q?9cdbWa+4XEo+01REkXBNfuDR24tViJIRd0/j0oZlGFDglEZfBW2O2/P1KjYu?=
 =?us-ascii?Q?toCL1ROxwNW5lqDzj4eniN9CbTu7A/F8HPC+mHV3q8R7ZcY3/o91X8+rOyTg?=
 =?us-ascii?Q?g+nSQ0OnJbf8AdOtCd5bqIuocR/LzocEuG+1V8keyVL3VGFphvYDCi2CvCux?=
 =?us-ascii?Q?qE5mwNeIqZRTMn45jXzWyZ7XAWP6wnhsKnpqIz81dTZ+npIdq2b1uAls16qr?=
 =?us-ascii?Q?3nR/8E68DumZNu222Uj6SuXPCAT4Mocb6NITefQ7vQUdiZv5cAUfGSiwinCE?=
 =?us-ascii?Q?M2EZueBjT5WkLQ18Wtx6AU761wzS8OnTS427dOuCvl5ryHX3u1xBgM2ngQmP?=
 =?us-ascii?Q?dEUFytHVQWAtB9Ra9dQVi4phw6Jr7kts180zewaSRBu8TZshYfsYxLNIJtMB?=
 =?us-ascii?Q?CV5TJD/ZL5IK+jTAzz0c2xddiN2t8mKMd7tG/dNcqK4MmQDIQ8TU9dSrZCn1?=
 =?us-ascii?Q?eM00t+6T88Sdj9GE/cpQeiL91h0c7AxIP0WBGKpnkls33cIeV7SMVkkEvNBQ?=
 =?us-ascii?Q?hdH3jVyVibfXWl6U2epKm/vwXg6DrN0UKACr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(19092799006)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7OIaY2DOLX4EiRpERKKJcdsRhlgrO/Rm15CZEYpr+qDPFvkgLs1CqnaFKYCo?=
 =?us-ascii?Q?26LgUaoB4A/mKGTcwu2+WsGZwpA7qUSE2GikSV5pIHE3xs6lu4NuG2YopLFP?=
 =?us-ascii?Q?RYrjYNaikRx3xIzyXt0clmSv3uwFg9+lbf0M6gWIQtd4A9sH6Q3IOd6nC745?=
 =?us-ascii?Q?ar8lnJDKetvpO+vX/KQSSaSdihc3g+4lh0hRYw1Jf1FT4IW4qPlxUkbrnxqf?=
 =?us-ascii?Q?EOtznes4gfzaIskm3TsKmo+gSFQHPpcr3iHrzyJBclYUWJI4EWlfuAD6+92N?=
 =?us-ascii?Q?y5pKcInRcIYlPYxpQ8DGTPUYmnXSHUJRqz1SuwwQ6Usd5E4z9vUa2OAR8uB7?=
 =?us-ascii?Q?SJE0nMGGWfCSeGJd0byfey1hlAFmAZaGhk5YI9QnKA1VhYrJMp13OHenKcTt?=
 =?us-ascii?Q?tbuBlDrhrR3D7pKiCnausZTnsmooJbU8IUwCjPHnDfXeCg6KCahcYH/loM3t?=
 =?us-ascii?Q?oVzujAAYmXbeNhLlWJXbU1b332CUsfNtreHfigGKaHK7yMx4Z09vd8FkXAvo?=
 =?us-ascii?Q?t/jtxeBrOWj/gH6Lvaj7akFzGb2tPB+TAHVx73Pd1P+0eiVSz11Iw89jMrxT?=
 =?us-ascii?Q?U+QsU40KNkNw2B0fhkruM3M9QF2/z9mvXyVN7JB1LDHBBU7gwq4gtCxRPWlu?=
 =?us-ascii?Q?F5gCnPl7o4ayJxLbLtqY9x9V3rwdEL8dOp2yAknics4Do3kpTY8Df6z/nXVB?=
 =?us-ascii?Q?NmMQLv64TEy5bYzCMJ8AvrfGbJza6L361dpbc9Q47aZWykOZ7yCGo4psTUbN?=
 =?us-ascii?Q?LgGqMWpAgcjhvlJGJme8jwKZesg1yvl4IX9KtJ6YpQPKu83r2SJmUvLeicHm?=
 =?us-ascii?Q?awGFXBOUv6lCpfMd8VRxfYQuggL0K5AMMWDaoXW2H0oqfpUx1ceXlptTjnb6?=
 =?us-ascii?Q?h9SfZaKgJKXCmYe/NqkFUeQdbwq0hFrRJEZOmS5iOnXTXeqWv1/2dNuxDnfI?=
 =?us-ascii?Q?w1PgDmX1X1yc+hhOteQjowzzZd0vQbDceYSVVUJ2kx/dmXB1b8NQqkoeSByz?=
 =?us-ascii?Q?k5kWCoTuc+xddwpe1yxJLgDAUGVkzsxGdm7WWZxvVmMQlb1ld+dV3Za8qCeT?=
 =?us-ascii?Q?s6OMAoaTfzD8R2KBQ28NUmy7gdqDrrJw/V6YLutYUZPjuv1mwenGRcGiOVRs?=
 =?us-ascii?Q?DUGVeQ3qsV2aOMOgMoAuuDpWRarZ0TmrFuJ5G74ctAILbx4LXe/r6eZgXB71?=
 =?us-ascii?Q?AyKS6TiMbyWl3qlXoacJDJdCC6XcAZ8OQSJdK5GkMmCZ5HsXN0Lxv66tYdYY?=
 =?us-ascii?Q?jUm3IU3OujswBkwCsKg27wyyE1v61V0MWfxZA277mxd1N5Cqx7m8/b4uw8ip?=
 =?us-ascii?Q?61UAs4sO85Y9NtU/qk0ol0f1oi9vIcaFv+xbUPjJnfwxkX9k9dOcujsNlT8x?=
 =?us-ascii?Q?49SHU6YIokK0XHasC9cagPPMK43myKxAXCvO2ZdwHXLbfeaz+BChf8G9oKtc?=
 =?us-ascii?Q?WzNGfvSYY53P4p4nraHM/MGrny9JBmii3pmIfZUj3Yxjj+QKpWaSmRxhA23W?=
 =?us-ascii?Q?yNw8VX6OIpYtbUEo5odvrqGonxX5br3JiOO0M9DpKpmlXnVQLsQaRaBVqeNw?=
 =?us-ascii?Q?sFBrB1eJe4dz7eXlkXmCwCR9ltGksBYb8T1PHj2C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f707b49d-3122-47a1-1c52-08de12a20b60
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 02:07:11.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4TuDWxzGPxZ/7scocTUpBqFXR5dWGX2b2+CDfdxjMUmZpQA8xbdkN4d68Y5qgHB1/n9tVgrDgkZhoqR4GIKRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_190718_418855_AE621935 
X-CRM114-Status: GOOD (  26.90  )
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

On Thu, Oct 23, 2025 at 07:04:10PM -0500, Alex Elder wrote:
> On 10/23/25 6:36 PM, Frank Li wrote:
> > On Thu, Oct 23, 2025 at 12:59:17PM -0500, Alex Elder wrote:
> > > The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
> > > clock when changing its rate.  Add a new quirk to indicate that disabling
> > > and enabling the clock should be skipped when changing its rate for
> > > operations.
> >
> > remove "for operations."
>
> OK.
>
> > >
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > > v2: - The quirk flag is now named QUADSPI_QUIRK_SKIP_CLK_DISABLE
> > >      - The predicate now returns bool and is not inline
> > >
> > >   drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
> > >   1 file changed, 17 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
> > > index 1944e63169d36..c21e3804cb032 100644
> > > --- a/drivers/spi/spi-fsl-qspi.c
> > > +++ b/drivers/spi/spi-fsl-qspi.c
> > > @@ -197,6 +197,11 @@
> > >    */
> > >   #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
> > >
> > > +/*
> > > + * Do not disable the "qspi" clock when changing its rate.
> > > + */
> > > +#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
> > > +
> > >   struct fsl_qspi_devtype_data {
> > >   	unsigned int rxfifo;
> > >   	unsigned int txfifo;
> > > @@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
> > >   	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
> > >   }
> > >
> > > +static inline bool needs_clk_disable(struct fsl_qspi *q)
> >
> > needs_skip_clk_disable()
>
> OK.  I was trying to avoid the double-negative:
>
>     if (!needs_skip_clk_disasble())
> 	clk_disable...()

Oh, Make senso, needs_clk_disable() is fine

Frank

>
> But I'll do as you suggest.
>
> Thanks.
>
> 					-Alex
> >
> > Frank
> > > +{
> > > +	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
> > > +}
> > > +
> > >   /*
> > >    * An IC bug makes it necessary to rearrange the 32-bit data.
> > >    * Later chips, such as IMX6SLX, have fixed this bug.
> > > @@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
> > >   	if (needs_4x_clock(q))
> > >   		rate *= 4;
> > >
> > > -	fsl_qspi_clk_disable_unprep(q);
> > > +	if (needs_clk_disable(q))
> > > +		fsl_qspi_clk_disable_unprep(q);
> > >
> > >   	ret = clk_set_rate(q->clk, rate);
> > >   	if (ret)
> > >   		return;
> > >
> > > -	ret = fsl_qspi_clk_prep_enable(q);
> > > -	if (ret)
> > > -		return;
> > > +	if (needs_clk_disable(q)) {
> > > +		ret = fsl_qspi_clk_prep_enable(q);
> > > +		if (ret)
> > > +			return;
> > > +	}
> > >
> > >   	q->selected = spi_get_chipselect(spi, 0);
> > >
> > > --
> > > 2.43.0
> > >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
