Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C835C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZD7q7o6cP5lrFcr83xnfw0GnbSK5JI+T2WdP5mxhLZQ=; b=nNgNIrVeGgR5TJ
	kfs1hnBvkM3yKYs/93bN8JR3dXmKSu7TUF0cAgXjdqcqWcOCA5Mqy5KcHL6E+mBj9MwOVkh8pc7n8
	Iu07cdp/Bg8+IGz449DmId77xw9m4sSZNQRux3oHSSQ5r3StiBByh4zeFsZjMBFc+EymH56AEUSsq
	goo0mTIIuiAOxj1dKtjekRUahuuuamBfApaPj9LYkSbq8RcEjlzbCko3zSBh02vJ6DqNMZhsZ5wGF
	TBcWTSom9cqHFfciBNIR2QpSWGOoa5FPWZ/Ol8ThukWAswBRa09PPKu3hyR7160FRgo5T2Y3Xa35G
	37JjmST26zlXHPNtKwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0IEK-0011hA-1J;
	Sat, 20 May 2023 08:46:24 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0IEG-0011gd-0z
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 08:46:22 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34K8kA5U027215;
	Sat, 20 May 2023 10:46:10 +0200
Date: Sat, 20 May 2023 10:46:10 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, Palmer Dabbelt <palmer@rivosinc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Message-ID: <20230520084610.GA27206@1wt.eu>
References: <cover.1684425792.git.falcon@tinylab.org>
 <20230519094030.GA24947@1wt.eu>
 <c5140f54-99f2-4d7f-8b53-bd3cd1093727@t-8ch.de>
 <ZGdNHv/QmAGBIYsM@1wt.eu>
 <3ce199ce-d9ca-4aa1-b19d-8e6b9b574300@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ce199ce-d9ca-4aa1-b19d-8e6b9b574300@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_014620_803992_7E95E141 
X-CRM114-Status: GOOD (  25.35  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Sat, May 20, 2023 at 09:18:25AM +0200, Thomas Wei=DFschuh wrote:
> On 2023-05-19 12:19:10+0200, Willy Tarreau wrote:
> > On Fri, May 19, 2023 at 12:11:00PM +0200, Thomas Wei=DFschuh wrote:
> > > Hi Willy,
> > > =

> > > On 2023-05-19 11:40:30+0200, Willy Tarreau wrote:
> > > > Hi Zhangjin,
> > > > =

> > > > On Fri, May 19, 2023 at 01:00:18AM +0800, Zhangjin Wu wrote:
> > > > > Hi, Willy
> > > > > =

> > > > > nolibc for riscv is only tested for rv64 currently (see
> > > > > tools/testing/selftests/nolibc/Makefile), this patchset tries to =
let it
> > > > > compile for rv32, but still not pass the nolibc selftest:
> > > > > =

> > > > > * The first patch uses lw/sw instead of ld/sd for rv32 and verse-=
vice for rv64
> > > > >     * This patch may conflict with the stackprotector patch [1], =
because
> > > > >       both of them changed the _start assembly in arch-riscv.h
> > > > =

> > > > That's quite embarrassing, I'm having to trace of that series here.=
 Now
> > > > I can find it in my LKML archives, but I don't have the direct mess=
age and
> > > > didn't spot the other ones. I'll have to investigate, thanks for no=
tifying
> > > > me! I'm CCing Thomas, I will check with him how to best merge the t=
wo.
> > > =

> > > I think the conflict should be trivial to fix.
> > > =

> > > I can also resend my series or just the single riscv patch.
> > =

> > OK then I'll pick Zhangjin's series and will apply yours on top of it.
> > Do not bother resending the whole series, only the riscv patch will be
> > sufficient, I have the rest of your series in my lkml mbox.
> =

> Could you let me know if or when your are publishing your integration
> branch?

Just finished it now, I had to manually rebase all patches and had to
interrupt it yesterday. You'll find it here:

   https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git 2023=
0520-nolibc-rv32+stkp

It contains a temporary series made of:
  - Zhangjin's RV32 patches
  - your syscall() patch
  - your stkp series except the riscv one

so that you just need to update the riscv one and that will be fine. Be
careful, I have *not* restested the riscv port. As usual, do not hesitate
to le me know if I messed up with anything.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
