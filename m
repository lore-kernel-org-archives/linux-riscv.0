Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CE4C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77AD964E35
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77AD964E35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=3uc33LlW67tKZGcFabMNNKbtAjPgNmbgy7qUxqrN/eA=; b=beAlbtfE68d6XW1cT0wQaA4VQ
	mickmMI1YKhL6SlJOKnPKiykVbPXgugf7CSWYdo06JlH44Ho4Ns9EuoPZP7h1IwF0vg2FZ93gSRJH
	cGbUXXHI16CEOoBF4s7e4LLoWyvQZnq43fw4Gx6DdwW0VnL5zDJac/o833QRrYzUIMWBrToM3RG3D
	xlOngU4jOAXghC58JlzVK+ti2/+lLynI4Xk9ByLKXHLmfdB8zYfNAVpL0gqW/dnbuBT2+jXgMzexC
	d7XVelO5NdYSGPTfw08QKvlRmDk2rNHPLXXjHSjnmlSxIvyLvAqR/8v/0QfYDgympgL29CE1glxE+
	lP0+9madg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l780R-0005PK-HE; Wed, 03 Feb 2021 02:34:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l780O-0005OI-Gl
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 02:34:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id g15so3670202pjd.2
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 18:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BZA3fMh+uit+LJFdPKPeRPO6jEIc0xrLde3uJLKGkgw=;
 b=YVkmkvRJXzbKWT+V1C4Cthr7VO5yZh9wxNcwVK8FcvANDyus4VO8sWzb7qHaixMzU4
 63zFE5KDY0Wh3uSn4Zcfyy9jn8rNj0FD/F5kEAOrsACvKIML1nGFGr6nLBox02dGR/aX
 wY2wjlQEpgsYRev08rkAiO+N7xIyxhIU0g4vXX2jYSUNrldTNtr8/R0GHECXCsOYOKhX
 1W/x2zHxhEzKA4csWozLX1EOxzsxw5taAkGNhowJVN6NFxivhiTaBqnBNz7QLmU95YS+
 bCcTNmy+V+RucCeySWp6/uJA3cgNuPEIxJGK41YZskOg3TCbRIWR7hjTgUQgwHdPE9bd
 d/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BZA3fMh+uit+LJFdPKPeRPO6jEIc0xrLde3uJLKGkgw=;
 b=U7UN3ffez6dlkCubpmq2kgYDNM4SG+A0oDPXmcEHoqOdyDT6Y3OgKOoNMEqIZcLKkL
 Kn5RplRQVmvjrIWVZQ7l2xC6slWT1nkihz8LOvDgH+AQ6R5pdhR1wsey+EBHIwdIMAgT
 t6tFPlyToPnhGcNqrq1Vv3dsUFnUdOweLFkwXDOHJNp5JjU73lovVdHFFnJxvCHBHcpC
 WGx9CYelRlqSKGgtDxhRRRsmbmgQBw64EwZVlok07W1/m4gExnLOJ/K+cnVhGmdl8spk
 Hd6Ru94JEIgT96CZHYwruwIlDRrqcvOblzz8oZFq0NmKAlq81VTOfrGdK12GHWQUHzMP
 KLHg==
X-Gm-Message-State: AOAM532PxQmLae7ynpVZ8wJ/1n9Sad3QO1CBVPsTFiCGLucoP7QSvNJ2
 I0KLJJ8SZpLxoKovrHamKnmmsA==
X-Google-Smtp-Source: ABdhPJxU0ey/rE368B4EU3jBz0v7JBzHrDZGgf1zgUFuoU7sYdCApSJwHxEy1ZxxaW9Cs1uHGXGYMQ==
X-Received: by 2002:a17:90a:fa2:: with SMTP id 31mr875078pjz.57.1612319693816; 
 Tue, 02 Feb 2021 18:34:53 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 123sm294441pfd.91.2021.02.02.18.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:34:52 -0800 (PST)
Date: Tue, 02 Feb 2021 18:34:52 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:31:35 PST (-0800)
Subject: Re: [PATCH] riscv: virt_addr_valid must check the address belongs to
 linear mapping
In-Reply-To: <20210129173105.22020-1-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-709d96f9-92ec-4ea4-8db6-e983b6e34777@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_213456_569873_16DE9DD7 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 09:31:05 PST (-0800), alex@ghiti.fr wrote:
> virt_addr_valid macro checks that a virtual address is valid, ie that
> the address belongs to the linear mapping and that the corresponding
>  physical page exists.
>
> Add the missing check that ensures the virtual address belongs to the
> linear mapping, otherwise __virt_to_phys, when compiled with
> CONFIG_DEBUG_VIRTUAL enabled, raises a WARN that is interpreted as a
> kernel bug by syzbot.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 2d50f76efe48..64a675c5c30a 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -135,7 +135,10 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
>
>  #endif /* __ASSEMBLY__ */
>
> -#define virt_addr_valid(vaddr)	(pfn_valid(virt_to_pfn(vaddr)))
> +#define virt_addr_valid(vaddr)	({						\
> +	unsigned long _addr = (unsigned long)vaddr;				\
> +	(unsigned long)(_addr) >= PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr));	\
> +})
>
>  #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_NON_EXEC

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
