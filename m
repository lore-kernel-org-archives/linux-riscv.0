Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB0EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MJuctMuxt7dwCwudX58+L4oV98jHrUwpd5R8DNWzdA=; b=jLVBuLlXqcIuZd
	33IRR4i8xRk4d8fQ6C8kf0L6wrKHhJk//fOEsBqF3zBpUwmqC92cXPMgr0lMfcuTidLeKaby9mUHB
	b+m92WhkIbi39AIC6s38oasr5WDDUauFK6fibeVSk9/ow4xkxCREO/8QccmtaoAoyyErNC0AP/os/
	EXYjycejvYBKpAtI5u/vjqcsjBMN6xV0ix01y4fKIMyDmRprqgRwRl095o6PHm9Fb8pCv93z+o1f7
	5KKodaTAT1TBD/4XOH9/bss3e7cCseUSWdXSobO+cdVZ9dsr6zHZLPcV5ZhUymveSwRauhboOwbRM
	J67Ha75Zxi38yUyUL1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHX5-008ut9-1Y;
	Mon, 19 Jun 2023 16:15:11 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHX1-008us1-0m
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 16:15:10 +0000
X-QQ-mid: bizesmtp81t1687191285t01nawk2
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Jun 2023 00:14:44 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: ZdHcY4j9T+JijOCEaI8NmadI1bU2NcMWNN0LyKkwYd78IIfSGuJNw4ExYDsC6
	4p+ypSy34TXQkH2u4G361x0wwuIvn+6JwClrIj35FYTsUsypkzVae2C/aLNMHgTDkvGKkUC
	b7iX+Sg3k2OiyMGpOpz+YEcBx0k9YEj4udS4iTsULv4XQd5W002HtAam6/ruHiJTzk6lVMj
	MonXQf1k6YcDfjUOz1FGyI5E07uFJI6QFGlddPjOFY/v29nn2HUpS+QxyKmzAX2JLhwPnZZ
	AdngcSwJgBVlEuh3xUzyI40+sxnz16o3BkySAiORsqLOHVGN7sfTQtxygVthRzMIhxGG7HU
	9D1KBqNWPyarbrI+fC4pCeml0sgPg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15276055031568297956
From: Zhangjin Wu <falcon@tinylab.org>
To: falcon@tinylab.org
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: [PATCH v4 10/10] selftests/nolibc: add mmap and munmap test cases
Date: Tue, 20 Jun 2023 00:14:44 +0800
Message-Id: <20230619161444.285353-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9c46f648cd8c784405afed565bed120f0a2f239e.1687187451.git.falcon@tinylab.org>
References: <9c46f648cd8c784405afed565bed120f0a2f239e.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_091507_627552_38B6E609 
X-CRM114-Status: GOOD (  18.71  )
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

Hi,

> Three mmap/munmap related test cases are added:
> 
> - mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL)
> 
>   The length argument must be greater than 0, otherwise, fail with -EINVAL.
> 
> - munmap((void *)-1, 4*1024), -1, EINVAL)
>

Sorry, this message doesn't match the code, will change it in new revison.

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

And here need a close(fd):

	if (mem == MAP_FAILED) {
		close(fd);
		return -1;
	}

> +	ret = munmap(mem, size);
> +	if (ret < 0)
> +		return ret;
> +

And here too:

	if (ret < 0) {
		close(fd);
		return ret;
	}


> +	return close(fd);

	close(fd);
	return 0;

Thanks,
Zhangjin

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
