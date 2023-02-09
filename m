Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD280C636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6eInR4UpzK8hDB5IQIJfSyyLJh/vid5mQAf0Sf3Gdc=; b=wfgJVVPO+1GxYL
	rCV92veRFXLmm/a0AnmIDjo1milJwXSJOyMFpYYktyhoLQgQ8WzMnUiTXvTpIU8RbZGfsrGi0Qx1s
	CmPRO2BbcaKXoPut0wNG+gtePgUnOBW4QeCZfM/4q0cx0c/Sa1BC76DaEN4gP1pwTYzwxu8DlgKVY
	2HKH4tdpBm06PXLTjDHFh3q+RJtbv3vD/psfcrP8cjJOn2K2N6VCjIoL9EUXFzs8Mxrl6mQxMY22f
	pmfEssFZxBSTJGm/zS98qbk/jiOrPMyZhcmUnwzKtRsN0f3tZzUPwZDk/I0rs9hJhYh98NbWh7PLR
	LYTq3a7OgLGmYhHuriSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAU5-002Xe5-UF; Thu, 09 Feb 2023 17:13:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAU2-002Xd6-1R
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 17:13:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 343E8B82274;
	Thu,  9 Feb 2023 17:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56871C4339C;
	Thu,  9 Feb 2023 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675962794;
	bh=Qjd7CG1wm6qgm0UE2g5ksTjdM6XEnqb6bxTuuiklLAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pO7GP6zDrkCIhEnNLY7niim5SelXeyowbFVpOUV0w5Lr07vJ1g5v3axBbIk4Z7NSf
	 Rgkpr3oiJ8vYsgj2GQlYYGE0KUW71EZ/jwfJDa2Bqf1NB2zNQDZklRiDHNoTWOLKgO
	 BLp3EdWvbjLhQmjcP82ujneAdzsu+VQCjxQZAsE8=
Date: Thu, 9 Feb 2023 18:13:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
	vineetg@rivosinc.com, heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>,
	Atish Patra <atishp@rivosinc.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Tobias Klauser <tklauser@distanz.ch>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <Y+UpqHstcMahbadE@kroah.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+HsE397cY4HF+5K@kroah.com>
 <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
 <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_091318_428612_3F9061BE 
X-CRM114-Status: GOOD (  34.88  )
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

On Thu, Feb 09, 2023 at 09:09:16AM -0800, Evan Green wrote:
> On Mon, Feb 6, 2023 at 10:32 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Evan, Greg,
> >
> >
> > On 7 February 2023 06:13:39 GMT, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
> > >> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> > >> system call that quite does this, so let's just provide an arch-specific
> > >> one to probe for hardware capabilities.  This currently just provides
> > >> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> > >> the future.
> > >
> > >Ick, this is exactly what sysfs is designed to export in a sane way.
> > >Why not just use that instead?  The "key" would be the filename, and the
> > >value the value read from the filename.  If the key is not present, the
> > >file is not present and it's obvious what is happening, no fancy parsing
> > >and ABI issues at all.
> >
> > https://lore.kernel.org/linux-riscv/20221201160614.xpomlqq2fzpzfmcm@kamzik/
> >
> > This is the sysfs interface that I mentioned drew
> > suggested on the v1.
> > I think it fits ~perfectly with what Greg is suggesting too.
> 
> Whoops, I'll admit I missed that comment when I reviewed the feedback
> from v1. I spent some time thinking about sysfs. The problem is this
> interface will be needed in places like very early program startup. If
> we're trying to use this in places like the ifunc selector to decide
> which memcpy to use, having to go open and read a fistful of files is
> going to be complex that early, and rough on performance.

How is it going to be any different on "performance" than a syscall?  Or
complex?  It should be almost identical overall as this is all in-ram
and not any real I/o is happening.  You are limited only by the speed of
your cpu.

> Really this is data that would go great in the aux vector, except
> there's probably too much of it to justify preparing and copying into
> every new process. You could point the aux vector into a vDSO data
> area. This has the advantage of great performance and no syscall, but
> has the disadvantages of making that data ABI, and requiring it all to
> be known up front (eg the kernel can't compute any answers on the
> fly).
> 
> After discussions with Palmer, my plan for the next version is to move
> this into a vDSO function plus a syscall. Private vDSO data will be
> prepped with common answers for the "all CPUs" case, avoiding the need
> for a syscall in most cases and making this fast. Since the data is
> hidden behind the vdso function, it's not ABI, which is a plus. Then
> the vdso function can fall back to the syscall for cases with exotic
> CPU masks or keys that are unknown/expensive to compute at runtime.

I still think that's wrong, as you are wanting a set of key/values here,
which is exactly what sysfs is designed for.

Please benchmark this first.  Heck, if you don't like the
open/read/close syscall overhead, use my readfile() syscall patch that I
keep proposing every 6 months or so to remove that overhead.  That would
be a good reason to get that code accepted finally :)

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
