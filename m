Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85276C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCKFF6l1UcbcgbHW/+akL3MCUei9cBJoKc7+KAt57p4=; b=GwBLLUgT89ujms
	S1wEPlk7Az1HqUjGQsgk3G3hD/S8d3aGPLUX4fRkwO3C97CorH9itGZYNP/AX8cohDIiVZNqM97Xb
	fWCuT+Uo2hfHdAxcKgNtfNZ03rCPnd2EPOeCYroc2bw9uXAQiHsdf8SHj65sBAmKp19KWRP0zZj+n
	gHJuE/DOSu4p07F5uCQkX7wE3et7O0laefRBhxyAA3VAapAenfNowuPC3Xux9LDjfW+sXoTKu+QW5
	cIleuCqi7GBm6/U/1gmem/0gQ+ZTbFA6SKoZUokWTxap4CrQrynThg59ArLCk7ZWxuTkQWtt4ILR9
	vCTI8ow4ZIF7GRaea9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7I9Y-009pXv-3C;
	Thu, 08 Jun 2023 16:06:24 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7I9V-009pWr-2i
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 16:06:23 +0000
Date: Thu, 8 Jun 2023 18:06:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1686240377; bh=PLbGY4orS7r/OO9ChDGkyjxNSJlc51OFBzDXVDH4Ii4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgZCtK5CqJi7+kGUwNDw+NV2XHBX6YW+VlVYYRIh7g472vEfThJkLzBg7zz6OQz9q
	 1REcTFqGgqztBtkaxjzSA+u+UUQNllwVj0yL2elkwYkZ0Gndk6DuLrBtvjfdIHkOsO
	 FRLX/2O510m2f9t3t7X2D97I+/nQi4JqlRJ0y4SM=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: David Laight <David.Laight@aculab.com>
Cc: 'Zhangjin Wu' <falcon@tinylab.org>, "w@1wt.eu" <w@1wt.eu>, 
	"arnd@arndb.de" <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and
 __sysret() helpers
Message-ID: <9edb16b4-0d3f-4355-a7b1-684a28f9b4cb@t-8ch.de>
References: <cover.1686036862.git.falcon@tinylab.org>
 <a42fb9e1bbe0daf7d8a48ea8f44135ef851030d7.1686036862.git.falcon@tinylab.org>
 <94dd5170929f454fbc0a10a2eb3b108d@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94dd5170929f454fbc0a10a2eb3b108d@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_090622_058918_4B75CFD8 
X-CRM114-Status: GOOD (  16.72  )
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

Hi David,

On 2023-06-08 14:35:49+0000, David Laight wrote:
> From: Zhangjin Wu
> > Sent: 06 June 2023 09:10
> > 
> > most of the library routines share the same code model, let's add two
> > helpers to simplify the coding and shrink the code lines too.
> > 
> ...
> > +/* Syscall return helper, set errno as -ret when ret < 0 */
> > +static inline __attribute__((always_inline)) long __sysret(long ret)
> > +{
> > +	if (ret < 0) {
> > +		SET_ERRNO(-ret);
> > +		ret = -1;
> > +	}
> > +	return ret;
> > +}
> 
> If that right?
> I thought that that only the first few (1024?) negative values
> got used as errno values.
> 
> Do all Linux architectures even use negatives for error?
> I thought at least some used the carry flag.
> (It is the historic method of indicating a system call failure.)

I guess you are thinking about the architectures native systemcall ABI.

In nolibc these are abstracted away in the architecture-specific
assembly wrappers: my_syscall0 to my_syscall6.
(A good example would be arch-mips.h)

These normalize the architecture systemcall ABI to negative errornumbers
which then are returned from the sys_* wrapper functions.

The sys_* wrapper functions in turn are used by the libc function which
translate the negative error number to the libc-style
"return -1 and set errno" mechanism.
At this point the new __sysret function is used.

Returning negative error numbers in between has the advantage that it
can be used without having to set up a global/threadlocal errno
variable.

In hope this helped,
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
