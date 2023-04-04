Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA23C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BfEd6wYnKlmhcQUDaY6QR/MRt4ZxBzP0WkW6MerCCI=; b=SXZaUL6T5SsAEz
	7Azgu7wYf0DDU7sW6YZwLI1wtvvR1XDOP85/SdsMc7Lw3iaUlGVHuwwrMwr7gniWMJhfcrxK8k8bC
	EgvBlmgGZ9D6WX8lDAvCm7W5v0DAxDNikJFZv7i+nwbEfyAYzhg4cVMqwuAFN+n3j+cjPgX/DgCOe
	Lujlpu9thDjqoQow7OMhnTHfpiU6vQFrwQxcc0NB3VlLryV+iixAtxW446VbboNyeTtSgXe1d+S0A
	zXWkiT88nF2GiE8CDqHGpuUxRyZo3egPEetxx6ugd4LQTGRw11BzCJPWJDmPP0FfSex3+6/0ctXJ3
	HAb/onikyk3uDxIbKLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjinT-0022n3-1O;
	Tue, 04 Apr 2023 15:42:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pjinR-0022mB-2C;
	Tue, 04 Apr 2023 15:42:09 +0000
Date: Tue, 4 Apr 2023 08:42:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <ZCxFUb8+eQPzqBmo@infradead.org>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZCu1tFrQCVe2sgNz@infradead.org>
 <OS0PR01MB59224C99770F84D8CE2D0DBA86939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59224C99770F84D8CE2D0DBA86939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Tue, Apr 04, 2023 at 06:24:16AM +0000, Biju Das wrote:
> Just a question, how does function pointer makes a performance difference compared to
> ALTERNATIVE_X() macros?
> 
> On both cases, we are pushing function parameters to stack, jumping to the actual routine
> And then on return pop the variables from stack. Am I missing something here?

Indirect calls have always been more expensive, and with the hard- and
software mitigations for spectre-like attacks they are becoming even
more expensive.

But other other point is adding more cache flushing variants should not
be easy.  Everyone should be using the standardize version.  If it's not
implemented in hardware despite having ratified extensions you can fake
it up in SBI.  Yes, that's way more expensive than indirect calls, but
that's what you get for taping out new hardware that ignores the actual
architecture specification and just does their own made up shit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
