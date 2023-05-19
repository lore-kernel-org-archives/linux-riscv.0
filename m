Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1750FC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EKXYEMXHUMen3zKjhDEUWgED9CgidNH1bnWEyLP0Bo=; b=aWiHRjj1EKDIIA
	U+XlhkxRWs0xV6tkwWmryWBVGDd04xeBV6Oau/VZWFoUD7PEOgFhi0jukZ1tgEOmjaD4PoK0hXVE4
	Jo0QxkJY+BeprsA6hLkvltf17jSbDtW+MC9Zloe8AkXbzRiN+DPVq15cM1ejH4dbj5PogDhoGY5D6
	JZV9c/Fno63yZrrS/FBlRPbILWkMbS6oBIDb4Ea64KKjREeei0mPTqgFP44nYF882o37alUNRZuF0
	qdQBeqrO82vzf6zebf7bscYZRPF2p41DSiDpqB2/UVz3MHdd8TGfHsi+Q/IA9TeSd572I5Solr+T6
	KWSsPXE1kTuRUeiJiAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwbn-00FkyT-1g;
	Fri, 19 May 2023 09:41:11 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzwbj-00Fkov-23
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 09:41:09 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34J9eU7k025050;
	Fri, 19 May 2023 11:40:30 +0200
Date: Fri, 19 May 2023 11:40:30 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Message-ID: <20230519094030.GA24947@1wt.eu>
References: <cover.1684425792.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1684425792.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_024108_106797_FF02933D 
X-CRM114-Status: GOOD (  25.66  )
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

Hi Zhangjin,

On Fri, May 19, 2023 at 01:00:18AM +0800, Zhangjin Wu wrote:
> Hi, Willy
> 
> nolibc for riscv is only tested for rv64 currently (see
> tools/testing/selftests/nolibc/Makefile), this patchset tries to let it
> compile for rv32, but still not pass the nolibc selftest:
> 
> * The first patch uses lw/sw instead of ld/sd for rv32 and verse-vice for rv64
>     * This patch may conflict with the stackprotector patch [1], because
>       both of them changed the _start assembly in arch-riscv.h

That's quite embarrassing, I'm having to trace of that series here. Now
I can find it in my LKML archives, but I don't have the direct message and
didn't spot the other ones. I'll have to investigate, thanks for notifying
me! I'm CCing Thomas, I will check with him how to best merge the two.

> * The second patch adds __NR_llseek based sys_lseek implementation for rv32
>     * There is no __NR_lseek for rv32, see include/uapi/asm-generic/unistd.h
>     * This code is based on the version from glibc, sysdeps/unix/sysv/linux/lseek.c
>     * It passed the two lseek tests in nolibc selftest (write a test case manually)

OK.

> * To let it compile for rv32, we still need to apply one of such actions:
>     * Revert the kernel commit d4c08b9776b3 ("riscv: Use latest system call ABI"),
>       but it is not the right direction, that commit has removed all of the time32 syscalls,
>       and let C lib (e.g. glibc) provide the same C APIs based on the other time64 syscalls
> 
>     * If not really use any of the time32 syscalls, defining __ARCH_WANT_TIME32_SYSCALLS
>       macro will let it compile, but this is buggy for the current implmentations are based
>       on time32 syscalls!
> 
>     * Really implement the C APIs for rv32, based on the time64 syscalls, just like glibc.
>       This commit c8ce48f06503 ("asm-generic: Make time32 syscall numbers optional") shows
>       us which functions should be re-implemented.
> 
> So, the work todo for rv32 is:
> 
> * Rebasing all of the old time32 syscalls based C APIs on the new time64 syscalls,
>   but they are not simply mapped one by one, glibc is a good reference.
> 
> * Add standalone rv32 test support in tools/testing/selftests/nolibc/

I'm not the right one to judge how to best support rv32 but at least I just
don't want to go backwards. I'm just having a probably stupid question, but
how relevant is rv32 ? I mean, all the boards I've seen to date were based
on rv64 even the smallest embedded ones, so I'm sincerely wondering if there
exists at all any rv32 devices capable of running Linux. Because if that's
not the case, maybe we should instead declare that we only support rv64 ?
If such devices exist however, I'm all for us supporting them well.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
