Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5D8C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USVaHJ6DXDSNDFLZHZBC9SBFjrQQVVXDtbqJ2qAD2Qc=; b=CX2jICvkTbk1cP
	EkNpWtv54Xygy/SyHitqlvvPajbvnmDNWdWj37fAkDh5oJn+so4ZmTDEbzxqEee6eqEduPtBQogke
	x6jPlc1OS08Zu5mpE+a6rjpLHs67ctwHQ6P+jmCv7Cy6gWHOYyUR1UONnN9rMSoDk6KUQ605P1RYW
	8Bsy7Jb2GDuVk+6//mMn2yKe/ApBO+1AEUP/7e5Qev8xQZwhUA4vjJnPTZBL7xDsJjuFVIN61MjgX
	SV9yOUxRa7qKTXxc3D7L8L5RVAo4+m3YHdVn6WwdORxGFTCQaoMLclgJ7m1dG4fyBBAaHl2+0CkA0
	hGM0Sa7ea2wfy5AnwLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cYa-00AX2W-0v;
	Mon, 29 May 2023 13:05:04 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cYW-00AWzn-1K
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:05:02 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34TD4ndg002822;
	Mon, 29 May 2023 15:04:49 +0200
Date: Mon, 29 May 2023 15:04:49 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v2 3/7] selftests/nolibc: fix up compile warning with
 glibc on x86_64
Message-ID: <20230529130449.GA2813@1wt.eu>
References: <cover.1685362482.git.falcon@tinylab.org>
 <aeb48b9cf6fc4674f7560166f22c7dc87d02302d.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aeb48b9cf6fc4674f7560166f22c7dc87d02302d.1685362482.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060500_891863_5C811252 
X-CRM114-Status: GOOD (  18.19  )
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

On Mon, May 29, 2023 at 09:00:01PM +0800, Zhangjin Wu wrote:
> Compiling nolibc-test.c with gcc on x86_64 got such warning:
> 
> tools/testing/selftests/nolibc/nolibc-test.c: In function 'expect_eq':
> tools/testing/selftests/nolibc/nolibc-test.c:177:24: warning: format '%lld' expects argument of type 'long long int', but argument 2 has type 'uint64_t' {aka 'long unsigned int'} [-Wformat=]
>   177 |  llen += printf(" = %lld ", expr);
>       |                     ~~~^    ~~~~
>       |                        |    |
>       |                        |    uint64_t {aka long unsigned int}
>       |                        long long int
>       |                     %ld
> 
> It because that glibc defines uint64_t as "unsigned long int" when word
> size (means sizeof(long)) is 64bit (see include/bits/types.h), but
> nolibc directly use the 64bit "unsigned long long" (see
> tools/include/nolibc/stdint.h), which is simpler, seems kernel uses it
> too (include/uapi/asm-generic/int-ll64.h).
> 
> It is able to do like glibc, defining __WORDSIZE for all of platforms
> and using "unsigned long int" to define uint64_t when __WORDSIZE is
> 64bits, but here uses a simpler solution: nolibc always requires %lld to
> match "unsigned long long", for others, only require %lld when word size
> is 32bit.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index d417ca5d976f..7f9b716fd9b1 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -174,7 +174,11 @@ static int expect_eq(uint64_t expr, int llen, uint64_t val)
>  {
>  	int ret = !(expr == val);
>  
> +#if __SIZEOF_LONG__ == 4 || defined(NOLIBC)
>  	llen += printf(" = %lld ", expr);
> +#else
> +	llen += printf(" = %ld ", expr);
> +#endif
>  	pad_spc(llen, 64, ret ? "[FAIL]\n" : " [OK]\n");
>  	return ret;
>  }

Please don't proceed like this. There's much easier to do here for a printf,
just cast the expression to the type printf expects:

-  	llen += printf(" = %lld ", expr);
+  	llen += printf(" = %lld ", (long long)expr);

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
