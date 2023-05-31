Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F88C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eN93y3V0t8rHxhb24Y6fbSWNEzDXy9+6ugajIxqvrc=; b=lk+AmeWfGOm3+s
	IYoMZYhmQEpCZvz9qd4nO6fd/Gw60Ybg5gl03YVnK7UGUsnDJANc/zNIIvOxaBtAdINRkDOJslhw4
	HBBcoe6yruNqL/HAzWNyekNHfAJ9iJR9e9MGWEPnoKX3pTxJ1fJoLIrVoBg2a0VzLDdmcgL7GDtzu
	/WbFr9rAa7bR+8BwL1hKgZ6yL7W/iNRCoDWhHhrDSH8shRHNpJ3t/6KVDhF6ucjxZgtKmN3hnEA+S
	HWnczakxUoi0lubaC2W3uR7cGb0b7DwPu8got2BmZ0POcDdNtRlMMX6TYGitElX/CCuEhPvr4fAG/
	B24WOqmA8Pl+z7C1hkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NXn-000GC3-1Y;
	Wed, 31 May 2023 15:15:23 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NXl-000GAe-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:15:22 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96f850b32caso1087226966b.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685546117; x=1688138117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Quu36W4GU+XEkXfM2HLo4LwzHXTkvm/qQekr1pKlqU=;
        b=EnWJipeL/xECJsUZckQ/PI6Okm3OpnYm9/YkkMYAuk3P/bqTNKXslUDr063//zOFjl
         7TkGPY+c6rxT3riSnJs4dfkOFL1JSr1F6ZLSTgB7cUj2q5n6iaqdFBB5WEQ18g1JM8fT
         sSP/S8CJTMifcyxkncqI3ldVYQeaWYDnCWE4radlJZ5OgOQLjx+ghH6gq7+hRlKGxNkE
         5X5njE0EAv8nCBA/rFRIIY1tJzsZ8mjg94Ol9mHnzBz7qIxr9Lm7FrsPq8XpyN+/lwuf
         GWGe55ylkteuaAwtQSdTAM/DMBC2D/9iiPeB8h9J/2b9D1fY6CDz4mMTd5DxWFLLB+/2
         fi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685546117; x=1688138117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Quu36W4GU+XEkXfM2HLo4LwzHXTkvm/qQekr1pKlqU=;
        b=kbWei3Vx508b6XiDjLlWjBvHiwM0y74Y/Sa3N2cRaHtJNJbv963ATe5RCPUJTUal+B
         wlelCHtPUum3YKcv9TWbjPfkSmZNgB2eI9dWYsVo0MaO0rIdy/PKUJVGt54nPZdTzksh
         9DPsgwdH5kl/a/IYVORLyzvzGaBSBraiElaVV52kXmPlNIe6jrnTfrx+UkAwBe8BIERe
         6x4gIPrRzjKvn7LEftHBP/dplIKu6Cy0UeKJ6gEbWu7bMPLV/BOzwDsGvYsl7uaV0mCj
         Vteqnpi6UHuLx3ZopzACYye2nrrEiqitQ3PVF0LUSxuB63EAUf1gp5l8aohzC5Q4HWtd
         QnLA==
X-Gm-Message-State: AC+VfDwUuGkgwn+zKzwBCb3ZMiZoq66sOSO/suNgoueYtorzeKSclMwK
	ImkteR7R2j0u7CEtfC16eEX14w==
X-Google-Smtp-Source: ACHHUZ7j1l2WBgPDSQlv6cY9A1PO/csyIXY9okDefpzXWxmOVxxkXtn2tz+NimX7Si0YQM2HYlSmzw==
X-Received: by 2002:a17:907:1c91:b0:96f:5cb3:df66 with SMTP id nb17-20020a1709071c9100b0096f5cb3df66mr6316144ejc.18.1685546116914;
        Wed, 31 May 2023 08:15:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t11-20020a170906a10b00b009663115c8f8sm9236782ejy.152.2023.05.31.08.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 08:15:16 -0700 (PDT)
Date: Wed, 31 May 2023 17:15:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
Message-ID: <20230531-31bd9ddeaca8cb338f81ed14@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-11-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-11-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_081521_487913_40F3F15B 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, May 12, 2023 at 10:53:21AM +0200, Alexandre Ghiti wrote:
> riscv now supports mmaping hardware counters to userspace so adapt the test
> to run on this architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  tools/perf/tests/mmap-basic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
> index e68ca6229756..f5075ca774f8 100644
> --- a/tools/perf/tests/mmap-basic.c
> +++ b/tools/perf/tests/mmap-basic.c
> @@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
>  			 "permissions"),
>  	TEST_CASE_REASON("User space counter reading of instructions",
>  			 mmap_user_read_instr,
> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
>  			 "permissions"
>  #else
>  			 "unsupported"
> @@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
>  		),
>  	TEST_CASE_REASON("User space counter reading of cycles",
>  			 mmap_user_read_cycles,
> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
>  			 "permissions"
>  #else
>  			 "unsupported"
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
