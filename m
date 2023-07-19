Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB9DC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnGkG1JF1cjQISlUI6l9Fw1eHGtJT646zoWmuHgGXtc=; b=R+PYuL4zp9X4sy
	ONBtOV4PzNtoeXQvmtK8niAEvdZdGgRD3ZnB5rOUnrsd2Naok6fAQGOq/lAR+E935zMLoR4r+OvK4
	cZK/oMAC24NMXJgSAaFaSG1DITD8G9CwzczOgigrCaLvOG7p5DPoOGvIxbhSq4LWbGYbcuiD++Qvl
	oyAiFX7gqX7SJlZVtEUy0F1sCyer6ghXFMOIQf47UHr8Lz6f9kjBaJAVwJ3kmLydeO25KtWnlPs4o
	LfDeNaWFiY/mCNpbUsuTCHKGiVUfsN9uEZWMnIz3eNYan+lXgJooxS93yg07Phn7Yhn+jBJHOoJDS
	c9apZnCB7qIc0yToH80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM87E-007iOk-0W;
	Wed, 19 Jul 2023 14:25:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM877-007iN4-1R
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689776712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
	b=WMF3x1Fmt+xfSiHrnFh/QfgZ5hZ/n9AFVrEydXR/KESgnfTaxKRikMHxQbkYpCnxrC7LPn
	b9RUi8xE41OMdk/N2Cp/s7d2XdSmAolU3uU8/rpGyK9P6M8czhbc6xPpTPDpvahH0Bg6DP
	evV4IPrWufQex92dAqUDP0R8V6fMc9s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-EZOtazjBMSKLvnHtr08tHQ-1; Wed, 19 Jul 2023 10:25:11 -0400
X-MC-Unique: EZOtazjBMSKLvnHtr08tHQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31429e93f26so4199970f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776710; x=1690381510;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xY+xsOpuPsAa6KICDwWDt2PoXyQ0u/vopB2mSitD/gY=;
        b=R7f/5Mbw2/Opy8vCWVKIZqgUuXOYEdE9RpAU9BOFpK7nyBts1c0ciZn+lEVKZgXIEZ
         wfmdLofM2UBKQ/MxHsMWNbZ9Vogzupq4uNYny4E1mErwIg9fxNvkbeD+hkJs/HLHqKAN
         0YQkIULhZiHG7IQgCem4ogIVGVc7IbxLuYhtEXKXomMGi116UjQ5m9Wx8I4vdgCVMGqc
         Yw3BtP7DWLdnkHQ+Xc60frcVjHLMU1i8XKcDqIuQAW0RDVDcnb6DHZfSTECboV1IB2yu
         y+hC90D3cKA0OTJ42WTrKt1LTuWkIAoJ3BGI2rhaN4+cE0zM9IJykyBrLD76C8U39jRK
         Hf1A==
X-Gm-Message-State: ABy/qLbRDSQsj4XdViIM1OiBBwNkTpqlkWkGaVMOJNjoMzoApA3NrpZV
	JlK5Me7XwQ+u+USAukK7X3j64sEcG2OxnhS2dkxVqAkqnlLC3dbsWtpaq4j5FFRsXUNFlkvFSkp
	uUfqIeSxTCAX5gFoIb9iAcdizL9wb
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id y18-20020adff6d2000000b00315a2a0e331mr15881wrp.50.1689776710230;
        Wed, 19 Jul 2023 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdsBbmhlUZVwgJXnbSuIEfuMAzDx5IOvgnijOdvMDteAVkW8k0bDz3T8ek9eZvK84UcEFXkg==
X-Received: by 2002:adf:f6d2:0:b0:315:a2a0:e331 with SMTP id y18-20020adff6d2000000b00315a2a0e331mr15829wrp.50.1689776709888;
        Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t13-20020a7bc3cd000000b003fc05b89e5bsm1805793wmj.34.2023.07.19.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:25:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Vetter <daniel@ffwll.ch>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, Haiyang Zhang
 <haiyangz@microsoft.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, Linus
 Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, WANG
 Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>, Will Deacon
 <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 8/9] hyperv: avoid dependency on screen_info
In-Reply-To: <20230719123944.3438363-9-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-9-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:25:08 +0200
Message-ID: <877cqwhtbv.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_072513_565797_77DBCB27 
X-CRM114-Status: GOOD (  15.51  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The two hyperv framebuffer drivers (hyperv_fb or hyperv_drm_drv) access the
> global screen_info in order to take over from the sysfb framebuffer, which
> in turn could be handled by simplefb, simpledrm or efifb. Similarly, the
> vmbus_drv code marks the original EFI framebuffer as reserved, but this
> is not required if there is no sysfb.
>
> As a preparation for making screen_info itself more local to the sysfb
> helper code, add a compile-time conditional in all three files that relate
> to hyperv fb and just skip this code if there is no sysfb that needs to
> be unregistered.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
