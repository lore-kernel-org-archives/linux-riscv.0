Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18058C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqW6dfzQQmN0URe3/WxnMHe/KsCHeHlM+SK73BTFEi0=; b=IO8IiAU6iCArX+
	orBMafrCNEG0RrLOTTzWAmwcWSWajjxGzjMGtDwXnYsn1pXxuzq6skqR7OtMlI+3kbBvtNHMirJ8Q
	55uf8Cm++UG5zvWF/8ONOMFzbMyPi2ldVsMp7MV0/zSfD7HZhXMTnBjJ1w/DO+V0VfP80qEXG9OfQ
	ticAYGQ5fx3UHN/IRf0lpHEn5OtNNIkt6TYShFDytJI7nVltUoue37VEhP5OjsBOaZVtStAz8/1fY
	JdiZoMtZNI1aW3fX7zargLwdjdGfZlano1Cgo+/pSq7ZldEhuunGc5t9fZCyCQtSdiRZzd33yDG6j
	oJqb5ks4vl+ZBRQVvCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT4QL-000M6F-1H;
	Mon, 07 Aug 2023 17:53:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT4QH-000M3r-02
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 17:53:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-686be3cbea0so3854420b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691430816; x=1692035616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCP5BEYE3PoYJ5/ScF2zz+qCzrPnvgCeGwlMhj3SY1E=;
        b=wy/eJssMAH1COYyqyKXt40eoDoO5PZFm5eZaAslJDQuSmPNwiMxeydLomfZckhjuTD
         3Ld79x4kdLmp41JnM+70vsTJqbGR8mXMbNfYVefIanrcfeKdmyQXtVVlOSceIRnPZMsF
         eJMM7xnVS3BtOzcj5IF4DTL8cup0otzN6J19WrXuoBkW1omwNZF0KRcBcaaytg/A7Ovv
         JoOeSxOb7AMsSai7BtOd7OdAg7KHF54i0xU6VCE5J1YV46ZMjmxR9inFypiTr+ElfWkw
         51bkK748zC96T85wyt3gl4/FHjGbrnDMjro2oY0PtB3h3NX1+PH8hxNf0DOMIIZFolUu
         dYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691430816; x=1692035616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCP5BEYE3PoYJ5/ScF2zz+qCzrPnvgCeGwlMhj3SY1E=;
        b=CwF4yIdw1K6AaHCvkZ4S5snt+oTQozFIYQ/OAG7kabCYlMsVhmbXDFAR1KAG9xoZvl
         P4JL2FUFFUNhe26o13mX+lG2bs3DwWvkcCmlv3SMv3h2Dnu5ZDU//YlIYyMSM7GAvLw1
         itY5qqx+IRLoVVjNsCVxSotwDFfyG+URlL6806gdZFbMhzCzIZhHMR6jZ21aK+xnACxj
         umOsfeD8D1FaPvfRhcdPTYcqembWrig8Z1yOf0Kx4bUqwvB80RS+MRsgJDQqOsHiR56p
         4LCf0+OhqSOi/mzyRLgAvb6TTmXDBJB3l1mIMU6+/7Wo0THC2gMFYPYuhqB225e+HIj4
         y/0w==
X-Gm-Message-State: AOJu0YyUaIwpr+1/mOM+2d0LTVuPXutxo6tZfVZvkqq7Uhwpr9G1SkD2
	j1WLvvacRmJAftBifGIBI3j7ZQ==
X-Google-Smtp-Source: AGHT+IEdHPkqEiEp9lih3/DkRkTB+DjFWF3Lf0bADKGbKUr8B5zIR9lfDWqHuEaA4aXFcOhIDzRYvg==
X-Received: by 2002:a05:6a20:42a8:b0:13f:c159:63ec with SMTP id o40-20020a056a2042a800b0013fc15963ecmr10577943pzj.24.1691430816123;
        Mon, 07 Aug 2023 10:53:36 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0068620bee456sm6417758pfd.209.2023.08.07.10.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 10:53:35 -0700 (PDT)
Date: Mon, 7 Aug 2023 10:53:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v8 2/4] RISC-V: mm: Add tests for RISC-V mm
Message-ID: <ZNEvnBaf0P1owNNU@ghost>
References: <20230727212647.4182407-1-charlie@rivosinc.com>
 <20230727212647.4182407-3-charlie@rivosinc.com>
 <a96afa52-14aa-28f8-d4e5-34bbd3e400ef@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a96afa52-14aa-28f8-d4e5-34bbd3e400ef@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_105341_052780_83BC0DA1 
X-CRM114-Status: GOOD (  31.20  )
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

On Sun, Aug 06, 2023 at 12:06:49PM +0200, Alexandre Ghiti wrote:
> 
> On 27/07/2023 23:26, Charlie Jenkins wrote:
> > Add tests that enforce mmap hint address behavior. mmap should default
> > to sv48. mmap will provide an address at the highest address space that
> > can fit into the hint address, unless the hint address is less than sv39
> > and not 0, then it will return a sv39 address.
> > 
> > These tests are split into two files: mmap_default.c and mmap_bottomup.c
> > because a new process must be exec'd in order to change the mmap layout.
> > The run_mmap.sh script sets the stack to be unlimited for the
> > mmap_bottomup.c test which triggers a bottomup layout.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   tools/testing/selftests/riscv/Makefile        |  2 +-
> >   tools/testing/selftests/riscv/mm/.gitignore   |  2 +
> >   tools/testing/selftests/riscv/mm/Makefile     | 15 +++++
> >   .../riscv/mm/testcases/mmap_bottomup.c        | 35 ++++++++++
> >   .../riscv/mm/testcases/mmap_default.c         | 35 ++++++++++
> >   .../selftests/riscv/mm/testcases/mmap_test.h  | 64 +++++++++++++++++++
> >   .../selftests/riscv/mm/testcases/run_mmap.sh  | 12 ++++
> >   7 files changed, 164 insertions(+), 1 deletion(-)
> >   create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
> >   create mode 100644 tools/testing/selftests/riscv/mm/Makefile
> >   create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
> >   create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_default.c
> >   create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_test.h
> >   create mode 100755 tools/testing/selftests/riscv/mm/testcases/run_mmap.sh
> > 
> > diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
> > index f4b3d5c9af5b..4a9ff515a3a0 100644
> > --- a/tools/testing/selftests/riscv/Makefile
> > +++ b/tools/testing/selftests/riscv/Makefile
> > @@ -5,7 +5,7 @@
> >   ARCH ?= $(shell uname -m 2>/dev/null || echo not)
> >   ifneq (,$(filter $(ARCH),riscv))
> > -RISCV_SUBTARGETS ?= hwprobe vector
> > +RISCV_SUBTARGETS ?= hwprobe vector mm
> >   else
> >   RISCV_SUBTARGETS :=
> >   endif
> > diff --git a/tools/testing/selftests/riscv/mm/.gitignore b/tools/testing/selftests/riscv/mm/.gitignore
> > new file mode 100644
> > index 000000000000..5c2c57cb950c
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/mm/.gitignore
> > @@ -0,0 +1,2 @@
> > +mmap_bottomup
> > +mmap_default
> > diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
> > new file mode 100644
> > index 000000000000..11e0f0568923
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/mm/Makefile
> > @@ -0,0 +1,15 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright (C) 2021 ARM Limited
> > +# Originally tools/testing/arm64/abi/Makefile
> > +
> > +# Additional include paths needed by kselftest.h and local headers
> > +CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
> > +
> > +TEST_GEN_FILES := testcases/mmap_default testcases/mmap_bottomup
> > +
> > +TEST_PROGS := testcases/run_mmap.sh
> > +
> > +include ../../lib.mk
> > +
> > +$(OUTPUT)/mm: testcases/mmap_default.c testcases/mmap_bottomup.c testcases/mmap_tests.h
> > +	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
> > diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
> > new file mode 100644
> > index 000000000000..b29379f7e478
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
> > @@ -0,0 +1,35 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <sys/mman.h>
> > +#include <testcases/mmap_test.h>
> > +
> > +#include "../../kselftest_harness.h"
> > +
> > +TEST(infinite_rlimit)
> > +{
> > +// Only works on 64 bit
> > +#if __riscv_xlen == 64
> > +	struct addresses mmap_addresses;
> > +
> > +	EXPECT_EQ(BOTTOM_UP, memory_layout());
> > +
> > +	do_mmaps(&mmap_addresses);
> > +
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.no_hint);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_37_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_38_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_46_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_47_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_55_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_56_addr);
> > +
> > +	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.no_hint);
> 
> 
> This test ^ will only work on sv48+ systems, if launched on a sv39 system,
> it will fail
>
I may be missing something, but why would this test fail? It may not be
particularily useful since the addresses will always be in the sv39
address space, but it shouldn't fail. I have tested in QEMU and it
passes. This tests if 1UL << 47 is greater than the returned mmap address
which will always be true.
> 
> 
> > +	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_37_addr);
> > +	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_38_addr);
> > +	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_46_addr);
> > +	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_47_addr);
> > +	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_55_addr);
> > +	EXPECT_GT(1UL << 56, (unsigned long)mmap_addresses.on_56_addr);
> > +#endif
> > +}
> > +
> > +TEST_HARNESS_MAIN
> > diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_default.c b/tools/testing/selftests/riscv/mm/testcases/mmap_default.c
> > new file mode 100644
> > index 000000000000..d1accb91b726
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/mm/testcases/mmap_default.c
> > @@ -0,0 +1,35 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <sys/mman.h>
> > +#include <testcases/mmap_test.h>
> > +
> > +#include "../../kselftest_harness.h"
> > +
> > +TEST(default_rlimit)
> > +{
> > +// Only works on 64 bit
> > +#if __riscv_xlen == 64
> > +	struct addresses mmap_addresses;
> > +
> > +	EXPECT_EQ(TOP_DOWN, memory_layout());
> > +
> > +	do_mmaps(&mmap_addresses);
> > +
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.no_hint);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_37_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_38_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_46_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_47_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_55_addr);
> > +	EXPECT_NE(MAP_FAILED, mmap_addresses.on_56_addr);
> > +
> > +	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.no_hint);
> > +	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_37_addr);
> > +	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_38_addr);
> > +	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_46_addr);
> > +	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_47_addr);
> > +	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_55_addr);
> > +	EXPECT_GT(1UL << 56, (unsigned long)mmap_addresses.on_56_addr);
> > +#endif
> > +}
> > +
> > +TEST_HARNESS_MAIN
> > diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_test.h b/tools/testing/selftests/riscv/mm/testcases/mmap_test.h
> > new file mode 100644
> > index 000000000000..98a892de5d19
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/mm/testcases/mmap_test.h
> > @@ -0,0 +1,64 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _TESTCASES_MMAP_TEST_H
> > +#define _TESTCASES_MMAP_TEST_H
> > +#include <sys/mman.h>
> > +#include <sys/resource.h>
> > +#include <stddef.h>
> > +
> > +#define TOP_DOWN 0
> > +#define BOTTOM_UP 1
> > +
> > +struct addresses {
> > +	int *no_hint;
> > +	int *on_37_addr;
> > +	int *on_38_addr;
> > +	int *on_46_addr;
> > +	int *on_47_addr;
> > +	int *on_55_addr;
> > +	int *on_56_addr;
> > +};
> > +
> > +void do_mmaps(struct addresses *mmap_addresses)
> 
> 
> I would static inline this function definition since you are in a header
> file.
> 
> 
> > +{
> > +	/*
> > +	 * Place all of the hint addresses on the boundaries of mmap
> > +	 * sv39, sv48, sv57
> > +	 * User addresses end at 1<<38, 1<<47, 1<<56 respectively
> > +	 */
> > +	void *on_37_bits = (void *)(1UL << 37);
> > +	void *on_38_bits = (void *)(1UL << 38);
> > +	void *on_46_bits = (void *)(1UL << 46);
> > +	void *on_47_bits = (void *)(1UL << 47);
> > +	void *on_55_bits = (void *)(1UL << 55);
> > +	void *on_56_bits = (void *)(1UL << 56);
> > +
> > +	int prot = PROT_READ | PROT_WRITE;
> > +	int flags = MAP_PRIVATE | MAP_ANONYMOUS;
> > +
> > +	mmap_addresses->no_hint =
> > +		mmap(NULL, 5 * sizeof(int), prot, flags, 0, 0);
> > +	mmap_addresses->on_37_addr =
> > +		mmap(on_37_bits, 5 * sizeof(int), prot, flags, 0, 0);
> > +	mmap_addresses->on_38_addr =
> > +		mmap(on_38_bits, 5 * sizeof(int), prot, flags, 0, 0);
> > +	mmap_addresses->on_46_addr =
> > +		mmap(on_46_bits, 5 * sizeof(int), prot, flags, 0, 0);
> > +	mmap_addresses->on_47_addr =
> > +		mmap(on_47_bits, 5 * sizeof(int), prot, flags, 0, 0);
> > +	mmap_addresses->on_55_addr =
> > +		mmap(on_55_bits, 5 * sizeof(int), prot, flags, 0, 0);
> > +	mmap_addresses->on_56_addr =
> > +		mmap(on_56_bits, 5 * sizeof(int), prot, flags, 0, 0);
> > +}
> > +
> > +int memory_layout(void)
> > +{
> > +	int prot = PROT_READ | PROT_WRITE;
> > +	int flags = MAP_PRIVATE | MAP_ANONYMOUS;
> > +
> > +	void *value1 = mmap(NULL, sizeof(int), prot, flags, 0, 0);
> > +	void *value2 = mmap(NULL, sizeof(int), prot, flags, 0, 0);
> > +
> > +	return value2 > value1;
> > +}
> > +#endif /* _TESTCASES_MMAP_TEST_H */
> > diff --git a/tools/testing/selftests/riscv/mm/testcases/run_mmap.sh b/tools/testing/selftests/riscv/mm/testcases/run_mmap.sh
> > new file mode 100755
> > index 000000000000..ca5ad7c48bad
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/mm/testcases/run_mmap.sh
> > @@ -0,0 +1,12 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +original_stack_limit=$(ulimit -s)
> > +
> > +./mmap_default
> > +
> > +# Force mmap_bottomup to be ran with bottomup memory due to
> > +# the unlimited stack
> > +ulimit -s unlimited
> > +./mmap_bottomup
> > +ulimit -s $original_stack_limit

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
