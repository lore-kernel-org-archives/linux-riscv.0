Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4289CC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oXPU8qE6/sYl7oT7wxgBFb4tG1m1FqNvNNbgccgbBuk=; b=sSeEGJqt01qs4v
	kSC3iKmt1flVCbTt4YPDSoYgw9wYREK/NLScPKe6Y9SBnOjViF9J1DSgeU6cxI3BohcjhAKcTi1w5
	NR0CKb21Jhg7Vp//iTELMfmw3gp6BSfsTPE9gGA6Ji18hjNU12p9JtZyiyrEGL/7v1QkvHj4ybPrg
	aJ/WIPeTwVH/RrBOLyIbiSbRSmvvJnrIwNU6M7gqRsS+kqg7GAEoa4tF9YPji9e7/YJhssD12F8lQ
	5skPqGC9juQSSs6rSReAj/EU6OkYhXV8UJLbnkrjUx2vfas2mgl2xv9fyPaevBu2mnTeanYo2LyX+
	PhEuOrFRIV0DMRliYDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLg-0000000ACWe-1xxn;
	Wed, 18 Jun 2025 12:57:04 +0000
Received: from mta-08-4.privateemail.com ([198.54.122.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqRx-00000009r90-2Mwu
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 10:55:26 +0000
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
	by mta-08.privateemail.com (Postfix) with ESMTP id 4bMgcd42rfz3hhVL;
	Wed, 18 Jun 2025 06:55:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1750244113; bh=fdckJ7NXadwzktWAoc0xBvjpFltxqY6fOYGqbTxCHSI=;
	h=Date:From:To:Cc:Subject:From;
	b=Fx7L6AkrmkO0CaUit2mw5XwN+YdMDlFVtnFRjuamJHEiQjp3MUsZumbeptIlLn5SH
	 oaj7T8A8GFZPkBx3FUEslarHPIccz3XjtO7jD+MeSpV/ze5i6Y+tbnPDXmWUYa0hux
	 BuLaTDOROurzZVLE3VqENXeBCrSUG9PrdtvHqtrUDZkNEGYXe3Ur295rVirxEtgvyU
	 6mM4DSaexu2tOWspcLbKaxZ7xH461EVZSCbeiKiK4ghr7gIkn3f3lHAM52v3K87PwH
	 bQWdPscbzFT9upoLhrGdWwoMWmzl12KWQeNz5u6el2fVEewBnCpndafSEdEufPXdEv
	 YWnvYddSs2A7A==
Received: from APP-13 (unknown [10.50.14.213])
	by mta-08.privateemail.com (Postfix) with ESMTPA;
	Wed, 18 Jun 2025 06:55:08 -0400 (EDT)
Date: Wed, 18 Jun 2025 12:55:08 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>
Message-ID: <1714337938.319508.1750244108368@privateemail.com>
Subject: RISC-V 32-bit debug builds reaching breaking point: too many
 symbols
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev78
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_035525_629238_E9E87123 
X-CRM114-Status: UNSURE (   8.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V debug builds generate *millions* of symbols in vmlinux.o, and this number
is now getting beyond the limit of the maximum symbol table index that can be
represented by 32-bit Rela relocations. The ELF32_R_SYM portion of Elf32_Rela
r_info is only 24 bits, therefore symtab indexes larger than 16777215 overflow
and cause bogus Rela entries pointing to wrong symbols, ultimately breaking the
build.

I recently noticed this [1] when "MODPOST vmlinux.symvers" failed with thousands
of errors and warnings on a particular build of mine for v6.15 RISC-V 32-bit.

The majority (99%) of the symbols are for local temporary labels (.Lxxx) that
would normally be stripped by default at link time, but seems they cannot be
stripped as they are referenced by Rela relocations. The number of such symbols
has always been huge from the very first RISC-V Linux version (v4.15) and has
been steadily growing since (I plotted a bar chart for v6.5-v6.15 here [3]).

For reference, on v4.15 a simple defconfig + debug build with GCC 11.1 produces
a vmlinux.o with around 7 million such symbols. On v6.15 with GCC 14.2 it gets
to around 15 million. We are close to the 16.8M limit, and already exceeding it
on some configurations (the discussion in [1] is an example).

What can be done to reduce them down to an acceptable number, or even better get
rid of them entirely? These local temporary symbols referenced by relocations
seem to be ubiquitous, so I suppose this is some RISC-V ELF ABI design choice.
Could those Rela relocs just avoid referencing any symbol? Or could Rel/Relr be
used instead?

Otherwise, if those really need to be kept as is, perhaps splitting debug info
out of vmlinux.o before linking into final vmlinux (when those are finally
stripped) could also be a viable solution, though the debug info would have to
be split into multiple files or the same problem would arise.

Thoughts?

Here are some stats from a custom script I hacked together (can provide source
if needed).

	# Clean v6.15 tree
	export PATH=/path/to/gcc-14.2.0-nolibc/riscv32-linux/bin:$PATH
	export ARCH=riscv CROSS_COMPILE=riscv32-linux-

	make defconfig
	make 32-bit.config
	./scripts/config -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
	make olddefconfig
	make -j vmlinux

Stats:

	Total symbols: 15138556
	Temporary local symbols: 14972044
	Referenced by relocations: 14971527
	By section:
		.rela.debug_info                  8783573
		.rela.debug_line                  3649412
		.rela.debug_ranges                1110915
		.rela.debug_loc                   972349
		.rela.text                        398789
		.rela.debug_frame                 283422
		.rela.rodata                      17182
		.rela.init.text                   15732
		.rela__bug_table                  11163
		.rela__jump_table                 10830
		.rela.debug_aranges               10253
		.rela.alternative                 4510
		.rela.data                        3504
		.rela.text.unlikely               2650
		.rela__ex_table                   2044
		.rela.sched.text                  1405
		.rela.init.rodata                 541
		.rela.exit.text                   538
		.rela.ref.text                    344
		.rela.init.data                   321
		.rela.noinstr.text                234
		.rela.spinlock.text               194
		.rela.data..ro_after_init         98
		.rela.cpuidle.text                36
		.rela.srodata                     30
		.rela__modver                     27
		.rela.head.text                   21
		.rela.sdata                       15
		.rela.irqentry.text               12
		.relaruntime_shift_d_hash_shift   10
		.relaruntime_ptr_dentry_hashtable 10
		.rela.lsm_info.init               3
		.rela.data..percpu                1
	By relocation kind:
		R_RISCV_32           9665623
		R_RISCV_SUB16        3652043
		R_RISCV_ADD16        3647245
		R_RISCV_ADD32        1174187
		R_RISCV_SUB32        345881
		R_RISCV_BRANCH       168074
		R_RISCV_RVC_BRANCH   104031
		R_RISCV_SET6         87790
		R_RISCV_SUB6         87790
		R_RISCV_PCREL_LO12_I 81819
		R_RISCV_RVC_JUMP     76539
		R_RISCV_SET8         29260
		R_RISCV_SUB8         29260
		R_RISCV_PCREL_HI20   23416
		R_RISCV_SET16        4798
		R_RISCV_JAL          4676
		R_RISCV_PCREL_LO12_S 1410
		R_RISCV_CALL_PLT     1

[1]: https://lore.kernel.org/lkml/960240908.630790.1748641210849@privateemail.com/
[2]: https://x.com/mebeim/status/1934950596693635410

--
Marco Bonelli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
