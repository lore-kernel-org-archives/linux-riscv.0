Return-Path: <SRS0=pMxH=G6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF158C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jan 2021 05:51:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7BD20709
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jan 2021 05:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B7BD20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=57+8QdkH68i5t1E9NnDX9wmJ3FgVUGx26bQzdmt0DBg=; b=wyii2tBCA8+dz6mXExy9F1JAg
	t9FS5Ocdw1SPitfGq3XHXtTMTikM9hy/kddzN/niCqeWXHntaLuvKgpxZW4NtuZ/XTSIQmBYKEPeb
	TwzV6EyqpHc5zBM+5e/1lMRC9UtMpwiAEfd//IFmIPKrJRrGakQyRWK3XZQLugdJuwI15oLNV0w1g
	85b/wNM9w1PE1o+M/vprmDPs4VjOqgh1vNBe8HuHgUNa9yftcXJd3PzZBSIHWPIkjasaiAonY9Dde
	3EVX8f1MrXI3/RNhH4ezgc3UoQQHBFXMTzPzz3qhWmdWHPwqQwxsIwW2GOvhlFd7ieFPg1PKELuKE
	yghlq2zVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4djV-0000sC-Bn; Wed, 27 Jan 2021 05:51:13 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4djR-0000qy-Us
 for linux-riscv@lists.infradead.org; Wed, 27 Jan 2021 05:51:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id t25so854767pga.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Jan 2021 21:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5b0G612BbLqhOmtFpTh6nsrM8gpLSw0KNPtsFi6XpCc=;
 b=sYJXe9T3zKG8iFL7HKE8T2OENZ8qwvKRQyu1SzWqXQJTqUbYfVlILthmGMeuLCj6FA
 3PGh0MU7AJ2tg3FVWp9srTwfWu90SP5GCYhY0ELurAO6QeymewB9VvVIDdTYl3vsJh0n
 9f5men8ZpsYjH4oKCM5zdK5wwP5lLPp0kKRHacrinNOa4rLWBu8z6w41mbptvsE/BUBl
 7dsXj72CRXqTmhAm11gHalkNaqZ9GgpqDNVM55NmZgnpISP/XNnxtpAx9RtJ0elF3uqQ
 Vcy+0g4F8uqMp1GiI8VR6ueVQUmnyxtzcPHZ2bM/N+gMwymfwjH8tvNOiiG13qF8dGHT
 B5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5b0G612BbLqhOmtFpTh6nsrM8gpLSw0KNPtsFi6XpCc=;
 b=i2/WnWxPULoqRiuUX5WifQxZYiFR1xcFzEsZjOKZ7F5CZjvFbiKsyczV9q538InH8U
 tIsX84N0zoG19K4ASrTaEnn1FbvdmOFILr/ng8cA88SiNF0Jk/sGemLLxxgTJZnI5IsN
 TWS70lJYHvZauKYsdAa70hEz66QDclCBpX9CSs2tVfKh1ecKOMv9bazwrx/IyuHRgMwI
 G5laZhh18ZSfZZ7K6huGJBc7iZXXw3Iqxc2idfk3t7KZJWsn9P1DwfCkySJmlo9Bvawn
 cmti9nWYCz8RtfQQaatUdWS4urgWn6+Y9+tKk2kT5iQXGa3cbrSnwV4wYyszdw2T56N9
 5pvg==
X-Gm-Message-State: AOAM530W5GWB5lCN8rrYKHjtRm5CH0VpGtPx74Bj6YXSJTBaQNYR8ata
 nwRPaBWIZhAI0VixmLmneplJHEpoaiG8JA==
X-Google-Smtp-Source: ABdhPJwN+F0Q+dA4gALFLNTLHN2v3MMKb1w8Bz/lRmGnJKGEZHrZx60kaiGtrQSqriFgx5BPH6HXjA==
X-Received: by 2002:a63:da17:: with SMTP id c23mr9455231pgh.348.1611726667045; 
 Tue, 26 Jan 2021 21:51:07 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 85sm901094pfc.39.2021.01.26.21.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 21:51:06 -0800 (PST)
Date: Tue, 26 Jan 2021 21:51:06 -0800 (PST)
X-Google-Original-Date: Tue, 26 Jan 2021 21:47:10 PST (-0800)
Subject: Re: [PATCH] RISC-V: remove unneeded semicolon
In-Reply-To: <20210125112347.1740981-1-cy.fan@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cy.fan@huawei.com
Message-ID: <mhng-94ccaf15-6716-4e53-9e81-36e42c5aeff8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_005110_001387_BE8519BC 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: joe@perches.com, linux-riscv@lists.infradead.org, cy.fan@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 25 Jan 2021 03:23:47 PST (-0800), cy.fan@huawei.com wrote:
> Remove a superfluous semicolon after function definition.
>
> Signed-off-by: Chengyang Fan <cy.fan@huawei.com>
> ---
>  arch/riscv/include/asm/set_memory.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 211eb8244a45..9fa510707012 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -22,7 +22,7 @@ static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> -static inline void protect_kernel_text_data(void) {};
> +static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
>  #endif

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
