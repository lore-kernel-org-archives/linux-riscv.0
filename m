Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E066C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 22:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg4AfBnAMmIYa3NIUCmR+ZYx0cJAyzsTj64NnxYzsa8=; b=ax0W0e4jk0Zckp
	5vw+Vse7Y1mvJt2jodAF7VBbohQTAKGDTSfqSwZ43VXGNOyGxaGDOuWd2dDymwbMYuBfjcARo6AhP
	CHEJQxYcY4LI7CWAZ9PBCB/sncF7iIdoHNm8a2AG8IX3Xcrc2FzcjCDjYxs573iguYy8VTBemgjfG
	2zWA/ZC3xoXWzjwHuFYUlEg1kpihnxMvPU13P9EtHJvRa9P2OvTamZc+plQEElCIIevGcJJ9aTk2l
	PC7U9a8JiSFPh64fGafpHXokMC7Ums96OsAiGPsi173oS4ou7lLl0wqOL/Iaya8uSbbprYp/G1U8e
	7dc8gKLbaE6vYOTbv6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQv5-0000000An6Q-1gQD;
	Fri, 25 Jul 2025 22:29:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufQv3-0000000An66-0FiV
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 22:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0471DA5666E;
	Fri, 25 Jul 2025 22:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79510C4CEE7;
	Fri, 25 Jul 2025 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753482575;
	bh=gABZbOMCUDaNPWraAqPJ08OxTPzW8PQCbw7+hnKqXco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LddgLhr7mgQ2rM9G+mB/U9CkbT6mANQs+5CbAQP7pTUMOMzNDpwHhc/Qji0XwYEh4
	 ktYR3KOhO7SNEK1T+X0+coi698Mo5cSLgPb4CzHWIix7J76Qa92KEdBPISYiiYCZ2H
	 Dt/HIhA2f+c/wDyqp6EKON9KGzdO/PejNviuuIthT6CwinkE6Dwwx/W0bcZWitqtcl
	 csjUULRCxzcHCeEOsWK5Ir7gxoQxfmiVSyFl6iMe7Ir3av0imnSkpNO+3/RYCNSqF7
	 1pH0wU53Hd4DZZ4i39giAIZwcORG7TRTNnNKyxs+ru0fhtJYcyvQUz0ehV4IEnkGsl
	 MsAfHRQCMrHlg==
Date: Fri, 25 Jul 2025 17:29:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH RFC 04/10] dt-bindings: timer: Add Anlogic DR1V90 CLINT
Message-ID: <175348257391.1950049.10218208547185479319.robh@kernel.org>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-4-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-dr1v90-basic-dt-v1-4-5740c5199c47@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_152937_167970_88AF7DE0 
X-CRM114-Status: UNSURE (   8.80  )
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


On Mon, 21 Jul 2025 23:46:10 +0800, Junhui Liu wrote:
> Add CLINT support for Anlogic DR1V90.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
