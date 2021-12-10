Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35A1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKtBj1lcbSwWHifvJgjZL+n52oeAUuM4T47uvsD7xpg=; b=Ij+3uUE1JBfiVj
	GuhAqj4GbrNYgDU4hmBneQbTb3eADedPw0eIlRN0VL0WLw/qFwcH9dDbCAuU85cKBsACLPnRLCbS9
	XTaRCc0k2hfy396E1EHla5girvaEdn9OaujrScS2A7+ki7wUqaeb2TTiRdC5mAUmg4DrAvqYe7WVA
	3cnjEaCeNeX/WQJWpJ02UoW1Pmj1tIFyD5X3C1Q2H2Vuc+2x/TY5eACddrmYFRooZ5QFAmBKp1otj
	gpbvd3eHfvUNoQO8FGKXMlVh+VQzxlX+L8YU87B6vDcoUV6cwycEVABB1MnHqe8TlFkTu07jMgMEk
	z9BsHUJrI1meD/ZrzV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkWM-003BmL-SA; Fri, 10 Dec 2021 18:21:26 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkWJ-003BlY-9j; Fri, 10 Dec 2021 18:21:24 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso10477037otr.2; 
 Fri, 10 Dec 2021 10:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGnO4bxnTAqMK/uthYlBDN3+OwLPbg309qxpgobdKxI=;
 b=2xsciaYRFWZrAqx7Va4oNSAwRyKCOoY2JafJEzlE2PbmD6ouXSqmSQWlk5tkE7bt8Q
 +ngE7tv7Me/fYMRcB6+D5wKRxLRW0rWL37P1g/wLy11zEkGKIQ+WkhuodeoXIChDriPc
 /Asi8JibQaqOkGRKJe5queDBnqv0/a28HXkE+g2RIAf3ONuLSXWnjAYSCqLisBXT0YW+
 A4zNTXx5ymvG2StmvdWDO0nbr7HnLaYtcvGoQrszbXHK566W1sWp/hhEZxLbFBbcSCtJ
 +7iqeDu6V8QlpBiCbBv3bP5V6DmmjLex7D6eBs0WujXKWPDD7PB6FmNFCq7vcmCCYLKt
 PmXw==
X-Gm-Message-State: AOAM5327fHRzFti2p6+g5KBXCRJqyQsDP46OH6HdU+A0BjukNM3pwLdq
 hEu7UUYf3d9yLW11gO5EBKbtsxTInYe4DfUXnnI=
X-Google-Smtp-Source: ABdhPJxyUbegeOKjvJ3CxiHL7dwpj9EzFVDPRUNdKiJGM3d307QrxgUO9bUGZj0EMwemLB2snxZHAeDirffJcqK0rDM=
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12377743otj.16.1639160481982; 
 Fri, 10 Dec 2021 10:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-5-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-5-digetx@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:21:11 +0100
Message-ID: <CAJZ5v0h_OfrQ92KqsUdiKAfUrXDT9dPXzq4S=b6zi4k_2cPAjg@mail.gmail.com>
Subject: Re: [PATCH v4 04/25] reboot: Correct typo in a comment
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
X-CRM114-CacheID: sfid-20211210_102123_359304_9B7451BB 
X-CRM114-Status: GOOD (  18.47  )
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
> Correct s/implemenations/implementations/ in <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

This patch clearly need not be part of this series.

> ---
>  include/linux/reboot.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index af907a3d68d1..7c288013a3ca 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -63,7 +63,7 @@ struct pt_regs;
>  extern void machine_crash_shutdown(struct pt_regs *);
>
>  /*
> - * Architecture independent implemenations of sys_reboot commands.
> + * Architecture independent implementations of sys_reboot commands.
>   */
>
>  extern void kernel_restart_prepare(char *cmd);
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
