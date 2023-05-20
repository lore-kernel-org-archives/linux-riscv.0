Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1465C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqvUool+xN8UDLJNRIgSgcAMBzx4N/LA5eo2yR0re5w=; b=dXaqX0qr6oz9pF
	jEeSYVe6QY4UrBxRfhoacafcosIhEAwL/+HPRVgUFIkaCljm5FtA7ORrycpT5QLasSMckUbrfF32f
	cBYGx4I8QTZz2v/Iye8HFRVqbMWslXQUtmBiiI/QQLPoVHWcodgiv/q8P7HlY5ZXRCHWIOFppj/YF
	dKeDY/0vipZBGqmMTsHGfaHx1IZp5EhmCmBJ3fYQV8pusc8BIJuk1inYwTrvgm8Wz0LVy9qYrqkmg
	fsa9qeeqT+ZSUqAn0V4/shfhyCDzqsCnJk74AFEzkwAPkcElezJHjfIDTMKpRWIMU3p/F40rZxBrH
	8GzlMW0pZjAYFg8PTSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0N11-001cU7-2a;
	Sat, 20 May 2023 13:52:59 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0N0x-001cSa-15
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 13:52:58 +0000
X-QQ-mid: bizesmtp71t1684590757tcu24nop
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 May 2023 21:52:35 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: QityeSR92A2S4S0toYHNZ9kxF6KhrODuWRDpcYlZsLA6FTiLIzTqeNbNYwqBi
	4LgpDjJ/BkUadz2VbzLCSAxLIKD10ZsJjTSEkFZsPAhV0QOX6gsKA1+R7yAK78cjXp8JvEp
	eX7tK6VB3fPugsNHx3Qa6Nu2DknKxhn6oS1wT1gM/2TYY8OlK37/nm66Wd+c7JOSkelfaaI
	Ouk4YdlUKOD6TiKiuibBc39dTYHytZ3A05GoQ/rJlBY9r6+5xAozlVW1UJS2tEozzuBG1Dw
	PvavOPVwubgBFKRx/PZ21md/0jDNi12yozVNFT5RL5ErLaVrFvx5UVhlPaW81BEfPIvbfeK
	DEaJ5JyHH9JY+evvbbVcRJgkPQxFAN0uETBdwlL+xU5F3TRKxO/X25hkL5yvj0CeT+1rA0H
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18117569003285790249
From: Zhangjin Wu <falcon@tinylab.org>
To: linux@weissschuh.net,
	w@1wt.eu
Cc: aou@eecs.berkeley.edu,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Date: Sat, 20 May 2023 21:52:35 +0800
Message-Id: <20230520135235.68155-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
References: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_065255_697691_8AC023AA 
X-CRM114-Status: GOOD (  20.46  )
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

Willy, Thomas,

Resend more info about this patch (added but lost after a new format-patch):

This patch is based on the nolibc/20230520-nolibc-rv32+stkp branch of
[1] + the STKP patch for riscv [2], it is a testing 'side-effect' of the
STKP on rv32.

The nolibc rv32 port is not yet functional, we did this compile test by
adding -D__ARCH_WANT_TIME32_SYSCALLS to gcc (only for compile, see [3]).

We did get this info for rv32:

    !!Stack smashing detected!!

Just to mention, -DNOLIBC_STACKPROTECTOR -fstack-protector-all is used to
enable STKP, for -mstack-protector-guard=global is not available for riscv64
gcc 9.3:

    riscv64-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard=global'; did you mean '-fstack-protector-all'

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
[2]: https://lore.kernel.org/linux-riscv/20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net/T/#
[3]: https://lore.kernel.org/linux-riscv/20230520084610.GA27206@1wt.eu/T/#mf0e54ee19bd3f94dadbb4420ed9dffa316d1719d

Best regards,
Zhangjin Wu

> When compile nolibc-test.c for rv32, we got such error:
>
>     tools/testing/selftests/nolibc/nolibc-test.c:599:57: error: '__NR_fstat' undeclared (first use in this function)
>       599 |   CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_fstat, 0, NULL), -1, EFAULT); break;
>
> The generic include/uapi/asm-generic/unistd.h used by rv32 doesn't
> support __NR_fstat, using the common __NR_read functions as expected.
>
>     Running test 'syscall'
>     69 syscall_noargs = 1                                            [OK]
>     70 syscall_args = -1 EBADF                                       [OK]
>
> Btw, the latest riscv libc6-dev package is required, otherwise, we would
> also get such error:
>
>     In file included from /usr/riscv64-linux-gnu/include/sys/cdefs.h:452,
>                      from /usr/riscv64-linux-gnu/include/features.h:461,
>                      from /usr/riscv64-linux-gnu/include/bits/libc-header-start.h:33,
>                      from /usr/riscv64-linux-gnu/include/limits.h:26,
>                      from /usr/lib/gcc-cross/riscv64-linux-gnu/9/include/limits.h:194,
>                      from /usr/lib/gcc-cross/riscv64-linux-gnu/9/include/syslimits.h:7,
>                      from /usr/lib/gcc-cross/riscv64-linux-gnu/9/include/limits.h:34,
>                      from /labs/linux-lab/src/linux-stable/tools/testing/selftests/nolibc/nolibc-test.c:6:
>     /usr/riscv64-linux-gnu/include/bits/wordsize.h:28:3: error: #error "rv32i-based targets are not supported"
>        28 | # error "rv32i-based targets are not supported"
>
> The glibc commit 5b6113d62efa ("RISC-V: Support the 32-bit ABI
> implementation") fixed up above error, so, glibc >= 2.33 (who includes
> this commit) is required.
>
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 063f9959ac44..d8b59c8f6c03 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -596,7 +596,7 @@ int run_syscall(int min, int max)
>  		CASE_TEST(write_badf);        EXPECT_SYSER(1, write(-1, &tmp, 1), -1, EBADF); break;
>  		CASE_TEST(write_zero);        EXPECT_SYSZR(1, write(1, &tmp, 0)); break;
>  		CASE_TEST(syscall_noargs);    EXPECT_SYSEQ(1, syscall(__NR_getpid), getpid()); break;
> -		CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_fstat, 0, NULL), -1, EFAULT); break;
> +		CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_read, -1, &tmp, 1), -1, EBADF); break;
>  		case __LINE__:
>  			return ret; /* must be last */
>  		/* note: do not set any defaults so as to permit holes above */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
