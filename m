Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC5EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uItr39AofEflnYu3Ae56io9PTtfFiwi6s5gTh85L0JI=; b=316KS3JoXOzxz2
	4UQFn04u7jKPx8prwEdqGBSInPtlvxL9ayYEGWuYF4PZjzleuLo8FlSCMhEuXjyjgvvMaCzVlF2oC
	WdWUgFlYssrh4KN7WxdQVU7OrT6uWlEnijulbv7NtfiLTH6U/v6en9yQLzjBaayRnGS87KjMABc6W
	/Otn5IULpTOyKsy/y6jDZxnuUKjs4KLq6EL+dZZHOGxR2Au/wdZSF2GjtpbsNxRlF2pMYLlu+d5Bm
	QwksekZWGY/7t/gZYs3kpSrxa2NGMiKEkkUHJjpwzaG8Q4gcjQRe1Yo4UX1CjLt/0H7JegKTpdtfj
	JJo/09f56O84WAYRYHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGisb-00Dou0-2S;
	Tue, 04 Jul 2023 16:27:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGisZ-00Dos4-0f
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHdgPj1Wm2IgY2fHBO70NHanGv82Rz5Bml4kSaFfUEk=;
	b=P4oeWa9B74yLZQ2ImuhFuJWLcbnn8tz8UgDHmL9uC3bDVo0uMeVoyFdzy8IK7qz8p8BD2D
	8Lm4+pyU6tgpZKhRK+lUyvdt1ULEDfbldo3aZ/EqDNWeCirfpM67wgnJsRtyJ1MU23c9z3
	zYnyGLoFnOO4YoQqKWq/EYf8i4wO9oI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Jk_9D_KdOvK9uQqPy_LCEg-1; Tue, 04 Jul 2023 12:27:46 -0400
X-MC-Unique: Jk_9D_KdOvK9uQqPy_LCEg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbdde92299so9103705e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 09:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488065; x=1691080065;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHdgPj1Wm2IgY2fHBO70NHanGv82Rz5Bml4kSaFfUEk=;
        b=TDR0WruLGIXehxT5aGdnqt8GoB1TudguYWr5w+LwlEq0WgUDmc57H/VGDdDdwgC/u4
         dYZ+9ZqtLg8dDJEmC6PhhoAI9JaYYD6zLyR/Z8PRED8W1IrimMuCU8nH2/6isQNW2e8E
         SXEVC2prB0SrpdG6JG3WKudOvuuyEUBK9LgbQ+91VlwfjhsTaKKnizKZpBn13Jg1GYYx
         4tbUh9TFn5ShiEdCHVgg55RAS3yO6QrVIVOqE5tlsvO/iBOi8D2nUkfdSPaWuHWn+HQV
         TjUWP7NlOplcae67s9HQPWY1+YvJkB6ayn6b35BzWgkLrSAKp5TR3e9CVnPLM2bi0Hdv
         SBsA==
X-Gm-Message-State: AC+VfDwr4WafUlgMxIV8oHjGGdZtLTs7UHUC40+DupC/prIA9jWNozJW
	F5mwilDVN1jX/d54o60oxpgd9lOoy+UQVmhR64V0XGOl9NZVlwluSP22NQOS6JTzLHBTddIr0ne
	OMuF3rrmTWi6BNdNZ25L31LsDPzR6
X-Received: by 2002:a05:600c:2181:b0:3fa:96ae:fd78 with SMTP id e1-20020a05600c218100b003fa96aefd78mr12439044wme.29.1688488065021;
        Tue, 04 Jul 2023 09:27:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76jB5JrX6TXp/j+SpnZTGNMceWk0U9GUm8msLFZPg0J8xzTJ2Ph/XYxtIjAMzvUbO/YmFVwQ==
X-Received: by 2002:a05:600c:2181:b0:3fa:96ae:fd78 with SMTP id e1-20020a05600c218100b003fa96aefd78mr12439000wme.29.1688488064598;
        Tue, 04 Jul 2023 09:27:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003fb9ebb6b88sm22214385wmj.39.2023.07.04.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:27:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra
 <peterz@infradead.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Rich Felker
 <dalias@libc.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, Yoshinori
 Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-csky@vger.kernel.org, Geert
 Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, loongarch@lists.linux.dev, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>,
 linux-kernel@vger.kernel.org, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 05/12] arch: Remove trailing whitespaces
In-Reply-To: <20230629121952.10559-6-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-6-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:27:43 +0200
Message-ID: <877crflk00.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_092751_339793_6C4E56C6 
X-CRM114-Status: UNSURE (   7.20  )
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

> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
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
