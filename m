Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78593EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGI2pK8pfBXV9fdEywa6nAd2atT9pUmcJOJylXKjtXw=; b=MU06RU1zr/+8l1
	ft8IJFDdFaoYjSGsTSb+f+b8oye2Ufupz5cVytwFruanbYKjiYqkny8epCnTAf7Nw+by9XNBfV2qk
	D2QQCd7CInrH1gc1dfbZMOHB/CZpwiWF5XFSd0twarRpt8vmqzVccsieaw97bqz5I2yYEXWZshwfE
	51+zU8gyPTXhxlKQ/aMswG+D2j2d+8xw7JprcjzwhPcUxO8fX8tAWOd1KUK2axPoryCECVsujvacA
	+7vE2mpxyqgJTeFglkUxKvBKZWvpiYZqeNU7lNW+waxjK6ewb+6Xewy8pMMhr1AbZ17t/FzqRVHyt
	oEQUB2sz1g0z3eLfgvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7zj-007hC7-38;
	Wed, 19 Jul 2023 14:17:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7zh-007hBV-0S
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689776252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YjdFQRNR08a24eSSE2jcx3RnjwPdI3D1UG9L8u3hsoE=;
	b=GvFk42u94xyBV9J1PucXfmkCDMzFCyZcLAkWC5c9vOYRH4oopfQAdW4MGQYpg9pfahugm2
	aN7RAmzGq21L7gYfzeHoWn9YIVEs3gTwOUkIhllmk81bMeUw11jA8Zu+arXUxfskCOJNwW
	1YV1HGUima4kq1l95WLa7z6dOh5TTGA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-xz7j3BkzNxaw7DKFllUBWA-1; Wed, 19 Jul 2023 10:17:15 -0400
X-MC-Unique: xz7j3BkzNxaw7DKFllUBWA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fc08d6a40cso39427815e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776229; x=1690381029;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjdFQRNR08a24eSSE2jcx3RnjwPdI3D1UG9L8u3hsoE=;
        b=lYHYJONwU8niYAiCPqGNMqO7dmFQw/RRQuI1EVCt1Lddn8d1x0jHcExm9sumDh8AwP
         LHUDdqqTskai3du5o07vwjF8TVAwTVaqb7PsNv+ydU4K3/ni/vERTIQSQ4syWIBjGnd3
         dMRzEyUlks3W6yDzdp6GC3HhIVoPoP4nwFppmtVepfJkrYefUjtycNVmloAksqbjBWwt
         RW6r+sJSWOD3s151dgjECsy96ddnBXYF3A+X5moP/ehns6CbT025PeikjqGL7fLrROdh
         0G+qJgBTnFSnXsI9xBBfDHre1iBqjmAoIRmvgZTYNDalKPm9hLrUr1l1J3VximLNsNSI
         qpcg==
X-Gm-Message-State: ABy/qLZTedeVT2c8czoYWGu4Eg/rjCiC8i4bNOVlx4CkkccMiaGGOmYY
	nXXj0Z4hEw/rTYgfE2/c9AhlK+YS2i9pRPo2H756wND/R3NYr5cxrChvyhETtuaDMjmOK3WgGJJ
	qG+PppOMwvl5gH0dKHplpD1XFmXHs
X-Received: by 2002:a05:600c:3651:b0:3fc:627:ea31 with SMTP id y17-20020a05600c365100b003fc0627ea31mr2123100wmq.38.1689776229115;
        Wed, 19 Jul 2023 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHY6b0TgUW8MDG3POksnXdAxeQBRH+KD9U9aN090eyMWJPzhTreLBf0F2Av+qSumHgaL9gGUQ==
X-Received: by 2002:a05:600c:3651:b0:3fc:627:ea31 with SMTP id y17-20020a05600c365100b003fc0627ea31mr2123053wmq.38.1689776228833;
        Wed, 19 Jul 2023 07:17:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h21-20020a1ccc15000000b003fbacc853ccsm1833816wmb.18.2023.07.19.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:17:08 -0700 (PDT)
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
Subject: Re: [PATCH v2 6/9] vgacon: clean up global screen_info instances
In-Reply-To: <20230719123944.3438363-7-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-7-arnd@kernel.org>
Date: Wed, 19 Jul 2023 16:17:07 +0200
Message-ID: <87cz0ohtp8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_071733_275903_48549987 
X-CRM114-Status: GOOD (  18.03  )
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
> To prepare for completely separating the VGA console screen_info from
> the one used in EFI/sysfb, rename the vgacon instances and make them
> local as much as possible.
>
> ia64 and arm both have confurations with vgacon and efi, but the contents

is this a typo for configurations ?

> never overlaps because ia64 has no EFI framebuffer, and arm only has
> vga console on legacy platforms without EFI. Renaming these is required
> before the EFI screen_info can be moved into drivers/firmware.
>
> The ia64 vga console is actually registered in two places from
> setup_arch(), but one of them is wrong, so drop the one in pcdp.c and
> the fix the one in setup.c to use the correct conditional.
>

s/the fix the/fix the

> x86 has to keep them together, as the boot protocol is used to switch
> between VGA text console and framebuffer through the screen_info data.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Patch looks good to me, but I'm not that familiar with some of the arches
to give a proper reviewed-by.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
