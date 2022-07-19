Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261CFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 12:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQcfT8o/XP3wNlELzW97um4FLQoikT8w4XrU4oaksdY=; b=KwpnQD4Rdaz3oC
	VXJMPLPeQuY9aQ/MyxVMjCOxBgbc4SLJG0ExUs+Te56Gl9Pfw2+pvkAZ+7PvV+P9u06rDgC74PcyS
	9KvQdmk+APoM837MRL64Mey5kY6c0aAKQa8iaBeI5xrO0th+FrxpI56GEcUuPbZDeYuAgXFfIUi6C
	8i40X8zznK1Eui5uDphjYTohqhEzHu1RHfHJVjUXKnoPJWsVsgGNzYFWa9w7n2aHPigswwrN3afYB
	Y2ih82aFGHNLS1Gie+CG6hRfp9CsOppVRuIyJMShsW9pXRSdI63Gjo4CzlmT0tgiTr4rUKPsUdehz
	USMkOqSFD4w/Q/EuXfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDluU-008VKp-Rq; Tue, 19 Jul 2022 12:01:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDluJ-008VDk-5K; Tue, 19 Jul 2022 12:00:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE98561642;
	Tue, 19 Jul 2022 12:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD9BC341CA;
	Tue, 19 Jul 2022 12:00:48 +0000 (UTC)
Date: Tue, 19 Jul 2022 13:00:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, sudeep.holla@arm.com, will@kernel.org,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	Daire.McNamara@microchip.com, niklas.cassel@wdc.com,
	damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
	zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de,
	guoren@kernel.org, anup@brainfault.org, atishp@atishpatra.org,
	heiko@sntech.de, philipp.tomsich@vrull.eu, robh@kernel.org,
	maz@kernel.org, viresh.kumar@linaro.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH v4 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Message-ID: <Ytac7G1zlq6WW4jt@arm.com>
References: <20220715175155.3567243-1-mail@conchuod.ie>
 <20220715175155.3567243-2-mail@conchuod.ie>
 <YtaYTgFDpGSsG+H0@arm.com>
 <198b0486-29e7-9729-d137-0470e93038fa@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <198b0486-29e7-9729-d137-0470e93038fa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_050055_256582_1BEFBB9E 
X-CRM114-Status: GOOD (  21.51  )
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

On Tue, Jul 19, 2022 at 11:51:04AM +0000, Conor.Dooley@microchip.com wrote:
> On 19/07/2022 12:41, Catalin Marinas wrote:
> > On Fri, Jul 15, 2022 at 06:51:55PM +0100, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> arm64's method of defining a default cpu topology requires only minimal
> >> changes to apply to RISC-V also. The current arm64 implementation exits
> >> early in a uniprocessor configuration by reading MPIDR & claiming that
> >> uniprocessor can rely on the default values.
> >>
> >> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> >> topology: Stop using MPIDR for topology information")', because the
> >> current code just assigns default values for multiprocessor systems.
> >>
> >> With the MPIDR references removed, store_cpu_topolgy() can be moved to
> >> the common arch_topology code.
> >>
> >> CC: stable@vger.kernel.org
> > 
> > I'd quantify how far back you want this to go. IIUC based on the Fixes
> > tag in the other patch, it should stop at 5.4. If you send a pull
> > request instead and have a fixed commit id, you could add it as a
> > prerequisite on the following patch without a cc stable here.
> 
> I guess a PR might be the easiest way for it anyway, so that both
> yourself and Palmer could merge it?

I guess so, a stable branch would do. Note that Will is handling the
upcoming merging window.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
