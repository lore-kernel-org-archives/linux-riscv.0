Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC1CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6pXPRIay1wHstdAI1OXUOuxdZ/att0uZFg9GoLjw3o=; b=UxvcyEkqblDWJV
	5Eu7hkB5DyMSKysag0W5Srd8DzY2QmPgKduhLICHzQHlYmDMR2Z8JJ66kVRliUm1tGhKPVcsO+odk
	xBbYHXV2a/msJ82zWaSD4p3myyrjPyGP5lIcrF2EEHVVEdNqWKNgPUIqv+qA+2sFxuiowCDiPe1I8
	1zHOy2WILQ4Lr2S6CcWcqoJhdZEGtT9dxMSTgZ8BHwlLTrvAWJLDT4ltnDIKjbr+y5K12B+K7Inns
	I5e/0/yMQ5+fusDXFULTKwvL24HH35ppqirfxuskfxU6YNbGEheGwZc4dFsBcfuuHqloMTBEvBNxJ
	+4K6wY0gIpaCi4MlVt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quib3-0065fS-0B;
	Mon, 23 Oct 2023 00:15:05 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quiay-0065dm-2f;
	Mon, 23 Oct 2023 00:15:02 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39N0DIsq070639;
	Mon, 23 Oct 2023 08:13:18 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Mon, 23 Oct 2023 08:13:17 +0800
Date: Mon, 23 Oct 2023 08:13:10 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 00/13] Support Andes PMU extension
Message-ID: <ZTW6lgK1oifvtqyH@APC323>
References: <20231022151858.2479969-1-peterlin@andestech.com>
 <20231022-cabana-crate-503b6e8d0481@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231022-cabana-crate-503b6e8d0481@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39N0DIsq070639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_171501_325090_252FCE36 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Oct 22, 2023 at 07:00:28PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Sun, Oct 22, 2023 at 11:18:45PM +0800, Yu Chien Peter Lin wrote:
> > Hi All,
> > 
> > This patch series introduces the Andes PMU extension, which serves
> > the same purpose as Sscofpmf. In this version we use FDT-based
> > probing and the CONFIG_ANDES_CUSTOM_PMU to enable perf sampling
> > and filtering support.
> > 
> > Its non-standard local interrupt is assigned to bit 18 in the
> > custom S-mode local interrupt enable/pending registers (slie/slip),
> > while the interrupt cause is (256 + 18).
> > 
> > The feature needs the PMU device registered in OpenSBI.
> > The OpenSBI and Linux patches can be found on Andes Technology GitHub
> > - https://github.com/andestech/opensbi/commits/andes-pmu-support-v2
> > - https://github.com/andestech/linux/commits/andes-pmu-support-v3
> > 
> > The PMU device tree node used on AX45MP:
> > - https://github.com/andestech/opensbi/blob/andes-pmu-support-v2/docs/pmu_support.md#example-3
> > 
> > Tested hardware:
> > - ASUS  Tinker-V (RZ/Five, AX45MP single core)
> > - Andes AE350    (AX45MP quad core)
> > 
> > Locus Wei-Han Chen (1):
> >   riscv: andes: Support symbolic FW and HW raw events
> > 
> > Yu Chien Peter Lin (12):
> >   riscv: errata: Rename defines for Andes
> >   irqchip/riscv-intc: Allow large non-standard hwirq number
> >   irqchip/riscv-intc: Introduce Andes IRQ chip
> >   dt-bindings: riscv: Add Andes interrupt controller compatible string
> >   riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
> >     INTC
> >   perf: RISC-V: Eliminate redundant IRQ enable/disable operations
> >   RISC-V: Move T-Head PMU to CPU feature alternative framework
> >   perf: RISC-V: Introduce Andes PMU for perf event sampling
> >   dt-bindings: riscv: Add T-Head PMU extension description
> >   dt-bindings: riscv: Add Andes PMU extension description
> >   riscv: dts: allwinner: Add T-Head PMU extension
> >   riscv: dts: renesas: Add Andes PMU extension
> 
> You only sent 5 of these patches FYI.

Hi Conor,

Yeah... I know. The following emails were intercepted automatically
due to our data traffic policy. I will resend the whole series soon.

Best regards,
Peter Lin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
