Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8B9C636C9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 11:24:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007A060FF3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 11:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007A060FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xihLB6ig+Zw3w6U4vhtdTe53ybA8TNxWuF0Hk6CwQv4=; b=qDvGIy+qF6C8R3
	D5WTQsFimWzmNz2R++mEoHl17OwMUvdaRUC0Sxn8G2GgsXWwgcfXEXaDvwvY0kZB4J1CFzxB55bAQ
	xLZg6GTe9ZX37Zpdi1OVViJdXNKbTY/V8c3VOb4DWqUgCKyrk45J3DgL4u2JEYRpl6eZXCqtsrwJQ
	vNayz3h65gjQRQ9z+OgSZJ5CoZp1ht4bCqofN4zQd5gZDheLiKAN9FrD4W0TBmJ8s3bzc5qUnPBka
	CysugaemfwTvMbGVbSDyh111vSRPk26x+mfwuBqMKYepxxuoQIgOx4dQJcVdUx+QH2XtHUjrBG+u1
	NQ3oHOicbS+sk+cvNTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6AKP-00FQKu-74; Wed, 21 Jul 2021 11:23:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6AKA-00FQG7-0j
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 11:23:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c12so1792127wrt.3
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5r4SARj9UXSpcoZXx50eoUO8FuzdCp7+FLIK6b9NrWI=;
 b=Cg//U4Y/1gDgxt7k5xmPgDyo0T0uwh0g+60Sh5AVkHS8/ei3NhtyBF6YUUZECQJ58p
 cUzo7OyBMRL1w7ZINYSSzxOiPjjdfCP8gmgVRIQrnKhlqKVsz4YOjpHWokj0QfreyYfD
 rHb7sejYFAOJAr8kwsiMNxNWVcph5CirgTBgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5r4SARj9UXSpcoZXx50eoUO8FuzdCp7+FLIK6b9NrWI=;
 b=VDYe5zZFiO1fgpnc3W9vq++Iefx+ulRRXSNHVzA2+Ihs1zuEumcM6JjrBRzgGYl463
 5yaUhaenggC6MjlCdXgiKvjDu2wxP8P2CUyzO8NTZy8TU5t2D2vA21rXue54ag/l9SIO
 NwfzbImqC2tecBWh+JyPDSAYDGDhw+pX/dO43GdtMqCSwTKzK5jIq/G72WIkf1BrQ2YZ
 5uV3qjqkqRWIk1WVDa7VAl+yGzKc3DiPUzv1Y0x3zcW0mo0UmnrZMZMgZ2Px6YNFSUG0
 RSJ2HPBUo2tc+R4L0r2OLiGdNdoNWeudbp7Xj6n12H3pQGGvobPXx1SzEHg07cU+9dip
 jtIQ==
X-Gm-Message-State: AOAM532AycFDzY8SVVJPXgL+PKjJhJpwj9+Jj3yUw+YRPe+SpUhLi9e6
 UJQdJhTKbz5sszqjpOS3kxPhUg==
X-Google-Smtp-Source: ABdhPJz23x9YYT7kn6ADtNpcXFeq0lIiwVkk98kY+doYcdNtjlUQIlafrn5wFGkpRjXik49b18LU5g==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr41030703wri.367.1626866616114; 
 Wed, 21 Jul 2021 04:23:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f26sm21862934wmc.29.2021.07.21.04.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:23:35 -0700 (PDT)
Date: Wed, 21 Jul 2021 13:23:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YPgDtQ0sGRlvNH0F@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
 <YPbWrV/cIODdgu6A@phenom.ffwll.local>
 <37e05f02-b810-0cb1-cc4f-95711cd148d9@suse.de>
 <44a75f18-e3a6-f764-b0ec-ce3ac05805a9@redhat.com>
 <1e85fae7-ef95-b2f7-3463-e90958e54684@suse.de>
 <0ad257ce-44d9-beea-8afb-c879146c523b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ad257ce-44d9-beea-8afb-c879146c523b@redhat.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_042338_105928_A1993C52 
X-CRM114-Status: GOOD (  23.44  )
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

On Wed, Jul 21, 2021 at 12:15:12PM +0200, Javier Martinez Canillas wrote:
> On 7/21/21 12:07 PM, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 21.07.21 um 07:09 schrieb Javier Martinez Canillas:
> > ...
> >>>
> >>> Can I simply put the patches in to drm-misc-next? There was some talk
> >>> about a topic branch?
> >>>
> >>
> >> ... which AFAIU means that there's no need for a topic branch, since the
> >> patches will be present in linux-next. And the EFI folks can use that to
> >> check if there are any integration issues or regressions caused by these.
> > 
> > Merged into drm-misc-next.
> > 
> 
> Thanks a lot Thomas for all your help!

Yeah topic branch makes sense when we have further work that will build on
top of a patch sets in at latest _two_ different subsystems, and it
doesn't make sense to just merge it all in one place (because too much
work, or a refactoring that's too invasive and will cause random conflicts
with subsequent work in the same subsystem, or ...).

Otherwise just acks and then merge in one place. We shouldn't do
bureaucratics like topic branches if there's not an actual need for them.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
