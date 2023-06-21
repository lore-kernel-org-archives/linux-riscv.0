Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99F6EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHDwL0ITqukYKs3Nf6lqKy9no22zi3roy4FKVVPRb4A=; b=KtNefvqDbjeyBq
	yFUnd9H3Z9lqf2qrV7V5eQeGtaoj55uYxmyXu+Jq59C7jOtYlDafitUs3V70Oie63kMiF/QY4RdDi
	ignogL3Hiq6Ab3zSFKj1BL9e9UUR27wfI0L4uJOugFi1YR29IwKYMsrNcEk1QeRPB4cX3HudM5NkE
	9eTEOtui3DEVXBMKU4w0WEoQviAsIECL7T0w2xG6hCauKV3QUXIUGkSUaAV+xSzutw8rRxw6Z+890
	hpH40KZw855go4d5h86ckZrQiWWS8V4NiJnEtC8H0dt9UWpJsJBlgJ/KV+xDwpa+4tloc/+YWrYzD
	KgQHRqAexk6IOl/lLZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC32Z-00FTtL-2y;
	Wed, 21 Jun 2023 18:58:51 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC32X-00FTsW-0G
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 18:58:50 +0000
Date: Wed, 21 Jun 2023 20:58:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1687373926; bh=4nYEAteqZDwoEERcJ/4r/81UZbr+SxIo+24Al6wvXxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qghO2PUkRp7vDv3aBumGSh+IPZJOjqAfAKG4Q6YdGCUdtm6tIqLtT3y0Wr4VoVlUD
	 eMqrP1ZeqSRVtntpyIycI8Vt6cXp8gyxJRV7Ykm/utqmw5sPpcL8rdPT6kALm3KG1M
	 55TdI+CCWrZWhM2Ur0Jrr6zPTbq6EqvMUKWGDiyo=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, david.laight@aculab.com, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 10/10] selftests/nolibc: add mmap and munmap test cases
Message-ID: <bff82ea6-610b-4471-a28b-6c76c28604a6@t-8ch.de>
References: <cover.1687187451.git.falcon@tinylab.org>
 <9c46f648cd8c784405afed565bed120f0a2f239e.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c46f648cd8c784405afed565bed120f0a2f239e.1687187451.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_115849_272710_8C418BC9 
X-CRM114-Status: GOOD (  20.11  )
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

On 2023-06-19 23:55:41+0800, Zhangjin Wu wrote:
> Three mmap/munmap related test cases are added:
> 
> - mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL)
> 
>   The length argument must be greater than 0, otherwise, fail with -EINVAL.
> 
> - munmap((void *)-1, 4*1024), -1, EINVAL)
> 
>   Invalid (void *)-1 address fail with -EINVAL.
> 
> - test_mmap_munmap(4*1024)
> 
>   It finds a init file, mmap() it and then munmap().
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 80ab29e2887c..f7c0ca72cb28 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -592,6 +592,34 @@ static int test_stat_timestamps(void)
>  	return 0;
>  }
>  
> +int test_mmap_munmap(int size)
> +{
> +	char init_files[5][20] = {"/init", "/sbin/init", "/etc/init", "/bin/init", "/bin/sh"};

Why not /proc/1/exe or even /proc/self/exe?

I know your other series tries to remove the procfs dependency, but
we're not there yet :-).

Also does it make sense to pass a size parameter?
Why not use either PAGE_SIZE or the real size of the binary from
fstat().

> +	int ret, fd, i;
> +	void *mem;
> +
> +	for (i = 0; i < 5; i++) {
> +		ret = fd = open(init_files[i], O_RDONLY);
> +		if (ret < 0)
> +			continue;
> +		else
> +			break;
> +	}
> +	if (ret < 0)
> +		return ret;
> +
> +	mem = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);
> +	if (mem == MAP_FAILED)
> +		return -1;
> +
> +	ret = munmap(mem, size);
> +	if (ret < 0)
> +		return ret;
> +
> +	return close(fd);
> +}
> +
> +
>  /* Run syscall tests between IDs <min> and <max>.
>   * Return 0 on success, non-zero on failure.
>   */
> @@ -666,6 +694,9 @@ int run_syscall(int min, int max)
>  		CASE_TEST(lseek_m1);          EXPECT_SYSER(1, lseek(-1, 0, SEEK_SET), -1, EBADF); break;
>  		CASE_TEST(lseek_0);           EXPECT_SYSER(1, lseek(0, 0, SEEK_SET), -1, ESPIPE); break;
>  		CASE_TEST(mkdir_root);        EXPECT_SYSER(1, mkdir("/", 0755), -1, EEXIST); break;
> +		CASE_TEST(mmap_bad);          EXPECT_PTRER(1, mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL); break;
> +		CASE_TEST(munmap_bad);        EXPECT_SYSER(1, munmap((void *)-1, 0), -1, EINVAL); break;
> +		CASE_TEST(mmap_good);         EXPECT_SYSZR(1, test_mmap_munmap(4*1024)); break;
>  		CASE_TEST(open_tty);          EXPECT_SYSNE(1, tmp = open("/dev/null", 0), -1); if (tmp != -1) close(tmp); break;
>  		CASE_TEST(open_blah);         EXPECT_SYSER(1, tmp = open("/proc/self/blah", 0), -1, ENOENT); if (tmp != -1) close(tmp); break;
>  		CASE_TEST(poll_null);         EXPECT_SYSZR(1, poll(NULL, 0, 0)); break;
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
