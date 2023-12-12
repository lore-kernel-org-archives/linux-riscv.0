Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B68C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tTUL70NmIhyaTDOVck9uUQTQY/grJ/fzf9A8NJ/18E=; b=sdUcrouRtl9RdT
	NYnXLCmXUg1aALXHkq5OOCeybXa6d1RMhnSJ2iXe/XMExRfdjZjvdMNtWwGuLmLNAih7km0Qf54FN
	oK/bAiymUb/Rp9avgEZ9YUHbFWtuMr6HPgUN95sPAw7KAefqvGaYy1d3nHZC5AqD3gDlNWv3Cx4Ej
	IGX8mDe6brtwZF6G16EE/DoXcy4SkVb3K8BqSatT1fNBPyO72uDX02VNyXeVHHdw/YZJV//oSFAyg
	6txtu0HzM8XDQNY16hFLBOXV0uoWtCX4Rjk0/wsRKEdcDZAGLxVuKZuachQ4AraJWa7lwF2rrRHZP
	JaD07uR0ihmoyhfGZuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzrM-00BHtZ-16;
	Tue, 12 Dec 2023 10:19:28 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzrJ-00BHrv-0k;
	Tue, 12 Dec 2023 10:19:26 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BCAHkwA089046;
	Tue, 12 Dec 2023 18:17:46 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Tue, 12 Dec 2023 18:17:45 +0800
Date: Tue, 12 Dec 2023 18:17:41 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 02/13] irqchip/riscv-intc: Allow large non-standard
 interrupt number
Message-ID: <ZXgzRZK8uqgmY84L@APC323>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-3-peterlin@andestech.com>
 <871qbwsn9h.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871qbwsn9h.ffs@tglx>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BCAHkwA089046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_021925_721217_3C10744F 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Thomas,

On Fri, Dec 08, 2023 at 04:54:34PM +0100, Thomas Gleixner wrote:
> On Wed, Nov 22 2023 at 20:12, Yu Chien Peter Lin wrote:
> > Currently, the implementation of the RISC-V INTC driver uses the
> > interrupt cause as hwirq and has a limitation of supporting a
> 
> s/hwirq/hardware interrupt/
> 
> Please spell things out. We are not on Xitter here.
> 
> > maximum of 64 hwirqs. However, according to the privileged spec,
> > interrupt causes >= 16 are defined for platform use.
> >
> > This limitation prevents us from fully utilizing the available
> 
> This limitation prevents to fully utilize the ... 

Okay, will fix.

Thanks,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
