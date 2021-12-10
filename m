Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21AFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI3zen1zY9v9drCEd8EFvf8k/nSV6ZP5kCchkI+WjPs=; b=qj4zClB5sWHl0C
	5nQZ08w1dY6Bsr+aixmz7M1xEEOL/JNPESZMBKsL2m1H7uqLkMSTXmUU/pYe6SwUoF56EmacynM5H
	xBplW5VcBoELZlijgZk+Igm0KxFo2X1oABiTFKPnjLboIzMv8bWTUJOuX2ZIusjh5m/YpQlLmN098
	2UU+6ZBqt4P7a1oETa5rPncoC1LRJ8qcejOGefsbYb20rK43dHS9qjHdOOwB4dC6hz+xI8Nwjai+h
	By8YxZsOJCl9atEyvH2BOQg1mEP6+b/8FpZud+hSPC6a8NSixoca+BXx8ulz6NlQ1BGKTzu1a3Z6l
	J5fMOTOPhFM4t++kQNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkV5-003BX4-QW; Fri, 10 Dec 2021 18:20:07 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkV2-003BW7-Lm; Fri, 10 Dec 2021 18:20:06 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 w5-20020a4a2745000000b002c2649b8d5fso2581524oow.10; 
 Fri, 10 Dec 2021 10:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otNvdkTkoV7wYQ8jKu5rR7dHo6vQCE5BmfrHPdMYTOI=;
 b=wFLu/WlMhZGdCYHcq4AN3QKDW/ODBKelO7lVjsYg7CAJWUdl61JIHhrdd6wS1aa0Bh
 6BxVkKhSeBCVjavykEMjesY5bin4aWNR3Hfo83iSRMEfnEYd8NIbAqFe7Ml0cUdNfR36
 il+XoYI8nzIWRTPUr5xRYIjj5mcFHvhrQDsCBvCRXjNU3T+Ie5ROZGYsMhiaqiRFWiBU
 6tS3bEYs3UXWr2VmoD5B2nqMwVBo/xIHyZ7T5UPKOwdSxScdpfnYDvDvllyeg0PPONmz
 EwU3dsaO43sbAdoIP3hnnsEH7fROb0nl2noXmJfHP8CuYshj8fUoy+GRGPl5IbwYoREw
 0jCw==
X-Gm-Message-State: AOAM532JLHHTjqUWStC96/Odic9h0ibkj0v+ZD29Olh+2J/PBz+j5TWk
 zSVNHUQ62ljiZ32EZc3IL+db9idZvHceFmlsdNA=
X-Google-Smtp-Source: ABdhPJwWhlgSTT1XO9DdsJeGtp3+qj/KLI9CFrQ1iXrm/9qKavB6UGr0uIjkNl6uj3XKEKq2VM+aZTVW+dl+zG+2Q+M=
X-Received: by 2002:a4a:1d82:: with SMTP id 124mr9074671oog.91.1639160403307; 
 Fri, 10 Dec 2021 10:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-4-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-4-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:19:52 +0100
Message-ID: <CAJZ5v0jTJ3f7oUUR690PGaPJsxA8yzua9XDa8MONBHMzHnDfOQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_102004_747745_E96E4755 
X-CRM114-Status: GOOD (  30.42  )
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

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add atomic/blocking_notifier_has_unique_priority() helpers which return
> true if given handler has unique priority.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/notifier.h |  5 +++
>  kernel/notifier.c        | 69 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>
> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
> index 924c9d7c8e73..2c4036f225e1 100644
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>
>  bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
>
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +               struct notifier_block *nb);
> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
> +               struct notifier_block *nb);
> +
>  #define NOTIFY_DONE            0x0000          /* Don't care */
>  #define NOTIFY_OK              0x0001          /* Suits me */
>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index b20cb7b9b1f0..7a325b742104 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -122,6 +122,19 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
>         return ret;
>  }
>
> +static int notifier_has_unique_priority(struct notifier_block **nl,
> +                                       struct notifier_block *n)
> +{
> +       while (*nl && (*nl)->priority >= n->priority) {
> +               if ((*nl)->priority == n->priority && *nl != n)
> +                       return false;
> +
> +               nl = &((*nl)->next);
> +       }
> +
> +       return true;
> +}
> +
>  /*
>   *     Atomic notifier chain routines.  Registration and unregistration
>   *     use a spinlock, and call_chain is synchronized by RCU (no locks).
> @@ -203,6 +216,30 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
>  EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
>  NOKPROBE_SYMBOL(atomic_notifier_call_chain);
>
> +/**
> + *     atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *     @nh: Pointer to head of the atomic notifier chain
> + *     @n: Entry in notifier chain to check
> + *
> + *     Checks whether there is another notifier in the chain with the same priority.
> + *     Must be called in process context.
> + *
> + *     Returns true if priority is unique, false otherwise.
> + */
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +               struct notifier_block *n)
> +{
> +       unsigned long flags;
> +       bool ret;
> +
> +       spin_lock_irqsave(&nh->lock, flags);
> +       ret = notifier_has_unique_priority(&nh->head, n);
> +       spin_unlock_irqrestore(&nh->lock, flags);

This only works if the caller can prevent new entries from being added
to the list at this point or if the caller knows that they cannot be
added for some reason, but the kerneldoc doesn't mention this
limitation.

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
> +
>  /*
>   *     Blocking notifier chain routines.  All access to the chain is
>   *     synchronized by an rwsem.
> @@ -336,6 +373,38 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
>  }
>  EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
>
> +/**
> + *     blocking_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *     @nh: Pointer to head of the blocking notifier chain
> + *     @n: Entry in notifier chain to check
> + *
> + *     Checks whether there is another notifier in the chain with the same priority.
> + *     Must be called in process context.
> + *
> + *     Returns true if priority is unique, false otherwise.
> + */
> +bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
> +               struct notifier_block *n)
> +{
> +       bool ret;
> +
> +       /*
> +        * This code gets used during boot-up, when task switching is
> +        * not yet working and interrupts must remain disabled. At such
> +        * times we must not call down_read().
> +        */
> +       if (system_state != SYSTEM_BOOTING)

No, please don't do this, it makes the whole thing error-prone.

> +               down_read(&nh->rwsem);
> +
> +       ret = notifier_has_unique_priority(&nh->head, n);
> +
> +       if (system_state != SYSTEM_BOOTING)
> +               up_read(&nh->rwsem);

And still what if a new entry with a non-unique priority is added to
the chain at this point?

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(blocking_notifier_has_unique_priority);
> +
>  /*
>   *     Raw notifier chain routines.  There is no protection;
>   *     the caller must provide it.  Use at your own risk!
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
