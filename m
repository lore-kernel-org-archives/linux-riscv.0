Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48570C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emtBpGCYdjgc32fIbiM7CkRMkaUNPxbqvDWRyGpRe8M=; b=wDBqbT0Q8StLrN
	uEL/K6qAIYVThkDoBiR1RDiRWGLhA1Y0SOX4irUJW5XH+7MroPCI9OHzqOXyXx8A22R5EKfR3tI26
	Ep3GqSZWYI6VUsbu1S/TQ/rrzLqtAyeq7G9ypbbRwJwLAvHiEDelxiJBI1n4wQL1QbHooUSuEJP2M
	4U5C1nVQVXeBFAcKIoGrN6t/0sFS92nw/IoME8fNWZLW7C3jyK8WiJ1qu7VXhRuXYsw678VplQzMl
	4HhkbbDXofXQX7a55+JbaI6QUB+PbIvJLIQF1SLpe6r4qJgY103Q86nCI5KAuFSq9t+26fyRNGQQt
	PrIfXLa7V88S0y8BY6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrbc-0000000FBnu-3Zju;
	Wed, 19 Feb 2025 21:27:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrUI-0000000F9uF-48AA
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 21:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EAE7611B5;
	Wed, 19 Feb 2025 21:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5653CC4CEDD;
	Wed, 19 Feb 2025 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740000009;
	bh=Z0rIEzHSNJzDYz0lpdKgc1HXdQuUbUWngzVqExCfsqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGSzxpemh8Udu9H28hUtPpbAS5D1OG7CZLOG08m1vN+KtIknrfHJkE0sfF2SJ7k0Y
	 CnIDA5SkHy+nJm2xQjVbiIXbMeUu8eOJXFTifq4hubnyKzsVAom2f9ZA9107HMMHYb
	 M4fljMwLPqmf+CV0phFLWgEsH+5xzoWUc51MiRs7QpN2Ugu5JFXi9LA60y3MHJQVxy
	 LAurVZhsuYPMjmHSlhZDNe7LXi4uGFHCflPsEoIABdgqtjE1miiTfYvxFvJmlCPbEK
	 Dum7nXv5EOCZ4rKrn9QEW1PLKH7GE+PtmVVTQVVPDJnNGnBAm9u9t5pW01H/67+0HG
	 /vQv2ClCRtHVA==
Date: Wed, 19 Feb 2025 13:20:07 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [RESEND PATCH 0/7] perf vendor events riscv: Update SiFive CPU
 PMU events
Message-ID: <Z7ZLB-wZY9wTZSBZ@google.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_132011_146731_11E3A456 
X-CRM114-Status: GOOD (  19.20  )
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

On Wed, Feb 12, 2025 at 05:21:33PM -0800, Samuel Holland wrote:
> This series updates the PMU event JSON files to add support for newer
> SiFive CPUs, including those used in the HiFive Premier P550 board.
> Since most changes are incremental, symbolic links are used when a set
> of events is unchanged from the previous CPU series.
> 
> I originally sent this series about a year ago[1], but received no
> feedback. The P550 board is now available (and I have tested this series
> on it), so it would be good to get perf support for it upstream.
> 
> [1]: https://lore.kernel.org/linux-perf-users/20240509021531.680920-1-samuel.holland@sifive.com/
> 
> 
> Eric Lin (5):
>   perf vendor events riscv: Update SiFive Bullet events
>   perf vendor events riscv: Add SiFive Bullet version 0x07 events
>   perf vendor events riscv: Add SiFive Bullet version 0x0d events
>   perf vendor events riscv: Add SiFive P550 events
>   perf vendor events riscv: Add SiFive P650 events
> 
> Samuel Holland (2):
>   perf vendor events riscv: Rename U74 to Bullet
>   perf vendor events riscv: Remove leading zeroes

It'd be nice if anyone in the RISC-V community can review this.

Thanks,
Namhyung

> 
>  tools/perf/pmu-events/arch/riscv/mapfile.csv  |  6 +-
>  .../cycle-and-instruction-count.json          | 12 +++
>  .../arch/riscv/sifive/bullet-07/firmware.json |  1 +
>  .../riscv/sifive/bullet-07/instruction.json   |  1 +
>  .../arch/riscv/sifive/bullet-07/memory.json   |  1 +
>  .../riscv/sifive/bullet-07/microarch.json     | 62 +++++++++++++
>  .../riscv/sifive/bullet-07/watchpoint.json    | 42 +++++++++
>  .../cycle-and-instruction-count.json          |  1 +
>  .../arch/riscv/sifive/bullet-0d/firmware.json |  1 +
>  .../riscv/sifive/bullet-0d/instruction.json   |  1 +
>  .../arch/riscv/sifive/bullet-0d/memory.json   |  1 +
>  .../riscv/sifive/bullet-0d/microarch.json     | 72 +++++++++++++++
>  .../riscv/sifive/bullet-0d/watchpoint.json    |  1 +
>  .../sifive/{u74 => bullet}/firmware.json      |  0
>  .../arch/riscv/sifive/bullet/instruction.json | 92 +++++++++++++++++++
>  .../arch/riscv/sifive/bullet/memory.json      | 32 +++++++
>  .../arch/riscv/sifive/bullet/microarch.json   | 57 ++++++++++++
>  .../arch/riscv/sifive/p550/firmware.json      |  1 +
>  .../arch/riscv/sifive/p550/instruction.json   |  1 +
>  .../arch/riscv/sifive/p550/memory.json        | 47 ++++++++++
>  .../arch/riscv/sifive/p550/microarch.json     |  1 +
>  .../p650/cycle-and-instruction-count.json     |  1 +
>  .../arch/riscv/sifive/p650/firmware.json      |  1 +
>  .../arch/riscv/sifive/p650/instruction.json   |  1 +
>  .../arch/riscv/sifive/p650/memory.json        | 57 ++++++++++++
>  .../arch/riscv/sifive/p650/microarch.json     | 62 +++++++++++++
>  .../arch/riscv/sifive/p650/watchpoint.json    |  1 +
>  .../arch/riscv/sifive/u74/instructions.json   | 92 -------------------
>  .../arch/riscv/sifive/u74/memory.json         | 32 -------
>  .../arch/riscv/sifive/u74/microarch.json      | 57 ------------
>  30 files changed, 555 insertions(+), 182 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/cycle-and-instruction-count.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/firmware.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/instruction.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/microarch.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-0d/watchpoint.json
>  rename tools/perf/pmu-events/arch/riscv/sifive/{u74 => bullet}/firmware.json (100%)
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/cycle-and-instruction-count.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/firmware.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/instruction.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p650/microarch.json
>  create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p650/watchpoint.json
>  delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
>  delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json
>  delete mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json
> 
> -- 
> 2.47.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
