Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CB3C43458
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2026 00:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qM7Z9YhsDozJCcHdtxTvKOX5GJ2cBQXO3Q2rfS983hk=; b=OwBUeFTzj9trUL
	pAuoznHOnAtzA8JPdpBNaYPobKMxPlpHCMdLsCnhj2Um1KmwG0cmmG7oawuzUb4mVdPlR5onoJZeb
	cy/Ot8voY3UUmeCF4gPzo9K6+HT+K3oWRIgCsXnrbmfcpkuQjLkpX2uKl3cf/jpvryTaBczZu65QZ
	BUekRwDWqUpABrGSlCe9KlJOm4r/LScoFLziVKoYgXQl958c/AeBOcn+2ebSmszGQdqagodL/BYek
	VwyWeAMrJSP9yWRDFaWawvEYKRnjteSHH+SumxCPAAeDWxCkaWGHf7srP3UPhGXZyOA6XhFlAIQUq
	1X41Imb5KOL+j0bAhq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfoPU-000000083Ru-3U6Y;
	Sat, 04 Jul 2026 00:39:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfoPT-000000083Rg-0tnl;
	Sat, 04 Jul 2026 00:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tmeyv+yKDLe4sMQPHYRfOsYX6yQ2MKLh3F1KPVmHY7E=; b=OsAtGgpfn2ZZr0zNc4ly0ohzMQ
	Z1saVpSbGF+o9EzTKmnHyHDrG1P94ZdjNxe/AYOxM5ySV4WyAMi5CExkGLqhrGWsyK45WZfXv1apn
	W1x1PEsN80UGsHRRAwiIODsvazzWi3XAygJQe1DUvSE8nsEea3L6Duq1274b1yJOisaPgEAlvTYaH
	Nt5TLyFBGOpqcudWTvSSKo0929jLnRELP+TeHSGdJojjcBA8986JvN6uf4/QU1H6sIJa1hQ3TnePo
	ugM72E4JglvxCjXwU3XF8q9nG36o59d8rFIGxrH10IIPiljDGFd29QxUqaJsMkAjMYeKA21TPfsVN
	tlQYC2dw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfoPQ-0000000B5D1-34RK;
	Sat, 04 Jul 2026 00:39:04 +0000
Date: Sat, 4 Jul 2026 01:39:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <akhWKJSZLfDusVcL@casper.infradead.org>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703022507.187457-1-leon.hwang@linux.dev>
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
> Document the -EINTR return from mmap_write_lock_killable(), fix the

No, you don't understand the whole concept of "killable".  If a
task receives a fatal signal, it dies before it returns to userspace.
So userspace never gets to see the -EINTR.  It's fine to document inside
the kernel that function foo() can return -EINTR, but it's pointless to
document it for userspace.

This is how "killable" differs from "interruptible".  Interruptible allows
non-fatal signals to wake a task, and then the task can see the -EINTR.
But many processes do not check the error code, and so read() and write()
(despite being documented as being able to return EINTR!)  do not do so
in practise.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
