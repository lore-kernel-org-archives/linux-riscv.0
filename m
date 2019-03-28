Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C9AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 05:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D652173C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 05:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIdeqjWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D652173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anthonycoulter.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:
	To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fAsZAp3k46D0fvbtFeSTiY8EGSSFG+uQLjE8znFQTvo=; b=mIdeqjWN92k0z0
	KPkbzo+6qE+1XT7Nyt1tLhRpWaw+9ysKgK7PNomzrA2HfgMJ7CYZrYs4fIPxLghihK6zK894cyoY+
	exrTlLC5kvmg4ZV9DXjrILtNZL/KwFSYatrmceLs7iBaIZFzM9VpMIr+XX/ZKjUNP2ANhgUobhSVJ
	DznQm9q8Mf1oQ1hBeQgpAR1fuXivEdHdoYMZkvqwCiVgBShS5nmuq9OHxL8VCxPdB16SRymuF7awf
	Y9s2Z4X5ZW0RcpAyOhbLeZ+AR9l0QXr2UeQIGl7phTaidwx3n47mnyRxV7gKoojhK5apHfL+Hjj8o
	3CqgY6D0l06naaLkZfjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9kEA-0004tA-4q; Fri, 29 Mar 2019 05:38:54 +0000
Received: from raines.redjes.us ([45.32.221.159])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9XAR-0000mH-2E
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 15:42:13 +0000
Received: from localhost (raines.redjes.us [local])
 by raines.redjes.us (OpenSMTPD) with ESMTPA id bd91b4d9;
 Thu, 28 Mar 2019 11:35:29 -0400 (EDT)
Date: Thu, 28 Mar 2019 11:35:29 -0400 (EDT)
From: Anthony Coulter <riscv@anthonycoulter.name>
To: anup@brainfault.org, rppt@linux.ibm.com
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
Message-ID: <eb83e42f53cec3f1@raines.redjes.us>
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_084211_234347_A25C0916 
X-CRM114-Status: GOOD (  17.08  )
X-Mailman-Approved-At: Thu, 28 Mar 2019 22:38:52 -0700
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@anthonycoulter.name, aou@eecs.berkeley.edu, Anup.Patel@wdc.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, Atish.Patra@wdc.com,
 palmer@sifive.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

If your goal is to be able to boot from any 4k-aligned address, then
disallowing boots between PAGE_OFFSET and PAGE_OFSSET + vmlinux_size
seems counterproductive, since there are a lot of 4k-aligned addresses
in that range that are now disallowed. (And worse, the specific range
of disallowed addresses now depends on how large the kernel is, which
makes things awkward. What happens if someone downloads a kernel update
that increases the size of vmlinux to a point where their boot loader
configuration is no longer valid? That would be crazy.)

Note that in order to boot from any 4k-aligned address, you will need
set up trampoline_pg_dir to map a single 4k page. The rule is that the
trampoline page tables can map a single page of whatever size you're
working with, and that page needs to be mapped to the same virtual
address that it will have in the final swapper_pg_dir table. Since
swapper_pg_dir cannot use hugepages, trampoline_pg_dir cannot use a
hugepage either.

But that also means you can't do very much work between enabling the
trampoline page tables and switching over to swapper_pg_dir, because
during that period of time only 4k of memory is mapped. You can't call
any functions that live outside those four kilobytes, nor can you
modify any page tables (because the single page you have must cover the
code in _start, so it can't point to any memory that includes page
tables). So you need to set up both the trampoline and swapper page
tables before enabling either of them. The only complexity you can
postpone by splitting up setup_vm is the initialization of the fixmap
tables.

That said: I think that booting from 4k-aligned addresses is probably
still a pretty simple change, though I *also* have doubts about whether
it is worthwhile.

Why is it simple? Because all you have to do is add one extra level to
each of the trampoline and swapper page tables, and both of these
tables have simple structures. The code proposed in the latest draft
is complicated because the function calls have so many layers of
indirection and not enough attention is paid to using the contiguity
of the page tables to reduce work. But that's accidental complexity;
a more careful implementation would be a lot shorter.

Why is it irrelevant? Because a memory-constrained kernel will want to
drop its .init segment after booting, but the memory that this frees up
will all be at the beginning of the kernel image (and not at the end).

Let's be concrete and talk about the HiFive Unleashed board, on which
RAM starts at address 0x80000000. But the problem is that the Berkeley
Boot Loader gets loaded to 0x80000000, so it has to load the Linux
kernel to the next hugepage, at 0x80200000. Now, if you're short on RAM
you will want your kernel to drop its .init segment, which occupies the
first megabyte (?) of kernel space. (I don't know how large the .init
segment is, but I *do* know from the linker script that it's at the
beginning of memory. Let's call it a megabyte.) So Linux releases its
first megabyte of memory to applications, and now the kernel itself
starts somewhere around 0x8030000.

How is the kernel going to make use of the freed-up space between
0x80200000 and 0x8030000? That's a vm-system problem: somewhere in the
virtual memory code there will be data structures and algorithms that
are smart enough to make use of both the space *before* the kernel
image (i.e. before 0x80300000) and the space *after* the kernel (i.e.
all the space from 0x80200000 to 0x8020000 + vmlinux_size). Surely this
code already exists, because some architectures *do* drop their .init
sections after boot.

But, now, if the virtual memory system is already smart enough to make
use of physical memory that is located before the kernel image, then
there's no harm in booting at 0x80200000 because the virtual memory
system can figure out how to use the gap between the end of the boot
loader and the start of the kernel image. This is true whether the
kernel chooses to drop its .init segment or not, because the point is
that the Linux kernel virtual memory data management system is already
designed to make use of free space from before the kernel image.

So the best way to reclaim wasted space before 0x80200000 is probably
going to be to make your boot loader tell the kernel (via the device
tree) how much space is available between boot_loader_end and
vmlinux_start, and to make sure that this space gets used by the
virtual memory framework.

I'm sorry my email is so long, but I've found that long emails lead to
less confusion than short ones.

Regards,
Anthony Coulter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
