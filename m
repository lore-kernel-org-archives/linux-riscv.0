Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5562C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4L/tk2K+78Xe++QZNc8cvUxYDoMAphTThrx+L/djgc=; b=XnMIqEKXxEtLGL
	zHD0H45E6J26WgMugyT1dpH2NY7JXsU7uNpG/luTFjiVM0lIhKSaGGUgPAvFguZHEe3cQ2yeBskay
	qdRaR5W2vz6UDAju6JVPZ8vdSK1qyvqVsFfZdEG1ORCH1UdvBtEAgB1Z/QvpyJPtlSUPCa1G+kdgj
	t4XwjZc9tnaXC51AHaBfymW/SsS87dj1N/IIr8ri8gJOjbIL3j/nJNemStGZcUvb1fcH9hrMcbNP3
	UFJFJp/g2Q2Ak8HaQyq8OA2UiD5WsR1yiiSvNi10Tn0jmaFn3XY2mOTLVgKggzXSX9ryy7JYz+E49
	VsrWUUuoyDm7lrilof2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1przkH-006PUj-0v;
	Thu, 27 Apr 2023 11:25:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1przkE-006PUG-0v
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 11:25:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D45D263CCB;
	Thu, 27 Apr 2023 11:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904A4C433EF;
	Thu, 27 Apr 2023 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682594701;
	bh=OzHT2qTnSZ/6rYXPLMQadBazAPcPJebviyobz9E7whE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aJPmoZ17dQ73Ug2IUwCqoxjDTxPx9zMuQsrD9UBTnRHOXJrPMnB7IJBSleExAS1IN
	 NXYePCad8txcaRNN+9Kk/gc79S7QdE8Z1ddbQ4GvBYwaJ0P0lyZ+5wRlNHK20+YP7y
	 PZsASASJEsd01fDIwGh6x8ImfhrftlDGDom4jBDdFm80zq8faeriS8VVnmwld1iEHr
	 xwmqGDzFeXl8UaD5VlwsGlq/5XUD0HmybYIQo/XOc4gYG5R3yCyBeeETNPXHeKH3Ya
	 b5iqyCc1BGcTwbwtKjk323DB8VOBBHW/u4wehct6e2PUm75ajivs3ESk8JxR2OWRyK
	 PFM55Tzy/LI+A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Weili
 Qian <qianweili@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "David S . Miller" <davem@davemloft.net>, "Rafael J .
 Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V4 05/23] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
In-Reply-To: <ZEpAHfccImGsJGjk@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-6-sunilvl@ventanamicro.com>
 <87a5yua8vb.fsf@all.your.base.are.belong.to.us>
 <ZEpAHfccImGsJGjk@sunil-laptop>
Date: Thu, 27 Apr 2023 13:24:58 +0200
Message-ID: <87leidtvn9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_042502_365455_50DDBCE1 
X-CRM114-Status: UNSURE (   8.36  )
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

Sunil V L <sunilvl@ventanamicro.com> writes:

>> An observation, which can be addressed later; The acpi_os_ioremap()
>> (called when the config above is enabled for RV), does not have an arch
>> specific implementation for RISC-V. The generic one calls
>> ioremap_cached(), which on RISC-V defaults to ioremap() -- caching
>> disabled/_PAGE_IO.
>> 
>> That is probably not what we want, but rather something similar that
>> arm64 does.
>> 
> Actually, for RISC-V acpi_os_ioremap() is currently a wrapper around
> memremap(). Sure, this can be enhanced in future if required.

Yeah, realized that when I continued thru the series!

Thanks for clearing it up!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
