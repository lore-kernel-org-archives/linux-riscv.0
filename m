Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C42AC46CC8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVXF9dZmlS1+5w3hdDH3m7+Y40exDc9phViTu6efFdY=; b=jHiptccvX+Y1CO
	RXGLwW9kRsgnZuiNbYRg6ijmG15daCBm3j9T3zTs2XazMMjLE/vRkMMfCDaFKteGMQKD1p33jM+KR
	dJyjMwrUcB/yezQadJ6ZYr11+aOseOQmP8xKcfeqrh6piF8BsN05/aCPu6jtJbfgWdOzV3QO8fkJj
	ph8mBWTnoKp3B9ULzc6zFLduMRKPBscwRYoleE1mr+fkkhve8DXW1h0Qyk8kEk/+SzlwHl5jYQffm
	T3+i8tx2pZtRd3Tr+6j1GuzYDdH53tMRIFurb+tCcjDZIjk3UMjXjivogXPbC8lZCrslZwIWtYR2s
	ffFQ9mtCx4/77+cfUYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r32fK-00GxqL-2H;
	Tue, 14 Nov 2023 23:17:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r32fG-00GxpD-28;
	Tue, 14 Nov 2023 23:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23C74CE1940;
	Tue, 14 Nov 2023 23:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDD5C433C8;
	Tue, 14 Nov 2023 23:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1700003866;
	bh=KB3X/TgdZDL/2SrctEZtbC9ABrG1q5tejZewZjojaG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I2FtgASHqT0NQ8pvMyoHDKY0L776FVzQEP+8MaG5h3awzZ83eZZkVJ5tDMyqMY0jb
	 uNf09+vkik6GFj+3lMsunyHL6E+r2LTs8yQweYL9C7/V0/hHwRijTrIX+w/vU+Tbus
	 VWm/hOguMarPwLXKltXgnv9nM3o8N2knOblTYH/4=
Date: Tue, 14 Nov 2023 15:17:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 ebiederm@xmission.com, takahiro.akashi@linaro.org
Subject: Re: [PATCH 1/2] resource: add walk_system_ram_res_rev()
Message-Id: <20231114151745.e77ed504b3fce325f54ec08e@linux-foundation.org>
In-Reply-To: <20231114091658.228030-2-bhe@redhat.com>
References: <20231114091658.228030-1-bhe@redhat.com>
	<20231114091658.228030-2-bhe@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_151750_876246_6CCE2567 
X-CRM114-Status: GOOD (  19.45  )
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

On Tue, 14 Nov 2023 17:16:57 +0800 Baoquan He <bhe@redhat.com> wrote:

> This function, being a variant of walk_system_ram_res() introduced in
> commit 8c86e70acead ("resource: provide new functions to walk through
> resources"), walks through a list of all the resources of System RAM
> in reversed order, i.e., from higher to lower.
> 
> It will be used in kexec_file code to load kernel, initrd etc when
> preparing kexec reboot.
>
> ...
>
> +/*
> + * This function, being a variant of walk_system_ram_res(), calls the @func
> + * callback against all memory ranges of type System RAM which are marked as
> + * IORESOURCE_SYSTEM_RAM and IORESOUCE_BUSY in reversed order, i.e., from
> + * higher to lower.
> + */
> +int walk_system_ram_res_rev(u64 start, u64 end, void *arg,
> +				int (*func)(struct resource *, void *))
> +{
> +	struct resource res, *rams;
> +	int rams_size = 16, i;
> +	unsigned long flags;
> +	int ret = -1;
> +
> +	/* create a list */
> +	rams = kvcalloc(rams_size, sizeof(struct resource), GFP_KERNEL);
> +	if (!rams)
> +		return ret;
> +
> +	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +	i = 0;
> +	while ((start < end) &&
> +		(!find_next_iomem_res(start, end, flags, IORES_DESC_NONE, &res))) {
> +		if (i >= rams_size) {
> +			/* re-alloc */
> +			struct resource *rams_new;
> +			int rams_new_size;
> +
> +			rams_new_size = rams_size + 16;
> +			rams_new = kvcalloc(rams_new_size, sizeof(struct resource),
> +					    GFP_KERNEL);

kvrealloc()?

> +			if (!rams_new)
> +				goto out;
> +
> +			memcpy(rams_new, rams,
> +					sizeof(struct resource) * rams_size);
> +			kvfree(rams);
> +			rams = rams_new;
> +			rams_size = rams_new_size;
> +		}
> +
> +		rams[i].start = res.start;
> +		rams[i++].end = res.end;
> +
> +		start = res.end + 1;
> +	}
> +
> +	/* go reverse */
> +	for (i--; i >= 0; i--) {
> +		ret = (*func)(&rams[i], arg);
> +		if (ret)
> +			break;
> +	}
> +
> +out:
> +	kvfree(rams);
> +	return ret;
> +}
> +
>  /*
>   * This function calls the @func callback against all memory ranges, which
>   * are ranges marked as IORESOURCE_MEM and IORESOUCE_BUSY.
> -- 
> 2.41.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
