Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885F0C388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 05:53:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC23D206F1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 05:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vNXD+pIy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="opwNjgg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC23D206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K0qdiOJokQQkrm9t7LhhWgrVue1aR1rsejO+vbKF2R0=; b=vNXD+pIy70QlO16qqNG6Adorf
	rzq4ijCiY5nR7NkxRfI0c+MYcmApVbzY/BmIeBgV7MMbOH9NIlaC7OzJaEbl6/jrSg6EkxUZED9xj
	zbu/9FUd0oRi4AwwD4fPtqcpwX/SEi8Q20oG+l3Thfdv5qvemyaESa5a2hyb7dfzdaMnDYiuMAR7q
	1uxznqBFJ1EfmhoFoy4yRvMoAcBILNpTeQyyX1607wE8y4TIoG9Op57VnhD90dPXlzgwBb2IeAxoi
	14kQPmWi2s/5hwOI8xhu7zSldpW6rWKytiSuBE1F1CAE1XcyJErpHSdxQBgm2HsYNuqOmw7HqS91g
	0MyEC/QMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcj4B-0006xS-02; Wed, 11 Nov 2020 05:53:11 +0000
Received: from mail-bn8nam12on2048.outbound.protection.outlook.com
 ([40.107.237.48] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcj48-0006x6-9u
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 05:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUTNl+9wHGDHu3UGBKQU8ASOh6SmNie8jE/Ij/M6bYRRJ3TCxSebaKqje/5dlqT37bm7bPwCbUw3ElODSqHss4C3NjCbovfMz+MSPtH1RcrmvtgfpRX9VtL0ugA4bNzkjZIfmAgzZSPh7+irzCiE32fqNS7xpemcGTOJq0CaEycwod3WMoo0QUxuFNcwN3XMv5hRkm9a8zh4LzSOIhrIXkR6WnQWHqbTfGpWDaIwtRZwPklhyU8z4iXZVuvJjC0mpuG+/6rojWfMYNkGLu9gl4URbH0L25211OlFxdP8F4f7/1weV7YUVBwQNVJ6DmMdZo0nTEc0JjczPnt60tLsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7ieXBsuQUdEHARnDgMcHMnfx+sGTfJD0nw3NVf2V78=;
 b=RAUbx4f9Q1EFJ0iwzErg8BwmQk0YDZdTRY9iuXfwgFIPS52j6dcjDvLLVOtcRf/Vly12TuXT8/rP8qDZFNyFscz/JXbvMF+UpRqXDH6Ql+nX5IlyGsYwSctqUASrG3Cez4GeBo66gh5N7f/UgkevCHaeSTWg/7Xi2/tnO0Gp9wBYD704dBWqrLITTsGzcTaiuQIejsVcp1jacjB4DY9KeHU9T/h9dX536YgJmca+JvmlivXxR1wdWU8NMZvrAVJKonLG/b7o3utXvz9l45C0i0TnPGTluaDOwDNFULFCVN5viYn3ZWSXOtDurGhOk/GUUymxeJeAwqgBsR793O/YAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7ieXBsuQUdEHARnDgMcHMnfx+sGTfJD0nw3NVf2V78=;
 b=opwNjgg0WpByBzxAu475EOaf0h1Yo0jxKAK3iKY3EXWdDv79QRsPGIwwSHfcwch0ytQx+DLG/6huHg6zh8vIoj03sxZPdWz+w0hAtdVb8QtMDcdw8Y941sT7NlXoK+jd/LryRidOVGMGma7N4OhACii0RrDuWj4J7TUcdUgCq7Q=
Received: from MN2PR13MB2797.namprd13.prod.outlook.com (2603:10b6:208:f2::30)
 by MN2PR13MB3661.namprd13.prod.outlook.com (2603:10b6:208:1ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Wed, 11 Nov
 2020 05:53:05 +0000
Received: from MN2PR13MB2797.namprd13.prod.outlook.com
 ([fe80::dcec:40d7:3fd6:308d]) by MN2PR13MB2797.namprd13.prod.outlook.com
 ([fe80::dcec:40d7:3fd6:308d%7]) with mapi id 15.20.3564.021; Wed, 11 Nov 2020
 05:53:05 +0000
From: Pragnesh Patel <pragnesh.patel@openfive.com>
To: Zong Li <zong.li@sifive.com>, "Paul Walmsley ( Sifive)"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "schwab@linux-m68k.org"
 <schwab@linux-m68k.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, Yash Shah
 <yash.shah@openfive.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 2/3] clk: sifive: Use common name for prci configuration
Thread-Topic: [PATCH v2 2/3] clk: sifive: Use common name for prci
 configuration
Thread-Index: AQHWtzMrBuTGvrCfD0SWjOrvc3K2U6nCbxxg
Date: Wed, 11 Nov 2020 05:53:05 +0000
Message-ID: <MN2PR13MB27971ED8EF61A6207423FD4EEBE80@MN2PR13MB2797.namprd13.prod.outlook.com>
References: <20201110072748.46705-1-zong.li@sifive.com>
 <20201110072748.46705-3-zong.li@sifive.com>
In-Reply-To: <20201110072748.46705-3-zong.li@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [2405:204:8004:b7c5:a5e5:20a7:4d2f:98e3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf6e6ace-0cc8-4e0a-24bc-08d886060f52
x-ms-traffictypediagnostic: MN2PR13MB3661:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB3661C9E52A5512A59DF25258EBE80@MN2PR13MB3661.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2lVtjlyaByvnkgdocBwaXzMmNxOzwfMnkaFdFrjBHMsd/gNcD0fmFVMsKvCfN2qU4o9XoCFqmV/i6+seGkhzgrTD2Ncl28TxZ1smAknOv+LH/Bv8R+i8f7X6Ike2FvBWphJdiLKkJbHj/QI5PmB75axpbSbzq85APA5WXqAA2HQN5FVYWnzJatLBplJe5PYNRpFSQnMy7pntmXMmAimkqbRImQsQnSeSK8x3tNhkGYmcc5wDOnoGB6hoBO4fm6mLdd0lLFL9veRfVK0cAzW3d8+/Lh9j3E35ZKoFTBbhCjcqfiZjhDAngpHQkP606G28hGn9DKiOdaUd3leDgmcorAqU2hob/heKJZMWFduiHeN6HsaNdzco2fvUOh+OIOQd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR13MB2797.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(366004)(396003)(346002)(376002)(136003)(66476007)(86362001)(66556008)(83380400001)(9686003)(6506007)(186003)(64756008)(54906003)(66446008)(44832011)(8936002)(33656002)(71200400001)(110136005)(55016002)(4744005)(2906002)(8676002)(107886003)(52536014)(66946007)(7696005)(76116006)(478600001)(4326008)(316002)(5660300002)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xOaXFyBloDz6NIUn7X465gA5QN1OcEp9+FJJbDeH88P6yVNMBf6QhhTejLj/ctMi64AZQjSYCSoBuBRG/A0HKQxmSsM1d+Zd0Fu3r0tS1BpIUly4B5PvqJ+NKbxGznJDPGCbsFJy1sQhVRqzld2Yzu/de8w06sTCK2q5CGcC1ZF56OIpAU5HIdp4SoSSADK8DcUEwGZzeOneKk6uyOfTcYsNNuvemERN9sQqah1w1MHj7w85zpmzUyc8mVd1lkQXvZ8Pqwk9tvYAsGIYX7XElGV1fSNG3qw8ErBFaDvZNbC2OFYwr5aomqaZHrF803necbnwRSyQLlzDi12R54nhxF+kXsndv/62P+pqq5KDu5sNb0P8ai5pAqUYxeZkNn6o+XNoOFVQPCWKfaTNMersfwQd4hLezz6QeIn7eTuxCPyA7ZY26iFsxW9RSSwSj6zEF9809GIaQG8NKtyewJedYCloQ77ILo7Av+b0XpxtfsHEjnx9uVjs4H8qLEfnoaVwKy/MRUOedn8WbSLw7SZ7SIAxHCUELfwSa700P7LInO+LOVyz0sCjVcPygBoE6a7P1bPKPJrzRcTxJazgxN0727N8FWfwNr1Zt+ZmlVw57oVn3sHEwXUuwJk4xcWQdR+bbFDAsbW9K2m5FirshghOE06Xn2/ryaLaZUV6mP7LfCivsrLwxefXSk+RTpic0PCbAN/qyTfS72IyU7lSxpG5hw==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB2797.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6e6ace-0cc8-4e0a-24bc-08d886060f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 05:53:05.6383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOWED2ApdMQ1/UP5sxk/JWLvzVqLI7XN+trxVheRonhHJ8uYakBopn7USVLOY0W0e+t1UYi/27aTzWlO8gbf8t+k2RQhnvVon6yies6uizA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_005308_397525_D270815E 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>-----Original Message-----
>From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Zong Li
>Sent: 10 November 2020 12:58
>To: Paul Walmsley ( Sifive) <paul.walmsley@sifive.com>; palmer@dabbelt.com;
>sboyd@kernel.org; schwab@linux-m68k.org; aou@eecs.berkeley.edu;
>mturquette@baylibre.com; Yash Shah <yash.shah@openfive.com>; linux-
>kernel@vger.kernel.org; linux-clk@vger.kernel.org; linux-
>riscv@lists.infradead.org
>Cc: Palmer Dabbelt <palmerdabbelt@google.com>; Zong Li <zong.li@sifive.com>
>Subject: [PATCH v2 2/3] clk: sifive: Use common name for prci configuration
>
>Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
>patch is prepared for fu740 support.
>
>Signed-off-by: Zong Li <zong.li@sifive.com>
>Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>---
> arch/riscv/Kconfig.socs     | 2 +-
> drivers/clk/sifive/Kconfig  | 6 +++---
> drivers/clk/sifive/Makefile | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
