Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB87EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZU86etC5wvgrH1btWnp5yW8cFn3bAVdVpxSqom4oBuQ=; b=NxU6eaNCZOx6pP
	+gr5aK8Egt62OB3DG73OY94XTc942luidwWezq87AyDzmOyeoNWqZISI7srtDx1LzW4J3gcXONhOn
	+lc6v8ZupdB2gEaz4S771iD9vlMnJkpHVVtDD7tvlQkIAhHqvpLMrQfEqenHhOmqMvRltixvxBh2b
	k6c9WlqoDAK+AufVUAyoSJTXXzLzIn5keVG59WlT8BA7AC8427TaI69cSSaTErlOeS8V/+GZqjEH1
	C6/zjiiYeSYPDgZq88T9/lNwx1l1WlZyTtLavwALv+IrPTk5PMfN8Gh2rDfw0I3EntEQwbDOx8PQs
	+P96EtQ8UkpA6KLCXRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxTB-00F8J9-2d;
	Wed, 05 Jul 2023 08:02:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxT8-00F8H7-2c
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 08:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688544151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XDgcQtPSCk85F9YjOuVpAuyCl327gSG/7+9nyPHiobU=;
	b=HVNH53ZDOszA2ZQz3FXyXsIdeqgezqU0uNVYe9yOyAHL6wluM2dvAM16LhKgyJWDFGOQmn
	tb2JRp6RWWHzNzPXI9PkC+ELtVg840KchYLERyVasoxVVEy+OMxCArJ6ecJOa0Aa21JF+6
	cOz8UIM1odQz1gioutujRaqMF28O6Tc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-gDSgNaSsPeWpoGBeuVaQ0A-1; Wed, 05 Jul 2023 04:02:30 -0400
X-MC-Unique: gDSgNaSsPeWpoGBeuVaQ0A-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so37826845e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 01:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688544149; x=1691136149;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDgcQtPSCk85F9YjOuVpAuyCl327gSG/7+9nyPHiobU=;
        b=EmZdE1pjZeqkjvIqr+J+YTTUcwa0XkkHlZbB55NYL9CJWhAya8g4btfDfmP4hOgw8f
         P1ag9zSUAE4a4dxvE9XW9JFJdWyp1h2e7mCxGSGWYFSygQQmJcjAnod266ZgcRNNqAml
         +gyzYAEaVvMSEO7bDuBC6VKGMr8cYjTKZdgwas/OnNECBr4Jg2cXEX6S88mG78W+oiot
         h8YAXE/iuQt6Ut/MsKenWy3CAZl3FTGExtbGsl9Cg3B9U3N6WnGMut6rM1mfWqUqO/3d
         9ryyo3RM2GoEHykDV0BG9bri0aGpDGpp2msGNR4jMPoI2M3lyJHsAbGE073YnKvNshng
         67sg==
X-Gm-Message-State: AC+VfDw11kumy0kqwI7aVnSyl7oG8mwQozrXOB+8t4kjKT7WEeCa9hv6
	0g/ftmojwoV+4dMXdnSKTD/rF6SK7ab+Zepe/3OObQjxoCYrmlHacIqwzBRSlBjKisvWWa3rOt2
	F0KRfhZZhuoSvAzv4ki9YWteWc3kv
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id k20-20020a05600c0b5400b003f5ffe346a7mr12254779wmr.9.1688544149352;
        Wed, 05 Jul 2023 01:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vylDlXvfuU9EWjWb12pZMcRCpkOIK+1WjIMZRSIYzVmT0WCKJ1Gd1jMG8KQnYrrWHnxleng==
X-Received: by 2002:a05:600c:b54:b0:3f5:ffe3:46a7 with SMTP id k20-20020a05600c0b5400b003f5ffe346a7mr12254706wmr.9.1688544148234;
        Wed, 05 Jul 2023 01:02:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d4908000000b0031432c2fb95sm8956824wrq.88.2023.07.05.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:02:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-csky@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>, Maik
 Broemme <mbroemme@libmpq.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/12] fbdev/core: Use fb_is_primary_device() in
 fb_firmware_edid()
In-Reply-To: <20230629121952.10559-11-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-11-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:02:27 +0200
Message-ID: <878rbuss4s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_010234_915255_C5C1C8E0 
X-CRM114-Status: GOOD (  12.94  )
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Detect the primary VGA device with fb_is_primary_device() in the
> implementation of fb_firmware_edid(). Remove the existing code.
>

An explanation about why this is possible would be useful here.

> Adapt the function to receive an instance of struct fb_info and
> update all callers.
>

[...]

> -const unsigned char *fb_firmware_edid(struct device *device)
> +const unsigned char *fb_firmware_edid(struct fb_info *info)
>  {
> -	struct pci_dev *dev = NULL;
> -	struct resource *res = NULL;
>  	unsigned char *edid = NULL;
>  
> -	if (device)
> -		dev = to_pci_dev(device);
> -
> -	if (dev)
> -		res = &dev->resource[PCI_ROM_RESOURCE];
> -
> -	if (res && res->flags & IORESOURCE_ROM_SHADOW)

This open codes what used to be the fb_is_primary_device() logic before
commit 5ca1479cd35d ("fbdev: Simplify fb_is_primary_device for x86").
But now after that commit there is functional change since the ROM
shadowing check would be dropped.

I believe that's OK and Sima explains in their commit message that
vga_default_device() should be enough and the check is redundant.

Still, I think that this change should be documented in your commit
message. 

With that change,

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
