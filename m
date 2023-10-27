Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD50C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 07:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucedKGFOFMe3sJS0g0ZKc/UM/tj2dlLh0PIRHZUuX1E=; b=SHasGV1oZgNveK
	ppmzR9hB108MdsarEmm5ckkxWy/nsizsnWedrtDlCAll8kCfugLH3TfYNU4Mn+P9dkDHGuBveNdKF
	R2mlPfSPm1PnMoACZf7eZNkeBTNqAkrJ00pSfuuMpuQmMbYzm36EgSneYEc4FNiC2Qm4vu033ENZq
	rHEKySgAW4uzMMINgxoyfIt6gR2+Smvdp69I9uvjAYVhAw4RKdSzJtKb1/ibQWRZ0Vxcg+MD+ygjr
	gvxeVza9YkXMTliB0bAv4wB7Otf0jRxF8ZrqQMLSJrt2ab96iW4x461chk0dhAUgRCf3VpiQaWDrG
	PaV5IZ9JrySDMC8zOzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwH2k-00FlFB-1B;
	Fri, 27 Oct 2023 07:14:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwH2h-00FlDM-0H;
	Fri, 27 Oct 2023 07:14:04 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698390839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJVMpiIeVpk7seuFKZfSHdhPh2uWAHUcs45v1cNLNhw=;
	b=yjRTcK/3HzHdJlxf+rNLkpWCvE+GXuLsHOqzK4Eoe2oksmgDWddVwYQ+fRSjo1D7616Vry
	H4jCeZX3g6FIrk7Ti3uYeH3csx+mDg2gIY71hddUSUKpaDaDmZiua8tN8vYicUoNFpJJqf
	/nPyz3FpKLh+DHdfUcvr57/Pqy2cDt++xhw2bS1slf4UT2gl04Fkiijq7Pxv5DjrN1bD5Q
	V6SUkXxWBUteuUGs8r2abdiJQ/X+4575r39Bz+2p/p0Ht8bdJeWJky8L6tuppJDtInX8fU
	cBZLUuHUrg9beMho6ba/v7/JIXYylayjZl88T3tDvskyWI4zsqi4YPrDq/l8GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698390839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJVMpiIeVpk7seuFKZfSHdhPh2uWAHUcs45v1cNLNhw=;
	b=jHx8e7bHfbKM/IOLO1Lz2Zfw896ficoDWczCWdGHFlQrzI5neRSnnei4Nv8xLffuOdJRSI
	NpyHrax2awuojpBQ==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
 geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de,
 irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com,
 mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, peterlin@andestech.com,
 peterz@infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rdunlap@infradead.org, robh+dt@kernel.org, samuel@sholland.org,
 sunilvl@ventanamicro.com, tim609@andestech.com, uwu@icenowy.me,
 wens@csie.org, will@kernel.org, ycliang@andestech.com
Subject: Re: [RFC PATCH v3 RESEND 03/13] irqchip/riscv-intc: Introduce Andes
 IRQ chip
In-Reply-To: <20231023004100.2663486-4-peterlin@andestech.com>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-4-peterlin@andestech.com>
Date: Fri, 27 Oct 2023 09:13:59 +0200
Message-ID: <877cn84jwo.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_001403_266416_E155D08E 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 23 2023 at 08:40, Yu Chien Peter Lin wrote:
> +
> +	if (strcmp(cp, "riscv,cpu-intc") == 0)
> +		chip = &riscv_intc_chip;
> +	else if (strcmp(cp, "andestech,cpu-intc") == 0)
> +		chip = &andes_intc_chip;
> +	else
> +		return -ENXIO;

See the other reply.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
