Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73452C4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 15:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4688C61151
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 15:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4688C61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbcw9k867RP+4X1SR2NETOxrfOr1JXLYs+INoryG028=; b=eINnP63Jn7qD1L
	CeSdUD5/KASwb5JWPxYXcmYP7qpNH0Q8JKVKMbygAMSQRIe48wPuEXpUxgX/J0Tcs4b3lwV5J9Wm/
	Jr/mzjivNBx+ZvzCW2oKvLMZG+OBuCdxOR8XrsZd+aiaUfpz/vhWYh9AQ4KuGt6jKHWo5cliUrW1E
	MkP1+eHY2tIzikZnAWWmYOTnCdJ4u39GrxYnewiS5esj++sIFR4azSV0y30XWOPZQwi4e/P2pcC5D
	qek9W9D8Nn8aBreEEMAyMrEtjv6YEHqLUgfFyLqU/hgs8wF2X0pZYWTGSAH42ShZmCsq7rEgX9LbP
	4cJTOIL4klQQvN171Mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLWo-003sVW-AD; Mon, 21 Jun 2021 15:07:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLWm-003sV1-Kq
 for linux-riscv@bombadil.infradead.org; Mon, 21 Jun 2021 15:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oeYSpEhZE6AmPfNM4+w2zYj9of/Mlvcohb59Uj+RS6k=; b=udr+eniEeQRB22JbVElibG//cJ
 jzbNGAnVUOEydkIjCnfG6UGKxmHS1FCLO+SG6Nqk/MRjZAsp6OTxGdLZ0/NTJ8gylehMPZumiy9bD
 okUbzqXaVAsuZNXwekXBiY87c4qmHinOcPEd+G/XQkA+MBGWZDGr+VMRCYEeLnk+hmFFKkCWOtFLd
 DFKCIUEYgJ0Nkp7dxCAbfsfR6ELNt2yzZ70YVG9a2ujinF/R4xcpGw9pjRQ4cmmWVrids6gdUebz9
 xASPeX1lOUQIHo6XN+wdWzZhl4epihE+TQdpMy+eDRuOTU+c/0ZfodNchXxRooJgsDcGssghKkuKR
 5eFIdWXQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvLW8-00DDQH-Lf; Mon, 21 Jun 2021 15:07:21 +0000
Date: Mon, 21 Jun 2021 16:07:16 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] riscv: Map the kernel with correct permissions
 the first time
Message-ID: <YNCrJMb7aO16XHg3@infradead.org>
References: <20210617131734.1923932-1-alex@ghiti.fr>
 <20210617131734.1923932-3-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617131734.1923932-3-alex@ghiti.fr>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jun 17, 2021 at 03:17:34PM +0200, Alexandre Ghiti wrote:
>  
>  void free_initmem(void)
>  {
>  	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
> +				  IS_ENABLED(CONFIG_64BIT) ? set_memory_rw : set_memory_rw_nx);

Breaking the second line up woul help a lot with readability:

		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
				  IS_ENABLED(CONFIG_64BIT) ?
				  	set_memory_rw : set_memory_rw_nx);

> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +static __init pgprot_t pgprot_from_va(uintptr_t va)
> +{
> +	if (is_va_kernel_text(va))
> +		return PAGE_KERNEL_READ_EXEC;
> +
> +	/*
> +	 * In 64b kernel, the kernel mapping is outside the linear mapping so we

Spelling out 64-bit would be nice.

> +	 * must protect its linear mapping alias from being executed and written.

And please never spill comments over 80 characters, as that makes them
completely unreadable.

Besides a few more overly long lines this looks great.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
