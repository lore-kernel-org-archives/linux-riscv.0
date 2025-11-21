Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07704CFC28D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKUQRzgucOD2C3/yNDu3vbM4EOlsk+8z18o9MmpP2XY=; b=WqGuCnirKIK8LI
	936QDujYGz3aFr3Y6PD/EnEf6Pvl4EBhYmC2OSlFMX7RZxte6ov1zn7zX2RqvPgzJU6YBDr5ENElO
	W25OK6sAScA7PSw71/d+i/2TSG8Gr2EX3At1YayKwChs1qUiDBreEvfHp8hRuR+2zuexmR9Y0Rv4p
	jrKQfzpmlRazLqIimBd2v3Mm7gOmGovoGKl8Ea7pVT+dDP0neVf8eDLeHeyr5LDY7n+D5r4Cllwl4
	n8Vw+XITzc59hHstapXAEyVY/ICGvg9SWYXxyBihi466UKf+NKZGNRn8j86tTroTB8qC7z0QnuV2W
	P461h2sIj2eUwO3rmYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTVO-00000008f39-1zWI;
	Fri, 21 Nov 2025 15:57:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTVM-00000008f2P-3oBE
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 15:57:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17B4B60515
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 15:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10AEC19425
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763740619;
	bh=PxN1kKcbmsayKjAbhYkIf5ei+/f87NdEWIzkcYKf1rA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DIGPz/iTjd1rrI+oKDc0x8sgQ+7u2JmiLppyKdFpsqEuxu/zZGukGjD0jWkrIk9NN
	 Q5hCO/wduxP89YcoAVd65lmLHSK6jmTR+XKr31pIuiSrrI2USJa5ArYRaGm9PFyRN0
	 xdv+BaKnam4katXkC/DPgjd6G12gVzV0GPmNI3jQpp1dvRTyUwV4pw3Fs/PV3bp7gR
	 CfLOisDVuTp8n9p+gXFteSs1MW5aIq8nsYl8CK73Cw6TivYgBzaw8OQrb9EZTGSzi2
	 ZlIzym4LPBtOPZ+QVNK/d8LpJwvUL05c9MYMaL0xFLbvK3VF8/y6Coe6xboh30nkFO
	 lq4Bu1UNXqoEA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59447ca49afso283571e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 07:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrvEJk3IEM4r4puuk2CUF377fUnR3vPR2ieqNuAo2JrQChdSpd+fHSY3r0+68Kz8SEsBAbr2IAsH/tmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrAStvl57xH7fe0wHXFQe4NpqeMB4Gq/hfk8csY2PyzZ6rIjPD
	X6pwL7D/jGm/p7lQPDk1FYygtXNJFn8gnwaRnjgUUY4IPRN115gFT4LgO8hf5fEsjAJ2dp9F+HT
	oumG2dFII3aNPAC431ooyW6dsauNopBw=
X-Google-Smtp-Source: AGHT+IFc07wm23hRt5x6E5vt9dWJKlKV7r/oPKbOUgisqHzxDRZC6hX2KMiXOjZbJFYb9IW5F8q//Vmfp5+N+9MSM5I=
X-Received: by 2002:a05:6512:224e:b0:593:f74:90c1 with SMTP id
 2adb3069b0e04-596a3eddddemr1011328e87.42.1763740618060; Fri, 21 Nov 2025
 07:56:58 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com> <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
In-Reply-To: <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 16:56:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
X-Gm-Features: AWmQ_blY0LARqXnA2mx39E1yO5MH1W25KbCHBoidZ2MUQVLTBxhVpSWsyYxPQP4
Message-ID: <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
Subject: Re: [PATCH 0/6] arch, sysfb: Move screen and edid info into single place
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
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

On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> > On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>> struct sysfb_display_info. Update all users.
> >>>
> >>> Sysfb DRM drivers currently fetch the global edid_info directly, when
> >>> they should get that information together with the screen_info from their
> >>> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> >>> passing this to drivers enables this.
> >>>
> >>> Replacing both with sysfb_primary_display has been motivate by the EFI
> >>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>> Using struct sysfb_display_info this will become easily possible. Hence
> >>> accept some churn in architecture code for the long-term improvements.
> >> This all looks good to me,
> >>
> >> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks
>
> >>
> >> It should also bring us one step closer to eventually
> >> disconnecting the x86 boot ABI from the kernel-internal
> >> sysfb_primary_display.
> >>
> > Agreed
> >
> > Acked-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks
>
> >
> > I can take patches 1-2 right away, if that helps during the next cycle.
>
>  From my sysfb-focused POV, these patches would ideally all go through
> the same tree, say efi or generic arch, or whatever fits best. Most of
> the other code is only renames anyway.
>

I don't mind queueing all of it, but I did get a conflict on
drivers/pci/vgaarb.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
