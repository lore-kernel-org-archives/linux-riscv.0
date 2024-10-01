Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32007CE7CFA
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbiovgUMkKHFs7YV+JvAVMBlN7YpQPcO0RlvjuqVRqM=; b=iwZ4/Di+iawiuE
	+J5ue0Y1jUYbExb+tg0sUWAlUyCgQrLPiytaxZh0v7+bI+yEROhnpAgLrZucVYY/1Mp8SZc3xlf/M
	2qOZ9VHtFIW+BGJv99RdMsdaQk9CmFKI3gVCMtmjaGNt4JWCHFcxIX8LHCP6bmrXdl75BYnTE70pT
	ipMq0TlhXNfT4Xcfdxbpfk6PITgz1WU8wMkkkqkHPL21uWkunJaDUwFmZL2bLMroXUxFrgXOdchjG
	B8i/HsFRMEKQvSYP6smgW/tVa5fZ2gmNDiyvlOj6aZF6gG3nkvsxm6eVUbC+cHgyn3rat+aFSoo3s
	ygyplFMBZbPyuP41cmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZ55-00000002DRA-3k9G;
	Tue, 01 Oct 2024 09:22:07 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZ36-00000002D35-1Vla
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 09:20:08 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id BA1BE21BAB;
	Tue,  1 Oct 2024 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727774400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKELQnd0lptbgWZh5W/6+B1GByxe5acTxmAXcam6ftw=;
	b=ty2G+xcQ/EI/33+Wh2hLQ6UKOSNNFE1dyO1sFJwY1QrO9G3JY35CEED4qysy3KdwlUxsqX
	MaRyj2uT4JlBbYBefKf1JecqqlJ/YzSK1YfZgC5srT0zAYbVaqrVmdQ7/daAP5LRlvNDXE
	Y9WRJ2x3bmQ/iUwnkDLQouhLr1LXeBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727774400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKELQnd0lptbgWZh5W/6+B1GByxe5acTxmAXcam6ftw=;
	b=TtNiM9mc3Lchdffh25WEo3gp7tVjjrywzRC5P5xCVfQIhT5nW/O1NIqz6dujexOQ1jp/Tb
	GcSUjquhZ+Vm9SDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727774400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKELQnd0lptbgWZh5W/6+B1GByxe5acTxmAXcam6ftw=;
	b=ty2G+xcQ/EI/33+Wh2hLQ6UKOSNNFE1dyO1sFJwY1QrO9G3JY35CEED4qysy3KdwlUxsqX
	MaRyj2uT4JlBbYBefKf1JecqqlJ/YzSK1YfZgC5srT0zAYbVaqrVmdQ7/daAP5LRlvNDXE
	Y9WRJ2x3bmQ/iUwnkDLQouhLr1LXeBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727774400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKELQnd0lptbgWZh5W/6+B1GByxe5acTxmAXcam6ftw=;
	b=TtNiM9mc3Lchdffh25WEo3gp7tVjjrywzRC5P5xCVfQIhT5nW/O1NIqz6dujexOQ1jp/Tb
	GcSUjquhZ+Vm9SDg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 550094A055D; Tue,  1 Oct 2024 11:20:00 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Andrea Parri
 <parri.andrea@gmail.com>,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] tools: Add riscv barrier implementation
In-Reply-To: <20240806-optimize_ring_buffer_read_riscv-v2-1-ca7e193ae198@rivosinc.com>
	(Charlie Jenkins's message of "Tue, 06 Aug 2024 15:01:23 -0700")
References: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
	<20240806-optimize_ring_buffer_read_riscv-v2-1-ca7e193ae198@rivosinc.com>
X-Yow: Uh-oh --  WHY am I suddenly thinking of a VENERABLE religious leader
 frolicking on a FORT LAUDERDALE weekend?
Date: Tue, 01 Oct 2024 11:20:00 +0200
Message-ID: <mvmo74441tr.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sifive.com,dabbelt.com,eecs.berkeley.edu,gmail.com,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_022005_246946_4B0176D3 
X-CRM114-Status: UNSURE (   7.33  )
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

On Aug 06 2024, Charlie Jenkins wrote:

> Many of the other architectures use their custom barrier implementations.
> Use the barrier code from the kernel sources to optimize barriers in
> tools.

This appears to break compilation of tools/bpf/resolve_btfids:

+ make prepare ARCH=riscv --output-sync -j12 V=1
make --no-print-directory -C /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj \
-f /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/Makefile prepare
make -f ../scripts/Makefile.build obj=scripts/basic
make -f ../scripts/Makefile.asm-headers obj=arch/riscv/include/generated/uapi/asm \
generic=include/uapi/asm-generic
make -f ../scripts/Makefile.build obj=scripts/dtc
mkdir -p ./tools
make LDFLAGS= MAKEFLAGS=" --jobserver-auth=fifo:/tmp/GMfifo6534" O=/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj subdir=tools -C ../tools/ bpf/resolve_btfids
# WRAP    arch/riscv/include/generated/uapi/asm/fcntl.h
  echo "#include <asm-generic/fcntl.h>" > arch/riscv/include/generated/uapi/asm/fcntl.h
# WRAP    arch/riscv/include/generated/uapi/asm/ioctls.h
  echo "#include <asm-generic/ioctls.h>" > arch/riscv/include/generated/uapi/asm/ioctls.h
# WRAP    arch/riscv/include/generated/uapi/asm/ioctl.h
  echo "#include <asm-generic/ioctl.h>" > arch/riscv/include/generated/uapi/asm/ioctl.h
# WRAP    arch/riscv/include/generated/uapi/asm/errno.h
  echo "#include <asm-generic/errno.h>" > arch/riscv/include/generated/uapi/asm/errno.h
ln -fsn .. source
# GEN     Makefile
  { echo "# Automatically generated by ../Makefile: don't edit"; echo "include ../Makefile"; } > Makefile
test -e .gitignore || \
{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
# WRAP    arch/riscv/include/generated/uapi/asm/ipcbuf.h
  echo "#include <asm-generic/ipcbuf.h>" > arch/riscv/include/generated/uapi/asm/ipcbuf.h
# WRAP    arch/riscv/include/generated/uapi/asm/mman.h
  echo "#include <asm-generic/mman.h>" > arch/riscv/include/generated/uapi/asm/mman.h
# WRAP    arch/riscv/include/generated/uapi/asm/msgbuf.h
  echo "#include <asm-generic/msgbuf.h>" > arch/riscv/include/generated/uapi/asm/msgbuf.h
# WRAP    arch/riscv/include/generated/uapi/asm/param.h
  echo "#include <asm-generic/param.h>" > arch/riscv/include/generated/uapi/asm/param.h
set -e; mkdir -p include/generated/uapi/linux/; trap "rm -f include/generated/uapi/linux/.tmp_version.h" EXIT; { 	if [ 0 -gt 255 ]; then echo \#define LINUX_VERSION_CODE 396543; else echo \#define LINUX_VERSION_CODE 396288; fi; echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + ((c) > 255 ? 255 : (c)))'; echo \#define LINUX_VERSION_MAJOR 6; echo \#define LINUX_VERSION_PATCHLEVEL 12; echo \#define LINUX_VERSION_SUBLEVEL 0; } > include/generated/uapi/linux/.tmp_version.h; if [ ! -r include/generated/uapi/linux/version.h ] || ! cmp -s include/generated/uapi/linux/version.h include/generated/uapi/linux/.tmp_version.h; then : '  UPD     include/generated/uapi/linux/version.h'; mv -f include/generated/uapi/linux/.tmp_version.h include/generated/uapi/linux/version.h; fi
# WRAP    arch/riscv/include/generated/uapi/asm/posix_types.h
  echo "#include <asm-generic/posix_types.h>" > arch/riscv/include/generated/uapi/asm/posix_types.h
# WRAP    arch/riscv/include/generated/uapi/asm/resource.h
  echo "#include <asm-generic/resource.h>" > arch/riscv/include/generated/uapi/asm/resource.h
../scripts/remove-stale-files
# WRAP    arch/riscv/include/generated/uapi/asm/poll.h
  echo "#include <asm-generic/poll.h>" > arch/riscv/include/generated/uapi/asm/poll.h
# WRAP    arch/riscv/include/generated/uapi/asm/sembuf.h
  echo "#include <asm-generic/sembuf.h>" > arch/riscv/include/generated/uapi/asm/sembuf.h
# WRAP    arch/riscv/include/generated/uapi/asm/shmbuf.h
  echo "#include <asm-generic/shmbuf.h>" > arch/riscv/include/generated/uapi/asm/shmbuf.h
# WRAP    arch/riscv/include/generated/uapi/asm/siginfo.h
  echo "#include <asm-generic/siginfo.h>" > arch/riscv/include/generated/uapi/asm/siginfo.h
# WRAP    arch/riscv/include/generated/uapi/asm/signal.h
  echo "#include <asm-generic/signal.h>" > arch/riscv/include/generated/uapi/asm/signal.h
# WRAP    arch/riscv/include/generated/uapi/asm/sockios.h
  echo "#include <asm-generic/sockios.h>" > arch/riscv/include/generated/uapi/asm/sockios.h
# WRAP    arch/riscv/include/generated/uapi/asm/socket.h
  echo "#include <asm-generic/socket.h>" > arch/riscv/include/generated/uapi/asm/socket.h
# WRAP    arch/riscv/include/generated/uapi/asm/stat.h
  echo "#include <asm-generic/stat.h>" > arch/riscv/include/generated/uapi/asm/stat.h
# WRAP    arch/riscv/include/generated/uapi/asm/statfs.h
  echo "#include <asm-generic/statfs.h>" > arch/riscv/include/generated/uapi/asm/statfs.h
# WRAP    arch/riscv/include/generated/uapi/asm/swab.h
  echo "#include <asm-generic/swab.h>" > arch/riscv/include/generated/uapi/asm/swab.h
# WRAP    arch/riscv/include/generated/uapi/asm/termbits.h
  echo "#include <asm-generic/termbits.h>" > arch/riscv/include/generated/uapi/asm/termbits.h
set -e; mkdir -p include/config/; trap "rm -f include/config/.tmp_kernel.release" EXIT; { ../scripts/setlocalversion ..; } > include/config/.tmp_kernel.release; if [ ! -r include/config/kernel.release ] || ! cmp -s include/config/kernel.release include/config/.tmp_kernel.release; then : '  UPD     include/config/kernel.release'; mv -f include/config/.tmp_kernel.release include/config/kernel.release; fi
# WRAP    arch/riscv/include/generated/uapi/asm/termios.h
  echo "#include <asm-generic/termios.h>" > arch/riscv/include/generated/uapi/asm/termios.h
# WRAP    arch/riscv/include/generated/uapi/asm/types.h
  echo "#include <asm-generic/types.h>" > arch/riscv/include/generated/uapi/asm/types.h
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.tmp_compile.h" EXIT; { ../scripts/mkcompile_h "riscv64" "gcc (SUSE Linux) 14.2.0" "ld"; } > include/generated/.tmp_compile.h; if [ ! -r include/generated/compile.h ] || ! cmp -s include/generated/compile.h include/generated/.tmp_compile.h; then : '  UPD     include/generated/compile.h'; mv -f include/generated/.tmp_compile.h include/generated/compile.h; fi
set -e; mkdir -p include/generated/uapi/linux/; trap "rm -f include/generated/uapi/linux/.tmp_suse_version.h" EXIT; { 	sh ../scripts/gen-suse_version_h.sh; } > include/generated/uapi/linux/.tmp_suse_version.h; if [ ! -r include/generated/uapi/linux/suse_version.h ] || ! cmp -s include/generated/uapi/linux/suse_version.h include/generated/uapi/linux/.tmp_suse_version.h; then : '  UPD     include/generated/uapi/linux/suse_version.h'; mv -f include/generated/uapi/linux/.tmp_suse_version.h include/generated/uapi/linux/suse_version.h; fi
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.tmp_utsrelease.h" EXIT; { 	if [ `echo -n "6.12.0-rc1-4-default" | wc -c ` -gt 64 ]; then echo '"6.12.0-rc1-4-default" exceeds 64 characters' >&2; exit 1; fi; echo \#define UTS_RELEASE \"6.12.0-rc1-4-default\"; } > include/generated/.tmp_utsrelease.h; if [ ! -r include/generated/utsrelease.h ] || ! cmp -s include/generated/utsrelease.h include/generated/.tmp_utsrelease.h; then : '  UPD     include/generated/utsrelease.h'; mv -f include/generated/.tmp_utsrelease.h include/generated/utsrelease.h; fi
mkdir -p /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids && make O=/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj subdir=tools/bpf/resolve_btfids --no-print-directory -C bpf/resolve_btfids 
# SYSHDR  arch/riscv/include/generated/uapi/asm/unistd_64.h
  sh ../scripts/syscallhdr.sh --emit-nr  --abis common,64,riscv,rlimit,memfd_secret ../scripts/syscall.tbl arch/riscv/include/generated/uapi/asm/unistd_64.h
# SYSHDR  arch/riscv/include/generated/uapi/asm/unistd_32.h
  sh ../scripts/syscallhdr.sh --emit-nr  --abis common,32,riscv,memfd_secret ../scripts/syscall.tbl arch/riscv/include/generated/uapi/asm/unistd_32.h
make -f ../scripts/Makefile.asm-headers obj=arch/riscv/include/generated/asm \
generic=include/asm-generic
# WRAP    arch/riscv/include/generated/asm/early_ioremap.h
  echo "#include <asm-generic/early_ioremap.h>" > arch/riscv/include/generated/asm/early_ioremap.h
# LEX     scripts/dtc/dtc-lexer.lex.c
  flex -oscripts/dtc/dtc-lexer.lex.c -L ../scripts/dtc/dtc-lexer.l
# WRAP    arch/riscv/include/generated/asm/flat.h
  echo "#include <asm-generic/flat.h>" > arch/riscv/include/generated/asm/flat.h
# WRAP    arch/riscv/include/generated/asm/kvm_para.h
  echo "#include <asm-generic/kvm_para.h>" > arch/riscv/include/generated/asm/kvm_para.h
# WRAP    arch/riscv/include/generated/asm/mmzone.h
  echo "#include <asm-generic/mmzone.h>" > arch/riscv/include/generated/asm/mmzone.h
# WRAP    arch/riscv/include/generated/asm/parport.h
  echo "#include <asm-generic/parport.h>" > arch/riscv/include/generated/asm/parport.h
# WRAP    arch/riscv/include/generated/asm/spinlock.h
  echo "#include <asm-generic/spinlock.h>" > arch/riscv/include/generated/asm/spinlock.h
# WRAP    arch/riscv/include/generated/asm/spinlock_types.h
  echo "#include <asm-generic/spinlock_types.h>" > arch/riscv/include/generated/asm/spinlock_types.h
# WRAP    arch/riscv/include/generated/asm/qrwlock.h
  echo "#include <asm-generic/qrwlock.h>" > arch/riscv/include/generated/asm/qrwlock.h
# WRAP    arch/riscv/include/generated/asm/qrwlock_types.h
  echo "#include <asm-generic/qrwlock_types.h>" > arch/riscv/include/generated/asm/qrwlock_types.h
# WRAP    arch/riscv/include/generated/asm/user.h
  echo "#include <asm-generic/user.h>" > arch/riscv/include/generated/asm/user.h
# WRAP    arch/riscv/include/generated/asm/vmlinux.lds.h
  echo "#include <asm-generic/vmlinux.lds.h>" > arch/riscv/include/generated/asm/vmlinux.lds.h
# WRAP    arch/riscv/include/generated/asm/device.h
  echo "#include <asm-generic/device.h>" > arch/riscv/include/generated/asm/device.h
# WRAP    arch/riscv/include/generated/asm/div64.h
  echo "#include <asm-generic/div64.h>" > arch/riscv/include/generated/asm/div64.h
# WRAP    arch/riscv/include/generated/asm/dma-mapping.h
  echo "#include <asm-generic/dma-mapping.h>" > arch/riscv/include/generated/asm/dma-mapping.h
# WRAP    arch/riscv/include/generated/asm/dma.h
  echo "#include <asm-generic/dma.h>" > arch/riscv/include/generated/asm/dma.h
# HOSTCC  scripts/dtc/fstree.o
  gcc -Wp,-MMD,scripts/dtc/.fstree.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/fstree.o ../scripts/dtc/fstree.c
# WRAP    arch/riscv/include/generated/asm/emergency-restart.h
  echo "#include <asm-generic/emergency-restart.h>" > arch/riscv/include/generated/asm/emergency-restart.h
# WRAP    arch/riscv/include/generated/asm/hardirq.h
  echo "#include <asm-generic/hardirq.h>" > arch/riscv/include/generated/asm/hardirq.h
# YACC    scripts/dtc/dtc-parser.tab.[ch]
  bison -o scripts/dtc/dtc-parser.tab.c --defines=scripts/dtc/dtc-parser.tab.h -t -l ../scripts/dtc/dtc-parser.y
# WRAP    arch/riscv/include/generated/asm/hw_irq.h
  echo "#include <asm-generic/hw_irq.h>" > arch/riscv/include/generated/asm/hw_irq.h
# WRAP    arch/riscv/include/generated/asm/irq_regs.h
  echo "#include <asm-generic/irq_regs.h>" > arch/riscv/include/generated/asm/irq_regs.h
# WRAP    arch/riscv/include/generated/asm/kmap_size.h
  echo "#include <asm-generic/kmap_size.h>" > arch/riscv/include/generated/asm/kmap_size.h
# WRAP    arch/riscv/include/generated/asm/local.h
  echo "#include <asm-generic/local.h>" > arch/riscv/include/generated/asm/local.h
mkdir -p /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/
# WRAP    arch/riscv/include/generated/asm/local64.h
  echo "#include <asm-generic/local64.h>" > arch/riscv/include/generated/asm/local64.h
# WRAP    arch/riscv/include/generated/asm/msi.h
  echo "#include <asm-generic/msi.h>" > arch/riscv/include/generated/asm/msi.h
make -C /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/build CFLAGS= LDFLAGS= /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/fixdep
# WRAP    arch/riscv/include/generated/asm/percpu.h
  echo "#include <asm-generic/percpu.h>" > arch/riscv/include/generated/asm/percpu.h
# WRAP    arch/riscv/include/generated/asm/preempt.h
  echo "#include <asm-generic/preempt.h>" > arch/riscv/include/generated/asm/preempt.h
# WRAP    arch/riscv/include/generated/asm/runtime-const.h
  echo "#include <asm-generic/runtime-const.h>" > arch/riscv/include/generated/asm/runtime-const.h
# HOSTCC  scripts/dtc/dtc.o
  gcc -Wp,-MMD,scripts/dtc/.dtc.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/dtc.o ../scripts/dtc/dtc.c
# WRAP    arch/riscv/include/generated/asm/rwonce.h
  echo "#include <asm-generic/rwonce.h>" > arch/riscv/include/generated/asm/rwonce.h
# WRAP    arch/riscv/include/generated/asm/serial.h
  echo "#include <asm-generic/serial.h>" > arch/riscv/include/generated/asm/serial.h
# WRAP    arch/riscv/include/generated/asm/shmparam.h
  echo "#include <asm-generic/shmparam.h>" > arch/riscv/include/generated/asm/shmparam.h
# WRAP    arch/riscv/include/generated/asm/softirq_stack.h
  echo "#include <asm-generic/softirq_stack.h>" > arch/riscv/include/generated/asm/softirq_stack.h
# WRAP    arch/riscv/include/generated/asm/trace_clock.h
  echo "#include <asm-generic/trace_clock.h>" > arch/riscv/include/generated/asm/trace_clock.h
# WRAP    arch/riscv/include/generated/asm/unaligned.h
  echo "#include <asm-generic/unaligned.h>" > arch/riscv/include/generated/asm/unaligned.h
# WRAP    arch/riscv/include/generated/asm/vga.h
  echo "#include <asm-generic/vga.h>" > arch/riscv/include/generated/asm/vga.h
gcc -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include   -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/fixdep /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/build/fixdep.c
# WRAP    arch/riscv/include/generated/asm/video.h
  echo "#include <asm-generic/video.h>" > arch/riscv/include/generated/asm/video.h
# HOSTCC  scripts/dtc/data.o
  gcc -Wp,-MMD,scripts/dtc/.data.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/data.o ../scripts/dtc/data.c
# HOSTCC  scripts/dtc/srcpos.o
  gcc -Wp,-MMD,scripts/dtc/.srcpos.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/srcpos.o ../scripts/dtc/srcpos.c
# SYSTBL  arch/riscv/include/generated/asm/syscall_table_32.h
  sh ../scripts/syscalltbl.sh  --abis common,32,riscv,memfd_secret ../scripts/syscall.tbl arch/riscv/include/generated/asm/syscall_table_32.h
# HOSTCC  scripts/dtc/treesource.o
  gcc -Wp,-MMD,scripts/dtc/.treesource.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/treesource.o ../scripts/dtc/treesource.c
mkdir -p /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids//libsubcmd
# HOSTCC  scripts/dtc/util.o
  gcc -Wp,-MMD,scripts/dtc/.util.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/util.o ../scripts/dtc/util.c
# SYSTBL  arch/riscv/include/generated/asm/syscall_table_64.h
  sh ../scripts/syscalltbl.sh  --abis common,64,riscv,rlimit,memfd_secret ../scripts/syscall.tbl arch/riscv/include/generated/asm/syscall_table_64.h
make  -C /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/lib/bpf/ OUTPUT=/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/    \
	    DESTDIR=/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/ AR="ar" CC="gcc" LD="ld" ARCH="riscv" CROSS_COMPILE="" EXTRA_CFLAGS="" prefix= subdir= \
	    /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/libbpf.a install_headers
# HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_wip.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_wip.o ../scripts/dtc/libfdt/fdt_wip.c
# HOSTCC  scripts/dtc/libfdt/fdt.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt.o ../scripts/dtc/libfdt/fdt.c
# HOSTCC  scripts/dtc/flattree.o
  gcc -Wp,-MMD,scripts/dtc/.flattree.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/flattree.o ../scripts/dtc/flattree.c
make -C /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/lib/subcmd/ OUTPUT=/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/ \
	    DESTDIR=/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/ AR="ar" CC="gcc" LD="ld" ARCH="riscv" CROSS_COMPILE="" EXTRA_CFLAGS="" prefix= subdir= \
	    /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/libsubcmd.a install_headers
# HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_strerror.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_strerror.o ../scripts/dtc/libfdt/fdt_strerror.c
# HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_empty_tree.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_empty_tree.o ../scripts/dtc/libfdt/fdt_empty_tree.c
/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/scripts/bpf_doc.py --header \
	--file /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/uapi/linux/bpf.h > /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/bpf_helper_defs.h
# HOSTCC  scripts/dtc/livetree.o
  gcc -Wp,-MMD,scripts/dtc/.livetree.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/livetree.o ../scripts/dtc/livetree.c
make -C /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/build CFLAGS= LDFLAGS= /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/fixdep
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 bpf.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/' ]; then install -d -m 755 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'; fi; install exec-cmd.h -m 644 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'
\
		if [ ! -d '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/' ]; then install -d -m 755 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'; fi; install help.h -m 644 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 libbpf.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 btf.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/' ]; then install -d -m 755 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'; fi; install pager.h -m 644 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 libbpf_common.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
gcc -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include   -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/fixdep /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/build/fixdep.c
\
		if [ ! -d '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/' ]; then install -d -m 755 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'; fi; install parse-options.h -m 644 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'
# HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_ro.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_ro.o ../scripts/dtc/libfdt/fdt_ro.c
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 libbpf_legacy.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/' ]; then install -d -m 755 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'; fi; install run-command.h -m 644 '/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd//include/subcmd/'
# HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_addresses.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_addresses.o ../scripts/dtc/libfdt/fdt_addresses.c
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 bpf_helpers.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 bpf_tracing.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 bpf_endian.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 bpf_core_read.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 skel_internal.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 libbpf_version.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
# HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_sw.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_sw.o ../scripts/dtc/libfdt/fdt_sw.c
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 usdt.bpf.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
\
		if [ ! -d ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf' ]; then install -d -m 755 ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'; fi; install -m 644 /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/bpf_helper_defs.h ''/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/'/include/bpf'
# HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_rw.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_rw.o ../scripts/dtc/libfdt/fdt_rw.c
gcc -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include   -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/fixdep /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/build/fixdep.c
# HOSTCC  scripts/dtc/fdtoverlay.o
  gcc -Wp,-MMD,scripts/dtc/.fdtoverlay.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/fdtoverlay.o ../scripts/dtc/fdtoverlay.c
# HOSTCC  scripts/dtc/checks.o
  gcc -Wp,-MMD,scripts/dtc/.checks.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/checks.o ../scripts/dtc/checks.c
# HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  gcc -Wp,-MMD,scripts/dtc/libfdt/.fdt_overlay.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML  -I ./scripts/dtc -c -o scripts/dtc/libfdt/fdt_overlay.o ../scripts/dtc/libfdt/fdt_overlay.c
# HOSTLD  scripts/dtc/fdtoverlay
  gcc   -o scripts/dtc/fdtoverlay scripts/dtc/libfdt/fdt.o scripts/dtc/libfdt/fdt_ro.o scripts/dtc/libfdt/fdt_wip.o scripts/dtc/libfdt/fdt_sw.o scripts/dtc/libfdt/fdt_rw.o scripts/dtc/libfdt/fdt_strerror.o scripts/dtc/libfdt/fdt_empty_tree.o scripts/dtc/libfdt/fdt_addresses.o scripts/dtc/libfdt/fdt_overlay.o scripts/dtc/fdtoverlay.o scripts/dtc/util.o   
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.exec-cmd.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/exec-cmd.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/exec-cmd.o exec-cmd.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.pager.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/pager.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/pager.o pager.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.help.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/help.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/help.o help.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.parse-options.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/parse-options.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/parse-options.o parse-options.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.run-command.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/run-command.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/run-command.o run-command.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.sigchain.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/sigchain.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/sigchain.o sigchain.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/.subcmd-config.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/subcmd-config.o -ggdb3 -Wall -Wextra -std=gnu99 -fPIC -O3 -Werror -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/ -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/subcmd-config.o subcmd-config.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/.libbpf.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o -g -O2 -std=gnu89 -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -Wno-switch-enum -Werror -Wall -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/ -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/uapi -fvisibility=hidden -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o libbpf.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/.nlattr.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/nlattr.o -g -O2 -std=gnu89 -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -Wno-switch-enum -Werror -Wall -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/ -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/uapi -fvisibility=hidden -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/nlattr.o nlattr.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/.bpf.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/bpf.o -g -O2 -std=gnu89 -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -Wno-switch-enum -Werror -Wall -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/ -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/uapi -fvisibility=hidden -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/bpf.o bpf.c
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/.btf.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/btf.o -g -O2 -std=gnu89 -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -Wno-switch-enum -Werror -Wall -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/ -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/uapi -fvisibility=hidden -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/btf.o btf.c
# HOSTCC  scripts/dtc/dtc-lexer.lex.o
  gcc -Wp,-MMD,scripts/dtc/.dtc-lexer.lex.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML -I ../scripts/dtc -I ./scripts/dtc -c -o scripts/dtc/dtc-lexer.lex.o scripts/dtc/dtc-lexer.lex.c
In file included from /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/asm/barrier.h:12,
                 from /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/linux/ring_buffer.h:4,
                 from libbpf.c:37:
/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/asm/../../arch/riscv/include/asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory
   13 | #include <asm/fence.h>
      |          ^~~~~~~~~~~~~
compilation terminated.
  gcc -Wp,-MD,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/.libbpf_errno.o.d -Wp,-MT,/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf_errno.o -g -O2 -std=gnu89 -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstrict-aliasing=3 -Wshadow -Wno-switch-enum -Werror -Wall -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/ -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include -I/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/include/uapi -fvisibility=hidden -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BUILD_STR(s)=#s" -c -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf_errno.o libbpf_errno.c
make[5]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/tools/build/Makefile.build:106: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
make[5]: *** Waiting for unfinished jobs....
# HOSTCC  scripts/dtc/dtc-parser.tab.o
  gcc -Wp,-MMD,scripts/dtc/.dtc-parser.tab.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/dtc/libfdt -DNO_YAML -I ../scripts/dtc -I ./scripts/dtc -c -o scripts/dtc/dtc-parser.tab.o scripts/dtc/dtc-parser.tab.c
# HOSTLD  scripts/dtc/dtc
  gcc   -o scripts/dtc/dtc scripts/dtc/dtc.o scripts/dtc/flattree.o scripts/dtc/fstree.o scripts/dtc/data.o scripts/dtc/livetree.o scripts/dtc/treesource.o scripts/dtc/srcpos.o scripts/dtc/checks.o scripts/dtc/util.o scripts/dtc/dtc-lexer.lex.o scripts/dtc/dtc-parser.tab.o   
make -f ../scripts/Makefile.build obj=scripts
make -f ../scripts/Makefile.build obj=scripts/genksyms \
need-builtin= \
need-modorder= \

make -f ../scripts/Makefile.build obj=scripts/selinux \
need-builtin= \
need-modorder= \

make -f ../scripts/Makefile.build obj=scripts/selinux/genheaders \
need-builtin= \
need-modorder= \

make -f ../scripts/Makefile.build obj=scripts/selinux/mdp \
need-builtin= \
need-modorder= \

# LEX     scripts/genksyms/lex.lex.c
  flex -oscripts/genksyms/lex.lex.c -L ../scripts/genksyms/lex.l
# YACC    scripts/genksyms/parse.tab.[ch]
  bison --version >/dev/null; bison -o scripts/genksyms/parse.tab.c --defines=scripts/genksyms/parse.tab.h -t -l ../scripts/genksyms/parse.y 2>/dev/null
# HOSTCC  scripts/selinux/genheaders/genheaders
  gcc -Wp,-MMD,scripts/selinux/genheaders/.genheaders.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I../include/uapi -I../include -I../security/selinux/include  -I ./scripts/selinux/genheaders   -o scripts/selinux/genheaders/genheaders ../scripts/selinux/genheaders/genheaders.c   
# HOSTCC  scripts/selinux/mdp/mdp
  gcc -Wp,-MMD,scripts/selinux/mdp/.mdp.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I../include/uapi -I../include -I../security/selinux/include -I./include  -I ./scripts/selinux/mdp   -o scripts/selinux/mdp/mdp ../scripts/selinux/mdp/mdp.c   
# HOSTCC  scripts/sorttable
  gcc -Wp,-MMD,scripts/.sorttable.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I../tools/include -I ./scripts   -o scripts/sorttable ../scripts/sorttable.c   -lpthread
# HOSTCC  scripts/kallsyms
  gcc -Wp,-MMD,scripts/.kallsyms.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts   -o scripts/kallsyms ../scripts/kallsyms.c   
   ld -r -o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/libsubcmd-in.o  /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/exec-cmd.o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/help.o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/pager.o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/parse-options.o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/run-command.o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/sigchain.o /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/subcmd-config.o
# HOSTCC  scripts/genksyms/genksyms.o
  gcc -Wp,-MMD,scripts/genksyms/.genksyms.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/genksyms -c -o scripts/genksyms/genksyms.o ../scripts/genksyms/genksyms.c
rm -f /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/libsubcmd.a && ar rcs /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/libsubcmd.a /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libsubcmd/libsubcmd-in.o
# HOSTCC  scripts/genksyms/parse.tab.o
  gcc -Wp,-MMD,scripts/genksyms/.parse.tab.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/genksyms -I ./scripts/genksyms -c -o scripts/genksyms/parse.tab.o scripts/genksyms/parse.tab.c
# HOSTCC  scripts/asn1_compiler
  gcc -Wp,-MMD,scripts/.asn1_compiler.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I../include -I ./scripts   -o scripts/asn1_compiler ../scripts/asn1_compiler.c   
# HOSTCC  scripts/sign-file
  gcc -Wp,-MMD,scripts/.sign-file.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -DOPENSSL_LOAD_CONF -I ./scripts   -o scripts/sign-file ../scripts/sign-file.c   -lcrypto
# HOSTCC  scripts/genksyms/lex.lex.o
  gcc -Wp,-MMD,scripts/genksyms/.lex.lex.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h -I ../scripts/genksyms -I ./scripts/genksyms -c -o scripts/genksyms/lex.lex.o scripts/genksyms/lex.lex.c
# HOSTLD  scripts/genksyms/genksyms
  gcc   -o scripts/genksyms/genksyms scripts/genksyms/genksyms.o scripts/genksyms/parse.tab.o scripts/genksyms/lex.lex.o   
make -f ../scripts/Makefile.build obj=scripts/mod
# CC      scripts/mod/empty.o
  gcc -Wp,-MMD,scripts/mod/.empty.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=../= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mno-riscv-attribute -Wa,-mno-arch-attr -mstrict-align -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5 -I../scripts/mod -Iscripts/mod    -DKBUILD_MODFILE='"scripts/mod/empty"' -DKBUILD_BASENAME='"empty"' -DKBUILD_MODNAME='"empty"' -D__KBUILD_MODNAME=kmod_empty -c -o scripts/mod/empty.o ../scripts/mod/empty.c  
# cmd_gen_symversions_c scripts/mod/empty.o
  if nm scripts/mod/empty.o 2>/dev/null | grep -q ' __export_symbol_'; then gcc -E -D__GENKSYMS__ -Wp,-MMD,scripts/mod/.empty.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=../= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mno-riscv-attribute -Wa,-mno-arch-attr -mstrict-align -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5 -I../scripts/mod -Iscripts/mod    -DKBUILD_MODFILE='"scripts/mod/empty"' -DKBUILD_BASENAME='"empty"' -DKBUILD_MODNAME='"empty"' -D__KBUILD_MODNAME=kmod_empty ../scripts/mod/empty.c | scripts/genksyms/genksyms  -T scripts/mod/empty.symtypes   -r /dev/null >> scripts/mod/.empty.o.cmd; fi
# CC      scripts/mod/devicetable-offsets.s
  gcc -Wp,-MMD,scripts/mod/.devicetable-offsets.s.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=../= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mno-riscv-attribute -Wa,-mno-arch-attr -mstrict-align -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -I../scripts/mod -Iscripts/mod -DKBUILD_MODFILE='"scripts/mod/devicetable-offsets"' -DKBUILD_BASENAME='"devicetable_offsets"' -DKBUILD_MODNAME='"devicetable_offsets"' -D__KBUILD_MODNAME=kmod_devicetable_offsets -fverbose-asm -S -o scripts/mod/devicetable-offsets.s ../scripts/mod/devicetable-offsets.c
# HOSTCC  scripts/mod/mk_elfconfig
  gcc -Wp,-MMD,scripts/mod/.mk_elfconfig.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/mod   -o scripts/mod/mk_elfconfig ../scripts/mod/mk_elfconfig.c   
# HOSTCC  scripts/mod/ksym-provides.o
  gcc -Wp,-MMD,scripts/mod/.ksym-provides.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/mod -c -o scripts/mod/ksym-provides.o ../scripts/mod/ksym-provides.c
# MKELF   scripts/mod/elfconfig.h
  scripts/mod/mk_elfconfig < scripts/mod/empty.o > scripts/mod/elfconfig.h
set -e; mkdir -p scripts/mod/; trap "rm -f scripts/mod/.tmp_devicetable-offsets.h" EXIT; { 	 echo "#ifndef __DEVICETABLE_OFFSETS_H__"; echo "#define __DEVICETABLE_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed -ne 	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; /^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < scripts/mod/devicetable-offsets.s; echo ""; echo "#endif"; } > scripts/mod/.tmp_devicetable-offsets.h; if [ ! -r scripts/mod/devicetable-offsets.h ] || ! cmp -s scripts/mod/devicetable-offsets.h scripts/mod/.tmp_devicetable-offsets.h; then : '  UPD     scripts/mod/devicetable-offsets.h'; mv -f scripts/mod/.tmp_devicetable-offsets.h scripts/mod/devicetable-offsets.h; fi
# HOSTLD  scripts/mod/ksym-provides
  gcc   -o scripts/mod/ksym-provides scripts/mod/ksym-provides.o   -lelf
# HOSTCC  scripts/mod/symsearch.o
  gcc -Wp,-MMD,scripts/mod/.symsearch.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/mod -c -o scripts/mod/symsearch.o ../scripts/mod/symsearch.c
# HOSTCC  scripts/mod/sumversion.o
  gcc -Wp,-MMD,scripts/mod/.sumversion.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/mod -c -o scripts/mod/sumversion.o ../scripts/mod/sumversion.c
make[4]: *** [Makefile:164: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
make[3]: *** [Makefile:63: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/linux-obj/tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2
make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc1/linux-6.12-rc1/Makefile:1393: tools/bpf/resolve_btfids] Error 2
make[1]: *** Waiting for unfinished jobs....
# HOSTCC  scripts/mod/modpost.o
  gcc -Wp,-MMD,scripts/mod/.modpost.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/mod -c -o scripts/mod/modpost.o ../scripts/mod/modpost.c
# HOSTCC  scripts/mod/file2alias.o
  gcc -Wp,-MMD,scripts/mod/.file2alias.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11   -I ../scripts/include -include /home/abuild/rpmbuild/SOURCES/host-memcpy-hack.h  -I ./scripts/mod -c -o scripts/mod/file2alias.o ../scripts/mod/file2alias.c
# HOSTLD  scripts/mod/modpost
  gcc   -o scripts/mod/modpost scripts/mod/modpost.o scripts/mod/file2alias.o scripts/mod/sumversion.o scripts/mod/symsearch.o   
make -f ../scripts/Makefile.build obj=. prepare
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.tmp_timeconst.h" EXIT; { echo 300 | bc -q ../kernel/time/timeconst.bc; } > include/generated/.tmp_timeconst.h; if [ ! -r include/generated/timeconst.h ] || ! cmp -s include/generated/timeconst.h include/generated/.tmp_timeconst.h; then : '  UPD     include/generated/timeconst.h'; mv -f include/generated/.tmp_timeconst.h include/generated/timeconst.h; fi
# CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s:// ::p' ../include/linux/atomic/atomic-instrumented.h)" != "$(sed '$d' ../include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')" ]; then echo "error: ../include/linux/atomic/atomic-instrumented.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
# CHKSHA1 ../include/linux/atomic/atomic-long.h
  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s:// ::p' ../include/linux/atomic/atomic-long.h)" != "$(sed '$d' ../include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then echo "error: ../include/linux/atomic/atomic-long.h has been modified." >&2; exit 1; fi; touch .checked-atomic-long.h
# CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s:// ::p' ../include/linux/atomic/atomic-arch-fallback.h)" != "$(sed '$d' ../include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/ .*//')" ]; then echo "error: ../include/linux/atomic/atomic-arch-fallback.h has been modified." >&2; exit 1; fi; touch .checked-atomic-arch-fallback.h
# CC      kernel/bounds.s
  gcc -Wp,-MMD,kernel/.bounds.s.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=../= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mno-riscv-attribute -Wa,-mno-arch-attr -mstrict-align -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -I../. -I. -DKBUILD_MODFILE='"./bounds"' -DKBUILD_BASENAME='"bounds"' -DKBUILD_MODNAME='"bounds"' -D__KBUILD_MODNAME=kmod_bounds -fverbose-asm -S -o kernel/bounds.s ../kernel/bounds.c
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.tmp_bounds.h" EXIT; { 	 echo "#ifndef __LINUX_BOUNDS_H__"; echo "#define __LINUX_BOUNDS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed -ne 	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; /^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < kernel/bounds.s; echo ""; echo "#endif"; } > include/generated/.tmp_bounds.h; if [ ! -r include/generated/bounds.h ] || ! cmp -s include/generated/bounds.h include/generated/.tmp_bounds.h; then : '  UPD     include/generated/bounds.h'; mv -f include/generated/.tmp_bounds.h include/generated/bounds.h; fi
# CC      arch/riscv/kernel/asm-offsets.s
  gcc -Wp,-MMD,arch/riscv/kernel/.asm-offsets.s.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=../= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mno-riscv-attribute -Wa,-mno-arch-attr -mstrict-align -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -I../. -I. -DKBUILD_MODFILE='"./asm-offsets"' -DKBUILD_BASENAME='"asm_offsets"' -DKBUILD_MODNAME='"asm_offsets"' -D__KBUILD_MODNAME=kmod_asm_offsets -fverbose-asm -S -o arch/riscv/kernel/asm-offsets.s ../arch/riscv/kernel/asm-offsets.c
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.tmp_asm-offsets.h" EXIT; { 	 echo "#ifndef __ASM_OFFSETS_H__"; echo "#define __ASM_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed -ne 	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; /^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < arch/riscv/kernel/asm-offsets.s; echo ""; echo "#endif"; } > include/generated/.tmp_asm-offsets.h; if [ ! -r include/generated/asm-offsets.h ] || ! cmp -s include/generated/asm-offsets.h include/generated/.tmp_asm-offsets.h; then : '  UPD     include/generated/asm-offsets.h'; mv -f include/generated/.tmp_asm-offsets.h include/generated/asm-offsets.h; fi
# CALL    ../scripts/checksyscalls.sh
  sh ../scripts/checksyscalls.sh gcc -Wp,-MMD,./.missing-syscalls.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../include/linux/compiler_types.h -D__KERNEL__ -fmacro-prefix-map=../= -std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=lp64 -march=rv64imac_zicsr_zifencei -mno-save-restore -DCONFIG_PAGE_OFFSET=0xff60000000000000 -mcmodel=medany -fno-asynchronous-unwind-tables -fno-unwind-tables -mno-riscv-attribute -Wa,-mno-arch-attr -mstrict-align -fno-delete-null-pointer-checks -O2 -fno-allow-store-data-races -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -fconserve-stack -Wall -Wundef -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=2048 -Wno-main -Wno-dangling-pointer -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-overflow -Wno-array-bounds -Wno-alloc-size-larger-than -Wimplicit-fallthrough=5 -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wenum-conversion -Wextra -Wunused -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-packed-not-aligned -Wno-format-overflow -Wno-format-truncation -Wno-stringop-truncation -Wno-override-init -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-maybe-uninitialized -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5 -I../. -I.    -DKBUILD_MODFILE='"./missing-syscalls"' -DKBUILD_BASENAME='"missing_syscalls"' -DKBUILD_MODNAME='"missing_syscalls"' -D__KBUILD_MODNAME=kmod_missing_syscalls 
make: *** [../Makefile:224: __sub-make] Error 2

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
