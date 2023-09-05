Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF5CA0FE2
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGBysxLGFN53Nw0XhDp3qkJMgIQu+YSxOEvsmZfsaDM=; b=fUxMlF1MvKO07P
	12YdvDpYq1zKsvHTPmLol20uVGVzAZ7MW8JzQosctXt9jj03cgHbMTDvZxCuTuiWEeN7bvFig4w5D
	VhVgpmTK5LH2k4rk+WH62IczARRWRMeSxpdLjWjY+qAIYMBlr/C2RqSc3ZRGtE/5mVRT0cOgpvVyq
	xh8+VASaTSbAa93yg3uphV5t48IneNZbanIxduZh8UyqgIv212WqYEwxLFrkZmctBf8oCJMBNhVsR
	rkyXnJL52tvWbFVAgzTerkCey/Prhqqaj3145gjbPegbjvSXETJp5K/bwZpC4dmQOKWNaJg+2o5JR
	8yVTydGbuF5Ic5sr5dug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYdO-006K8R-1M;
	Tue, 05 Sep 2023 16:10:34 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYdL-006K7X-30
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 16:10:33 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-52e5900cf77so1890319a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693930228; x=1694535028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gy3id9O5caxRuZ0iw3cYzh/V/Z/fd9QUhNI7lmJ2DWs=;
        b=FmYVzRoK4xEThZzw2rx4h/QSN+d0tXRY80o/UF/038+YZXQw6EZ+34g0wYynkjy0h2
         NgfDKPiH6qJNVwxbdySu1X+Eua+M792Zg5sy4wEF01vOoD3IpJKtuohwkhnDruw7wr5B
         ubkbw4TeCLXc8+FpGCsxxvI/8TjFu6mIB8DP9ZdwYtANVqGen5NDHYIAqWaEhPYxddsh
         4q5+u97s7Gf7JeWAbmd5kZVt/CGy3zoMWlKiiQ0tjboGRIrkJno3EvizBg9KuDwDt8Ad
         1MwWl6CC5OdIWT7FvABjWqnPfHs2845giiE10uJP66JLRHaLKQ0kyzAhGQXEfFKq3BO1
         d13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693930228; x=1694535028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy3id9O5caxRuZ0iw3cYzh/V/Z/fd9QUhNI7lmJ2DWs=;
        b=izzIEdJaGOc3wiX9japscM458C9vJVhypK/gJ9T+cyNRgiVZEWq3M7nKnF1Hnb637y
         3vM+wunbkK6FswT0RAj9BF+QEtU4B6vp8KpFtFcYKN3R5VG6lmviMq/QUg6Vv0jvTZbW
         5dlHnN3j2vygLPARaLM/G2AJqGkwyfDT4sr6F3Nt8Tft9C4G/n4d1/gp9gvIDy/Zh+uk
         2sJE2uahWs7lxk4aDT2pXYkbb7avIQTMN0AKKT6VorYsZn5mW3+8VxrJM6IwY7+u9TZB
         SOPkY86Qn45UOP24wqioSeIZVbBQSZU9XElxMqfwrLkgfHhAMBu42tdje81vWFk2SWJB
         LtHQ==
X-Gm-Message-State: AOJu0YwvQCYqInhparL8Exxm2tUioHNATJ7TnphYBmFwc+OrPFWkTlVF
	rvvM+QCnmz49pMT8mfUWGlDDJPiFpK7dvAasrSSNfnV4
X-Google-Smtp-Source: AGHT+IE9BuQiA6jSdp0B6hrWw6GpKz91jfSljQC94/EQSzJv5i1vf0cHClRzSUwufi9Cnz58DEgoGA==
X-Received: by 2002:aa7:c245:0:b0:523:102f:3cdd with SMTP id y5-20020aa7c245000000b00523102f3cddmr225959edo.19.1693930227261;
        Tue, 05 Sep 2023 09:10:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u3-20020a05640207c300b005256d80cdaesm7255966edy.65.2023.09.05.09.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:10:26 -0700 (PDT)
Date: Tue, 5 Sep 2023 18:10:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "evan@rivosinc.com" <evan@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
Message-ID: <20230905-1ca92f76cd928ff3f6e51c71@orel>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
 <20230904170220.167816-14-ajones@ventanamicro.com>
 <DM8PR11MB5751158F177162EA71B6164AB8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5751158F177162EA71B6164AB8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_091031_976199_464B11A9 
X-CRM114-Status: GOOD (  34.66  )
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

On Tue, Sep 05, 2023 at 02:36:44PM +0000, Wang, Xiao W wrote:
> Hi,
> 
> > -----Original Message-----
> > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> > Andrew Jones
> > Sent: Tuesday, September 5, 2023 1:02 AM
> > To: linux-riscv@lists.infradead.org
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; evan@rivosinc.com; conor.dooley@microchip.com;
> > apatel@ventanamicro.com
> > Subject: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
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
> >  tools/testing/selftests/riscv/hwprobe/cbo.c   | 170 ++++++++++++++++++
> >  .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
> >  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
> >  4 files changed, 192 insertions(+), 12 deletions(-)
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
> > index 000000000000..50e85f31a2c7
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> > @@ -0,0 +1,170 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > + *
> > + * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
> > + * subset of cpus, as well as only executing the tests on those cpus.
> > + */
> 
> Patch 3/6 exposes a common subset extensions of the cpu list to user space, so, if some of the cores support ZICBOZ while other don't, hwprobe() won't expose ZICBOZ ext, but in this case the cbo_zero insn might run w/o illegal insn exception when the task is scheduled to run on a core that support ZICBOZ. The test result may vary for each run for this case.
> Maybe we can add some comment for this special test case?

Ah, you're right, and I'm afraid a comment isn't sufficient, since testers
may not have the code handy nor think to check for comments before
reporting issues. The test code needs to handle this case, at least by
outputting helpful directions to the tester when the case is detected.

It'd be nice to have a hwprobe variant which takes an extension as input
and returns a cpu set describing each cpu which supports the extension.
Instead, I'll create an inefficient function which does that, based on
multiple hwprobe calls. Then, on a mixed set, the test will complain and
skip, informing the tester to taskset a subset of cpus which are
consistent wrt the extension.

> 
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
> > +#define MK_CBO(fn) ((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
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
> > +	assert(insn == MK_CBO(regs[11]));
> 
> 
> The byte order of insn should always be little endian, while the CPU may be a big-endian one, then the check might fail.
> Maybe we can use __le32_to_cpu(insn) to convert it before the check.

Sounds good (minus the leading __, since we don't have __le32_to_cpu() in
tools).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
