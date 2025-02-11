Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596CEC02198
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 00:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8D0GdCvYk8rKYYaHdpx0MO+bXklQtUhSDOPkaWR/dk=; b=UZW+Fxv+wlpTAH
	y8kerra0ciAKRZ5o/qDLQylgaVWLK0QQ3nJgeYxuk5tGL7SQZI2YUepHzHYlQdDprPAlJx+P0wVzg
	sYeSH5ka5DFxbZ6eN0zZTWgQfQmMj9OEUMVWRkbboQIydrHE079XhcBRossXkm79mpbQSPbsUsvAS
	9IxDEfSKS12udTX+H1AU/2RbUndxeP3Ok32Z69504iS6WW+J2kRTESwEBNGI5iyDnGmCN7N9YdxC0
	76NrzYy3deI6D83GlZaaNfPLAeevu/BWEa9derV58zs5K98JVtOoz4wfIEr96lBWZkwVorh2GqAnz
	kZ8Sld6Rc98lrQ9XU6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1the2j-00000001xrt-29eN;
	Tue, 11 Feb 2025 00:22:25 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1the18-00000001xjY-3Efk
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 00:20:47 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6f9e95c66fdso14911727b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 16:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739233246; x=1739838046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6fO6ENk+/6RJwbHFhohh2LYSGPeGtLq21Tc4JEEd0s=;
        b=fIoe9fHCTLWfrM0xUcqvmKUP8vg1t2djK9midnw40fyVyEgm04PBGz8nHZnBdTgHL/
         awHepvzoPug7xZuidM8VdHC6bJQX1btIw4A80LAWg8B7YDzTEg39MbbDlhUAnGJJL5N0
         +GR7tVI59urLLpwPSOT7DRoRiKoQiYBYqYPKiE3X/t+OXsAPe796UhkW6AlBqA0cSvmh
         Fc5gX0BHwJqjDTysVvGP84rmcGxvAAQ2MZZrMMrTSZIGyAgFfw6yC/8vv7jLWOkUqdju
         Gx0H3AF4SNIswjodbGntJ7xU5ML0HqKs1rpA0tVbkb4JyTKamV7PPFgQUzG001f8sbgb
         QZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739233246; x=1739838046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6fO6ENk+/6RJwbHFhohh2LYSGPeGtLq21Tc4JEEd0s=;
        b=OZLo5qeJg6dVyxLqYojOCB2wozDniAvrj/2xlXIkYHmKeYCkJIZ+E7z+Agg8dkBp+2
         f8cc2nCt2DHbc6NHVuwDeflptfYBz3Ng479naQAmmIZn/r/u/aI6sUvYz9zOj6iHvv0i
         rXjuZR4/hUIxSRogj+mtTNZ3Yz6gyzm4cKe+tVU9Krgt2VTqRtwKm8gkprukWj5ntbc2
         LjqUUFThKrhSKniQGOwbi5NsyPF6KhBTdOPbKBQ3bSZdZxEU1XRcB779s1GR+FTEsQRk
         u8GKU67mqsdp4/LpFryh9eK1fO9VXOcpU0YnuhdeifRJeIpGYco5j6nlbp0L7mFKLIjq
         dc+A==
X-Forwarded-Encrypted: i=1; AJvYcCWdiZ/GmBkRUbVxjZxWtjClGAyfS7jxJHVaFsPP5yOovppWNwUkt9Cd/nzU2VyF7O6K1OXPK5ApdVBuiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg/93zy2X+6nZpWqajgAIYDkVYyN08dGweeLERXiU/mqU2j0nL
	mcbvnEJDSDMXWDVGlAt5Jn97AnSVbrwzAJDdPR9LV7QCUuTso/Ah9jfXaVspxG8=
X-Gm-Gg: ASbGncvlqvCifslQw/M6gnBYPK1I7TmmNrSxugIZIP2lBZMWMLS+Re18hNXJrysBJS2
	AIkT8VFdP0bte+EB9zlLzrT941gMICYA+QWYsvNgdes7X0UzDQVFsQ46iYtMuM2UX1Eqn0eKOKD
	h/sVIgqM7Dk/l3/TgT7FcreGH4Maf4Hw4ua9QH4OKjjTFX5PfNmoFB82/1IudaDbS+phBqAqV9X
	pEUDLh5iCC9MTduOOXLd1WpNcEurGbEo0gZR64fiAXj8i+g+PFmBKuht9ubZ3CF+bsY8SbuyhQa
	jS8=
X-Google-Smtp-Source: AGHT+IEgCF8HyG8asrx19RO4/BfI2121j03BDe3RR1UsBBXC3q3qfBJKowis2DMzSxDhdyfGfdvrSA==
X-Received: by 2002:a05:690c:4b8f:b0:6f9:4f93:c805 with SMTP id 00721157ae682-6f9b287bafamr146119417b3.21.1739233245476;
        Mon, 10 Feb 2025 16:20:45 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a903sm18915387b3.84.2025.02.10.16.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:20:44 -0800 (PST)
Date: Mon, 10 Feb 2025 16:20:42 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/7] perf thread: Add support for reading the
 e_machine type for a thread
Message-ID: <Z6qX2gUQpdSkG253@ghost>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-5-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210165108.95894-5-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_162046_878305_11CC1213 
X-CRM114-Status: GOOD (  30.28  )
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

On Mon, Feb 10, 2025 at 08:51:05AM -0800, Ian Rogers wrote:
> Use the executable from /proc/pid/exe and read the e_machine from the
> ELF header. On failure use EM_HOST. Change builtin-trace syscall
> functions to pass e_machine from the thread rather than EM_HOST, so
> that in later patches when syscalltbl can use the e_machine the system
> calls are specific to the architecture.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>
> ---
>  tools/perf/builtin-trace.c | 41 ++++++++++++++++---------------
>  tools/perf/util/thread.c   | 50 ++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/thread.h   | 14 ++++++++++-
>  3 files changed, 85 insertions(+), 20 deletions(-)
> 
> diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> index 4b77c2ab3dba..1ae609555018 100644
> --- a/tools/perf/builtin-trace.c
> +++ b/tools/perf/builtin-trace.c
> @@ -2678,16 +2678,17 @@ static int trace__sys_enter(struct trace *trace, struct evsel *evsel,
>  	int printed = 0;
>  	struct thread *thread;
>  	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1;
> -	int augmented_args_size = 0;
> +	int augmented_args_size = 0, e_machine;
>  	void *augmented_args = NULL;
>  	/* TODO: get e_machine from thread. */
> -	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
> +	struct syscall *sc;
>  	struct thread_trace *ttrace;
>  
> -	if (sc == NULL)
> -		return -1;
> -
>  	thread = machine__findnew_thread(trace->host, sample->pid, sample->tid);
> +	e_machine = thread__e_machine(thread, trace->host);
> +	sc = trace__syscall_info(trace, evsel, e_machine, id);
> +	if (sc == NULL)
> +		goto out_put;
>  	ttrace = thread__trace(thread, trace->output);
>  	if (ttrace == NULL)
>  		goto out_put;
> @@ -2756,16 +2757,18 @@ static int trace__fprintf_sys_enter(struct trace *trace, struct evsel *evsel,
>  	struct thread *thread;
>  	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1;
>  	/* TODO: get e_machine from thread. */
> -	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
> +	struct syscall *sc;
>  	char msg[1024];
>  	void *args, *augmented_args = NULL;
> -	int augmented_args_size;
> +	int augmented_args_size, e_machine;
>  	size_t printed = 0;
>  
> -	if (sc == NULL)
> -		return -1;
>  
>  	thread = machine__findnew_thread(trace->host, sample->pid, sample->tid);
> +	e_machine = thread__e_machine(thread, trace->host);
> +	sc = trace__syscall_info(trace, evsel, e_machine, id);
> +	if (sc == NULL)
> +		return -1;
>  	ttrace = thread__trace(thread, trace->output);
>  	/*
>  	 * We need to get ttrace just to make sure it is there when syscall__scnprintf_args()
> @@ -2830,15 +2833,15 @@ static int trace__sys_exit(struct trace *trace, struct evsel *evsel,
>  	bool duration_calculated = false;
>  	struct thread *thread;
>  	int id = perf_evsel__sc_tp_uint(evsel, id, sample), err = -1, callchain_ret = 0, printed = 0;
> -	int alignment = trace->args_alignment;
> -	/* TODO: get e_machine from thread. */
> -	struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
> +	int alignment = trace->args_alignment, e_machine;
> +	struct syscall *sc;
>  	struct thread_trace *ttrace;
>  
> -	if (sc == NULL)
> -		return -1;
> -
>  	thread = machine__findnew_thread(trace->host, sample->pid, sample->tid);
> +	e_machine = thread__e_machine(thread, trace->host);
> +	sc = trace__syscall_info(trace, evsel, e_machine, id);
> +	if (sc == NULL)
> +		goto out_put;
>  	ttrace = thread__trace(thread, trace->output);
>  	if (ttrace == NULL)
>  		goto out_put;
> @@ -3185,8 +3188,8 @@ static int trace__event_handler(struct trace *trace, struct evsel *evsel,
>  
>  	if (evsel == trace->syscalls.events.bpf_output) {
>  		int id = perf_evsel__sc_tp_uint(evsel, id, sample);
> -		/* TODO: get e_machine from thread. */
> -		struct syscall *sc = trace__syscall_info(trace, evsel, EM_HOST, id);
> +		int e_machine = thread ? thread__e_machine(thread, trace->host) : EM_HOST;
> +		struct syscall *sc = trace__syscall_info(trace, evsel, e_machine, id);
>  
>  		if (sc) {
>  			fprintf(trace->output, "%s(", sc->name);
> @@ -4764,6 +4767,7 @@ static size_t trace__fprintf_thread(FILE *fp, struct thread *thread, struct trac
>  {
>  	size_t printed = 0;
>  	struct thread_trace *ttrace = thread__priv(thread);
> +	int e_machine = thread__e_machine(thread, trace->host);
>  	double ratio;
>  
>  	if (ttrace == NULL)
> @@ -4783,8 +4787,7 @@ static size_t trace__fprintf_thread(FILE *fp, struct thread *thread, struct trac
>  	else if (fputc('\n', fp) != EOF)
>  		++printed;
>  
> -	/* TODO: get e_machine from thread. */
> -	printed += thread__dump_stats(ttrace, trace, EM_HOST, fp);
> +	printed += thread__dump_stats(ttrace, trace, e_machine, fp);
>  
>  	return printed;
>  }
> diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
> index 0ffdd52d86d7..a07446a280ed 100644
> --- a/tools/perf/util/thread.c
> +++ b/tools/perf/util/thread.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <elf.h>
>  #include <errno.h>
> +#include <fcntl.h>
>  #include <stdlib.h>
>  #include <stdio.h>
>  #include <string.h>
> @@ -16,6 +18,7 @@
>  #include "symbol.h"
>  #include "unwind.h"
>  #include "callchain.h"
> +#include "dwarf-regs.h"
>  
>  #include <api/fs/fs.h>
>  
> @@ -51,6 +54,7 @@ struct thread *thread__new(pid_t pid, pid_t tid)
>  		thread__set_ppid(thread, -1);
>  		thread__set_cpu(thread, -1);
>  		thread__set_guest_cpu(thread, -1);
> +		thread__set_e_machine(thread, EM_NONE);
>  		thread__set_lbr_stitch_enable(thread, false);
>  		INIT_LIST_HEAD(thread__namespaces_list(thread));
>  		INIT_LIST_HEAD(thread__comm_list(thread));
> @@ -423,6 +427,52 @@ void thread__find_cpumode_addr_location(struct thread *thread, u64 addr,
>  	}
>  }
>  
> +static uint16_t read_proc_e_machine_for_pid(pid_t pid)
> +{
> +	char path[6 /* "/proc/" */ + 11 /* max length of pid */ + 5 /* "/exe\0" */];
> +	int fd;
> +	uint16_t e_machine = EM_NONE;
> +
> +	snprintf(path, sizeof(path), "/proc/%d/exe", pid);
> +	fd = open(path, O_RDONLY);
> +	if (fd >= 0) {
> +		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
> +		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
> +		if (pread(fd, &e_machine, sizeof(e_machine), 18) != sizeof(e_machine))
> +			e_machine = EM_NONE;
> +		close(fd);
> +	}
> +	return e_machine;
> +}
> +
> +uint16_t thread__e_machine(struct thread *thread, struct machine *machine)
> +{
> +	pid_t tid, pid;
> +	uint16_t e_machine = RC_CHK_ACCESS(thread)->e_machine;
> +
> +	if (e_machine != EM_NONE)
> +		return e_machine;
> +
> +	tid = thread__tid(thread);
> +	pid = thread__pid(thread);
> +	if (pid != tid) {
> +		struct thread *parent = machine__findnew_thread(machine, pid, pid);
> +
> +		if (parent) {
> +			e_machine = thread__e_machine(parent, machine);
> +			thread__set_e_machine(thread, e_machine);
> +			return e_machine;
> +		}
> +		/* Something went wrong, fallback. */
> +	}
> +	e_machine = read_proc_e_machine_for_pid(pid);
> +	if (e_machine != EM_NONE)
> +		thread__set_e_machine(thread, e_machine);
> +	else
> +		e_machine = EM_HOST;
> +	return e_machine;
> +}
> +
>  struct thread *thread__main_thread(struct machine *machine, struct thread *thread)
>  {
>  	if (thread__pid(thread) == thread__tid(thread))
> diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
> index 6cbf6eb2812e..cd574a896418 100644
> --- a/tools/perf/util/thread.h
> +++ b/tools/perf/util/thread.h
> @@ -60,7 +60,11 @@ DECLARE_RC_STRUCT(thread) {
>  	struct srccode_state	srccode_state;
>  	bool			filter;
>  	int			filter_entry_depth;
> -
> +	/**
> +	 * @e_machine: The ELF EM_* associated with the thread. EM_NONE if not
> +	 * computed.
> +	 */
> +	uint16_t		e_machine;
>  	/* LBR call stack stitch */
>  	bool			lbr_stitch_enable;
>  	struct lbr_stitch	*lbr_stitch;
> @@ -302,6 +306,14 @@ static inline void thread__set_filter_entry_depth(struct thread *thread, int dep
>  	RC_CHK_ACCESS(thread)->filter_entry_depth = depth;
>  }
>  
> +uint16_t thread__e_machine(struct thread *thread, struct machine *machine);
> +
> +static inline void thread__set_e_machine(struct thread *thread, uint16_t e_machine)
> +{
> +	RC_CHK_ACCESS(thread)->e_machine = e_machine;
> +}
> +
> +
>  static inline bool thread__lbr_stitch_enable(const struct thread *thread)
>  {
>  	return RC_CHK_ACCESS(thread)->lbr_stitch_enable;
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
