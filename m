Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68B8C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nO3p9I3nUKFP47mSJ6fPhWUyGpk9tOxun9u5iQsG8rI=; b=QwGLj71ABmHPhC
	JMxetJhIABKgworwhixqBMtqxjtKsLNCFct2V79W/zL4gI3V5vJ0kbBtf0bESKUwea0LeHjhwg39h
	CLo3dc3KH1QFREUznjPmLDQhFCsSEqP3Q+lGm6orlE7zzgIKY5tEf5duKDzLF1jfj00PToD9B9ien
	eXBqrqdI5c4ii1EVgzBKJcQa1yw2aqW98DbsNfuryzYr7e0TGUmV0B1pYA9yu/9F3COAFQbJwFsnC
	RqW1lyB6pY3bq2I8+I9u2BwjqI+xIAwySAu+MY5ZwROoiM9LSc7Hh5NI+I3PVGG2js9JvBFojaial
	NG8H5wG4XN5jAPENCdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNck-003XtT-0K;
	Fri, 28 Jul 2023 13:35:18 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNch-003XsU-0p
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:35:16 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bccc9ec02so308472466b.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690551313; x=1691156113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pjWxYuMkYyCYydGZYyJb4wLVfHb9S4Js5IwnnFB0XSM=;
        b=mrIibh3Dlr65plPmb3Z5x+BK8DLfVVHVgMxww4xnQSb3VTUTBAhXWOncfguFuNeGNX
         MGsDK3J+A8xpOpSJrr/dv0TihJRHPUB9q9atC/ZgxkMr2lAponsucCOMIlt9Sd1oyHI0
         pNBr5+KNFgBYRwp/e1r5nwpJaAtvBmzFYiAetPlrGdBs0m+Gp9YL81CyIkqTZuu1PmDM
         T2cXP6wX/WgEj32CGATYB59Tz8DEYlqb7yCYpb0rxCi6wiXXxTMA/eFZGlgkmeEXKEqt
         aN3bg3giPBpxEgAdV+QB9qygbyiPBv7i5ufllQpPlE/w4NmqPtSt1iX//pWE8MIo+cUn
         NfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690551313; x=1691156113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjWxYuMkYyCYydGZYyJb4wLVfHb9S4Js5IwnnFB0XSM=;
        b=lwDbsMPvCfh7EytaQD2ib9ajwb/7hSi/gsIIKvPSo3lskbICkk0v2oJeHGOs26AE5H
         wcohcopd2TbMUZYizUIHqVoPGaQ/H7l75PBFvNeKawwkcTUuWqf4fxPUMnUx73f/J+dD
         jDBugm/453hZTpHibOA44fxNKxvQufD9+wU37uEHryasVhDC91+s0ML1nKvXApdix18H
         WG2ocrW5LX/vjc3kQiylwa9opQ7ptHNoFm8I3VOuo+rGwMiEvIeR3PVprENLAdScXAar
         V9WvMoObUltc8bWzs0itU/frFzhz006O6bJpLdDxoL/7OGNV/zu/Krn1NFpCyMzM50E3
         Uspg==
X-Gm-Message-State: ABy/qLZH20WXopwwlJnMbGQyhe/hMh+y8eqlM4nqYnx6iEmSxXTXA9hV
	+SAH0CiRXhzNh4uVKQBKAanoEQ==
X-Google-Smtp-Source: APBJJlHKH1RVaeJ+IQWiZC6RQ/5l8Tw7cw+9QG6eDnuSTly70i49Mrj/0IX7qZ9HnNDqHSo9f1w0pQ==
X-Received: by 2002:a17:906:2202:b0:99b:d1ef:520b with SMTP id s2-20020a170906220200b0099bd1ef520bmr2223467ejs.31.1690551312875;
        Fri, 28 Jul 2023 06:35:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b009931a3adf64sm2111178ejc.17.2023.07.28.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 06:35:12 -0700 (PDT)
Date: Fri, 28 Jul 2023 15:35:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] riscv: Improve flush_tlb()
Message-ID: <20230728-d89388540f7ad14318ad768e@orel>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
 <20230727185553.980262-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727185553.980262-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_063515_301841_1F7CDA36 
X-CRM114-Status: GOOD (  11.92  )
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

On Thu, Jul 27, 2023 at 08:55:50PM +0200, Alexandre Ghiti wrote:
> For now, flush_tlb() simply calls flush_tlb_mm() which results in a
> flush of the whole TLB. So let's use mmu_gather fields to provide a more
> fine-grained flush of the TLB.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/tlb.h      | 8 +++++++-
>  arch/riscv/include/asm/tlbflush.h | 3 +++
>  arch/riscv/mm/tlbflush.c          | 7 +++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
