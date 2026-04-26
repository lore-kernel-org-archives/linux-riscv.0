Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC318FF885D
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Apr 2026 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tnSH1pB+QWR6MDR0Fwz7Vos0N9JGUXPtJy1Ws4HSq8=; b=goLMb0v3lwYNd5
	b8Bm5qP20Y7vEM8KUMSaajBNi4a+FrR4AIpuS0b/G9PJJr0wxCSgCej6wJjcfVKxghxTaEz69gvav
	Gic4HuOGdcruAlTw83EhtovhYchicB/c9CSFTmw+xkxCLxIR7y+gzpysKwMI3rn4V4uZh4MFRxG3+
	2g7BED4ePk5hiyINEs6A0HkuzI16f3xFQaFH0JxwCWOCzx3rhxwHSgx/O9pbtteIWTBZ02Emi1dsy
	MIwip1ynuF3AdJuc8MsbLzdJ06Z2Skx4dg/iTnsDMTF4tpZzlvnCPz140zBjyx+Dg0kXpEMf6ln7J
	uZw8u/wyMG6XHHRyRrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGyU4-0000000FXSD-33hO;
	Sun, 26 Apr 2026 12:21:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGyU1-0000000FXRi-41j2
	for linux-riscv@lists.infradead.org;
	Sun, 26 Apr 2026 12:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=045nMfVZbPU9T3swkBuoxApzDz8BfdAaxEnKeY7QH1s=; b=HC7lSSSyrXVLQKdOdYHjXZYBiN
	ZjLmvHgjFYqLfbxwIUBWECzBvSd5pjQ/z5nmMjmRIcTfzKQzw2KUOqHkkteL0nWizfQKEkvac+ldc
	vSHpjIeyqb8MQF+6q+jMGvhwyaiqasuLVC2o1ILg8iBQ9xHU1S+n5MLejbxxCVFJOyxe8DQ/XsM14
	NY2Z2Vft0pMgWOlWFaRLaXi6MhltizF5KPhWp6trH8BQKeIw8UjtuYmNPyyGKTXU4W/g/Js4VcDlt
	DN0EJWqIv1xBPUX+HVEVJjUlC+EumRRXpBgoeXMeSwdkaU36jo4WMfU0ADRuCKGjGDjvst2mD577S
	NrtZQGMw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wGyTm-00000003vnN-3Le1;
	Sun, 26 Apr 2026 14:20:54 +0200
Date: Sun, 26 Apr 2026 14:20:54 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
Message-ID: <ae4DJnPhTNZzah4p@aurel32.net>
Mail-Followup-To: Anand Moon <linux.amoon@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
 <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
 <aeqF0EiP4b2Ycj2G@aurel32.net>
 <CANAwSgR-rJ0O9SJc92z05NVez6ZSfn9Gx8fJr3Be3QfCpR_XBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgR-rJ0O9SJc92z05NVez6ZSfn9Gx8fJr3Be3QfCpR_XBA@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_052110_005419_F8AD93EA 
X-CRM114-Status: GOOD (  27.25  )
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

Hi Anand,

On 2026-04-25 23:12, Anand Moon wrote:
> Hi All,
> 
> On Fri, 24 Apr 2026 at 02:21, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >
> > Hi,
> >
> > On 2026-03-16 08:19, Samuel Holland wrote:
> > > Hi Troy,
> > >
> > > On 2026-03-16 2:23 AM, Troy Mitchell wrote:
> > > >> I think the reason we ended up with the "unsafe" implementations of the
> > > >> reboot/shutdown functions is that on the backend it is usually SBI SRST
> > > >> calls, which can protect itself from other CPUs and interrupts. Since on
> > > >> K1 we're going to be poking I2C directly, we run into the problem
> > > >> described above. So all of these should disable interrupts and stop
> > > >> other CPUs before calling the handlers, and can't assume the handlers
> > > >> are all SBI SRST.
> > > > Yes, we cannot assume that all platforms rely on this.
> > >
> > > Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
> > > directly causes problems if you ever want to run another supervisor domain (for
> > > example a TEE or EFI runtime services), which may need to clean up before a
> > > system reset.
> > >
> > > As you mention, other platforms use the standard SBI SRST interface, event if
> > > they need to poke a PMIC to perform a system reset. Is there something
> > > preventing K1 from following this path?
> >
> > I went this path and submitted a patchset to OpenSBI mailing list doing
> > that:
> > https://lore.kernel.org/opensbi/20260419150857.2705843-1-aurelien@aurel32.net/T/#t
> >
> I just wanted to check if we can use the latest OpenSBI image with
> vendor u-boot ?
> If so, can you share the details of flash the u-boot and OpenSBI binaries? .

That is a good question, and no this doesn't work out of the box.
 
> I was working on the watchdog driver, and the system hangs at reboot
> So, what changes do we need to make in OpenSBI to handle this issue?

This can be addressed either by making OpenSBI compatible with the 
vendor U-Boot, or by making the vendor U-Boot compatible with the 
upstream OpenSBI. On my side, I prefer the latter option as it also 
keeps the upstream OpenSBI compatible with the (future) upstream U-Boot.

I have just published a blog post about how to do that: 
https://blog.aurel32.net/upstream-opensbi-spacemit-k1.html

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
