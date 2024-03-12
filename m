Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9E9C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijGR7uBwBYbDcKYKMvHc0xFK+WjGeuobyxxYT1JgA/0=; b=PL72SwHZKOUnGf
	HGnBEMOlrORtWylUNHXaNA06R5IYdjpNUHb3UTWRAHFQumEQg23Y3jFVDD6UCXqhFHfh8CLlQp3m/
	hT7MGXP5Zz6E9NyeUhf3VKG1INLZRG+bNxkE2VhD8SFVEUSCysiOygYjHHXJ5yc+8761mWbn+lNvE
	+12OGHLg3BFFf9+c9wjouathRjTVFsCQmfWF7A2QsQJZKZ5NL4ajy9GbjNb6zWouy5n4eZWUvUncr
	YuvEU5GIaRFNg2Q032OuCL68QEWTrGEZior9PXs6K4AZSGQg2mn+9CcdztrhOD8NPTP6zQEpLAUfL
	WIaZPZ+BCiP/UlIqrwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk371-000000067M9-0gl0;
	Tue, 12 Mar 2024 14:28:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk36t-000000067IS-3TCy;
	Tue, 12 Mar 2024 14:28:11 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710253685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XVmae+JgcDRh2ZKkyqUURMemYqkLUazTfEI4APXLG8=;
	b=Gkd42EZNkxkb0gExXtDTx7jWtBaTPBoUwDTCkVnine3q786/2VyXE+TFzta5tHdTvyY3r6
	0IppMKL/dDQgNVitWDG887sTq0mkp0YSMQMrp4J5KiWgryFdjcMAK0XI5+krNFTqqlkI24
	ZPRjAOpPr4JFL9A24qO2FEPoCqbJn3OsrOXd3gK9JhfIlb5jgABbKC+D0DhI1IH8SQtwqn
	VK/6/AA4WU+xKbG/bu3birdCHd/m1nZqp1Hl47hrjSXlrrTvsPkRZWmOqdhCXDTqi/hr1z
	nsXWLPu9GxRcJOS1zlHvRJfjTx0Qz1WpvPCqgOgeUuW7E13yopFjKq++prVDSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710253685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XVmae+JgcDRh2ZKkyqUURMemYqkLUazTfEI4APXLG8=;
	b=cD3gLAD+A5hhLRuybrw9y36IXuxxC0wmJs+Kxm6eMNoqnmzJejztRvj6E/1wUaNsGms837
	7RFeuZJRKtJkUtAw==
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v9 03/10] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
In-Reply-To: <mhng-d47edbdb-0a36-4adb-9575-8af094d80e5e@palmer-ri-x1c9>
References: <mhng-d47edbdb-0a36-4adb-9575-8af094d80e5e@palmer-ri-x1c9>
Date: Tue, 12 Mar 2024 15:28:04 +0100
Message-ID: <871q8fplsb.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_072808_032506_A7B6EE06 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, irogers@google.com, Heiko Stuebner <heiko@sntech.de>, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, peterlin@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, randolph@andestech.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, jszhang@kernel.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, Conor Dooley <conor@kernel.org>, linux-perf-users@vger.kernel.org, Evan Green <evan@rivosinc.com>, inochiama@outlook.com, jolsa@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12 2024 at 07:23, Palmer Dabbelt wrote:
> On Fri, 23 Feb 2024 01:06:44 PST (-0800), tglx@linutronix.de wrote:
>> Contains:
>>
>>   f4cc33e78ba8 ("irqchip/riscv-intc: Introduce Andes hart-level interrupt controller")
>>   96303bcb401c ("irqchip/riscv-intc: Allow large non-standard interrupt number")
>>
>> on top of v6.8-rc1
>
> Sorry I missed this.  I just merged this into my testing tree, it might 
> take a bit to show up because I've managed to break my VPN so I can't 
> poke the tester box right now...

Alternatively you can just rebase on Linus tree. The interrupt changes
are already merged.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
