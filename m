Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F42CC3601E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wdl2txP1hJjEjIZtsIUPu+1vUwII1KwIfofhzwC2VLI=; b=qrhRRdYULS+edY
	ouk3mMIaxq9EvTiAtFjnyBGcWHTowE47KiUk6gDfVel1OFiFNkQG7DqNW2K3fMrGJ0FyJDhpd8e95
	Vw0hJxHOfyg2DXvvvyIZhV8LDXTHiAp1GCF0fhl8FH6oealwGyAZNsuy1TNiBFYeLt1i5046P6ja9
	+TB7vM3nFD4TFQpTZ1Of7d6NlhgReLrA9GkNnGHalbx6oqCicy1WlWcIIcel/GHjxuWc2JYg+U0Vd
	5j5C22mREtIo+eBXqkwxYv23KnT27shVb0masy7DGFwbShqbUqG6whTOUh0fmgd7GZv0iGekwFlqt
	nWNKM0HG9imbircxvAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32gC-0000000CB04-0UBo;
	Fri, 11 Apr 2025 00:55:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32eZ-0000000CAn5-3YEH
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 00:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBFB144F4D;
	Fri, 11 Apr 2025 00:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E2DC4CEDD;
	Fri, 11 Apr 2025 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744332833;
	bh=ohHhBlLmK53yYy+NEi9vJNeM2BRaT/ofomSIVkO2Q2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeCz7UVLSJznuAvAEcPJTNJ68f2jtaYwcpI5JoTkxv3uZW70TNCRQQrZoxZEJMp1x
	 4rJPiU0j3LePmjZb3oGB1LeLzBZXTxJhYkcQkyce+D/HasrYsn6nf3wwJIF2kGaZAB
	 11aqnxU6LIlYZFyXs/Z9CJ1Drtl1Q3lv8BnaQGwydd9Mihom7t2b8rbO8hd5YAKSPh
	 BkU2+8av0gCM/7cHF8qnZBuuTAoks46Ru/lxuQ6HFPvbrwgLzncm7Q64wwlXz1OKrU
	 Vd4akma9pUWj3hytPvIzPQ83dATKNx/fB91qAC7iBauonDN82qPQk+j6b7p7siR2JM
	 Z3G62zyIPGgpQ==
Date: Thu, 10 Apr 2025 17:53:51 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] perf symbols: Ignore mapping symbols on riscv
Message-ID: <Z_hoH0fu_NnEUUfe@google.com>
References: <20250409025202.201046-1-haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409025202.201046-1-haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_175355_911903_28DCC92F 
X-CRM114-Status: GOOD (  16.70  )
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

Hello,

On Wed, Apr 09, 2025 at 10:51:56AM +0800, Haibo Xu wrote:
> RISCV ELF use mapping symbols with special names $x, $d to
> identify regions of RISCV code or code with different ISAs[1].
> These symbols don't identify functions, so will confuse the
> perf output.
> 
> The patch filters out these symbols at load time, similar to
> "4886f2ca perf symbols: Ignore mapping symbols on aarch64".
> 
> [1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/
>     master/riscv-elf.adoc#mapping-symbol
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung


> ---
>  tools/perf/util/symbol-elf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index fbf6d0f73af9..55b1409b0593 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -1733,6 +1733,12 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
>  				continue;
>  		}
>  
> +		/* Reject RISCV ELF "mapping symbols" */
> +		if (ehdr.e_machine == EM_RISCV) {
> +			if (elf_name[0] == '$' && strchr("dx", elf_name[1]))
> +				continue;
> +		}
> +
>  		if (runtime_ss->opdsec && sym.st_shndx == runtime_ss->opdidx) {
>  			u32 offset = sym.st_value - syms_ss->opdshdr.sh_addr;
>  			u64 *opd = opddata->d_buf + offset;
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
