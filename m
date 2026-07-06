Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37786C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 01:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNqvYlNNxgdeC2TIuse1UV5QhHBOpIGZ1n0zBxzTOlc=; b=VW0CbEhL/wvqkf
	KM5PSRAyWaQ7J9XCGWpEsy1W0vTcBGSKkXgcHr2D+4Cq8VB+63rFksvJyxqc6g2jtPQQ5HU3CXLgy
	04LOZuIFBT2OtOn2afdOtXgiJWMaA9Bg+gZGSCY0qIwjFuHXsCPk+31v8RHFeQ6BwPDJeIoH49qzj
	3lL4ke4wBQxn1YunEJ1JwrMwjF7WxeewIUg/eXteEz6jKqxsRbAOl8pYCC5nB5DUJcmlEvOHCpXAw
	QK4KiQM9Q+dOYtpfG5zYkTCqkb3+rb/LuJlcIaLwWynT4YR51hIm0G6Qs+JJyXWHnF0ZBtSJ1OR30
	ILZgEb+8hZeyfpI/fHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYMN-0000000BK2q-31c2;
	Mon, 06 Jul 2026 01:42:59 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYMJ-0000000BJvU-1xca
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 01:42:57 +0000
Message-ID: <b10aeafe-3263-4683-b318-2afd498c927d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783302168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fs3PDk+ICzT5JmREAjpkl1+i96EjXK1gwBqdT/2GxVA=;
	b=X6HU2VVf9Rmd+xYkCimrMRYONFxHlj1FLzMdWaDQIJ4CIisKe6O4ebHBhIO8xFtEpzsw1V
	if9clW5afwlt64H2wgInX7C2clZrNM4KB9RbhlwJBI4/bl5XISTBr2BGjRLv8fXIxd6+qZ
	HNfDAc3wBC6KybvkkcQAmn7/fpWtHpI=
Date: Mon, 6 Jul 2026 09:42:36 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <akhWKJSZLfDusVcL@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <akhWKJSZLfDusVcL@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_184256_005085_AA34783E 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/7/26 08:39, Matthew Wilcox wrote:
> On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>> Document the -EINTR return from mmap_write_lock_killable(), fix the
> 
> No, you don't understand the whole concept of "killable".  If a
> task receives a fatal signal, it dies before it returns to userspace.
> So userspace never gets to see the -EINTR.  It's fine to document inside
> the kernel that function foo() can return -EINTR, but it's pointless to
> document it for userspace.
> 
> This is how "killable" differs from "interruptible".  Interruptible allows
> non-fatal signals to wake a task, and then the task can see the -EINTR.
> But many processes do not check the error code, and so read() and write()
> (despite being documented as being able to return EINTR!)  do not do so
> in practise.


Thanks for your explanation.

Will drop the -EINTR documentation change from mseal.rst.

Thanks,
Leon


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
