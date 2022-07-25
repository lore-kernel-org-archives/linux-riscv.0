Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC81C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=971dY3HXXweeIheanYEignUjSuJEDRpswSjipUtQu2c=; b=jbLQQHSpA3iK3E
	YIrljMhLh15UEGHBpFgHHCCd45RXL0njXNQbPuXuZ9VAUMkAZZoAB6Hp/jCHVFLQ773Y4rcXZ0w2P
	PuZVu7kURc10a0U1JG5+wmpbozUSZh/w9x8f5pvONuJqrHTveTVp7scyPKzeSmUgDS+kwuNNS1P7l
	/nhK3ulwYzbayx+1RDT44NVQBJNlmfHsiXQOR6ozs3gIsDN9uQZNgnZ2D1OVZnLPGbmpsf1rDFxIF
	IKHX1gqKF4Cxzu8Q//uO3AQdDqIBDGz0nfEsn8kBt7xMu6RkqA86ZO20zeFfFHjf6yJP6GRMYKX3S
	gZGks9j+Oc/1wPIpg74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuAH-007Pqw-TI; Mon, 25 Jul 2022 09:14:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuA2-007Pcb-HV; Mon, 25 Jul 2022 09:14:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A64C61228;
	Mon, 25 Jul 2022 09:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EACDC341C6;
	Mon, 25 Jul 2022 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658740435;
	bh=166hHxnqJZuqNRs6jN7i2hnEDOh1yEqMVw809Cf7sao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDqBQGrYAAwdDn6N5k2L/xUP8JKOQxPi/cYsoYQf413L60XLMhh4DfnQ5nJUOzrT9
	 1DveHthHyxZl0ePsTGDn7XxpT8b5YzfDfpF9Be/J8Dg7/Fx3KSdHKRqLgCzxf2ZdRh
	 pkKmDSdiFsQkm2y3vWJjuHDdgV/tcdLN+OjjqWDNULpQFSEymLcgmUGVvmMdsIt2yP
	 COmMqOaOZH/rCMoQgBIpk8KJ25rqk5PiIGhimCKnAFC/V4LzhNBXUniY6PS2hNshYT
	 9oohnM0U6prv4gMyO3hfO5CIu2EeuOnhSb6FGKWxtWYTneLa9X7ogrzLtc/NMjosWU
	 gJ9S0gRNLOSdg==
Date: Mon, 25 Jul 2022 10:13:46 +0100
From: Will Deacon <will@kernel.org>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, sudeep.holla@arm.com,
	catalin.marinas@arm.com, gregkh@linuxfoundation.org,
	rafael@kernel.org, Daire.McNamara@microchip.com,
	niklas.cassel@wdc.com, damien.lemoal@opensource.wdc.com,
	geert@linux-m68k.org, zong.li@sifive.com, kernel@esmil.dk,
	hahnjo@hahnjo.de, guoren@kernel.org, anup@brainfault.org,
	atishp@atishpatra.org, heiko@sntech.de, philipp.tomsich@vrull.eu,
	robh@kernel.org, maz@kernel.org, viresh.kumar@linaro.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
Message-ID: <20220725091346.GA20370@willie-the-truck>
References: <20220715175155.3567243-1-mail@conchuod.ie>
 <96972ad8-d146-3bc2-0e49-ffe88580bbee@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96972ad8-d146-3bc2-0e49-ffe88580bbee@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_021358_673892_C85B57ED 
X-CRM114-Status: GOOD (  26.03  )
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

On Sat, Jul 23, 2022 at 11:22:01AM +0000, Conor.Dooley@microchip.com wrote:
> On 15/07/2022 18:51, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hey all,
> > It's my first time messing around with arch/ code at all, let alone
> > more than one arch, so forgive me if I have screwed up how to do a
> > migration like this.
> > 
> > The goal here is the fix the incorrectly reported arch topology on
> > RISC-V which seems to have been broken since it was added.
> > cpu, package and thread IDs are all currently reported as -1, so tools
> > like lstopo think systems have multiple threads on the same core when
> > this is not true:
> > https://github.com/open-mpi/hwloc/issues/536
> 
> Hey,
> 
> Not got any feedback on the smpboot changes from the RISC-V side.
> I tested it on polarfire, the d1 (with both SMP & !SMP set iirc)
> & on the u540. It all looked good to me.
> 
> I'd like to have this fixed for v5.20, but there isn't too much
> time left before the mw. Not too sure about the cross-tree changes,
> does it need an immutable branch or could it go through driver-core?
> Catalin suggested removing the CC stable from patch 1/2 & adding it
> as a dependency for the 2/2 patch - but obviously that's up to the
> committer to sort out.

I'm finalising the arm64 queue today, so I don't really want to pull in
additional changes beyond critical fixes at this point, I'm afraid. I was
half-expecting a pull request from the riscv side last week but I didn't
see anything.

FWIW, if there's still no movement by -rc1, then I'm happy to queue all
of this on its own branch in the arm64 tree for 5.21.

Let me know.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
