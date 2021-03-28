Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2CDC433C1
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 01:51:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA09F6192A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 01:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA09F6192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m+ZvEVNZy+USQ+ZBk4klhSbXX37M/C+oR9WLNletA9I=; b=i/xwmUau8a6rL5LaKvysRpJ5/
	taTa6RJZ+7vpojoqgEZR1Pk0JuTNB/dDYx2yxeRDea5XAJ876XTyHNS4jz3RI0N0hR2TSXTUfWU1h
	2NLbkk8IwD0QOQqSmrnCkqgJev9oxG2OjQyVPRJrPhR2n4z0OAZB887S3LV/8biRnp6Z9nNX4nY74
	hApCO97itjFjS1d/R4HAImBha22igyGFPu1lVwO4jQ8EXJWNtjs0BBzZjtLr7Uq7OFUqPEgasi0+7
	HjN4XygNcBIgYcdGi5Ic+krzPjjWQwLDznJ8JJzBTxVjQicLke6j4VSJF1wHVuZ8waVE7cYQY//9J
	GQktHKBlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQKa3-005iWP-MI; Sun, 28 Mar 2021 01:51:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQKa0-005iW5-44
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 01:51:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F053619A1
 for <linux-riscv@lists.infradead.org>; Sun, 28 Mar 2021 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616896262;
 bh=BUNgSqvKCD1KhF3NeU2ADrUH6ViHHRa1+b6YkOC3oZE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mXgn7fkgHaKx1wyAyVt+m5lJNJR0MzrE5OrAMbPfJPMq5Pg60W+BTvSMElW0NSsuT
 KUK5vc0PysUqrztNBlXk6YoPv2cxfSDSDF5Ufxb6AVbMaWxS17bHEvmkWBoHyK1kac
 gS2SHu2OPT8GqCphEMfoQ7tJOmDkwoXtyK69fIphdEPGJUbJs6dVRo/7S3vdRta+8A
 xh0qvvCfqrw/lkax7EDQVn9h8cfDK5xudZJNNpjdPAkleyXyFbkvo9W2zeAMEWVJI8
 6LsAs+m19cTaes6i1gyj8TAPGFYeO9YA3y/xrFdG11F9Vn0cakibZaJAN79m+0UPQB
 obgkouu9nS3Kg==
Received: by mail-lj1-f169.google.com with SMTP id z25so11862125lja.3
 for <linux-riscv@lists.infradead.org>; Sat, 27 Mar 2021 18:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM53397YyD4lDK5oNGsrlTJsp/JYjk+8p5kMoM/e6gvQD9Qwi3GdhX
 5iLLm/6PrPNQxcAQ3GBnB9O6HQhitixMJLg9N/Q=
X-Google-Smtp-Source: ABdhPJwOo1LYn6W8dv8w9E8xhDuwCGJKtTINJ/V9CDbT+ATTN6EFhh/n5CyatHU/ICm8j1lw1imnRI+VEW+DCIiuk8o=
X-Received: by 2002:a2e:2c0d:: with SMTP id s13mr13299541ljs.105.1616896260724; 
 Sat, 27 Mar 2021 18:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-3-git-send-email-guoren@kernel.org>
 <CAK8P3a0FG3cpqBNUP7kXj3713cMUqV1WcEh-vcRnGKM00WXqxw@mail.gmail.com>
In-Reply-To: <CAK8P3a0FG3cpqBNUP7kXj3713cMUqV1WcEh-vcRnGKM00WXqxw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 28 Mar 2021 09:50:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTSnrAasbGdpjcNk6xFDP5-06ZjQK+AWB6jJ7M3GXbZ9Q@mail.gmail.com>
Message-ID: <CAJF2gTTSnrAasbGdpjcNk6xFDP5-06ZjQK+AWB6jJ7M3GXbZ9Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] riscv: cmpxchg.h: Merge macros
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>, Michael Clark <michaeljclark@mac.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_025104_660091_A69453DA 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Thx Arnd,

On Sun, Mar 28, 2021 at 5:25 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Mar 27, 2021 at 7:06 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > To reduce assembly codes, let's merge duplicate codes into one
> > (xchg_acquire, xchg_release, cmpxchg_release).
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>
> This is a nice cleanup, but I wonder if you can go even further by using
> the definitions from atomic-arch-fallback.h like arm64 and x86 do.
Ok, I'll separate it from the qspinlock patchset and try atomic-arch-fallback.h.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
