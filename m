Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632C0CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6Y+IFU67uzogUXHms+1CVDq2pRK+gCbQ21fs+oy6iM=; b=ehcT+IzemVmwL7
	ZzrTMan5kaptb7il5lbAyfXXk2M4oNbERBlLcdVNMvh7bvnDpFBk/FjKznxBb/Myap8ZeNJbBWUKn
	VMqZcTeKvi18b3TySFHH5slhTMKOZxNoYzypEAlNNEA6FimmIMD1kBz9riE5R5f+dm5i5n1o0KuUN
	fcL6+yUyPsN8+CY8a7y/6xAAkYrDz5Cydewn8aEY+a9nGJ/J5FIXb0czhNYva5xz7aQ66dTUPnnrV
	XdwjVJjnlPbKfbkgsEQup7WGSxdMG1wGwxVdvbSAjv+4bJSAWJwiblK/i9fZykeWfAqGCqlt3ypU2
	MdTnXS7VCv4bk8ZIbUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st7RV-00000002fHp-2zs6;
	Tue, 24 Sep 2024 15:27:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st7Qn-00000002fDG-2WX5
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 15:27:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so937295166b.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727191584; x=1727796384; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncpPQi0GfsQJ/MBJNfkrlPviJLNDUK8EobuIbw3pbzs=;
        b=UZdFIQLLLUI8H33SgvyngoIfOCiKN+IEQODiUKfpjB0VWtCHahLDrhyBwtjiXC0zAg
         SF3+4/bVXgV4pj4UYEwhxuW0Bov9Os8MXha0jGX4laJRUIm4qk1PYNsxNHnExrC/q6B9
         fkOX5f/SqFpl0HjWH3zMrlvy+fuSDAMMJ0+DKr1eoyMF7OyNwRMyekK5IWO+fV/Z3pAf
         Yt/M+cN8uugSs+aJ56L/XA/sst4f3F7P9eHbc/Mr3lAEmqjka+7Y+Hq3XNqjlKVdcRVE
         uuCxV0hXcCdE0wSOh2lTK6watTzdcJ5G8mp8VBSgwuSKVBJKcPnLpcUIB+C6bSm45sKI
         QU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727191584; x=1727796384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncpPQi0GfsQJ/MBJNfkrlPviJLNDUK8EobuIbw3pbzs=;
        b=Jo3mFqSe1LOIKJ0blExJCw5Ma1xQSS7RT2cl2KuICU2+aSYP8NqtvxQBv0CkYm6IX/
         6Teg69r2OtxQ1lYDcXbmE4IUJbLe8lDPz3pEbuxxXy+4dMXmObRbIgJJ+u4EgOdFXHSj
         HKvJHziEJ53AQPPfD+gIGHZnzC0ayU478OSPFPKSyU4SiTQVzz0AThzzEAy6m7Gs2uik
         Gkcz/IthQleBQjFYOxIbdpeEesP6T7/7r0sGy+14Cz0j8U8UB3o1khiWnaNt7A/T8ict
         P0cGBAXmC+Lu9isdv+ETab6uko9Z702cuEDdwdMkhriYUhXdiOoQspqlEOchtI6VmBRO
         gkdg==
X-Forwarded-Encrypted: i=1; AJvYcCWlNfOZkRlUREAj/zyby+neljOok9VwNwMFC4pEIwfVG1BDH9CwBp+iJ8q8w1SjHNpWtS8D3Eibrkq5IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTbhtHVZpBdQAXE18+MwNV2n3C9c4RS6sLhYpVDS8WxMBHQRto
	cCSLQPhIp4JqPPYn8mP9fwru3+6fhHxOWps0yqx+Vy3vL9rNiCnymknmPYsPYnk=
X-Google-Smtp-Source: AGHT+IF1xyHbX88bwTSe6sWCS7atLN8y4aZbve6DCWxrcqs48Q0A0D6t/d/gJw3jgD0Ngjf9HsPanQ==
X-Received: by 2002:a17:906:bc12:b0:a8f:f799:e7d1 with SMTP id a640c23a62f3a-a90d503430cmr1421808566b.38.1727191583676;
        Tue, 24 Sep 2024 08:26:23 -0700 (PDT)
Received: from ghost ([185.30.83.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930f0ba1sm97280966b.143.2024.09.24.08.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 08:26:22 -0700 (PDT)
Date: Tue, 24 Sep 2024 17:26:19 +0200
From: Charlie Jenkins <charlie@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Howard Chu <howardchu95@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf syscalltbl: Add syscalltbl__id_at_idx() with no
 syscall table support
Message-ID: <ZvLaGy7jRa9Q/5fQ@ghost>
References: <20240830-perf_syscalltbl_fix-v1-1-e2ff61ee5e8e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830-perf_syscalltbl_fix-v1-1-e2ff61ee5e8e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_082625_670131_11A13237 
X-CRM114-Status: GOOD (  29.94  )
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

On Fri, Aug 30, 2024 at 09:30:50PM -0700, Charlie Jenkins wrote:
> When HAVE_SYSCALL_TABLE_SUPPORT is not defined, neither is
> syscalltbl__id_at_idx(). However, this function is expected to be
> defined when HAVE_BPF_SKEL is defined.
> 
> Return -1 from syscalltbl__id_at_idx() to match the other functions when
> HAVE_SYSCALL_TABLE_SUPPORT is not defined.
> 
> Without this, compiling perf on riscv when libtraceevents, libelf, and
> clang are available will cause the functions trying to call
> syscalltbl__id_at_idx() to be compiled. This results in the following
> error:
> 
> /usr/bin/ld: perf-in.o: in function `.L0 ':
> builtin-trace.c:(.text+0x60b14): undefined reference to `syscalltbl__id_at_idx'
> /usr/bin/ld: builtin-trace.c:(.text+0x60c6c): undefined reference to `syscalltbl__id_at_idx'
> /usr/bin/ld: perf-in.o: in function `.L2564':
> builtin-trace.c:(.text+0x60cb6): undefined reference to `syscalltbl__id_at_idx'
> collect2: error: ld returned 1 exit status
> make[2]: *** [Makefile.perf:793: perf] Error 1
> make[1]: *** [Makefile.perf:290: sub-make] Error 2
> make: *** [Makefile:70: all] Error 2
> make: Leaving directory '/src/linux-6.11-rc5/tools/perf'
> 
> This patch resolves this issue for all architectures which do not define
> HAVE_SYSCALL_TABLE_SUPPORT.
> 
> $ ./perf trace -e syscalls:sys_enter_mmap --max-events=1 ls
> 0.000 ls/287 syscalls:sys_enter_mmap(__syscall_nr: 222, len: 9939, prot: READ, flags: PRIVATE, fd: 3)
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reported-by: David Abdurachmanov <davidlt@rivosinc.com>
> Suggested-by: David Abdurachmanov <davidlt@rivosinc.com>
> Fixes: 7a2fb5619cc1 ("perf trace: Fix iteration of syscall ids in syscalltbl->entries")
> ---
>  tools/perf/util/syscalltbl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
> index 0dd26b991b3f..12654460428f 100644
> --- a/tools/perf/util/syscalltbl.c
> +++ b/tools/perf/util/syscalltbl.c
> @@ -188,4 +188,9 @@ int syscalltbl__strglobmatch_first(struct syscalltbl *tbl, const char *syscall_g
>  {
>  	return syscalltbl__strglobmatch_next(tbl, syscall_glob, idx);
>  }
> +
> +int syscalltbl__id_at_idx(struct syscalltbl *tbl __always_unused, int idx __always_unused)
> +{
> +	return -1;
> +}
>  #endif /* HAVE_SYSCALL_TABLE_SUPPORT */
> 
> ---
> base-commit: 985bf40edf4343dcb04c33f58b40b4a85c1776d4
> change-id: 20240830-perf_syscalltbl_fix-4f586221795e
> -- 
> - Charlie
> 

Can this please be picked up? Compilation on riscv (along with any of
the other architectures that don't have syscall table support) is
broken. The long term solution is to add support for the syscall table
on riscv. I will send out a patch for that, but in the meantime it would
be great to have this in the tree.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
