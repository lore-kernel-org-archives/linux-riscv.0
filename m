Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F19C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zw8eXphq9lzRIZd7QxUcXELLA3yAPwwj3qj9Hl1Wkpg=; b=lWNLy52AYdC51n
	3/1o4SHNt2SABXrcbrGfeXch9DuyUQvmgbMcs3uQgkCQKiu/KPr/UCtwx2cdjubCE0qhF64bEPhWd
	U4bufg9YaofW4Bewgrz43yVFi2Vah2cSSmNaVXKjOy0dOEIkJ0ZtwBoTPaLTJ9s1OmyXbAFEX1LL5
	A1OrEtB7xy2yVeGfACtV/zgkcuOyxvJs0tgIcS0tNHw+o+IJmezM1RxNPwX5WmzEiO13JKZ/5yPiG
	VOpzE1NpyVx1iNBtfOwVL+mgb7pnlmzrK40uCgIX25xCtS4OHl7nQgpHGZA9TSx85pcdpba5fxj+P
	xOjdr4pMTS4tcW1MI0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhW9n-00DRAa-UC; Thu, 21 Apr 2022 12:43:35 +0000
Received: from brightrain.aerifal.cx ([216.12.86.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhW9l-00DR8I-1u
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 12:43:34 +0000
Date: Thu, 21 Apr 2022 08:43:26 -0400
From: Rich Felker <dalias@libc.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Message-ID: <20220421124326.GG7074@brightrain.aerifal.cx>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org>
 <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
 <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_054333_246114_18658CFA 
X-CRM114-Status: GOOD (  27.38  )
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

On Thu, Apr 21, 2022 at 08:52:59AM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 21, 2022 at 1:53 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> > On 21/4/22 00:58, Eric W. Biederman wrote:
> > > In a recent discussion[1] it was reported that the binfmt_flat library
> > > support was only ever used on m68k and even on m68k has not been used
> > > in a very long time.
> > >
> > > The structure of binfmt_flat is different from all of the other binfmt
> > > implementations becasue of this shared library support and it made
> > > life and code review more effort when I refactored the code in fs/exec.c.
> > >
> > > Since in practice the code is dead remove the binfmt_flat shared libarary
> > > support and make maintenance of the code easier.
> > >
> > > [1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > > Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > > ---
> > >
> > > Can the binfmt_flat folks please verify that the shared library support
> > > really isn't used?
> >
> > I can definitely confirm I don't use it on m68k. And I don't know of
> > anyone that has used it in many years.
> >
> >
> > > Was binfmt_flat being enabled on arm and sh the mistake it looks like?
> 
> I think the question was intended to be
> 
>     Was *binfmt_flat_shared_flat* being enabled on arm and sh the
>     mistake it looks like?

Early in my work on j2, I tried to research the history of shared flat
support on sh, and it turned out the mainline tooling never even
supported it, and the out-of-line tooling I eventually found was using
all sorts of wrong conditionals for how it did the linking and elf2flt
conversion, e.g. mere presence of any PIC-like relocation in any file
made it assume the whole program was PIC-compatible. There's no way
that stuf was ever used in any meaningful way. It just didn't work.

Quickly dropped that and got plain ELF (no shared text/xip, but no
worse than the existing flat support) working, and soon after, FDPIC.

The whole binfmt_flat ecosystem is a mess with no good reason to
exist.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
