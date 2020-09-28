Return-Path: <SRS0=7Vio=DF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB26CC2D0A8
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 17:25:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD4421548
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 17:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RgybtFVL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dcK7+BRb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="EzF1QBAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD4421548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=at4lVyg5v9hz4RSUVVxuloOD/C+Z5SbHYkgOBwYY6sU=; b=RgybtFVLSgSTKCTB2YV8KoEPY
	kIflBmvNbAwQfnEoxNayjl2+Hs0YWrTlZdgEmxk+JkJc/PfqqbZcgGotk2AWPczzRZ0Qi6q76g7OX
	KXe1I7yPCi3UfqM4M/b3S6U9qde0WMIL7mNEF1ibqv7iherZ/kCSIaridkztfinO72jFZN/PfZSGm
	hGmmVyZDCvuH/Ri2w+L28hECWL5rZPLXR01sRr+AbnEJit0m73jZvlF7ebbfxUVrrqmAFKe+s+A0p
	/y9WKkpgehOoTAIKFWj9jqCh6L33kfN7e/m6WnQ3J1sTSLw92Gb2ZqkhoT4GddH82x7FCSv/vySbM
	IcWlCAK5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMwuG-0006ue-S9; Mon, 28 Sep 2020 17:25:45 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMwuD-0006th-Ub
 for linux-riscv@lists.infradead.org; Mon, 28 Sep 2020 17:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601313942; x=1632849942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5iomrdu/SHS8JnOrFTM7ITiD6KVLfl0QY1on4lhYwYg=;
 b=dcK7+BRbjo3a4TaTNn1B5EtSNHpzVXdch2mNibfuk9k6t0WovJrbUfjy
 SlwWhIL+QKUxLAq4Zkl+zb2VwA8aDOomnkNai5GOHIpMQIvAFzVoPu517
 53DgTsKFf84YNnCfDJ9mOPjdr4kql8gHmfajrMb2BbElFikvNIcSwzUii
 OeosQ5rIOu5StHFu16TC4VqG61VqhwIWcq3zd0p2mo4px4P+tGkjZsLho
 8ge9Ys4g1tVUM4dmoMNDLspoYJyaxWo6zCkvnRRfjoP28sfse96/IqF8r
 mhvHaN5+xtGHg2oLsLHW5fXEVjHaDLbT1AyZ9BwIP+amWWgscJm1UR81Z A==;
IronPort-SDR: 5CjHKrJ24A6Dynzpi+BXTUV9hBhRy+39NLD/3hdWW3wFEOoQZT21TnXb4FfJu0gSM39QdRzYmc
 eVQgotBuRC69J70u8YK4gaN2cYrmHN3XFtRXLMvnwJOXMK9ONwM8tZwmc/mTDkBtbZY4rPgB0M
 i3V4qxs9watCx05z02/Za/nyiyZF6wQiya81dxoK57UTEqsNthfTmfCjCt+/onRiwihZz/rV4Z
 jcLlQIPPfAxPPmO3l6d+cxC1OOv77FjPuzDJOCmssntavCMVquDGsmWDU76mulDMQ3bt42SaHV
 uw0=
X-IronPort-AV: E=Sophos;i="5.77,313,1596470400"; d="scan'208";a="152829539"
Received: from mail-bn8nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hgst.iphmx.com with ESMTP; 29 Sep 2020 01:25:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfUuqBbD7QD8Al+3GPDpqgHgaGMCK8ywsiqZ8uuqdHfK+EIN0+u8XK7eJj9gD6ZZHNHhzCXK0iWTMYG8MakMmt6GD0S6hGd5SlQs3ePD3nm8mwdwccQuGlo2OmlIzOlRdqMYsPaoPzUUmyQKZ7cIun0Lap1L1q8S1+hcREnw6cDcXqcVjpOSwa7tZIygu6JRfE+859pTper4tP4ghMR+RFI6x16aRh0jillvEiXLiFKGO2Yidwd+PUDWZZpABruI0dQwOQ9df3C555fVEhcVFTFp1xERahTyvRBl83Ur7CwWd2ufAJAeqejVh+5YaSJZTD8U80fyccEDa1cp82mPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iomrdu/SHS8JnOrFTM7ITiD6KVLfl0QY1on4lhYwYg=;
 b=aNpXVGBWU2mfcqp0juFUluIpaYs9YqneK98ErIM7lF9rnl2NO0ukEDvABWtjUwMam6hWVwCuhft9Kc3K7/aUW8fL9nFqXR3j+qQ0JjIqfh20uLeBMDf5+sWyPSuLlaYOeKX9tC/8zbvmOgVSCb2AZ6cNh8VmZZslvxnKdHt7BdorF+iUbh+Gt3zz6T2rAzmXKKzEV1ac6ldXRmeOuzIpXvjMp1h1fNOtSbdtzg0A/ZBkFR97wrkOKxh0BCjO52mV0pDPS2dpSQUIhCdAhsHYXc4cASjCpErPBU5SYUlUYu9+hgl10J01DHwvK1F1DTSaYYC1NOXhSFuAIlAccZfhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iomrdu/SHS8JnOrFTM7ITiD6KVLfl0QY1on4lhYwYg=;
 b=EzF1QBAFjlbO0hfNxAX/gobROeD92EVyDigSRDzAU36r+PcsKuzBTOnKpG5rD9Ex0vlPbqqSWqt7vMMcW3HihVOymR8MleU1GJR02mJrzgSRS28l5SkdeUYSfWPLiYWoiJq/ZYlyMYgsAHQHYm/tykrRWDlmEP5+M84qUdpe+JI=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB4088.namprd04.prod.outlook.com (2603:10b6:a02:af::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 17:25:36 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::f122:ad41:aebe:6785]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::f122:ad41:aebe:6785%3]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 17:25:36 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "rostedt@goodmis.org" <rostedt@goodmis.org>
Subject: Re: [Bug 209317] ftrace kernel self test failure on RISC-V on 5.8,
 regression from 5.4.0
Thread-Topic: [Bug 209317] ftrace kernel self test failure on RISC-V on 5.8,
 regression from 5.4.0
Thread-Index: AQHWlaoBURfAeTX8ZECfjN5JwK97B6l+TWuA
Date: Mon, 28 Sep 2020 17:25:36 +0000
Message-ID: <67278555f143564677878cc849155393a93c018a.camel@wdc.com>
References: <bug-209317-8243@https.bugzilla.kernel.org/>
 <bug-209317-8243-E6Z0ICootN@https.bugzilla.kernel.org/>
 <20200928111341.7eaa98a8@oasis.local.home>
In-Reply-To: <20200928111341.7eaa98a8@oasis.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 
authentication-results: goodmis.org; dkim=none (message not signed)
 header.d=none;goodmis.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [98.248.240.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10b10069-1729-4490-d83c-08d863d38354
x-ms-traffictypediagnostic: BYAPR04MB4088:
x-microsoft-antispam-prvs: <BYAPR04MB4088A75D63D4A084FCFB8BF3FA350@BYAPR04MB4088.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWD4lxiUZf0AqK08ZnwX180vZjmb5S1eEYWDiAWTewjRfYY21BDs+Gc9G6TZy+mq8+xL5yp3/SiQkFx4M9N4pGhLaFwnVpw5Ee8+O3gEqjpY8riyF/FsR1Mg5UKyOk6dytLlHEZlqE6p2yY/wduXBKIaYkyR3ZdfYBbK707sv2QVHBqTfnYhb7ZWpzNqBzn8MOplTrkh5XL8XA+0uBQ2gOl4MeIDSt37T+sDKpxOd3KSX2K6wcVw1/8KYzrDjQkhLa9Szu41G2PrGMIKpC0HFFQSOYtU7caYaDOKGJ8t+a46ieWetiyaAAhxDOT+giC9cw2US0A0p05arkEj3bD0bB5JlzJyM0lARot0FqWN22MiHsiE5SShaGm9TPIGebqGqrZW405EVBBXrj0dWIspcL/8kG+onG3si+LrDLSayHlXJrjrSNR8riC1lqWl6b7Qp+vrh/f7hVg/3VC7UJbxJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(6486002)(478600001)(2906002)(8936002)(6506007)(6916009)(66946007)(36756003)(76116006)(8676002)(66476007)(86362001)(66556008)(66446008)(64756008)(83380400001)(966005)(186003)(5660300002)(2616005)(26005)(4326008)(54906003)(6512007)(4744005)(316002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7jfuKH1emkWsM84tdAyp/WYoc4WJFqKXpiMDm/9BnQXvL0zc3HCfWIA0XUluk7WJuqWghAZHKwloSzXGvn421/WzWYtiiuZA6hYRBhnXGtuWvXUJnrOZQaURZDW8bUbBBtRnHGUE+9xE8hI7q+ZyonzxiWEm9Kvp32jWKTrGQYCQzcNsHt0qpBNE+wvWESLc7KPhJ6NUaQrbcImX1q1y3EzCyVXPIYQIxvvp7yyHUYw8f4/mz+rKOHUq23AgUUBe2PIYXN+R3KdM6VVJHwy8dOb39CV5DfejqRzGGSDDJnqPKNy4OTsyGZkW3xyG5u2JFF117BkOoCRJp5iUrWEvj9OYr4/a8tzY8hQN15dqz3VDVP+rQRl1Dged2KLivUFGAYJRkdjCghhJ/hkqQm37uKXx1H1DNnSF+zc9Wg+t4d9ZguDecTHlki2xaAJ7K4NtkJsh4+1QJ3JO3jU+i91ElxrXfPbTkrwWhQbCbMXMYCRPvp4dCTSgCwdCRR7ZOkiJHmR9jZIJ3l90UF3TfffInm9nfNkOwHuzJVsyyC+2+uXVG1zl8rv7ezfHDk4Gkh2NJk4Od7yEcMkBrpi9WZS5xSQczMq9r6/mYtkB8wJTiWlUw/ohWXEwog4ZIiEFISlnTAgPbZLQDmhWKB71nsBxzg==
x-ms-exchange-transport-forked: True
Content-ID: <19764D9744CBCF499EF422C1354464FC@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b10069-1729-4490-d83c-08d863d38354
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 17:25:36.4375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swvzNbPwmXcVCZI1bZYsRJ6EgCR3Ls+v1upa+FCNeDnr+ZypucLeBE7xa4Z8Bd9FJdSDiwZjlQ5i9EjNyVI1wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_132542_265503_5B5E5CC8 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "bugzilla-daemon@bugzilla.kernel.org"
 <bugzilla-daemon@bugzilla.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-28 at 11:13 -0400, Steven Rostedt wrote:
> On Sat, 26 Sep 2020 22:02:35 +0000
> bugzilla-daemon@bugzilla.kernel.org wrote:
> 
> > https://bugzilla.kernel.org/show_bug.cgi?id=209317
> > 
> > --- Comment #4 from Colin Ian King (colin.king@canonical.com) ---
> > Issue still in 5.9-rc6
> > 
> 
> Atish,
> 
> As the issues bisects down to your commit, care to take a look at
> this.
> (And take ownership of this bug)
> 

Yes. I am already looking into this. Colin informed me about the bug
over the weekend.

I couldn't change the ownership as I am not part of the editbugs group.
I have sent an email to helpdesk@kernel.org for access.

> -- Steve

-- 
Regards,
Atish
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
