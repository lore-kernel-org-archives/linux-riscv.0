Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4CCC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MR6jPyTIH8T+KQPrgifXB/+YjPcxSzRqXSF5ABhDKcs=; b=PSLRQwlqohosbz
	amnaSlFEAMwAmVMXEmhTo9nmQUaaeLuJ1B9PbMuc5glqRkv/g3JiCRT7GSNsT7DT9uVsbmeqI+0h7
	lkV8Hpp2hJ8zeXdvY/lL3kctxdycqHgaIbmaA3Kg77OHxJVXBEtPi0KQBcbbZoSGkES8rhC2BZU5g
	P+C5sW4cAGIYHjv3upY6gCPyKVf8YbzDuUb1ibrd7q6Gft++oqHgeprgsqBzqn+qve1EbrF6vtBi8
	uTRGKN5uEgIsjxibMfjx47308LoiqOB4qH5sxZJ0J+INannlhWDKv5MCq2L5m269Wbu6a+hpapZjb
	OAYLJedtTQERD4YeXPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWN2f-007NFp-OG; Thu, 08 Sep 2022 19:18:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWN2c-007MyD-2e
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 19:18:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id t70so11834946pgc.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 12:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uXZ72Rh6Uf1P0vaCNWsktiSS+D98F5G+wYh6Ba3CkY4=;
        b=5quAYYt4J8enmwF/gk0DsGJfpzDcms+2Sm3DS9sHUdaYGFchMgcUDNOD9dtxb8qNzC
         Gl01AjLNITNHcqURX2zNy9ceVGdJ1OM2onrNOYuNlrZsTSoLFxuACkXdwnA4C1YkPLEO
         O54QURbFenuAK7w/j3MzjRjE0N9Y+pLD17CIZ1QpJBFxK1uU7Ez+3r+w1u5rhZHkkKsX
         wYXZ3FtS0NMnt6UOdo6cepj7J5ge9JyTXK3/dFQ8DhYMTPOTNfSwB6U2FJaF+B2PbcJz
         1IM0qD6T0t6M+Uts1mDD4NnEZTj7ASNEbA+CI1lT8ljEjJ7NZAbxZ++FRpVUVT6jcNmj
         sWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uXZ72Rh6Uf1P0vaCNWsktiSS+D98F5G+wYh6Ba3CkY4=;
        b=gZW9rCQtNu2KdbmUWcdl4oGMn9ZW6s4Yg6UtXtXRh59sz0IVN7OjhEopvOIYkdfCx4
         c5u5rkbJAgH1j7Z1pCpSExx7knT8uXQredwJLXnbChMgljUTaV1GpWbBBaeJqO0/mt1Z
         PB6bn0tJz7vH67ApjK9ARMcNDWmXpdPoMAuKlasNQxeBqsRAZxsuREStV+yya/rETPDy
         gDsKLEwPTj8yPQkIn04FVJIX8Ox8g7FlywTDc1yKIRFR9hOM4TnFBrI6TnXccgwGvcGa
         Oqa4d3QLf7DzDkUKojsriSfhzHMm85Hgh620oWXT3gqzm9p1lDOlBkK6XmVE2EO5UVHo
         HuaA==
X-Gm-Message-State: ACgBeo1GHve5Q6MtR4awG+i44fGOk4NIm7QFKmDiHE7YwbRqXk/vFPA4
	2ZbjbO95FklLZ9p7Gc3hMEbarZvLWTEWwTg4tU64tQ==
X-Google-Smtp-Source: AA6agR7oNmciwKq2tiyIsHcViJHuF8+srT5YSZJe69xXEupuFoh3naveFjCmdSh7sLmwjnoEzw0y4VtC8OyYvC3Qnuk=
X-Received: by 2002:a63:8a4a:0:b0:434:c99c:6fd4 with SMTP id
 y71-20020a638a4a000000b00434c99c6fd4mr8787361pgd.24.1662664693483; Thu, 08
 Sep 2022 12:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
 <20220908185006.1212126-1-abrestic@rivosinc.com> <CANaf2sf=W=X0aEpj5haN3ns3XVqZt2si+Q=xFdhaK6GwNR7Tnw@mail.gmail.com>
In-Reply-To: <CANaf2sf=W=X0aEpj5haN3ns3XVqZt2si+Q=xFdhaK6GwNR7Tnw@mail.gmail.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Thu, 8 Sep 2022 15:18:02 -0400
Message-ID: <CALE4mHpO5eFk9-G=RCk97JiwnBMMFLiB4qvV-XXO+N8oxz0QTA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
To: SS JieJi <c141028@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Celeste Liu <coelacanthus@outlook.com>, 
	dram <dramforever@live.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_121822_220130_4CC9D995 
X-CRM114-Status: GOOD (  12.19  )
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

On Thu, Sep 8, 2022 at 2:57 PM SS JieJi <c141028@gmail.com> wrote:
>
> The v2 patch looks great,
> > -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> > -               return -EINVAL;
> > -
> This also removes the check for --x pages, which used to be present in
> previous versions (before the submission of the to-be-reverted patch).
> Is this intended? Thanks!

There's no change in behavior for --X mappings; those have always been
allowed as it's a valid set of PTE permissions.

This patch does allow -WX mappings, which were originally disallowed
in commit e0d17c842c0f ("RISC-V: Don't allow write+exec only page
mapping request in mmap"), by implying read permissions for such
mappings as well. I have a note in the commit message about this.

-Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
