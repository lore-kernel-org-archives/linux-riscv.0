Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C06C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zE/ctW8KOP90LgT7XxEEavkT4dnN8NyqgrVV9D5aDc=; b=ldl6ccRhW4tAxv
	aVH2rA84oLCf2CK1YmGj0SazKtDxJIRtWlOtKN7BFMT5KGxcsXyyvu5zHNMIMdrjA4eX5gvZWqgwM
	7GmayWF3ty2A0cbcRdYRtp1xplcxVXYry1kgsb5Crslhw6NritbFMeaIQn36yxOw6spj2J7xssXsx
	8Plt0QpeokP+tRt2G17/NMNB592AdrxAQstlFEiBaeTR/OTYB7Huw0AZpnlRv/LmW5t9zyCpnddXM
	fH3XU5gU+WiNiOKUJpVKIgddyBB848/DZDea8ujg1XwHZEOXXs4mZxR8ClRoewTwbMyMhSYV9uM8n
	JaNc0W5jV/shCOUj500g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seepe-0000000AieW-3x4D;
	Thu, 15 Aug 2024 18:04:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seepd-0000000AieO-3BFE
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Aug 2024 18:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cjy/zRvsVofN6wE4iw4bXjX1k7f4+3khBASQg6Qxl+E=; b=GNMeW63BUnrHquMStRFeZoTnXL
	uigy8CaPSMJyVroDp7bMwJiTzs4iQE7Q4u44A592Q3Xxaqg7krcjiRXGV+vjGukRDGjb1r0Rs3P1H
	om9nF6CX24CDZPSvFMzP5J7VOKWnFmYMEnzMJdnK/B1qQ76AT0yx2xRLIHI/ec8R6Uw1LtbT/I3Iz
	dYcodyIZNMYuCkCh09J8t6ieLWdN8uac+zskw7SpM3WTszAJImqLDiRImuWG7CN6Fq8wyYvmTXrJb
	pDmWrxIqII8bmC+elgMojTnrlzwSYkMfTS/LOe9kKMffn+CDrHyot+1+O3hxbVIYskZxGu6G0f8JV
	mzjOcIQQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seepa-00000008Tf9-2xcD
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 18:04:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723745050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cjy/zRvsVofN6wE4iw4bXjX1k7f4+3khBASQg6Qxl+E=;
	b=jHiTJjKS8jvRv8Mjg5E2vOulrZ1G7uliNrXR4n3QzO8v/yw9bmpxCIIhaOlw5qunrLjqWS
	Vif20eBiOfdoW16+Cqsgg6+7+szbU1JCbUXNujE4DWc1TJAxc2Nm0Tw1/6tBrDIJUtFgFD
	J5iZNVfp05PceXfmZc2J+DaiHxwt9mwO2iK3VGQnyJI4pCkgjsEQASbwZbxmopW9y69FvV
	F282XHbsC0pXoyAiWrUZBoGpUWEdTrY2jmpbOrcJv+dTXoUvGFZUMu4E7244Vue/rWQ4WH
	Rrgwc38vEw48IJSeKVI0Ghsrz7MNjT8VKL+OFZe33qz7sq1PYsmOBUhXgCFv6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723745050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cjy/zRvsVofN6wE4iw4bXjX1k7f4+3khBASQg6Qxl+E=;
	b=RytdbaJ/0781LRnmvGSLZxhRaolVZLmk7/TCaOtZlto6LocFO/vs/jcTXIkyEynFupLSaY
	aF8Kg07KrKPnQIAA==
To: Palmer Dabbelt <palmer@dabbelt.com>, samuel.holland@sifive.com
Cc: Renner Berthing <emil.renner.berthing@canonical.com>,
 apatel@ventanamicro.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
In-Reply-To: <mhng-91e79885-7652-42a4-aad0-f4713e7ac70d@palmer-ri-x1c9>
References: <mhng-91e79885-7652-42a4-aad0-f4713e7ac70d@palmer-ri-x1c9>
Date: Thu, 15 Aug 2024 20:04:10 +0200
Message-ID: <875xs1mzmt.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_190414_916340_B88D2816 
X-CRM114-Status: GOOD (  15.12  )
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

On Thu, Aug 15 2024 at 10:51, Palmer Dabbelt wrote:
> On Thu, 15 Aug 2024 08:59:37 PDT (-0700), samuel.holland@sifive.com wrote:
>>>>>> Sigh. Does RISCV really have to repeat all mistakes which have been made
>>>>>> by x86, ARM and others before? It's known for decades that the kernel
>>>>>> relies on a working timer...
>
> It's even worse than that: RISC-V doesn't even mandate any working 
> _instructions_, much less anything in the platform/firmware.

So it's definitely taking the award for architectural disaster and will
probably keep it for a while.

> So I think if the revert is the best fix then we should revert it.
>
> That said: If the CLINT works, could we just add a probing quirk to make 
> it appear on these systems even when it's not in the DT?  I'm thinking 
> something like adding a compatibly string to the CLINT driver for the 
> SOC (or core or whatever, just something that's already there).  We'd 
> probably need a bit of special-case probing code, but shouldn't be so 
> bad.  We've got some other compatibility-oriented DT quirks floating 
> around.

Alternatively, you can have a quirk in the PLIC driver for that
Allwinner D1 chip which probes it via IRQCHIP_DECLARE() as before with a
special probe function and denies the later platform probe.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
