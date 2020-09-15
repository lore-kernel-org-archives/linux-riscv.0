Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF45C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 07:02:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DC8206A1
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 07:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xfgwg8lQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="n2IFqom/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ePn/IXcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DC8206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=XbMsDfuyJL/yaahZi9zUFxsV+/gQsWaU4WUIOdoFAXo=; b=xfgwg8lQWzvBwGTEWWfIlgkqZ
	27P0n9RjGvIfgm7aObPWZ9wK2ZnDbKPX/ptv9j0k4hDD2oNbA6rlpO0KKRp7sWeQ31hha6uSG1rtz
	UueV8A0j5Y0V7vcfgfdsij19NnnBIlBvwSg1BQ66+CSfm+qz+rd1zs6nZeOJjwezlpNFQfvuiHIhi
	b2mOaVJ9klLwdAkut7gju9Dob7aa93WxCEivfUKF19Wg2JO+z5sp48WMUX0Ao0Q9rbKmpr1ZTy9PJ
	oUj2XHl21jKHv4daT/oGNio9crFFvVwwpc+DYTKHC/pPZRRsSK7qmkWJmZ+QAaS7G8BqSrhWE6z6B
	7oOhDH0vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4yP-0005WM-WD; Tue, 15 Sep 2020 07:01:54 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4yL-0005V0-8D
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 07:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600153309; x=1631689309;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=+3cAjIF6fV7vWRnGlLHYLKudJcUGQreP4knQzL/ZqeA=;
 b=n2IFqom/0SImF2unYXXxtNqsJ8V2nVzQsId9Ux64bJ4yiRDQ+a8qKBtU
 2AacJQgCbmo3qJfYcyS2s4JKuiuoNGkdRPgYUKtyK8Hxfv9pOtpyg9W45
 2KXad8OP32qR8+Osa5kA2+fJ/LHz/s1dcKhrm3owoV/aU2mdc+WRhx9lC
 KhGKVc2WG6/a8Roz9dZVXGOle+FCyuCF7tOH1Gl+b2wcRIH9y7cMauNQa
 2/5T+Xe8CPm9HaGkfmBz22OfwUwlbjpvVDaFkaKnZaM7Ox0YhUxOs05vf
 jY2ewOg2sdMmbQ8z9Xkk0Vk+L1+ARuq4AF9uXowcKQBy7eDdwdK8jR8Du g==;
IronPort-SDR: 4I54MlsDyLUjdBB1dWD1jM65DD9ctEVqOLYQEIYD1F1xcMdcJS4O1B95o54yTXpwsLfDCVpJN7
 iG055OGQedKe6bBBRhbnXeQYZKVOS+kYccnhJjELpXXeRvfN2vi62HEiLM0TGUa0p9R05VulYc
 dOikY/B4q1p4qQ8iMmmijC+SbspAXwXcfdameUk5xAyO6Uq304/lRrONouhIyLAb/cCxviWivI
 t4x4MtOiLqa4Yoo8tMvjzjIseGbm5euojsT6haO9woadA1tflhl3yaTdObhtFNg1pGe0M1QsGU
 7oo=
X-IronPort-AV: E=Sophos;i="5.76,429,1592841600"; d="scan'208";a="147400799"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 15:01:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3Z5B+F5+8YoKRMzHt3zGH6jgdU7rDlP25NltLmY2KReh6wg174o2CEIZeKkmUeNLm+707EjHXYcDfjz1W5+1b/LQ+siyrmnolF3QTo5uNTgyUKsfnohaQzMdwYZKLtTz5Jb8tpoqcd3yGbRMJWXZ2pHbNC2UlleIztfwTbHg+y5fIcc/1qElkw/dKHJ6gZUu3Q+8eym4AI7WtA/qi2Z94nO9bnR5JMWdmBGgvBZ+ePoERDVSQRsv6CpgGhosb+4J6YRzgABeggwcZYBcPTpB9tZIYvjwqshszKhe5/AntM5ziFEGU1NS4v5MFuf1kxjDOCUmKpz1ZyID/Lz8dAbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB8Lw5bcSW1eI2nzcFiOYL6EUaCbSqnBBEqZ1TUiDkQ=;
 b=nIBzVGEOaqJL/ovTGpqqUMKfeWJCzYm1/2FSOHEb6o5cAaXorXXdyZKNS6abGLg6xkc3KGfP1u8TtRmmWxVQRnjbnNd/yDHOoNqSvrE2qHCgCtHdN/YcFMHdq/3GeeKT6LAzkb6pVnZZMSQLnjpg/gHtktEpeJKH65FTT0D7xyHye0olLtizPDtY4a5aomOGd3PSH/Oz0jeagH6jgQMjS2ovPX/ahsVosXM+VhBooLOQQLss2W5cTQ0wjGJgNmqagiLKC/5I19PCqtLWA2TJsMSETD9wmZpQePykm4KvaDcyiG72QZho88syunxEmjs0NJtiE1CrTdmJX8zmSjae6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB8Lw5bcSW1eI2nzcFiOYL6EUaCbSqnBBEqZ1TUiDkQ=;
 b=ePn/IXcULxEn0zMnclduDtHLBCwnTj50c3qcW5kayL5asOxMbfCOlRKSpaVniyRpvGT7fwxTAayyhmgR/GGRjdjOtvT9DsbvSdE41Rn0X2eSERhgkmANx5S8d8OeC4XxtJ4gAT92q598A3kOd6k2aewgXofu1Tw89HscxrJ+nk0=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1225.namprd04.prod.outlook.com (2603:10b6:903:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 07:01:46 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 07:01:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+w==
Date: Tue, 15 Sep 2020 07:01:46 +0000
Message-ID: <CY4PR04MB37514B8FF89DEFDF2A7622C0E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <20200915054649.GA16371@infradead.org>
 <CY4PR04MB37512693510EE0C8E8B29F4CE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200915065138.GA31702@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 36a35973-3491-46ca-ffb1-08d859453620
x-ms-traffictypediagnostic: CY4PR04MB1225:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB122571CF35706ABC9D9EE7AFE7200@CY4PR04MB1225.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7KBuasI5yr75mYPtKBbkB1BdZ33JmgeI+0J5ns+3g1HdUMO1VKPurw3lGxWgwpS5vWhiFY/zPJLZt9y7jGQb0Q2xOzR2VOr26HRNJpc1OFS7Dsl324n58au62XHsAtG9hSG/140H1pdRuayak2npdw5ioav/RsAUkeeiGYSVMMPvBwarrQ56t6B8A4jS1ePr0XjGvJUVsPLs1nIwIYpUkT8r4A/B6XhJddrun+8dGZhFHMZMJi/iL/HEo6WKe5AvsEKFnULFrPaY3UiwaZMMb4nGdd2/AuPj1jsGPqqczS+sJC3Wl+RnMWxmCpSy5XJaPTNjSkUCHLi/Nb3TvvoFwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(33656002)(5660300002)(478600001)(52536014)(6916009)(8936002)(71200400001)(8676002)(54906003)(53546011)(66476007)(64756008)(66446008)(66556008)(66946007)(7696005)(186003)(86362001)(2906002)(6506007)(316002)(91956017)(76116006)(4326008)(55016002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IYfCOnrqlqhT/EhtKq1x3pAv49ow7Dum+RRlRkegzVm6xYA88nypcW7WT+A/XVvoghrMUSZyKkHlwwfRHwdoooYgmh+UpBNrIKfGrBK0b2VcUvC54j9Ht0RVfTajkJYyoeS+0LWlSq8Hx/93MIArhHunO6Lq4cytaz24/J/ec+S9Ja6tsVEEuT6nsmtmrlfF4O+Tyvh5ybhjLquOax/Mp0RvAXHdDqow3TbiPqZ3R1INasBqtbpNz2BWelog5N7hDrguOGeK63lAWV9C6GqVLf3RPh3eHU4+gbn6Vijarq8cExkubVpSZXrg+oiOdhA1iFCAR1vLRZY+gmNBs+sCpyK9TSb5dvmH3KlXGYhoiMI+K4CYCDPKG0sYykkGy4xFOFz7iTIR3U2mMS7lk07ufehSffGRv55yvNJc9wbXjVhBhH99rIRZbxwFs8PYcHqX7jhXVzjyXhkuyKevjTlMzA7v4AGcPZx+/sejgvucAnzUTNJMSXakY/dO+BGxaJIraatGUMHVDZr30YZFiCZSBLsGg0iFQiJlIu2L/4kYf7NT8n8UAqgsUziClQOEK/DTDtUxUA8hRJGV4474ZpXsWh9qaO030zwDN7s44FR93h9XAKftYQ9gjoFasy2/jw+tpm+0DqSikOidDnGfayw2boEHA4heGiC6q1ip+TR5x58Jnt98BSmnCBaRBr0yi3QFFTkfYzi1nMEHN2mKtRlfhA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a35973-3491-46ca-ffb1-08d859453620
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 07:01:46.7273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eeMssKroJSr4E47ZsnoZH2YsvM4V8vQgbwGSji127vTyq3kOwEfuG9I1FV0cxW9zpIe6n3K4dSyKWp2KB276Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_030149_453922_42587B6B 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/15 15:51, hch@infradead.org wrote:
> On Tue, Sep 15, 2020 at 06:50:24AM +0000, Damien Le Moal wrote:
>> On 2020/09/15 14:47, Christoph Hellwig wrote:
>>> I won't have time to set up the K210, but this fixes the timer issues
>>> on older Qemu versions that don't implement the time CSR.  Although I
>>> also need to revert the binfmt_flat patch to actually get to userspace.
>>
>> So revert is needed ? Digging in the flatbin format, I do not see why the offset
>> you removed would be needed, and it does not seem to affect other arch anyway.
>> So I am really suspecting a problem with riscv uclibcb or elf2flt, but can't
>> quite yet figure out what may be wrong there.
> 
> I did not have time to find out if what we did in RISC-V nommu was
> correct or wrong.  But to get my existing userspace to work I had to
> revert the revert.  I'll try to find some time to dig into the binfmt
> flat issue and elf2flt soon.

OK. Thanks. I will keep digging too when I have time.



-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
