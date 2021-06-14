Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AD2C48BDF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 02:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D303E613AD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 02:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D303E613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=fHGFoIcYo93UxM/bI0Cz9RVXCuFn/eIfEldOtepgrAQ=; b=aFSaxOKio7Tg2V
	cN4j6kKxbKZanrW3/WSNUBvluANxkrCuHCSoLhTOPJxizY8d8ZHQ8k7cCwwc3fCmOd7RU4k6+2SD7
	qSd0KgHDhh+TCYQuahkwSpfZObxOjwvVFQuv1sZXhGTdU+pFTGPNXoi9Zqd4K9arOCd2O0tZ/rJsa
	tATQP2nJs+PHtpFZdVF+z8Tt1gD4/MC1yBqnKgV4/nfZfOFKSSPE7ltTcS4zdqPMd5K6losXp5Zjd
	hO3PCXB1ZolGAfWSXaG3G+2f+W1mZyoXETKpIjynZhTUYue3VMURoWHsk6xsGDccd+eo/ZQ4oVlyd
	e7+8QpAhzwlnvcvmUiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsc23-00C1YJ-F7; Mon, 14 Jun 2021 02:08:55 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsc1x-00C1Wg-TU
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 02:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623636529; x=1655172529;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=1DC672z388gX3/vg1zWZk58xsepqfDzPkINGLY43z10=;
 b=Ya9lO8y0oceZudOazZLCeA9V+lsvsv0M3YeERjQYNulkW6XFeCdL2VG7
 wU8HKadivEDjTr9zhX0N2c5HPDnv47V0+GrpLTxmUIZLC4+SCkcKlbHwN
 fenbvqaj6dZ2tvyS23bmZH5JvVOhRxsFBzGtuuEU1nFWHkJ291VZBCQmr
 olC83W9qbOlRS5oe/1K7SLAu2gTfOuQkSuj2MJ1xT6nNcswkBjvN0ojMQ
 sfQr/4jHiSIMSc2bNiIBrv4dboGmdq/EazUr1lkbe2SP0H11nykYgewoc
 FLI0umuFDp7qcx/F+DG3fxivYM8J6RjJHGu5miuYPza9YLWBhuRr1cSrz g==;
IronPort-SDR: WGpSnYOjepL9uiEmWNhPdFX4vkWZf7yBtalXjU+WZVkRyAqRY2CPtGTtRUtNdQz2c0suIG30wu
 JfUwm/e6FehF54PyWB5c4vV9lQX1AaIppBJgckt6VPdRbA2n/wknSXY9TXdnYshxiAw0x1TGzo
 C4ShOXc7GH1vxqHvTgIRV0IE486Mp6UgVEerThHfWti1H9HjNfe79RZD5KQw/cpcdtDKMniUj0
 qFFsfRajEFDCON0F8O4eEZnkbWqMClW9A3l2rTjbqIxqAB1roS42Gp7hEmmnQVlXRNFoGRtVNU
 /RY=
X-IronPort-AV: E=Sophos;i="5.83,272,1616428800"; d="scan'208";a="171046679"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jun 2021 10:08:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLeHAMYPiHZfgA+WSxyk9YKxhmDp/ecD0Yp3AqCrslAYGAUwnJy4LCGksGeb2x5NiV/6gqyX2UTuFYRsIG1KP9xsIn+DaBe2FgI2MKSw3Bh8G2/LRcWXfRDduoCiPubVBpBCF83xBnlLmsN8Gk+EnMH5+7DICO3OBtnc7u1sKZ3I2ipoCZuTDPEveZHMYNTb4IwZcHu46Q8e8o38iw98nF7bnIMWDUU+YcYC/+YW7TSLKxRkuLJw3ANs/FtW5GzKRGzey4mJC4qJ8sLnVg1hNt/IiPQuNJMDDv3YZac8S9xuxLWddonLPcguFQ+jlqzeoFQgKktynDxjsU6HmzwyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZszKIn9xyu/emiAikRqG/4P4B8VEcZ8MwgpJjkO/pM=;
 b=DUGqFtqtOw5saTQSO4pYk0nBm71UT/im1ZQEyvFOf7gxBK7/qp0s1KxNjbqEW4KYxgkGf6yTOS+3vzMmBOovZkogZ7/ZSaDHENNaMaE9mHusbTMjF5ws7c0+hQ1s05I7cx5CV46puGH8Tezd/hrqwLgL3/t8TTQ7Iy0cOFvkJ4csv0abyHao64rs3eKFwuoeqPZMpioATaYq1lKC53JdAxrhMT/PutO5P/HSszTrNcn08F0cbwC5BNdeU6kZvPfwL0JY+fmSDwZPs/G7qbAc6Xg9yJe8EJPjRe7zu2b8HvBoGlruxUBIDiZ9k7coki6Dlz3PP2JDeRUjX4YK8L+XGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZszKIn9xyu/emiAikRqG/4P4B8VEcZ8MwgpJjkO/pM=;
 b=HEvQVjzdCKZEVtU5oJ72NDMTTRatUMStAjvAx5tGi8SvVT9meDaQiIc0uwnP3129z8wyCfnu4CxFDw/ISkTSz4E/A3f2bLlBA40tDlUEnFTg4CoanxcJWu3mCHdZT3fDJ8vsYYKdCsn1NounbrzxpMPu/1UfHWnsx3trDGjgAxQ=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6393.namprd04.prod.outlook.com (2603:10b6:5:1eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 02:08:43 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::a043:568a:290e:18bd]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::a043:568a:290e:18bd%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 02:08:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
CC: "sboyd@kernel.org" <sboyd@kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: drivers/clk/clk-k210.c:717:6: warning: variable 'reg' set but not
 used
Thread-Topic: drivers/clk/clk-k210.c:717:6: warning: variable 'reg' set but
 not used
Thread-Index: AQHXWFvRoJxiJ4iKDEyXDkfjZQlCcg==
Date: Mon, 14 Jun 2021 02:08:43 +0000
Message-ID: <DM6PR04MB70818E6C2EEE9BD8F0AD92E2E7319@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <mhng-7814f596-6d02-4031-b90d-7db1cfed8970@palmerdabbelt-glaptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:588e:1cca:586f:ab48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07e86bb0-1190-47b9-9f0b-08d92ed955f2
x-ms-traffictypediagnostic: DM6PR04MB6393:
x-microsoft-antispam-prvs: <DM6PR04MB6393CBD0A69792043E1FE1D6E7319@DM6PR04MB6393.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EbOJwexjrRHo+AUdm7eFtbRqveK+IrJV3nM5v9WT03u/sqdyteQgIwCBQ/sFoBmlh5q+hpGnOxJhM3Rcw6lc1L8H+GVRvrp3TLAEAQSXUOR3XKO0kDctslxP0+F+qQRbo3Sr58+HDMsu0IjAKk/fH+xP7RO5vStAGmuMYlC/qF1wFNGoNZfaPwEcgwmCekrGfMTDj+APuUVjZQth7gDRh+bZEZE4nLYy5nWnHRq3oozS5FCEjkfzXR7aD2onO94nTdVIaJ6kLh85XP5MJb+y+YR9qu+kBxg+vlwx6Ap8UciCy+51ZmvkMcDxgSLZTF5fGy96WPhDeiYjP+Ln2B220hDvU/2vhtL7sPKq6xGtF76A/DWO01dZACovzEjiR4CD7V0wXXpqoH+36Z271MjmOTKdyyNTVEfNFidl+MUVTPfbKuEzxX53EaLrIr/XGuC/toO1v7R5p49cRDf9BqxoGtWWygqi/4dMEcUO7fRjNUwkhcw802YDJvl96o2vpxsYmxsymWr2AtJOfDUhoiPGhEA03hcQDqCOGy7exiSsTTFZ2j9VNnahglzxyZ0kg0WDS0QtU1tDceQFQ8imiATutog3evES78Evx1ELx/GVYkTFec+rxhZmEYLuHG9s2d9KoVx4TtBSbwQ2cNm2mnUFNcv6V0aEfWExHyezyVvUJJr8doKsSgeiyl4y6a7MIgWR3F0DxHAG+uebhem0AHG+9QvDtyPxRqZjTHL7ovjWj6bPhxAxWEnfg26LZHeM1NUhAqlyP9UgA33zbeckGGdOng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(6506007)(53546011)(478600001)(54906003)(83380400001)(5660300002)(8676002)(186003)(4326008)(66446008)(64756008)(38100700002)(2906002)(7696005)(6916009)(122000001)(8936002)(966005)(316002)(66556008)(66946007)(55016002)(76116006)(9686003)(91956017)(86362001)(71200400001)(33656002)(52536014)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O+PNBAXgt7bgmCOCt8NR2FcT+HXnsAd7yyYIXZwi67/QNq1mjNBuuc0+EI0V?=
 =?us-ascii?Q?UsQeOh7HgzAjl2G0BaXFkHO78+DiX0z3TN6+RZw57mLU79Gv84gLAlDGSrVU?=
 =?us-ascii?Q?1Mf+e8kWNjqqYLGBoISILUOiunIt7RtmHwM+7m9K+p4emG54f+XMSAsIu53C?=
 =?us-ascii?Q?YJuHSQ5GlwWqPXJ9stkJQpnwpGR6i+AcUqjXFiFS9f+alYTv5Rb5QOoMMHCt?=
 =?us-ascii?Q?BC5TXZ1uFXVsrRO1ZBB5Lfnws4ogN/0h6R15ufZSYshKD4gMWXMr3wPGDbWV?=
 =?us-ascii?Q?tahwWYGQvFYO7jlDDZpDgyyZVtKo5KeQsDfNExP2mOtu5NxtbMccEkKlllwZ?=
 =?us-ascii?Q?us7mPH87EmUt1WYedV/9G+fB7GiZBjGWYPcwY2gqjaRPpCtJKIqZAEo3tnJK?=
 =?us-ascii?Q?ETkUU2gT1bx00R5knUbf2GeAzZwBu5PIThsdkA1YDiIAWRN1DecaQ5idnC5D?=
 =?us-ascii?Q?A1l3poEiA8OdBXQ8FLUV4NwQYP3TcxHG4g9cl2tHTLOal5m+pOjApZaQUeHG?=
 =?us-ascii?Q?x9Tiye4ZYSuYGfZjlVZGATm10n5Qqz6rHoQ7qyzo3r6ZBh2hiDQsODQZGvBM?=
 =?us-ascii?Q?dfUu7eRZjRcaos4r+BloIXqj5VlKnWPauJG4+n5zHliu7h1Vu5O7/+Xiqi4X?=
 =?us-ascii?Q?xXBtud5RZ9KNQ4fPYOOKmGR9ABwgx0iVOEGTs7qcYqGJdRp97GsonswjUQ/e?=
 =?us-ascii?Q?sp0fn4E2CNyoRCB6CSjO3mdNtHpe63nSxA9Caph+geomZgL0WtFjoOJwo4Ff?=
 =?us-ascii?Q?kPqGV6JeD3Eo3sU+wHK1o5ZM4+8ZNiS8/w1pnck21MRP9J2eZh++d9mM6qFz?=
 =?us-ascii?Q?monDTyU/sX1khCoiF4ssUWBpYDdV2fJQR62lfo1PW5DXqIH/+MbPgT2LmAhv?=
 =?us-ascii?Q?6NGJQ4KacEpCR0QuNnXHMrj29+Lb8Bkxc2Na5kLQ4pe9CIXfkDHndptHqmqK?=
 =?us-ascii?Q?zmsfLw2oEf+zACS9oHPKmQQk8CUI6dRAbrZ1gHqBSgXXlYPA/UoSTAqSZbjY?=
 =?us-ascii?Q?f2zgnRhcqpLuvFOMQ3kYbL1eHIhK2EMt4gli4OOgVn8N3x/hcJxMO387liis?=
 =?us-ascii?Q?6SAHbtQMxIrg5ZUTwaAqkJdl0F4KXwvpN5lFeqVzePF2rNMfrAP2c0HDIEX6?=
 =?us-ascii?Q?5cf530Rt8jJoVnxdFNZjxCxAW+62jrJIvU/n22Gs9mSvuElOvRd3cFbveT6O?=
 =?us-ascii?Q?VJYox5bIxWV0Ivui/oc88y4cx/T7g5+UlLtVcvMhyP5jl+sq16PTbVcpvum1?=
 =?us-ascii?Q?VpsxdNaX+0QCwzuZbSky5OBM4PtQf1rprSeprB0Jqb9d2XxarGdqtuhEGtxN?=
 =?us-ascii?Q?Nh+mEmZJyeUvMHR+naoE8JQ6DESWUxO0MaQnv4eWiqBI7YNDusuY5FezyMr4?=
 =?us-ascii?Q?omjBod5YDBED1Ifk1fM7qGamwGpxWWQCtbZ95z9MFMVt42zBFg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e86bb0-1190-47b9-9f0b-08d92ed955f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 02:08:43.3006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9isewrb1ApQiCUGnfYrCifsK9gv7/1IrU54vzHDpX03HWVHcu7QEx2WSbw53nnwLENkOnEdcZvEDhWSlqeM7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_190850_189575_BAEA1A01 
X-CRM114-Status: GOOD (  11.94  )
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

On 2021/06/12 12:55, Palmer Dabbelt wrote:
> On Thu, 03 Jun 2021 03:03:14 PDT (-0700), Damien Le Moal wrote:
>>> On 2021/06/03 18:35, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   324c92e5e0ee0e993bdb106fac407846ed677f6b
>>> commit: c6ca7616f7d5c2ce166280107ba74db1d528fcb7 clk: Add RISC-V Canaan Kendryte K210 clock driver
>>> date:   3 months ago
>>> config: riscv-randconfig-r033-20210603 (attached as .config)
>>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project d8e0ae9a76a62bdc6117630d59bf9967ac9bb4ea)
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # install riscv cross compiling tool for clang build
>>>         # apt-get install binutils-riscv64-linux-gnu
>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6ca7616f7d5c2ce166280107ba74db1d528fcb7
>>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>         git fetch --no-tags linus master
>>>         git checkout c6ca7616f7d5c2ce166280107ba74db1d528fcb7
>>>         # save the attached .config to linux build tree
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:556:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            return inb(addr);
>>>                   ^~~~~~~~~
>>>    arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inb'
>>>    #define inb(c)          ({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>>>                                                                            ~~~~~~~~~~ ^
>>>    arch/riscv/include/asm/mmio.h:87:48: note: expanded from macro 'readb_cpu'
>>>    #define readb_cpu(c)            ({ u8  __r = __raw_readb(c); __r; })
>>>                                                             ^
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:564:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            return inw(addr);
>>>                   ^~~~~~~~~
>>>    arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inw'
>>>    #define inw(c)          ({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>>>                                                                            ~~~~~~~~~~ ^
>>>    arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_cpu'
>>>    #define readw_cpu(c)            ({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
>>>                                                                                         ^
>>>    include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
>>>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>>>                                                      ^
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:572:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            return inl(addr);
>>>                   ^~~~~~~~~
>>>    arch/riscv/include/asm/io.h:57:76: note: expanded from macro 'inl'
>>>    #define inl(c)          ({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
>>>                                                                            ~~~~~~~~~~ ^
>>>    arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_cpu'
>>>    #define readl_cpu(c)            ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
>>>                                                                                         ^
>>>    include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
>>>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>>>                                                      ^
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:580:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            outb(value, addr);
>>>            ^~~~~~~~~~~~~~~~~
>>>    arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outb'
>>>    #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
>>>                                                                  ~~~~~~~~~~ ^
>>>    arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb_cpu'
>>>    #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
>>>                                                              ^
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:588:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            outw(value, addr);
>>>            ^~~~~~~~~~~~~~~~~
>>>    arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outw'
>>>    #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
>>>                                                                  ~~~~~~~~~~ ^
>>>    arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_cpu'
>>>    #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_le16(v), (c)))
>>>                                                                                      ^
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:596:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            outl(value, addr);
>>>            ^~~~~~~~~~~~~~~~~
>>>    arch/riscv/include/asm/io.h:61:68: note: expanded from macro 'outl'
>>>    #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
>>>                                                                  ~~~~~~~~~~ ^
>>>    arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel_cpu'
>>>    #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
>>>                                                                                      ^
>>>    In file included from drivers/clk/clk-k210.c:8:
>>>    In file included from include/linux/io.h:13:
>>>    In file included from arch/riscv/include/asm/io.h:149:
>>>    include/asm-generic/io.h:1005:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>>>                                                      ~~~~~~~~~~ ^
>>>>> drivers/clk/clk-k210.c:717:6: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
>>>            u32 reg;
>>>                ^
>>>    8 warnings generated.
>>>
>>>
>>> vim +/reg +717 drivers/clk/clk-k210.c
>>>
>>>    710	
>>>    711	static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
>>>    712	{
>>>    713		struct k210_clk *kclk = to_k210_clk(hw);
>>>    714		struct k210_sysclk *ksc = kclk->ksc;
>>>    715		struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
>>>    716		unsigned long flags;
>>>  > 717		u32 reg;
>>
>> Palmer,
>>
>> I do not think this driver is the real cause of this error. Did something change
>> recently with risc-v mmio readl()/writel() ?
> 
> I have no idea what's going on here.  When I try to re-build that config 
> I don't get any warnings or errors.  That said...
> 
>>>    718	
>>>    719		spin_lock_irqsave(&ksc->clk_lock, flags);
>>>    720		reg = readl(ksc->regs + cfg->mux_reg);
>>>    721		if (index)
>>>    722			reg |= BIT(cfg->mux_bit);
>>>    723		else
>>>    724			reg &= ~BIT(cfg->mux_bit);
>>>    725		spin_unlock_irqrestore(&ksc->clk_lock, flags);
> 
> Isn't reg unused here?  That's one of the warnings.

Yep. I just sent a patch to fix that. The writel() call to update the mux
register was missing (did not notice since the code basically use all default
parents and never change parents).

> The void* casting has been there for a while and looks like a real bug, 

Which (void *) cast are you talking about ? The one for the asm generic
definition of PCI_IOBASE ? That one is used in the case of NOMMU build since it
is not defined by arch/riscv for NOMMU builds.

> but asm-generic adopted our {in,out}{bwlq} implementation so I'm just 
> going to toss ours.  I'm not quite sure why the generic ones aren't 
> doing arithmetic on void*, but I'm not getting warnings.

I tried to compile the attached config with clang 12 and the compilation even
failed (on a frame buffer driver)... Have not tried W=1 build as Jisheng
mentioned. Anyway, if (void *) arithmetic is a problem with clang, I wonder how
anything can compile at all with it. That is used in a lot of places...

> 
>>>    726	
>>>    727		return 0;
>>>    728	}
>>>    729	
>>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>>
>>
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research
>>
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
