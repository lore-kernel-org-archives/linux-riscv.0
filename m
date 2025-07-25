Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AC6C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98Y57/fYxDeJ/MJ2ipXvV0FT2J/BxhWsjbF0D1VMtn8=; b=zgecuvDsgJlJdE
	e6qk4zrUyiImH9KZwwm43ZQv1Q5FRYVpYftS83xG3U5pWBZgCH7gyl9sVWOmuWzudl1/KAgvT4B07
	cgEyP5XQvrY0TyHkzNZ/227gHbUP5mthJvvzJfMoR732Kq85WQkcPp/PULWLfDn2kWclhY17JSUxf
	UfUNqyDK8M4wePCdgq84dqUHbN2M4/RKJ3b+q4Kwpk48UzRiMOflmGSt6R/ymHsaIIl0NTfpnQODJ
	Y5CeD2XZz4nsqHWjrj6l8Uz/bC9I1KRb3l+J4VLhy+rXUMWus1Z5yPMTE6YZ77FyURQ7IbroxynDy
	ykTAre+eCf+tu6QJT4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQvV-0000000AnAf-488L;
	Fri, 25 Jul 2025 22:30:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQvT-0000000AnAA-2qAU
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 22:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 017CFA56751;
	Fri, 25 Jul 2025 22:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A89C4CEE7;
	Fri, 25 Jul 2025 22:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753482602;
	bh=aTk1baJauPVy9kyysWM7wg/om96SyQAhBaQ0STr1Sns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3xWzfDn9oK86XHoFYy9UyG3hyAJhOoD7gpBgz8JWOIfzi5SMFItyHVboQgc1TqKb
	 HFA9ahrgeomwjbtfozFtAxzf8k9rBIq7S7dHYCrl2o3kOddZokqqGVm15pBhGDb8KC
	 PyKLSvG0XNnBoqbHOc5nUBIFfD5MJhgTvoS9UPo+TDjRSTmKeBNyr1ZiD33Mt2jxH+
	 GxM2jGIdGtM6fdved1fHMLkN/V9XiepV1D0GkJu2wp6RiOHg/Xi8fUSfZvp58snyf/
	 QrZOOKdb126BAIus36KplAFd2SZ8t1IlLzsSjd4CpczIqN45ocXONc8wh9lGxQFpyQ
	 k1dMEkCU4oI2w==
Date: Fri, 25 Jul 2025 17:30:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Jiri Slaby <jirislaby@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH RFC 06/10] dt-bindings: serial: snps-dw-apb-uart: Add
 Anlogic DR1V90 uart
Message-ID: <175348260118.1950815.4384320284007344403.robh@kernel.org>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-6-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-dr1v90-basic-dt-v1-6-5740c5199c47@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_153003_782691_75BB1152 
X-CRM114-Status: UNSURE (   8.56  )
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


On Mon, 21 Jul 2025 23:46:12 +0800, Junhui Liu wrote:
> The Anlogic DR1V90 SoC integrates a UART controller compatible with
> snps,dw-apb-uart, operating at a 50 MHz clock.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
