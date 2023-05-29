Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D12FC77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 08:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/kMRv2SweiRP6o5D57G5KnP1QGrUVunzhSeFjm6rAQ=; b=AKd34KcOxG2UAr
	HVHc54/hE5YsbIqxB03z51AeOnHXfGAtYHKwIOmEYD5Sz51YU4/y8DtD08Z4gJ/Sc9DFfmegFCXDZ
	X73jbaPWSinEB61UMQwQWwyhAdKeYRm+xLlDJuS9rm8IUJhrwlm/CWePEaYkjQ3Z8XTPGIWreD8PG
	mfS1zsqXbRG9uk5DP1eksq6oteMpWz5YfprC5W8NzArzoriOjZk8/hKOd8qMyqTWuGgs+mIAX+hNE
	UWMmf5soAy/fXVzbZYVGy+PZMkdktJM61PUrYUaVIdtdjut73O+001vYkq47qpp8i2XQbpO86nN6G
	LxMJcu511VHTQMaenvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YVm-009kjm-25;
	Mon, 29 May 2023 08:45:54 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YVi-009kh4-2e
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 08:45:52 +0000
Date: Mon, 29 May 2023 10:45:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685349941; bh=AZqKCb/+43xkqfj70QjDvCRDiRJdpJQUwxDZaDYt4jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3aOYJzcyvdIdIUgyaTdb0YVI5MQzneNbZD1/Csp3GEdw0xlvN0SrWmgTjQoHjUOg
	 dVzqbLntxX75qsmEnL1gYvZ+ibMMRe5gnMrw9CDb/iM+mdcKfrcMYYzNyAN0hIUIbe
	 pgx/4VncQWRMYNRRnPcffTRSAQACzC4Qz7X46PSU=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Message-ID: <f7332511-bb3f-4067-a0af-b6880294eded@t-8ch.de>
References: <b25f79f0-a8fb-428a-ad54-fc4afe0df6ff@t-8ch.de>
 <20230528183906.22547-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230528183906.22547-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_014551_033610_E72220CB 
X-CRM114-Status: GOOD (  37.30  )
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

On 2023-05-29 02:39:06+0800, Zhangjin Wu wrote:
> > May 28, 2023 12:40:31 Zhangjin Wu <falcon@tinylab.org>:
> > >> On Thu, May 25, 2023 at 01:33:14AM +0800, Zhangjin Wu wrote:
> > >>> Hi, Willy
> > >>>
> > >>> Thanks very mush for your kindly review, discuss and suggestion, now we
> > >>> get full rv32 support ;-)
> > >>>
> > >>> In the first series [1], we have fixed up the compile errors about
> > >>> _start and __NR_llseek for rv32, but left compile errors about tons of
> > >>> time32 syscalls (removed after kernel commit d4c08b9776b3 ("riscv: Use
> > >>> latest system call ABI")) and the missing fstat in nolibc-test.c [2],
> > >>> now we have fixed up all of them.
> > >>
> > >> (...)
> > >>
> > >> I have read the comments that others made on the series and overall
> > >> agree. I've seen that you intend to prepare a v2. I think we must
> > >> first decide how to better deal with emulated syscalls as I said in
> > >> an earlier message. Probably that we should just add a specific test
> > >> case for EFAULT in nolibc-test since it's the only one (I think) that
> > >> risks to trigger crashes with emulated syscalls. We could also imagine
> > >> dealing with the signal ourselves but I'm not that keen on going to
> > >> implement signal() & longjmp() for now :-/
> > >>
> > >
> > > Yes, user-space signal() may be the right direction, we just need to let
> > > user-space not crash the kernel, what about this 'solution' for current stage
> > > (consider the pure time64 support too):
> >
> > If you did manage to crash the actual kernel than that would be a bug in the kernel that needs to be fixed.
> > Feel free to describe how it happened and I'll take a look.
> >
> 
> Sorry, my description above is not really right, the sigsegv (11) signal will
> be sent to our program when it tries to write something to the address: (void
> *)1 for this test case tries to do/test so:
> 
>     CASE_TEST(gettimeofday_bad1); EXPECT_SYSER(1, gettimeofday((void *)1, NULL), -1, EFAULT); break;

<snip>

>    35 gettimeofday_bad1init[1]: unhandled signal 11 code 0x1 at 0x00000002 in init[10000+5000]
>         CPU: 0 PID: 1 Comm: init Not tainted 6.4.0-rc1-00137-gfdc311fa22ed-dirty #60
>         Hardware name: riscv-virtio,qemu (DT)
>         epc : 00012c90 ra : 00012c6c sp : 9d097d90
>          gp : 00016800 tp : 00000000 t0 : 00000000
>          t1 : 0000000a t2 : 00000000 s0 : 00000001
>          s1 : 00016008 a0 : 00000000 a1 : 9d097da8
>          a2 : 00000014 a3 : 00000000 a4 : 00000000
>          a5 : 00000000 a6 : 00000001 a7 : 00000193
>          s2 : 00000023 s3 : 00000000 s4 : 9d097da4
>          s5 : 00000000 s6 : 0000541b s7 : 00000007
>          s8 : 9d097dcc s9 : 00014474 s10: 00016000
>          s11: 00000006 t3 : 00000000 t4 : ffffffff
>          t5 : 00000000 t6 : 00000000
>         status: 00000020 badaddr: 00000002 cause: 0000000f
>         Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> Because our test run nolibc-test as init of initramfs on qemu, when init exit
> but not reboot as normally, then it 'crashes' the kernel (kernel panic above).

This makes sense, thanks. I just wanted to make sure no kernel bugs were
going unhandeld.

> If we have sigaction()/sigsetjmp/siglongjump support, then, we can call
> 'reboot()' in sigsegv signal handler, and event let it continue the other test
> cases. sigaction seems only work to trigger when to call siglongjump,
> siglongjump ask sigsetjmp to do the real recover action.
> 
> I did find some useful urls, and wrote such an exception restore logic, not
> completely, not support NOLIBC_TEST environment variables yet.

<lots of implementation>

> usage:
> 
>     $ gcc -o nolibc-test tools/testing/selftests/nolibc/nolibc-test.c
>     $ ./nolibc-test
>     ...
>     35 gettimeofday_tz = 0                                           [OK]
>     36 gettimeofday_tv_tz = 0                                        [OK]
>     37 gettimeofday_bad1 = -1                                       [FAIL] (continued by sigaction/siglongjmp/sigsetjmp)
>     38 gettimeofday_bad2 = -1                                       [FAIL] (continued by sigaction/siglongjmp/sigsetjmp)
>     39 getpagesize = 0                                               [OK]
>     40 ioctl_tiocinq = 0                                             [OK]
>     41 ioctl_tiocinq = 0                                             [OK]
>     ...
> 
> It did work as expected, but for nolibc, we still need to add sigaction/siglongjump/sigsetjmp support.
> 
> Will send a patch based on Willy's latest branch, perhaps this may help us to
> verify the future sigaction/siglongjump/sigsetjmp for nolibc.
> 
> ref: https://www.ibm.com/docs/en/i/7.1?topic=ssw_ibm_i_71/apis/sigsetj.html
>      https://www.ibm.com/docs/en/zos/2.1.0?topic=functions-siglongjmp-restore-stack-environment-signal-mask

This seems very complicated for fairly limited gain to be honest.

If we really want to keep the current testcase we could also ensure that
the pointer does not fall into the first page, as the first page is not
mapped under Linux:

0 <= addr < PAGE_SIZE

Or instead of PAGE_SIZE just hardcode 4096, as that should be the
minimum size and and does not require a lookup.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
