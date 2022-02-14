Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F7DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDvACga72F+NvScurZi9p7OcL+4SKaue6Lg3tWROvn4=; b=IK2AFVhnW8kmU9
	dzc3y+S0tgDs5zQe/jcMrCKRW3k6IkJt9dL2dwlYv7x5K+qKkivkI07amaO58yQ86Zh6ZT+bmB+La
	SLkM3P7K3enCNSj4H+27I1NumBZ+BVeYkSCwE79jSpH4OXho0cHarUxOoWjHWnc9CB4GvUjStaQUz
	VnPYbwikJn1tAQsFca6B6RpC3WWj57v0qELfR6WMQRCuyYRZ1UsY5lWYwItqJMNnjNlm+he4EJb/X
	UWoMtInOFK/eXrMwQt35thPtDYqjZE8pX4IiD9HCfqTGYlavgJjaCXILZ8uGhKRTKDWAA24++VbPl
	j7LjgVc02WphM0K5zXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbyq-00FZiA-6t; Mon, 14 Feb 2022 14:05:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbyl-00FZfH-35
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 14:05:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7758B80E67
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 14:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA2FC340EE
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 14:05:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bUqw6ue4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1644847519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLgXSQB9b7XXmln9u8fQm/jVMLmkRr2wWxHA9OmWt1Q=;
 b=bUqw6ue42avgTupnGw+h3faOhezXLsRWTERXCZkTjiWU3EWGaqVZsPu+EWoU5dYsEG+yLv
 +R8ELL3RtI+O5xzed/w6dCHENmSJY17DIsFCz4wh50dQ8yEejNWROH1hC18dE+D/kbmxlB
 0GQjkMV/rWNUQPZtVmTX+sAiVbwU9yg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51e2fa2d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <linux-riscv@lists.infradead.org>;
 Mon, 14 Feb 2022 14:05:18 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id y129so46350154ybe.7
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 06:05:16 -0800 (PST)
X-Gm-Message-State: AOAM532XOraLLEyumv+1tzi3WZzeFOqqBAootjNBGuinRqX/aYmwUby5
 HLsgfgw3++yZYvQLBTF/stWMF8T0T+6jGZosnio=
X-Google-Smtp-Source: ABdhPJx1rAQYW+BsQ/vOucuTQJhI9pVZ01yF0DPyTFL1e5L2Bmfiie7EtWck0pGXAqYbtpOZPqa2kzjO14vEvrtdV/A=
X-Received: by 2002:a25:4144:: with SMTP id o65mr12095580yba.113.1644847514782; 
 Mon, 14 Feb 2022 06:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
In-Reply-To: <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 14 Feb 2022 15:05:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
Message-ID: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To: Joshua Kinard <kumba@gentoo.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Theodore Ts'o" <tytso@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_060523_316514_63B73A2B 
X-CRM114-Status: GOOD (  16.40  )
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

Hi Joshua,

Thanks a lot for the historical background.

On Sun, Feb 13, 2022 at 12:06 AM Joshua Kinard <kumba@gentoo.org> wrote:
> The R6000/R6000A CPU only ever existed in systems in the late 1980's that
> were fairly large, and I don't think there is a complete, working unit out
> there that can actually boot up, let alone boot a Linux kernel.

So from what you've written, it sounds like MIPS is actually not a problem here.

So the only systems we're actually talking about without a good cycle
counter are non-Amiga m68k? If so, that'd be a pretty terrific
finding. It'd mean that this idea can move forward, and we only need
to worry about some m68k museum pieces with misconfigured
userspaces...

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
