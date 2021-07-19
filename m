Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDDAC636C8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 02:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7194561029
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 02:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7194561029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HRGQQbLEGk7qEhj8meAETs1balqb5bfXofC43N4x10=; b=f9WxgGixf+OCMA
	X+zl8cSOFCuAOuWSnilmLMSo5z+4s6Gb++gSxOdBC/65IKEzBV1kPZcLLzXs6OgCZkXy3OF6qfz0H
	V60gMJXE5rGtxFHoVL6jzlSpGdLDeU+Ik/XXiKD9XLpCDXTNzw91KkV7L2GCrOnWOzbw4AP/fZ9dk
	uwvJwaj2VM0FkBfvXZwE3ATMR9YCvgumHWacb/2hij8u/FPv0CoYyxjPkZysD3l7wWZ71DBE1xmSu
	lQvb+YUh44Y4FCs2v4+7qApeBs8BDm4RT44I91otymvzkScn58H7TD9qCPJBKPg1Plc8aAPoYKFxp
	rxDOzvat/0WBL5TuMrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5JVD-008Ix8-UQ; Mon, 19 Jul 2021 02:59:31 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5JV1-008Iuy-H9; Mon, 19 Jul 2021 02:59:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id k27so21814452edk.9;
 Sun, 18 Jul 2021 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pw/ymT7jTI4vbe9EaHsLlpbaG3qADekUdaOoeZi9DCI=;
 b=N6dvNJGmplWlVHUfqKxCiO2YRlq9xOWASWYoxMFmKqo8XQSvSmc/KzvxC5n5K3/qcC
 mXivOogsUDIFmfvM1VFQcoltPPbrVhryDHWYIzFjFxCpL1KwD+m88meKroRfJ98DeAO4
 rYuKsPmdg4byYvJ7UNo3h9AWz8WOiGUbwRTuNuht/WjMsSDu2Tn1KS1+AzadNNr6kz2B
 Z0xBg3B8qB8mzBjxQS/subjiXw5ND9R8DH/+LN4g0hHJATcXWeqUjtCgAz0n3yAw7Mes
 AvMCR0txSFHoIfw+m9F3cbKHbZ8/zpprDfcBNywDMH+VQUf8VJcG137+oFoelGqFfHB6
 PUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pw/ymT7jTI4vbe9EaHsLlpbaG3qADekUdaOoeZi9DCI=;
 b=h9G+pHKXXg34I3R6AFqS4rTHbDF/XMG/HrM5ufzrtxNfo3VyNsEwI5yLLhkDdplTv2
 QGbwdaZl7vJKZ7eTqYUjTWvk+IdfOaPdmOrsctFQf5gWp99RgWglcOgt16lp4k36pvQk
 jWnqLdZKyED/K1xUEwBxveAJ6/aqjWpvW8+Wm7kNiNyt/EhGjvbgaGBM+FSTmLvJ4NjO
 jUHTEyyZl81voJpVDthVQ65u0RDvLDgAC7YSk9eq5mnkfqkU6py0DZoJ8l6gaNGkUEjI
 hUxwKswyWNQcnI4xCJQlfC+/Nj+gEd+hM4UsJohXJPdthb5dbapK2p/nrih2SRRXTzyT
 /LVw==
X-Gm-Message-State: AOAM530WuvYofEeepe65t6ZGiqEzizN33HpI+NV0hENZmgw8rvSd5k9o
 HQhq/qPVIkP7mvpuAYPXaQK5kFpmoTkeRBw+B2s=
X-Google-Smtp-Source: ABdhPJzDYG5f7P7jdkKSk8KghE2W4nVdpPNwQo3VTesZyc9brB+mQqwde7gjS7CS/C495OdoAgptMS7+b1KWthjJxgU=
X-Received: by 2002:a05:6402:291a:: with SMTP id
 ee26mr31661153edb.220.1626663557377; 
 Sun, 18 Jul 2021 19:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
In-Reply-To: <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 19 Jul 2021 12:59:06 +1000
Message-ID: <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-efi@vger.kernel.org, 
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 Russell King <linux@armlinux.org.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Atish Patra <atish.patra@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Robinson <pbrobinson@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_195919_609567_82965874 
X-CRM114-Status: GOOD (  28.28  )
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

On Thu, 15 Jul 2021 at 18:11, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 13.07.21 um 18:59 schrieb Javier Martinez Canillas:
> > On 6/25/21 3:09 PM, Javier Martinez Canillas wrote:
> >> The simplefb and simpledrm drivers match against a "simple-framebuffer"
> >> device, but for aarch64 this is only registered when using Device Trees
> >> and there's a node with a "simple-framebuffer" compatible string.
> >>
> >> There is no code to register a "simple-framebuffer" platform device when
> >> using EFI instead. In fact, the only platform device that's registered in
> >> this case is an "efi-framebuffer", which means that the efifb driver is
> >> the only driver supported to have an early console with EFI on aarch64.
> >>
> >> The x86 architecture platform has a Generic System Framebuffers (sysfb)
> >> support, that register a system frambuffer platform device. It either
> >> registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
> >> VGA/EFI FB devices for the vgafb/efifb drivers.
> >>
> >> The sysfb is generic enough to be reused by other architectures and can be
> >> moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
> >> logic used by non-x86 architectures to be folded into sysfb as well.
> >>
> >
> > Any more comments on this series? It would be nice for this to land so the
> > simpledrm driver could be used on aarch64 EFI systems as well.
> >
> > The patches have already been acked by x86 and DRM folks.
>
> Time to get this merged, I'd say. People are asking for these patches
> already.

Can we just merge via drm-misc and make sure the acks are present and
I'll deal with the fallout if any.

Dave.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
