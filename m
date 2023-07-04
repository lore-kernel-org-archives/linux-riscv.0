Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2441EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3M4UQ0JeIrag1sA8TzK8YG2nLJuEsGSwCtVkHX17RQ=; b=qiZiga+eSVIkgV
	YGcOXZHaH1WqscnbX+86NQ8ZhEO+dYpGmkUkJ2O/9jDPZi4KeDM1l7TMMzYTeLEjEP1aOFUOHBWWX
	xYEuvEKl8NYxmkSK/jS3pA2j933nrP3xt0T/eecl4rJmyYheMaqV0/2FQkufhGt5XyJs3dV/Fzpwq
	xG6L12BbqI2eVcmRS0dCDO7p7ZhzB9lDE5a/QzHfN3zdY4jwVqdJhL3LwR2lCweoWVF8yBZWd4lCR
	L3JrsRDMXAMWY+II5npqZ7Kgn0XEFiJzieNFh7FvcdpQZUwGtU+zA+k0rXiURGE5TFnPceNqezYvu
	kSirMLJ7SXEgumd/NYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiof-00Do48-0L;
	Tue, 04 Jul 2023 16:23:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiob-00Do32-2E
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688487824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FITFWtbRXE3gky2EO4aMziTa3J/r1+wMO4yc2vs7Pc=;
	b=Yaj0XoGTnPY3jldtaJrBd3h0EFLc5QY5r2f1GcQiDU5Bwt+QkhnRA5Y3ClkBsx59aWT2Mc
	O1BXRKMpVO9+Wb82xQFvJuf17h84NyATS9f4N1wgCJHvmtmtX5bmQkya0n1s8pMiouL+Iu
	fyHZ1/QKZQcqnRr3IdPIPspTAWH3/GI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-bTRpgeeQOHyS8jgxfs7Iug-1; Tue, 04 Jul 2023 12:23:43 -0400
X-MC-Unique: bTRpgeeQOHyS8jgxfs7Iug-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so8962905e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487822; x=1691079822;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2FITFWtbRXE3gky2EO4aMziTa3J/r1+wMO4yc2vs7Pc=;
        b=EZUDe/1K4kILc6HeXHOEn7Hl6eVSQivqgKpkxg3uYB7DMn/OiudZGdZTcmznCSrADv
         YtM5EwFoYFAxbC3/CyCsCEDeOnUNwyMDeR1MadhickV6eGBiCl1p3/N9aZf6H/tmZOFv
         McQyb3XbHrnCl69vhjwMK+jVl7vusQv/y7+OSuEo8+O3ZsUsKVyWiTK9nS/cCk3YuEH+
         ROS5ZgvoloYFPRU1TNzzOkQm7yHLSw8ZcP6xLBFmValBKPWUu9jaI3B0ClQgom/ci2+f
         kzoUOOQnQg5o/uMkKpVKItGl9E5hVblIU4GcprIQ4lea80OiGIFUFX9NFWniL13IvYdy
         WHaA==
X-Gm-Message-State: AC+VfDzWMK27d7OlMjM2tFQ+7AVgsrzblHwDw7JPifD8R3r+VnbvaUIh
	SIAzn1BGUzSO/bZG8xV7yvEAx05ptgc9eKInSuVdkzNxj/0fUtsyxgenKikSRBjR9h3x45IcNwY
	8ykNrsIiFf8t8QN+ozWdHZ5DYfBcP
X-Received: by 2002:a05:600c:2145:b0:3fb:415f:a85b with SMTP id v5-20020a05600c214500b003fb415fa85bmr18158817wml.3.1688487822321;
        Tue, 04 Jul 2023 09:23:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7T04nL74CM9kmUBFWNxbGLn7ruUc6nb3zVFQfaw7cBAYtqvH64gACvFSpImO/HrduwXThnBg==
X-Received: by 2002:a05:600c:2145:b0:3fb:415f:a85b with SMTP id v5-20020a05600c214500b003fb415fa85bmr18158793wml.3.1688487821958;
        Tue, 04 Jul 2023 09:23:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003faabd8fcb8sm24447459wmi.46.2023.07.04.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:23:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon
 <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/12] efi: Do not include <linux/screen_info.h> from
 EFI header
In-Reply-To: <20230629121952.10559-2-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-2-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:23:40 +0200
Message-ID: <87ilazlk6r.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_092345_799135_258D2882 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

> The header file <linux/efi.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements. Update a number of source files that
> require struct screen_info's definition.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
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
