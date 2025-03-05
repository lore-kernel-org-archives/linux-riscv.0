Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C625C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=locVWrrJtFMga85qJJxuvCSU83PkNBGBTEk7a2qM+Xo=; b=MJoFXC80Be8jjj
	XKWVXt0KF/7JDb76VX0Ve/M68u16kgWNet6HVhPUSXe6Hzx2xP3oV4WNfKnEDo1R3/1aqFjOmXz+v
	rJbLnF09nEuHcypfzmOCHgIIkq9ZtVpPvG8qwWWIf5a7QZOGnRc1osqd6jnU0/LyT6tc23WR9yzS6
	W3Cdi44cmLhZQ1YFQ/A1QVgBdBKT3ptyTMWpiNATFWnDIGVTZtTY2oliR51tObqDEHG+gt0ikdWXS
	Azh79Wq3SZS5KMd05FAHqEDlPC/6y/2W5vRosTf7CLunFc5/w4plvfmIyWsdludC7lLJ98xiLwgrj
	oyVUC0bvk6RjpzFjAFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvCY-00000009C1J-1wh8;
	Wed, 05 Mar 2025 20:18:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsvU-00000008qWb-0IUd;
	Wed, 05 Mar 2025 17:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE7785C6BB8;
	Wed,  5 Mar 2025 17:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F10DC4CEE2;
	Wed,  5 Mar 2025 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741197179;
	bh=hE0MFGTk7bcOjMBBN//SQY7SQOQlJ98ye1JVJhEBqyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgLq2Qph/XKnO0vPpE1w+YDPzp+TATFzB/KsCjnTv8bJ7JXTedWgOJQm8tzJLxZgZ
	 RzNeV1nI8Xc2+E/Er4K/hySns3z7+C89eKgfHDUr6QtPU0P5y01Ba1RBAst0pm+6qU
	 mFLXKWzxQEy+Po+4p5IUUfdcPnLlJzrVxqdys88Y/3XRAXIVMDX1fqHm7z0wq3oLAc
	 ji7wVU7OS1ax1G4HnyeM+cI3XG7HBzv9GYCm3VeVF9Nm+ebYUvekUKf7JnvtVEU2qa
	 DZIqOuEuwea+hBvlg7PkrLq3C9fyIilBiwD1tjINhk+UTQelj1WFnTKgjWxTm/3790
	 lFk35gC77gIuA==
Date: Wed, 5 Mar 2025 14:52:56 -0300
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
Subject: Re: [PATCH v4 01/11] perf dso: Move libunwind dso_data variables
 into ifdef
Message-ID: <Z8iPeEbldTUqotsQ@x1>
References: <20250304050305.901167-1-irogers@google.com>
 <20250304050305.901167-2-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304050305.901167-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095300_150197_EFBB5F7D 
X-CRM114-Status: GOOD (  14.68  )
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

On Mon, Mar 03, 2025 at 09:02:55PM -0800, Ian Rogers wrote:
> The variables elf_base_addr, debug_frame_offset, eh_frame_hdr_addr and
> eh_frame_hdr_offset are only accessed in unwind-libunwind-local.c
> which is conditionally built on having libunwind support. Make the
> variables conditional on libunwind support too.

Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/dso.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index bb8e8f444054..dfd763a0bd9d 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -154,10 +154,12 @@ struct dso_data {
>  	int		 status;
>  	u32		 status_seen;
>  	u64		 file_size;
> +#ifdef HAVE_LIBUNWIND_SUPPORT
>  	u64		 elf_base_addr;
>  	u64		 debug_frame_offset;
>  	u64		 eh_frame_hdr_addr;
>  	u64		 eh_frame_hdr_offset;
> +#endif
>  };
>  
>  struct dso_bpf_prog {
> -- 
> 2.48.1.711.g2feabab25a-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
