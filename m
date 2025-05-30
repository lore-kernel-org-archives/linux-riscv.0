Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37BAC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 21:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1LT4zTQRYwfqmvLEekQgYiKXf8kQHUrnTlbx4jspaa8=; b=XDBesH9mych1Jv
	DAnh/2NM4/k9NBiSb8XEq3U/CKwJZUxLSAdPEns9UGRfYxXGg1PoTLaLPVUh6hWfYM4KM41vAmyfJ
	tm1vvS89RTBWIxtVqXGvsJVcf+DaZtCjCIBRIlYaSGSSznU6+NprkDbRw9xgDgKgW+IiV0SG3Rvbe
	EUUpQEMYAkj/9bJ5p1L9aTYwyRiQljcry/uMURy6Qia5G8gke2LD3xbCsBQbbs9CxO8mUaVZNVeqi
	Zc0zISOnjx9ppKwezidA6EfggZKykb4ZhvXRUmUVwGq9LLH6AIqoZRjs+FWQHqyoFXGG+dvZXztku
	Zx0bXCahyZt47dKBX5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7T2-00000001xPF-3YZm;
	Fri, 30 May 2025 21:40:44 +0000
Received: from h8.fbrelay.privateemail.com ([162.0.218.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7Sz-00000001xOL-20IE
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 21:40:43 +0000
Received: from MTA-13-4.privateemail.com (mta-13-1.privateemail.com [198.54.122.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4b8Gqr4xLZz2xhH
	for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 17:40:24 -0400 (EDT)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
	by mta-13.privateemail.com (Postfix) with ESMTP id 4b8Gqm0p6Zz3hhV5;
	Fri, 30 May 2025 17:40:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mebeim.net; s=default;
	t=1748641220; bh=7lb1FFg18GTRLJVBweMVfm5eQwotwrlkGXDCWnnD0l4=;
	h=Date:From:To:Cc:Subject:From;
	b=OOCw6xSmO9LD6CwNjWss9stCFFhVivb54UCb6MWHCYpUQ+gUT0b9tPBz5rahJl+Z6
	 VE5cCUvzjfdY78TsjPd/1gW0zOqFUPREWNxAnBbq9CCCPx6r8R1+O9sVOHlDg5e+33
	 MuXPSAuJxVtsrtF/J1s7cnyul8Bq4pB+o4gtSPi2f7iMcJkGTSLFXHBwj2lFtD35fs
	 aBN4WSY3TBOorS3kY/esLy9KSJ0z7iGSnBKbdsyGVJAFhI/6pjLuOAMuRP+kblWXxW
	 S4QcEmF0hh9nFZNzzVwQUUZH0gQ8/Q+NV/sIus3Y4x/CmbJ5kruRhiTJNpOE+BaKkr
	 PiEzRODJCSnGg==
Received: from APP-18 (unknown [10.50.14.242])
	by mta-13.privateemail.com (Postfix) with ESMTPA;
	Fri, 30 May 2025 17:40:10 -0400 (EDT)
Date: Fri, 30 May 2025 23:40:10 +0200 (CEST)
From: Marco Bonelli <marco@mebeim.net>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Message-ID: <960240908.630790.1748641210849@privateemail.com>
Subject: Broken 32-bit riscv debug build with ZSTD and FTRACE
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev75
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_144041_825688_F6DAD610 
X-CRM114-Status: UNSURE (   9.37  )
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

I am building v6.15 for 32-bit riscv and I have noticed that modpost fails with
a ton of errors and warnings (tens of thousands). I am on a Debian 12 x86-64
host using the riscv32-linux-gcc from mirrors.edge.kernel.org [1]. I can
reproduce with different GCC versions (I tested with 10.1.0, 14.2.0, 15.1.0).
For whatever reason though, only when targeting riscv 32-bit.

Steps to reproduce:

    export ARCH=riscv CROSS_COMPILE=riscv32-linux-
    make distclean
    make defconfig
    make 32-bit.config
    ./scripts/config \
        -e DEBUG_KERNEL \
        -e DEBUG_INFO \
        -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
        -d DEBUG_INFO_NONE \
        -d DEBUG_INFO_REDUCED
    make olddefconfig
    make -j vmlinux

Build output:

    ...
    MODPOST vmlinux.symvers
    WARNING: modpost: vmlinux: section mismatch in reference: tcp_write_timer_handler+0xa4 (section: .text) -> register_kernel_offset_dumper (section: .init.text)
    ...
    ERROR: modpost: vmlinux: local symbol 'find_get_pid' was exported
    ...
    ERROR: modpost: __ex_table+0x17e8 references non-executable section '.debug_str'
    ...
    make[2]: *** [scripts/Makefile.modpost:147: vmlinux.symvers] Error 1
    make[1]: *** [/mnt/m2data/linux/Makefile:1958: modpost] Error 2
    make: *** [Makefile:248: __sub-make] Error 2

There are thousands of warnings/errors like the three above, complaining
about "section mismatch in reference", "local symbol xxx was exported" and
"references non-executable section".

I did a bisect run on torvalds/linux and narrowed it down to:

    e61f33273ca755b3e2ebee4520a76097199dc7a8 Merge tag 'zstd-linus-v6.15-rc1' of https://github.com/terrelln/linux

I was also able to reproduce on next/linux-next tag next-20250530. 
Looking at the merge from github.com/terrelln/linux it seems to be a single
commit [2].

Through trial and error I noticed that the build only seems to fail when
*all* the following conditions are met:

1. Building for 32-bit riscv (ARCH=riscv + defconfig + 32-bit.config)
2. FTRACE=y
3. ZSTD_COMPRESS=y
4. Debug info enabled

With ZSTD_COMPRESS=m (selecting SECURITY_APPARMOR_EXPORT_BINARY=n) or
ZSTD_COMPRESS=n (selecting also BTRFS_FS=n), modpost goes through fine.
With FTRACE=n or disabling debug info modpost also goes through fine.

So it seems to be a combination of factors, but I am unsure how exactly
these things can interact/interfere with each other. Any clue?

Full bisect run log:

    # bad: [0ff41df1cb268fc69e703a08a57ee14ae967d0ca] Linux 6.15
    # good: [38fec10eb60d687e30c8c6b5420d86e8149f7557] Linux 6.14
    git bisect start 'v6.15' 'v6.14'
    # bad: [390513642ee6763c7ada07f0a1470474986e6c1c] io_uring: always do atomic put from iowq
    git bisect bad 390513642ee6763c7ada07f0a1470474986e6c1c
    # good: [9b960d8cd6f712cb2c03e2bdd4d5ca058238037f] Merge tag 'for-6.15/block-20250322' of git://git.kernel.dk/linux
    git bisect good 9b960d8cd6f712cb2c03e2bdd4d5ca058238037f
    # good: [023b1e9d265ca0662111a9df23d22b4632717a8a] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
    git bisect good 023b1e9d265ca0662111a9df23d22b4632717a8a
    # bad: [3a90a72aca0a98125f0c7350ffb7cc63665f8047] Merge tag 'asm-generic-6.15-2' of git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
    git bisect bad 3a90a72aca0a98125f0c7350ffb7cc63665f8047
    # good: [3ef47a0436219359a0838d74bb353caa6aad3fc0] Merge tag 'at91-dt-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/dt
    git bisect good 3ef47a0436219359a0838d74bb353caa6aad3fc0
    # bad: [1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95] Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
    git bisect bad 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
    # good: [ffd6c179286daf31ea0d6413228bbc2a3c7ee1de] Merge patch series "scsi: ufs: renesas: Add support for R-Car S4-8 ES1.2"
    git bisect good ffd6c179286daf31ea0d6413228bbc2a3c7ee1de
    # good: [22df63a23a9e53d06ff2c67f863e9ce1640b73cb] Merge branches 'apple/dart', 'arm/smmu/updates', 'arm/smmu/bindings', 'rockchip', 's390', 'core', 'intel/vt-d' and 'amd/amd-vi' into next
    git bisect good 22df63a23a9e53d06ff2c67f863e9ce1640b73cb
    # good: [29fa7d7934216e0a93102a930ef28e2a6ae852b1] selftests/sysctl: fix wording of help messages
    git bisect good 29fa7d7934216e0a93102a930ef28e2a6ae852b1
    # good: [22093997ac9220d3c606313efbf4ce564962d095] Merge tag 'ata-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
    git bisect good 22093997ac9220d3c606313efbf4ce564962d095
    # good: [a018d1cf990d0c339fe0e29b762ea5dc10567d67] scsi: st: Fix array overflow in st_setup()
    git bisect good a018d1cf990d0c339fe0e29b762ea5dc10567d67
    # good: [336b4dae6dfecc9aa53a3a68c71b9c1c1d466388] Merge tag 'iommu-updates-v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux
    git bisect good 336b4dae6dfecc9aa53a3a68c71b9c1c1d466388
    # good: [65d1f5507ed2c78c64fce40e44e5574a9419eb09] zstd: Import upstream v1.5.7
    git bisect good 65d1f5507ed2c78c64fce40e44e5574a9419eb09
    # bad: [e61f33273ca755b3e2ebee4520a76097199dc7a8] Merge tag 'zstd-linus-v6.15-rc1' of https://github.com/terrelln/linux
    git bisect bad e61f33273ca755b3e2ebee4520a76097199dc7a8
    # good: [592329e5e94e26080f4815c6cc6cd0f487a91064] Merge tag 'sysctl-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl
    git bisect good 592329e5e94e26080f4815c6cc6cd0f487a91064
    # first bad commit: [e61f33273ca755b3e2ebee4520a76097199dc7a8] Merge tag 'zstd-linus-v6.15-rc1' of https://github.com/terrelln/linux

[1]: https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.2.0/
[2]: https://github.com/terrelln/linux/commit/65d1f5507ed2c78c64fce40e44e5574a9419eb09

--
Marco Bonelli

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
