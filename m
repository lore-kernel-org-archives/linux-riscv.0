Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BFEC636C8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 13:59:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91012610F7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 13:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91012610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2zIXLtu8SNzQSS78wzXPNTjvXjNm1Zi6oRBr8UmtvA=; b=pFi1SwnFYrIONk
	F3tPleo+Upygw54OhE02HZ4eibDSC7p58iZN6Zpv9M+coFyL64t80cgRwvacbfyCyD6U3IfJCXglA
	qI/Kx/u9UuK/yzSc52GiYy1sTUSb1YP7iUtnuFJ+v72H7zh+VQkwtgL1i33YCOsOvvkJx2IBXVRs0
	U0wFPj+YUGW8jp/2CsWuoMYpXpJf0jbRvX0gB6NAcEQDcxaP6CJhllrLAfV92JE3TPySBhthv0a4s
	DaeME9dCui6YvaZERtYv+MRXtx4m8/8RELKnUguHQKFge58iV5O90Y53rcnv4PqIM1NMqBxtn0UW/
	OxyqP51RUiVRGwzbAfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5qHH-00D3ky-OI; Tue, 20 Jul 2021 13:59:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5qHB-00D3hV-IM
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 13:59:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id u1so26177389wrs.1
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4PzjYhUEKqwf9rpMim3c4GSraf9DBD8+oBQWlOrJstY=;
 b=AI35rGqFmoDtZhMThgKNFgUNoYDIf/Mv9ZklyKOQZalq+AMl7YLVcjrZWirr9cA4yo
 sKbC4G1SWhrZuNvvWd/s+tASUCHW2urdvLdU/fGsg7m7gz4UJqkLwhSo75ZdBcWM5aan
 ACfNWR23Qn0SiA+6OIT5YQxeAfXWZ5CXMJ0s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4PzjYhUEKqwf9rpMim3c4GSraf9DBD8+oBQWlOrJstY=;
 b=XjGkCdkhvLwMUQJGKV72W1dalKw+rNrEj2eKaqMibwqjw1EN2mnkWzPihnlE6AIB//
 tn4mwTdDyTQtdp/9aRjJ0NcIXD5IM8iFtXavptAL3Zunr46tHMeKujYVzYcha6QLujHt
 E66d2yF+NQdp95spsdjvrUFIVV4e4Z3OXjUddU0cs4FtPBc12WP36O6mpIZCDrqHgkD/
 2JS3dWCsy8/FoT/U6KDxwUmgwI0CdTi5QMAHKl/TIb0JPrkgeAHVYpvPJzSAeXjnS9NS
 Sz1HBuscRlvdeis8wb7HU+k5M/ibiX+Is6GYP2O1mXY4n0/mqfwXOQlcIXijkOsrzmOI
 nJqg==
X-Gm-Message-State: AOAM531klpkNkV/kfSMFzQDSmDC5XUEU2ho2xeH3FP6p57J+kBmmpM81
 f3Vqx3Lq9A/QhoK4mkhblokwFw==
X-Google-Smtp-Source: ABdhPJwsdFs8q+1yTXrNA7AHfumD9vqplXTE6zNI6BrnjDfVy+jzMEAdzrUlq1Fu/ILnx4cnr5axUA==
X-Received: by 2002:adf:f405:: with SMTP id g5mr17004193wro.277.1626789551781; 
 Tue, 20 Jul 2021 06:59:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm2632333wmm.37.2021.07.20.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:59:11 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:59:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Dave Airlie <airlied@gmail.com>,
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
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/2] allow simple{fb, drm} drivers to be used on
 non-x86 EFI platforms
Message-ID: <YPbWrV/cIODdgu6A@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210625130947.1803678-1-javierm@redhat.com>
 <e61cf77c-6bff-dfcc-d3df-2fb6b48e5897@redhat.com>
 <8dd26141-a09c-39e2-5174-4cad8d21c49c@suse.de>
 <CAPM=9tyfNPa2f5PDBLm4w_H_riEQ5P3rEhX73YGE1y_ygRox+w@mail.gmail.com>
 <CAMj1kXErHteZ+MKYvp=yYmwVxV3A=vjtnG351hZHV+3BPwDQvw@mail.gmail.com>
 <YPbJJ/0tSO/fuW7a@phenom.ffwll.local>
 <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03f0edef-e54e-8a2a-4b50-683d3d42e249@redhat.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_065913_707131_6CAFF676 
X-CRM114-Status: GOOD (  24.79  )
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

On Tue, Jul 20, 2021 at 03:42:45PM +0200, Javier Martinez Canillas wrote:
> On 7/20/21 3:01 PM, Daniel Vetter wrote:
> > On Mon, Jul 19, 2021 at 09:10:52AM +0200, Ard Biesheuvel wrote:
> >> On Mon, 19 Jul 2021 at 04:59, Dave Airlie <airlied@gmail.com> wrote:
> 
> [snip]
> 
> >>>
> >>> Can we just merge via drm-misc and make sure the acks are present and
> >>> I'll deal with the fallout if any.
> >>>
> >>
> >> Fine with me. Could you stick it on a separate branch so I can double
> >> check whether there are any issues wrt the EFI tree?
> > 
> > It'll pop up in linux-next for integration testing or you can pick up the
> > patch here for test-merge if you want.
> >
> 
> Thanks a lot Dave and Daniel!

Oh I haven't merged them, I'm assuming Thomas will do that. Just figured
I'll throw my ack on top:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> > And since Dave has given a blanket cheque for handling fallout he'll deal
> > with the need for fixups too if there's any.
> 
> I also plan to look at any regression that might had been introduced by these.
> 
> Best regards,
> -- 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
