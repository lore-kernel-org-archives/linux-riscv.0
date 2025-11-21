Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF12CFC291
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKVg+9EgjX/1FWUYUtpHSkd1VuClcd3Mxiq9HYZXTTs=; b=SOOWVqvZzQwehP
	7PvWJH1xwbnGUro/a04IrrcIDopFhMA8dbJVnNEhxw8VMAWelHC7adxjVmyiz2lBg0C4iDWYYle0w
	vwYY7JGISeT5IJTWBkPMPDKVqfUIsiE0/kHQ1tLfHlUfivAijotFO002zPNEdfNm3TNk9k/SXSyo0
	SKwlu2XXF+hcmzEzKAE4hA/NUalTdKzOhL8W+PqE4cbVlOund0UWPULsV/NnzndidpjHFgt9eq2Be
	4NJ562MEVyTeUNBOjpWzyptMXVdoQyR/rdSxD8L83iLm/Z/QjKEINHEvikXGM7Dt6sFH5pVpKecQl
	q4MzOTbzYANqaQbSucJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTrd-00000008hcA-2A0d;
	Fri, 21 Nov 2025 16:20:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTrc-00000008hbT-0K9q
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 16:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2697D605CA
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 16:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE744C2BC9E
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763741998;
	bh=cET4fLR+Sx0tqItmiU0JPHurpZgDU1nqYWJPQ7uvhYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LVn7sgHiTk6RLTGHtFAYvT5jt8uzinAFRBsJxMA1SfZel1bMIJ1hFT843Hnfd20C6
	 yJGuhMhYYhggX1rZbeXzTJCiyw2JtfyOjPdE+gZyUeZuHTa/3fich29WX1yfpBasMI
	 +pp3yZJV7CyDiEY2ErtONnDXBelFq5fitTil+cntXvg4ftcD+K4w6Y/2+c3n+JqRod
	 RKqEoEU/bqquH5adcQVN11faw3W7KgplzC+Js1wPpvpvsdHqhTqSANFBA4dC1xnUXv
	 TXqyK+KZNpwLWL/7XkONE899kog8Wbxb7wgM3KGd+kdA3ao++oNai2xTACQ3304AlS
	 7mJu7ZkTqBQIg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so3076069e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 08:19:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPFh5R+Rk5UKyzuscsjIymOeAXxOpOCkYjw6lV/cSb8mGmsVGmvSG8nmGKhQPKYsLA4/nBVclFAvOVTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YypgJi1TW8L8EkDeAidMAx1m40/Ch8+qt1WTQlLeFJOElLMykm1
	jizojiP+BIXZ13Dlqa56f5FOz3wfO03dRT8s7u7qvuzd0E5zFSap4yONIxYinGFdxOAiTFAORw6
	WtWpktGH+RBRIFca8FNplCxcmmf1BDAc=
X-Google-Smtp-Source: AGHT+IGeSY0QcKkdeUCs++wMYjj72N3cUYU9kW2Fl9IQJ23AXOiUCrIM5BGdicOeoDbtfPEdjzSeYm/zK81S5JjGD00=
X-Received: by 2002:ac2:4e04:0:b0:595:90ce:df8e with SMTP id
 2adb3069b0e04-596a3740821mr1260884e87.5.1763741997082; Fri, 21 Nov 2025
 08:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20251121135624.494768-1-tzimmermann@suse.de> <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de> <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de> <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
In-Reply-To: <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 17:19:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
X-Gm-Features: AWmQ_bn-6TfeudJLq0R8hLHr8efLSQaLZUt3gyg8tPWks9v2PmiXguu4ImOLBA0
Message-ID: <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
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

On Fri, 21 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>
>
> Am 21.11.25 um 17:08 schrieb Thomas Zimmermann:
> > Hi
> >
> > Am 21.11.25 um 16:56 schrieb Ard Biesheuvel:
> >> On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de>
> >> wrote:
> >>> Hi
> >>>
> >>> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
> >>>> On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
> >>>>> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> >>>>>> Replace screen_info and edid_info with sysfb_primary_device of type
> >>>>>> struct sysfb_display_info. Update all users.
> >>>>>>
> >>>>>> Sysfb DRM drivers currently fetch the global edid_info directly,
> >>>>>> when
> >>>>>> they should get that information together with the screen_info
> >>>>>> from their
> >>>>>> device. Wrapping screen_info and edid_info in
> >>>>>> sysfb_primary_display and
> >>>>>> passing this to drivers enables this.
> >>>>>>
> >>>>>> Replacing both with sysfb_primary_display has been motivate by
> >>>>>> the EFI
> >>>>>> stub. EFI wants to transfer EDID via config table in a single entry.
> >>>>>> Using struct sysfb_display_info this will become easily possible.
> >>>>>> Hence
> >>>>>> accept some churn in architecture code for the long-term
> >>>>>> improvements.
> >>>>> This all looks good to me,
> >>>>>
> >>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >>> Thanks
> >>>
> >>>>> It should also bring us one step closer to eventually
> >>>>> disconnecting the x86 boot ABI from the kernel-internal
> >>>>> sysfb_primary_display.
> >>>>>
> >>>> Agreed
> >>>>
> >>>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >>> Thanks
> >>>
> >>>> I can take patches 1-2 right away, if that helps during the next
> >>>> cycle.
> >>>   From my sysfb-focused POV, these patches would ideally all go through
> >>> the same tree, say efi or generic arch, or whatever fits best. Most of
> >>> the other code is only renames anyway.
> >>>
> >> I don't mind queueing all of it, but I did get a conflict on
> >> drivers/pci/vgaarb.c
> >
> > Probably from a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
>
> https://lore.kernel.org/all/20251013220829.1536292-1-superm1@kernel.org/
>

Yes, if I merge back -rc2 first, I can apply patches 1-5 onto my
efi/next tree. But then I hit

Applying: sysfb: Move edid_info into sysfb_primary_display
error: sha1 information is lacking or useless (drivers/gpu/drm/sysfb/efidrm.c).
error: could not build fake ancestor
Patch failed at 0006 sysfb: Move edid_info into sysfb_primary_display

If you prefer, you can take the whole lot via the sysfb tree instead,
assuming it does not depend on the EDID changes I already queued up?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
