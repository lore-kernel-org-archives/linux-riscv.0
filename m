Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767AAC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qW/BazG0um2bVYPYdrwOMr6i54oJa+j61PntVa91lZY=; b=zrS7z6zBi/PGF3
	BFayr+YA0ttg02iHmqUwS3V+d3nbuRHcuMWcrA8IWC/Gy0W4X2gWpXbkaKeAgOWyk2KzHuIsrV7wu
	mJOLjkIpLaKJs82HpIs4f5sSYtuTdSb2LDKCaid4Fm0QOnbLO4lfCidJXJ4x1UGpw8mUAH5gviaIF
	AXHirWm0aoaP9BqhpkkM+bvqrmJnLOTo8p1Pne5jlTq8bcg1fU5Gj6EI7Ar4vb+z31y9DnyDdfzKb
	GVv2ZbXJVIW5nIgWmtWlmkaHo3EQHmcz44LUdKWhEyCSscXR1ZJ/SMipMOc9y0Ik2uH5uAenRkGDY
	qwnU5XCZV0A5oWbQiD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Gz9-007gps-2L;
	Wed, 29 Nov 2023 09:35:59 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Gz0-007gmi-2E;
	Wed, 29 Nov 2023 09:35:52 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AT9Ya14074351;
	Wed, 29 Nov 2023 17:34:36 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 29 Nov 2023 17:34:33 +0800
Date: Wed, 29 Nov 2023 17:34:30 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 11/13] riscv: dts: allwinner: Add T-Head PMU extension
Message-ID: <ZWcFpjLbAf1-YtLs@APC323>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-12-peterlin@andestech.com>
 <20231123-coping-revenue-be284a351c9d@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123-coping-revenue-be284a351c9d@wendy>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AT9Ya14074351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_013551_175197_BC3D7A41 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On Thu, Nov 23, 2023 at 02:58:55PM +0000, Conor Dooley wrote:
> On Wed, Nov 22, 2023 at 08:12:33PM +0800, Yu Chien Peter Lin wrote:
> > xtheadpmu stands for T-Head Performance Monitor Unit extension.
> > Based on the added T-Head PMU ISA string, the SBI PMU driver
> > will make use of the non-standard irq source.
> 
> Allwinner aren't the only ones using T-Head CPUs that the previous
> m*id pmu detection code would have matched on. I think the first three
> files below will also need to be updated:
> 
> rg -l "thead,c[0-9]*\b[^-]" arch/riscv/boot/dts/
> arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> arch/riscv/boot/dts/thead/th1520.dtsi
> arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi

That's really helpful, I'll add these .dtsi files in the patchset v5.

Thanks,
Peter Lin

> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
