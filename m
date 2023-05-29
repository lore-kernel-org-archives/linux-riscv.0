Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A3C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMgfeN/HEkhvYEzRNMZNqiBj97Np5WN7vSzVs9yTq/Q=; b=GJXEK7Ulrx85ND
	E+h5WiWnYRQ+zbBAlLACCEGMZgco0qfPSyB0g5laIvtglgD2q5qDvMhG4ErHP72zZPTdJT+aNvBJx
	cca2Dd9Epxjgl9rTOT+VdOieJOo9UMRjmYZgFBICricbQk9aSgZP6Ahj9474K+fOeAlDiAG8DsgZo
	vgnpPJzBi5/Q8HO2ZODtBFLREPLSi9sWcOT8E07u4Rr5/tUXh0yZmbFdoCXoYH395U50n67rTw4Wa
	Id4Ou/fKM77Krixyjm7ouc+HtxJTFIxO4thZ/eVTykJXlCu1O2lH4MxYiZ+TqsYNM7oR9/ZRv+2tr
	Zvs+7eZG2HDHT1bnfSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ckO-00AZK9-2R;
	Mon, 29 May 2023 13:17:16 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ckK-00AZJ9-2S
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:17:15 +0000
X-QQ-mid: bizesmtp79t1685366138tuh7hwm2
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 21:15:37 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: Bt6VvACH2lxPDSqLKk8oIpBVhB33MD55CoUCVpzQ9ygXQNimNUvEkUlPf0ILF
	XgQDDzZu334LYd4VWLUHTb6l5t44PodGFC44Sj9m29ix6L3usWzz7F1hY5HpmH/TZAJFAhv
	webS86/IrzS4fW/ZYl6eR/LRpVClD+cdFOF190p35yX6rNGT6tEYUg3B+mMLG8fewYgR0NM
	6iVECGjzITrPvUjBPEK7TB2sibfaEs5093+0IqA7CHieBb4Y02XfJXtetvVxZ5XuGsZfwMi
	NzBDvh64IRFpTUsY4fjqEncEl/hqCw6A+guWHJc0Bs3QLOGrPJDU7o4E83ypK7S3XIkXUBW
	TdnU7W4QhefRz/kSCAIksuSE/RqIy/bo/jXAITzMZrdgTr4sqPvuuYIJi2wIw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1046913872741626693
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v2 3/7] selftests/nolibc: fix up compile warning with glibc on x86_64
Date: Mon, 29 May 2023 21:15:36 +0800
Message-Id: <20230529131536.80183-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529130449.GA2813@1wt.eu>
References: <20230529130449.GA2813@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_061713_103352_E14F5F2A 
X-CRM114-Status: GOOD (  20.38  )
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

> On Mon, May 29, 2023 at 09:00:01PM +0800, Zhangjin Wu wrote:
> > Compiling nolibc-test.c with gcc on x86_64 got such warning:
> > 
> > tools/testing/selftests/nolibc/nolibc-test.c: In function 'expect_eq':
> > tools/testing/selftests/nolibc/nolibc-test.c:177:24: warning: format '%lld' expects argument of type 'long long int', but argument 2 has type 'uint64_t' {aka 'long unsigned int'} [-Wformat=]
> >   177 |  llen += printf(" = %lld ", expr);
> >       |                     ~~~^    ~~~~
> >       |                        |    |
> >       |                        |    uint64_t {aka long unsigned int}
> >       |                        long long int
> >       |                     %ld
> > 
> > It because that glibc defines uint64_t as "unsigned long int" when word
> > size (means sizeof(long)) is 64bit (see include/bits/types.h), but
> > nolibc directly use the 64bit "unsigned long long" (see
> > tools/include/nolibc/stdint.h), which is simpler, seems kernel uses it
> > too (include/uapi/asm-generic/int-ll64.h).
> > 
> > It is able to do like glibc, defining __WORDSIZE for all of platforms
> > and using "unsigned long int" to define uint64_t when __WORDSIZE is
> > 64bits, but here uses a simpler solution: nolibc always requires %lld to
> > match "unsigned long long", for others, only require %lld when word size
> > is 32bit.
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/nolibc-test.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > index d417ca5d976f..7f9b716fd9b1 100644
> > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > @@ -174,7 +174,11 @@ static int expect_eq(uint64_t expr, int llen, uint64_t val)
> >  {
> >  	int ret = !(expr == val);
> >  
> > +#if __SIZEOF_LONG__ == 4 || defined(NOLIBC)
> >  	llen += printf(" = %lld ", expr);
> > +#else
> > +	llen += printf(" = %ld ", expr);
> > +#endif
> >  	pad_spc(llen, 64, ret ? "[FAIL]\n" : " [OK]\n");
> >  	return ret;
> >  }
> 
> Please don't proceed like this. There's much easier to do here for a printf,
> just cast the expression to the type printf expects:
> 
> -  	llen += printf(" = %lld ", expr);
> +  	llen += printf(" = %lld ", (long long)expr);

Yes, this conversion is better, my method make things more complex ;-)

Thanks,
Zhangjin

> 
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
