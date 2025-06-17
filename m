Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F40C71159
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 01:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KMJG7wUMqXx5+0MCCkSUmV0GXCif6PGGzLy4Jx/2uEQ=; b=C9jeHTKUjx05LwxxAwyQRHbOvf
	genbaRMjt6qSEm9R8CV4clCfkCjo981IlyllC74E238gVvQR7CN+VHs24e3fUJ+QMoCxLg7HIYc7z
	CkRht1YKxbQnmpItbNllRyz7Mp/MlLmpk75uWbhaDcDshSwpNxH8RCHlFhkxGgoNzZ+M90Mlqbjzq
	lAPKSq47nL/eS4zNo5+rU1AvjwwJKlX1Gb+krNhoGchd70nmZD840BvFKT6ewp2WL5jgZvka+OBN8
	3AxBH8jiaovW65SmfkOUtKSdoPnqPiONggEwQD9lvA7F7HFhgP76ZSubNm1vKfL3R+tsLxMjtzPCN
	gt0Webhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLRd-00000005yfh-3DN4;
	Tue, 17 Jun 2025 01:49:01 +0000
Received: from mta-05-3.privateemail.com ([198.54.118.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLRb-00000005yfG-46D4
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 01:49:01 +0000
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
	by mta-05.privateemail.com (Postfix) with ESMTP id 4bLqXg0z5Dz3hhVj;
	Mon, 16 Jun 2025 21:48:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1750124931; bh=QPuWm1cBSdO+XjfyWejuOqfuZ6+UEWsxXCPUDQ2C6Sw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nYjkIqhDLZVwluWaA6CrLNoISCLwrAvFBJoPoHKu/ASEsZZ7WSnLvO4OVfV6SoTgw
	 /6jwUDf7VBIcP00Dph+m3olInaTwSJ1D5t4tiom1vQTDqm/7zF7x4G5SyuubOGl9br
	 bcEgZg3wOlojBxxtbbxGST1m67zkaaOaIqSaiuztenLQcbfyHstB32+6eEj9DwmsyK
	 FoMk3NhPvXlncBPnGSzIPN1TVLFW0UqrIxFSYR8enXLG3YLSyBu6vbHkNVBhlZ2bFS
	 Zm1sWuGPPd3la8xoue0bli4sBnep7Po6d66WzV1a3k2MquyGYvv/TehjkGqj08RTGp
	 bLHrjjd3GFGyw==
Received: from APP-12 (unknown [10.50.14.212])
	by mta-05.privateemail.com (Postfix) with ESMTPA;
	Mon, 16 Jun 2025 21:48:40 -0400 (EDT)
Date: Tue, 17 Jun 2025 03:48:40 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: Alexandre Ghiti <alex@ghiti.fr>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Message-ID: <890717501.210398.1750124920866@privateemail.com>
In-Reply-To: <df439eb4-4dbd-4f0f-bfd2-27c6b1534f39@ghiti.fr>
References: <960240908.630790.1748641210849@privateemail.com>
 <1552795452.650306.1748692371190@privateemail.com>
 <c239ee1b-f201-4e7b-80f8-03a7fb02b666@ghiti.fr>
 <1338988468.1011577.1749045125350@privateemail.com>
 <191074362.1248877.1749238947947@privateemail.com>
 <df439eb4-4dbd-4f0f-bfd2-27c6b1534f39@ghiti.fr>
Subject: Re: Broken 32-bit riscv debug build with ZSTD and FTRACE
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev78
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_184900_066854_6B9D4C8B 
X-CRM114-Status: UNSURE (   5.75  )
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

I did some digging adding prints to modpost.c, trying to understand the errors
complaining about "local symbol 'xxx' was exported" for now. For reference, I am
using commit 494e7fe591bf834d57c6607cdc26ab8873708aa7 for the broken build and
tag v6.14 for the sane build. Config as per my previous mail:

	export ARCH=riscv CROSS_COMPILE=riscv32-linux-
	make distclean
	make defconfig
	make 32-bit.config
	./scripts/config \
		-e FTRACE \
		-e CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
		-d RD_ZSTD \
		-d SECURITY_APPARMOR_INTROSPECT_POLICY \
		-d BTRFS_FS
	make olddefconfig
	make -j vmlinux

It seems like modpost is right: the sanity check for exported symbols fails
because somehow some of the entries of .rela.export_symbol reference wrong
LOCAL symbols. 

Inspecting the sane vmlinux.o built on v6.14 I see:

	$ readelf -W -r vmlinux.o | grep -A10 -F .rela.export_symbol
	Relocation section '.rela.export_symbol' at offset 0x255c28c contains 11089 entries:
	 Offset     Info    Type                Sym. Value  Symbol's Name + Addend
	00000004  0862be01 R_RISCV_32             00000028   system_state + 0
	00000010  0892f901 R_RISCV_32             00000018   static_key_initialized + 0
	00000018  084f0e01 R_RISCV_32             00000014   reset_devices + 0
	00000020  08933601 R_RISCV_32             00000008   loops_per_jiffy + 0
	0000002c  083fcf01 R_RISCV_32             00000110   init_uts_ns + 0
	00000038  08761f01 R_RISCV_32             00000354   wait_for_initramfs + 0
	00000040  084c4c01 R_RISCV_32             00000340   init_task + 0
	00000048  0863e901 R_RISCV_32             00000aca   riscv_cached_mvendorid + 0
	00000050  08423d01 R_RISCV_32             00000af4   riscv_cached_marchid + 0

While for the broken vmlinux.o on 494e7fe5 I see:

	$ readelf -W -r vmlinux.o | grep -A10 -F .rela.export_symbol
	Relocation section '.rela.export_symbol' at offset 0x27aa24cc contains 11425 entries:
	 Offset     Info    Type                Sym. Value  Symbol's Name + Addend
	00000004  fff15b01 R_RISCV_32             00000028   system_state + 0
	00000010  ffeed801 R_RISCV_32             00000018   static_key_initialized + 0
	00000018  fff07d01 R_RISCV_32             00000014   reset_devices + 0
	00000020  00149201 R_RISCV_32             000036ed   .LASF3838 + 0
	0000002c  ffde7c01 R_RISCV_32             00000324   init_uts_ns + 0
	00000038  ffc4c801 R_RISCV_32             00000b3a   wait_for_initramfs + 0
	00000040  000d6801 R_RISCV_32             00011e04   .LASF2005 + 0
	00000048  ffb72201 R_RISCV_32             000012b0   riscv_cached_mvendorid + 0
	00000050  ffd14901 R_RISCV_32             000012da   riscv_cached_marchid + 0

Notice how the 4th and 7th relocation entries reference some .LASFxxx label in
the broken build, but reference loops_per_jiffy and init_task in the sane build.

Those relocation entries seem bogus and point to LOCAL symbols. For example,
for .LASF3838 we have ELF32_R_SYM(rela->r_info) = 0x1492 = 5266, which is:

	$ readelf -s vmlinux.o | grep ' 5266:'
	5266: 000036ed     0 NOTYPE  LOCAL  DEFAULT  178 .LASF3838

So rela->r_info is bad, and when modpost looks at it, it rightfully complains
about the symbol being local. However, rela->r_offset (0x20) seems correct as it
points to __export_symbol_loops_per_jiffy (taken as offset in .export_symbols).
Therefore, we get the weird error message:

	ERROR: modpost: vmlinux: local symbol 'loops_per_jiffy' was exported

Even though loops_per_jiffy is *GLOBAL* and *should* be exported.

FWIW, the call chain is:

	section_rela() -> check_section_mismatch() -> check_export_symbol().

Anyhow, that's all I have for now. Seems like vmlinux.o is being built with
RELA relocations that have bogus r_info. Not sure how, will have to do more
digging if/when I have more time.

--
Marco Bonelli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
