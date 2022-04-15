Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB3EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 01:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDNHGEFeAFmAbLcvGtLfrtvRyOHzKQfBzI0JhYyOUkY=; b=NZyVKEicIzM5Dp
	Dzv0kJ+W3ogVoXmQae5iiHMfTJOd95mWTJLTyzBdbSirDfwhT0nCW7SA7y5YNmwaIN8zzzkzLhxAr
	FzjuP8zeP35FAfwMqrKbfYc4sPZG6gHjhNLUoEy7Pca50lJOamWsmAl5rxDBD44AznoPT837ztKaQ
	mzePDarbRrBdNC/WB5spDO33Z4RJsXJr2CKOTYo1NyqiiiVBVt3OgUBk+JMO01eBbRjM3od4V/r6X
	VuKCpV5yRI1D2ep0FuoBUzLWMvjspC2od/lVpCXlPawG4/CYTrNv4+Ee1chkwlVQZoW7duRwtiDVq
	+/7aHqBGSDQNKG19A3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfARt-007wvq-Nl; Fri, 15 Apr 2022 01:08:33 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfARq-007wtr-Ap
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 01:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649984908; x=1681520908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cwh412dT9kz5fVK5N9HMETwfYyvTQ3hVsCKfcRVJjyI=;
 b=P0+FYQEzoQwXIVJxB2B0HeHN4rxH4Gza1/mqU7Kx4CFdbikghsgs0rhb
 YBM7ETLTGIWq+ZA+KCyQAvFWCP0MgRBw0N/wICAi5nEsAmkpgzVSbhYjO
 ysOlJSxKZemTKw+iUQHpk2XiI07+nPctdTyDMI9uMDgHNriaDss+Lu2bI
 ZirXWggw986EI1roTkV4pieJcN7cNkBX3nA8AWWoVM6A8K2q+oHcosG51
 QVY1igeKjtFGiXuQncMRqcG+ESItcMpLSK7R33BP352w3hCoyRnaGJmx3
 Omw1stk9PZzKqO2QR93/wotKGzlLixRVHGNbiutYliUqnHjM2+mz2uWol Q==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="197958805"
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 09:08:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do1r8vMNxcmobR07D2oH9TtAgC24TcU2fjM49y0VqVb3KvPyx59R6/7ofCpSzicFgrndKYkMKhBa66KzdCWzY+g7OrzllG2VbuVPdUmfimUmyBQr0MQ5g2d0VAI6ZWI/GtFHf5dBmQKlNZAnr44SFlHUfeQgyjcMWWTaNOm0n0IxrdajIG1gUokB5EjH7rHUAKlgw5yGMCLbqZLHt1pqnbdwdF+8fjcxkymM1wDdXGl9d6xygmdG2JDppAy2+g4pZtGKxOs3Md4bzQ66MS+kR9Q7l0j2sr1tL6JCFfa7ysDYyEb/ydOggR3qyOs/WY+1rmIvzaWO9nm+vW9u5cR9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwh412dT9kz5fVK5N9HMETwfYyvTQ3hVsCKfcRVJjyI=;
 b=EOsAipU1y9njtfpG7YBYzhaLnVm1XOEWhA1uyvay2GLkvl9psGn4yhGTzDKJemEHR8EERfAvUWHwN5I9RhSUXZ/p2uq3Ic3aW1wAMsHkGnqr2gXUzLsWFcjQfm1SeG4Z+DXSA4NaB7/VdJQHX1Zjc50DNbLiP6fgCM4awrrmrOGMN3SdHe2+8sEl5d3Kxmjs2KOHRPY6RHc7rghJ/UhU4ZkbvQZugtnF2UnXvTmrTmyhIvhIlOpByttJ5Uvk5WVleg1dwJtVncrwv9YcBu2O172ibdsRERWEehYHWbHtUu5iY27svVshEunmmeopI4QFPAHI4cH1Cr6Fy9U8oQhDmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwh412dT9kz5fVK5N9HMETwfYyvTQ3hVsCKfcRVJjyI=;
 b=YxGqlll03GaOldoIujew6gxCSvoRqlPzbyASwNWBc+eSnZrtabXx23B7tHY3il+I0EY+f7Ggmlz1BqEq+10/2/TuMXSTs4rYP2h4BqIiscYoko2P80GIWHHzEQ6g1vsgioKv+owpGEQLwW3twKHVNLJMnlbQ5O/1suTYvzn0YS4=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by CH2PR04MB6678.namprd04.prod.outlook.com (2603:10b6:610:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 01:08:25 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af%8]) with mapi id 15.20.5164.021; Fri, 15 Apr 2022
 01:08:25 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger
 <vapier@gentoo.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Thread-Topic: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Thread-Index: AQHYT9+B/BNFs63JH02JGuF3zm1OJqzwFV2AgAALBgCAAAcwAIAAA0oA
Date: Fri, 15 Apr 2022 01:08:25 +0000
Message-ID: <YljFiLqPHemB/u77@x1-carbon>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <6ee62ced-7a49-be56-442d-ba012782b8e2@opensource.wdc.com>
In-Reply-To: <6ee62ced-7a49-be56-442d-ba012782b8e2@opensource.wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8351baa-04e8-4429-79ff-08da1e7c7188
x-ms-traffictypediagnostic: CH2PR04MB6678:EE_
x-microsoft-antispam-prvs: <CH2PR04MB66781BF4EE0D288740CB1CB3F2EE9@CH2PR04MB6678.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HBbg2/S3as5uXH527AzIzV6il8z5/Ucd8Yv8+XRb1FTGTxNow3ba0FBkCWnTO7NtszG54fvaAdLu3DDaiWmRwcGp18FrSye7Bx4dSBRBVkm0KmPRO5d6ePO89m+Z1Q6r9suDel/zDfNhMecrT+v+IB8024iFRMMp5XO6Y1eJkO8W6u/ly9Lf1QIT9YlX55Lz8bj42DxaGvgLBAFcOzRa/3KS9RPGSN1V45sD30yn0qE/VVJXzDFp7Igz+tLm+Kh1RAg02SMjev099+g6GyBKPZYRbxNnjdoPc/t5/XDm9D02wlGaeMBh/XyusirjFN9xoB6xTDvOLNhaZpoxyHB53SZbgMWO8p0Osf8nBuvb2Gy8nPNcsBLNNlElfgUUrEx4jYPj9svlLffuAu5CUDiYpAwmz4x6SlUh7EiL8XSeDzuE27JApQ4mOXS8hmQeW20RgDXFpweA7E8V692pGknL8tSsijT9lBFklOFhyOgsOSfgvqgjQAsH8iYWAYbjPKZPgrGWYkzJ0eGeFn2Jfuk3+VbW/pHqCOKGXYDE308wWBmZHlGJf1bA9eiaKRogCHev327cY1Ptj64RKDt46G11MivjghERtZnjTnK6S+QAs+eRexBQykWyBpgPehHiXYJ9i5Sxl5ZZ2pzxVamQoPzP5dvrw04tW+F55enyKM/M9p0KqfpTfi+KfxJwPsF67Mo3UKP0KiDwcuIWFJ6iry2UcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(82960400001)(66946007)(71200400001)(6862004)(54906003)(4326008)(33716001)(5660300002)(6506007)(66446008)(64756008)(66476007)(76116006)(86362001)(9686003)(6486002)(508600001)(66556008)(7416002)(38070700005)(6512007)(26005)(53546011)(186003)(8676002)(91956017)(316002)(38100700002)(8936002)(83380400001)(2906002)(122000001)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PTZP/FWE4beW0S0cBvZFi/rbg+9RtdsjkMMtP8vh6nwHW/mmSdKk2hXlik9V?=
 =?us-ascii?Q?veizfhlw8yLSDNiRZgGULe8Zo+vqn7iXx7n+sL27TCfnC4YNJ1/jy42sTpPk?=
 =?us-ascii?Q?xiscVporibqUV6++sBMyC8GD77+jeXZqEqok1Do8s+r3koqyXBG69b3o23Jf?=
 =?us-ascii?Q?tpRiy7LcZ1fnu8NryJDUaYmmCLO666DUVYw6DHPdUHNr5a+3DCP3kWAC4FnE?=
 =?us-ascii?Q?aJGZ293ExQt337MCucUnqPma7n3YGwp6ILsZFwaD9yta4SOJo3u/ON5Kkue4?=
 =?us-ascii?Q?oGfIYrfce2gCU2mD7kzHF2NknbiYG2Or8mwnaEHy37GKUaGsxYids7YqvWkN?=
 =?us-ascii?Q?uus76wpDyQ37CAANiuf2Yy/uf4/9ymoK1KNxBBVGgDSZ2gRufYMpvGDUxxiK?=
 =?us-ascii?Q?J33LAadgs/2bOFesYYEdNry84Pqc1yveRC67OjMu4gpdA+1jBuTNUFdbcU54?=
 =?us-ascii?Q?UsHS7R2ngt+ndG99ozVlpjCZPnepa17cmDQsJsTcPSg61C0VG+ZRzNSpG0yW?=
 =?us-ascii?Q?9psN9JZ6wsX8cYqiT5Kq9Ivf4W5z4H7kgEQ00ZZbbQ2Fw37TVk19AKj7XlwO?=
 =?us-ascii?Q?dRV6Lp+URtGgOwE8/Zg9fsNcU/he15BLRmqwMit/8XK8MotFk2tQOBL3CKry?=
 =?us-ascii?Q?E/Q2XedV57lW2HnKJ22b8aQUUsodvyaE9Z3FmukOP8+OSXEOmBDUDDoHfsll?=
 =?us-ascii?Q?pEBzha53vwgbcotf+CtJUhyhDav+rRJ471MM+Aw2YW0ky/LzhAkX4LzFduS7?=
 =?us-ascii?Q?AsNB7ML8dS8N1sh1M1Ok3j2wGFfPbv8fXV1rJpnzWi6BF+/mZfiB7bjZaIpc?=
 =?us-ascii?Q?uQyMRkuhySGAA0C77xkJOtFDp2bU5RqlrS8WOZwc7AfA/GO9JlRbiX83Zu00?=
 =?us-ascii?Q?kDC1sQT/YgFLdNAxNbvwtweM7s6YW+AUn2n/t2ZE9KUQPbEafA+tIs/WhO2i?=
 =?us-ascii?Q?Rzw3rmJFUnwEpdVPz/zrNd0TnhtOqGY/xNMnii442JQsphvGtn6LXYaNO17B?=
 =?us-ascii?Q?oyN+cL+ImBGgZt/wfPr19r5QptZRnmZAzyndBAyuAwLj9uDNqal/95bQruim?=
 =?us-ascii?Q?RxBx6XSQid3buNhK8fMFQsju2MEbnBSwHqs3ZGtXhVOo/05lHl/5wKPStwA2?=
 =?us-ascii?Q?hXqMbp875RV0qkIS6LphoE14iQmu0FbinxZM5gLYvvc66RhjZkM4ZgfqvN1w?=
 =?us-ascii?Q?CuXefeQyyjxd+tkAo66QLiMffCJLM14ZuUKrxkISzMBO7OEAT63qGhnDX6JB?=
 =?us-ascii?Q?gKEJ7D6GmijmtUx46n4rZsNWmKadLMSnI502Hms3k4UILdIR1Bn8+Mn9SqOO?=
 =?us-ascii?Q?yHIAoeJKsXvS8MPGwt87PE0ynsdKUjcQDq/6QWEVQ8a92QZJpx1ONLTP6yRt?=
 =?us-ascii?Q?RRhauGhS2igmlSW21rKQ7wpfysQfExiS4BQTKCDqG/dpFRrMxmCzeEKuofYW?=
 =?us-ascii?Q?Ak7eNMN7kAoYNvsa5DvOFht8Tr6v9pMVFUwWnIkUAJiUfsGv1aBaM/V1JRpe?=
 =?us-ascii?Q?fn7Kl2OgrAO/bpF+hZzQU7aOubPRMOUd3+LPb93UkYpTEPD7nS/bJ7kyckKb?=
 =?us-ascii?Q?kTtL72tCyHeq+yfnr7DMdPpePa1rHnAquB7cYhCPeEuwZC2V+CezFYsPcTsr?=
 =?us-ascii?Q?hYF95/BeFpmkcXE845j6KdpSpP9O6RQFyKMalSmRHzvT59pSkiLttrviQxhP?=
 =?us-ascii?Q?7dHyrIrGtquCbL11yt/+34frqGqsaEbXaENDPob6ZH+g4jIK97/WeU6Qh2OS?=
 =?us-ascii?Q?tXNRib5uC/4XEK9W15tiUy38FVX4xPU=3D?=
Content-ID: <B98E0783D6BB854E9C81DD7EC6F1DEEB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8351baa-04e8-4429-79ff-08da1e7c7188
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 01:08:25.4331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRzISmnPNZhKlsJLmOA1Yp9DrIXWIGN2zUpv7v3TKcUYHFU4THE83XdmAxOz3KriHkf/d2g4FNwsrOKj+KtlIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_180830_419772_9DFD06A9 
X-CRM114-Status: GOOD (  15.68  )
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

On Fri, Apr 15, 2022 at 09:56:38AM +0900, Damien Le Moal wrote:
> On 4/15/22 09:30, Niklas Cassel wrote:
> > On Fri, Apr 15, 2022 at 08:51:27AM +0900, Damien Le Moal wrote:
> >> On 4/14/22 18:10, Niklas Cassel wrote:

(snip)

> So if we are sure that we can just skip the first 16B/8B for riscv, I
> would not bother checking the header content. But as mentioned, the
> current code is fine too.

That was my point, I'm not sure that we can be sure that we can always
skip it in the future. E.g. if the elf2flt linker script decides to swap
the order of .got and .got.plt for some random reason in the future,
we would skip data that really should have been relocated.

So I think that it is better to keep it, even if it is a bit verbose.


Kind regards,
Niklas
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
