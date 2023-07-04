Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8476CC001B1
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qptQ7k72PeOlrWpxWEqPW4/R9AnrczAbf5hadBQ1KwM=; b=hrEoj3YxXPn2RW
	HaPzzGAa+CLaxshnXOwseXQdwiioDqqwJm6YU7zXgFPhr3a9g16N6w8ZiLyUEJx6w15dFCAITAV7V
	XR0KTX0OY77w87nWPOklLPl46D4RvYNqMeekNvnYG95NgYXFwow7IhEYkwxnjlQML3wtAeS2ZxWmR
	noFPK3chq1+0aylto132GYXVaq0vsfxu65xv9OaNH9IQIONt9/HDwckFOms4KWWWOBAXhDyQE0sGT
	Ie/CX4Z1PUu/w6uTWgl4WZtX1/R0maBWnPJAd/L3AD4gnZYiwv+QsLmNHgoiPQ4hlwAEJifqLt+Nm
	b4KbOTvutEjUGgSGM56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiru-00DofK-03;
	Tue, 04 Jul 2023 16:27:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGirr-00DodR-00
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
	b=Sosg1f596cxBf/cRddM2ban7iErXisx9K0oEmVEUG9IKKw2UPTtpFnxFcQJZB274k10qAm
	Qic6jAN2kncK7el8ljFxzr8xy/6SK+Yxg2O9sw6aNT1MUDJvHIRuuqfBvoX372lSwvMh+n
	RHif54X2yCo9K/dSz80Ab3PUAgHVE9I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-6lDPazRIMTKBwwdGvG-quA-1; Tue, 04 Jul 2023 12:27:03 -0400
X-MC-Unique: 6lDPazRIMTKBwwdGvG-quA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5fa06debcso40149285e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488022; x=1691080022;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
        b=Zt+N5/wwYwJsgx2X3AM/PTvirdj5YTEOqZ/j3NgfT1DfdxqWEr4QqPmaz9zbdbUL4a
         jTCLwGim5Tog0inXmyExhh4Z6rka40lmZFDLgMVcH5DRoFfWeW56f7oNWKUEBmLJRMUA
         PFFJcxleE3skhDYvJWPFoZ//d5jMsTkYFYm7F0v5PKj43dGOATZd3iM5wY3sQ8IQeBEj
         VOzS6Mc3QaUxouPEbgPL+0yS49qKMpelQeLKfqNJ1wlYfIP0Fy3p3YN/F8Z4bf8xKnzh
         eGqUDJh/D9EOorGlxEFZQS5bEv7qM2CI4e9jTNCxbrkWJruXFiexJ4XN7pfmqiOQFTnN
         DS9w==
X-Gm-Message-State: AC+VfDwCgNNt3sGlI3sgG+Ch9/JOsWi53INVODXf5C7YgFpjElXDpd5C
	FI09p6EptzD/3OYtBJOIeC1e8zYifvCdHqIanDzt0BSYYRMUGyXtpt4F7uH3u2ntWHenO//9yty
	u/0jclTws6/7yJq524ltDJXfISfaZ
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432839wmg.22.1688488022230;
        Tue, 04 Jul 2023 09:27:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NuEVxTetvep8Gr1fgiFutV/xXoEkUhrAhQSPThqJdTuxw2Km/uBAzmwN3pOgdQUZIHRImng==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432831wmg.22.1688488021988;
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d58e3000000b00314329f7d8asm7499354wrd.29.2023.07.04.09.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Sudip
 Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Teddy Wang
 <teddy.wang@siliconmotion.com>
Subject: Re: [PATCH 04/12] staging/sm750fb: Do not include
 <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-5-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-5-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:27:01 +0200
Message-ID: <87a5wblk16.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_092707_214025_C92E9850 
X-CRM114-Status: UNSURE (   6.33  )
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

> The sm750fb driver does not need anything from <linux/screen_info.h>.
> Remove the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
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
