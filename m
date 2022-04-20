Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31720C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7OmPVUQRkNr00ZsW4/5lSqLuTrxhI/NNw027U1JOzY=; b=REW0kBpeED8jVo
	O020DCMBj4vgrDreVhn6G3CV8Tg3i/yagLcg6eeimpwonC8Wm7tdiDjnGaN/y1AXeuqKrhoL51aAh
	DHVofM+4Y3uazM6RCxjzkiMn8V7Al+uwZCq2mAMHWTZBEYXm40GoYNXCDyKZroDM0obEADk5xkMuf
	Lo+nZJV5dEiCgfDp0AKRNSEzRbXXnvQcfO1/RHajeA6J727uaHwnar4/0XZ03ELuoJ+v+q7FHbNzi
	YFBSQuYgjHoLRwRakdbvHtX+HS5QLp1oCiw2txQdbkjKIe66FQBB36JWTHjtf/veFn6Udm027r7qH
	G0YUaovr5N0b4uAdOB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhGrU-00AJOy-SC; Wed, 20 Apr 2022 20:23:40 +0000
Received: from brightrain.aerifal.cx ([216.12.86.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhGrJ-00AJLa-NR
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 20:23:31 +0000
Date: Wed, 20 Apr 2022 16:23:22 -0400
From: Rich Felker <dalias@libc.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Niklas.Cassel@wdc.com, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Mike Frysinger <vapier@gentoo.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Message-ID: <20220420202321.GD7074@brightrain.aerifal.cx>
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx>
 <202204201044.ACFEB0C@keescook>
 <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_132329_908275_0A898426 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Apr 20, 2022 at 10:04:32PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 20, 2022 at 7:47 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Yeah, I was trying to understand why systems were using binfmt_flat and
> > not binfmt_elf, given the mention of elf2flat -- is there really such a
> > large kernel memory footprint savings to be had from removing
> > binfmt_elf?
> 
> I think the main reason for using flat binaries is nommu support on
> m68k, xtensa and risc-v. The regular binfmt_elf support requires
> an MMU, and the elf-fdpic variant is only available for arm and sh
> at this point (the other nommu architectures got removed over time).

I believe I made the elf-fdpic loader so that it's capable of loading
normal non-fdpic elf files on nommu (1bde925d23), unless somebody
broke that. I also seem to recall that capability being added to the
main elf loader later.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
