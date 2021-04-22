Return-Path: <SRS0=CVeS=JT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1EEC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 12:01:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C6C6144A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C6C6144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=Vf+VLJqyZV9YlqNYYMxMfZtudEeFOpa5ueVoLa3074o=; b=aqEsp/5MncTwHIzsCHIK9CIIs
	YfFdQfZmYCijAmBMjS/ffpHyLAQNZrz5DWag5425q87cZfp0lpN5kYlZZH8PtAfPcOOEzwXlJN98I
	POVnPNgvKC3c1dsBLdyl661Fp6B/n7JEApvuFIRFL5BTjaJxCg6hGvrb8bN4B46Bmtl55wBWGCiq1
	MW8mN0eo8+UG1wAALu6IBpQpBys3wscS+vFaI1OB2yQsDcIAPK7UpNoPVON+2tS0UP8FYiyRjXNey
	Rznj4UYyHm4eNTXyWlWHq+DW75KSiYIj7Km6zSv4SL4g8KX0sedNPYrPAd7FrudM9YwW2IRHXaDfv
	7m4gsqczA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZY0g-00Ge5A-Dd; Thu, 22 Apr 2021 12:00:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZY0e-00Ge53-Ck
 for linux-riscv@desiato.infradead.org; Thu, 22 Apr 2021 12:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=05v0q5/pgYNB8r4vVtW0Q8jpXRo4ihV4DWNlfBVnpQI=; b=ym4sQl4xJfLSOWBHvY8+c6dgTH
 awsycSNEABpVLagBSia0dtNc+/UNXvXP9c+jnCuQdeXaMk2eT4/ql5cM5ypxTsaFR3ExumRYYCdL5
 kNyvQ51Btt4o/Fk6CAGzdPSllYO9mYkttq4bep0TColSILYdoRB25vaF5xbnOr8qLmTd8VbVsP3T8
 vimIhZLUI4DhJLGTMbrnpt1wb/NZxy+A8RD3Ps1D6NWuDulXEQrOBB8RU8JB14SCYxynSjrvWmQHy
 FLlPL0a1Id7QDntNCi94vjgrz3gnUmghYz4j8ZzX/Te4PYZPFwcM6fVV6oglCtylt//J7j59Yu1hw
 GnujsBVg==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZY0b-00DeA9-7J
 for linux-riscv@lists.infradead.org; Thu, 22 Apr 2021 12:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619092836; x=1650628836;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=jFI7cMiC4oh8Am4A9ZGZjLuorlhW4/gmKPPiybmZ5cM=;
 b=hDRp1cqBNFOy0hmy5HtjroCHe64GLrI4BM1yJxSSbPGlzPnNRXRhlvfE
 eJ7cZ7T30+2bfiMlOUokq9Ot0XXA6+tLQ3HqPDbEoOT7DZI9Z5m0fBFx/
 izKYY/QoKezAm25LpTnU2RLRKkmPl1W3C+z5NfY+mAyTBO2UPI3Davpua
 Ik2ZzPqG4S2rlz9GINPgkJO5RTFF4sp1IQwKHXJ0txtymsj4f/02RMwR7
 hBKEuPvR2+V89y60XjRe69M08MNg5hQLfsOSr3e1zuixgWEFyTg1797wQ
 48Uo+XmIwb0eWFFUl1xdAeXgGlJmFdTWRL678KaLrzrVv+uylRBFsEGlF g==;
IronPort-SDR: yVk+BXoWEKySZq9ivtuj/KdXb21/27D9Vwm6HmH3ynf0N+WYgMB0SOcqgiNu1P8NF8lmAGSFvj
 X6AW/p2bt99XOFwcANQ3ciKzSUasZOmY7SAfEHc2DW6d9V3Etdrie2vMV9Tie5IMRWNaH7lC6e
 /VfkXdM79jnuXm03u55XfbGH740M+Mj8TchuCTsRNuCfhe8vZdt7f4D0irLSm2KzVm3zkBTCtn
 wSzLldDB3TFFqU9J3A1XYS7LMG1PmemB6c3zFNysvx59IupFuXsoh2oRACWQMJEaoZ3Q93sZqQ
 5YE=
X-IronPort-AV: E=Sophos;i="5.82,242,1613404800"; d="scan'208";a="170395536"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2021 20:00:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCulRv/bJUkwuUWve2FALVg4w6cjCL0LWqMenHkMEcKy0FWbp/OAVvQeJivTx8tKuyCGlNk8kIB1IfYreXEAtdO20kDflDSHqiT8vy8JQq8baGaCZA9fGNvpJimCe4JhSP0MaAB+VA1O15oKMHpCOZKJOQNBE8eL4qnzAlTUOhyNCPN4uu0cW0RZulZr62NyYL8e/U7pJGwiqLmEV7C0Vp+l7NPQ/fbe+lSBLNH78K6U04eFjiyw/g/tHBb8k07zCA1qGW/PgE3BI6Wk8KPExiT17MxOfihdVXWug+/90cMx79MBPPcTsnZCIm18XNhDHchqVog/ONpXW/oEKGeywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05v0q5/pgYNB8r4vVtW0Q8jpXRo4ihV4DWNlfBVnpQI=;
 b=bhh3YbEQkxwKYLs7pEJQp7pKSCY8fj2nFTwpp1jMPm0LQHskJn7xd2skDv69/WuRmoixbPPooaeKwmOcA2rU0qOCDu7fdDJaqZv+dlTwuabdaKzmmCGbnqrSgzLtCcJFKSy0BrB3u3+1+gIQmGAolWwEFMIyyn7ujmgY7VtUB2DT4hXjoHmYv8fYMGD9g4FPmovw7bKN11w5eulKqKYgzCQL18TnE2bOfcgU9mH6ibHTwPDWhi6C/Gf/xFRS2FCm93XSFcHYhs1HM1ZRYB/yckN36xmAkkJvTC5qqcdIb1Wld7D17p2+aePU4md4JBYqly5UAR5F5jue7H+36ohecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05v0q5/pgYNB8r4vVtW0Q8jpXRo4ihV4DWNlfBVnpQI=;
 b=r6JZQHSUs6+UmkrU/Ak9O3D3xL0gMnXqTrsd4IjFlgg8wxSGx01NVaMH6MCLmdZLafsZwtPrQkfCHIlQYztHqnCbdIgJSVTd22Kc7u66edXCZYoR/8fNsBsttfmsw0kH3q9zb5Msj3vjXvot26LARuY6OB4wr8rMHZQAoDMYqfk=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4450.namprd04.prod.outlook.com (2603:10b6:208:42::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Thu, 22 Apr
 2021 12:00:32 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78%3]) with mapi id 15.20.4065.023; Thu, 22 Apr 2021
 12:00:32 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Greg Ungerer <gerg@linux-m68k.org>, "uclinux-dev@uclinux.org"
 <uclinux-dev@uclinux.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anup Patel
 <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
Thread-Topic: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
Thread-Index: AQHXMyZv8axGA7lx3kGvgyyYuv6fjQ==
Date: Thu, 22 Apr 2021 12:00:32 +0000
Message-ID: <BL0PR04MB651434FAFF5566A575FDBE76E7469@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
 <20210417011009.54569-2-damien.lemoal@wdc.com>
 <5227b984-f415-98b5-dae8-0cf84a71bb46@linux-m68k.org>
 <BL0PR04MB651453DC7A8BE4E050B11893E74B9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <b83b023e-abab-35d2-22c7-5d259af2ac97@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:165:d3a4:4d5e:855d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d8be2b6-81f7-429a-e24d-08d905863af9
x-ms-traffictypediagnostic: BL0PR04MB4450:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB445009DDC9D21AFD6CB3A2CCE7469@BL0PR04MB4450.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pD1XJx3ZVK9Hxh/vGYEnf4vcei1yJvPsADn2JlM2HoWFH8tI+vThbxYI0WepzNooUNKHfDn2MeOrz/JRVVSDOMJOev8hU6m3T62pf8XQdYoQSSTUSztPkgI+Q85kNBQLcvVObOeVR5Zn7zaN1/uMXjkobB4B1hJMBE/vJ8l6px+6tgCUOVNjwvqt5b7O1k+2AoxgZc1WYHxRJ53i3QN6d11zMupAKqhIRaa4zmoLJMr3zX9MYtsvAFADytyhVic9SL7ZsFseO4Bb7EDdEWgBAsI9BoBybb8pIKrR6SYrQQqWciioEoxUHS9DKRIVfpSHteIDRiYsr6rH1JfORu8AMbO5O4AebQwjz5I8sjZTRWe2hJ3BipDMXS4ghPB6RsFCQWX17GL1I6Xoo/T5Qs9OaYy18qq8hbqDqEjF0PHZprEzqUlilocPmvSewNvCwSu7jsKHWYtFk0Bx4dCA2Mn7hp810HRAZkUOctzY4NutcZWf4lRsu/idcxsqYZ+6tYR6Q0nAPJmaZj0/MbTjng747xTQ3JkSBrdmOoE9AiORtSyyzRli8ieI/onk9UaTg6JuWZXjyEYXwOw+IWqvqXx3CrGqE0BweH7a+P+TSABAoIQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(478600001)(9686003)(66446008)(71200400001)(66946007)(64756008)(66556008)(91956017)(76116006)(83380400001)(122000001)(66476007)(38100700002)(7696005)(8936002)(55016002)(8676002)(316002)(110136005)(33656002)(54906003)(53546011)(6506007)(5660300002)(186003)(4326008)(86362001)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TXy/mODyqUBCTwd953a/XUHptywWEMGqEAnsvkOwzsnPeC42xMz8T2/9bV64?=
 =?us-ascii?Q?6sRFK49tSp1C98ZcFa6ni3MOXHUtvloP84qwEBuY3Db08bUpephbMLBZyIjn?=
 =?us-ascii?Q?x9wE0DAGSg8EZ/AWsRrcT0yhn0FCsAIyz+Jr1wihj2uY/PPveGUn4JoE0eG6?=
 =?us-ascii?Q?I8h8uDTiK/BdmJU8yPBEG0YNqYQYF2fEogvhcYesyQ1STugjNu7TbeBdi0HT?=
 =?us-ascii?Q?Ei0c9zNpjyMsAiLopWNN3MkZ+KWq77ndgNv3I2BUcs/M/CH9vxJTEMAPYecw?=
 =?us-ascii?Q?s6YVHo1Opzm5poA7WIhoS7nmulv0jsxqUlHZGh/dB4itezEt1QDN30aFLGIK?=
 =?us-ascii?Q?O5v6IiLoC7Qg++5sVoJkUxocM+01WdrfXRXFpdwQZZxcKxTQzskzriWUyHhE?=
 =?us-ascii?Q?5hfs1OghqmZ6KALS2+9gbq3Q+8nmW0ab6nETJEFCkYG7FkHS7VtgwnK75BSD?=
 =?us-ascii?Q?31AdVwaDgmBzrUmmI0oBK7aQPB+o1m7lfzrQ2La9HBSZbhYEOA12K3XASoIp?=
 =?us-ascii?Q?0vFTXHAjxFwyqYSIb8q9NN/omkpjKuOCNDbz5cV1zU7xB60foNtNx2Rp3rxS?=
 =?us-ascii?Q?qhWnqmKC6P2ZqUla1dNNyCLh5Q1br8sm4i92y2r3qfoAn5n9WETioDE5n0vV?=
 =?us-ascii?Q?1KJIPljWN3WndBZVnMtSRSST7cQVkkLW4uhu/KJ2+prY6y6geNdueaHPw92d?=
 =?us-ascii?Q?jtl99go7vf7UkSgp930ZpirDwHo6UV4oMRbum5gTkJiuss7GhxBra1O4EgIR?=
 =?us-ascii?Q?htL8PbGFOD9VBPi24PULKSd082rklzLWAY/5YdkwGt6F7tLhp3A63n89AC86?=
 =?us-ascii?Q?3oRasQZU9B5LAM2qP2HDjQl9Yt+1usnMF/+kQbxtwnrLZcnDb2SsCERz3xvW?=
 =?us-ascii?Q?RbTGNmWJ7iJpoH0g6UtrWPOsNovMt3YCFgrm8jL5imxNgTYZHmhWQrafk2O7?=
 =?us-ascii?Q?aIbkxpEycA7pVEY2jF5qN0FoYNoVPXm/5RM0AUn7geWWV1v8BblLSwUgFwVU?=
 =?us-ascii?Q?fM9avgKAABvMuBh9AIlX+bkIHmldygkNe+TaO8NAfA2W2XTJS8GP4RtfBCOJ?=
 =?us-ascii?Q?4Ty9OYXokQJ4ofP9ejfw/pKa3LVWzzofUbfwNQu6h7ad2TP2fvLdH8A2k0+B?=
 =?us-ascii?Q?5cweJ66yCaVwFlhbhk5NpoZ4xdwBMy4biF3gY+8XR7BUEvLpQn9x8LD5jguk?=
 =?us-ascii?Q?jho08VJPguDibayzK1GN/Usal6iWGW18o0bpdH0H1rt/sAo3L7HOkgCQHdEw?=
 =?us-ascii?Q?WMHK8Ocp0WH8r7eIsflaDDjiiK5OI5uV1je+Nk41u/o6QZlKBqyAW1l4NrKf?=
 =?us-ascii?Q?1SrLVnl5o7bxE1Kk87OQEdqt6ewKJ50/iqe2OjKdp0ogimtS113GvRjVtBTG?=
 =?us-ascii?Q?zc4O5fUuNoRGwZtzKikenGQ7LO8b3NR/ZfQxb41lON7MUmQGRg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8be2b6-81f7-429a-e24d-08d905863af9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 12:00:32.1921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VNM3GJJVzmopOUPONv+Sx41lKiRu87/pyfm9P1g7Ut+H76E5hWwbw+6JpqUsDmtBWkdG+z6LHhgrBeufFygZ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4450
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_050037_296929_432EEB53 
X-CRM114-Status: GOOD (  18.90  )
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

On 2021/04/18 11:38, Greg Ungerer wrote:
> 
> 
> On 17/4/21 2:54 pm, Damien Le Moal wrote:
>> On 2021/04/17 13:52, Greg Ungerer wrote:
>>>
>>> On 17/4/21 11:10 am, Damien Le Moal wrote:
>>>> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
>>>> the data start"") restored offsetting the start of the data section by
>>>> a number of words defined by MAX_SHARED_LIBS. As a result, since
>>>> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
>>>> always exists. For architectures which cannot support a such gap
>>>> between the text and data sections (e.g. riscv nommu), flat binary
>>>> programs cannot be executed.
>>>>
>>>> To allow an architecture to request no data start offset to allow for
>>>> contiguous text and data sections for binaries flagged with
>>>> FLAT_FLAG_RAM, introduce the new config option
>>>> CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. Using this new option, the
>>>> macro DATA_START_OFFSET_WORDS is conditionally defined in binfmt_flat.c
>>>> to MAX_SHARED_LIBS for architectures tolerating or needing the data
>>>> start offset (CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET disabled case)
>>>> and to 0 when CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is enabled.
>>>> DATA_START_OFFSET_WORDS is used in load_flat_file() to calculate the
>>>> data section length and start position.
>>>>
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>> ---
>>>>    fs/Kconfig.binfmt |  3 +++
>>>>    fs/binfmt_flat.c  | 19 ++++++++++++++-----
>>>>    2 files changed, 17 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>>>> index c6f1c8c1934e..06fb7a93a1bd 100644
>>>> --- a/fs/Kconfig.binfmt
>>>> +++ b/fs/Kconfig.binfmt
>>>> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>>>    config BINFMT_FLAT_OLD_ALWAYS_RAM
>>>>    	bool
>>>>    
>>>> +config BINFMT_FLAT_NO_DATA_START_OFFSET
>>>> +	bool
>>>> +
>>>>    config BINFMT_FLAT_OLD
>>>>    	bool "Enable support for very old legacy flat binaries"
>>>>    	depends on BINFMT_FLAT
>>>> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>>>> index b9c658e0548e..1dc68dfba3e0 100644
>>>> --- a/fs/binfmt_flat.c
>>>> +++ b/fs/binfmt_flat.c
>>>> @@ -74,6 +74,12 @@
>>>>    #define	MAX_SHARED_LIBS			(1)
>>>>    #endif
>>>>    
>>>> +#ifdef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>>>> +#define DATA_START_OFFSET_WORDS		(0)
>>>> +#else
>>>> +#define DATA_START_OFFSET_WORDS		(MAX_SHARED_LIBS)
>>>> +#endif
>>>> +
>>>>    struct lib_info {
>>>>    	struct {
>>>>    		unsigned long start_code;		/* Start of text segment */
>>>> @@ -560,6 +566,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>    	 * it all together.
>>>>    	 */
>>>>    	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
>>>> +
>>>
>>> Random white space change...
>>> Don't worry about re-spinning though, I will just edit this chunk out.
>>
>> Oops. Sorry about that. I should have better checked :)
>>
>>>
>>>
>>>>    		/*
>>>>    		 * this should give us a ROM ptr,  but if it doesn't we don't
>>>>    		 * really care
>>>> @@ -576,7 +583,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>    			goto err;
>>>>    		}
>>>>    
>>>> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
>>>> +		len = data_len + extra +
>>>> +			DATA_START_OFFSET_WORDS * sizeof(unsigned long);
>>>>    		len = PAGE_ALIGN(len);
>>>>    		realdatastart = vm_mmap(NULL, 0, len,
>>>>    			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
>>>> @@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>    			goto err;
>>>>    		}
>>>>    		datapos = ALIGN(realdatastart +
>>>> -				MAX_SHARED_LIBS * sizeof(unsigned long),
>>>> +				DATA_START_OFFSET_WORDS * sizeof(unsigned long),
>>>>    				FLAT_DATA_ALIGN);
>>>>    
>>>>    		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
>>>> @@ -622,7 +630,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>    		memp_size = len;
>>>>    	} else {
>>>>    
>>>> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
>>>> +		len = text_len + data_len + extra +
>>>> +			DATA_START_OFFSET_WORDS * sizeof(u32);
>>>>    		len = PAGE_ALIGN(len);
>>>>    		textpos = vm_mmap(NULL, 0, len,
>>>>    			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
>>>> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>    
>>>>    		realdatastart = textpos + ntohl(hdr->data_start);
>>>>    		datapos = ALIGN(realdatastart +
>>>> -				MAX_SHARED_LIBS * sizeof(u32),
>>>> +				DATA_START_OFFSET_WORDS * sizeof(u32),
>>>>    				FLAT_DATA_ALIGN);
>>>>    
>>>>    		reloc = (__be32 __user *)
>>>> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>    			ret = result;
>>>>    			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>>>>    			vm_munmap(textpos, text_len + data_len + extra +
>>>> -				MAX_SHARED_LIBS * sizeof(u32));
>>>> +				  DATA_START_OFFSET_WORDS * sizeof(u32));
>>>>    			goto err;
>>>>    		}
>>>>    	}
>>>>
>>>
>>> Thanks, otherwise looks good.
>>>
>>> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>>
>>> I will push this into my m68knommu tree, for-next branch.
>>> I just carry the flat format changes in that tree now to make my life easier.
>>
>> Great. Thanks !
>> Are you taking both patches or should Plamer take the riscv Kconfig change
>> through his tree ?
> 
> I am happy to take both.
> Palmer?

Palmer,

Ping !


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
