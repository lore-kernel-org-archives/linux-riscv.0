Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90978E6BF30
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+6438Y6CPdxuDnD6v+ndGXPqNJFGIvBOE4vkKnSy64=; b=ri23FnMJVs9cpm
	fWR52O+7VvzIA+gE0aua/iXSdE0iOGTI3KCkcbo3ZODe/bBksZM88LTTFLaQiLtjt48VLbLNfzV0C
	UgbB/1ku/eLjIcJj5FWDliSesEga7b5tnPrR3i3lJEhTUAlr0+eCT3z1ju0bj2kTxlWaV5iU8kw4R
	DOYdjOFevcXo1twLXPuAEFjkwUi7qVEgk56+1JefS3eHmPEqS/tQGtlJlFaILVigdIc3HXoN8vJ0z
	9S0eOJ31B3k7WvDw7eGHXT8FMD/78Tq6ee1nH7niPbha5rZs8umHZWUxp99B+Xk+QzBRhN6GA5WmB
	Vem8R458+oprP1gKlGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsPT-00000001m5q-1ZX3;
	Fri, 30 Jan 2026 17:35:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsPQ-00000001m5A-3uyQ
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:35:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D9C04195E;
	Fri, 30 Jan 2026 17:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB17C4CEF7;
	Fri, 30 Jan 2026 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769794552;
	bh=PNcKOtJEhTtwsqaYMcux4hWhZmy9ojaJIltFMghSNDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiOrk+4KP4cywSelLRGhpurbFn96EhLXamqAMFYcoCppIXrS0vQniRFgfv1kh7HWp
	 D6R83gevct9t7SCKRg5D1qLFjbIcaV64aktRTSS+S9mNQfngXW5ToszCweShtvHDeq
	 +ztGwNRWMJXZ0WJrsWufigDVB8ivR/1WhKnyyGLKljv+2tpdY7uiJUHFjtD0nSEyL2
	 1oV/pu8hs0oF9IfOg7T1HoSsLt7FNjlvK2JH6OAh11hAhL4FGTBFbxXQ2w2hdyUZQO
	 gtrbLyrlhMCGUYad9xGvHowUho7qJJAAB91U3xujOW0Ii20P0mMr/1/rYgOxRpkgNM
	 kmLK/Au8/6+uA==
Date: Fri, 30 Jan 2026 09:35:52 -0800
From: Kees Cook <kees@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
	martin.petersen@oracle.com, herbert@gondor.apana.org.au,
	samuel.holland@sifive.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
	linusw@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 5/8] lib/string_kunit: extend benchmarks to strnlen()
 and chr searches
Message-ID: <202601300935.DF5E50015A@keescook>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <20260130025018.172925-6-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130025018.172925-6-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_093552_993144_54FC116E 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jan 30, 2026 at 10:50:15AM +0800, Feng Jiang wrote:
> Extend the string benchmarking suite to include strnlen(), strchr(),
> and strrchr().
> 
> For character search functions strchr() and strrchr(), the benchmark
> targets the NUL character. This ensures the entire string is scanned,
> providing a consistent measure of full-length processing efficiency
> comparable to strlen().
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
