Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C615DCA0FE5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDbNgp5EfCyMfjkCBENR0ZF5+bONvGM09gbYh5svUsc=; b=WNI1b0ABKQ8RDE
	LVfJ0r1vhHUwrhIO+mQuSmVdT/qO/K0MkepcV8GMNGyUTDIAQpMcmTjAV8s8SSyrZHNKfyNvWE5ZZ
	F4QEkc4JLDGYQWQdSmmC+o88aWnXxcgbhVkPqecSgrFpjcCl1t0iMX/I79ASr9sDnie7O69rmeUrl
	0c0wHkkDTTPqa7oP+RAMSJlA7z6MtlEf0WDEg0ccypw6JBrKlfsOLCU56DbcBotZkDP2nkTGYLY9M
	jYZ7eGlNCrILqQ05pcgkZesMaE0Z0LdzFTW0x1b2B0sO4cXhqF37PeKE5kqVt8KY95CFUePc1s3uo
	0Cn2VHwhLJA4A19WW0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5ol-0004wp-2s;
	Fri, 01 Sep 2023 15:12:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5oh-0004wW-2l
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 15:12:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so404665e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693581130; x=1694185930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3be2sF//osJAtnKeEdFbfwaeyJYeei57lis5INUcmXk=;
        b=L//rd/klFCft2R2D9q85WMsbfX36SvbDioDEA3D4uqFkR8SjhCvVu0yxPl5tt7szJl
         Y9eQCmqVX9CqOuh8IF8N5WBKgjqxQ7rZZnFNFfaBQNn1ahiWlZJMsrmbCNSCLKk35I0l
         FykZKDleGonbY93YY+hq16w96gi72cOvIvxhoBaDlPBcuZae82TALGcsu5fMELVH3UAJ
         JDpL4dYcWv96dYEcrMCtTQU4bVweHiJ9zGX2Cr5hgnKJ9Xdzs4A/4HI62TjQQd6KbE/y
         IzP5BnMk/0TgmRJD7KbHjPfUyuHbvH63EozpjSOw4D4IrwM182407YazNjHFDiE7x4Jj
         Ysjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693581130; x=1694185930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3be2sF//osJAtnKeEdFbfwaeyJYeei57lis5INUcmXk=;
        b=WAfqTYY8FZYGmBekcZuNlVREyd9S27f1fWRQPgpm0x750k88wiNp7BPip/n6GjaA2z
         DjxkDZpD0PFILsREmKLbv3/ft3ZWN2XBsehTvgOPVvPqXnTH4QJYoDOKBYWaHs15uzwG
         EK6SotS/QXU3+yWfdR/H+UA4acpVAqbZAVBfMXHEYkbgH4YiWscYo9Dog6snQ3ldW+9y
         P5I4wrLurr8FfxeXmkAHg0Yhve5qIz/k16ick+6KWUUpQEFFwtvyaBGtigpr22zVX9Dd
         Pc5V7H3AutwlgkM9Wf8EEbpl41DVQzWJ/cCUqGZkNh4xct3n7ajUJVH5sS2XyhVa3aXp
         PhSg==
X-Gm-Message-State: AOJu0YzAe7ECwNhMIXBh3jXB4iax7lPatF+Lb2rEUEAJfFQDXfGEi0VL
	j4e90T739ZELcTpjUdg2r5zM7Q==
X-Google-Smtp-Source: AGHT+IHtAXP+yDUbm2K1XH4sJOJ+U+GVHzM53kEKfU13HKSe8uQKH4pdp5KHrhtBXzoNL+VoaeK/6g==
X-Received: by 2002:a5d:6ac7:0:b0:313:f75b:c552 with SMTP id u7-20020a5d6ac7000000b00313f75bc552mr1974498wrw.15.1693581129700;
        Fri, 01 Sep 2023 08:12:09 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d6844000000b003197b85bad2sm5540732wrw.79.2023.09.01.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 08:12:09 -0700 (PDT)
Date: Fri, 1 Sep 2023 17:12:08 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "evan@rivosinc.com" <evan@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 6/6] RISC-V: selftests: Add CBO tests
Message-ID: <20230901-b4e5f6219de94391e5fa11d6@orel>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
 <20230830164954.91987-14-ajones@ventanamicro.com>
 <DM8PR11MB57513A1848E33ABF9131423AB8E4A@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB57513A1848E33ABF9131423AB8E4A@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_081211_892289_2DF5F8C2 
X-CRM114-Status: GOOD (  30.56  )
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

On Fri, Sep 01, 2023 at 09:37:27AM +0000, Wang, Xiao W wrote:
> Hi,
> 
> > -----Original Message-----
> > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> > Andrew Jones
> > Sent: Thursday, August 31, 2023 12:50 AM
> > To: linux-riscv@lists.infradead.org
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; evan@rivosinc.com; conor.dooley@microchip.com;
> > apatel@ventanamicro.com
> > Subject: [PATCH v2 6/6] RISC-V: selftests: Add CBO tests
> > 
> > Add hwprobe test for Zicboz and its block size. Also, when Zicboz is
> > present, test that cbo.zero may be issued and works. Additionally
> > test that the Zicbom instructions cause SIGILL and also that cbo.zero
> > causes SIGILL when Zicboz is not present. Pinning the test to a subset
> > of cpus with taskset will also restrict the hwprobe calls to that set.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
> >  tools/testing/selftests/riscv/hwprobe/cbo.c   | 162 ++++++++++++++++++
> >  .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
> >  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
> >  4 files changed, 184 insertions(+), 12 deletions(-)
> >  create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
> >  create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
> > 
> > diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile
> > b/tools/testing/selftests/riscv/hwprobe/Makefile
> > index 5f614c3ba598..f224b84591fb 100644
> > --- a/tools/testing/selftests/riscv/hwprobe/Makefile
> > +++ b/tools/testing/selftests/riscv/hwprobe/Makefile
> > @@ -2,9 +2,14 @@
> >  # Copyright (C) 2021 ARM Limited
> >  # Originally tools/testing/arm64/abi/Makefile
> > 
> > -TEST_GEN_PROGS := hwprobe
> > +CFLAGS += -I$(top_srcdir)/tools/include
> > +
> > +TEST_GEN_PROGS := hwprobe cbo
> > 
> >  include ../../lib.mk
> > 
> >  $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
> >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > +
> > +$(OUTPUT)/cbo: cbo.c sys_hwprobe.S
> > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c
> > b/tools/testing/selftests/riscv/hwprobe/cbo.c
> > new file mode 100644
> > index 000000000000..920abfaa10c2
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> > @@ -0,0 +1,162 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > + *
> > + * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
> > + * subset of cpus, as well as only executing the tests on those cpus.
> > + */
> > +#define _GNU_SOURCE
> > +#include <stdbool.h>
> > +#include <stdint.h>
> > +#include <sched.h>
> > +#include <signal.h>
> > +#include <assert.h>
> > +#include <linux/compiler.h>
> > +#include <asm/ucontext.h>
> > +
> > +#include "hwprobe.h"
> > +#include "../../kselftest.h"
> > +
> > +static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
> > +
> > +static bool illegal_insn;
> > +
> > +static void sigill_handler(int sig, siginfo_t *info, void *context)
> > +{
> > +	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)-
> > >uc_mcontext;
> > +	uint32_t insn = *(uint32_t *)regs[0];
> > +
> > +	assert(insn >> 20 == regs[11] &&
> > +	       (insn & ((1 << 20) - 1)) == (10 << 15 | 2 << 12 | 0 << 7 | 15));
> > +
> > +	illegal_insn = true;
> > +	regs[0] += 4;
> > +}
> > +
> > +static void cbo_insn(int fn, char *base)
> > +{
> > +	asm volatile(
> > +	"mv	a0, %0\n"
> > +	"li	a1, %1\n"
> > +	".4byte	%1 << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15\n"
> > +	: : "r" (base), "i" (fn) : "a0", "a1", "memory");
> > +}
> > +
> > +static void cbo_inval(char *base) { cbo_insn(0, base); }
> > +static void cbo_clean(char *base) { cbo_insn(1, base); }
> > +static void cbo_flush(char *base) { cbo_insn(2, base); }
> > +static void cbo_zero(char *base)  { cbo_insn(4, base); }
> > +
> > +static void test_no_zicbom(void)
> > +{
> > +	illegal_insn = false;
> > +	cbo_clean(&mem[0]);
> > +	ksft_test_result(illegal_insn, "No cbo.clean\n");
> > +
> > +	illegal_insn = false;
> > +	cbo_flush(&mem[0]);
> > +	ksft_test_result(illegal_insn, "No cbo.flush\n");
> > +
> > +	illegal_insn = false;
> > +	cbo_inval(&mem[0]);
> > +	ksft_test_result(illegal_insn, "No cbo.inval\n");
> > +}
> > +
> > +static void test_no_zicboz(void)
> > +{
> > +	illegal_insn = false;
> > +	cbo_clean(&mem[0]);
> 
> Seems we need to call cbo_zero() instead of cbo_clean().

Nice catch, Xiao. Copy+paste mistake... Will fix for v3.

Thanks,
drew

> 
> BRs,
> Xiao
> 
> > +	ksft_test_result(illegal_insn, "No cbo.zero\n");
> > +}
> > +
> [...]
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
