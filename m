Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5543AC12002
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 15:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6A160FE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 15:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A6A160FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqsXbX/vSGVROLAi0EYCae0HnsxnFJjec5z2/+oStsQ=; b=dQOyt/8gmtp57t
	80lvVaHLPN5uS1XqoV5Z8kItSDUm7qshg5IGR4Mq2pRnQZu0m1QInhmn3VNHfw7kQa85t3fYX6wmY
	4Gcncg/i8kg37GOWhERl9ZA3E4ZWs4kGrOuNaPfuzfgZfwDp7/bV3yOInJ/AxvipEVkz5ZW0XZMhP
	WiA9DsfaAYGy3yrdXCczBSQzHLG0xTmSHqh1vDSINSu0paHnMdCpWv9AavAtDVuv9fw5avw1DS4qc
	0T6fEHDbW2j9MDKIvFWYycyU+5QOHyl0K/0+ESa+aExDnHmiDZhkpu3cZk5Q+u9ttC0eKB/fa9TCJ
	FRiR6YnS3PAdisoKh+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Dn9-00GB15-0Q; Wed, 21 Jul 2021 15:05:47 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6CyC-00FtAX-RR
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 14:13:10 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id k184so3417085ybf.12
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxJG9dhJg971EM1jTPDx1+rVCA7QuZrtXkki4ARdNb8=;
 b=gZAsc/0UAAHZxhjucvY5bco5lvrJ234R6bxUbpmbGrSrKWsLFdJz9u7HmdS+twGVjv
 CGt6f+7RyrcyijIYHxvjW6uuPyYQAPeOGRcdAWDswEMd4+rX1vXjy6W27zBkx5Qk+7Y/
 VPiWVXBF8ujEeur8XUkJNDJ191QnpBiwR0NkLUNHr/tIcO/wp6yasvZhqhSYMT2jIDam
 C1as+EeklfSoAwrABny4giJLfzrnBTBwMOsC13xnwf2NMgGZA+OT0xYgnKKF5gR7rAEg
 bUTJVA1Ltg0DVZgGI8PoR+E6fQ8+pHpyD4tAQ4r7VPs3q28irXIgTjqTvMWutoYO5YhV
 eVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxJG9dhJg971EM1jTPDx1+rVCA7QuZrtXkki4ARdNb8=;
 b=C15CihQ91LfuVnZB4da5CwntVAuGXP+oMzRRxB+88Gsodngh7C0fplPnJoWKl3cgCB
 zosqUvUkPPXSooA2lPwX2D0i9Bwh0u0pk3kkskThmZu8abCtidrkraxDQUdO/IKim6do
 i4hZaX4sAf0OQZqxkhzKEvXlyUQ6KSmYM6hmWXPHAlJunVDH4ym4k+tzOT/NuBSFUMay
 Xlr1p679BRYKXLH6nucHomup2uVeqXx/sVE1cg0XLxqcV9IS5GzR6J7V72nXeyTjLfPG
 TX7E6Ky7H6UE+Z3bA18WYmH3lqeVZ3xfmxZv4ztNd5QJcTOZPxfK9D4b7IZ3fXjsTW1P
 Rezg==
X-Gm-Message-State: AOAM533jt2FR17IjaXIH6+Zb4aNC5BU40ZsSf0pCjjMoEQ5fYxQ+RVcq
 LHN16syjp5MZsDKOfUjxrLhErdOLlXhLafzo7UM=
X-Google-Smtp-Source: ABdhPJyb9EnIJ1cSuH2LGGqh5iBWZSsCltT9+kvwIltvVqLIela9b8rmEnBATlbpKqxJqJ5ktIGP3U9Jux9/NHl5uOE=
X-Received: by 2002:a25:7cc6:: with SMTP id
 x189mr48172992ybc.371.1626876787088; 
 Wed, 21 Jul 2021 07:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210721075937.696811-1-alex@ghiti.fr>
In-Reply-To: <20210721075937.696811-1-alex@ghiti.fr>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Wed, 21 Jul 2021 16:12:56 +0200
Message-ID: <CANBLGcyqOKgoQr3EWvgTKewj9PtbzZ4STOz5KXHm78JQYc0G4w@mail.gmail.com>
Subject: Re: [PATCH -fixes 0/3] Fixes regarding CONFIG_PHYS_RAM_BASE
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_071308_981470_A66F3975 
X-CRM114-Status: GOOD (  17.08  )
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

On Wed, 21 Jul 2021 at 10:00, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> The following commits:
>
> 7094e6acaf7a ("riscv: Simplify xip and !xip kernel address conversion macros")
> 9b79878ced8f ("riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED")
>
> expose CONFIG_PHYS_RAM_BASE for all kernel types whereas this value is
> implementation-specific, so that breaks the kernel genericity.
>
> The first patch in this patchset removes the usage of CONFIG_PHYS_RAM_BASE
> by introducing a new global variable that holds this value.
>
> The second patch reverts 9b79878ced8f ("riscv: Remove
> CONFIG_PHYS_RAM_BASE_FIXED").
>
> The last patch is an optimization 'symmetrical' to the one introduced in
> the first patch: this is not a fix, then it is not necessary to pull
> this into -fixes.

Hi Alex,

Thank you, this works  fine on my BeagleV Beta board.

If I'm not mistaken after this series all uses of CONFIG_PHYS_RAM if
protected by #ifdef CONFIG_XIP_KERNEL, so maybe we can remove the
middleman, CONFIG_PHYS_RAM_BASE_FIXED, and just let CONFIG_PHYS_RAM
directly depend on CONFIG_XIP_KERNEL.

Don't let that delay this series though. I'd still rather have this
fixed in 5.14 as is.

If it makes any difference you can add this for the series:
Tested-by: Emil Renner Berthing <kernel@esmil.dk>

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
