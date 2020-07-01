Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F5FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 13:52:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B9520663
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 13:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hdL9I7on"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B9520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/r0I6D4j8Gs3gdzctudSPENYaFY76Cq3/GAUkAtJws=; b=hdL9I7onqCDCxVaWaANgXGF5L
	gSShLcF3+oh8ocwJWSJ8Et9IlI/7o8/JLHjHYV10v9Qb7Bg7J/Ed8o3pmclORDlCo9zeRUurwN1/G
	whQ0RMewVBAd+Ma4uRVeqQosG3vUiM6/VNQixpdRRcAYBwseW51rKV1I4M/KfEmHvb2NrMFHSQzIz
	0iCAdkY5PVmRJ0kklsJqD+Dg8KOxy1nxbtzEAXvb1lYV+XrYlDBoAwzIgqBIFo3Q7FpB7Bf99if+G
	6k4moNg9VviyU11bghx0cRcFrDx3R/OZ4uQS73zVXFQNP+uA8aQovxNj0ZytM4xmXTJTJBBmMJH2q
	aEB74+7xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqd9r-0003w4-6w; Wed, 01 Jul 2020 13:52:15 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqd9p-0003vU-F6
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 13:52:14 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49xjMZ6gKMzvjc1; Wed,  1 Jul 2020 15:52:10 +0200 (CEST)
Date: Wed, 1 Jul 2020 15:52:09 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: syzkaller on risc-v
Message-ID: <20200701135207.pvypbsf3nxwd2j7h@distanz.ch>
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <CAJ+HfNgzyOfr7gXeg+weLf64HHOWmm2Wug5Oc1OrOJN9ZcR5bQ@mail.gmail.com>
 <CAJ+HfNjOtCvNZpLGoRaxJn7nfx+hW=cwoyveiu-pwhTjp3-avg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ+HfNjOtCvNZpLGoRaxJn7nfx+hW=cwoyveiu-pwhTjp3-avg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_095213_626575_9C2474B0 
X-CRM114-Status: GOOD (  24.89  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Atish Patra <atish.patra@wdc.com>, syzkaller <syzkaller@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-07-01 at 12:43:43 +0200, Bj=F6rn T=F6pel <bjorn.topel@gmail.com> wr=
ote:
> On Wed, 1 Jul 2020 at 12:42, Bj=F6rn T=F6pel <bjorn.topel@gmail.com> wrot=
e:
> >
> > On Tue, 30 Jun 2020 at 15:27, Dmitry Vyukov <dvyukov@google.com> wrote:
> > >
> > > On Tue, Jun 30, 2020 at 3:14 PM Andreas Schwab <schwab@suse.de> wrote:
> > > >
> > > > On Jun 30 2020, Dmitry Vyukov wrote:
> > > >
> > > > > KASAN would be a prerequisite for testing risc-v on syzbot.
> > > >
> > > > You need to implement the GCC support first.
> > >
> > > Interesting. Bj=F6rn claimed KASAN works already.  And there is:
> > >
> > > commit 8ad8b72721d0f07fa02dbe71f901743f9c71c8e6
> > > Author: Nick Hu
> > > Date:   Mon Jan 6 10:38:32 2020 -0800
> > >     riscv: Add KASAN support
> > >
> > > Is there any known issue with gcc?
> > > Did anyone try clang? AddressSanitizer pass in clang is
> > > arch-independent. Not sure about gcc... it looked mostly
> > > arch-independent.
> >
> > Weird. Did a quick bisect (just "does it boot with KASAN or not"
> > test), and this fell out:
> >
> > --
> > efca13989250c3edebaf8fcaa8ca7c966739c65a is the first bad commit
> > commit efca13989250c3edebaf8fcaa8ca7c966739c65a
> > Author: Atish Patra <atish.patra@wdc.com>
> > Date:   Tue Mar 17 18:11:37 2020 -0700
> >
> >     RISC-V: Introduce a new config for SBI v0.1
> >
> >     We now have SBI v0.2 which is more scalable and extendable to handle
> >     future needs for RISC-V supervisor interfaces.
> >
> >     Introduce a new config and move all SBI v0.1 code under that config.
> >     This allows to implement the new replacement SBI extensions cleanly
> >     and remove v0.1 extensions easily in future. Currently, the config
> >     is enabled by default. Once all M-mode software, with v0.1, is no
> >     longer in use, this config option and all relevant code can be easi=
ly
> >     removed.
> >
> >     Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >     Reviewed-by: Anup Patel <anup@brainfault.org>
> >     Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> >
> >  arch/riscv/Kconfig           |   7 +++
> >  arch/riscv/include/asm/sbi.h |   2 +
> >  arch/riscv/kernel/sbi.c      | 132 +++++++++++++++++++++++++++++++++++=
--------
> >  3 files changed, 118 insertions(+), 23 deletions(-)
> > --
> >
> > I'll dig a bit more.
> >
> =

> Oh, forgot one thing; I'm booting the kernel with OpenSBI (OpenSBI
> v0.8-3-gec3e5b14d52a) and not the Berkley loader.

Thanks for the hint regarding OpenSDBI. I just tried it for booting a
kernel built from the riscv for-next branch at commit a2693fe254e7
("RISC-V: Use a local variable instead of smp_processor_id()") with the
following two additional patches:

  https://lore.kernel.org/linux-riscv/20200626124056.29708-1-tklauser@dista=
nz.ch/
  https://lore.kernel.org/linux-riscv/20200627105050.11088-1-tklauser@dista=
nz.ch/

As soon as I enable KASAN (regardless of CONFIG_KCOV being set or not),
it seems to hang after the OpenSBI boot messages, same as when using BBL.

FWIW I sent an update to the syzkaller docs to use OpenSBI instead of
BBL, since that seems to be the recommended way to boot now:

  https://github.com/google/syzkaller/pull/1888

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
