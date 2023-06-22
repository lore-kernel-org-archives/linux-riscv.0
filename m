Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC6EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/9m94QEdR9i6IB4ulf7TeXrM3ZZRTC6SVBG1/ZKsmU=; b=ZRDOLCh1yHJqQX
	1J/UzoydDFrBM216XHFBRSoq+eZwHVq2URlawxS13pCdbB3lNZoo/1RBUbgeTzLPC4+Y+lqe9THBU
	Uu8yYJAKaZwTKxyaZcqRWWjPm3RQaWRVmRXE3qtoP7Pdr6C4ZyHtr5uTbKm/g0yO6pGvWZ+PYUgZg
	4jPpueDF33i0CQsnAIemLtq29nP9Z8xzrjQ6pJKKv6wrsng7W744oGde9si+0EEl5QCRqxj2XG3xY
	fhp1q7gGgL5KC85uXPwETffCCX22gG3IUEt5fqGTJdgA75Ky7KF+uOKabb+rBjV68+bYgYTV57MqK
	EBLSwOUpfOAqTkpuV5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCQPu-001be0-26;
	Thu, 22 Jun 2023 19:56:30 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCQPq-001baP-2G
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 19:56:28 +0000
Date: Thu, 22 Jun 2023 21:56:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1687463780; bh=sjhMAnWC+WRXas1AobjF7bEqN7SCFpSlpfEgghDu3ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lg4BaVBZWGV5eFXgYBMM7duPkZ4vK9SZ9Kd2MWai1NvPvpBmP4Akvz4cYcbP9gAkC
	 f0ePQyBJPmsU1uy7aW8D9ivtVgAcbx0PvfqBqNS8rMSFcRao+HKEkc9mHi8xlwWPbk
	 wFvNiz5HFpPmVzN12e749DBZHpK55liL57uZZZEQ=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, w@1wt.eu
Subject: Re: [PATCH v4 10/10] selftests/nolibc: add mmap and munmap test cases
Message-ID: <97fbbe17-b261-475c-8959-71cccaa5a2f5@t-8ch.de>
References: <bff82ea6-610b-4471-a28b-6c76c28604a6@t-8ch.de>
 <20230622193249.1190336-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622193249.1190336-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_125626_912712_E476411E 
X-CRM114-Status: GOOD (  29.60  )
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

On 2023-06-23 03:32:49+0800, Zhangjin Wu wrote:
> > On 2023-06-19 23:55:41+0800, Zhangjin Wu wrote:
> > > Three mmap/munmap related test cases are added:
> > > 
> > > - mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL)
> > > 
> > >   The length argument must be greater than 0, otherwise, fail with -EINVAL.
> > > 
> > > - munmap((void *)-1, 4*1024), -1, EINVAL)
> > > 
> > >   Invalid (void *)-1 address fail with -EINVAL.
> > > 
> > > - test_mmap_munmap(4*1024)
> > > 
> > >   It finds a init file, mmap() it and then munmap().
> > > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  tools/testing/selftests/nolibc/nolibc-test.c | 31 ++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > > 
> > > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > > index 80ab29e2887c..f7c0ca72cb28 100644
> > > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > > @@ -592,6 +592,34 @@ static int test_stat_timestamps(void)
> > >  	return 0;
> > >  }
> > >  
> > > +int test_mmap_munmap(int size)
> > > +{
> > > +	char init_files[5][20] = {"/init", "/sbin/init", "/etc/init", "/bin/init", "/bin/sh"};
> > 
> > Why not /proc/1/exe or even /proc/self/exe?
> > 
> > I know your other series tries to remove the procfs dependency, but
> > we're not there yet :-).
> > 
> 
> Yeah, '/proc/self/exe' is a choice, if so, the 'has_proc' should be added ;-)

Currently procfs is a hard requirement. So I would leave 'has_proc' to
the other series that may change this.

> > Also does it make sense to pass a size parameter?
> > Why not use either PAGE_SIZE or the real size of the binary from
> > fstat().
> > 
> 
> Ok, as the manpage of mmap shows:
> 
>        For mmap(), offset must be a multiple of the underlying huge page
>        size.  The system automatically aligns length to be a multiple of
>        the underlying huge page size.
> 
>        For munmap(), addr, and length must both be a multiple of the
>        underlying huge page size.
> 
> perhaps we should do further tests:
> 
> * the real size/length
> * even > the real size
> * the PAGE_SIZE
> * not aligned with PAGE_SIZE
> 
> If such tests are required, the 'size' and even 'offset' arguments could be
> provided to cover different combination or we do such tests internally, then,
> the arguments are not required.

I think task of nolibc-test is to test the code in nolibc itself.
The custom mmap implementation is trivial and directly calls the
syscall. These additionally proposed tests would effectively test the
core kernels implementation of mmap() and not the code of nolibc.

Therefore I don't think they are necessary in nolibc-test and the
functionality is hopefully already be tested in another testsuite.


Note:

Testing mmap is indeed useful to test the implementation of
my_syscall6() by providing a bogus value in the 'offset' parameter.
I think we do have such a testcase.

<snip>

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
