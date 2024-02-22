Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6CC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 03:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJWA4SCt0Sw3Oa/Ae2o84SYcpBXg4eo6+EKyeJwgt54=; b=dc/t5ctINZrSnY
	aLzcGT2q/3Q7NMVhYbk//N5dTFP1xpBWfTv2qbGiYLbwU2VmfvIxi0XT1G6hzFfmtjoAooHIaIKHP
	6a6n1cLbN+La2lE1Jd6/N81rLH6JYa3a1jBUFOIstPOeFhlOCmOI0U2ajMN/5gtcvpTiquc38QqNq
	KyjFJdhmy5BfDg17GDk/QWWD3ldxyWFwrQUQhqDG3nrE8qgrfSf2NEjkMAMa8dAS7A5jBNDNUiJOr
	hFWEEGhRt9OoKV15b5cVuxX1QLztqJUsUMeldhIbBfcZx6H2+Ami1VlD9ZoZNS7KAOBgu221BDbhE
	x1Jozmnx9BheQRp2L55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rczhf-00000003M77-0zwN;
	Thu, 22 Feb 2024 03:24:55 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rczhb-00000003M6U-2lPB;
	Thu, 22 Feb 2024 03:24:53 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 41M3N6Y8080329;
	Thu, 22 Feb 2024 11:23:06 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 22 Feb 2024 11:23:03 +0800
Date: Thu, 22 Feb 2024 11:23:00 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 00/10] Support Andes PMU extension
Message-ID: <Zda-FE2FpyhbIJKd@APC323>
References: <20240129092553.2058043-1-peterlin@andestech.com>
 <mhng-b85cfae6-43ef-42ac-94b4-d0f4ce2d0940@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b85cfae6-43ef-42ac-94b4-d0f4ce2d0940@palmer-ri-x1c9a>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 41M3N6Y8080329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_192451_986306_FDEF06E0 
X-CRM114-Status: GOOD (  20.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, irogers@google.com, Heiko
 Stuebner <heiko@sntech.de>, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, Paul
 Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, Conor
 Dooley <conor@kernel.org>, linux-perf-users@vger.kernel.org, Evan Green <evan@rivosinc.com>, inochiama@outlook.com, jolsa@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Wed, Feb 21, 2024 at 12:58:31PM -0800, Palmer Dabbelt wrote:
> On Mon, 29 Jan 2024 01:25:43 PST (-0800), peterlin@andestech.com wrote:
> > Hi All,
> > 
> > This patch series introduces the Andes PMU extension, which serves the
> > same purpose as Sscofpmf and Smcntrpmf. Its non-standard local interrupt
> > is assigned to bit 18 in the custom S-mode local interrupt enable and
> > pending registers (slie/slip), while the interrupt cause is (256 + 18).
> > 
> > Linux patches based on:
> > - ed5b7cf ("riscv: errata: andes: Probe for IOCP only once in boot stage")
> > It can be found on Andes Technology GitHub:
> > - https://github.com/andestech/linux/commits/andes-pmu-support-v8
> > 
> > The PMU device tree node used on AX45MP:
> > - https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md#example-3
> > 
> > Locus Wei-Han Chen (1):
> >   riscv: andes: Support specifying symbolic firmware and hardware raw
> >     events
> > 
> > Yu Chien Peter Lin (9):
> >   riscv: errata: Rename defines for Andes
> >   irqchip/riscv-intc: Allow large non-standard interrupt number
> >   irqchip/riscv-intc: Introduce Andes hart-level interrupt controller
> >   dt-bindings: riscv: Add Andes interrupt controller compatible string
> >   riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
> >     INTC
> >   perf: RISC-V: Eliminate redundant interrupt enable/disable operations
> >   perf: RISC-V: Introduce Andes PMU to support perf event sampling
> >   dt-bindings: riscv: Add Andes PMU extension description
> >   riscv: dts: renesas: Add Andes PMU extension for r9a07g043f
> > 
> >  .../devicetree/bindings/riscv/cpus.yaml       |   6 +-
> >  .../devicetree/bindings/riscv/extensions.yaml |   7 +
> >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |   4 +-
> >  arch/riscv/errata/andes/errata.c              |  10 +-
> >  arch/riscv/include/asm/errata_list.h          |  13 +-
> >  arch/riscv/include/asm/hwcap.h                |   1 +
> >  arch/riscv/include/asm/vendorid_list.h        |   2 +-
> >  arch/riscv/kernel/alternative.c               |   2 +-
> >  arch/riscv/kernel/cpufeature.c                |   1 +
> >  drivers/irqchip/irq-riscv-intc.c              |  88 ++++++++++--
> >  drivers/perf/Kconfig                          |  14 ++
> >  drivers/perf/riscv_pmu_sbi.c                  |  37 ++++-
> >  include/linux/soc/andes/irq.h                 |  18 +++
> >  .../arch/riscv/andes/ax45/firmware.json       |  68 ++++++++++
> >  .../arch/riscv/andes/ax45/instructions.json   | 127 ++++++++++++++++++
> >  .../arch/riscv/andes/ax45/memory.json         |  57 ++++++++
> >  .../arch/riscv/andes/ax45/microarch.json      |  77 +++++++++++
> >  tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
> >  18 files changed, 494 insertions(+), 39 deletions(-)
> >  create mode 100644 include/linux/soc/andes/irq.h
> >  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
> >  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/instructions.json
> >  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/memory.json
> >  create mode 100644 tools/perf/pmu-events/arch/riscv/andes/ax45/microarch.json
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> in case someone wants to take this via another tree.  I'm also OK taking it
> via the RISC-V tree, pending a resolution to Thomas' comments on patch 2.
> For now I'm going to assume there's a v9 coming.

Yes, I'm working on v9, please hold off taking the series, thanks.

Regards,
Peter Lin

> Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
