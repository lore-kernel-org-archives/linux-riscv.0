Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B104ACDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKb2woOQeTqO3CNYgZsC/vLqua09kuvIoHlC+3H3i+s=; b=brLb/a+guKcmzH
	wSRnM6xXQrxQxCxCY7xBzNvj/mz5E8E/ZFKbAwGWdgVYWZ5LRaRI7a1fWC/hP/sF8UXNkNsnLMi7q
	6Y9hoJfBV6v7fy04QYM0yTKeLs8ZtQ+uxjDaWrwVvuPLs0ThFLuI66aLWJN4wbBcWa451xvUm3UD2
	/+C8MAPv74X3gql3hFUdwzCIVh1c6ZkTlgkeGTf1gc5tUSndYg8ZoE3ykXij1216OI0H5dnAzyQ04
	N10po9pAxL9VZDVC3T3TWen9LQrUgKxC8ycLpKdCskciai2nUaqeC7HUTzQ0UdjdVO6T0wo9RxwtY
	Wo4qqCmG0NC3FNQmLuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEw3-0030zE-1T;
	Fri, 13 Oct 2023 09:58:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEw0-0030wr-1X
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 09:58:21 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5384975e34cso3574162a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 02:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697191096; x=1697795896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlysa/0HAt7XwTL7Sd4FpaqX2JsJYLCn7DORbQofqo8=;
        b=SO4NF100TKjfXVuWcqBkhV7O7kUWqg203vCnTgyQEmlWPXuIrxvXhibZaMGdw7idjE
         H4AB9KzpQ49RAR4UzTjZcBxRbL30+6bBrSnrh3ga4eiJ+A2AFYkfUmD5L63CCiLD0Z5D
         DuOfB5d0WxuARv4Q2KcmCvV1+7l+ig3RgoXxMiOpT4o72I4SOQ4YZjRZgRZWcGyrr+eX
         LkAJjhchxeYJ8BH6SOFUJs/1XGmws+yMlAOMkh2Obds92X96+Ckgki01rHBRS2I80ycN
         HicQrYegEL+NXDDOeC7iyymUEY3i/O3kDD90aY5isLLVzM+n6WO5AdD7f4xFyh+A0dOm
         ZJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697191096; x=1697795896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlysa/0HAt7XwTL7Sd4FpaqX2JsJYLCn7DORbQofqo8=;
        b=kq/hyrZ7CYKJcK6ahD1SMXf47fQTO7NJr+NT9khipAGK6BpRcjfWYOCfZ/cn2y8fB/
         3va0fkRU9vUEJbR0h0s4ZDoCFLmKEOY4QZABTkazY8mIlUkH27RlQwnCqUL+Cw6mge+y
         g9cIZ4g4MJKk5aX/ilnwsVG3eyOI/K5YP1hU3ZbotjgP3ykoY+nyixyVr9NfCtXrJINd
         7YB37AfwxboABDZMNq5zMcwYsfsXsfQVvyBJaSJEM8f3pz/z3wameXmVXFciay/7YMr5
         Uz/aGYF6UCA5g0HHatviw6KewWYkWFgxPC39CmsGr6xBgAucWTjpC31mK1F2Xk66vkAI
         drDg==
X-Gm-Message-State: AOJu0Yx6dvuXOqb2htKxaC5mD4X4OX2WgyKYhincqYYh2ubhNadrWjFS
	s8+InqYQSAK5QJls1r45T9qfKw==
X-Google-Smtp-Source: AGHT+IEguRhdGJwf0aIebN3fBCeHhRTYBl34+o54X7nhqZBgpclVfefxrGnH7qQH1m05Yq6L5Ya53A==
X-Received: by 2002:aa7:c998:0:b0:530:a226:1f25 with SMTP id c24-20020aa7c998000000b00530a2261f25mr21443281edt.17.1697191096257;
        Fri, 13 Oct 2023 02:58:16 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u19-20020a50d513000000b0053e408aec8bsm650498edi.6.2023.10.13.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 02:58:15 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:58:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/5] riscv: Suffix all page table entry pointers with 'p'
Message-ID: <20231013-19d487ddc6b6efd6d6f62f88@orel>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
 <20231002151031.110551-5-alexghiti@rivosinc.com>
 <20231012-envision-grooving-e6e0461099f1@spud>
 <20231012-exclusion-moaner-d26780f9eb00@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-exclusion-moaner-d26780f9eb00@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_025820_517102_E0D04974 
X-CRM114-Status: GOOD (  14.79  )
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

On Thu, Oct 12, 2023 at 12:35:00PM +0100, Conor Dooley wrote:
> On Thu, Oct 12, 2023 at 12:33:15PM +0100, Conor Dooley wrote:
> > Hey Alex,
> > 
> > On Mon, Oct 02, 2023 at 05:10:30PM +0200, Alexandre Ghiti wrote:
> > > That makes it more clear what the underlying type is, no functional
> > > changes intended.
> > 
> > Scanning through stuff on patchwork, this really doesn't seem worth the
> > churn. I thought this sort of Hungarian notation-esque stuff was a
> > relic of a time before I could read & our docs even go as far as to
> 
> s/go/went/, I see the language got changed in more recent releases of
> the kernel!

The documentation seems to still be against it, but, despite that and
the two very valid points raised by Marco (backporting and git-blame),
I think ptep is special and I'm mostly in favor of this change. We may
not need to s/r every instance, but certainly functions which need to
refer to both the pte and the ptep representations of entries becomes
more clear when using the 'p' convention (and then it's nice to have
ptep used everywhere else too for consistency...)

Anyway, just my 2 cents.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
