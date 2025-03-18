Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B89C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wdl/zCBRJdm/0R3YmfvWKIiZiA4XMN2pYBh4pXQt++0=; b=FPYb6t1PcF7IWs
	C0FWa9gpk/ERlVg0aMhZr2HxxUY0ehJNqm4MybPogU1PYPYB0sLQwgPOvgVuEelYqqJ3DJOZGEPle
	y7cDhhQZ4FNF8Ua1EFG3AXV4VQh5bm7aGkkYBwZtJ67dUILXkC9Afp+rymlzdm2Q/B30UqpWo9Amg
	1ekez8V6ph6NPGFPvtpL+LsH2s3TXoMnPb65TiOs9WkDUAn8u+EHFDlz7+FmouL0Jr8ETXPyDjf//
	AzPbJPuB/+rdVoeqU59RUeUOrXBwOjRyXC5AFc+OOZK2bF7f620p3VBoL+jiw1OJg/4vmTS/wR51I
	dqfEuDBuH+s5Vkvl9NHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tucGQ-00000006slV-3Yej;
	Tue, 18 Mar 2025 19:06:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucEi-00000006sY0-2nsN;
	Tue, 18 Mar 2025 19:04:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DAEA5C588D;
	Tue, 18 Mar 2025 19:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9514CC4CEDD;
	Tue, 18 Mar 2025 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742324663;
	bh=q8oOp41cHl33YfGvOaDk6/xbHYWsX2yx6+8wUa0yDHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEJkeNyn8a4ZrsAPb8DRhFNwI2U050JwzDRxBsfpmEsMpvv9kTob/NUbhpWIIugn5
	 4cpDRdE+pN1pJ0QvBuA3rlcH/Qzak7OZmUVOQ5BJcb1p1n5t8NKwnY8YseJ93ATUyY
	 YyUqD3Np3LvcrBf+IlDFQB90KXtymd4mnuXx1vS56gFlTS+M2KoOS09izWC03RpDVq
	 x6MNaW+CiHXW5tYTHhFn+hC0XYyo//h7PKFixoeb0hJOK2BGF0WNebgpWo5u1gN2VQ
	 LABMVs/ujFoE9y9A57vJnVsPaa+W/SSmd4GIumkSbtXvoLjYoZOZvE736hJPm49vd7
	 vs3CB19du7HEw==
Date: Tue, 18 Mar 2025 16:04:20 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 13/13] perf trace: Fix BTF memory leak
Message-ID: <Z9nDtMyoARGiHAGg@x1>
References: <20250318033150.119174-1-irogers@google.com>
 <20250318033150.119174-14-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318033150.119174-14-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_120424_750180_E20A4ACD 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Mar 17, 2025 at 08:31:50PM -0700, Ian Rogers wrote:
> Add missing btf__free in trace__exit.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-trace.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> index a5f31472980b..d4bbb6a1e817 100644
> --- a/tools/perf/builtin-trace.c
> +++ b/tools/perf/builtin-trace.c
> @@ -5339,6 +5339,12 @@ static void trace__exit(struct trace *trace)
>  		zfree(&trace->syscalls.table);
>  	}
>  	zfree(&trace->perfconfig_events);
> +#ifdef HAVE_LIBBPF_SUPPORT
> +	if (trace->btf != NULL) {

No need for the check, btf__free() does:

void btf__free(struct btf *btf)
{
        if (IS_ERR_OR_NULL(btf))
                return;

Up to Namhyung to turn this into the simpler:

	btf__free(trace->btf);
	trace->btf = NULL;

> +		btf__free(trace->btf);
> +		trace->btf = NULL;
> +	}
> +#endif
>  }
>  
>  #ifdef HAVE_BPF_SKEL
> -- 
> 2.49.0.rc1.451.g8f38331e32-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
