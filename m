Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6AEC04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb6q1Gtix+Wim+YtjADoiDkLeYiVmCOZLPiTuuwkQdI=; b=dWyL9NDDgn+dQN
	Nz9ZS11TL8tfjKgFBK9+dlvyUmStfaLJwdJZ6Kdv3l93jBTwscLUvPpnsqN3E5kEHFZ4X2wF709ia
	W6RqOdKSXOSZm2SjiREqzSHIEPkkmHxmqqPIJPLXUYKc1HGK+Boya54Xu6VoH5UjBxQ1AzzuKMRwH
	iezaURue8Q1MNh1BQ+vwpnUHJxe/4n6eXdMkzuTDUmNEP3QzClSPhknQU/HmC1Klw00FmsBkA0Io9
	Q8nrvZLtzikc5hG/XCRQcx+/3AKiQloPBe9oEVjID8mzu1dtdG3EHqsS7SGlK6jxmBx23EQ9JMvYT
	5/N3Xg5+/PqGLxYTFLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5p2b-00000008DE5-3Zlf;
	Sat, 11 May 2024 15:53:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5p2Y-00000008DDF-3Wcx
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 15:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 968B161212;
	Sat, 11 May 2024 15:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8383C2BBFC;
	Sat, 11 May 2024 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715442817;
	bh=UR/VsrTdMlyPZLDRdN7JoKoF84p0t4BrgH/b0Ff6W2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQCZRjOZEGrkz9vpUCJPTojbzl2lxjt3/1yPe4s419rz7erkQfnjOb+5Mk7dBt+BQ
	 yc8kWmhgweFPZSndKM1HaL2K5qb3k8auRovB4ur9FzNtq9vEpi4IC3DhlHmPxwWKYB
	 MkcBJqT3Fa6e+qEQZoRioGlb+9zBsrIuLTZZEHannVyqRGqeehjkooBG5AFKoqltAm
	 00V4TqA+0UIdmLI3DU2cGE4xURNR16/yIC9q5Zii0eJ5aOQHHZpbId9B+ckSUSIWev
	 afvdTd9xUo3/3q277A3TTchmoAjrmMCuOc9SoV9Kt4WznOkxJWJGEIGP351xosm+Ce
	 3/BqRQyJqPwTg==
Date: Sat, 11 May 2024 12:53:34 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH 0/7] perf vendor events riscv: Update SiFive CPU PMU
 events
Message-ID: <Zj-UfsmiG3GU4S88@x1>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_085338_993423_9BAFFC1B 
X-CRM114-Status: GOOD (  13.14  )
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

On Wed, May 08, 2024 at 07:14:53PM -0700, Samuel Holland wrote:
> This series updates the PMU event JSON files to add support for newer
> SiFive CPUs, including those used in the upcoming HiFive Premier P550
> board. Since most changes are incremental, symbolic links are used when
> a set of events is unchanged from the previous CPU series.

Ian, are you ok with this? Someone with such systems can provide some
Tested-by?

- Arnaldo
 
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
> 2.44.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
