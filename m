Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2791D1BDFF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWL0c3BGOWOkfgENx3/GnAQeU8osQZ3YEgiQc2HKY9g=; b=3KzjSxB2cQf8Lc
	8nmRUv1JItvwyBJHNa+wY22k0IDRdFUEh8afDdJ1sjCz4Nkup8MLfVs6vwOAqBTesEJTymj4T9vPA
	09dqfW6iSQPtrH6QLLQqVs7nH05N0Rua3kc8oxTX08+0xfb/E4TRozsWZTgdK+cdRCV71hgExuL5I
	GJAmCxJPGylVO1tvlOeV5cpi158gyRm3tUoW0ale9O0lgq6XepNZNH9KjIjYuNFvy111sE6Ni5uEA
	ytbyj7haNZ8nUA5AknO5zV8E3ppIfsnj+IMvSOntzo8klCb8MsI8j1ROkn9hnehO4wCI46snUQtzx
	vp2ysps8vVlBtXw32h8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84qM-0000000FCWx-06D8;
	Mon, 04 Nov 2024 21:42:38 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84h0-0000000FB2y-0JAB
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 21:32:59 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71ec997ad06so3855242b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 13:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730755977; x=1731360777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzIIL5jV51s8QxZDArUoUfDkcHu/NNqV1EZULNrSbms=;
        b=VvNTuHIniX0zk5sB28eq7jz4AkqmVBwQ7U191Hwg4SiXvzHhIKgDzX1SitfMjwu5p7
         AoeW95ao3nPMycrTSc71MhSAR22DmCclaz3Lw8Ja3BbELVFqLetqNroHYXNGdUm/jtWf
         3eiX1Wso4xLiNbDB7fxiQUAPci4eVyG6IknR4ycWm5aDW+zbnbej04iko8XEq31A+shX
         +JrmqRlc/zPf0LMCJ5/u2FGtVDJKKTvyhH/m4149P2RfnmBZQ4to7WnM+NXDkZPGraiH
         SkA6GlNPfFGPoMWFC/EPiE1Y2nL4EARgr9BU6f1DMA5UVwBzCESgIuQa/RlPdi8fjNnX
         rSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730755977; x=1731360777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzIIL5jV51s8QxZDArUoUfDkcHu/NNqV1EZULNrSbms=;
        b=hWf8PhJaS2246L9MYmjwIgXrxUr3AB8q5nz/HRUxZO/LxFegzaAbPBGfVCa5uSm3v7
         gmWYISy0sjeLC7x1RAEBxUvne4MzobrTRlVFTMLj+pXsD06sxUJYVKi1lRlPuucHOzno
         LZLjblH9cH2fn4DMY3nAS5narfisKYfgfBejVl8bzdSpP4eKxcyJH8vBT+sJSIXP80Zc
         XBl8RnQ3kqG6PNh0IDrmo+ukU89cAn/OROyRPCPDEECsZK0WJQ/2gv0Y0qnAAO2i6WQ2
         FAb8qjn93KIiwlfNxJJB66ILCXIwy0T6Tt/lQPD70RPvWya3FLKn3qhhKLkTRwLLK5Ky
         OV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw4zYy8DpcCXOE378QYIiQrpC0ZxZuQt6T7vDrx6a457jooJX0ui7mEJQLZ1sdomLp6TWBvZ3AgBdw+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy98H9/d8U3rqENIGXD3c8UGH+ACuGDRTeXHdUUoWQpGZ0dAC9v
	g8tf9fONErEssA94fjveZrtmFNy9peA8nafYRTAvGoyj6Iwt9LSEWgbPj9XcePc=
X-Google-Smtp-Source: AGHT+IE1gCnZHDhbNSzOxIsLAwqp2zm4KQPfqsRjT/TyxizeRL+Gzx/ZXVxE+GJ5uzuO8nBhG5XzOQ==
X-Received: by 2002:a05:6a21:9993:b0:1db:d8df:8c4e with SMTP id adf61e73a8af0-1dbd8dfc276mr7417523637.12.1730755977373;
        Mon, 04 Nov 2024 13:32:57 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ef7d9sm8114469b3a.83.2024.11.04.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:32:56 -0800 (PST)
Date: Mon, 4 Nov 2024 13:32:53 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for
 all archs
Message-ID: <Zyk9hX8CB_2rbWsi@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_133258_135726_BEB064FB 
X-CRM114-Status: GOOD (  26.44  )
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

On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > Standardize the generation of syscall headers around syscall tables.
> > Previously each architecture independently selected how syscall headers
> > would be generated, or would not define a way and fallback onto
> > libaudit. Convert all architectures to use a standard syscall header
> > generation script and allow each architecture to override the syscall
> > table to use if they do not use the generic table.
> >
> > As a result of these changes, no architecture will require libaudit, and
> > so the fallback case of using libaudit is removed by this series.
> >
> > Testing:
> >
> > I have tested that the syscall mappings of id to name generation works
> > as expected for every architecture, but I have only validated that perf
> > trace compiles and runs as expected on riscv, arm64, and x86_64.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> Thanks for doing this, I had plans to do this myself, but hadn't
> completed that bit so far. I'm travelling at the moment, so I'm
> not sure I have time to look at it in enough detail this week.
> 
> One problem I ran into doing this previously was the incompatible
> format of the tables for x86 and s390, which have conflicting
> interpretations of what the '-' character means. It's possible
> that this is only really relevant for the in-kernel table,
> not the version in tools.
> 

I don't think that is an issue for this usecase because the only
information that is taken from the syscall table is the number and the
name of the syscall. '-' doesn't appear in either of these columns! 

- Charlie

>      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
