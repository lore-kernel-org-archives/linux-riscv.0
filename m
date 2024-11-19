Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632F9D60074
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Nov 2024 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weiCQvxrdVdhU5b6tyvrtk9NsWNzibyLrFk462mrXS0=; b=qgdREX+2n9tmtN
	0GosxTfu3S9xE052xK01V7kkq1ippaUNSAxzD2IJPTpxfpN0vZyUcBp7fOPPWmlBh83+nGZXN73wi
	yz6LI2VFDC4GnHY5cGV0oAQoMfxOAedVFQxhs1VpcXEkioxYNo6lTh8fnNg4StJe9gSq+4zcsOZ0T
	sm7RGGnaApNBePBGhbtlcZErZx95YjVuYYoVMbZJplhDQs3eRMBHl4xMwzsqjzso3BorXYfAdhBnM
	4yqjqPJSAVoo/E7PQ8J19eteEyueOgINT+BHi/vlzwYvdCYv+fPphu7PakOmxRUGDiQsIuB2q/aT8
	prmYEPapiL8oSoiMv5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJ2P-0000000BgGf-2nxK;
	Tue, 19 Nov 2024 07:52:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJ2M-0000000BgFI-3bdi
	for linux-riscv@lists.infradead.org;
	Tue, 19 Nov 2024 07:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 797F3A4270C;
	Tue, 19 Nov 2024 07:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54108C4CECF;
	Tue, 19 Nov 2024 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732002757;
	bh=vlZ6V0V0suamT+C0dm+LdFJZxlVSNDnx0CqzO+SIykI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqZ6dX5gFPX/Q9wBUHBCxPwNDF8hBrC7yohbLFN694Y8yOp0J16HR4DvqRdPsJmTO
	 Tt9hQaBPUaC60HRBogF3C2ZF+mZLocCIKI01joVKoGJcAH0QYQUDI8EV8kKoVzIrEB
	 DDuSR9i3ZVPw2ec1cpBGu746sT83Q95DHm8vq1bBY7x3yDeja74ifyK8SwZ1+WXwUk
	 cAuqABOaawUEn6y65UT9GmAEpoYqW7iZ7O3LLRcQB1cBhAxONb7hLOV3Q/tvU2VIZ/
	 viFPEbtxbVIH3nq/0Gl5BiPd5BRomosE5KlDWWHlrvd/avZEucK327ZS9NoK+Avrh9
	 djOEH0D1gLM0g==
Date: Tue, 19 Nov 2024 08:52:28 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Colton Lewis <coltonlewis@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: perf: Drop defining
 `perf_instruction_pointer()` and `perf_misc_flags()`
Message-ID: <ZzxDvLKGz1ouWzgX@gmail.com>
References: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_235239_026406_107142C4 
X-CRM114-Status: GOOD (  16.58  )
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


* Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
> VMs"), the perf core now handles the functionality previously requiring
> arch-specific definitions of `perf_instruction_pointer()` and
> `perf_misc_flags()`. As these definitions are no longer necessary for
> RISC-V, this patch removes their implementation and declarations.
> 
> This change also fixes the following build issue on RISC-V:
> 
>     ./include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
>     ./include/linux/perf_event.h:1679:22: error: 'perf_misc_flags' redeclared as different kind of symbol
>     ./include/linux/perf_event.h:1680:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'
> 
> The above errors arise from conflicts between the core definitions in
> `linux/perf_event.h` and the RISC-V-specific definitions in
> `arch/riscv/include/asm/perf_event.h`. Removing the RISC-V-specific
> definitions resolves these issues and aligns the architecture with the
> updated perf core.
> 
> Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")

Yeah, so the Fixes tag is wrong - this is not a build bug
with that commit, and your patch does not even apply to
the perf events tree.

This is a semantic merge conflict that arises in linux-next - the
riscv version of perf_instruction_pointer() function doesn't even
exist in the perf tree...

AFAICS the problem is that the riscv tree applied this commit:

  5bb5ccb3e8d8 ("riscv: perf: add guest vs host distinction")

While the perf tree solved this in a more generic fashion:

  2c47e7a74f44 perf/core: Correct perf sampling with guest VMs
  baff01f3d75f perf/x86: Refactor misc flag assignments
  3e807cf07d96 perf/powerpc: Use perf_arch_instruction_pointer()
  04782e63917d perf/core: Hoist perf_instruction_pointer() and perf_misc_flags()
  e33ed362cf9e perf/arm: Drop unused functions

So I believe, assuming the perf version works fine on riscv
(I haven't tested it), that the solution is to revert
5bb5ccb3e8d8 either in the riscv tree, or upon merging it.

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
