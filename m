Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5094CC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKdoW09vY0+sY6UtuXiEL75cD0o+FYO32fvoz7WKn6w=; b=UaPglyxIZCf+Qc
	FJrviPqP/sUZClTpcbgyEY6csVyRTdwtdF7QjMUi6ObHHhIVnbzrxfspoiOCvmR171QKDLH7rWQfO
	aq6PuGxNFren3WBerCF92V7UcmVorYRUSF8F4oFjaI0RK5wy7fLCYJjjJ4Z23kQTGrWZ6mLd/IMML
	nhmnCyYcyDsen6e8/mJxh+wAi3wyHx6ugFbfarnLdmeIP0RwAT9FYt9RrWFI0tmIe5iW8rdo9G1Un
	tlql2nvFDRFwTpFs6fMRjsem/T/XX8AVDRqgnSK2bQJtDzvZ8J3yX/l4OdkN2ubm9m+GwmJfRiIll
	5zQaos/c+piPKZmY0XrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3EB6-007VB8-1u;
	Sun, 28 May 2023 11:03:12 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3EB4-007VAd-1L
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 11:03:12 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34SB35t5002033;
	Sun, 28 May 2023 13:03:05 +0200
Date: Sun, 28 May 2023 13:03:05 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Zhangjin Wu <falcon@tinylab.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/13] tools/nolibc: sys_poll: riscv: use
 __NR_ppoll_time64 for rv32
Message-ID: <20230528110305.GI1956@1wt.eu>
References: <83ab9f47-e1ed-463c-a717-26aad6bf2b71@app.fastmail.com>
 <20230528082509.293250-1-falcon@tinylab.org>
 <20230528102947.GH1956@1wt.eu>
 <afc4944f-9494-4367-906d-06ac47648ab7@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afc4944f-9494-4367-906d-06ac47648ab7@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_040310_890865_DE3E0F9F 
X-CRM114-Status: GOOD (  20.57  )
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

On Sun, May 28, 2023 at 12:55:47PM +0200, Arnd Bergmann wrote:
> On Sun, May 28, 2023, at 12:29, Willy Tarreau wrote:
> > On Sun, May 28, 2023 at 04:25:09PM +0800, Zhangjin Wu wrote:
> >> 
> >> * Use __kernel_timespec as timespec
> >> * Use 64bit time_t based struct timeval
> >>     * Disable gettimeofday syscall completely for 32bit platforms
> >>         * And disable the gettimeofday_bad1/2 test case too
> >
> > When you say "disable", you mean "remap", right ? Or do you mean
> > "break in 2023 code that was expected to break only in 2038 after
> 
> clock_gettime() has been supported for a very long time, so both
> time() and gettimeofday() can be trivial wrappers around that.

OK, that's what I wanted to clarify. I understood "drop" in the sense
of, well, "drop" :-)

> Nothing really should be using the timezone argument, so I'd
> just ignore that in nolibc. (it's a little trickier for /sbin/init
> setting the initial timezone, but I hope we can ignore that here).

Yes I'm fine with this approach.

> clock_gettime() as a function call that takes a timespec argument
> in turn should be a wrapper around either sys_clock_gettime64 (on
> 32-bit architectures) or sys_clock_gettime_old() (on 64-bit
> architectures, or as a fallback on old 32-bit kernels after
> clock_gettime64 fails).

Sounds good to me.

> On normal libc implementations, the low-level
> sys_clock_gettime64() and sys_clock_gettime_old(), whatever
> they are named, would call vdso first and then fall back
> to the syscall, but I don't think that's necessary for nolibc.

Indeed, we don't exploit the VDSO here since it's essentially useful
for performance and that's not what we're seeking.

> I'd define them the same as the kernel, with
> sys_clock_gettime64() taking a __kernel_timespec, and
> sys_clock_gettime_old() takeing a __kernel_old_timespec.

Sounds good, thanks Arnd!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
