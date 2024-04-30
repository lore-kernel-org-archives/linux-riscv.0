Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5FEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ik/0hq6hFiEz8n5HfDnEc1HZ5swqawzE21x+9rvyQXw=; b=DVHRlgHbOmwDXo
	6p738Zr5U6oTzC9QbE3NnCBvyldDoNBYW4NDtew53NYiSXj/bZ100YRfa4MCLrCqIJ75obB3vGHQ/
	YnEzkTePXwN8whKmYXayFHPaDBR8TDChsezQiEsCBEp47lk/6Pw+4vx28LcpR1gXP5V2U46YfGuqh
	/Oe5+qUfoJLAtHsmyfSanqvyg29LwWcFpzaIQKjPYm0pQJCM4qx8FiwhxgnsRqT0o9dMQj1sHY+rY
	BfOmOmYeOUODppGiNp1H+MwYpKDM/tbij2OD5UW/qQfkB9tfxG5rwnvUdNC+GsBQ8Od8udfNvwn25
	au5oIRLmPgb5j/mYpteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hxp-00000005Rvf-1l6L;
	Tue, 30 Apr 2024 07:31:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hxQ-00000005Rlh-1dZw
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 07:31:27 +0000
Date: Tue, 30 Apr 2024 09:31:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1714462275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqrYzQE/eh5FY4RgzTW10+8t5SwsCC9zr0+QvqJHjrc=;
	b=gZj4YxjG906AKACZuGLWmHr5AMq85uWqbLLVO7IobnuUbSLwcu+Ja6ppeFHLMasAnVIg7D
	RV/Hyn3blm+ooOu7eTVMrwnNq8Kejn5d9fceqS6uhC2RMTfZCFjX67nm4vTY47TLf4OOvY
	VmWXIk6Bbp7pKw3TH9Ind5RYBx2YLK69fYTXZqhVNdoW60WJjCx54pno+VtfWUa0GE8a44
	Dh4dmkmzbwdXh96opJ9qVU0xra/rYoqmwmXgM3dg2PQDUxd4aDCaOAgT5d8C7TUYp/371r
	X8zLAQAehJX7TQC3+0Bj9IetHM5Fy9hH6NIIS07dsNCpSlr8CLE2kTwkAJe45g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1714462275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqrYzQE/eh5FY4RgzTW10+8t5SwsCC9zr0+QvqJHjrc=;
	b=8AdA6xDHGkSuRiD6v8behqV1g2AbTjtevYIkGQ44lTzvNa3hHHgrj18SkOJt4ZoW9u8BJR
	tAsH9vf3SHlsL8CQ==
From: Nam Cao <namcao@linutronix.de>
To: Joel Granados <j.granados@samsung.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andreas Dilger <adilger@dilger.ca>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"ndesaulniers @ google . com" <ndesaulniers@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tejun Heo <tj@kernel.org>,
	Krister Johansen <kjlx@templeofstupid.com>,
	Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240430073056.bEG4-yk8@linutronix.de>
References: <20240418102943.180510-1-namcao@linutronix.de>
 <CGME20240429125236eucas1p24219f2d332e0267794a2f87dea9f39c4@eucas1p2.samsung.com>
 <20240429125230.s5pbeye24iw5aurz@joelS2.panther.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429125230.s5pbeye24iw5aurz@joelS2.panther.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_003120_824536_0B899F89 
X-CRM114-Status: GOOD (  37.63  )
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

On Mon, Apr 29, 2024 at 02:52:30PM +0200, Joel Granados wrote:
> On Thu, Apr 18, 2024 at 12:29:43PM +0200, Nam Cao wrote:
> > There is nothing preventing kernel memory allocators from allocating a
> > page that overlaps with PTR_ERR(), except for architecture-specific
> > code that setup memblock.
> > 
> > It was discovered that RISCV architecture doesn't setup memblock
> > corectly, leading to a page overlapping with PTR_ERR() being allocated,
> > and subsequently crashing the kernel (link in Close: )
> > 
> > The reported crash has nothing to do with PTR_ERR(): the last page
> > (at address 0xfffff000) being allocated leads to an unexpected
> > arithmetic overflow in ext4; but still, this page shouldn't be
> > allocated in the first place.
> > 
> > Because PTR_ERR() is an architecture-independent thing, we shouldn't
> > ask every single architecture to set this up. There may be other
> > architectures beside RISCV that have the same problem.
> > 
> > Fix this one and for all by reserving the physical memory page that
> > may be mapped to the last virtual memory page as part of low memory.
> > 
> > Unfortunately, this means if there is actual memory at this reserved
> > location, that memory will become inaccessible. However, if this page
> > is not reserved, it can only be accessed as high memory, so this
> > doesn't matter if high memory is not supported. Even if high memory is
> > supported, it is still only one page.
> > 
> > Closes: https://lore.kernel.org/linux-riscv/878r1ibpdn.fsf@all.your.base.are.belong.to.us
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Cc: <stable@vger.kernel.org> # all versions
> > ---
> >  init/main.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/init/main.c b/init/main.c
> > index 881f6230ee59..f8d2793c4641 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -900,6 +900,7 @@ void start_kernel(void)
> >  	page_address_init();
> >  	pr_notice("%s", linux_banner);
> >  	early_security_init();
> > +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE); /* reserve last page for ERR_PTR */
> >  	setup_arch(&command_line);
> >  	setup_boot_config();
> >  	setup_command_line(command_line);
> > -- 
> > 2.39.2
> > 
> 
> I received a similar(ish) report recently
> https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com/
> regarding RISC-V in init/mail.c. Here is the meat of the report in case
> you want to avoid going to the actual link:

This issue doesn't look like it has anything to do with this patch: this
patch is about overlapping of dynamically allocated memory, while I think
the issue is about overlapping sections during linking (maybe something
wrong with riscv linker script?)

Also, FWIW, this patch is not going to be in mainline because of a
regression.

Nonetheless, I will have a look at this later.

Best regards,
Nam

> "
> ...
>    riscv64-linux-ld: section .data LMA [000000000099b000,0000000001424de7] overlaps section .text LMA [0000000000104040,000000000213c543]
>    riscv64-linux-ld: section .data..percpu LMA [00000000024e2000,00000000026b46e7] overlaps section .rodata LMA [000000000213c580,000000000292d0dd]
>    riscv64-linux-ld: section .rodata VMA [ffffffff8213c580,ffffffff8292d0dd] overlaps section .data VMA [ffffffff82000000,ffffffff82a89de7]
>    init/main.o: in function `rdinit_setup':
> >> init/main.c:613:(.init.text+0x358): relocation truncated to fit: R_RISCV_GPREL_I against symbol `__setup_start' defined in .init.rodata section in .tmp_vmlinux.kallsyms1
>    net/ipv4/ipconfig.o: in function `ic_dhcp_init_options':
>    net/ipv4/ipconfig.c:682:(.init.text+0x9b4): relocation truncated to fit: R_RISCV_GPREL_I against `ic_bootp_cookie'
>    net/sunrpc/auth_gss/gss_krb5_mech.o: in function `gss_krb5_prepare_enctype_priority_list':
> >> net/sunrpc/auth_gss/gss_krb5_mech.c:213:(.text.gss_krb5_prepare_enctype_priority_list+0x9c): relocation truncated to fit: R_RISCV_GPREL_I against `gss_krb5_enctypes.0'
>    lib/maple_tree.o: in function `mas_leaf_max_gap':
> >> lib/maple_tree.c:1512:(.text.mas_leaf_max_gap+0x2b8): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `ma_dead_node':
> >> lib/maple_tree.c:560:(.text.mas_data_end+0x110): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mas_extend_spanning_null':
> >> lib/maple_tree.c:3662:(.text.mas_extend_spanning_null+0x69c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mas_mab_cp':
> >> lib/maple_tree.c:1943:(.text.mas_mab_cp+0x248): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mab_mas_cp':
> >> lib/maple_tree.c:2000:(.text.mab_mas_cp+0x15c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_pivots'
>    lib/maple_tree.o: in function `mas_reuse_node':
> >> lib/maple_tree.c:3416:(.text.mas_reuse_node+0x17c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_slots'
>    lib/maple_tree.o: in function `mt_free_walk':
> >> lib/maple_tree.c:5238:(.text.mt_free_walk+0x15c): relocation truncated to fit: R_RISCV_GPREL_I against `mt_slots'
>    lib/maple_tree.o: in function `mtree_lookup_walk':
>    lib/maple_tree.c:3700:(.text.mtree_lookup_walk+0x94): additional relocation overflows omitted from the output
> ...
> 
> "
> 
> Could the fix that you have posted here be related to that report?
> Comments are greatly appreciated.
> 
> Best
> --
> 
> Joel Granados



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
