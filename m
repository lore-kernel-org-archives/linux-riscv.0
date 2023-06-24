Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08865EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zku8LlXEK1KzdqDcYrq6H7p+w/bS3HqK0ngs9v9nPAc=; b=3UUQ9xPaOOAbuE
	tW3PHazmTvQz6gFMlTcNh+D/actlP3mwjUyPW4hwhQ6zJPp0UKOlJ8M6eTHHXp6r4JoJPUWUC3tTQ
	tJSH1EfAHw+l7qUQImthHcnIkQysCwRHouFz6BEqtOu70imn9Vga7VL5j4quf3RpxucW44X3z7RSQ
	cFgpMo3BQxEMytgVO6g5nDqz7eb1CHzX9M6Aqb7GMVKA8iwmpD86VYYoxxg1ZkLVlmz36w3b8y/uI
	RoXknAthRK1lroOm7is34qIvB+MgW27x/aS0eQjCHoj/ecjyhPqvzgn5k0KPXeOPI/KaJhtg5XSWW
	rd3KOCZat0kEC3EZKYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy09-005S25-2r;
	Sat, 24 Jun 2023 07:48:09 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCy06-005Rzg-03
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 07:48:09 +0000
X-QQ-mid: bizesmtp69t1687592856t8jmq2cy
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 24 Jun 2023 15:47:35 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: /rrU+puPB7TMQuMP1erzBvP+Z8py1YsIU1LjWUtYGWooMsi5DJqGYdfGam6AA
	dR7PHHd5oj9w4p9f+9Z6v1asuOroiuC9ym61+SNCA9XQ1BOHGCDN9uphY8Xnx5GWe/r09Fc
	b+82BAl6E8YFWyYdSlT1RJHiHeVYXXHyGeYRuT9C6d1LTjpNc1I50iT8l4mLYXLhNFoyI/d
	PG2xqY3pkwrvumV609NDGMgMuLmI0RjM6s5aVq62InxaAXst15Od3RLk0j6TX7+qY804VoL
	+4ZNNNtqpmykOmcRKd1NU4eSt/1gZ47UYDms3sJG7mPWHXZRXlcxR9TGYkAUm3V+lFGVxYY
	FF+AQaN4LzOh0xgRT5oJAI+wD4YfHJ3GMLdvbgh
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3816886055142245368
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH v4 10/10] selftests/nolibc: add mmap and munmap test cases
Date: Sat, 24 Jun 2023 15:47:21 +0800
Message-Id: <20230624074721.587306-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <97fbbe17-b261-475c-8959-71cccaa5a2f5@t-8ch.de>
References: <97fbbe17-b261-475c-8959-71cccaa5a2f5@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_004806_387952_5AC75EBC 
X-CRM114-Status: GOOD (  26.75  )
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

Hi, Thomas

> Hi Zhangjin,
> 
> On 2023-06-23 03:32:49+0800, Zhangjin Wu wrote:
> > > On 2023-06-19 23:55:41+0800, Zhangjin Wu wrote:
> > > > Three mmap/munmap related test cases are added:
> > > > 
(snipped)
> > > >  
> > > > +int test_mmap_munmap(int size)
> > > > +{
> > > > +	char init_files[5][20] = {"/init", "/sbin/init", "/etc/init", "/bin/init", "/bin/sh"};
> > > 
> > > Why not /proc/1/exe or even /proc/self/exe?
> > > 
> > > I know your other series tries to remove the procfs dependency, but
> > > we're not there yet :-).
> > > 
> > 
> > Yeah, '/proc/self/exe' is a choice, if so, the 'has_proc' should be added ;-)
> 
> Currently procfs is a hard requirement. So I would leave 'has_proc' to
> the other series that may change this.
>

Yeah, but to be consistent with the already existing 'proc' condition
check, 'proc' will be used at first ;-)

    $ grep '(proc,' -ur tools/testing/selftests/nolibc/nolibc-test.c 
		CASE_TEST(chmod_net);         EXPECT_SYSZR(proc, chmod("/proc/self/net", 0555)); break;
		CASE_TEST(chmod_self);        EXPECT_SYSER(proc, chmod("/proc/self", 0555), -1, EPERM); break;
		CASE_TEST(chown_self);        EXPECT_SYSER(proc, chown("/proc/self", 0, 0), -1, EPERM); break;
		CASE_TEST(chroot_exe);        EXPECT_SYSER(proc, chroot("/proc/self/exe"), -1, ENOTDIR); break;
		CASE_TEST(link_cross);        EXPECT_SYSER(proc, link("/proc/self/net", "/blah"), -1, EXDEV); break;

Btw, for the /proc/self used in test_stat_timestamps, in the revision of the
'minimal' config support series, instead of using '/', a 'proc' should be added
like above test cases.

> > > Also does it make sense to pass a size parameter?
> > > Why not use either PAGE_SIZE or the real size of the binary from
> > > fstat().
> > > 
> > 
> > Ok, as the manpage of mmap shows:
> > 
> >        For mmap(), offset must be a multiple of the underlying huge page
> >        size.  The system automatically aligns length to be a multiple of
> >        the underlying huge page size.
> > 
> >        For munmap(), addr, and length must both be a multiple of the
> >        underlying huge page size.
> > 
> > perhaps we should do further tests:
> > 
> > * the real size/length
> > * even > the real size
> > * the PAGE_SIZE
> > * not aligned with PAGE_SIZE
> > 
> > If such tests are required, the 'size' and even 'offset' arguments could be
> > provided to cover different combination or we do such tests internally, then,
> > the arguments are not required.
> 
> I think task of nolibc-test is to test the code in nolibc itself.
> The custom mmap implementation is trivial and directly calls the
> syscall. These additionally proposed tests would effectively test the
> core kernels implementation of mmap() and not the code of nolibc.
> 
> Therefore I don't think they are necessary in nolibc-test and the
> functionality is hopefully already be tested in another testsuite.
>

Ok, it is reasonable.
 
> 
> Note:
> 
> Testing mmap is indeed useful to test the implementation of
> my_syscall6() by providing a bogus value in the 'offset' parameter.
> I think we do have such a testcase.
>

Ok, we can pass a valid offset (n*PAGE_SIZE) to mmap() in test_mmap_munmap() or
add a whole new mmap_offset test case with a PAGE_SIZE not aligned offset (such
as 1).

Thanks,
Zhangjin

> <snip>
> 
> Thomas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
