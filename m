Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127E9C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 21:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0jSd40MivSXo9ebvpHJiK3udNMgIZfY3yZc0FU5Kxg=; b=fhevIGp853maw3
	PYwxXj5dEJwU0cGYoxH2mXdXY0VjQZM5QXfF6Rfs60g15WSxxOKkUNxdWsjCAG2FB62a9cp09Bg5R
	kY0abyR+1N9NtoJoeqK3FOgT4vy1z5yIG3TDxjwmmnRohp6umuywKFVe0g+WelnSmLOTnjSACMcA/
	EWatEjCgUjoZk3+hxON9bw5/gEDizudonvOmP0Qaf9WL4ISyKh73rqbTiS2h8RFOTRE6/D6g1R8uJ
	JQqLhpbn6i3+EyTDkXbtjkgvms/Z3bwECJBKZ9QSfbUXa68Qjn9VpyA21ySVEhCqYzux+DVRA/h15
	n7NvxyVWN+fxF5Z6CIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOn4w-009qe3-AD; Thu, 18 Aug 2022 21:29:26 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOn4l-009qZY-Mn
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 21:29:17 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3246910dac3so75074077b3.12
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lAZWTD/ZICVg0LDV29If/DkOf/M6td1O8C85lbuNtx4=;
        b=Jw2fwjJxFysS6dly4T7qMHiVlXuUDJnlFgx69LZliYnmBo7zmEErUGMNbIcd5mFJ3l
         T5L2JOuj40RPJbtngjWgicprKfi+Qp+SXbdVdtyX5SfapH4IwU0TV1qhIXJl060ox0G9
         k00nBwD1V5o5EcvEG06md00j8wP9t8xp1ewuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lAZWTD/ZICVg0LDV29If/DkOf/M6td1O8C85lbuNtx4=;
        b=uA8sJrDH7Q/OFFjKrN4SCDDX4lAa+x5g3Xx0TjG3ALz9aoNuxxYIS5tptvBSQFDncJ
         y4RjiRTzwobcz/L+3/P/s3ttEX3VMLytBen8NQvbOZSU++zNm1TQEjYuAuR57XEPgdT/
         9dW95mwcGZZ0QrwNYOyhTsgmyudvc96rLX+AD92SKfHk0j9mUiU3ZKBhWvxnWs6/456I
         SCKtPCvaaBmscj1dYCcVvRniEbzsjY7jVfEW85Cr09QtVLqJjOeEOXjV1l6hwv5TXxfD
         NBQsm1KfqkOsZIcwRkggQHk8BW4erJrj+Vcv22nIVQHJjUzeBe8SUnNB6bR+gDGGw1ER
         8qhA==
X-Gm-Message-State: ACgBeo22z8CI81vOPCNKixmkBrK4/r6EjuTcAvDTYJpft7fnjkw1PLTy
	LwjvQXJ1CdLaScwWZpl3W4u8WWWjNFkkkOepyOEC
X-Google-Smtp-Source: AA6agR6gTUMES80CQ41uaydLm3+tG//C1C6nybqXPGXeiBU9JHT0M2je0AYehFCgFl9XqCTTnUW5KY4BWhSwdd3P+zs=
X-Received: by 2002:a81:10c9:0:b0:337:6e4a:af6c with SMTP id
 192-20020a8110c9000000b003376e4aaf6cmr2333072ywq.508.1660858154077; Thu, 18
 Aug 2022 14:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112408.155561-1-apatel@ventanamicro.com> <CAAhSdy15v3-_2bbJuCVm5zp1nNHHLjtypAESOoPkcChjgFsssw@mail.gmail.com>
In-Reply-To: <CAAhSdy15v3-_2bbJuCVm5zp1nNHHLjtypAESOoPkcChjgFsssw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 18 Aug 2022 14:29:03 -0700
Message-ID: <CAOnJCUKUTt1VfU+wMfxE4P21ttW5uaegXD+0oq4O4KgpGOWhaQ@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_142916_031999_AB36A7B2 
X-CRM114-Status: GOOD (  25.67  )
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

On Tue, May 24, 2022 at 5:08 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Palmer,
>
> On Wed, Apr 20, 2022 at 4:54 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Currently, the range and default value of NR_CPUS is too restrictive
> > for high-end RISC-V systems with large number of HARTs. The latest
> > QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> > restrictive for QEMU as well. Other major architectures (such as
> > ARM64, x86_64, MIPS, etc) have a much higher range and default
> > value of NR_CPUS.
> >
> > This patch increases NR_CPUS range to 2-512 and default value to
> > XLEN (i.e. 32 for RV32 and 64 for RV64).
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> Can this PATCH be considered for 5.19 ?
>
> Thanks,
> Anup
>
> > ---
> > Changes since v2:
> >  - Rebased on Linux-5.18-rc3
> >  - Use a different range when SBI v0.1 is enabled
> > Changes since v1:
> >  - Updated NR_CPUS range to 2-512 which reflects maximum number of
> >    CPUs supported by QEMU virt machine.
> > ---
> >  arch/riscv/Kconfig | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 00fd9c548f26..1823f281069f 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -275,10 +275,13 @@ config SMP
> >           If you don't know what to do here, say N.
> >
> >  config NR_CPUS
> > -       int "Maximum number of CPUs (2-32)"
> > -       range 2 32
> > +       int "Maximum number of CPUs (2-512)"
> >         depends on SMP
> > -       default "8"
> > +       range 2 512 if !SBI_V01
> > +       range 2 32 if SBI_V01 && 32BIT
> > +       range 2 64 if SBI_V01 && 64BIT
> > +       default "32" if 32BIT
> > +       default "64" if 64BIT
> >
> >  config HOTPLUG_CPU
> >         bool "Support for hot-pluggable CPUs"
> > --
> > 2.25.1
> >


Ping ?
It would be useful to include this patch sooner than later to enable
high HART count testing by default.


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
