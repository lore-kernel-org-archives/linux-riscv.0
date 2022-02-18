Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8389EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/Da/ar6c7x9bKfGW91/QAFPBu+Ll+mvnWDDLURYbIo=; b=zp2go45eqeYsek
	spmxZDSvLX8IHH6135nXCflGL2ER4EGyvAwlzVVHHtuHMYGtd8M5h282AJdg7jMnXR+zRTyJDdcW4
	DnH8DkJErO5G+VPTJLP01NHj/5P7RH0vy2ZYVhAH/zpBY1WrfD7c0CmAcgYwjbZCQaxiXH3/uCqJs
	nn0fLiqiZxGaXjr/MmoxWm8DYmA6cDlXovxN9Qbzi0+bZucLRXu9rnRt5fwpjHerz/uMdnO8ZNydo
	LK/rxpjJ4YiQ/gu1LXxBpJTr4RVUtT4pibWfpgawkKg4HO03aNE3ZBD8U4aUKQiakXtzwLty5icpc
	1/BvioBu9dax+m6Ze+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL7fA-00FShT-96; Fri, 18 Feb 2022 18:07:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL7f6-00FSeb-Ou
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 18:07:23 +0000
Received: by mail-ed1-x533.google.com with SMTP id z22so16854689edd.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=5c/qRto3YK3Y6/Rhnnpp4RzKmf8QhiKseObhkqXIpnLfhpnv2ua8Z7YCExbmjSYUCG
 SbBSycxSpm4FRe5zOaxst92xyRDLRie0B4d4p8x0W6snNr+dG6MghxLfcakTWMQA17Pf
 gOp7JS9gIpdJumtDaMv9IluyX8dB5LI5eLR/YC2U+D7T5N3aQr9NOYHAOP982E02xanw
 SC1uTLhbyKEp3+LiMa1bFSquyveVGLxTCPf/eSvmTiEZzxEI+wIe4AMdv5VgRD2GYf6G
 kO3gnVVxKK1wWuKxjcQ5nhLyDgmj/c1nxTJoqfRQTmuVCBNlEZ4IpVOo74LURbiOVsEg
 CBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=MMR1xORfqtvdZB4msSQ7YrPB0ZgkjzjjM4ZcCDO5keQRXTlTF2I4+jVNHyQwEj0g1z
 QgsANnkoILrQNIaTShk9VYEZdvGjP5ZsiP2CUR5+H+fA7sX/Lz6S5HeWVcwFbx4DEfet
 YKW7UITpvPmFf//xqy7YIpEq6Ic1XlrVn4xfRNzXikgSR8VKNEnI3C9hECzX4urJBGiJ
 Wvfg1z1HK6YErlkSSBa0JJa7AuXBNTJrD/BRNoXhpXUa6iOOR8E1QiKCVcJSfEPo1aKN
 x8X/PkVkB9HbAsiG8knly3A3V94NnOOn2se4C3wHEogEpXUTxygnYqlHBxJGiwR4EBJ1
 eSEg==
X-Gm-Message-State: AOAM533Llkfr4nQq7IXbxO0EYYHyQvEW7ymu51K6PTbqgl0Dq9A4UHJC
 MY8ffukxknPkJcpMJOV/4e4VTw9+hywrfBol5qDgaA==
X-Google-Smtp-Source: ABdhPJzKi9/dAquBFvy+ZlpESpcVBT1I3X4XtLJClo2SaEqFpqb8kdqwnL9Fphl8e/qcsjqeDfp/tX4JIrAspWajnck=
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr9386454edc.438.1645207638871; Fri, 18
 Feb 2022 10:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
 <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
In-Reply-To: <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 18 Feb 2022 10:07:07 -0800
Message-ID: <CALCETrWTB65vJXsQTPd_o7BRoSU=uqD0pFzKS+r4YgDuiCCqaQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
 "will@kernel.org" <will@kernel.org>, "guoren@kernel.org" <guoren@kernel.org>, 
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, 
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, 
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>, 
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "shorne@gmail.com" <shorne@gmail.com>, "deller@gmx.de" <deller@gmx.de>, 
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "peterz@infradead.org" <peterz@infradead.org>, 
 "mingo@redhat.com" <mingo@redhat.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, 
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "dalias@libc.org" <dalias@libc.org>, 
 "davem@davemloft.net" <davem@davemloft.net>, "richard@nod.at" <richard@nod.at>,
 "x86@kernel.org" <x86@kernel.org>, 
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ardb@kernel.org" <ardb@kernel.org>, 
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, 
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_100720_916511_42387794 
X-CRM114-Status: GOOD (  23.71  )
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

On Fri, Feb 18, 2022 at 1:30 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Andy Lutomirski
> > Sent: 17 February 2022 19:15
> ...
> > This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
> > constant that has a very specific value to work around a bug^Wdesign
> > error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
> > which userspace is permitted to allocate memory, but there is a huge
> > gap between user and kernel addresses, and any value in the gap would
> > be adequate for the comparison.  If we wanted to optimize this, simply
> > checking the high bit (which x86 can do without any immediate
> > constants at all) would be sufficient and, for an access known to fit
> > in 32 bits, one could get even fancier and completely ignore the size
> > of the access.  (For accesses not known to fit in 32 bits, I suspect
> > some creativity could still come up with a construction that's
> > substantially faster than the one in your patch.)
> >
> > So there's plenty of room for optimization here.
> >
> > (This is not in any respect a NAK -- it's just an observation that
> > this could be even better.)
>
> For 64bit arch that use the top bit to separate user/kernel
> you can test '(addr | size) >> 62)'.
> The compiler optimises out constant sizes.
>
> This has all been mentioned a lot of times.
> You do get different fault types.
>
> OTOH an explicit check for constant size (less than something big)
> can use the cheaper test of the sign bit.
> Big constant sizes could be compile time errors.

The different fault type issue may well be a real problem.  Right now
the core x86 fault code reserves the right to grouch if we get #GP
instead of #PF.  We could change that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
