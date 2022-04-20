Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9C3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClZ6efsC5LcifauB4zjP0rM8l6jI2KHvVQVFXQdhzO0=; b=zcMuZNlAAzx0hF
	Wx84RDYEghe32EGx7Ov50oZZ7TwnwtPyFCT1NuBcZRbn85r7FSrYx2DDJLmNY3hjvQnIAR48Rorkj
	FwOyH+PxUMGYwB/LgZ2l5aT25wypPds9HM5IwChCi7q/8Oee8SpAF6cOvbdwjy+3JpalZHS3ByYYo
	uDn8VG1j146eUK/KVmGjsStj+7ROEFlgymfvVPCI0PtjJccxDamLqWt0VrIf/tiW8uF8d2XNCwuOO
	HEmeQCEGo0WUaRxO7TkbgrhjtNEPlgLJKeNXkkTMinMgCUFJ+jAztGCgL8RB9FvhTKQNGqMFT0lUE
	pSlI3igoPCoCegS5RKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhDgF-009oGV-3P; Wed, 20 Apr 2022 16:59:51 +0000
Received: from brightrain.aerifal.cx ([216.12.86.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhDgC-009oD3-4E
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 16:59:49 +0000
Date: Wed, 20 Apr 2022 12:59:37 -0400
From: Rich Felker <dalias@libc.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ebiederm@xmission.com, damien.lemoal@opensource.wdc.com,
 keescook@chromium.org, Niklas.Cassel@wdc.com,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, vapier@gentoo.org, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 gerg@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org, ysato@users.sourceforge.jp
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Message-ID: <20220420165935.GA12207@brightrain.aerifal.cx>
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_095948_339905_148197BE 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, Apr 20, 2022 at 09:17:22AM -0700, Palmer Dabbelt wrote:
> On Wed, 20 Apr 2022 07:58:03 PDT (-0700), ebiederm@xmission.com wrote:
> >
> >In a recent discussion[1] it was reported that the binfmt_flat library
> >support was only ever used on m68k and even on m68k has not been used
> >in a very long time.
> >
> >The structure of binfmt_flat is different from all of the other binfmt
> >implementations becasue of this shared library support and it made
> >life and code review more effort when I refactored the code in fs/exec.c.
> >
> >Since in practice the code is dead remove the binfmt_flat shared libarary
> >support and make maintenance of the code easier.
> >
> >[1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> >Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> >---
> >
> >Can the binfmt_flat folks please verify that the shared library support
> >really isn't used?
> 
> I don't actually know follow the RISC-V flat support, last I heard it was still
> sort of just in limbo (some toolchain/userspace bugs th at needed to be sorted
> out).  Damien would know better, though, he's already on the thread.  I'll
> leave it up to him to ack this one, if you were even looking for anything from
> the RISC-V folks at all (we don't have this in any defconfigs).

For what it's worth, bimfmt_flat (with or without shared library
support) should be simple to implement as a binfmt_misc handler if
anyone needs the old shared library support (or if kernel wanted to
drop it entirely, which I would be in favor of). That's how I handled
old aout binaries I wanted to run after aout was removed: trivial
binfmt_misc loader.

Rich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
