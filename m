Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D9C982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJXG2uA7AbT76U7zyr+NOEkHWcsXNgIwWqy8RgFzuGQ=; b=b6uhAThIv0pxYK
	6eaROiAGUDh1TygNJCTFGYH0mHtsUZruLZF3gyJuGrF93AD+iRaY4OQVggDG6oJb4OXQIaVxww9lF
	/FvGKQ18ILd9SJqJnEk3fwgib4ioNVclieEwACDr1lyCuod9yuWdPTBkttQ9WY3T1iaNO2xCcyC0x
	PO7ZuHG6wmfjo99poZr4fvQeddEKEiPoQLEcQHaLLPwVvXDaeAewkg376Fn1jskodL30XqsK4IM1I
	6mDLbfYj1NFopYSH5WPNjmU7I4cINn6f4csa4WjZ2n8ESIFjJeda58jfHieuCtf6UND156pOb71Sm
	+xVinbSH9Zw4PazCQ7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90pb-00000005acU-1a2t;
	Tue, 22 Sep 2026 13:46:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90pZ-00000005ac6-2fFu
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 13:46:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790084803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reSLhhZ0DSIyhUbBmnwpccD97Hn3T3AkSmN7Y12e05o=;
	b=yRhKtbGnD30DvczcxrPiTfOQqLssn6pQIs45QxnDSR3uaPS0CbY88KZKW6OjG0eImkBKtw
	G6tyClKhZUDai3OCZim7pnFLxROVFUFKyZ+6vJbWRYfkqLtfRjVNa6Ak2LsOOB/M3P9QGR
	QCUzz/t6473G3lG2PkrfbepUuCBHUGDfSYERrA8Ahq8wdiAv4oqIqWsYhs9mlvKIn2o0HA
	Q/eLQqJJ7bZ0x1Forlw8jgVqbOT69EyNHIc3mE6RtF+sb5+BxdOZZqo2XzJBqWkEVX3LsB
	OxI11i4/hvF49+VFTGGl3Xzk1IOQcgLl3sycoGzH3wOePrEQ+fJ0bXLrK+yQbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790084803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=reSLhhZ0DSIyhUbBmnwpccD97Hn3T3AkSmN7Y12e05o=;
	b=X9eEowucmjDXk8o9BUTbkOYHfuKJYZj0hxl1aLQiDG9uwCva9aCWOx+DW0Ky1he6YDKnLz
	SisxNWjYbFRmgsDw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v4 2/2] riscv: kprobes: add KUnit test for LR/SC
 sequence rejection
In-Reply-To: <20260828091202.1124-3-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
 <20260828091202.1124-3-yuanxiaofeng@eswincomputing.com>
Date: Tue, 22 Sep 2026 15:46:42 +0200
Message-ID: <87se31e6v1.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_064645_820224_21AD515F 
X-CRM114-Status: GOOD (  11.75  )
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> +SYM_FUNC_START(test_kprobes_lrsc)
> +	li a0, 1
> +1:
> +	lr.w a1, 0(x0)

It would be nice to place this instruction right at the beginning (ditch
the "li a0, 1"), so we can test that it is not wrongly skipped.

> +.Llrsc_inside:

Shouldn't the lr.w instruction be rejected as well?

> +	addi a1, a1, 1
> +	sc.w a2, a1, 0(x0)
> +	bnez a2, 1b
> +.Llrsc_after:
> +	li a0, KPROBE_TEST_MAGIC

We don't need to return KPROBE_TEST_MAGIC for this test case.

> +	ret
> +SYM_FUNC_END(test_kprobes_lrsc)
> +
> +.section .rodata
> +SYM_DATA_START(test_kprobes_lrsc_offsets)
> +	RISCV_PTR .Llrsc_inside - test_kprobes_lrsc
> +	RISCV_PTR .Llrsc_after - test_kprobes_lrsc

Why do we do the subtraction here, only to do the reverse addition in
test_kprobe_lrsc()?

> +SYM_DATA_END(test_kprobes_lrsc_offsets)
> +
>  .section .rodata
>  SYM_DATA_START(test_kprobes_addresses)
>  	RISCV_PTR test_kprobes_add_addr1
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> index 027424a3ff..25bd103e20 100644
> --- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> @@ -43,8 +43,27 @@ static void test_kprobe_riscv(struct kunit *test)
>  	kfree(kp);
>  }
>  
> +static void test_kprobe_lrsc(struct kunit *test)
> +{
> +	struct kprobe kp = {};
> +
> +	kp.pre_handler = kprobe_dummy_handler;
> +
> +	/* a probe inside an LR/SC sequence must be rejected */
> +	kp.addr = (kprobe_opcode_t *)((unsigned long)test_kprobes_lrsc +
> +				      test_kprobes_lrsc_offsets[0]);
> +	KUNIT_EXPECT_LT(test, register_kprobe(&kp), 0);
> +
> +	/* a probe right after the sequence must be accepted */
> +	kp.addr = (kprobe_opcode_t *)((unsigned long)test_kprobes_lrsc +
> +				      test_kprobes_lrsc_offsets[1]);
> +	KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp));
> +	unregister_kprobe(&kp);
> +}

We should have at least 4 checks: right before, first inside, last
inside, right after.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
