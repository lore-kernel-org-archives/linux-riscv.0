Return-Path: <SRS0=t+Pg=6V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7133C38A24
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 May 2020 03:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801512075A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 May 2020 03:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kP0Fc2wQ";
	dkim=pass (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="nOTSN8bB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801512075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AEr9gcTIvUTlTtgoRz/rmsZ2fdq8pBCFLB9lVnlQKVk=; b=kP0Fc2wQ3kka2OpjzNLE7/xKW
	2kI1sWQ5RlVhNRBiex9xU6NrPd57ASEFnaWGfds3lqPiOenMcKYisQbWikxPolCDzrLrDe2W2ADqr
	4tomskT5wP5x4gECFUmQpmHk231zR4NYCa1vcaT8MsfOsom7DIMkME/0F4JDdCHBqIw79Zw7Wim/a
	xOt5NIPbHFo0YBSNwV8EWJZDRGz+iGuhNsJCpvgYwzti5TRe6lWNmcUUybFy+QtPQmvvJ+yEg5/mp
	7wccO2s1NX8nx5PYdYhSQ6XaVfD140TgCOXzHCHdiNtEbA1Am5h9AsblsfNlPUOrxIFHAjPbb+Jsc
	MSSvY72hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWXIV-00036c-2l; Thu, 07 May 2020 03:34:07 +0000
Received: from mail-dm6nam12on2069.outbound.protection.outlook.com
 ([40.107.243.69] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWXIS-00035v-0j
 for linux-riscv@lists.infradead.org; Thu, 07 May 2020 03:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyA+Yr4sbU5E1EFXTF3KCByKuT54m8FOnlNq3EKq58Wp9F7xvdy5ZG7sOj6kV6yxCG2XvTA9YuOI+TWYEFYpQE5svwMjJG11kdC9X2WhTDsXG6eonOAZfU13jdAbK+Si7JzXI9eWLd3xl+zar2ffxeFLVZkIbTDerz8PZd0Db0EbRScJ5PFsydyBJarT3YLIYZl+OA1si+OkASy2SsjNsC+4HCdBKcte/zrfz+/xfWD0I2MMITyMHteo89XaWHfxBiC5Da6+l6lnxYFeeE/VapNDygucFPxfPta1puqfW9Srt9Xsd++oYlD7jNLuoMHI7gUTbg0O2QrHz4p1cyKjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEr9gcTIvUTlTtgoRz/rmsZ2fdq8pBCFLB9lVnlQKVk=;
 b=d3Q3d4f/G/345wGq4/8s68vhLRdJgymi7NU+sMvxxi2gnP0WE05XenFdb8v2oB7wYZK1hddA+vG9Phxp9fdRpMEE8VdJ4IFwqHO4VIrStFOCpA12p9JnjA4suxvRQhJLK2oUmHB93JFVLnzdB4c2TvKquBUIpw73Jal8fRDOLl3/s8NVwRfhVgajqK4fWXK7npylNCWzekG+EveDVd1pWWFFP+uk031xcPh43lSkwzrdUDJUReqrukXUjbSawlItPXAsSQf9OaR/mDpAPSYQ6UcXVTqDPwAvz/LsyfX9PQJJOYY/TsL9ikxI/Ur9dxbCrqucECdza0+5ZzHg9o9o3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEr9gcTIvUTlTtgoRz/rmsZ2fdq8pBCFLB9lVnlQKVk=;
 b=nOTSN8bBfS4jRkAIQyQ71RpVC58Tfaf9aBSsiuuDx0+7owOo/Owa7mw4PPfbqW3MXINx/miAKq4bAsYLLU3xW3IVaIMMwQ302+TlR2sZ5piDOu7EegzX58Yd8TIl1zimTjSz6L9Hle8vmRmYSUK6UrnItst5HEbv8avY4UbpUhU=
Received: from BN8PR13MB2611.namprd13.prod.outlook.com (2603:10b6:408:81::17)
 by BN8PR13MB2692.namprd13.prod.outlook.com (2603:10b6:408:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.23; Thu, 7 May
 2020 03:34:01 +0000
Received: from BN8PR13MB2611.namprd13.prod.outlook.com
 ([fe80::c129:8fca:5ed:8929]) by BN8PR13MB2611.namprd13.prod.outlook.com
 ([fe80::c129:8fca:5ed:8929%6]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 03:34:01 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: RE: [PATCH] tty: serial: add missing spin_lock_init for SiFive UART
Thread-Topic: [PATCH] tty: serial: add missing spin_lock_init for SiFive UART
Thread-Index: AQHWI9xT6ew1lYdCokaBOkjqOFic/qibr2UAgABJXPA=
Date: Thu, 7 May 2020 03:34:00 +0000
Message-ID: <BN8PR13MB2611CA847556D2F726C1F1AF99A50@BN8PR13MB2611.namprd13.prod.outlook.com>
References: <1588793212-5586-1-git-send-email-sagar.kadam@sifive.com>
 <1588793212-5586-2-git-send-email-sagar.kadam@sifive.com>
 <CAOnJCU+tLfDB3k399K_jMYUQQ7qXyRchn2g=qsm+4sB9i-3jMQ@mail.gmail.com>
In-Reply-To: <CAOnJCU+tLfDB3k399K_jMYUQQ7qXyRchn2g=qsm+4sB9i-3jMQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none header.from=sifive.com;
x-originating-ip: [116.74.144.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dc37eea-2b30-40e3-c7f1-08d7f2377bd2
x-ms-traffictypediagnostic: BN8PR13MB2692:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR13MB2692679589F4816ECFDD0D4F99A50@BN8PR13MB2692.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0s+yjmEJj0eDmVWiIO2azBtJAhx5JInu7DTky9T90IeNM4sLJaHZ7EpwdqGYyHeDmsW9koEgmgdBxRoW7nfmhCsuWPMbQl4oY+VVXIkrPKxSg99DilxImJ+dQo/mkXC0WiCCnCtXejv6uPO17TN5kXisAIQGLtMVDQc0fWjBmR+fVrzhxj91cFflzHpL+j7Lb6HMfUFdLfXiusJiWwUQe24F4tJVFw2bdBPLw+XmW+MDlE/RVXlKLJgIE8RSnpuWkV4n9LP1TfQ/fJ+cSVb4iN6e2mvmTyj6YVrLR03R0IBmJ3UaIXLxnnykxQF9VmZTdsV5HiJDuakfntJTyZWQSfjGE36MdMZAPmxBcAIg9a1Er5ZgXs0KFyMxB+LY0J/BF+agq/Vr4GhMC/Wq3Zp5kiCgmoEjIZdqvfZ87bc+rrCZD/VZ+I4oWTkNeyPVe2MxLin/qPwuv7SUmDrytxrpLlYAdWRz5iHCQUXZHLVWCZA7tcvI2uB0gXXupW1C6t90ssI0w0tUjZFy0KtI5MpMDpXqtP8UGBV6DGCclDDXotK0332/EMV9KRqbe6lBwPhKNlrUNA/q/plnE0UL4e+jVZi0wGqdFD+Ic/UL/x68j4M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR13MB2611.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(6029001)(346002)(376002)(366004)(136003)(396003)(39850400004)(33430700001)(66446008)(64756008)(9686003)(66946007)(66476007)(66556008)(8936002)(6916009)(2906002)(4326008)(107886003)(53546011)(26005)(71200400001)(6506007)(52536014)(55016002)(55236004)(186003)(8676002)(86362001)(478600001)(76116006)(44832011)(33656002)(5660300002)(966005)(316002)(54906003)(7696005)(33440700001)(83300400001)(83320400001)(83280400001)(83310400001)(83290400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oPP8I2zB+NlwjcWZ1ebTCyWSoCkyU6Iotw5dD4Z3AJIr4tlfrRY/+Lex6bLVgs7y5zhFnjLm2gktWiQxIjTqYJoghI4D5hZpdVUjrhoyayZQ4iZerWrAjcQDGYzcZ/ifzIRFozi84NMcfqNlGs+leiihE1k3sOeGcm1cYiCQmf4MCWMuS2Eu3a3pKYqvy3GxWUForA47p/Hbg/TCl7sPfIIbXuQ7wKyao95fanyd0h2FJUwLumcjrasH7KCaJSfS+O5bY/0hJW8Z7Yz3G7AdiD7quG1i0idgM/VRRnzn7ua1iXRmi8/9lRa0SL52WsYQeNRDbaWeGZJgc/bTFcaefoxYWQpSZMqDwSAaVsdQg2+xwRNmEJ6zdq3QJQTahe81rKTOcdqOzVOL+MT2mi35GYSRH04/rQ0JeX4o6qcP3x2l9EB+QnZwviZx2K28hM678TpNsFXLCz4DyOZ3EcvTpwwKj3YIEpB57kYAuOYJD5g3M9tJVjLF0UfcxCPk1jwGae0qBD624V1Z8SwNptRR/7Sz4XZWk7FpTx7+7smPVUntdPRc3WYa8B2FdFveqGjXlrTfcKQqmm/v+AydIKVmYbWER/VJczNVeFByJ0ReCoqTvnPTNW2Sk4GK9XvCOAP/KDwE6aRk/29NIF9r3eyzl72dyVsQsc6IvAphdHFa/Tgb26DG53tq3HuTRUVgRNbZhWBfFgbtSseHC2iiqyVzzz+sIvDH35lY7nEGpunixJnCsACgH+GTV0ewX6ij56Sa5rv6mfO2Q+Fy9PU89uPpigmRB4+NsxC1muz/w0HyboU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc37eea-2b30-40e3-c7f1-08d7f2377bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 03:34:00.8490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mU3b7TVegUW3rbA7xFtaPaPUA/GoVUGf8vkW0CCyEIOqwQazgcBQCD/xDswBEpYZVCWT16lwGdxCydf513S8Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR13MB2692
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_203404_128982_A598E952 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SEkgQXRpc2gsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXRpc2gg
UGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1heSA3LCAy
MDIwIDQ6NDEgQU0NCj4gVG86IFNhZ2FyIEthZGFtIDxzYWdhci5rYWRhbUBzaWZpdmUuY29tPg0K
PiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFBh
bG1lciBEYWJiZWx0DQo+IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBBdGlzaCBQYXRyYSA8QXRpc2gu
UGF0cmFAd2RjLmNvbT47IGxpbnV4LXJpc2N2DQo+IDxsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnPjsgQW51cCBQYXRlbCA8QW51cC5QYXRlbEB3ZGMuY29tPjsgUGF1bA0KPiBXYWxtc2xl
eSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0dHk6
IHNlcmlhbDogYWRkIG1pc3Npbmcgc3Bpbl9sb2NrX2luaXQgZm9yIFNpRml2ZSBVQVJUDQo+IA0K
PiBbRXh0ZXJuYWwgRW1haWxdIERvIG5vdCBjbGljayBsaW5rcyBvciBhdHRhY2htZW50cyB1bmxl
c3MgeW91IHJlY29nbml6ZSB0aGUNCj4gc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUNCj4gDQo+IE9uIFdlZCwgTWF5IDYsIDIwMjAgYXQgMTI6MjcgUE0gU2FnYXIgU2hyaWthbnQg
S2FkYW0NCj4gPHNhZ2FyLmthZGFtQHNpZml2ZS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVW5pbml0
aWFsaXNlZCBzcGluIGxvY2sgb24gc2lmaXZlIHNlcmlhbCBwb3J0IChzc3ApIHJhaXNlZCBhIHJh
Y2UNCj4gPiBjb25kaXRpb24gYW5kIHJlc3VsdGVkIGluIHNwaW4gbG9jayBiYWQgbWFnaWMgYXMg
cmVwb3J0ZWQgYW5kDQo+ID4gZGlzY3Vzc2VkIGhlcmUgWzFdIEluaXRpYWxpc2luZyB0aGUgc3Bp
biBsb2NrIHJlc29sdmVzIHRoZSBpc3N1ZS4NCj4gPg0KPiA+IFRoZSBmaXggaXMgdGVzdGVkIG9u
IEhpRml2ZSBVbmxlYXNoZWQgQTAwIGJvYXJkIHdpdGggTGludXggNS43LXJjNCBhbmQNCj4gPiBP
cGVuU0JJIHYwLjcNCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIwLU1heS8wMDk3MTMuaHRtbA0KPiA+DQo+ID4gRml4
ZXM6IDQ1YzA1NGQwODE1YiAoInR0eTogc2VyaWFsOiBhZGQgZHJpdmVyIGZvciB0aGUgU2lGaXZl
IFVBUlQiKQ0KPiA+IFJlcG9ydGVkLWJ5OiBBdGlzaCBQYXRyYSA8QXRpc2guUGF0cmFAd2RjLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWdhciBTaHJpa2FudCBLYWRhbSA8c2FnYXIua2FkYW1A
c2lmaXZlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jIHwg
MSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9z
aWZpdmUuYw0KPiA+IGluZGV4IDEzZWFkY2IuLmIwNjFiZGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy90dHkvc2VyaWFsL3NpZml2ZS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3Np
Zml2ZS5jDQo+ID4gQEAgLTk4OSw2ICs5ODksNyBAQCBzdGF0aWMgaW50IHNpZml2ZV9zZXJpYWxf
cHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgIHNzcC0+
Y2xrID0gY2xrOw0KPiA+ICAgICAgICAgc3NwLT5jbGtfbm90aWZpZXIubm90aWZpZXJfY2FsbCA9
IHNpZml2ZV9zZXJpYWxfY2xrX25vdGlmaWVyOw0KPiA+DQo+ID4gKyAgICAgICBzcGluX2xvY2tf
aW5pdCgmc3NwLT5wb3J0LmxvY2spOw0KPiA+ICAgICAgICAgciA9IGNsa19ub3RpZmllcl9yZWdp
c3Rlcihzc3AtPmNsaywgJnNzcC0+Y2xrX25vdGlmaWVyKTsNCj4gPiAgICAgICAgIGlmIChyKSB7
DQo+ID4gICAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgImNvdWxkIG5vdCByZWdp
c3RlciBjbG9jaw0KPiA+IG5vdGlmaWVyOiAlZFxuIiwNCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4N
Cj4gPg0KPiANCj4gTG9va3MgZ29vZC4gSSBoYXZlIHZlcmlmaWVkIHRoZSBmaXggb24gdW5sZWFz
aGVkLg0KPiANCj4gVGVzdGVkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4N
Cj4gDQoNClRoYW5rcyBmb3IgdGVzdGluZyB0aGUgcGF0Y2gsIGFuZCBjb25maXJtaW5nIHRoYXQg
aXQncyBmaXhlZC4NCg0KQlIsDQpTYWdhciBLYWRhbQ0KDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IEF0
aXNoDQo=

