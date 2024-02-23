Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F994C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5zTiv+WwsaGOutn2L52sQN+gWHC24OVZtByCBdyFt4=; b=cmAaD6LBONHw12
	xU+kRDEDeTDRY5Mf1Dt4uRv3SUh/lk7832hZF/OkoZUaYCltlpG7gLLZQA94TbHpUcA428SWNc3Wc
	E8ZgDWSfvE2sKC3a8zvVOnc45R8owhTxiV1uhfGRYGK7bG6spOoi8bNCNx3yhu5y6TRUra4QXlRAr
	Lg4b7iXWZ3EoFsNWb+8jLHSxzELNJqgb5bkN6RuMEQqfboOWzZc2JOkPx5LTQEinlug2wIH0STfI/
	Au4dwECvNSDncUguYexehklZKgjv8TsYTfi4FyOCwFItx97OJ6fSauII7LKGKvkaeTIkXKaGZAxIV
	bkxVELmec12m/asylHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSes-00000008sl8-193y;
	Fri, 23 Feb 2024 10:19:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdRW3-00000008bct-15M9;
	Fri, 23 Feb 2024 09:07:20 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708679204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Wf50sMB7P17099HKyOgeF0+Md1dpE2WNC2PraYzo5E=;
	b=ee4b7daXsqpkzj6vKmrWIdzYGHDrctEvl72qqapmJw5l+m5h9+rQnszLKqgtbz67CkyKaR
	WiMvXNIZsrslicsWhHvb0IPfX70yMh0lNgbISA9r7cigPedZh6slKTWBHi4halEN+oOBPK
	uv6XMbitjMAdDya3tn7TMg8uPVLSwUvMhHUebFmzrdwdWJr7ba7KPWOK1fIKyV2TYSvZah
	bEOw1gXqncVBmMR/J+bbL5+HvI7JHCvQEP37562Lo2ih3FWVAjs1BDt83/UKs1/3UZ5PLB
	GJvuHh/dLG/ug1oz4/+RcnyxFVo7XizOq4Kd5qWMP/H2sLDgP0fXV398sL6wTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708679204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Wf50sMB7P17099HKyOgeF0+Md1dpE2WNC2PraYzo5E=;
	b=7ha8i2Rqp856wi8VCmskiECtA8C/RuvjDd5/eucA2Ii/vV3XWHmq5b2SmysDpGNCorrVUH
	079KsBv1vbaQ/pDg==
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
In-Reply-To: <874jdzef1j.ffs@tglx>
References: <20240222083946.3977135-1-peterlin@andestech.com>
 <20240222083946.3977135-4-peterlin@andestech.com> <87o7c8dvv4.ffs@tglx>
 <877civefa5.ffs@tglx> <874jdzef1j.ffs@tglx>
Date: Fri, 23 Feb 2024 10:06:44 +0100
Message-ID: <871q93eehn.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_010700_676555_690647C4 
X-CRM114-Status: UNSURE (   9.00  )
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

On Fri, Feb 23 2024 at 09:54, Thomas Gleixner wrote:
> On Fri, Feb 23 2024 at 09:49, Thomas Gleixner wrote:
>> On Thu, Feb 22 2024 at 22:36, Thomas Gleixner wrote:
>>> Palmer, feel free to take this through the riscv tree. I have no other
>>> changes pending against that driver.
>>
>> Aargh. Spoken too early. This conflicts with Anups AIA series.
>>
>>   https://lore.kernel.org/all/20240222094006.1030709-1-apatel@ventanamicro.com
>>
>> So I rather take the pile through my tree and deal with the conflicts
>> localy than inflicting it on next.
>
>> Palmer?
>
> Nah. I just apply the two intc patches localy and give you a tag to pull
> from so we carry both the same commits. Then I can deal with the
> conflicts on my side trivially.

Here you go:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-for-riscv-02-23-24

Contains:

  f4cc33e78ba8 ("irqchip/riscv-intc: Introduce Andes hart-level interrupt controller")
  96303bcb401c ("irqchip/riscv-intc: Allow large non-standard interrupt number")

on top of v6.8-rc1

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
