Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990C5C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGzE7oxtrfQM/45qk7ak+sknz9uwf1SafLQHevuyD9Q=; b=PwoE7NLRSSOPR3
	ZjR8LSPFqpeLtMwiI/KFADOxduWkTl/6mhz26AuRtIQCqsJQLH8j/00B5pcZNVKqIRKHtMRDjxbG1
	WWz3J9nkE5LAs2MQyeyW68e561mKlhxkNhIxWBRJff4BxKfrilXTCyRWcFqELww4OKLseJCVTKop5
	XD8WfztMj4k2eyvdaP2JWPKvGD/Xx1I8RNpJtbEV1qfn9VvnhgFyT9z/3dTeScFrRtKhwCJVZ/SBy
	t5UC7rMgvaYdBvn2vA0EnUZs6UZeIGiJUnLhQ9RwgyXcO91ts/h8s9ZqgafXGMEAc05KMJtR+7oUD
	qyJ4ljUWvNJtYpvCDCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QQH-002lgY-Ma; Mon, 20 Jun 2022 23:03:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QQE-002leX-Nn
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 23:03:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 39894B8162B
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 23:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31E0C341C5
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655766184;
	bh=/TZe/YP2QF337a39WuOjnChciiFdYN/X4oGHttBLylw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AoqibELdgjr34VaW8NlOKdLsMLL0zJAR+Ot62A7bBcNfSwpl3s6QRkHaQMd/Y8zOv
	 sXmjPgDgKLDQpRrbRnimJcA974C7wddl0930lTu06ZwvxdNtpzZLqXGiy0J+Q0cshK
	 WpXN7djRT0S/5ktJY64Qmc1N7UbPzV2DU24jXTC5MHIJPH3reQSb/94Zd5cf2pKtXT
	 zp5Ji96ZTyCNsUdpaPF3SwM2N/1wGwnk3OdZwVnSAOtSuV/2+GFL8EZpN8Khnn0Bsi
	 29s9g/K5REXRF5mUA5HgXLTEnMrqK82CrEHpQTBGIaoXGp4Vr1BGyc2sGqGf+1swmE
	 iAt0s6Licjk3Q==
Received: by mail-vs1-f51.google.com with SMTP id r4so12097293vsf.10
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 16:03:03 -0700 (PDT)
X-Gm-Message-State: AJIora9fbV76Tg9+9MGzlFt6chKj8NmLV7oBA8z0xwFUodFSG00RIIqI
	FfGaLvfuPoU2JYq4mecRZNp9vpYputxPualXgBs=
X-Google-Smtp-Source: AGRyM1u/RVN5U63G9HFr68t8lzKAMpiuuVrHV89dBmegx0UQHU1v8TtMPi2UxFLK89ZVnLG11vabRaQ+NgahQlUGj7w=
X-Received: by 2002:a05:6102:5493:b0:34b:b583:f557 with SMTP id
 bk19-20020a056102549300b0034bb583f557mr10777975vsb.2.1655766182967; Mon, 20
 Jun 2022 16:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620155404.1968739-1-guoren@kernel.org> <CAK8P3a2enbvE9a5V=JpUFt7FfyDGLQHTWTszibqqLVoeiMAo5Q@mail.gmail.com>
In-Reply-To: <CAK8P3a2enbvE9a5V=JpUFt7FfyDGLQHTWTszibqqLVoeiMAo5Q@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Jun 2022 07:02:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT9YHgTzPaBN4ekYS7UcBOj_9k9xEcrsoXgW6PCZc8x3Q@mail.gmail.com>
Message-ID: <CAJF2gTT9YHgTzPaBN4ekYS7UcBOj_9k9xEcrsoXgW6PCZc8x3Q@mail.gmail.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Peter Zijlstra <peterz@infradead.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_160307_116353_21C7684B 
X-CRM114-Status: GOOD (  23.36  )
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

On Tue, Jun 21, 2022 at 4:42 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jun 20, 2022 at 5:54 PM <guoren@kernel.org> wrote:
> > >+config RISCV_USE_QUEUED_SPINLOCKS
> > +       bool "Using queued spinlock instead of ticket-lock"
>
> Maybe we can just make ARCH_USE_QUEUED_SPINLOCKS
> user visible and give users the choice between the two generic
> implementations across all architectures that support the qspinlock
> variant.
>
> In arch/riscv, you'd then just have a
>
>         select ARCH_HAVE_QUEUED_SPINLOCKS
Good point, but I think it should be another cross-arch cleanup
patchset, let's put qspinlock in riscv first with the current
framework.

>
> diff --git a/arch/riscv/include/asm/spinlock.h
> b/arch/riscv/include/asm/spinlock.h
> > new file mode 100644
> > index 000000000000..fd3fd09cff52
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/spinlock.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_SPINLOCK_H
> > +#define __ASM_SPINLOCK_H
> > +
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <asm/qspinlock.h>
> > +#include <asm/qrwlock.h>
> > +#else
> > +#include <asm-generic/spinlock.h>
> > +#endif
> > +
>
> Along the same lines:
>
> I think I'd prefer the header changes to be done in the asm-generic
> version of this file, so this can be shared across all architectures
> that want to give the choice between ticket and queued spinlock.
I would put the above part in the series, but they would base on the
riscv qspinlock patch.

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
