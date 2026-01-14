Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77746D30CF8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDZAqRkHHrkMXwfsUY69mNy/MgwqiSNZDltUjpmrt/Q=; b=JgnHzGEi/bQwYE
	jkmT20Gh/IsQFU9Dtn80n4o2HxEDmnG6UjAW4tp0BQB8AGe433goyQEj6PIF+45fgkBVJlOUTcWlN
	VWsPmHTrXcnVgYAGCMbANr9KJ1hU6Rv3iLiScQFDFwB3X+APAkgFdj6GTbriW8z4GnpMuz650sfxO
	6j2HMjmr7bXzbz4Us71jeJD3eZD0iPFH+W+FOUcRMMROUNL6h8oN0VmC2TSB5s9DCtuUpMzD9oBYF
	liSlJGrTz0r9y7Ilj3UgOt9GWz0oUSPa2CR0iI5UZPd6wheF0QfSiIGyRMqJAPBlwdB3QWITDuGE4
	lMPz1SUAIsqFht31lAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfy0n-00000008l8Y-0jOJ;
	Wed, 14 Jan 2026 10:22:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfy0k-00000008l7p-1Luh
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 10:21:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so7088594f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386116; x=1768990916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aby9hG1Lpv1OF3fYnEo/Zyk0Fv/I6aSt+58OzVwNuFQ=;
        b=Lx5jdvY+WnZ5r12kN0rtX/HB1GVyDpp2RWiGOKS9AOejLjq8T/vGSTU9Q7uDthrWZ6
         H9qQ2g0tryeaBTsWHAm0P0GaZx2vBetMbFu+8iitQMoprkf1aPzxqRkiN8kJp+q3xH2t
         cR7R/Bdj3u5H1OHM0UiS4FGTJR/YLfGeo/fWBFGz7+1p6s5ramyxf3SA6jKmHJyc2c3w
         yRmvXFkR0l74gd/tJ3VXFI1SwSSm/+wWX5xKKwMtc11aZcfsr9r0NDaqCmkibXWPsmIq
         +j4REIFTE3eAZZkujFRnhV9aUckw/20VRpkLxudx3DWy08IeYvrE4f4VUl3VPN36vJMM
         +DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386116; x=1768990916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aby9hG1Lpv1OF3fYnEo/Zyk0Fv/I6aSt+58OzVwNuFQ=;
        b=I9pXMbvGrYxIdQTPOYiAFUhBlVkCre3xoFtsCcbk3QTjuGdzC43EHY7V+uKiL7tnHT
         GuvPhegOfZhdQ8k2eKTB8ewp0G1fhvod5OaMkHBQEJgtUrPnVz6bQH39POc6OS6iucoO
         EM/HjB9cNDFeTuSd9SAywy+Ol0hymqAO925LNkBOAnzlDcz4FeuRmlEcEqU1/s9iPkGg
         0W5oKKlpytOAq+flzsSlimAnPuTT2pqbbGE4836rMyy5vI78WewUgtc8y0wFSWR5iVdx
         2JMgTW/0EuC3sc1tjvWc4INpwYzZh25jtt8/r63D2iYcrJbbXcUAn9PdnDvKxJy6Jrem
         X3yw==
X-Forwarded-Encrypted: i=1; AJvYcCXK63T2ak435+DNN+LeRjfNG3OaJK7g80Q3acdfMnxxB6oCi8AXuLJu1w+s4RH6CQ/NpiySWvFCttcI+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbGMV1oUGR2msHVF/PDNDpjZ2fyTHyKw4/gbF6BTbR44qQ4J0+
	a3CP0lnJgoVOXgaiWnyR8cequu9go2GMAwE5v3gYh6j71wlfDffSbwSf
X-Gm-Gg: AY/fxX7rJ1pobjTNPlKDMi8e93g2nh9czVr9Bzkbi9bkFoJ7hQba0U3L7Bk4Jw2OPpZ
	xn0Z+nCsEA/cLviZBn2yjxSpKqu0T6+N7TGbMZbkIV9GW1H4UeW3JYuvkIK2eNDDxiofDSSl8Kz
	l6zymN+ydpKVp6D6yPRw8iPz1GvgJnaVI0jMkLx4mp0kF/yv713UkjEWJrF8WXAOHND004UVepP
	uWXcK/PPVDzKHBRdmfkD85+eHXhbfu0KsYIXq/BVyOmwYX7RUQWvwukJWoVSQaqIhfhGeiQlRQy
	vvnkPmk/D8noH8SbrzEb6cogCtLYE1iAPW672NxIGLFK3B0SzL2nW1V7goIrNo22UEnJIOsA8WK
	rRCWi6LP2Sf58UB+M5h6jLba6LYqZYk/C3EHsY5QvL3eaXFn8dtabxiTy6YoMObiA52Bt/B5dcQ
	tp/50MLnbzO8mvlOhmBnSbnPTazvFojzqrRqjCy3mOc4YIkLhwV1Eg
X-Received: by 2002:a05:6000:1789:b0:433:42d1:f71f with SMTP id ffacd0b85a97d-4342c543bc2mr2513654f8f.38.1768386116121;
        Wed, 14 Jan 2026 02:21:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm48694254f8f.0.2026.01.14.02.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:21:55 -0800 (PST)
Date: Wed, 14 Jan 2026 10:21:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org,
 andy@kernel.org, akpm@linux-foundation.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, ardb@kernel.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, samuel.holland@sifive.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark
 for strlen()
Message-ID: <20260114102154.251082c6@pumpkin>
In-Reply-To: <a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
	<20260113082748.250916-9-jiangfeng@kylinos.cn>
	<aWYGWLEekWh3jJVf@smile.fi.intel.com>
	<b06e4a63-85c2-4420-8077-f4c059ef33fb@kylinos.cn>
	<a58e97ad-a69e-498d-9382-2be4914569b0@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_022158_407142_2869EB08 
X-CRM114-Status: GOOD (  14.83  )
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

On Wed, 14 Jan 2026 15:04:58 +0800
Feng Jiang <jiangfeng@kylinos.cn> wrote:

> On 2026/1/14 14:14, Feng Jiang wrote:
> > On 2026/1/13 16:46, Andy Shevchenko wrote:  
> >> On Tue, Jan 13, 2026 at 04:27:42PM +0800, Feng Jiang wrote:  
> >>> Introduce a benchmark to compare the architecture-optimized strlen()
> >>> implementation against the generic C version (__generic_strlen).
> >>>
> >>> The benchmark uses a table-driven approach to evaluate performance
> >>> across different string lengths (short, medium, and long). It employs
> >>> ktime_get() for timing and get_random_bytes() followed by null-byte
> >>> filtering to generate test data that prevents early termination.
> >>>
> >>> This helps in quantifying the performance gains of architecture-specific
> >>> optimizations on various platforms.  
...
> Preliminary results with this change look much more reasonable:
> 
>     ok 4 string_test_strlen
>     # string_test_strlen_bench: strlen performance (short, len: 8, iters: 100000):
>     # string_test_strlen_bench:   arch-optimized: 4767500 ns
>     # string_test_strlen_bench:   generic C:      5815800 ns
>     # string_test_strlen_bench:   speedup:        1.21x
>     # string_test_strlen_bench: strlen performance (medium, len: 64, iters: 100000):
>     # string_test_strlen_bench:   arch-optimized: 6573600 ns
>     # string_test_strlen_bench:   generic C:      16342500 ns
>     # string_test_strlen_bench:   speedup:        2.48x
>     # string_test_strlen_bench: strlen performance (long, len: 2048, iters: 10000):
>     # string_test_strlen_bench:   arch-optimized: 7931000 ns
>     # string_test_strlen_bench:   generic C:      35347300 ns

That is far too long.
In 35ms you are including a lot of timer interrupts.
You are also just testing the 'hot cache' case.
The kernel runs 'cold cache' a lot of the time - especially for instructions.

To time short loops (or even single passes) you need a data dependency
between the 'start time' and the code being tested (easy enough, just add
(time & non_compile_time_zero) to a parameter), and between the result of
the code and the 'end time' - somewhat harder (doable in x86 if you use
the pmc cycle counter).

	David


>     # string_test_strlen_bench:   speedup:        4.45x
>     ok 5 string_test_strlen_bench
> 
> I will adopt this pattern in v3, along with cache warm-up and preempt_disable(),
> to stay consistent with existing kernel benchmarks and ensure robust measurements.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
