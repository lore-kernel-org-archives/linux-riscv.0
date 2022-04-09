Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CF4C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5K0m1dRpXTLvXK6nYn6U/D5NbdUKThgY+QhkoOCCz1k=; b=fNmwQdp5ae/Rau
	52rdGFqxjuLsnNaXTjzdDj+yJ+RaNp/HiVV7FpDG7XO9Jv1RDaFr9XUXknSUX3GVZjEVaQcq+gC7N
	3fuwqSWsVYYjrFVl98voJg16qmQ6ZJj05IL1Xr0t/JGhQHQv3CI4CWMiSrwpwBCla855G5rrO/Icy
	Uziml/JXJGwVzRfunCcBxRf7hTwwshJF5E0fBPYWONrihhKo4v1ml7C2Y1kXrlK3rTYWAq5WHn2E9
	FLDD6WklwGcBH17bBPz/Jg0oyZtE9thCao39R2NPyJ6IH/j29Wqo1+B8ipSyioOBnrXIXhbqKcDmk
	XWpoGxdrin1CmgRvF5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndCeU-003NC7-Dl; Sat, 09 Apr 2022 15:05:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndCeS-003NC0-Lw
 for linux-riscv@bombadil.infradead.org; Sat, 09 Apr 2022 15:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K7I8BLnu8JaHPkxkPr4XcaB8lkI0SHISyIA/TfuAzIQ=; b=BYdgvH6uP1FY/QIi4iS+lTqXi5
 1gLNEHq/UOLfyAinKplyh+e3mOgjnpaaq84S3dI880FsXxIApqtConci2bL/ABUKpG02ShexLzilC
 MfiLPKYrBucuhjpZzvhE1QUD+rKGMqOc90kF3gV25CPT2WSYdv1upWLAXXHngKdWL/Dau6r3ACSz5
 7b43bGomHjt4QrrQhDx75VF4YACaMEN23fHcB+EZdLDAOmegIO14MIkZ/qE17AjVjSTE60O4mzaD/
 4RGbP2hVsVZOBGiiABpaXXKsJGiBa0o2CbPzfqRkIzZ+jPhX+7fB053uxZ6IVmXSQ1rCgoT/VYPIJ
 CSaoXo3w==;
Received: from [187.19.239.165] (helo=quaco.ghostprotocols.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndCeQ-00Am1L-V2; Sat, 09 Apr 2022 15:05:23 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id CA50D40407; Sat,  9 Apr 2022 12:05:18 -0300 (-03)
Date: Sat, 9 Apr 2022 12:05:18 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 iii@linux.ibm.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH 1/1] perf jitdump: Add riscv64 support.
Message-ID: <YlGgro3TupbOEnJC@kernel.org>
References: <20220406142606.18464-1-eric.lin@sifive.com>
 <20220406142606.18464-2-eric.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406142606.18464-2-eric.lin@sifive.com>
X-Url: http://acmel.wordpress.com
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

Em Wed, Apr 06, 2022 at 10:26:06PM +0800, Eric Lin escreveu:
> Signed-off-by: Eric Lin <eric.lin@sifive.com>

Can you plese provide some series of commands demonstrating the usage of
this functionality on riscv?

A dump, for instance.

- Arnaldo

> ---
>  tools/perf/arch/riscv/Makefile | 1 +
>  tools/perf/util/genelf.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
> index 1aa9dd772489..a8d25d005207 100644
> --- a/tools/perf/arch/riscv/Makefile
> +++ b/tools/perf/arch/riscv/Makefile
> @@ -2,3 +2,4 @@ ifndef NO_DWARF
>  PERF_HAVE_DWARF_REGS := 1
>  endif
>  PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
> +PERF_HAVE_JITDUMP := 1
> diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
> index 3db3293213a9..ae138afe6c56 100644
> --- a/tools/perf/util/genelf.h
> +++ b/tools/perf/util/genelf.h
> @@ -38,6 +38,9 @@ int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_ent
>  #elif defined(__s390x__)
>  #define GEN_ELF_ARCH	EM_S390
>  #define GEN_ELF_CLASS	ELFCLASS64
> +#elif defined(__riscv) && __riscv_xlen == 64
> +#define GEN_ELF_ARCH	EM_RISCV
> +#define GEN_ELF_CLASS	ELFCLASS64
>  #else
>  #error "unsupported architecture"
>  #endif
> -- 
> 2.35.1

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
