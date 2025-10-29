Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C77ACCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbvmwWrArdWEzin7+2yY7kK8jCO1ybHsAJP0KRVZGJY=; b=dvkOuJrCGwZbig
	I0TgpOQUoZmLba39eV6ZjSoRj9kDl+cwYOIxbTvTEAR47d+ZZ1bxcCy4N4CDDGkK8RIxvIiiyEzo/
	F9PdVM9BIhrrzGCj6VYiXk9At0ZXEON8xGXDNzCxfRht+XhIcsdYfvSIDKBHjQBnD81Vs97JX/IAL
	YIU66jr7JknpIwKbDg3UyLoudnHr6q6pm65xXGG3jr/lRr9buwMwKIcCyQgWwf/le6HMEK8/vH13K
	PKCX0xKSmX1kcjALJf+f04ad4lgLVXHkQUdEBZdrxNQiAuEPD5rpl3NsOQooixi3v6PnPqcGkYevo
	yxOA2m/4dvehYI8TkTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzBC-0000000HOTY-2f7J;
	Wed, 29 Oct 2025 05:57:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzBA-0000000HOSf-0wFC
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 05:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56DB043611;
	Wed, 29 Oct 2025 05:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D585C4CEF7;
	Wed, 29 Oct 2025 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761717423;
	bh=e+hYAF80RGk08jB65h35DfRu85xR11EJdxJCJuqcKwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGPCgxf6ZFqrptSm7Jbd2ngFAvekoHnAfI2QRFg+UAXVx/ZfObVYO0UpoGBZmfbK6
	 frf5Txgvj2WkVGHsPSMa8xP/7Rns9lqtjrjQtnQS37n+FgVgxLorqXXbg9dvBgMi5T
	 /At36bRTs6tqlVSTb2ue0aDU8z7KneZEXc2gXAxiPSz7NYyPVXN5g5kK2/sjXZeelf
	 c6VlfRwU6Hz5qlllhowkhvpuhePqeN7/xVrzi2oxzW9yFcBOEZI3B74TWSM7nPW6vI
	 P8MsTizs6Zhrjf32zhmEEBUakLJd9yHQSVuqVtvrIOuoO79jCLkAzm27zx8YuyWKGW
	 ohx61e17+dygA==
Date: Wed, 29 Oct 2025 06:57:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com, 
	paul.walmsley@sifive.com, samuel.holland@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Add initial Milk-V Duo S board support
Message-ID: <20251029-successful-pristine-ara-bd4d23@kuoka>
References: <20251029001052.36774-1-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_225704_284991_C010CEF0 
X-CRM114-Status: GOOD (  12.41  )
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

On Tue, Oct 28, 2025 at 08:10:47PM -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been
> tested with ARM64 and RISCV64 to boot from an SD card, have
> networking, and read I2C slave devices over i2c4.
> 
> v3
> - Added sg2000 interrupt controller and timer to documentation
> - Added sg2000.dtsi for RISCV and moved DTS over to use it
> - remove devices from DTS's to match what is available in the
>   default pinmux config. spi0-2, i2c0-3, uart1-4
> - Added i2c4 and spi3 aliases

How did you resolve previous comments on bindings? Nothing mentioned
here.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
