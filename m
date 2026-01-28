Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17436D46C0A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 22:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIsdfNkdbcii1lWqP4MNGCCuEmf50GkmZRKBr4zaQl8=; b=4WqY2OM8vUYwh+
	NUQiuWXZbXDgmZMA8H9Kw515NRpXM5Iqpk/EgVgK15hT9C47CV7APHLVxy1Fb3brP5TUZUIQMDG3f
	Qn3eRzg0jLS4omzXhSEo64LOUehakEcrhYqlDw1ZlykFXKlnEiGnLiR6B7lCo0QL7A1JdkPMZOBbp
	cDPMBMCGp0mauIFRMgsPI/VgfjA0om3H9mIFrj7aUKeBeAXMvRvQ2n0HNksyQuQ473f/I2pKLZbEE
	N9VhGIBizhNqJhMp+DKZ0xLIc5ItGhMRG+3Gtt0weWWlxm525NSmmNoSLDWF+XRbHIYryQDbUQ1+Z
	BwWdHPmGMwnD0fn75LPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEBy-0000000Gtf8-0opQ;
	Wed, 28 Jan 2026 22:39:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEBw-0000000Gtf1-3gbW
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 22:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3C006001A;
	Wed, 28 Jan 2026 22:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B7BC4CEF1;
	Wed, 28 Jan 2026 22:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769639954;
	bh=+Qo0hUtbp6GPRhlGZrjzGk3yEHHY8vN3Rk5lovqMKeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoe5guXZgqiwHfkzvcyGwChsttEGzY8XkQAQGbi+GVyMpTmaL9A50P2fKJkq1Ud/p
	 W1LNZoTZbltT2WEw70+ZaFoJrjI/FmyZ8fHktzXwjQUFEtxQJmOizUBhrFp8Mb5yHj
	 NYCENS6FTRdjzLmG5B3zAo3o7urcoqQErGRaCO1Npy5N5maFNmJaaTHbNWKdXumg0w
	 iKnU6v2CUeiFR3lVO8ZSadcj2RfCJJmdyB8NbH+m9eDDJef8qiOZkMfFrCTShZDcgL
	 qWypr76X7QxjjtRPuQA9tEzQS083eLdv3ipGuRDv2zU6QSOgreU+SzC35YqbLvadk3
	 19la0D8Df3KAQ==
Date: Wed, 28 Jan 2026 14:39:14 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, andy@kernel.org,
	ebiggers@kernel.org, martin.petersen@oracle.com,
	sohil.mehta@intel.com, charlie@rivosinc.com,
	conor.dooley@microchip.com, samuel.holland@sifive.com,
	linus.walleij@linaro.org, nathan@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v5 1/8] lib/string_kunit: add correctness test for
 strlen()
Message-ID: <202601281437.F327FC61@keescook>
References: <20260127012558.40025-1-jiangfeng@kylinos.cn>
 <20260127012558.40025-2-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127012558.40025-2-jiangfeng@kylinos.cn>
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

On Tue, Jan 27, 2026 at 09:25:51AM +0800, Feng Jiang wrote:
> Add a KUnit test for strlen() to verify correctness across
> different string lengths and memory alignments.
> 
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> Acked-by: Andy Shevchenko <andy@kernel.org>
> Tested-by: Joel Stanley <joel@jms.id.au>
> ---
>  lib/tests/string_kunit.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
> index f9a8e557ba77..bc5130c6e5e9 100644
> --- a/lib/tests/string_kunit.c
> +++ b/lib/tests/string_kunit.c
> @@ -17,6 +17,9 @@
>  #define STRCMP_TEST_EXPECT_LOWER(test, fn, ...) KUNIT_EXPECT_LT(test, fn(__VA_ARGS__), 0)
>  #define STRCMP_TEST_EXPECT_GREATER(test, fn, ...) KUNIT_EXPECT_GT(test, fn(__VA_ARGS__), 0)
>  
> +#define STRING_TEST_MAX_LEN	128
> +#define STRING_TEST_MAX_OFFSET	16
> +
>  static void string_test_memset16(struct kunit *test)
>  {
>  	unsigned i, j, k;
> @@ -104,6 +107,28 @@ static void string_test_memset64(struct kunit *test)
>  	}
>  }
>  
> +static void string_test_strlen(struct kunit *test)
> +{
> +	const size_t buf_size = STRING_TEST_MAX_LEN + STRING_TEST_MAX_OFFSET + 1;
> +	size_t len, offset;
> +	char *s;
> +
> +	s = kunit_kzalloc(test, buf_size, GFP_KERNEL);

One aspect of "correctness" that we might want to include here is making
sure we don't have any implementations that over-read. To that end,
perhaps this test can put the string at the end of a vmalloc allocation
(so that the end of the string is right up against an unallocated memory
space).

> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
> +
> +	memset(s, 'A', buf_size);
> +	s[buf_size - 1] = '\0';
> +
> +	for (offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
> +		for (len = 0; len <= STRING_TEST_MAX_LEN; len++) {
> +			s[offset + len] = '\0';
> +			KUNIT_EXPECT_EQ_MSG(test, strlen(s + offset), len,
> +				"offset:%zu len:%zu", offset, len);
> +			s[offset + len] = 'A';
> +		}
> +	}
> +}

It would require building the string backwards here. Or maybe we just
need a separate test for the over-read concerns?

Thoughts?

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
