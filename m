Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63265C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:20:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D5821874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxKPIBZ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wavesemi.onmicrosoft.com header.i=@wavesemi.onmicrosoft.com header.b="FQqXu9rV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32D5821874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0L35dusEn5e1O2btS9QqgLYUjm7Env8jGuJSTxZyw4=; b=oxKPIBZ1whUPmD
	cQcecsh0tZKrEDhg4imW2q6Af6L4tWOYJTPeejcW3Kj42eK3GlbZywmGASTl9Jm09fWTIHP5WSy8C
	dm2YmnRZ6E/o3V0qR779dR5ysLcEwa7wR5Q8YV0A7zvvoK1Hd7CfPcc2MDZojbLh0nk9VDp8aQopk
	N2bCKZvpyvE6iDqpyIaGUq8KN/yuS2it+/HuPOHgJLeUdsc6gC6fQT9l9Myj1q7MXlPa84KggqShv
	wjRoUKLcDg3Q+TDvfu01sIhoA0DJoQn8/ddJE7A0Wz+8sRbYwGBVbcn8+Y3w7VE3yGjVr65aDxPwa
	qFTxhLwlhpzlm9uwrEmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtI46-00081I-JP; Mon, 11 Feb 2019 20:20:30 +0000
Received: from mail-eopbgr710117.outbound.protection.outlook.com
 ([40.107.71.117] helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtI43-00080x-Ta
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 20:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLwz75eUbe46z6q2AgO9M63MBNArNWvvv/fBwlHuLSM=;
 b=FQqXu9rV+AQp96OvNXkHMhGcIX/jwAZHlMIM57i3UDeT1du0jsXqHRu+iu7c8ggZGAnahaLYQYWyF4ftFG2JJjEPYIjs2GjkA8+BQt4O0HYUNYAWFLywra5V7i+fWnqQU4ZnAnA19CxKagW9GxOOE4ce1HtMSv64/WrbqwwypMk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1424.namprd22.prod.outlook.com (10.172.63.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Mon, 11 Feb 2019 20:20:24 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::7d5e:f3b0:4a5:4636]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::7d5e:f3b0:4a5:4636%9]) with mapi id 15.20.1601.023; Mon, 11 Feb 2019
 20:20:24 +0000
From: Paul Burton <paul.burton@mips.com>
To: Jonas Gorski <jonas.gorski@gmail.com>, Michael Clark
 <michaeljclark@mac.com>
Subject: Re: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short
 values
Thread-Topic: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short
 values
Thread-Index: AQHUwcO4vpEKEcxAykiWUulx6meNb6XaiXkAgACBboA=
Date: Mon, 11 Feb 2019 20:20:24 +0000
Message-ID: <20190211202023.rch4duvcctyspvxe@pburton-laptop>
References: <20190211043829.30096-1-michaeljclark@mac.com>
 <20190211043829.30096-4-michaeljclark@mac.com>
 <CAOiHx==dx10No8AO-5OP8BcuNbfnQdgVG2TiMkjz=Svqd0uKDg@mail.gmail.com>
In-Reply-To: <CAOiHx==dx10No8AO-5OP8BcuNbfnQdgVG2TiMkjz=Svqd0uKDg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [67.207.99.198]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR2201MB1424;
 6:UYYp2p4KkISdOPK+E75tPi8Vp/btGoP3HloP3dRT00fjJbKEczCRFV0hNFmfpLg5BlPw/RqFk2p+KFYgbe2Cn0bgnXTTbP+1RZIrZfzp7CTXHDIsU+TK4HjpOdrN7moVrzmAO7WVuYEmUj2N3dUzyEVKl2hKKxW47FZ9hfQXx2Sb0lbTFp8r78ueLACZwUqoWaUvQJ0SEWqvTnzzk/CRevzluigmgfVhLsZzNimT4cHJXSPrAulj3NmRqeyAfQzgTx2ovcIavzCIhRAoHG5AelSBTZzynP5alx9ih4pQNREpR5Dk01MlT3rp5+pSkoMW3EgEhh+ngwLW4Yfc/1UdQI8AHKJ69SQJ23C+b7/XM0hDM82UOclDvB8J/JguxvKBFSH8ZVDQvyRNoJz9e6glAyjYqPUlqis2FrX3DTLif19eg/poCmSPWFystagbW/3f+wVYKVYDnJ38FZAVlFpAfw==;
 5:4XW6SSLUHZ6tQnywDMuXL6v8XW32mZbIeqJFQwYNJIxFNsTG32HZFbWxyfRb9XSsDvQva3kPq1pjuSg2udGF9lZRddinSdkcho5bT6ys4zBJ9DFWUh68lukt410dV6TWuO/VF46z8ZIw5leotwee/hj20hXfyjQzs35SUldUpg7bmh2vYh9Yqr8VKZ8YbHgxr5cGZstiYOOfjIbWwCUZng==;
 7:RZ0Oi8RbOsZcX1E/TadltpRSQdduOHE686Hfznuqv5AkeGqL3+UAxabeRSUOUHZTVbms+J8j0rrtAkUyuwxyVtJnJBfVYLzwxNarTkEpLqMPCTTd4Pp3odL/FcotTKT7yYvpoItWpPdbdkoPf+GP8g==
x-ms-office365-filtering-correlation-id: 45bc525f-6e7b-4eb5-2cbc-08d6905e5aad
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR2201MB1424; 
x-ms-traffictypediagnostic: MWHPR2201MB1424:
x-microsoft-antispam-prvs: <MWHPR2201MB1424CC8F4D3C435AA6E48703C1640@MWHPR2201MB1424.namprd22.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(366004)(39840400004)(376002)(346002)(396003)(136003)(189003)(199004)(8676002)(44832011)(71200400001)(81166006)(6486002)(33896004)(33716001)(4326008)(316002)(8936002)(186003)(52116002)(486006)(81156014)(229853002)(478600001)(68736007)(446003)(66066001)(71190400001)(476003)(11346002)(54906003)(58126008)(110136005)(14454004)(9686003)(6512007)(6436002)(2906002)(7736002)(25786009)(102836004)(106356001)(76176011)(256004)(6246003)(305945005)(97736004)(26005)(6116002)(3846002)(42882007)(386003)(6506007)(1076003)(99286004)(53936002)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR2201MB1424;
 H:MWHPR2201MB1277.namprd22.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AauhoDSy0aXyQ9vXUOJWyM6pXWiDxpv0djLvbqUII54Mj3c7hkwfDqt2fkGQJNB7DPUDKHXI38QJ/Unx0WHvKXrC3p+fxi3xO0SwGjVLXgXO0I5E5H5p+yiM4ZUxwZ5QMdUr2oEcbFoW36k/s+JYKC7e6I+9gOVdsZiy5K5cN+KYfPjBVAGIBTKGX3Ua1icQCh6XalyWwlfnxOkTFxpfrIUuHv3XuE1hinfxHRrWIw+ViIbf9cGJAreJWbEkwS6d8j/yK0MC2IWd1YF20EWg7za933oX7tByVwGSviz6HUwYj/QTMth73LEWEfqskSSgRWiFw4ifCSVKpOu1NL5jok+pV4rHW9m55EkeKBzj2ApT17uvb1aWNw0cXZCuZ7n3USNCEA2zI0U2yIZQWOxh5nVlk7fjdk8HhLWisxBH88A=
Content-ID: <431CEEA068FA6541844BF5B5E0B63573@namprd22.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bc525f-6e7b-4eb5-2cbc-08d6905e5aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 20:20:24.1577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_122027_978006_DA0FE216 
X-CRM114-Status: GOOD (  17.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>,
 Linux MIPS <linux-mips@linux-mips.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Mon, Feb 11, 2019 at 01:37:08PM +0100, Jonas Gorski wrote:
> On Mon, 11 Feb 2019 at 05:39, Michael Clark <michaeljclark@mac.com> wrote:
> > diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
> > index 0b9535bc2c53..1169958fd748 100644
> > --- a/arch/mips/kernel/cmpxchg.c
> > +++ b/arch/mips/kernel/cmpxchg.c
> > @@ -57,7 +57,7 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
> >         u32 mask, old32, new32, load32;
> >         volatile u32 *ptr32;
> >         unsigned int shift;
> > -       u8 load;
> > +       u32 load;
> 
> There already is a u32 line above, so maybe move it there.
> 
> Also reading the code to understand this, isn't the old code broken
> for cmpxchg_small calls for 16-bit variables, where old is > 0xff?
> 
> because it does later
> 
>         /*
>          * Ensure the byte we want to exchange matches the expected
>          * old value, and if not then bail.
>          */
>         load = (load32 & mask) >> shift;
>         if (load != old)
>             return load;
> 
> and if load is a u8, it can never be old if old contains a larger
> value than what can fit in a u8.
> 
> After re-reading your commit log, it seems you say something similar,
> but it wasn't quite obvious for me that this means the function is
> basically broken for short values where the old value does not fit in
> u8.
> 
> So this should have an appropriate "Fixes:" tag. And Cc: stable. Seems
> like quite a serious issue to me.

It could be serious if used, though in practice this support was added
to support qrwlock which only really needed 8-bit support at the time.
Since then commit d13316614633 ("locking/qrwlock: Prevent slowpath
writers getting held up by fastpath") removed even that.

But still, yes it's clearly a nasty little bug if anyone does try to use
a 16-bit cmpxchg() & I've marked it for stable backport whilst applying.

Thanks for fixing this Michael :)

Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
