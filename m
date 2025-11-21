Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A298CFC28B
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYzi3E1NDCSKeBhtYfQx7mf+32B/yGy0Y6ij1y/3NJ8=; b=FHHGegWRSMMuoW
	LKLKVC1CyO+UolWxfbdWvmgRORTJw/6AUgWKKSn1D8XSwIcaYgS1mjPE31228Of7zSAwmbzgujypO
	CH47+TardD9gVEPO//ioRNwLS69WQB2OG0Gs+8ST2hNB9I4BzcyAo4R2i+0JE8P1sWTvW5Q1YzK2C
	cR5Pfk1D/KQzT1EPuKUEXIMo3lLrhHljX3r7eMMkv2+Yy24EZl4gFggPVLMkxr6miwB1SFRmyuiZR
	kkRI9EUXbU5aDvsAHa9ep1rtgpgyCbynOg6N103TbqQlVZ3pQ4tEPXyaRLf2MPbeZvlGzTqwtOO5g
	6r+EVY3N9Hq58FIJRY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSsH-00000008bMN-23f0;
	Fri, 21 Nov 2025 15:16:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSsE-00000008bLW-2Er4
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 15:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5F5B44000
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B057C2BC9E
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763738193;
	bh=4Nw5kzDQ9aadF93520L+loYg4Pe3c7ohExj2x9LkHTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YZZ1uHWX8jA8h3KqeGr5dk5BqSVqo2ZxZUdgIweTw8ldAfF2BlKGbx9hcCetumLYF
	 6Z0Av4erPZ1ceu78hk33NVgzoft53GdBcDHrjLQI208QVTibCUAnQCXJr7dFEKOJzp
	 vgyagzRm0Pw7hrUcJLqFULp4DiiDbA7fgHa7kGVIyYElH9FO0ZKbsfr0lXWeW/Etan
	 9UrtWfJtqyHR0CmqDBUR48vIDrb0Baro3f00cbZ9KAHq7CW2noZ8PM+tJ3/z8URu75
	 6Z9cxuWlBxzHnFoYSYDYrRggRq5Y9axSC4q01vXWPQt8uMMkjzBr553v5fFmpzGmGb
	 +QnmP3qW8lTuw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so2963597e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 07:16:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVScAiOxRnMLwKdorplDF3fJHt1Hb9/gjfHlToH63WqxdJw7FOoPDaGkoSk9CUot77WJ+F1YENrJvSHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUkVBFl8V3b3JpxzSmpslMX6FHNqkaNSVabLI0yJQSEgat6q3J
	SAQyY6ACyPgaP3TAar9Jy3KO7Ob1ruI0D1hWh8vObFLbMIeF+dtyXSyPJiM53u1ewpIuYFc4nFL
	Hh7kbXLKgeMk6lvgAXG9R5ewHOKyZQNo=
X-Google-Smtp-Source: AGHT+IGPowCSKA7rqmBuuVeVvwKvJAgVwSGnoB8Wq+tDig5gUYW9uVP5SF2rLUXJXBy7GBEfdZMPDjZn9AIuPMCXlv4=
X-Received: by 2002:a05:6512:15a6:b0:594:5f1d:d60d with SMTP id
 2adb3069b0e04-596a377e72dmr1012107e87.14.1763738191788; Fri, 21 Nov 2025
 07:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
In-Reply-To: <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 16:16:20 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
X-Gm-Features: AWmQ_bl_zPBWf1NywIhUPQAGEMUCFj4H1ZabIpySRf4mYN0qS7e_KlhM-cPxo4Y
Message-ID: <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
Subject: Re: [PATCH 0/6] arch,sysfb: Move screen and edid info into single place
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_071634_592553_A2D0D577 
X-CRM114-Status: GOOD (  15.05  )
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

On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> > Replace screen_info and edid_info with sysfb_primary_device of type
> > struct sysfb_display_info. Update all users.
> >
> > Sysfb DRM drivers currently fetch the global edid_info directly, when
> > they should get that information together with the screen_info from their
> > device. Wrapping screen_info and edid_info in sysfb_primary_display and
> > passing this to drivers enables this.
> >
> > Replacing both with sysfb_primary_display has been motivate by the EFI
> > stub. EFI wants to transfer EDID via config table in a single entry.
> > Using struct sysfb_display_info this will become easily possible. Hence
> > accept some churn in architecture code for the long-term improvements.
>
> This all looks good to me,
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> It should also bring us one step closer to eventually
> disconnecting the x86 boot ABI from the kernel-internal
> sysfb_primary_display.
>

Agreed

Acked-by: Ard Biesheuvel <ardb@kernel.org>

I can take patches 1-2 right away, if that helps during the next cycle.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
