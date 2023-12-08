Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA07C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pO7lqJXOZDaZjJB67LeCrC57HtCcm6ZoRcg8cCuVehU=; b=hrvJKLXx0XgaCt
	sU4jVlquMWBh1pjTD4d6nMN+M8zXBZWGWG0y/Z3nDNbz1rpsVn3UDw/4zaUzT9dGUNVrCb8zO6BF3
	hAenfHguR+i4+Akkx3AkN37x8bOomcnliRHMQZSx9b7cJ7LX3emW6aiUQ0bPS9NUhcbtJTjWqkWal
	18JtFNTtvrdhlm0JIw3WwxoiFvroV7gUbfpXmDl4V/8ZqUQzWFV9+xHImTr0c/yJgbb1yItqoNROD
	O+ARNwWH+tBNhMbIorh6U4AYU3S6XiYGVvYUZ8DRjeEZA737rZQ6aY1y2IeQ+3yw9vWsWoce9mBxF
	h4cd7O03xxNAgjnBIMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdBZ-00FxP5-2Q;
	Fri, 08 Dec 2023 15:54:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdBV-00FxNs-0J;
	Fri, 08 Dec 2023 15:54:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702050874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6O/DmHCMHLUH4FV1veAF/8wiZY0/z4QkGmnuD54M7ss=;
	b=dUAYIEG5jE088Ag2fa2Z1rmOHZzMqN8lggzcGrdUF+qteYYY6+KScF/UWzOmEkwppSIzMg
	drYMKkylIh4/jkIuNwWg2RwRfCbgTFEy27hCcz9Gk15i9dRSW78M5DpeqR2QWEKRIKLyHx
	wDyd9rDgT2FHf75QyRs2uIi2l6vjA1qxtgW30iVOhJiK/nDRv0wwaN3/yoM2ixz4AokyV3
	zQJjh3UFGsZP+qwKuCSP1Jjc0k3T3iczFPHGvrAcOe0PUf5+TVU2oFxwJl21okm2QGqOr9
	HP3DNdUlp9E4kYFKpOiZ0aDPB40Qzxtb++qm4dqzsK4Vk2qKeTKYrhvStKL7/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702050874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6O/DmHCMHLUH4FV1veAF/8wiZY0/z4QkGmnuD54M7ss=;
	b=4b3Ipi5s1e37x7+vS4YcQAh1vTCM28hhl4temVUWU7Lfo1Vr/kigWJ41YHwTye0jWEYeM3
	fXhNrHzTehUYsbBA==
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
 wens@csie.org, will@kernel.org, ycliang@andestech.com,
 inochiama@outlook.com
Subject: Re: [PATCH v4 02/13] irqchip/riscv-intc: Allow large non-standard
 interrupt number
In-Reply-To: <20231122121235.827122-3-peterlin@andestech.com>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-3-peterlin@andestech.com>
Date: Fri, 08 Dec 2023 16:54:34 +0100
Message-ID: <871qbwsn9h.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_075437_273735_BC2ADCA7 
X-CRM114-Status: UNSURE (   9.08  )
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

On Wed, Nov 22 2023 at 20:12, Yu Chien Peter Lin wrote:
> Currently, the implementation of the RISC-V INTC driver uses the
> interrupt cause as hwirq and has a limitation of supporting a

s/hwirq/hardware interrupt/

Please spell things out. We are not on Xitter here.

> maximum of 64 hwirqs. However, according to the privileged spec,
> interrupt causes >= 16 are defined for platform use.
>
> This limitation prevents us from fully utilizing the available

This limitation prevents to fully utilize the ... 

> local interrupt sources. Additionally, the hwirqs used on RISC-V
> are sparse, with only interrupt numbers 1, 5 and 9 (plus Sscofpmf
> or T-Head's PMU irq) being currently used for supervisor mode.
>
> Switch to using irq_domain_create_tree() to create the radix tree
> map, so a larger number of hardware interrupts can be handled.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
