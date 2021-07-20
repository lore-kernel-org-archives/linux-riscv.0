Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB47C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 13:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAD36113C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 13:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAD36113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nIRO1BM9/oe13lOzljfwd1sXOmPnT9mkK1lhHW8zfI=; b=UywN3MXMM2PxKW
	1w8v3AlBdzD5LBbP7/pbPxY7/A8sGgewLl+m9X662YAJfVnFxMh6MnpNYCYHjJEeeB3UqAvyyzMsn
	N5/75aRl8cw21Vcq3X+uC2acz5vJErqWMpspFqUJvu4FzFzjxoJVtnXEpQB9vHJ3JwrxWiIlXMTnk
	h/HXMOJf4rINY9SU4se8Dzmz66H7Uo/FSXcrIvlqzKfdxxwxPSOJzsX1VL4wAmhzo0Ir8mrV25FyO
	w6kyxKKTJY/Op0Yj/J6PTsJIfU5Arx7v3GrI04VmZ/OB5AIwDu6bP6VHWR4y1tu3WbHm2iRRDy5Oe
	CqLLVWK/fQexXYrw1juQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5pO5-00CscH-7c; Tue, 20 Jul 2021 13:02:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5pNN-00CsVT-5k
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 13:01:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so1456284wmi.2
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aT7B7aLtrHA38WRCCkcWibI+OBLuTfXFqvYRJ204kL8=;
 b=WQOOu9EUP4QZrBDWS9EctGVO+GmPjrxym15Qbs5R69qSSEdvCHmpIY1/pk31fA69bp
 3bhC+HD4e8CKzboAfJ+pob2QA2TRhC1Np5OjjzICbqkxEwpGsaSp5RJW4pQU+z0OC23I
 0sG4uqigJR5y1K6AdXcTXz1r+jHYxj5pVPrh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aT7B7aLtrHA38WRCCkcWibI+OBLuTfXFqvYRJ204kL8=;
 b=daDmxSawsVP0lxkMb1E1jmVu4saUguDPQJJ/iLLE/SsJvQpzzO6uv00Qij2nYpHp4U
 rh8kSyCeL+ic3+AY2VrJNxzDX3+a/QaqoWzTb1k1ctnEBwbdUDLDgpe3Li7tBAdJXAzf
 psvKSh95S5OAoj7gtVWF0zGJp7wn9clFhex13LKj/CSw8f+MOPQjb5zGVH+nGi+6j2Hi
 XVMFLnpjMxFkd92RX4VAqYKo2nVk3DZRVHcrr7+m3cx+eT7YVVt7ppzxk2rJSyWlm5Rq
 LVNSa52TNXvPwWEhbtKxuoVn10mD0w4lajnXaj4XiH5yz96w9E5teZwWkyytGoD5XbLF
 m4Nw==
X-Gm-Message-State: AOAM530AHPxkIsYjG/d3rud/HQwMCYqlYXudFI+G+FLnnAP/vSD6um+z
 MUKwlYqG3oSRDg8mEuL5wD/s/A==
X-Google-Smtp-Source: ABdhPJwyy66JJKeYq0Mz7cYqrI/HK2CM9a/YOzkD7Z06g/Y6R4UrwQlWLQ5wT2w19Z/rHR9fxuhTcg==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr32984505wmd.11.1626786090699; 
 Tue, 20 Jul 2021 06:01:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g18sm19422048wmk.37.2021.07.20.06.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:01:30 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:01:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, linux-efi <linux-efi@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
Mail-Followup-To: Ard Biesheuvel <ardb@kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 linux-efi <linux-efi@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Hans de Goede <hdegoede@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_060133_273033_14BBA434 
X-CRM114-Status: GOOD (  37.66  )
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

On Mon, Jul 19, 2021 at 09:10:52AM +0200, Ard Biesheuvel wrote:
> On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Thu, 15 Jul 2021 at 18:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > >
> > > Hi
> > >
> > > Am 13.07.21 um 18:59 schrieb Javier Martinez Canillas:
> > > > On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> > > >> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> > > >> device, but for aarch64 this is only registered when using Device Trees
> > > >> and there's a node with a "simple-framebuffer" compatible string.
> > > >>
> > > >> There is no code to register a "simple-framebuffer" platform device when
> > > >> using EFI instead. In fact, the only platform device that's registered in
> > > >> this case is an "efi-framebuffer", which means that the efifb driver is
> > > >> the only driver supported to have an early console with EFI on aarch64.
> > > >>
> > > >> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> > > >> support, that register a system frambuffer platform device. It either
> > > >> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> > > >> VGA/EFI FB devices for the vgafb/efifb drivers.
> > > >>
> > > >> The sysfb is generic enough to be reused by other architectures and can be
> > > >> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> > > >> logic used by non-x86 architectures to be folded into sysfb as well.
> > > >>
> > > >
> > > > Any more comments on this series? It would be nice for this to land so the
> > > > simpledrm driver could be used on aarch64 EFI systems as well.
> > > >
> > > > The patches have already been acked by x86 and DRM folks.
> > >
> > > Time to get this merged, I'd say. People are asking for these patches
> > > already.
> >
> > Can we just merge via drm-misc and make sure the acks are present and
> > I'll deal with the fallout if any.
> >
> 
> Fine with me. Could you stick it on a separate branch so I can double
> check whether there are any issues wrt the EFI tree?

It'll pop up in linux-next for integration testing or you can pick up the
patch here for test-merge if you want.

And since Dave has given a blanket cheque for handling fallout he'll deal
with the need for fixups too if there's any.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
