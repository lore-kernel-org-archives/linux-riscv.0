Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4FDE7716A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0y89cHz1n4zrt4vVGs1O+GKcyvEmV87RJ8S7Dvr3YUU=; b=Sn60dxMCENVWo+
	gWcsm3eXGlvRqkWimfHwIqIX97Knpb4Zqqvp1jSHsvOaa9NA/cNwA6OMOnZ/8BE+jB6n0zoFRhaXG
	F1rd8WuuxBNJl5sqqK0tRrhniGF57qvQOHknbEUmuCGYqw389aIq0wmmCBcAcOk6Tmwni9X1nRfKd
	4bgzGXupGJul0AmUwJF/moOfPcieoz7mR01Itos8MVWQOiml8M27LLD3DU2xLl9Om63vAgIojl+M8
	SIY9IA0T0p1NBn3ZeaJMfUxjy1h7MbnS3B6daJYU1sDSEWX+ittGXew1+cgt5asWNElg5EZfk3SgP
	4uKME2zLK3WV/CHrkh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQNO-0000000CKYC-0Fjm;
	Tue, 17 Dec 2024 05:44:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQAO-0000000CIFF-3Ggd
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 05:30:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-728d1a2f180so3635453b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 21:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734413443; x=1735018243; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3eprAB6mL99nuDvuDpZ7xteMR+o2NtdFYL2yb/syKiQ=;
        b=K4z4j6/c/hBjK8yM/KfEh5NtLAg6kn/q5g6WcwKULNpUnWGJ6vTr4tJq7Kvzf037qK
         omgKNX/Bw3BhuzB4RpqaJtBkTc+fKt0osNPhl4cfr05pgNjuwJ1thB5aHWMq+edyMeYX
         ZYIDa1pHaASbdPyu1ISKHvVZ1we193Y/HVdWxMucw71IXNo2ak+gd2wQiDu/Ru/3pepo
         W+J3+JH4TvyHiYhyjPL6JgBjCQk/ubD7L2Co1NaF8kyVd4kaDUwmINyfpC4cP0AHGRBE
         AIqtWlcGHkrsOHRsz/FNrynZnGW9s7E1wG8blBYuNp4pDnflUFpWtzB0flWAb79X2eqP
         fRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734413443; x=1735018243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eprAB6mL99nuDvuDpZ7xteMR+o2NtdFYL2yb/syKiQ=;
        b=wM6xWPwh8pvKei+OJSf0d21be9sABknc6YBvjwAgPyllIWyHYM6/v6FtJ4UsMMdFFO
         AMHAo0Mgrvzxew04U6b0i7/UVUfzxkIvM/R+noCb/Ui0a8SwUV4RMj9oqSwYY9xb5OCs
         cXVfyGhRJAGEEkPT0YvBZFrTlFp0au+f9BiF4E7Ttmh9RISsovOwO0FFDBjeWOmBew3V
         HdQEKNxbCAuTIbD2lcjgrg3yPU64InQhvrPKwPjYrx6+kGNjmlKYabbAliR5B4DUPMgH
         /sPQy8mg6e7ONVX2yTfCumzdM7mE8Kddkk0rUfTH6nydulhuIq+7V4IyyqwnbNhlNdzO
         LsqA==
X-Forwarded-Encrypted: i=1; AJvYcCXompgoA+6n9A/M9G80pJD0Yi0jUWG88C5k+fv3XhF9Va0KustT/KJQVj+HVdryqR+Wgf391RSo3SLt1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNv0bXWvo0mgAUmQA/2tD+rDzZyxMek+0GTUV+ZoPfK2nxQEl6
	0MbTv22ExmEvJOi253NFY8bA0eOx29ajtdTcdhmEHDuS1dcsqUvU2x81JLimNqE=
X-Gm-Gg: ASbGnculYhMmneR8nhyM9QLBlpSCh9EOhtd9IJmrwgY0JQvVFkylqIqJCrdnxvDJwGD
	vcGRLbuvqGKnyDdAUa4UByUWkAHbChtw0cWHsqZzJwNOxqqSFI//0r+q1SM2W5snilrSgyNzxqb
	Msw1kfUoxHVK7t7cnduoY5SBFxyQSw7dqTkRbDS6Z1lv/SPsJyFrBlukm30rd54bvwb/MUwZsKv
	ijNIY/IrY65z94gCH7b32s4CDa7yBpMxCS5gy1xtGDMtwI4zg4=
X-Google-Smtp-Source: AGHT+IGGG8XVKg+X8rmGZK6CbMCJ7mkfFmLPI5+tN+Ymugv6wmhrKZix3qMLXbksYQCVWS+ftd5fVg==
X-Received: by 2002:a05:6a00:7c6:b0:725:e386:3c5b with SMTP id d2e1a72fcca58-72a7872b694mr2639309b3a.5.1734413443517;
        Mon, 16 Dec 2024 21:30:43 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9708:a71e:40e6:860])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5883sm5945241b3a.63.2024.12.16.21.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 21:30:42 -0800 (PST)
Date: Mon, 16 Dec 2024 21:30:39 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 02/16] perf tools: arc: Support generic syscall headers
Message-ID: <Z2EMf8_oShdXHyL1@ghost>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
 <20241212-perf_syscalltbl-v2-2-f8ca984ffe40@rivosinc.com>
 <Z1zIlKq19lAXMoGs@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z1zIlKq19lAXMoGs@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_213044_822183_9AB5EB5D 
X-CRM114-Status: GOOD (  22.24  )
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

On Fri, Dec 13, 2024 at 03:51:48PM -0800, Namhyung Kim wrote:
> On Thu, Dec 12, 2024 at 04:32:52PM -0800, Charlie Jenkins wrote:
> > Arc uses the generic syscall table, use that in perf instead of
> > requiring libaudit.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/perf/Makefile.config                           | 2 +-
> >  tools/perf/Makefile.perf                             | 2 +-
> >  tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
> >  tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
> >  tools/perf/arch/arc/include/syscall_table.h          | 2 ++
> >  5 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > index a72f25162714f0117a88d94474da336814d4f030..3959a9c9972999f6d1bb85e8c1d7dc5dce92fd09 100644
> > --- a/tools/perf/Makefile.config
> > +++ b/tools/perf/Makefile.config
> > @@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
> >    endif
> >  
> >    # architectures that use the generic syscall table scripts
> > -  ifeq ($(SRCARCH),riscv)
> > +  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
> 
> This might work as well.
> 
>   ifneq ($(filter $(SRCARCH), riscv arc),)
> 
> And maybe you can add a variable for supported archs.

Yeah I can do that. All of this is just temporary though. The final
patch removes all of this, since this series implements this for every
architecture.

- Charlie

> 
> Thanks,
> Namhyung
> 
> 
> >      NO_SYSCALL_TABLE := 0
> >      CFLAGS += -DGENERIC_SYSCALL_TABLE
> >      CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index f5278ed9f778f928436693a14e016c5c3c5171c1..3b463b42b0e3982e74056e672b2ee6adad5a3f0e 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@ -311,7 +311,7 @@ FEATURE_TESTS := all
> >  endif
> >  endif
> >  # architectures that use the generic syscall table
> > -ifeq ($(SRCARCH),riscv)
> > +ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
> >  include $(srctree)/tools/perf/scripts/Makefile.syscalls
> >  endif
> >  include Makefile.config
> > diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
> > --- /dev/null
> > +++ b/tools/perf/arch/arc/entry/syscalls/Kbuild
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +syscall-y += syscalls_32.h
> > diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..391d30ab7a831b72d2ed3f2e7966fdbf558a9ed7
> > --- /dev/null
> > +++ b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +syscall_abis_32 += arc time32 renameat stat64 rlimit
> > diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
> > --- /dev/null
> > +++ b/tools/perf/arch/arc/include/syscall_table.h
> > @@ -0,0 +1,2 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#include <asm/syscalls_32.h>
> > 
> > -- 
> > 2.34.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
