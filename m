Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1ACC021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xB5U4mu9DOdzZWkLm/8qFbMyisHKccDn8LUP/eDB9W4=; b=0+9yVFtx+FFB4i
	2zKw8Tpcoh6z/T4fO8vYJlspocVargna8PqFsl0aqmb5KS4+Is6mXoPfNFi3jLfC5l0KZJTx/Osy0
	bPbLa0tn45AkMA+8l629jPYYAJFJrSo4GW1G3BkcOexP7AN5Phtxi3ZSu9z8rsFWyICXEbifnq48n
	MttsHi+dgrj35axjre0ImkKW68pgCGYJX1tgIyqOSpUejvMis6J9AkqgrkVZr4h4xGVX01qRkovS7
	Xq1wdlHuR7cBkNPNzZGSZk/fPCvqntv7CM0Sc92G/56hqKYb5ST5gfYsqVSpCd/6ZW/1Q6K8vrW0e
	aEUs71nyxiCmlT/M4Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJeR-00000004OGr-3hKB;
	Wed, 26 Feb 2025 15:48:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJav-00000004NV9-1qK2
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 15:45:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740584707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9YAfmlQr9Pd5bXVqXHzhDo0hk63Ti5/f8ktIw5AJhI=;
	b=Kv9/3dWd+GXsGs7cU1xLIlW2zlePQy31R7G6Jy6QJFpJYBbsDogO0A4tPcqH2iqy6FlsJ+
	YJk/B9nxmFA+MHnOA5EB5BazjUZeXo6ZO2GhQ0a2odsrE0E5pf/JF4UlNInVv+1AS14qV5
	8SDQwtT8m3Jp50XfzUOOsnhjBuO9ZK7WHUIDQO/queig6lykW1ZfuXsqIi1NE7RNtPwL/c
	1ubsW8nlIrnKz0QuzMEA1aFYFs2v2rCg2zxSeLSQ1ne86Cq4FQpOeD1L+HwRiy8DIZuPoc
	uo9TcSrDqf/s5V4bB+NkfCaTvTvtKgOHTjpU0X8aujMZabOz2GZ7wsVL2CLN5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740584707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9YAfmlQr9Pd5bXVqXHzhDo0hk63Ti5/f8ktIw5AJhI=;
	b=ixIkh3m0apqeFPy9Qpy7CjIrvlJ4/WlAEuk0T/7wkqfv/ktP1pgsZB5HNeC5O7xJsKatxe
	FnzDFatK/PE7L1DA==
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
In-Reply-To: <20250226135635-GYA45740@gentoo>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
 <20250226010108-GYA44567@gentoo>
 <CACRpkdY7nzzu3-+FwpSYqmX+O559LoXHiqcvP2OxkhX+9f-3wg@mail.gmail.com>
 <20250226115957-GYA45508@gentoo> <20250226135635-GYA45740@gentoo>
Date: Wed, 26 Feb 2025 16:45:07 +0100
Message-ID: <87tt8gemm4.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_074509_615176_540D477B 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26 2025 at 13:56, Yixun Lan wrote:
> sounds we need to implement .select() or .match() in irq_domain_ops,
> then find the irq_domain.. here is a prototype version 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 995e5e0ec2db..c4d18267e86e 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -553,7 +553,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
>  	 */
>  	mutex_lock(&irq_domain_mutex);
>  	list_for_each_entry(h, &irq_domain_list, link) {
> -		if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
> +		if (h->ops->select /* && bus_token != DOMAIN_BUS_ANY */)

This breaks existing usage and reintroduces the regression, which was
fixed with the commit which added the bus token check....

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
