Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDAC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQqko3+KEHBaIebLtVT26US6sJ10qgJmnZrQP2oKa4M=; b=tkBg3KF6mVzGZA
	ucIwRYz/9tYN8Jh/wsjjA/6e1OYoGK0yUuqCNJWebIRC8CccpsoETBirsUcvEXahI6oSQjQi84/Ek
	2TBEkl1PPvg0264339g98Ex1Nffu5PumIUrGBG27UfquB7/YW40DxJYbEyAqlXVmxh+iS9Fopv4qN
	kbk1s2zc0SwjcRa0Iu3BVcz1X3vxJfm8sJppBOVNwMk2c+Whrn1PLqLuIG6AhTcCvwsiPsGkK64WX
	YQ9WpnN9H53yAxE7jx7p0DAuzuE+4KixvaKiTj/mVKuS/pHijskJcVCEfhDbpI+at/e8N6AJzgG8l
	SOH9TfKe83XhznEpIhhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGkU-00000006gw1-0RCv;
	Thu, 22 Feb 2024 21:36:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGkL-00000006gsY-2F5h;
	Thu, 22 Feb 2024 21:36:54 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708637808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysPo6JrAY4nGWCiZuUlITPDn7XnJnDVfKZs7jRkBAW4=;
	b=mHY/ep6f/6+Zhj4+fZRHJ34d2lfiHP1EuInqjDkWFDCaiz/e8s95zPGbT8M0Ad++Dzyjmb
	oVY+D2yqHO9WQbM0zwWCA5C3UGCs+gQ3z590Ucxghlf4Dlr41VPiQF9YgQYZMLeUawEiAa
	Rnc0moqmMGO4SebkjihxwYdCTGbaE8vxFP+Vadvxo7Yltc9LG8tDTKxbNnV9fYjvOpOKXA
	IVzZemMDik58mgm0f4adOVww1qNlUCp6hVusO9YpY3wPgYHU/R6LCbNdfHNpPLOSKZiLCu
	6a7wcJJnpMSyhcj5Qeg9peFN2J/35vITOcTokZCnmz0jPiz2SksBNd0ahFfwWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708637808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ysPo6JrAY4nGWCiZuUlITPDn7XnJnDVfKZs7jRkBAW4=;
	b=6v3VMHzFcbvBoIrwVbn04/STMyA/qaJsgeXvHkOW1vMOCTZyQDFr2zoK8GtfRgUV7KtM1v
	sGwpCMRcO4QbnbAQ==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, evan@rivosinc.com, geert+renesas@glider.be,
 guoren@kernel.org, heiko@sntech.de, irogers@google.com,
 jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com,
 mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com,
 namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 peterlin@andestech.com, peterz@infradead.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org,
 robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com,
 tim609@andestech.com, uwu@icenowy.me, wens@csie.org, will@kernel.org,
 inochiama@outlook.com, unicorn_wang@outlook.com, wefu@redhat.com
Cc: Randolph <randolph@andestech.com>
Subject: Re: [PATCH v9 03/10] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
In-Reply-To: <20240222083946.3977135-4-peterlin@andestech.com>
References: <20240222083946.3977135-1-peterlin@andestech.com>
 <20240222083946.3977135-4-peterlin@andestech.com>
Date: Thu, 22 Feb 2024 22:36:47 +0100
Message-ID: <87o7c8dvv4.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_133649_826958_188DCFF1 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, Feb 22 2024 at 16:39, Yu Chien Peter Lin wrote:
> Add support for the Andes hart-level interrupt controller. This
> controller provides interrupt mask/unmask functions to access the
> custom register (SLIE) where the non-standard S-mode local interrupt
> enable bits are located. The base of custom interrupt number is set
> to 256.
>
> To share the riscv_intc_domain_map() with the generic RISC-V INTC and
> ACPI, add a chip parameter to riscv_intc_init_common(), so it can be
> passed to the irq_domain_set_info() as a private data.
>
> Andes hart-level interrupt controller requires the "andestech,cpu-intc"
> compatible string to be present in interrupt-controller of cpu node to
> enable the use of custom local interrupt source.
> e.g.,
>
>   cpu0: cpu@0 {
>       compatible = "andestech,ax45mp", "riscv";
>       ...
>       cpu0-intc: interrupt-controller {
>           #interrupt-cells = <0x01>;
>           compatible = "andestech,cpu-intc", "riscv,cpu-intc";
>           interrupt-controller;
>       };
>   };
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Randolph <randolph@andestech.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Palmer, feel free to take this through the riscv tree. I have no other
changes pending against that driver.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
