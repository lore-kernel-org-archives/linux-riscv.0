Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0810BC433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:57:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5539D20EDD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:57:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3UYsOTeW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="ToT0B9IA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5539D20EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGB04UL7wllE/udT7tlV1Aj73Twpq+8fQ0AVnKQnrWs=; b=3UYsOTeWe2jk6vb2bYMu0HuE+
	HRJ/rvoeHzNBlsclfcs+YOdKmbkUV1IhQEIkLO0nx9JepsIu4H8zDEkBOEWjA3AfaWCYwGY6wQXav
	JLnmRbTQGiuLxxC2f+3CszBSJw2nt2yXSLPuIqtkKJ5KaPY5dcrzIqVT8V0xGUXZBRadSSGNlJaVp
	EHG0RcRHdfyRrqPcXaSimfN8CcHgzK3R+NpqO3Ifpn+fS4bNZGE1P5ZjAd4uJJP37juv3Y25MabuD
	1VGVIDhSIV40+4liCpTwDMaiN1DTz7vIzJ5qp6dWWz0juS3xa6/e2q5GXfIlIP9DHxa2LrH7InAFu
	uDApQ63vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFrEC-0005Py-VN; Wed, 09 Sep 2020 03:57:01 +0000
Received: from mail-co1nam11on2066.outbound.protection.outlook.com
 ([40.107.220.66] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFrEA-0005Oy-By
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 03:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfd3DQbEGrWW46FJJI2UbVwKGU7ruR9XnmIMMMqbuM/oQraVU2JV3ozVVfN3/D3ubLanshCpOFzJfrzMG/fDA3A3qziMZIpPZHkFgApemK3xguBcN4Ahwy+IxicJtXIOwbSH49ip2vVXhqlSFTtBNKk737SgrzsoOJfvw7iJusEypP/C3Febq6De9O1xzLxitwBX5JLeP0RVVfqdg6JG5UADx3WSxxxjBYNmPLUd+R5PJ9TqgJ0nZiR61YLqMTHIQiVPBdCz/HU7qNONAz6VXJqT1fkk6c6ig+rPn7eO54GiKoKZS0vRfIfaZXtLJHIttrYeksIl0AZJzNAWWimasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9gWSJZFNjnRMs+ZLnKwA++lLplS/mJ53gaBpvWcd74=;
 b=lVQcxT9WacjpqJW7MeXB/bLWw/pulDfz39xWRkl5Ka5YoxmxbhVVCHK0g7pbYhhqZXdht+292UoVxcUF85uK45WTgzo4U29KW4JczUUMNfvV0EbUJVM4ZpfcrcksfJtCu0lKDnzaEqAALIzCbJR3IkgZ6vfCx6Ekp7vuPc6Ii4XAsriz9tQBgMArPxw6Zge7IKSQRW1anF3ZUAdvlCy8ShYihXSPZjAfYlKPyhg76lgvU5mTmQQEdjfZgZwke6fH+FkSB99l4CT11exHKe95m3iOImGa72u4D5L8R6J054bDPi/GpkJk2IB5KbqR5atHlVlemJs12oN9rIfW0A1Kqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9gWSJZFNjnRMs+ZLnKwA++lLplS/mJ53gaBpvWcd74=;
 b=ToT0B9IAQx7fYzXQp4InteiHeq20gqbk10MKSzYsd46Okx5oMJUznLPu5usjPzDbW4MM0hgAqsqEWNc/zq7TaCcqXTz+N9dFrtmcm2nQO8pUobi3eY/RYD29hRRReSmbQ3mJ16n4Dk48VO2skY5pkQ160GbtZ2NPGh61/23ikzQ=
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34) by BN6PR13MB1105.namprd13.prod.outlook.com
 (2603:10b6:404:73::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7; Wed, 9 Sep
 2020 03:56:54 +0000
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::4596:33b0:db2c:dea]) by BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::4596:33b0:db2c:dea%3]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 03:56:54 +0000
From: Yash Shah <yash.shah@openfive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Christoph Hellwig
 <hch@infradead.org>, "dkangude@cadence.com" <dkangude@cadence.com>
Subject: RE: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
Thread-Topic: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
Thread-Index: AQHWhNqGRYMAfY+EgEGaHPHMq7eq5KlcsboAgALymwCAAAe0MA==
Date: Wed, 9 Sep 2020 03:56:54 +0000
Message-ID: <BN6PR1301MB20201D1CF5DE19A48306D28182260@BN6PR1301MB2020.namprd13.prod.outlook.com>
References: <20200907061126.GA14999@infradead.org>
 <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [103.109.13.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bf693a7-e990-49cc-ff77-08d85474640c
x-ms-traffictypediagnostic: BN6PR13MB1105:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR13MB11059F37B4DEDB69B5873A9082260@BN6PR13MB1105.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pIZX6Hhg8EijYwEEjbARnvMBcHiEJ8Ns67WbG/d2hpH5UnrKkzPReG8LlMW4pQWQtrE5KxLYT9mHxvAHjVQdZbC72KoOappw6f6f1ZFYqnexL0W29BS6DRjCIwHU8RH8w3KOXSVIh7jgQgmI8sCEOw7/qfupQiaeSQfljjMuxgChmcms17oeIDkEoN9x2eFEk5JMD8J5pPTjq264RvfbKODPYZ2oyvQJQyvu8n/8C+CMUgkbKSraCD1NUSuzhMC700df6KoOfRCWi6zoe4OMF6vsni577dulVimEzzGDwnH1SFkx95DqBUBVMOrwNRvX9xHmQ/nACbIJAEkb4Ph2nLbKgFhNbm2h/5cyn6pV4+4VG14DX2KGFvkosw3g+Vkz6TPxBFQHECIG8OSN1wh7iA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1301MB2020.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(39840400004)(396003)(366004)(136003)(376002)(346002)(83380400001)(86362001)(8936002)(66476007)(2906002)(316002)(71200400001)(52536014)(66446008)(66556008)(64756008)(9686003)(26005)(478600001)(76116006)(7696005)(33656002)(5660300002)(44832011)(966005)(66946007)(7416002)(4326008)(8676002)(110136005)(54906003)(6506007)(186003)(55016002)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: vwuLzI8WIjkcy34Mwb53SpIeNvNwqSWBP7TR1QDhD8Wd3gaAM6Oevd1lCwQvWuC11ALCpt4jyCRF93vXEBCJasgZOvLeCDpKTGB/L99GPIs658FMIqz0kavY3fObwlvy+8RbY76vjkE5X93lqDqQT2ymyMMLjRLsCdIzyyvcjp6fVocnlXJS7rgg1QWD6HP8pwZrLhXwNx4Sa/UUcXGPgr/q4WBKWFvw+APNnMHQRa8jEUIVJFtqpbYI/YHcR4OW99VtD+pR6sL3Y+nmbBwAxAWgGJ83e+76+k/1+Ee8fCpBuFupH/mu4t567Nh3j+tWnK+QhNyOkZoj0+WcoKDpJyMKDqRO1BV/XI7FKjP5T5GTr+ee9rjxDxcEqAh4CFgdTt/QKTo7UBg1EAauR9GXkdu9VT0rrrbZZsIn81WdI03sbXNmDhRy4bBEA3QPZfbcsNf9qClR2Fd4Dsc603UzG7RwnPuzy/9XENSkFgrDJVK/XHmgbcEd+mF+Es91tWruVCt7DCdAU7g5cnzXjO20u9RPyTxw0WFhB5k7uJxcolK7zjU8rSq7H9eL08GmZFamkI80/7L/QdCLy+b3LKFyuPbbsXfoNwWRHpvvPUCjiy5WvkEl1IBIM/ZkT6Ue/oNBf+cPd1wIZu10VhmG8Nxi0A==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1301MB2020.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf693a7-e990-49cc-ff77-08d85474640c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 03:56:54.2859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mHb/xEW+yRb4vuj3QmpRYJsd+zT4SS8oClweJQoBSzhdSbQhJUD49kYeAqQ8h7tmT76S+Zbe9xbhiCY1j7KuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR13MB1105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_235658_532302_A6344CEF 
X-CRM114-Status: GOOD (  32.03  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rrichter@marvell.com" <rrichter@marvell.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Sachin Ghadi <sachin.ghadi@openfive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: 09 September 2020 08:42
> To: Christoph Hellwig <hch@infradead.org>; dkangude@cadence.com
> Cc: Yash Shah <yash.shah@openfive.com>; robh+dt@kernel.org; Paul
> Walmsley ( Sifive) <paul.walmsley@sifive.com>; bp@alien8.de;
> mchehab@kernel.org; tony.luck@intel.com; devicetree@vger.kernel.org;
> aou@eecs.berkeley.edu; linux-kernel@vger.kernel.org; Sachin Ghadi
> <sachin.ghadi@openfive.com>; rrichter@marvell.com;
> james.morse@arm.com; linux-riscv@lists.infradead.org; linux-
> edac@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
> controller driver
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Sun, 06 Sep 2020 23:11:26 PDT (-0700), Christoph Hellwig wrote:
> > On Mon, Sep 07, 2020 at 11:17:58AM +0530, Yash Shah wrote:
> >> Add a driver to manage the Cadence DDR controller present on SiFive
> >> SoCs At present the driver manages the EDAC feature of the DDR
> controller.
> >> Additional features may be added to the driver in future to control
> >> other aspects of the DDR controller.
> >
> > So if this is a generic(ish) Cadence IP block shouldn't it be named
> > Cadence and made generic?  Or is the frontend somehow SiFive specific?
> 
> For some reason I thought we had a SiFive-specific interface to this, but I may
> have gotten that confused with something else as it's been a while.  Someone
> from SiFive would probably have a better idea, but it looks like the person I'd
> ask isn't thereany more so I'm all out of options ;)
> 
> It looks like there was a very similar driver posted by Dhananjay Kangude
> from Cadence in April: https://lkml.org/lkml/2020/4/6/358 .  Some of the
> register definitions seem to be different, but the code I looked at is very
> similar so there's at least some bits that could be shared.  I found a v4 of that
> patch set, but that was back in May: https://lkml.org/lkml/2020/5/11/912 .  It
> alludes to a v5, but I can't find one.  I've added Dhananjay, maybe he knows
> what's up?
> 

I consulted with Dhananjay before posting this patch. From what I understood, Cadence provide highly configurable and customised DDR IP blocks based on the SoC vendor's need. This impacts the register configuration and probably the offsets too.
I had also refer the v4 patch posted by Dhananjay mentioned above and found that the registers offsets are not matching with that of Cadence DDR IP in SiFive SoC. Therefore it seems this DDR IP block has SiFive specific configurations and hence this Sifive specific driver.

> I don't know enough about the block to know if the subtle difference in
> register names/offsets means.  They look properly jumbled up (ie, not just an
> offset), so maybe there's just different versions or that's the SiFive-specific
> part I had bouncing around my head?  Either way, it seems like one driver
> with some simple configuration could handle both of these -- either sticking
> the offsets in the DT (if they're going to be different everywhere) or by
> coming up with some version sort of thing (if there's a handful of these).
> 
> I'm now also a bit worried about the provenace of this code.  The two drivers
> are errily similar -- for example, the variable definitions in handle_ce()
> 
>        u64 err_c_addr = 0x0;
>        u64 err_c_data = 0x0;
>        u32 err_c_synd, err_c_id;
>        u32 sig_val_l, sig_val_h;
> 
> are exactly the same.

I apologized, I forgot to mention it in cover-letter. I have based my work on Dhananjay's v4 patch[0]. 

- Yash

[0]: https://lkml.org/lkml/2020/4/24/183
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
