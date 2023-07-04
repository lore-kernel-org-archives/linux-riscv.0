Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA9EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34WDUy7i5Wh6wzgno2BpzJrVdO3ZEc6gTi4J4xLGMnI=; b=E3ky2KNH7IhC+I
	+VLXDaNdPzt66k+rXhvgzgTgViEqys6UsUHW3p2zGKpZqEw5KqAp33a6xZh2n1scalSA85UUZtZco
	HvBlwBoDdOov399qGFf5yNl8nzkMB+xkXO5NbeoaVUi8yA6bEnucMX+khC3Mziw8DoDYiVOT1/g9r
	mOCTTvb8Jf2w0DHdyUXzMXqfWUHM5aXrWE+JGzLgtv8Yx2RwD7EsA8tqMqWD10qIgglktoIOj2RBP
	D3x+sOUKGI/sB0OlrrT9og6/G4A/ISXHzIVBfpoxJD4sCUtn1maDUzgdaRs/ZMRKUljBRiQrOyTO8
	LNNI+10hpNwGi6yibYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGirM-00DoVf-1D;
	Tue, 04 Jul 2023 16:26:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGirK-00DoUx-0a
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688487993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3N/Gyf3beclIUSfPsZhAnE2wLloPptbf+HqX/lLqDWc=;
	b=fHw9FiyufPGlzK4AIgS0dgZSj76QR2FVKZvFvIluVIyEuP6f3F2l9lrIR/e7xDHUCo0DWG
	LtDrB9sZuGTrAaR8aaSfQoiN+gnQoz1dcDo/jLka8JWUNjX/woiMKkO0AMpZE+9Vz1vK2O
	XMYn5sTagth877zSew8hlnGG90Q13y8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-QhCEt2B2N4evF1fQlnpzaA-1; Tue, 04 Jul 2023 12:26:32 -0400
X-MC-Unique: QhCEt2B2N4evF1fQlnpzaA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbb18e9bd9so27191745e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 09:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487991; x=1691079991;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3N/Gyf3beclIUSfPsZhAnE2wLloPptbf+HqX/lLqDWc=;
        b=ZKDWztOSfeLXwYzJZJnEuXCfOnaBVqs1YlAgihIc6aAibIgnl6EM+tc2R1Li1bhoTW
         ExlrdroXywetfeMJnQeoRofjjidSJd5FHDeN105QgyKwihIG98yYp4h5tzBUxph8RTy2
         pxtAWfBa22ucjbX6VVBql58OVU7U181CGRWI24afzJtUzQ/i6nvn/8VfYMgNSW4QBKPM
         H4+r5Z9Ja77IDDzLphNJ/Tx+uBfesqlQVZSZcypLaX8MUA6esgAbCpnxOYC5RcLbRzDy
         77mC2PvrSL+G/C0zBtEeHlwJsSz1SxJlhpx2GUdnfM0crZP/zOj24BAwqTRAk1FNbggF
         C/YQ==
X-Gm-Message-State: AC+VfDw7FTBTbauD16rCnXDx6NwIt9OqYU1CSg87jVCDtZ0s/dNm6PkH
	9CypT5UYCHLvhmbp8zSE5XyzQKoo/TjxdW4r8b8KxGCwYB33N3gket76t2m6Vg2gERLALhfga04
	hXsA7Q/xC8AUibmKnjOAs/eg4slNr
X-Received: by 2002:a7b:ca57:0:b0:3fb:af9a:bf30 with SMTP id m23-20020a7bca57000000b003fbaf9abf30mr12688277wml.2.1688487991011;
        Tue, 04 Jul 2023 09:26:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71ufTEe/wWv7h1ExOsJanD4siZOoua0ql6zTBm+MH4Z3jUb1+lMMqlPgaWI376xU4gg3rSqQ==
X-Received: by 2002:a7b:ca57:0:b0:3fb:af9a:bf30 with SMTP id m23-20020a7bca57000000b003fbaf9abf30mr12688259wml.2.1688487990852;
        Tue, 04 Jul 2023 09:26:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s25-20020a7bc399000000b003fa96fe2bebsm25398819wmj.41.2023.07.04.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:26:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arch@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>, Hans
 de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 03/12] sysfb: Do not include <linux/screen_info.h> from
 sysfb header
In-Reply-To: <20230629121952.10559-4-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-4-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:26:29 +0200
Message-ID: <87cz17lk22.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_092634_292627_B5CE293D 
X-CRM114-Status: UNSURE (   6.83  )
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

> The header file <linux/sysfb.h> does not need anything from
> <linux/screen_info.h>. Declare struct screen_info and remove
> the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
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
