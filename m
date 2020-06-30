Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B96C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 18:57:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08CAC2067D
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 18:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrmuDcLI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Byi7QMEH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="hZkmUYha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08CAC2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dqh0Li8Yh7JAmfvRdIah14YFfQ3IHuh80MXzJB3GuFE=; b=mrmuDcLIIsYwXFYyTJ8yceDEF
	PDy3tXlkOmy9VPOos3TFoHQQVo/EcnmrUktOdlapQk8VPBRKOpHw5fX1tW4TFenEZbpRsjTJ4Y4xs
	PtVM7SH5XAdVMfMFhwDZdgKjG64apwgUxz0qJrhbj8kLyVTLe5muafyPSiZBAQ8tcpOxZnHY0CUa2
	3I3cIDXk+DZ1m7DD4PgZk00XQGB2iRJitT93JEVfpthieY5lg7agNXQ+n8sKXBl/+8Ug8wBkKdFS+
	cFCSAd+PywlBbiPM3pzBP/QUbDEpyGVAQ5BKK59Ca6wtnFVNxPPc2hal52GfZarw4gyQ63JuPEGUx
	pFxANX7kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqLRq-0006UO-3d; Tue, 30 Jun 2020 18:57:38 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqLRl-0006TK-V0
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 18:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593543458; x=1625079458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UQqLDv4gzdjhoC9cW3MrvrhcBmgBVt5mNAkYdNEYxzc=;
 b=Byi7QMEHBd5NpHGf9gY7G+pr/VpLbm952cP1CaOzj0fxB29Pjdox1S6u
 2Z3mALTp/WuOV9j1kq91Eu9L8y4RfXpAN1DsbExVyfkfUlE62oHSgvcBT
 yGyhR0V5ZVjXQzzZpLN0FYlaEnnAtF3clGIv6b9K/d14YEuslcLSvyJRN
 YWYr9+Qb/jBgUPfwjNqMbSeLN53zwIa5EdG1jUFMOyj60iwUaJPaAQOFq
 WJ8eiMFswdmEfE7tbEpumkHUU94oP6z2Y4oXr8lg6G23L0wBLy1Ucd641
 XMXE7+Gzma1hWkZrqYuFxXpLAqpsTOnTdHQzhNz2zflhqG9Yb3IaW+h3f Q==;
IronPort-SDR: ntTJUqAX2WXMLjX0X8aemFDZb7mII6idHeF55xSmlSFwc9uWflLCrGM1R0ULZ3KJm15Szj7F0J
 FyWunbywnshX+b0Vu3jtyinQQORQWblcaZhBbPrtRhPj/pdl/SApKFPNSvCTSzfW7ald9Hu2zm
 YyeE0zUkhMnL489k1sMkyRjxonCxtbkd/urqKCpuou0YvAyYYKIhn0KuV38TcNrdikUQvvg+UD
 JZRfSM8hbivZT7PNc9KWWsSUFIkaRKBLb2UaGz5T94tPpL05gfLBYwQj55axaHdH6Jb+9zCXJB
 HEU=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="244329535"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 02:57:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEHKSaWAHxOjsIGkYa/DtswwFwUr/uLH5wVnmalyLC9Q7NmuXq2urieXvkwj0NPZSnPsCYhk53HZjXyxhWWYnAh0PzMF8zXZOef2r0uy+UOfG81Kt+WI9nvfKytXAAZa9q+dRKCCIYAaf3xK0FJbDnkelM7sETtDdNpOGyDTePqOWGbGdZjCChZ55ZEWIxJ69M9rYR3gZ88rJZ9V2JgFWcGzIspPaKOQn5ku08qra9rFDSOTJghZ17bY4M3T/rJF9UpQh7/sDdFyiHMHN/R7wrZfmqP12OVNlKG9F0awm10NRblU+exp1C9Eh2wnt8e88QQJDk9nyI1RdEDXW77rgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQqLDv4gzdjhoC9cW3MrvrhcBmgBVt5mNAkYdNEYxzc=;
 b=NQKGyh3eJAiuA116m8PlG3IgAWOJ+TUeMH4DwchWCLLmbqqiaRcUYtspUVtcn9ksrLnBhNuGkSVz41t+WGD5iFFcZNa6ojoOTyh1F0Y8Kc6ITapLv9mHIl7gpoSC0DdAnyn5FqL7KUdTiRc2i0m5feiUNEVca1cPtZBI/Q5rz8+Hcb8+CLIzft3WaBA3SL6Nzpq4bfNP0fjQYErFQw6rW28ZNujBIAG2SoVzjA3LTNjRNP//kChXSVbA+rw7BETemAzRnOqnJx4ohF7+d7NLoFtU0hxgGPNTHhEw9RNx7Y9HWYx8Mqvh4zr26+OLEBopJMVmYAN8GXl5UTr4CXEF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQqLDv4gzdjhoC9cW3MrvrhcBmgBVt5mNAkYdNEYxzc=;
 b=hZkmUYhafJ/s8ZEznVZYg6hdXhYgAbebFMu8WEn1VJiU+ZV6xEnvdijYh3jqZziuVjcKGVA1jvJXP8PyvbUk6R+BFyw172ZYEj7sofkvGQ1F/iiL5aREtCJqjz7aiyPvycwGNCdpcfvxd6D2ZCpfZPVMMF2fUIimxYA48SH7zQY=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB6070.namprd04.prod.outlook.com (2603:10b6:a03:e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 18:57:27 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::b40d:aedb:d8a6:1df5]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::b40d:aedb:d8a6:1df5%3]) with mapi id 15.20.3153.020; Tue, 30 Jun 2020
 18:57:27 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "anup@brainfault.org" <anup@brainfault.org>, "zong.li@sifive.com"
 <zong.li@sifive.com>
Subject: Re: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
Thread-Topic: [RFC PATCH 0/6] Support raw event and DT for perf on RISC-V
Thread-Index: AQHWTcQrDhAt/nTrUUChEJ2QMNtVgajvBsWAgAAQlICAACt8gIAAShcAgAAIgICAASDFAIAAEZaAgAAG4ICAACWBgIAAFjGAgAB6tQA=
Date: Tue, 30 Jun 2020 18:57:27 +0000
Message-ID: <358970eb7c126c77307cf1064963119935587607.camel@wdc.com>
References: <cover.1593397455.git.zong.li@sifive.com>
 <CAAhSdy1uFt3rqf8cSHqS=W90AoeQjo10R_Ak4Cknb_QUvH1SPQ@mail.gmail.com>
 <CANXhq0p_HoD6npHmoxxYHohBsgihfe5S-0DG04xLpQ3VO1w7oQ@mail.gmail.com>
 <CAAhSdy0Ed8zQ5LVZva6p2TWqTOzrDRtL0JJkAdmpzWFhzJLUfg@mail.gmail.com>
 <CANXhq0o9BMe6G6kv-zO7OvLTfKsz-4XKsoZJe3nxvX9_6uunvw@mail.gmail.com>
 <CAAhSdy1fEge0AbKH6B72SwVHM-heN0QJPO0rQuCK5QhXq3uA0g@mail.gmail.com>
 <CANXhq0ojMx2c+OJ56YWiQG-6iHa0XvU=4qzdOvKL2_iUzwF20A@mail.gmail.com>
 <CAAhSdy1jC-hfWdSxVsaZ0Ri5AjgEQAV3YHMixqH9GW_a+VAg5w@mail.gmail.com>
 <CANXhq0rfQs_Q0q4sza0HaQOzrQoQosW4B0OduJ6T9ttMTWGZNA@mail.gmail.com>
 <CAAhSdy2D+r1oKegYJrH43akVAPJL8pvYymdSP+0x_Hk-XbtNHw@mail.gmail.com>
 <CAAhSdy02TpyfzTGWzdqFiyeQNTj-RLk61VJNy5pYVYukqvfvrg@mail.gmail.com>
In-Reply-To: <CAAhSdy02TpyfzTGWzdqFiyeQNTj-RLk61VJNy5pYVYukqvfvrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: brainfault.org; dkim=none (message not signed)
 header.d=none;brainfault.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66c31b31-423b-4387-ece9-08d81d276eca
x-ms-traffictypediagnostic: BYAPR04MB6070:
x-microsoft-antispam-prvs: <BYAPR04MB607090CE2090878970341132FA6F0@BYAPR04MB6070.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9smTHNcxzZPIH2QBYRM2Bn2jSXI3qiZ9m+Dc7WV9bsRxkaO7cWUu4u1wwfY3AQ3zapN6GfhYmXdoBO2SGwyQWaGx4OTd9djznFahr9jwrTIiaD5p+AAf6UHnUnWTBAUTbEJVtdJuixh7osMjeswA2KO2l24aXC1Nm/MQFRLvaAzLq+AfBhWqHia/mUVYM3Uor/Fu/rkDXxBWmxPPVWkTe64Eg+LU7sKeeVlYSLDii3+oqL6+F7PuZ/3vBhgjuId094LW7VLolPEpuBUQ1WWLg3GxUmKg0RJT5m3Cm2IiQdodBX+sQScFrhBhY2j1cGJSCNCM7lLCTnQErQTL+nm5dTbtAB1Xo4zCvMbTH82tMOU13KnWL6hreKu5SjgwxQPRcAjuy6h8xwgasVAIUl52w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(71200400001)(36756003)(6486002)(110136005)(316002)(30864003)(8676002)(83380400001)(54906003)(86362001)(8936002)(4326008)(966005)(2906002)(478600001)(6506007)(53546011)(2616005)(186003)(26005)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006)(6512007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rtfmihAAndfnHrncCxN670SFMWTwuOtwiSs17b4k/zorTs9yhgAt9IlMi8M+FLg1D0dtgIfa9BUaBPOEfS090fwVtiDX1wVy3oJbnQ7l9PjT10eDnVE3o23cTqrG9fSzGDmoKkJ8/b3FgNUA+rP+J9LAHmnSuK507eop0d8rRRvxwTPw4J9AqhcswS1HO1h/uxzt8Pmmbzkuaud/uPJpXmGOmMrvZi6hgl1jEMW2oJxG83VDQRktSrKoGvYXydkq9CgYo1BfTD+i3R5xqDTGWWmWSLttwIS9sRX7/vOpdggYX4pfenDwrJzv8RuxgOeCdiNrN+wfuPe19ALuLrGnyOuKjOtn+sBel0cyd9uq04F+xpxFK0HK3Uc0/KSoCkbDB5fk/IL1V3TzYPewfsjCAqoH8N+DiNXXaij19Pa+OMADrr+LnGjKN63Y7dzTjBjHf6QgMKE3QykujRpXiKuvjhhDc3/jjMYD2ARkOQOQHGIAkpBTUH5mifSJhB8jg9F1
x-ms-exchange-transport-forked: True
Content-ID: <B5A55C01AF3E7945B5099649A7908CE6@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c31b31-423b-4387-ece9-08d81d276eca
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 18:57:27.0507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xtK0PF+iZGwDMn5epL9jBAoNiMejWinqB8GYHNmSAPx/dBK3dzpVCgAo/XcuxIivfh3TT3EwKZ2zKJJYPXlByg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_145734_374999_471E2C9B 
X-CRM114-Status: GOOD (  40.88  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-30 at 17:08 +0530, Anup Patel wrote:
> On Tue, Jun 30, 2020 at 3:48 PM Anup Patel <anup@brainfault.org>
> wrote:
> > On Tue, Jun 30, 2020 at 1:34 PM Zong Li <zong.li@sifive.com> wrote:
> > > On Tue, Jun 30, 2020 at 3:40 PM Anup Patel <anup@brainfault.org>
> > > wrote:
> > > > On Tue, Jun 30, 2020 at 12:07 PM Zong Li <zong.li@sifive.com>
> > > > wrote:
> > > > > On Mon, Jun 29, 2020 at 9:23 PM Anup Patel <
> > > > > anup@brainfault.org> wrote:
> > > > > > On Mon, Jun 29, 2020 at 6:23 PM Zong Li <zong.li@sifive.com
> > > > > > > wrote:
> > > > > > > On Mon, Jun 29, 2020 at 4:28 PM Anup Patel <
> > > > > > > anup@brainfault.org> wrote:
> > > > > > > > On Mon, Jun 29, 2020 at 11:22 AM Zong Li <
> > > > > > > > zong.li@sifive.com> wrote:
> > > > > > > > > On Mon, Jun 29, 2020 at 12:53 PM Anup Patel <
> > > > > > > > > anup@brainfault.org> wrote:
> > > > > > > > > > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <
> > > > > > > > > > zong.li@sifive.com> wrote:
> > > > > > > > > > > This patch set adds raw event support on RISC-V.
> > > > > > > > > > > In addition, we
> > > > > > > > > > > introduce the DT mechanism to make our perf more
> > > > > > > > > > > generic and common.
> > > > > > > > > > > 
> > > > > > > > > > > Currently, we set the hardware events by writing
> > > > > > > > > > > the mhpmeventN CSRs, it
> > > > > > > > > > > would raise an illegal instruction exception and
> > > > > > > > > > > trap into m-mode to
> > > > > > > > > > > emulate event selector CSRs access. It doesn't
> > > > > > > > > > > make sense because we
> > > > > > > > > > > shouldn't write the m-mode CSRs in s-mode.
> > > > > > > > > > > Ideally, we should set event
> > > > > > > > > > > selector through standard SBI call or the shadow
> > > > > > > > > > > CSRs of s-mode. We have
> > > > > > > > > > > prepared a proposal of a new SBI extension,
> > > > > > > > > > > called "PMU SBI extension",
> > > > > > > > > > > but we also discussing the feasibility of
> > > > > > > > > > > accessing these PMU CSRs on
> > > > > > > > > > > s-mode at the same time, such as delegation
> > > > > > > > > > > mechanism, so I was
> > > > > > > > > > > wondering if we could use SBI calls first and
> > > > > > > > > > > make the PMU SBI extension
> > > > > > > > > > > as legacy when s-mode access mechanism is
> > > > > > > > > > > accepted by Foundation? or
> > > > > > > > > > > keep the current situation to see what would
> > > > > > > > > > > happen in the future.
> > > > > > > > > > > 
> > > > > > > > > > > This patch set also introduces the DT mechanism,
> > > > > > > > > > > we don't want to add too
> > > > > > > > > > > much platform-dependency code in perf like other
> > > > > > > > > > > architectures, so we
> > > > > > > > > > > put the mapping of generic hardware events to DT,
> > > > > > > > > > > then we can easy to
> > > > > > > > > > > transfer generic hardware events to vendor's own
> > > > > > > > > > > hardware events without
> > > > > > > > > > > any platfrom-dependency stuff in our perf.
> > > > > > > > > > 
> > > > > > > > > > Please re-write this series to have RISC-V PMU
> > > > > > > > > > driver as a regular
> > > > > > > > > > platform driver as drivers/perf/riscv_pmu.c.
> > > > > > > > > > 
> > > > > > > > > > The PMU related sources will have to be removed
> > > > > > > > > > from arch/riscv.
> > > > > > > > > > 
> > > > > > > > > > Based on implementation of final
> > > > > > > > > > drivers/perf/riscv_pmu.c we will
> > > > > > > > > > come-up with drivers/perf/riscv_sbi_pmu.c driver
> > > > > > > > > > for SBI perf counters.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > There are some different ways to implement perf, and
> > > > > > > > > current
> > > > > > > > > implementation seems to be consensus when perf was
> > > > > > > > > introduced at the
> > > > > > > > > beginning [0][1]. I don't persist to which one, I
> > > > > > > > > could change the
> > > > > > > > > implementation as you mentioned if it is a new
> > > > > > > > > consensus one.
> > > > > > > > > 
> > > > > > > > > [0] 
> > > > > > > > > https://github.com/riscv/riscv-linux/pull/124#issuecomment-367563910
> > > > > > > > 
> > > > > > > > I would not recommend taking the original RISC-V linux
> > > > > > > > fork as reference.
> > > > > > > > 
> > > > > > > > Rather we should study how things are done on other
> > > > > > > > architectures.
> > > > > > > > 
> > > > > > > > I really appreciate the attempt to make RISC-V PMU
> > > > > > > > driver depend on DT
> > > > > > > > but if we are going this route then we should maximize
> > > > > > > > the use of Linux
> > > > > > > > platform driver framework. In fact, whenever possible
> > > > > > > > we should integrate
> > > > > > > > RISC-V features as platform drivers under the drivers/
> > > > > > > > directory.
> > > > > > > > 
> > > > > > > 
> > > > > > > OK, I would change the implementation to platform driver
> > > > > > > if there is no
> > > > > > > other voice.
> > > > > > > 
> > > > > > > > I thought about SBI PMU counters as well. In future, we
> > > > > > > > can easily
> > > > > > > > expose SBI PMU counters as RAW events in the same RISC-
> > > > > > > > V PMU
> > > > > > > > driver. The sbi_probe_extension() can be used in RISC-V 
> > > > > > > > PMU driver
> > > > > > > > to check for SBI PMU counters so no special provisions
> > > > > > > > needed in DT
> > > > > > > > for SBI PMU counters.
> > > > > > > > 
> > > > > > > 
> > > > > > > I thought about probing raw events by SBI extension too,
> > > > > > > I'm interested if you
> > > > > > > have more detail about this.
> > > > > > > 
> > > > > > > It seems to me that it is a little bit hard to return all
> > > > > > > events
> > > > > > > through one SBI call,
> > > > > > > so I thought we could map the generic hardware events and
> > > > > > > maintain their own
> > > > > > > raw events by each platform in OpenSBI. But eventually, I
> > > > > > > thought the
> > > > > > > DT mechanism
> > > > > > > is more clear and easy than that. Let me know if you have
> > > > > > > any ideas about
> > > > > > > probe function. Thanks.
> > > > > > 
> > > > > > We can design SBI calls such that no SBI call is required
> > > > > > to read
> > > > > > the perf counter.
> > > > > > 
> > > > > > The sbi_probe_extension() will only be used to check
> > > > > > whether
> > > > > > underlying SBI implementation supports SBI PMU extension.
> > > > > > 
> > > > > > As-per my initial thoughts, we can potentially have the
> > > > > > following SBI calls:
> > > > > > 
> > > > > > 1. SBI_PMU_NUM_COUNTERS
> > > > > >     This call will return the number of SBI PMU counters
> > > > > > 2. SBI_PMU_COUNTER_DESCRIBE
> > > > > >    This call takes two parameters: 1) physical address 2)
> > > > > > counter index
> > > > > >     It will write the description of SBI PMU counter at
> > > > > > specified
> > > > > > physical address.
> > > > > >     The details of the SBI PMU counter will include name,
> > > > > > type, etc
> > > > > 
> > > > > The main things are that we need to pass the information of
> > > > > raw events
> > > > > and the information of mapping of generic hardware events.
> > > > > Maybe
> > > > > this information could be passed by this SBI call.
> > > > > 
> > > > > > 3. SBI_PMU_COUNTER_START
> > > > > >     This call takes two parameters: 1) physical address 2)
> > > > > > counter index
> > > > > >     It will inform SBI implementation to start counting
> > > > > > specified counter on the
> > > > > >     calling HART. The counter value will be written to the
> > > > > > specified physical
> > > > > >     address whenever it changes.
> > > > > 
> > > > > I would prefer to read the counter directly on s-mode. Spec
> > > > > already defines the
> > > > > mechanism to allow that. But this way would still work if we
> > > > > couldn't
> > > > > read counters
> > > > > on s-mode.
> > > > 
> > > > The SBI PMU counters have nothing to do with RISC-V PMU
> > > > counters because
> > > > these are counters provided by SBI implementation.
> > > > 
> > > > All-in-all, we have three types of counters:
> > > > 1. PMU counters defined by RISC-V privilege spec. These are
> > > > TIME,
> > > > INSRET, and CYCLE CSRs.
> > > > 2. Implementation specific counters accessed via HPMCOUNTER
> > > > CSRs.
> > > > 3. SBI PMU counters for traps taken and processed by M-mode
> > > > runtime
> > > > firmware. Examples: number of misaligned load/store, number of
> > > > illegal
> > > > instructions, number of SBI RFENCE calls, number of SBI IPI
> > > > calls, etc.
> > > > 
> > > > The DT based RISC-V PMU platform driver being discussed in this
> > > > email
> > > > thread only addresses points 1) and 2) above.
> > > > 
> > > 
> > > OK, sounds good, I misunderstood your ideas, I mixed the 2) and
> > > 3)
> > > and see them as the same thing. Many thanks for the clear
> > > explanation.
> > 
> > Cool, we are on the same page till here.
> > 
> > > > For point 3) above, we need to first define SBI PMU extension.
> > > > Once SBI
> > > > PMU extension is defined, we can have separate SBI PMU driver
> > > > in Linux
> > > > or extend RISC-V PMU driver to register additonal counters
> > > > based on
> > > > SBI PMU extension.
> > > > 
> > > > I never suggested  to access RISC-V HPMCOUNTER CSRs via SBI
> > > > calls
> > > > so DT based RISC-V PMU platform driver (for 1) and 2) above) is
> > > > good
> > > > to have. The SBI PMU extension is a separate topic.
> > > > 
> > > > > > 4. SBI_PMU_COUNTER_STOP
> > > > > >     This call takes one parameter: 1) counter index
> > > > > >     It will inform SBI implementation to stop counting
> > > > > > specified counters on
> > > > > >     the calling HART.
> > > > > > 
> > > > > > The above calls are generic enough to support any number of
> > > > > > counters
> > > > > > and we don't need any SBI call to read the counter. We can
> > > > > > also assume
> > > > > > all counters to be of fixed 64bit width. In fact, even
> > > > > > Hypervisors can support
> > > > > > it's own SBI PMU counters with SBI PMU extension.
> > > > > > 
> > > > > > We still need to think more about the above calls because
> > > > > > above SBI
> > > > > > calls are just initial ideas.
> > > > > > 
> > > > > 
> > > > > We also need a SBI call to set the event selector to specify
> > > > > which event
> > > > > is monitored.
> > > > 
> > > > SBI_PMU_COUNTER_START will do that.
> > > 
> > > I'm not sure whether this SBI call is only for SBI PMU counter
> > > and
> > > it's own events.
> > > For 2), it needs one SBI call to set the events, we just set the
> > > event selector
> > > by writing m-mode CSRs on s-mode now. If this SBI call could
> > > serve 2)
> > > and 3) both,
> > > we don't need another SBI call.
> > 
> > Can you elaborate more ??
> > 
> > Is the SBI call for 2) needed to enable/disable counters in
> > MCOUNTEREN CSR ?
> > 
> > Currently, OpenSBI enables all counters by default but I see the
> > need
> > to enable/disable HPMCOUNTER on-demand from perf event start/stop.
> > 
> > I hope we don't need any other implementation specific CSR to be
> > programmed
> > for enabling/disabling counters on SiFive Unleashed ??
> > 
> 
> Here's the next version of SBI PMU extension, which tries to address
> both
> 2) and 3). In other words, it covers all HPMCOUNTER CSRs and software
> counters of SBI implementation.
> 
> To define SBI PMU extension, we first define counter_idx which is a
> unique
> number assigned to a counter:
> 1. counter_idx = 0 to 2 are for CYCLE, TIME, and INSTRET
> 2. counter_idx = 3 to 31 are for HPMCOUNTER
> 3. counter_idx = 32 or higher are for software counters counters
> provided by SBI implementation
> 

The number of HPMCOUNTER may increase in future. Right ?

How about using a higher starting idx for software counters from SBI
impolementation ?

> The counter_idx == 1 (i.e. TIME CSR) is always enabled when
> underlying
> HW implements it. Otherwise it is always disabled.
> 
> Based on above definition of counter_idx definition, we can
> potentially have
> the following SBI calls:
> 
> 1. SBI_PMU_NUM_HPMCOUNTER
>     This call will return the number of HPMCOUNTER CSRs
> 2. SBI_PMU_NUM_SOFTWARE
>     This call will return the number of software counters provided by
>     SBI implementation
> 3. SBI_PMU_COUNTER_DESCRIBE
>     This call takes two parameters: 1) counter_idx 2) physical
> address
>     It will write the description of SBI PMU counter at specified
> physical address.
>     The details of the SBI PMU counter will include name, type,
> width,
> events etc
> 4. SBI_PMU_COUNTER_SET_PHYS_ADDR
>     This call takes two parameters: 1) counter_idx 2) physical
> address
>     It will set the physical address where SBI implementation will
> write
>     the software counter. This SBI call is only for software counters
> (i.e.
>     counter_idx >= 32) so it will fail for other counters.
> 5. SBI_PMU_COUNTER_SELECT_EVENT
>     This call takes two parameters: 1) counter_idx 2) event number
>     It will select a particular HW event to monitor in a HPMCOUNTER
> CSR.
>     This SBI call is only for HPMCOUNTER CSRs (i.e 3 <= counter_idx
> <= 31)
> 6. SBI_PMU_COUNTER_START
>    This call takes one parameter: 1) counter_idx
>    It will inform SBI implementation to start/enable specified
> counter on the
>    calling HART. This SBI call will fail for counter_idx == 1 and
> counters
>    which are not present.
> 7. SBI_PMU_COUNTER_STOP
>     This call takes one parameter: 1) counter_idx
>     It will inform SBI implementation to stop/disable specified
> counters on
>     the calling HART. This SBI call will fail for counter_idx == 1
> and counters
>     which are not present.
> 
> The above described SBI calls can be conveniently implemented in
> M-mode runtime firmware (OpenSBI) and various hypervisors (Xvisor,
> KVM, etc).
> 
> We can have a single RISC-V PMU driver using above SBI calls which
> can be used natively in HS-mode and Guest/VM in VS-mode. Of course,
> we won't need any information to be passed in DT/ACPI for this driver
> and it can be under arch/riscv/kernel because without DT/ACPI it
> can't
> be a platform driver. 

We still need the information in DT for mapping generic hardware
events. No ?


> The availability of SBI PMU extension can be checked
> using sbi_probe_extension() SBI call.
> 
> Regards,
> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Regards,
Atish
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
