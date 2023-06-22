Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E6CEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpQ+uR5XlGm2Dk/pCUJf+EKtNCM8trrIhNbvGp3smBg=; b=Fh0Nu3UDi8yB8I
	O+6ku97cKsLfiZ+9VFhPL5DPt1qrghUWX0xioKskQj3ZAgBsgKtFGnwgpAqyd6LZQMsoLBHnJOWgJ
	+d1yDBT2uB7fYh2TYVsbPoPxHbNc1P099Er0er8I5icY5zlXjYKMqatwWBcpzN1d91rfsy/bDoy8A
	8z1AZ0tsvKtNslvXwZGKBVvr67lJy/Ocy5Yz2unVb5XKRi1KByLCSP4tHIRMBrbwY8oIw3eEBmrdI
	uBD39Tz5evoJWe9Iqzq3dCgDqXiKvFczaUznVWq/mi/s7JM5MLzFlRcislCMK0nFSB/bqkrwyjk3c
	QL8hNnGir0d87ItB3KZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCQ3X-001ZAp-0M;
	Thu, 22 Jun 2023 19:33:23 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCQ3T-001Z9D-1C
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 19:33:21 +0000
X-QQ-mid: bizesmtp81t1687462371tfakqj4c
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Jun 2023 03:32:50 +0800 (CST)
X-QQ-SSF: 01200000002000D0V000B00A0000000
X-QQ-FEAT: zW5H9jc4KG5qk2INlrOP0oS9aFEXIUGWb1JwxtxbbF7iDK84gQmYLdPeVVZPn
	UvasRXhCpwWJbIxwFY9KHzOHNQu8BsDVeK3i4ofJpmf6dnH+uUe1FVlFbEIb0r4baDoUW2W
	YanngRC4rPxrBFpafMd/y0dAlHsQE291QGGPnULqyKsSZX7g4t7JAiorA9fUJ/x1b0XDJ4u
	UwJ7ojKQdhByAAWoTb1X4/dyQ8ucSc7kX4bopfhI51vptYKUBSM/P2zCp7yVibcOePQglAj
	zCCq77kf/8V0783pvUNeDavvPtquL8P4KF2bY0HZrxLjJ6gZgyhjNiesB1ezyYWi+dFKX7a
	EmzvyxkEmDYcwfKIzGkqENi4Sf8b+OxupCFvMBmVUh2NVIdBfgwSAUyD/4KAQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12040008740416056767
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
Date: Fri, 23 Jun 2023 03:32:49 +0800
Message-Id: <20230622193249.1190336-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bff82ea6-610b-4471-a28b-6c76c28604a6@t-8ch.de>
References: <bff82ea6-610b-4471-a28b-6c76c28604a6@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_123319_707474_62B4F9F3 
X-CRM114-Status: GOOD (  25.21  )
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

> On 2023-06-19 23:55:41+0800, Zhangjin Wu wrote:
> > Three mmap/munmap related test cases are added:
> > 
> > - mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL)
> > 
> >   The length argument must be greater than 0, otherwise, fail with -EINVAL.
> > 
> > - munmap((void *)-1, 4*1024), -1, EINVAL)
> > 
> >   Invalid (void *)-1 address fail with -EINVAL.
> > 
> > - test_mmap_munmap(4*1024)
> > 
> >   It finds a init file, mmap() it and then munmap().
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/nolibc-test.c | 31 ++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > index 80ab29e2887c..f7c0ca72cb28 100644
> > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > @@ -592,6 +592,34 @@ static int test_stat_timestamps(void)
> >  	return 0;
> >  }
> >  
> > +int test_mmap_munmap(int size)
> > +{
> > +	char init_files[5][20] = {"/init", "/sbin/init", "/etc/init", "/bin/init", "/bin/sh"};
> 
> Why not /proc/1/exe or even /proc/self/exe?
> 
> I know your other series tries to remove the procfs dependency, but
> we're not there yet :-).
> 

Yeah, '/proc/self/exe' is a choice, if so, the 'has_proc' should be added ;-)

> Also does it make sense to pass a size parameter?
> Why not use either PAGE_SIZE or the real size of the binary from
> fstat().
> 

Ok, as the manpage of mmap shows:

       For mmap(), offset must be a multiple of the underlying huge page
       size.  The system automatically aligns length to be a multiple of
       the underlying huge page size.

       For munmap(), addr, and length must both be a multiple of the
       underlying huge page size.

perhaps we should do further tests:

* the real size/length
* even > the real size
* the PAGE_SIZE
* not aligned with PAGE_SIZE

If such tests are required, the 'size' and even 'offset' arguments could be
provided to cover different combination or we do such tests internally, then,
the arguments are not required.

Thanks,
Zhangjin

> > +	int ret, fd, i;
> > +	void *mem;
> > +
> > +	for (i = 0; i < 5; i++) {
> > +		ret = fd = open(init_files[i], O_RDONLY);
> > +		if (ret < 0)
> > +			continue;
> > +		else
> > +			break;
> > +	}
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	mem = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);
> > +	if (mem == MAP_FAILED)
> > +		return -1;
> > +
> > +	ret = munmap(mem, size);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return close(fd);
> > +}
> > +
> > +
> >  /* Run syscall tests between IDs <min> and <max>.
> >   * Return 0 on success, non-zero on failure.
> >   */
> > @@ -666,6 +694,9 @@ int run_syscall(int min, int max)
> >  		CASE_TEST(lseek_m1);          EXPECT_SYSER(1, lseek(-1, 0, SEEK_SET), -1, EBADF); break;
> >  		CASE_TEST(lseek_0);           EXPECT_SYSER(1, lseek(0, 0, SEEK_SET), -1, ESPIPE); break;
> >  		CASE_TEST(mkdir_root);        EXPECT_SYSER(1, mkdir("/", 0755), -1, EEXIST); break;
> > +		CASE_TEST(mmap_bad);          EXPECT_PTRER(1, mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL); break;
> > +		CASE_TEST(munmap_bad);        EXPECT_SYSER(1, munmap((void *)-1, 0), -1, EINVAL); break;
> > +		CASE_TEST(mmap_good);         EXPECT_SYSZR(1, test_mmap_munmap(4*1024)); break;
> >  		CASE_TEST(open_tty);          EXPECT_SYSNE(1, tmp = open("/dev/null", 0), -1); if (tmp != -1) close(tmp); break;
> >  		CASE_TEST(open_blah);         EXPECT_SYSER(1, tmp = open("/proc/self/blah", 0), -1, ENOENT); if (tmp != -1) close(tmp); break;
> >  		CASE_TEST(poll_null);         EXPECT_SYSZR(1, poll(NULL, 0, 0)); break;
> > -- 
> > 2.25.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
