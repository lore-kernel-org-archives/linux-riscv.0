Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2F2C31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 15:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30111208C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 15:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2pw8eWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30111208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lgs/ijrToHVGfv+Xe0xGUE9me9NuMU8N6LkET66UKO0=; b=A2pw8eWgQPNKM3
	+PvvdDCp1Qwv1aIV907rxUvVp7ybRBwKnW9tv169QLhv2UJh2YhV0bihLLX425zNZUABwNpxTIGQF
	DW4tQsNBhZLpchffiKOItCSNs++6d8c5kMnodJF49wF3iQmOSuJlNndYd/IIpd91kAL+f0dCYa2yt
	oIBSfQatcFY5XrztnBWnzUr0NMxRG+PX7p+1nQA6wYzmDbWN0k0vO+bEMHKJidvEgS45VI773W6fh
	eNGYfC3As4ao1gHqkZXUIoKRef9BTY6o7XGivx/MAUe6laUjd9IufCW2FsLtWTY0hEKYcmFAfrF4N
	ZZ6u1ZDb1lL3TpbGIytg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxBpx-0005ZX-3k; Mon, 12 Aug 2019 15:02:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxBpv-0005ZL-CF; Mon, 12 Aug 2019 15:02:15 +0000
Date: Mon, 12 Aug 2019 08:02:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v5 PATCH] RISC-V: Fix unsupported isa string info.
Message-ID: <20190812150215.GF26897@infradead.org>
References: <20190807182316.28013-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807182316.28013-1-atish.patra@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +	for (e = mandatory_ext; *e != '\0'; ++e) {
> +		if (isa[0] != e[0]) {
> +#if defined(CONFIG_FP)
> +			if ((isa[0] == 'f') || (isa[0] == 'd'))
> +				continue;
> +#endif
> +			unsupported_isa[index] = e[0];
> +			index++;
> +		}

I'd just use if (IS_ENABLED()) here to get full compiler coverage.
Also no need for the inner braces.

> +	if (isa[0] != '\0') {
> +		/* Add remainging isa strings */
> +		for (e = isa; *e != '\0'; ++e) {
> +#if !defined(CONFIG_VIRTUALIZATION)
> +			if (e[0] != 'h')
> +#endif
> +				seq_write(f, e, 1);
> +		}
> +	}

This one I don't get.  Why do we want to check CONFIG_VIRTUALIZATION?

>  	seq_puts(f, "\n");
>  
>  	/*
>  	 * If we were given an unsupported ISA in the device tree then print
>  	 * a bit of info describing what went wrong.
>  	 */
> -	if (isa[0] != '\0')
> -		pr_info("unsupported ISA \"%s\" in device tree\n", orig_isa);
> +	if (unsupported_isa[0])
> +		pr_info("unsupported ISA extensions \"%s\" in device tree for cpu [%ld]\n",
> +			unsupported_isa, cpuid);

And I'm not even sure why we care about unsupported extensions.  Sooner
or late a few will op up and they should be harmless.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
