Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA1EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6KAL3aGVZdJ3Ra6fVaKjExo8B2srDMzXIDMe0buUps=; b=p+Abin+fV4zKYL
	AAaenoO9+FYRGj3z3vQupKJG6x9Pu7E0tAxSDfmfvqmiKLfvBSSc05bVHhh0peImTgDyAuWzPnV9G
	cQ4dkQ7eamxr0hpvhq/wEyG4n8ZIkKDq2xzs0/yFtmfHupb4xPZ2mlb9qkgXTcVAIQjYgNfrJRqai
	scoHVR7qiz/XuP1HZK1C35ac4lcFHvTc6iXYjx+v5ZBE17NgX1oXKACiPQo9wetfXTyaGmbd4nPWd
	0fwe0kNfsPgt8KkaUnsmdiuDRiH4HI9qXghGnWBmUDWA39r1+xxvJBL25oZKCrk/TDckd/zINdpgP
	7AoKxbsALafd3aOWKF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiqa-00DoLp-0o;
	Tue, 04 Jul 2023 16:25:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiqX-00DoKw-1j
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688487944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M8/mkORscNjCU/dvtXt+o+8I4w7Qa8785g4rCe6dq88=;
	b=hvTBd4/dcOgnInwoXXiTNcED5D6tWe1cril3AjgdSxq5v1+f1uQCTxq+h/PtzFG2y6Bzu5
	xHM3LEZhYx1uxbdO85WODDGnuBzv+J+M6ZaaMzsH/Lc6Ez28QD++wAJKL4tAUZ8wXynlgj
	gf45QZbfvxcfevj+TRxBhiq6GhqfaVU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-v76tLsXqNGGJ149JMfkPrA-1; Tue, 04 Jul 2023 12:25:41 -0400
X-MC-Unique: v76tLsXqNGGJ149JMfkPrA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbab56aac7so36502735e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 09:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487940; x=1691079940;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8/mkORscNjCU/dvtXt+o+8I4w7Qa8785g4rCe6dq88=;
        b=T04wEpqCcR4Dlo/J9IyIQqt5mLzJGav+iG7/FdzFVH1BjakSQ4SesKOqLIQ+AljwAG
         uSjYphu9BWiCXoa4fH+nzj3PPTv95B4p/hlhpfXjZbnNj3xbZNNQagjj/EWFGNKjtg5K
         zKPpS2C9tD2XyJ2D40IEYvVsOWkW8Kqnu/PaavXsNjsCtYTYtrQDzAQCWGoQE7oyICBS
         N5i237XyAJ17/NsCoc6o4iNekuhhQYTg6p6JFwZU/64MyQvQYtx3g34996M4q0ygqQdN
         KfPtdCpQkUlooNfFPDZ5VgWB1s2zqbm61lRaHz2lFIna3rNd6Bf2O9fE7qvymHIpu6Lc
         fjeg==
X-Gm-Message-State: AC+VfDw2Vx29zcNme2aayxo0xzaEsMTZleJwmcDHvHbPOV3/MF/6HSHM
	EQuB7L0oOYuZ/Aj7//qFkDINGeJef1Fcy3x/pMG1xUYRokstUr4vruyR6zU3qCe3H+nivQMIzZd
	+0EmSnTwEMNv5VSgOSEr/qqvhG3mV
X-Received: by 2002:a05:600c:c1:b0:3fa:8cd8:9743 with SMTP id u1-20020a05600c00c100b003fa8cd89743mr12082781wmm.19.1688487940449;
        Tue, 04 Jul 2023 09:25:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5IB6++c8U11SK9oMV+tMdqHs9QUr8ub/i7nSM7HKLee5NlCRabAo+D01Z67Wv3BYjVWg90GQ==
X-Received: by 2002:a05:600c:c1:b0:3fa:8cd8:9743 with SMTP id u1-20020a05600c00c100b003fa8cd89743mr12082767wmm.19.1688487940180;
        Tue, 04 Jul 2023 09:25:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b003143b032b7asm4333122wrx.116.2023.07.04.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:25:39 -0700 (PDT)
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
Subject: Re: [PATCH 02/12] fbdev/sm712fb: Do not include <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-3-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-3-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:25:39 +0200
Message-ID: <87fs63lk3g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_092545_649256_892C7054 
X-CRM114-Status: UNSURE (   7.97  )
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

> Sm712fb's dependency on <linux/screen_info.h> is artificial in that
> it only uses struct screen_info for its internals. Replace the use of
> struct screen_info with a custom data structure and remove the include
> of <linux/screen_info.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Helge Deller <deller@gmx.de>
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
