Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BF7C433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 20:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B324207FF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 20:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aUa1kV5z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oGAzhAYn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B324207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oOo0YxmDN7wak4eT8k9euHOXmNLlQ+jwK8fmUGozlYY=; b=aUa1kV5zsjz4fjhepXj1NmSXG
	c9W9aLmVm3/k5TKAImvo7wd73OtRkgUD61gqjn/DaMtAAxtysdCWPoomaoR49ENZSgXZk9r9FAd1z
	5PAKPAqzot2+cLkH2g8e75wpI+Ki8ohowHOQFkpkuFtoLZVKWWfgPND5pfN8PnK900uJVdIU1EbVz
	ylefNHIEd1k31FNir1wLVW3+GurOfWvesrlAMG3GgbjrumJJFauXiVGa+QXarptMQ0P0PRnAJTAsP
	bK0bF8MdKtmtmGK2s50ekxTScY66wJ9ieu2eXvK3lAUFiAUjeVSgUSZ/tmffc7VfRm2Lnp3JiwEF1
	xbaPHL9eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8UHq-0003xr-QS; Wed, 19 Aug 2020 20:02:18 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8UHo-0003wh-2P
 for linux-riscv@lists.infradead.org; Wed, 19 Aug 2020 20:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597867336; x=1629403336;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=/WuUsWWRaL1RoCuSGDbDXqbB2zUmPQ8qHvxQ39aJ2XE=;
 b=oGAzhAYnQzcdGnvdupW+CxpF+pRHbV4e2IR8A2LtUKNFRKgBG89VUGiZ
 LwI7VfGDBFQezzJj3oaVlv76mN++HPvk9dQchjh5T+Xx4UG5C+QYyJ11f
 zBeklDUPdM+0cnSdfPbwwQNheRryyIvfqp/gfbUYDboCvoKQGkyDBX2Gg
 WAu5Z1yRADdHPtbPPttcQgHj5VUp2zQAHlv5yMAHy2VS8MaZ1qwax/krJ
 f5bF4Lqs5dnvCZ4Vluj4PTMGblsW/CSVwn+nK3KAKKF1OzGvoL3ejNUM7
 SoA4PCA1D4DAnsrdxD60vL74i9/3BHRTOKfRHBGhSvvwlT0Y/SflHwutc g==;
IronPort-SDR: zCrPC0nr+m6DnX4dPIsu0DS8465kQLTdhbeofRsp6l6MZVW2eIjLPDOwmSG12fxps4CFIx7wAt
 L0PbutI1h2BaEGenA2vtowllyykXuaH80B/mTw1XDLafBb/SUrb8mK9K5DAW46plcLdZGtROfC
 gZhKx5lBixy0TfcJrOGPUZqerXB4rfKLi2kNIwAQ9l7px/kdGAyVF5AIG66wbY104NMm7FyuSs
 8xdx7l6lAPOtpi0rwoq6HZORBM6cV4WRtU7mddFAh7I0zlhfxRKSwQ1jCAST0CB2xs9AL2CkNh
 2Dk=
X-IronPort-AV: E=Sophos;i="5.76,332,1592841600"; d="scan'208";a="254789733"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Aug 2020 04:02:12 +0800
IronPort-SDR: CjNTMCJwZHvTI2Fyz3KgbMkXaLWHiWVt2pHu/RQzhhMHZUKTk8tgOYWuqagEY67rIkt+NYPfmN
 5IkBCC3EqGfg==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 12:49:09 -0700
IronPort-SDR: lgC0qzfmt+LZzgs6kv/HBx4AvEFDNKPlHG7WS3l2eueThUpIpnLKMnCur05odAaPlQfkGCiGdB
 +xazf3+SHAFw==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 13:02:12 -0700
Date: Wed, 19 Aug 2020 21:00:46 +0100 (BST)
From: "Maciej W. Rozycki" <macro@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <mhng-6e42b0e6-1f3b-41a3-a023-4145fb4d8980@palmerdabbelt-glaptop1>
Message-ID: <alpine.LFD.2.21.2008190019480.24175@redsun52.ssa.fujisawa.hgst.com>
References: <mhng-6e42b0e6-1f3b-41a3-a023-4145fb4d8980@palmerdabbelt-glaptop1>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_160216_391972_143C2C9E 
X-CRM114-Status: GOOD (  23.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 5 Aug 2020, Palmer Dabbelt wrote:

> >  I can push linux-next through regression-testing with RISC-V gdbserver
> > and/or native GDB if that would help.  This is also used with core dumps,
> > but honestly I don't know what state RISC-V support is in in the BFD/GDB's
> > core dump interpreter, as people tend to forget about the core dump
> > feature nowadays.
> 
> IIRC Andrew does GDB test suite runs sometimes natively on Linux as part of
> general GDB maintiance and we don't see major issues, but I'm pretty checked
> out of GDB development these days so he would know better than I do.  It's
> always great to have someone test stuff, though -- and I doubt he's testing
> linux-next.  It's been on my TODO list for a long time now to put together
> tip-of-tree testing for the various projects but I've never gotten around to
> doing it.

 I have now run GDB regression testing with remote `gdbserver' on a HiFive 
Unleashed, lp64d ABI only, comparing 5.8.0-next-20200814 against 5.8.0-rc5 
with no issues observed.

> Oddly enough, despite not really using GDB I have used it for core dumps -- I
> was writing a tool to convert commit logs to coredumps with the GDB reverse
> debugging annotations, but I never got around to finishing it.

 I fiddled with core dump handling verification for GDB back in my MIPS 
days expanding an existing test case to interpret an OS-generated core 
dump in addition to one produced by GDB's `gcore' command, although in the 
case of local testing only (i.e. either native or running `gdbserver' on 
the same test machine GDB runs); this restriction is due to the need to 
isolate the core file produced, as it may or may not have a .$pid suffix 
attached (or may have yet another name variation with non-Linux targets), 
which is somewhat complicated with commands run remotely (though I imagine 
the restriction could be lifted by someone sufficiently inclined).

 The relevant tests results are as follows (on a successful run):

PASS: gdb.threads/tls-core.exp: native: load core file
PASS: gdb.threads/tls-core.exp: native: print thread-local storage variable
PASS: gdb.threads/tls-core.exp: gcore: load core file
PASS: gdb.threads/tls-core.exp: gcore: print thread-local storage variable

and the binutils-gdb change is commit d9f6d7f8b636 ("testsuite: Extend TLS 
core file testing with an OS-generated dump").  So that part should be 
covered at least to some extent by automated testing.

 However something is not exactly right and I recall having an issue 
recorded for later investigation (which may not happen given the recent 
turn of events) that RISC-V/Linux does not actually dump cores even in the 
circumstances it is supposed to (i.e. the combination of the specific 
signal delivered and RLIMIT_CORE set to infinity imply it).

 Indeed I have run the test natively now and I got:

PASS: gdb.threads/tls-core.exp: successfully compiled posix threads test case
WARNING: can't generate a core file - core tests suppressed - check ulimit -c
PASS: gdb.threads/tls-core.exp: gcore
UNSUPPORTED: gdb.threads/tls-core.exp: native: load core file
UNSUPPORTED: gdb.threads/tls-core.exp: native: print thread-local storage variable
PASS: gdb.threads/tls-core.exp: gcore: load core file
PASS: gdb.threads/tls-core.exp: gcore: print thread-local storage variable

which means things are not actually sound.  Likewise if I run the test 
program manually:

$ ulimit -c
unlimited
$ ./tls-core
Aborted (core dumped)
$ ls -la core*
ls: cannot access 'core*': No such file or directory
$ 

-- oops!

 [As it turned out MIPS core dump handling was completely messed up both 
on the Linux and the GDB side.  See binutils-gdb commit d8dab6c3bbe6 
("MIPS/Linux: Correct o32 core file FGR interpretation") if interested; 
there are further Linux commit references there.]

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
