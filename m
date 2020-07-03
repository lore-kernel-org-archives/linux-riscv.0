Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADAFC433E1
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 05:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD1B2075D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 05:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NpxCyDyu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="Dxe6UlXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD1B2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KHErkyaLI0lbPEJYcvBAM3eNQ/KGyreleX+JeIOWCk4=; b=NpxCyDyudtEvO2m6puaXuxmml
	zhknN2tHAu+qBy3dRXdc9zDlmX6Z/yfQVXmDrSevhwet0HUsl3VDwc+e8nUNxSe3aZYmJSvVWih9z
	e3R8MKgh8ycd+rkjhMr1qAUZHnGhpf3OabFz8A1i0xptxoAYRrLDCUAyI1wxK7Oy65f9YbK+ITrlT
	4jXQl74y5WxxGO3jPaYLYrvI+OTbi5e3sJ7o0++AXiinSNIgaT0ikhRtErXYFBqAxxfY4bhNgrTxj
	7kT/TGGdldSreSW084KrhGkx/1nVuaFGtmSZS9CQMv4FkcsWQm0LD2khQeWZq/iaToZYrCuFmyWh1
	5ruXy83fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrEdf-00033y-R9; Fri, 03 Jul 2020 05:53:31 +0000
Received: from mail-dm6nam12on2057.outbound.protection.outlook.com
 ([40.107.243.57] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrEdc-00033B-MF
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 05:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwX3xSUBwLfIEezi+41sv1Q6emm6HWDDy4TGegGIY+q0EzW/UvC0TfUQqBFhg2AeugIBpcyR7SsoSYglAid2AimMpJ5fpr7S6pPe2QRZ5sRiLcjxClFvv31Jgna0VGwlpo+jcNt08L9bBmjrO/JB82k93iu1AJ62tzhrqOpotcOZ83tdZFKjd1BZhXcnXwMwknJTI12phy+j0SMflkrvyE1NAFmgpBWX2EBR0kHl1tReKdVI/kjzccVfTHXUIAqzD/mbrn9QqMEexBmHE1CEdGQ2QFbYx+d4X1EruMl4mcu5j5UWmg+B4vlIv3GThnJWJx9PSizp1W1qf8b1jlejqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqeDXinSZ1wfqNaAZJEmm3/2nDj2Y4bvkZX/yoUNFhc=;
 b=Uv8l794kGx8ltJnRN2PDbIellTMCBlrJsd1Oc35/ivqoB9BPEa2hEvQyk9H/QL20zejDJEs0xl7di64k6wTB1EqCaL+GV25C8Q2bfUbgWUvs4/GP4Gkjoj/F3j7ZJHhMLH3oxn4uM5SX1gLCAihG6SNUzj7so5iGLRJRV5+iUq2swUlttEcvrG/jXseTSAmbXKwcknxcETvwoaelcowYEw7zJOr0dl3KL9m6Ydv4qxwSmfp9b3O6KBktpQ6o8imBbtDQ4dQ9+ksAtwCJMz0RnC9DtAtl2BSsFQbq11rmewGu5ohQVAr1/F5UeitGyPN63ovq5+nyabQVG0zMpmM+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqeDXinSZ1wfqNaAZJEmm3/2nDj2Y4bvkZX/yoUNFhc=;
 b=Dxe6UlXFVA2PRPqFzm9CIuFtLoQch1NTk139O/m2xeQl3rhKy5tQV6wyPsOuZp38Kh5vzcOSpgNa93DhbQyKtmdncjnQP9nJE8dThaxv9h0ppbXzczK1BVSoiconbj2kF0989IoDWC7w0VTXCCOeFZ8+2MgJw63YFF+sQCcOaWA=
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34) by BN7PR13MB2321.namprd13.prod.outlook.com
 (2603:10b6:406:b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12; Fri, 3 Jul
 2020 05:53:23 +0000
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::481f:d0dc:9069:2c42]) by BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::481f:d0dc:9069:2c42%3]) with mapi id 15.20.3153.027; Fri, 3 Jul 2020
 05:53:23 +0000
From: Yash Shah <yash.shah@sifive.com>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, Andreas Schwab
 <schwab@suse.de>
Subject: RE: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
Thread-Topic: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
Thread-Index: AQHWQ9XZeaoAcUonuUqzTiy5jwwbX6jyoJC5gAAXQ4CAArwrkA==
Date: Fri, 3 Jul 2020 05:53:23 +0000
Message-ID: <BN6PR1301MB2020C5FAA902AC521721319A8C6A0@BN6PR1301MB2020.namprd13.prod.outlook.com>
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
 <mvmftabiklh.fsf@suse.de>
 <CAEn-LTqMAf8vaaMhkX7h7+iY8U8v6JTSpW1FMj+JDr7PaWx1zw@mail.gmail.com>
In-Reply-To: <CAEn-LTqMAf8vaaMhkX7h7+iY8U8v6JTSpW1FMj+JDr7PaWx1zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sifive.com;
x-originating-ip: [110.5.74.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dcdf353-2032-40eb-07d6-08d81f1565e6
x-ms-traffictypediagnostic: BN7PR13MB2321:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR13MB23215D369C23DC6FCBC595078C6A0@BN7PR13MB2321.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iPK8FP6yXpOV9XXzo/aOU4dx93bG3jGIaC76kK7+jsoR3Q/IAHvIvWQlghpcpYdOFBzoySk8rf3tH0328mR1aNLhadXqfDTVJlsrqIzq4lke+HmHtYiojNSYUDfp1Gi3AVguCGsWhVFkMre7zaEftSH+3IincqtWLzuNMDotDQ6qHXW0j2PKOJfeczKkVytJippdYey/e56GK0oA7vA/ViRsxUlxm2YvsrjkMQYWMtoAt862yQXxO/ibWPqA0naVr2VCPsChGWsJz66zRra2e44J916QoKZHLL3uhOgAtQqrOJCdAtDsjPvZXVe2KEcoZVY9C71bb+mlEYBZ/o66feHfWahAIVLpHusrAlEaiP8lE+7B0rnbvvFASXCnweuvnhbvrriOHR+NIg75xjWSAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1301MB2020.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(6029001)(376002)(396003)(366004)(39840400004)(346002)(136003)(26005)(186003)(55016002)(66946007)(66476007)(66556008)(66446008)(71200400001)(76116006)(64756008)(110136005)(54906003)(316002)(7696005)(6506007)(83380400001)(53546011)(4326008)(86362001)(33656002)(2906002)(5660300002)(966005)(478600001)(9686003)(8936002)(44832011)(8676002)(52536014)(7416002)(83080400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1dwJyGME8GXxRjoLfzp8g++hCu96yi2zpzlQDzh6Vh388BuvgMKQi1C0CVldRjtre6uZ0GWii4X7vpoXqTg2Lbgu0JXUZbdBBm6ibQ0cam7+5wH4QiP/694fqVam9xGqweV5c6uUJXCKoA6wYDKoiWYyBFAYuzvGFMoigTjFH/l3EZUODd7PYedUDNbdt59jDeoKOq1LQnH7+csmoNcQDjuFE6jwlhEXYhf5v5WPu4RXrRugnQBOizGQ74WU9OVPyhlg8/y1N39O/Qaiccdh+lYRVqyv5ZhediL6KmV7nBICEPVDuQCqLVayEsgJjtoU/7aUkhocIsVP3qbSx4MZvDs7jNa0byXL3cOcRn50p4eG4PMRz0K9yaeul3p3IkMaqe+kn8BfdwmQvVH7g/1isXRSHcnA6jY6c6zl7YvDenPPMi9KopFOiyfioeOsg+empb8/CrwntdCkPJO+moRuN56sdqbrPhqcFphUkYs85j0=
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1301MB2020.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcdf353-2032-40eb-07d6-08d81f1565e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 05:53:23.5284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqgS2msbNZ4y0Hze3Fi1vM+JcHlsYrzLq/zYMi9FdyNpZzR/VJvyMzYaYCvfCZxqJ81/SeKy6tnPXkVFi2Qtfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR13MB2321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_015328_971983_3C56E2E3 
X-CRM114-Status: GOOD (  19.86  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Anup Patel <anup@brainfault.org>,
 "lollivier@baylibre.com" <lollivier@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Green Wan <green.wan@sifive.com>, Atish Patra <atish.patra@wdc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Sent: 01 July 2020 17:34
> To: Andreas Schwab <schwab@suse.de>
> Cc: Yash Shah <yash.shah@sifive.com>; devicetree@vger.kernel.org; Albert
> Ou <aou@eecs.berkeley.edu>; Atish Patra <atish.patra@wdc.com>; Anup
> Patel <anup@brainfault.org>; lollivier@baylibre.com; linux-
> kernel@vger.kernel.org List <linux-kernel@vger.kernel.org>; Green Wan
> <green.wan@sifive.com>; Sachin Ghadi <sachin.ghadi@sifive.com>;
> robh+dt@kernel.org; Palmer Dabbelt <palmer@dabbelt.com>;
> deepa.kernel@gmail.com; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; Alistair Francis <alistair.francis@wdc.com>;
> linux-riscv <linux-riscv@lists.infradead.org>; Bin Meng
> <bmeng.cn@gmail.com>
> Subject: Re: [PATCH 0/3] Dynamic CPU frequency switching for the HiFive
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Wed, Jul 1, 2020 at 1:41 PM Andreas Schwab <schwab@suse.de> wrote:
> >
> > On Jun 16 2020, Yash Shah wrote:
> >
> > > The patch series adds the support for dynamic CPU frequency
> > > switching for FU540-C000 SoC on the HiFive Unleashed board. All the
> > > patches are based on Paul Walmsley's work.
> > >
> > > This series is based on Linux v5.7 and tested on HiFive unleashed board.
> >
> > I'm using that patch with 5.7.5.
> >
> > It appears to interfer with serial output when using the ondemand
> > governor.
> 
> I do recall that userspace governor is the only one supported but this might
> have changed before this patch was posted.
> 
> Yash, do you have more details?

Yes, you are right. The userspace governor is the only one supported.

- Yash

> 
> >
> > I also see soft lockups when using the performance governor:
> >
> > [  101.587527] rcu: INFO: rcu_sched self-detected stall on CPU
> > [  101.592322] rcu:     0-...!: (932 ticks this GP)
> idle=11a/1/0x4000000000000004 softirq=4301/4301 fqs=4
> > [  101.601432]  (t=6001 jiffies g=4017 q=859) [  101.605514] rcu:
> > rcu_sched kthread starved for 5984 jiffies! g4017 f0x0
> > RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=2 [  101.615494] rcu: RCU grace-
> period kthread stack dump:
> > [  101.620530] rcu_sched       R  running task        0    10      2 0x00000000
> > [  101.627560] Call Trace:
> > [  101.630004] [<ffffffe00085a7e2>] __schedule+0x25c/0x616 [
> > 101.635205] [<ffffffe00085abde>] schedule+0x42/0xb2 [  101.640070]
> > [<ffffffe00085d0ba>] schedule_timeout+0x56/0xb8 [  101.645626]
> > [<ffffffe000263c34>] rcu_gp_fqs_loop+0x208/0x248 [  101.651266]
> > [<ffffffe0002666de>] rcu_gp_kthread+0xc2/0xcc [  101.656651]
> > [<ffffffe00022654e>] kthread+0xda/0xec [  101.661426]
> > [<ffffffe00020140a>] ret_from_exception+0x0/0xc [  101.666977] Task
> > dump for CPU 0:
> > [  101.670187] loop0           R  running task        0   655      2 0x00000008
> > [  101.677218] Call Trace:
> > [  101.679657] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa [
> > 101.685036] [<ffffffe000202b76>] show_stack+0x2a/0x34 [  101.690074]
> > [<ffffffe0002319b0>] sched_show_task.part.0+0xc2/0xd2 [  101.696154]
> > [<ffffffe00022bb9c>] sched_show_task+0x64/0x66 [  101.701618]
> > [<ffffffe000231afe>] dump_cpu_task+0x3e/0x48 [  101.706916]
> > [<ffffffe000267762>] rcu_dump_cpu_stacks+0x94/0xce [  101.712731]
> > [<ffffffe0002631f6>] print_cpu_stall+0x116/0x18a [  101.718375]
> > [<ffffffe000264a46>] check_cpu_stall+0xcc/0x1a2 [  101.723929]
> > [<ffffffe000264b52>] rcu_pending.constprop.0+0x36/0xaa [  101.730094]
> > [<ffffffe000266ab2>] rcu_sched_clock_irq+0xa6/0xea [  101.735913]
> > [<ffffffe00026d1be>] update_process_times+0x1e/0x42 [  101.741821]
> > [<ffffffe0002793bc>] tick_sched_handle+0x26/0x52 [  101.747456]
> > [<ffffffe0002798fe>] tick_sched_timer+0x6a/0xd0 [  101.753015]
> > [<ffffffe00026d9be>] __run_hrtimer.constprop.0+0x50/0xe8
> > [  101.759353] [<ffffffe00026da9e>] __hrtimer_run_queues+0x48/0x6c [
> > 101.765254] [<ffffffe00026e410>] hrtimer_interrupt+0xca/0x1d4 [
> > 101.770985] [<ffffffe0006ceef8>] riscv_timer_interrupt+0x32/0x3a [
> > 101.776976] [<ffffffe00085e17c>] do_IRQ+0xa4/0xb8 [  101.781663]
> > [<ffffffe00020140a>] ret_from_exception+0x0/0xc
> >
> > Andreas.
> >
> > --
> > Andreas Schwab, SUSE Labs, schwab@suse.de GPG Key fingerprint = 0196
> > BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7 "And now for something
> > completely different."
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
