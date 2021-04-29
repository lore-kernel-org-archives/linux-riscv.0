Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EB4C43462
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:26:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ABD861447
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ABD861447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L8dm8+Tr7aZDHzeljp8iu7HTTpBN8+fb8zv9FVdcCpo=; b=ElVL9YzMMeAsSgG0fNlKs4ML+
	iplrY8UcwrBR8+ifOCied9WHuG4hd11WaTx8t0lCMhnZ8eBZXnadzH2uokX0J2BIaNGJSX+7uJxuZ
	lQkM43zmyW+IRiQq4AJHz3PmYMDyILlDSUP48FOF/oCQ9NtQKR4o7Q2w1eTL9BA1JKWbR5zDEnEZ2
	1O2Bn/Sj1/8Vl0sBjc5xXd8QsbaADDOQRnJds3wwrMJP/lcpQ8csdCNBiaaoLmyakWhq6e2FoQist
	sOGHqxfFkTdZaRSiLOe4GwfjOC8pZT7q8aLIAOlu9EbvfQfKM4FFZC3Bc55FqxF1FS8wDdvLN+PvU
	zyyb4Fvlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc07W-00540I-Qp; Thu, 29 Apr 2021 06:25:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc07S-0053x4-Fj
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 06:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=5V9zWyCsSWRyBJB2YSVQw8NdRmiQnJFEEv4u2i4PnwY=; b=wGeeoKSDAR0rnGCm6VClDZmGir
 6VNQVq7/kpp+G2ypREheJ+9Pm6Z6GNohcWw0BtQojeqrOMQsjFtVAra1Mx3CvuLlJWQjAL+K9aawu
 xKQodEUGVVqHr3WlaBy+nWQK97A78/onJC1luMVW+AFVyqMJjOtKQCUXmEg/bGbFdtn1veydlaBQ3
 Rz9RTGhIWiagQPsSIp5l1o3sY/SajF1ikBGqL5XdJXsCxPw9MWw5dMjwfd2JInqrJhaGSejcKlaDV
 Vk6p+o+Pb/LcIj2c6VfW/FO4GwVeDp9dMuPWY2P44vIqbbLqMPE73qksI6RSwv63T/IQbrltwuPiK
 0TQu1R5w==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc07P-000PO7-PG
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 06:25:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso10414491pjs.2
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 23:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5V9zWyCsSWRyBJB2YSVQw8NdRmiQnJFEEv4u2i4PnwY=;
 b=xYVcMr3ofFj5i8PN9JdEri3Np4iIZw7dwiY5dz3koxZHQZlw6qzIesVy9Tdm5nptCX
 q/6WRreGc6Ecx/7uH7e3QEoo5pnDlT6dLo0EfFdoDEHyYlSCwICDB7IXLWOIfe69X7Oq
 lHXQc3gh2RDvIXAxvti9Q13W5P9YtDyOU3gXNZ2plvz4UZM7r6cWtebTdcdbsSemWZL6
 o2+YmBGdpAQcw65K2jsvfqaRoYMnVcVEBqdqEGXVvqJW/5+kBV5/hhhSHt2WPOFJi81V
 WGa7QQKqizVxyyHcW2ng8rD/z3y0XwlGsueD86iKNz8e9UOaeN56QIa4LsXBeAb5VTN+
 vS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5V9zWyCsSWRyBJB2YSVQw8NdRmiQnJFEEv4u2i4PnwY=;
 b=i/WJfu7KJjyTp9ZUfeCwYXMtHLF9HxlBtj1yIpaYOSWL1K5qUyiPK8a2bfcK7wXu01
 Wx6lWBywmsVAWPNW7xZW3thFQr3o8RgStkQXW0qMYgxAWOPzQkrtscLRyzLdCHxI6dqg
 CBsSkIFDI3OnDBo26nDj2kzaRl2/XfXRF0/MPCF9dDhUW5S3AJgr0aJS6VU0yWpC+7iR
 n+pJlqbbjdGusQd6duL2ZcqARNR+jTguMSxMUlAeGwrBhF58eqEqTpASLTOIidsInSlm
 +MSiSHKb7LRqWj7o5+B6AIMqDzbwG8+Gu5rMhBlqlbWfMwIX3QGclVc1cERgi1h1r4T9
 G6MA==
X-Gm-Message-State: AOAM531SvB2seFCx7cG/Nqh1u6sufOVYfRzPDmwjBzYbneOU0/uGA7Zh
 Ordn6cZHCM86BY4NRK7AXKIfig==
X-Google-Smtp-Source: ABdhPJyvbZmSwXCAkBT6VXeFS0m0xx7jYkh+Y72sntlPebrrA2MZNLeiZAHznGxx0KddljLghUMIMg==
X-Received: by 2002:a17:90b:e07:: with SMTP id
 ge7mr5367645pjb.204.1619677546961; 
 Wed, 28 Apr 2021 23:25:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e1sm1446766pgl.25.2021.04.28.23.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:25:46 -0700 (PDT)
Date: Wed, 28 Apr 2021 23:25:46 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Apr 2021 23:25:44 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix 32b kernel build with CONFIG_DEBUG_VIRTUAL=y
In-Reply-To: <20210428100217.15964-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-e465b5c3-6c0d-4192-adf7-b4e7f8a76a76@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232547_838580_A2DB5EBB 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 28 Apr 2021 03:02:17 PDT (-0700), alex@ghiti.fr wrote:
> Declare kernel_virt_addr for 32b kernel since it is used in
> __phys_addr_symbol defined when CONFIG_DEBUG_VIRTUAL is set.
>
> Fixes: 2bfc6cd81bd17 ("riscv: Move kernel mapping outside of linear
> mapping")
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index e280ba60cb34..6a7761c86ec2 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -106,9 +106,9 @@ extern unsigned long pfn_base;
>  #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
>
> -#ifdef CONFIG_64BIT
>  extern unsigned long kernel_virt_addr;
>
> +#ifdef CONFIG_64BIT
>  #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
>  #ifdef CONFIG_XIP_KERNEL
>  #define kernel_mapping_pa_to_va(y)	({						\

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
