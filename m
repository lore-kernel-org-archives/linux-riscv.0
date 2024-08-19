Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D005CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6rOt+JhvKMJ8w03w7weGGyk+sOXKF//bfTCPCwiI9Q=; b=lAzlgQcZLHqP3m
	ecRDayWujvn/tHAERFdD2jjoXHT8dhmIlfJbRifL681Qe/OWrqfsgu4TFjadkrP1SkqvOvdWPtWF3
	yH3qZPyet9BAs6uSYPzVRGaAuj8lcVnzpR6kQvKu60GE4HjmUCOf4pXeDGWPo4bcR+AMV3T31dflw
	4xQEt9da+BKq0InnC0qjMEkI4/l2PKjZOqMKgIcIeTwPHKbTroAc5yOjeIKppBt46cpauTXk0/I7/
	iJyOWYllXKcB9RKeuivy3fw0NmrmvEuZ51VdDaUocqZbNmZVhXbjHqTl917bzhuEVWXLGpMEyIN8F
	tHFlUdwLf9kCFjATjFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg8Jj-00000002lQX-1rn1;
	Mon, 19 Aug 2024 19:45:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg7Iu-00000002cVF-1Wof;
	Mon, 19 Aug 2024 18:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFD2560C88;
	Mon, 19 Aug 2024 18:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383A8C32782;
	Mon, 19 Aug 2024 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724092831;
	bh=ZMbADLpUAELxGABAgnkEdvEemGcRN8dlaJqTQh3jz20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf3yuuM1xaQV1GST44D/askCKHwx3RLYMccgOWofU5ZQowzzd2wkHcAKj8q2/9jps
	 dWoDaTIPRud5AuoFw1vcPgEABHC5VQ6LtZPVWI+Rd+61P7xfAM0XghusGTHqqGAXwa
	 ZuWS1bQ5p18MAH42HP2ERd+ay+LdSVSO2DNyXUOlGZRZU+BWq8SAQ+pD1CzCsQNt0n
	 Yl0QmavVLBDvxe1bnFz8uRC1/IMU9GRj+viqsIf26HyBNL+1YlG61oc5g45sk30HhE
	 2aLe7pJ8xurVdeYOentskQg+vTtgtPrxjluAjbRzcxHR5eOHS8Yv8Xc/d6VU8RgR5J
	 AKJCdvos/PpIQ==
Date: Mon, 19 Aug 2024 12:40:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, Anup Patel <apatel@ventanamicro.com>,
	linux-mips@vger.kernel.org, maz@kernel.org,
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	saravanak@google.com, paul.walmsley@sifive.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <172409282414.2143677.12162426898759329021.robh@kernel.org>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817074107.31153-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_114032_539813_857FDDCC 
X-CRM114-Status: GOOD (  16.72  )
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


On Sat, 17 Aug 2024 09:41:08 +0200, Andrew Jones wrote:
> An 'msi-parent' property with a single entry and no accompanying
> '#msi-cells' property is considered the legacy definition as opposed
> to its definition after being expanded with commit 126b16e2ad98
> ("Docs: dt: add generic MSI bindings"). However, the legacy
> definition is completely compatible with the current definition and,
> since of_phandle_iterator_next() tolerates missing and present-but-
> zero *cells properties since commit e42ee61017f5 ("of: Let
> of_for_each_phandle fallback to non-negative cell_count"), there's no
> need anymore to special case the legacy definition in
> of_msi_get_domain().
> 
> Indeed, special casing has turned out to be harmful, because, as of
> commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
> as a MSI controller"), MSI controller DT bindings have started
> specifying '#msi-cells' as a required property (even when the value
> must be zero) as an effort to make the bindings more explicit. But,
> since the special casing of 'msi-parent' only uses the existence of
> '#msi-cells' for its heuristic, and not whether or not it's also
> nonzero, the legacy path is not taken. Furthermore, the path to
> support the new, broader definition isn't taken either since that
> path has been restricted to the platform-msi bus.
> 
> But, neither the definition of 'msi-parent' nor the definition of
> '#msi-cells' is platform-msi-specific (the platform-msi bus was just
> the first bus that needed '#msi-cells'), so remove both the special
> casing and the restriction. The code removal also requires changing
> to of_parse_phandle_with_optional_args() in order to ensure the
> legacy (but compatible) use of 'msi-parent' remains supported. This
> not only simplifies the code but also resolves an issue with PCI
> devices finding their MSI controllers on riscv, as the riscv,imsics
> binding requires '#msi-cells=<0>'.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
> v3:
>  - switch to of_for_each_phandle() to further cleanup/simplify the
>    code [Rob]
> v2:
>  - switch to of_parse_phandle_with_optional_args() to ensure the
>    absence of #msi-cells means count=0
> 
>  drivers/of/irq.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
