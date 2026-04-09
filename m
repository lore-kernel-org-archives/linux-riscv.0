Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FBFF364BD
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uPXRbSQkN25L9V7hStg+W+sOS8WkcFDSC3biUX98Nc=; b=WsMddrxZhtLPT8
	Nh0BL10P7lf8clL7fGJrHcSnbouAsAQ5WTRLbE9/h9vM0+8m2PWF+2RyvWEiCK8z5vCM4TTkAUqbQ
	5pRXgKv2vb1j032bh748cfo1UK2lt5jNpylr2CVIfBIgjEIJxL+22ODeqUUDMkRPOWLYoNw0rBhZx
	wPnHt933GDg5hR5wvR/Zo0eh++Ec87ImCWrVBADfw/trrLZMLHbVdSDfd4y/mt6pl0ZGdYN+iTqPq
	1gLyihjU6kAumXQWQ9mvxY0IqpAtDa9UN958dd2eGV1gy/h3gb9OMzXJinRLE/h3HVrB4oeamxr3X
	41Ct3MDBJrkDDwAUCthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwVz-0000000BCnY-3FEL;
	Thu, 09 Apr 2026 21:02:15 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAwVx-0000000BCnA-36OO
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 21:02:15 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2ce22328930so1888480eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775768532; x=1776373332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgvdO76KiaTWX80p2d2v2AfVfinppiUA4Bwcov7OeCo=;
        b=oZ/3xQN5F4klKbZwoWhlPghB4JH1G5I7v2ZWoW5WiFNJM3WFq+sk1D9YTQXrQZxi6x
         IDphokUTX3vRAN4k2HkP2Kmpaf8HxE2/7gBBzaQ9PARYlleREtjNANlqzFEZyGwccruP
         HXASg8WPyJBdZbb/ZHnWXZxWQ49DTjB7bO3CJjqU9GORJenZMhUjIxHXf442g155WcdE
         LY7CKG3BZNXVB5GpWH51R0J/2CVVZPY2GZGjVUBj3qf/J3BwBSn3gALwBFcj7ilPMPLq
         GIh6CBdy/mi54OGj9iI4QM+S3OcFBOwM+vyUnpRcJdWHqk4+IBL7b7PypZb3qCKSKXHa
         bHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768532; x=1776373332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgvdO76KiaTWX80p2d2v2AfVfinppiUA4Bwcov7OeCo=;
        b=a5mMtKcOGWAkTD6+0FhEE2dXnaeLDxUttNPzmYo/q7Ccl1gOnCH3w2y3boooZADCYp
         xgagfJ4eAFfczGMZqvlQGlyow7Yktv3vxnvnPZFLASPo2Xh5lGlPLKnjDqxpb7YlEI0a
         bma7C+wd4Bm4qtOzQMl4S+2EK2nrvNpx2AsXPRxi6yir1/JP4qA+Z+IZNZOjQxSrHzLy
         UPxHu220REcKy3tqESqCo9lwQsI5IPnv5RO6rr2r7FUYLPYZrqv8s0/d/xI9FggBY9TN
         mGltbEoafvomfLtECHBPy2l9kCT8Qm8DVshDvRjq2LiN+WC9y9lDKuDBJCjZ50qd880s
         0PGg==
X-Forwarded-Encrypted: i=1; AJvYcCVampFROVHgEc091f3oLUIGYUfcK5RAmvvrVWVkRM5TeH3d0ef7OtS8/J5rD8Pzn849sC0Z425Ynm3I+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytl9kaCHQwHwZRifCnZHC3Dl9DgvNZGb9N6WDUdddGahBdie3j
	WpexqcZJPZCTEJIqFuIoj+KoNCDEO/bvVJHFeAF38sVn4kLkISG1DQZ5
X-Gm-Gg: AeBDiesNAOtZTnhjQGnQiNNZDYQAxGzh5eaMSwhXKDKg0CEUQxEer3ehy+xOQ/8g2jm
	JQmtTZOINkHzDQfcMo4YW0Z9303j5u+vTAwaHcvZEbBcM8atjtsoxsqZkTjD3srOdU8A19nDRCq
	tUrDUdaDOOISK3OYRtgAI1+sjT+5Q2nDWkYupDe8OPShSQEmwJU0Kmbgi1ppv4OaB+XJ8bUz/bl
	R33UQ5SiUX/GZKiAnPw4BRXW1ug8/geK9/XGh6GAvVOfp9grIIZfzMKJfdoVKygKhuAH/kyUvvF
	pimJ+rjzQ3fUh9VhjIWdWXJRbXrAO8XoWDtRsQ26tAeaakj1FJMdFPud0f0Ej5jhKzs68SfUzo/
	1ovOFV6Weh88nps3Oim/QIxccqCPkUqv286G1sMSysha1pf48qcbBqgDNyqEQiJS36OHvxBg+ge
	B/4hxTeL0Zbhqpi69Y2lmHuihvkzGRJEi6ZZsuEc4RnQGoOHUgYq4E
X-Received: by 2002:a05:7300:4352:b0:2d3:2846:c878 with SMTP id 5a478bee46e88-2d586ea75aemr417180eec.5.1775768532041;
        Thu, 09 Apr 2026 14:02:12 -0700 (PDT)
Received: from inky.localdomain ([2601:647:6700:64d0:f083:8467:43b0:e8f8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69casm1639529eec.2.2026.04.09.14.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:02:11 -0700 (PDT)
Date: Thu, 9 Apr 2026 14:02:09 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] lib: kunit: add tests for __ashldi3(),
 __ashrdi3(), and __lshrdi3()
Message-ID: <20260409210209.GA495379@inky.localdomain>
References: <adavgV5IF9jMzxr3@ashevche-desk.local>
 <20260409033824.465455-1-dmantipov@yandex.ru>
 <20260409033824.465455-3-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409033824.465455-3-dmantipov@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_140213_791835_EB138E89 
X-CRM114-Status: GOOD (  25.08  )
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

On Thu, Apr 09, 2026 at 06:38:24AM +0300, Dmitry Antipov wrote:
> Add KUnit tests for '__ashldi3()', '__ashrdi3()', and '__lshrdi3()'
> helper functions used to implement 64-bit arithmetic shift left,
> arithmetic shift right and logical shift right, respectively,
> on a 32-bit CPUs.
> 
> Tested with 'qemu-system-riscv32 -M virt' and 'qemu-system-arm -M virt'.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

I was able to reproduce these three tests passing on riscv32 qemu.

Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

> ---
> v2: include test-specific headers rather than generic linux/kernel.h
> ---
>  lib/Kconfig.debug       |  10 +++
>  lib/tests/Makefile      |   1 +
>  lib/tests/shdi3_kunit.c | 175 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)
>  create mode 100644 lib/tests/shdi3_kunit.c
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 93f356d2b3d9..b68b1325379b 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2942,6 +2942,16 @@ config BITS_TEST
>  
>  	  If unsure, say N.
>  
> +config SHDI3_KUNIT_TEST
> +	tristate "KUnit test for __ashldi3(), __ashrdi3(), and __lshrdi3()"
> +	depends on KUNIT
> +	depends on (32BIT || ARM)
> +	help
> +	  This builds the unit test for __ashldi3(), __ashrdi3(), and
> +	  __lshrdi3() helper functions used to implement 64-bit arithmetic
> +	  shift left, arithmetic shift right and logical shift right,
> +	  respectively, on a 32-bit CPUs.
> +
>  config SLUB_KUNIT_TEST
>  	tristate "KUnit test for SLUB cache error detection" if !KUNIT_ALL_TESTS
>  	depends on SLUB_DEBUG && KUNIT
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 05f74edbc62b..db678ccdd8b1 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_BASE64_KUNIT) += base64_kunit.o
>  obj-$(CONFIG_BITOPS_KUNIT) += bitops_kunit.o
>  obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
>  obj-$(CONFIG_BITS_TEST) += test_bits.o
> +obj-$(CONFIG_SHDI3_KUNIT_TEST) += shdi3_kunit.o
>  obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) += blackhole_dev_kunit.o
>  obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
>  obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
> diff --git a/lib/tests/shdi3_kunit.c b/lib/tests/shdi3_kunit.c
> new file mode 100644
> index 000000000000..44f65e66512b
> --- /dev/null
> +++ b/lib/tests/shdi3_kunit.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR Apache-2.0
> +/*
> + * Test cases for __ashldi3(), __ashrdi3(), and __lshrdi3().
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/module.h>
> +#include <linux/libgcc.h>
> +#include <kunit/test.h>
> +
> +struct shdi3_test_entry {
> +	long long input;
> +	int shift;
> +	long long result;
> +};
> +
> +static const struct shdi3_test_entry ashldi3_testdata[] = {
> +	/* https://github.com/llvm/llvm-project/compiler-rt/test/builtins/Unit/ashldi3_test.c */
> +	{ 0x0123456789ABCDEFLL, 0, 0x123456789ABCDEFLL },
> +	{ 0x0123456789ABCDEFLL, 1, 0x2468ACF13579BDELL },
> +	{ 0x0123456789ABCDEFLL, 2, 0x48D159E26AF37BCLL },
> +	{ 0x0123456789ABCDEFLL, 3, 0x91A2B3C4D5E6F78LL },
> +	{ 0x0123456789ABCDEFLL, 4, 0x123456789ABCDEF0LL },
> +	{ 0x0123456789ABCDEFLL, 28, 0x789ABCDEF0000000LL },
> +	{ 0x0123456789ABCDEFLL, 29, 0xF13579BDE0000000LL },
> +	{ 0x0123456789ABCDEFLL, 30, 0xE26AF37BC0000000LL },
> +	{ 0x0123456789ABCDEFLL, 31, 0xC4D5E6F780000000LL },
> +	{ 0x0123456789ABCDEFLL, 32, 0x89ABCDEF00000000LL },
> +	{ 0x0123456789ABCDEFLL, 33, 0x13579BDE00000000LL },
> +	{ 0x0123456789ABCDEFLL, 34, 0x26AF37BC00000000LL },
> +	{ 0x0123456789ABCDEFLL, 35, 0x4D5E6F7800000000LL },
> +	{ 0x0123456789ABCDEFLL, 36, 0x9ABCDEF000000000LL },
> +	{ 0x0123456789ABCDEFLL, 60, 0xF000000000000000LL },
> +	{ 0x0123456789ABCDEFLL, 61, 0xE000000000000000LL },
> +	{ 0x0123456789ABCDEFLL, 62, 0xC000000000000000LL },
> +	{ 0x0123456789ABCDEFLL, 63, 0x8000000000000000LL },
> +};
> +
> +static void shdi3_test_ashldi3(struct kunit *test)
> +{
> +	const struct shdi3_test_entry *e;
> +	long long ret;
> +
> +	for (e = ashldi3_testdata;
> +	     e < ashldi3_testdata + ARRAY_SIZE(ashldi3_testdata); e++) {
> +		ret = __ashldi3(e->input, e->shift);
> +		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
> +				    "    when evaluating __ashldi3(%lld, %d)",
> +				    e->input, e->shift);
> +	}
> +}
> +
> +static const struct shdi3_test_entry ashrdi3_testdata[] = {
> +	/* https://github.com/llvm/llvm-project/compiler-rt/test/builtins/Unit/ashrdi3_test.c */
> +	{ 0x0123456789ABCDEFLL, 0, 0x123456789ABCDEFLL },
> +	{ 0x0123456789ABCDEFLL, 1, 0x91A2B3C4D5E6F7LL },
> +	{ 0x0123456789ABCDEFLL, 2, 0x48D159E26AF37BLL },
> +	{ 0x0123456789ABCDEFLL, 3, 0x2468ACF13579BDLL },
> +	{ 0x0123456789ABCDEFLL, 4, 0x123456789ABCDELL },
> +	{ 0x0123456789ABCDEFLL, 28, 0x12345678LL },
> +	{ 0x0123456789ABCDEFLL, 29, 0x91A2B3CLL },
> +	{ 0x0123456789ABCDEFLL, 30, 0x48D159ELL },
> +	{ 0x0123456789ABCDEFLL, 31, 0x2468ACFLL },
> +	{ 0x0123456789ABCDEFLL, 32, 0x1234567LL },
> +	{ 0x0123456789ABCDEFLL, 33, 0x91A2B3LL },
> +	{ 0x0123456789ABCDEFLL, 34, 0x48D159LL },
> +	{ 0x0123456789ABCDEFLL, 35, 0x2468ACLL },
> +	{ 0x0123456789ABCDEFLL, 36, 0x123456LL },
> +	{ 0x0123456789ABCDEFLL, 60, 0 },
> +	{ 0x0123456789ABCDEFLL, 61, 0 },
> +	{ 0x0123456789ABCDEFLL, 62, 0 },
> +	{ 0x0123456789ABCDEFLL, 63, 0 },
> +	{ 0xFEDCBA9876543210LL, 0, 0xFEDCBA9876543210LL },
> +	{ 0xFEDCBA9876543210LL, 1, 0xFF6E5D4C3B2A1908LL },
> +	{ 0xFEDCBA9876543210LL, 2, 0xFFB72EA61D950C84LL },
> +	{ 0xFEDCBA9876543210LL, 3, 0xFFDB97530ECA8642LL },
> +	{ 0xFEDCBA9876543210LL, 4, 0xFFEDCBA987654321LL },
> +	{ 0xFEDCBA9876543210LL, 28, 0xFFFFFFFFEDCBA987LL },
> +	{ 0xFEDCBA9876543210LL, 29, 0xFFFFFFFFF6E5D4C3LL },
> +	{ 0xFEDCBA9876543210LL, 30, 0xFFFFFFFFFB72EA61LL },
> +	{ 0xFEDCBA9876543210LL, 31, 0xFFFFFFFFFDB97530LL },
> +	{ 0xFEDCBA9876543210LL, 32, 0xFFFFFFFFFEDCBA98LL },
> +	{ 0xFEDCBA9876543210LL, 33, 0xFFFFFFFFFF6E5D4CLL },
> +	{ 0xFEDCBA9876543210LL, 34, 0xFFFFFFFFFFB72EA6LL },
> +	{ 0xFEDCBA9876543210LL, 35, 0xFFFFFFFFFFDB9753LL },
> +	{ 0xFEDCBA9876543210LL, 36, 0xFFFFFFFFFFEDCBA9LL },
> +	{ 0xAEDCBA9876543210LL, 60, 0xFFFFFFFFFFFFFFFALL },
> +	{ 0xAEDCBA9876543210LL, 61, 0xFFFFFFFFFFFFFFFDLL },
> +	{ 0xAEDCBA9876543210LL, 62, 0xFFFFFFFFFFFFFFFELL },
> +	{ 0xAEDCBA9876543210LL, 63, 0xFFFFFFFFFFFFFFFFLL },
> +};
> +
> +static void shdi3_test_ashrdi3(struct kunit *test)
> +{
> +	const struct shdi3_test_entry *e;
> +	long long ret;
> +
> +	for (e = ashrdi3_testdata;
> +	     e < ashrdi3_testdata + ARRAY_SIZE(ashrdi3_testdata); e++) {
> +		ret = __ashrdi3(e->input, e->shift);
> +		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
> +				    "    when evaluating __ashrdi3(%lld, %d)",
> +				    e->input, e->shift);
> +	}
> +}
> +
> +static const struct shdi3_test_entry lshrdi3_testdata[] = {
> +	/* https://github.com/llvm/llvm-project/compiler-rt/test/builtins/Unit/lshrdi3_test.c */
> +	{ 0x0123456789ABCDEFLL, 0, 0x123456789ABCDEFLL },
> +	{ 0x0123456789ABCDEFLL, 1, 0x91A2B3C4D5E6F7LL },
> +	{ 0x0123456789ABCDEFLL, 2, 0x48D159E26AF37BLL },
> +	{ 0x0123456789ABCDEFLL, 3, 0x2468ACF13579BDLL },
> +	{ 0x0123456789ABCDEFLL, 4, 0x123456789ABCDELL },
> +	{ 0x0123456789ABCDEFLL, 28, 0x12345678LL },
> +	{ 0x0123456789ABCDEFLL, 29, 0x91A2B3CLL },
> +	{ 0x0123456789ABCDEFLL, 30, 0x48D159ELL },
> +	{ 0x0123456789ABCDEFLL, 31, 0x2468ACFLL },
> +	{ 0x0123456789ABCDEFLL, 32, 0x1234567LL },
> +	{ 0x0123456789ABCDEFLL, 33, 0x91A2B3LL },
> +	{ 0x0123456789ABCDEFLL, 34, 0x48D159LL },
> +	{ 0x0123456789ABCDEFLL, 35, 0x2468ACLL },
> +	{ 0x0123456789ABCDEFLL, 36, 0x123456LL },
> +	{ 0x0123456789ABCDEFLL, 60, 0 },
> +	{ 0x0123456789ABCDEFLL, 61, 0 },
> +	{ 0x0123456789ABCDEFLL, 62, 0 },
> +	{ 0x0123456789ABCDEFLL, 63, 0 },
> +	{ 0xFEDCBA9876543210LL, 0, 0xFEDCBA9876543210LL },
> +	{ 0xFEDCBA9876543210LL, 1, 0x7F6E5D4C3B2A1908LL },
> +	{ 0xFEDCBA9876543210LL, 2, 0x3FB72EA61D950C84LL },
> +	{ 0xFEDCBA9876543210LL, 3, 0x1FDB97530ECA8642LL },
> +	{ 0xFEDCBA9876543210LL, 4, 0xFEDCBA987654321LL },
> +	{ 0xFEDCBA9876543210LL, 28, 0xFEDCBA987LL },
> +	{ 0xFEDCBA9876543210LL, 29, 0x7F6E5D4C3LL },
> +	{ 0xFEDCBA9876543210LL, 30, 0x3FB72EA61LL },
> +	{ 0xFEDCBA9876543210LL, 31, 0x1FDB97530LL },
> +	{ 0xFEDCBA9876543210LL, 32, 0xFEDCBA98LL },
> +	{ 0xFEDCBA9876543210LL, 33, 0x7F6E5D4CLL },
> +	{ 0xFEDCBA9876543210LL, 34, 0x3FB72EA6LL },
> +	{ 0xFEDCBA9876543210LL, 35, 0x1FDB9753LL },
> +	{ 0xFEDCBA9876543210LL, 36, 0xFEDCBA9LL },
> +	{ 0xAEDCBA9876543210LL, 60, 0xALL },
> +	{ 0xAEDCBA9876543210LL, 61, 0x5LL },
> +	{ 0xAEDCBA9876543210LL, 62, 0x2LL },
> +	{ 0xAEDCBA9876543210LL, 63, 0x1LL },
> +};
> +
> +static void shdi3_test_lshrdi3(struct kunit *test)
> +{
> +	const struct shdi3_test_entry *e;
> +	long long ret;
> +
> +	for (e = lshrdi3_testdata;
> +	     e < lshrdi3_testdata + ARRAY_SIZE(lshrdi3_testdata); e++) {
> +		ret = __lshrdi3(e->input, e->shift);
> +		KUNIT_EXPECT_EQ_MSG(test, ret, e->result,
> +				    "    when evaluating __lshrdi3(%lld, %d)",
> +				    e->input, e->shift);
> +	}
> +}
> +
> +static struct kunit_case shdi3_test_cases[] = {
> +	KUNIT_CASE(shdi3_test_ashldi3),
> +	KUNIT_CASE(shdi3_test_ashrdi3),
> +	KUNIT_CASE(shdi3_test_lshrdi3),
> +	{}
> +};
> +
> +static struct kunit_suite shdi3_test_suite = {
> +	.name = "shdi3",
> +	.test_cases = shdi3_test_cases,
> +};
> +kunit_test_suite(shdi3_test_suite);
> +
> +MODULE_DESCRIPTION("Test cases for __ashldi3(), __ashrdi3(), and __lshrdi3()");
> +MODULE_LICENSE("GPL");
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
