Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E35CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4v3uco6e/J0xW3ZDW6h39aJC/Qd5mVb0hmFJSDl4k4=; b=Slz+I9i8vqUW8S
	nlgHxI97TtqN0T7dq53AvsfvJGwKhrI7jLqiWFp4qn2xzv/yj+NaZLDQG5njXAEg5+nfrw8O+c+vp
	xjjCcjUZnnTD1vm3q0jChLAcp1NFfJA2POIWsaLpsnawHngpZHFixNe44P+LyYdX1VurSjDoqwOJN
	3FxIE//Z+MBCuaOZFNMidntSoFtnqLvRcitaEEoQWL2p2PdiRagl1ZNYdBnEKCwsADslvLyuvWRnk
	xNcTvEN3EAA56Zxp/zPQAU6jr7sM+iTKPEKup12eL7lQEM2nmah2klT8hOu1AZXVvAdVUugSAyEGl
	RuHTZIii1HcVoBGOubPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29mr-000hdU-QG; Tue, 28 Dec 2021 10:32:57 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29mo-000hcC-OF
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 10:32:55 +0000
Received: by mail-ua1-f47.google.com with SMTP id r15so31337182uao.3
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQ0Ut1LNrzqnM5tmiaXKSEzqL3RAAlFvcxdwMLjQ2+M=;
 b=uQ8hg6hhHCYyv4I5IA47E34YhtNJ3NPkOvsfMWwyRuIaRWtO8DwwI5nkbip0UkXGCa
 /6UKbJi3YDJFnoj559tNhEzCgFZTNWFJSGV8TPQPF1OAb8823kLalG2EY/mutDb7EpTO
 9S+w3s9diwdQCtYa/PuKboJwTx2le0jcmB7YhrndpRoOeVZDHC7VQpjjzJyyoiQmYpSZ
 LZay56SlxZTANHabaZKDp63DGVL/bGaB/BEqAHZhIEkPx4lxIYOegwvwqlKZ/114IP69
 iDuQ0s8SJhw7veblHyP9SFAf5qP8Qm6E6Xv8yNESmGLTmtyGBvcUc3EvJOYudFQ39aYi
 La0Q==
X-Gm-Message-State: AOAM530CBMH7zHPR8FOj9GOXrUPXTVMPnjm8kqt1WMzHAJusJiQgBBsi
 cKiE9Vev1UiF75hyWNtKJsq11OB1HRKBTg==
X-Google-Smtp-Source: ABdhPJwRRWKU/nO3kYLp0MUD2qS9Qt0rQ9zKWmm6qrCCgCPw/k2nS1fAmNWxwe+pBE6NZljarNg8uA==
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr6198043uae.122.1640687573939; 
 Tue, 28 Dec 2021 02:32:53 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170])
 by smtp.gmail.com with ESMTPSA id x21sm3976585ual.11.2021.12.28.02.32.53
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:32:53 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id s144so10072287vkb.8
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:32:53 -0800 (PST)
X-Received: by 2002:ac5:c853:: with SMTP id g19mr6363163vkm.20.1640687573214; 
 Tue, 28 Dec 2021 02:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-13-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-13-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:32:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDL6XXfohzJFTTV6tR=gg=bcCQq935eKUbNaNLHp9xiw@mail.gmail.com>
Message-ID: <CAMuHMdXDL6XXfohzJFTTV6tR=gg=bcCQq935eKUbNaNLHp9xiw@mail.gmail.com>
Subject: Re: [RFC 12/32] iio: adc: Kconfig: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-csky@vger.kernel.org, linux-iio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_023254_814430_42AB7087 
X-CRM114-Status: GOOD (  20.44  )
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

Hi Niklas,

On Mon, Dec 27, 2021 at 5:53 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -119,7 +119,7 @@ config AD7606
>
>  config AD7606_IFACE_PARALLEL
>         tristate "Analog Devices AD7606 ADC driver with parallel interface support"
> -       depends on HAS_IOMEM
> +       depends on HAS_IOPORT

While this driver uses ins[bw](), this seems unrelated to legacy
I/O space, as the driver maps a MMIO region.  Probably different
accessors should be used instead.

Note that this driver has no in-tree users. Same for the SPI variant,
but at least that one has modern json-schema DT bindings ;-)

>         select AD7606
>         help
>           Say yes here to build parallel interface support for Analog Devices:

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
