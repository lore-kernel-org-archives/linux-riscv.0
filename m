Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzU0h5o3mcEdhsNZSZusfjhcCIliaeyWFfy0DcTVj6k=; b=d+Gp0ThvRMWpZ8
	tZ5YVJZSVJyg5cII2H++b7gflC71LS4l3egiHRwIHlMVcToxIuKciLBffRyIFRBHInXd5iVMn8k6X
	2uZeF40GN7741xCpr4frGOX3FsxWcPK2N2HOVJihCDhu7snVp7xt9xCT1zQE6SA3Mkie4fph0LkVf
	MXyDVSjNydlvetCLPO413gxbt1ekCcM9dCF4LCmX5CrWutPOF9EeZWlkxPza6VBnkx2LIaZ4HjSoK
	NLVN/OyblO3wixPQ3kCEvNkTwuItQo+3OOKtC+Ld4fqLtw+u7pRYQIseniCKuHU5GulwWC7ek/eEj
	gDHI6YOLsjcXA0amFaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkPS-003AGb-PA; Fri, 10 Dec 2021 18:14:18 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkPO-003AEJ-EC; Fri, 10 Dec 2021 18:14:16 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so10420438otg.4; 
 Fri, 10 Dec 2021 10:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaOuCzlDrEGoU3kCCyjiPh5ZIczFbf2cAVp5IUpr62Q=;
 b=lW2O+4xxf0jG2RjjTBqUp3ZxOFcGBNm7kOva3N4cywY+M+yKUarBy6EpugBmToWSbE
 dUrD5eFd8vI0MG9vMpHmKsc3txKtRx9t1v0CNiQI0Fhsbu5jFMuRTTijXQ0NaGhVM15b
 fNI9h4BvDAgQYzSXBm9sSmWj/agneYD0pzQQavB1TvvN7L7SDmkRLySn/hLxoCTYKc4a
 D4dBlrgOopdzrlmxCBNH4t1cV+WY6hThrvotpagZ9f8gdQ2ZlC1pSzsy0IO34bbYLPX3
 mKJHRyvf5xm4re3BAHV4hONKc2QNHDcfMskz4UuJejsF3VIE2Kjq++fLds1JDUa5we2/
 z81w==
X-Gm-Message-State: AOAM530BRmJx1EuoJsBLO/JwtC7a0vZlobLbkT0C6Je8gELh+PXgx0hV
 yR3ENaxYIcRS+UrnrW1eYI+WihBOuj8++ht1zk4=
X-Google-Smtp-Source: ABdhPJx5VEl25dlL8StyZ7/vR+sIp4uhzbZQ+4jxftcUhgC3Wucypp0Twl9yCOfT1qw70j5+PgOSc5gj4QOVrzsPiE4=
X-Received: by 2002:a9d:4c10:: with SMTP id l16mr12483219otf.198.1639160053505; 
 Fri, 10 Dec 2021 10:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-3-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-3-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:14:02 +0100
Message-ID: <CAJZ5v0gy5M5yYT7k5CY0JtW4MvsgKq4psBEw81UKz=pjGo0xPw@mail.gmail.com>
Subject: Re: [PATCH v4 02/25] notifier: Add
 blocking_notifier_call_chain_is_empty()
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
X-CRM114-CacheID: sfid-20211210_101414_540522_40BDD28D 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, Nov 26, 2021 at 7:01 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add blocking_notifier_call_chain_is_empty() that returns true if call
> chain is empty.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/notifier.h |  2 ++
>  kernel/notifier.c        | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/include/linux/notifier.h b/include/linux/notifier.h
> index 4b80a815b666..924c9d7c8e73 100644
> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -173,6 +173,8 @@ int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
>  int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
>                 unsigned long val_up, unsigned long val_down, void *v);
>
> +bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
> +
>  #define NOTIFY_DONE            0x0000          /* Don't care */
>  #define NOTIFY_OK              0x0001          /* Suits me */
>  #define NOTIFY_STOP_MASK       0x8000          /* Don't call further */
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index b8251dc0bc0f..b20cb7b9b1f0 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -322,6 +322,20 @@ int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
>  }
>  EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
>
> +/**
> + *     blocking_notifier_call_chain_is_empty - Check whether notifier chain is empty
> + *     @nh: Pointer to head of the blocking notifier chain
> + *
> + *     Checks whether notifier chain is empty.
> + *
> + *     Returns true is notifier chain is empty, false otherwise.
> + */
> +bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
> +{
> +       return !rcu_access_pointer(nh->head);
> +}
> +EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);

The check is not reliable (racy) without locking, so I wouldn't export
anything like this to modules.

At least IMO it should be added along with a user.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
