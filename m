Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03280C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E9364F6C
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E9364F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=IK+oYPfMmvtakB9sFGdS+RxT0kNdYII/ucmogt4Bmrw=; b=ZZt+9Hu2xWwh4Fbuke+gC96Za
	D1qqEX0DYFMkkz+DgqEWLfiL9/XDzWtzk1Ifs5C95dJ87uIqsOR65G74gG8idpvR2zJ/y69ULjTpa
	iZ5Cm6CFa5UkSva2H5ZW1tHOVR2omIzzmwjUckxDhDVYGoG0IK+ZDh97qsojeyEzTrJq2/vDKqjk3
	+vz61uZtZphRuh0TIACpyYsPbrpHDR95xseSgYA+XYrVtG8cYGavd6cR2IzZFe/XSI5EPplVDqNIf
	nlUqIjd3ymu/lsETccvBuaCTacbRAHMUfV34PCWBJzTF2NJ8PNJIUDgPmF41o1qkPFKLbfiPh7xiT
	Wy3+qGjhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l780S-0005PV-8t; Wed, 03 Feb 2021 02:35:00 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l780P-0005OJ-Ki
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 02:34:58 +0000
Received: by mail-pg1-x530.google.com with SMTP id g15so16245899pgu.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 18:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=f8ymPPL3aiMxzD4Xh2QF5FLU9/HSVYl9hpzXbMMvEjA=;
 b=ZR4Yj4Xxr8gBQz8Ajb2J1s91fGhF+zi15XHpqkgQr7ORpIdYCN/JQju9101kSaZWZf
 UrMi7J0Fq8VoxR77unnoD+mc4fGT7Dk+qwoMeNQgXZWqgvWcP9UGsSoxvHPT3BUw36oY
 BfvlC8jXlMv25OCnhAYgkbP2KFPLjA33Qb/6zWFKB+6qu1dsrY8UXcK9P+fwPSJlzDX9
 k8hnIwjucqmg11f5/vIFyuxndsHcGlfeXQbp44xXRqbZNTju6rW6u3KdZRe/7q2gsjPB
 pc4wo07czXy7LVTO2HfrGB/IHIIkFPGGu65X0UB0NOXjoTGKUX0avuZYr8bhuuMl3Q+6
 D23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=f8ymPPL3aiMxzD4Xh2QF5FLU9/HSVYl9hpzXbMMvEjA=;
 b=DXL6N0c+6EV+1OwPGBe2iWfTH6mx3O20J/j+P7A2C1/RfEp+jB9zJI4ToJ+T2tUq/A
 dY3urmxCuvpJ2lFdW3KJwkUee32eelrvr1hOH3oLr/yF/cylRqdzP9wG8zxPwLR8iT1I
 BOdCjct5nKbb+jJY55MJ35K/3geWlX22f8C65SMZLLWyKhv+ql19hHRbAOu7O5G/1dK+
 e/JY4dNVaeT43IEUJrUCU1JDvOTdFkJQXAg4j7jVD7Wp4NAxlGM/oARbN2sEMeFfEfIB
 xAmbRY4sPr2HxKrXt6l99pHrbfi1riLXF7YnfLis2whxGU86Da/xf79nVUABNUNhnueZ
 hfXw==
X-Gm-Message-State: AOAM5332Igbib+6joqlE6pYDIQA2jtK40L4RMEkrDt76hNA5bIIKB+aH
 p5xK4BK5+xeOWcVZuzh/8iW7QA==
X-Google-Smtp-Source: ABdhPJzEejY4oEjfO8kKlOke7DqR+csN1+8GClQOe55+ElfMik/fpvkYYS5ocRI0Ciwo0BZPlTm+Aw==
X-Received: by 2002:a65:6458:: with SMTP id s24mr1203365pgv.386.1612319695301; 
 Tue, 02 Feb 2021 18:34:55 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a30sm292770pfh.66.2021.02.02.18.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:34:54 -0800 (PST)
Date: Tue, 02 Feb 2021 18:34:54 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:32:12 PST (-0800)
Subject: Re: [PATCH 1/3] RISC-V: Fix .init section permission update
In-Reply-To: <20210129190038.1001626-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-da4345bd-4ed6-48de-be63-606a4eff7017@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_213457_750365_EDE2688F 
X-CRM114-Status: GOOD (  17.90  )
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
Cc: svancau@gmail.com, aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 ndesaulniers@gooogle.com, geert@linux-m68k.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 ardb@kernel.org, kirill.shutemov@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 11:00:36 PST (-0800), Atish Patra wrote:
> .init section permission should only updated to non-execute if
> STRICT_KERNEL_RWX is enabled. Otherwise, this will lead to a kernel hang.
>
> Fixes: 19a00869028f ("RISC-V: Protect all kernel sections including init early")
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/setup.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 3fa3f26dde85..c7c0655dd45b 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -293,6 +293,8 @@ void free_initmem(void)
>  	unsigned long init_begin = (unsigned long)__init_begin;
>  	unsigned long init_end = (unsigned long)__init_end;
>
> -	set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> +	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +		set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> +
>  	free_initmem_default(POISON_FREE_INITMEM);
>  }

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
