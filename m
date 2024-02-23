Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267E3C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9WGFvlJYvJD4Pgq550njRSupGVxarS5wVObVsIahfY=; b=WKk9H6jXhwuUlq
	KWrXxs7fLC93nQ4PeXP6fJDDLxfU7qRVgeQpC3py5ThzADuiVD5axL5XgAECejUMjQ5jDay03H05a
	scfALfdCS/ukgKD6BG6DrVDNjKv4OgkQbjhI4MXsOUysgBjxy8DW5w4Svp3JCfPWXNJgiYwZfXhhp
	Y/SdAqTxuypDPapNizMbdocp+aFKk2RNErPr1WpRv+IWYv29OHFUvyZoNX99FPdMRGkaKPCjRFBSZ
	wPec1uAF/ZPFJovzzTL+BEBuAMd7AWbejp32+sQXSNZ0zuTo9k1BlVgrn05sORDuy3uXGpjOGdO06
	bR0QyhpnYyKJos6anweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRGs-00000008ZK3-11dp;
	Fri, 23 Feb 2024 08:51:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRFZ-00000008Z8p-2rRI;
	Fri, 23 Feb 2024 08:50:00 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708678178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNmFwVS5XAceDnohqFy+IAMBF11KyZ6r2KWYJrBWXE8=;
	b=WDQSYdJNE7KB1loQwm7NXyaz42xsOdADLSbKnDPfOGT488YF42+RDZ0TL2fHu6Pn9m2Gvr
	hzfu9+EHBUaWJdgLImrfL3BD5SE9cXhinLBRw6jPnuKTLw8+GFkREKHZGxel2hxO7uCBVg
	4iP7sT6RLpjAqCzlzcm8i2EHL7EhbCV3Ct7yZv5GFmt4rW7bkzS24o/J8mT4mq4pWbzxsp
	CVhBWRE8Ge9x4q0WfLrU2XDLUGS2+Dq9A2u5P+sqi8XiKBqEv7MtwnWDnU/laIWNgqIM7T
	rwkDU4JB3fJDGCSKV+WbN9v+WngZukZ2qsfNfc3EWlu1w17E7z+UuxpcYnHxxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708678178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNmFwVS5XAceDnohqFy+IAMBF11KyZ6r2KWYJrBWXE8=;
	b=zmqCjShl7l6tJAOsDJ+efEVxrr1uXCcMteB/fuXZejOarW0ha8dUCYEuv3yfXSbMPNigm8
	1KNRL/SBEt99JbBg==
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
In-Reply-To: <87o7c8dvv4.ffs@tglx>
References: <20240222083946.3977135-1-peterlin@andestech.com>
 <20240222083946.3977135-4-peterlin@andestech.com> <87o7c8dvv4.ffs@tglx>
Date: Fri, 23 Feb 2024 09:49:38 +0100
Message-ID: <877civefa5.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_004946_069177_20B4A5B6 
X-CRM114-Status: UNSURE (   4.70  )
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

On Thu, Feb 22 2024 at 22:36, Thomas Gleixner wrote:
> Palmer, feel free to take this through the riscv tree. I have no other
> changes pending against that driver.

Aargh. Spoken too early. This conflicts with Anups AIA series.

  https://lore.kernel.org/all/20240222094006.1030709-1-apatel@ventanamicro.com

So I rather take the pile through my tree and deal with the conflicts
localy than inflicting it on next.

Palmer?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
