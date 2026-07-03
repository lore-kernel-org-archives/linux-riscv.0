Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1E6C43602
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94Wjzn9uHzZO86mBbpYbcnz52qjcoNJUtk8AZT6Bwn8=; b=AmuMdqZ0uo4EKw
	wdTRvvLWuhx0p6o7oucwgqO+1elbJCGAyXtNo/nU4aZvoIftthPfYxksFj1cVA9SLs5yfUU1J+9XL
	RkNsDfsp6TrcPIXTKh+AeUYbpufcq/ZjowlarD/1lhhYvO+/8SKNh878go/RetQHiyhLn7saKy9NH
	HmCOg6Hl2XyrgQ0RCTYUw58JHi+CVjQHwKeC61iv3L+XjnsBDijemWKXhK6JHSf3abE4ruS8EByWw
	UCfXoJlSNbMF3oKfe+4Fexxvi/OhUd6xpf+f9chznlvJGuy+nVpREUO8+Ka/g/6IEh/O+UeGFggrb
	ZWthetTW6Ua/bLfZ8tZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaEd-00000006UIj-3i87;
	Fri, 03 Jul 2026 09:30:59 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaEZ-00000006UIE-3K7o
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:30:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783071042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xuj4UnMGsBwq1kBf1xI+PfS24Rf5Ofr+yXc48b8F1fE=;
	b=i2YS9x+oI5i8+MyTYtWwOYkr6wUeX4fu1pD0OLDQjFM8j8c1uzq6HpnDniVQGTpplZC07A
	Ga9w6Xvf9t8tN7PxQoaSkIkLf1VeSqB27A7LBxT7+Yz7KjMYNTToXx87Xu35l19yF+qAXi
	PrEr8oKBtNF8V6/Xlzz8crHEoXjywr8=
From: Lance Yang <lance.yang@linux.dev>
To: leon.hwang@linux.dev
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Date: Fri,  3 Jul 2026 17:30:32 +0800
Message-Id: <20260703093032.51640-1-lance.yang@linux.dev>
In-Reply-To: <20260703022507.187457-1-leon.hwang@linux.dev>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_023055_991492_8F128230 
X-CRM114-Status: UNSURE (   3.74  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, gary@garyguo.net, linux-riscv@lists.infradead.org, vbabka@kernel.org, thomas.weissschuh@linutronix.de, corbet@lwn.net, aliceryhl@google.com, ojeda@kernel.org, aou@eecs.berkeley.edu, jannh@google.com, nathan@kernel.org, skhan@linuxfoundation.org, pfalcato@suse.de, ljs@kernel.org, akpm@linux-foundation.org, alex@ghiti.fr, liam@infradead.org, nsc@kernel.org, rdunlap@infradead.org, dianders@chromium.org, Lance Yang <lance.yang@linux.dev>, palmer@dabbelt.com, tglx@kernel.org, pjw@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
>to sys_ni_syscall() and return -ENOSYS rather than -EPERM.
>
>Document the -EINTR return from mmap_write_lock_killable(), fix the
>CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
>terms of VM_SEALED_SYSMAP.
>
>Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>---

Thanks, free free to add:

Acked-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
