Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED09CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/ckVknheL9EK9PwSahpu5nd1aaPgCHMROGbHofSWEo=; b=naxbqqf64P/1W/
	1hskfPHkZXJRwAf/lwVzExYG9ehnC+cumtTFcvOsbfFFKrqztUy9+eA3LZm5tlsmX3LPZ7ZI8Hxvo
	Wz37JKG1HiqrLtsL7qdFrtUEo8mo3MblP8KXsei3iqjg6xzxjK7+/8nO9D1UPnA+esWjWCY2SIEhg
	ciSnuhzuoVHazoGm2dP+ZZWRbxGuFIe7ffDTf3BXnVkH+pcKLAJGHLF69S4jiYYzbuDHAqCSnZSxR
	MpzJ76m7opABZWXDgfEF+V/I16o4eZCrsbEpQs9sPz3Omu02AkAWLWcIAYbxjvVGerTOEx1JqGa0N
	FdJEfkb/rKCYY+5w10wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHF13-0000000GwCv-0gV9;
	Thu, 15 Oct 2026 06:32:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHF10-0000000GwBn-1JDT
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 06:32:35 +0000
Date: Thu, 15 Oct 2026 08:32:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792045950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Rlb5hQ3oMGtjIZB0mG1VIBGlNWQ+sMhpm0CKuyKp/8=;
	b=avscnrmr0x0jBlODANIotKUcpY8WwO+T1SFbC7RG4QbS/jgsRiAsaHYT1o4oYIoDp3HvaM
	BQCHkuKaQM4iCSMO281pgmUhbPCbftgJrLpWXlgrYp3tkvBkMB2MxGPWh7oFbR1SwTgi6L
	K1SrGTiUVAIMBl1MmNDwCHlgBu6AVld+oQO+aUtOUK32juXQ/QMlQzgeU8i0r5Zl3ox4EC
	/BhObAkMh0uxO5r4SKmdXIIzMDfok2j+zkvSMz3xoM9ltxjcdiTKnu33m+XeQrW5uo7+iS
	7UY4Y9McC0xsN+vszWDgeNWZWl1b8wyL9iJbWLBD58E5O7WiMJ6Cu/bTvgsY7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792045950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Rlb5hQ3oMGtjIZB0mG1VIBGlNWQ+sMhpm0CKuyKp/8=;
	b=pOQpfsAcK+CdgMDJgnsXbnvyLXTHb6qpjLg+lmR04PhVu61Q4dLM51aPBNbWYSBYWR8bGl
	BRi5V8el3x5KZ+Bg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jessica Liu <liu.xuemei1@zte.com.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3] irqchip/riscv-aplic: fix asynchronous probing
Message-ID: <20261015063227.GBjyN6LZ@linutronix.de>
References: <20261012-aplic-async-probe-v3-1-5cf52dc28690@mobileye.com>
 <20261013152727.2cUDX3l0@linutronix.de>
 <5a8048ef-a241-4486-adc1-440721d3606a@mobileye.com>
 <20261014105312.xNkvgkGg@linutronix.de>
 <46eaa0f0-ff72-4a72-91c8-b610be2d893a@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46eaa0f0-ff72-4a72-91c8-b610be2d893a@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_233234_513032_6BD3000C 
X-CRM114-Status: GOOD (  13.58  )
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

On 2026-10-15 09:19:26 [+0300], Vladimir Kondratiev wrote:
> Not exactly, "driver_async_probe=*" in bootargs request only drivers that has
> PROBE_DEFAULT_STRATEGY to be probed asynchronously.

okay.

> > I would not expect the MSI domain to be probed after kernel booting via
> > a module. This is the scenario where this would explode.
> > And if you consider this a problem you should address it and denote it
> > in the commit description as such and not silently changing it as part
> > of another change without any explanation.
> 
> OK, will add explanation for this.
> This driver can't be a module, it is "builtin_platform_driver(aplic_driver);"
> but still probe may be deferred if of node has "msi-parent", see
> aplic_msi_setup() - it can return -EPROBE_DEFER;

The driver providing MSI capabilities (the MSI domain for this device)
must a module. This is the requirement so that _this_ driver returns
EPROBE_DEFER and *then* once the MSI domain driver is loaded as a module
(after boot) this driver is probed again and succeeds.

> Thanks, Vladimir

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
