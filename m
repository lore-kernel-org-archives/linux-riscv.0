Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126E0C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 13:05:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE7064ECD
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 13:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE7064ECD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gs9sPMGxKTZyPhypmoL7gH1zyStpSd0tBaa/TNtkHuk=; b=U4SKoc4RpqzuZNtTweDF0ioE5
	1qzyfjlKAC1pMfSS3W85f4ZW/06SkPyZ9GwUrdRHrZiwoxaCyl2WiqOOgbmCPL5q6abXFTqXnwI4J
	aGp7k0PZA+zQ6ONqkaryJUS7lntwCtfOgSGajIlxUAGd0fKiPm0xLuRs+UlOddM5DEFk1BBqEDIrZ
	gN94kPI4QgbtuUB+3libEYBbd6BF3Xqh1Ni+i18Vwt/8fQnI4zU38M0UVKJzbUkfv6Wf7YqVYczC/
	15C73xlEE01ndJFQU7HmPcf3FqI9u4eIpvNvuV2/8FxE864x1EvnastwYiRHkZgI5f+oayOZ5DUZa
	bEAJ3wIEw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNEoh-007ReB-2y; Fri, 19 Mar 2021 13:05:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNEoe-007Rdw-PV
 for linux-riscv@desiato.infradead.org; Fri, 19 Mar 2021 13:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qz1cDf8WGt0iQKXPvDOkiVWswKxwulwdSVWMyXpJmRA=; b=fx7+HF5Eg34vqLFlP7lF/k7jpG
 xlko/+xV2uDUDTl5LIs0mO0IzRGo5Cw0IFHrDQqyex1Sy7l0QQTZJGXhKfJGNwDMSSmO7VU9vRXTk
 NAR1RQE+0rUPJ6q62ItqGyfkh1yhM9HLyaval1ikxeZ9fyLM9eywgQJBB+JhnbXK1QhZL8iv60VEe
 OmxxjXvO/BPLnvS+iWhUMFDEt9pQMDNCcUe5zhYhM4w/+cxNpMWt4VspeTVDa6GdtfHu/PI73K8SC
 TGYaFpJ6ZdoeEKRwSeUD3h0+zzs8B+QTxi9vbAhq/qbBR7d+khD0XtxYLqX61+ZW3XGlWER9lXtlY
 qAoAfZ+g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lNEoU-004Qkv-3A; Fri, 19 Mar 2021 13:05:19 +0000
Date: Fri, 19 Mar 2021 13:05:14 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Terry Hu <kejia.hu@codethink.co.uk>, Arnd Bergman <arnd@arndb.de>
Subject: Re: [PATCH] RFC: riscv: evaluate put_user() arg before enabling user
 access
Message-ID: <20210319130514.GA1053613@infradead.org>
References: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318224135.134344-1-ben.dooks@codethink.co.uk>
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

On Thu, Mar 18, 2021 at 10:41:35PM +0000, Ben Dooks wrote:
> The <asm/uaccess.h> header has a problem with
> put_user(a, ptr) if the 'a' is not a simple
> variable, such as a function. This can lead
> to the compiler producing code as so:

Nit: your commit log seeems to truncate lines after 50 chars, you can
and should use almost 1.5 as much.

>   * @ptr must have pointer-to-simple-variable type, and @x must be assignable
> - * to the result of dereferencing @ptr.
> + * to the result of dereferencing @ptr. The @x is copied inside the macro
> + * to avoid code re-ordering where @x gets evaulated within the block that
> + * enables user-space access (thus possibly bypassing some of the protection
> + * this feautre provides).

Well, hopefully the compiler is smart enought to not actually copy.
So we should probably talk about evaluating the argument here.

>  #define __put_user(x, ptr)					\
>  ({								\
>  	__typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
> +	__typeof__(*__gu_ptr) __val = (x);			\
>  	long __pu_err = 0;					\
>  								\
>  	__chk_user_ptr(__gu_ptr);				\
>  								\
>  	__enable_user_access();					\
> -	__put_user_nocheck(x, __gu_ptr, __pu_err);		\
> +	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
>  	__disable_user_access();				\

It looks like __get_user needs the same treatment.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
