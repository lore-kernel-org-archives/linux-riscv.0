Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4D8EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 07:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+H7Bxuf3CuD6iVf8cSE/C+am/YhumGiOcn4vLzGN4Q=; b=Waye/MRuKvu3dE
	y5z3ko0G1OJJUc5OUNFuHM+OSEc0FjbHf4dTaX7Ox1jX/KlB5574LhWH7y1ltm93IAnuuHOnkVLa/
	Mz+xHxSkrhQTNCOpdPj4kclR21qCI0xwGEX9WvU3YmGZBATeUOW5QVFYDvhDQpQFrOMzETk22h0EK
	AmlBeyFX90xDxZeM9Dh9hjtyHSHMBbx3tnbZSRgktN18QcqZcgfOcQhjYpFHDy1sRWRXebmMBSFOB
	P+f8e+dZsoxdvwO8EfFTejRi1j6q+sexnJEJZbSO+H656c5QBBfiB6P1ReT8IWmXKUOP7tgLaC724
	z3PC+PZb1v7blmiWpteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxGD-00F67m-1X;
	Wed, 05 Jul 2023 07:49:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxGC-00F67F-1i
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Jul 2023 07:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=; b=CKqAjuVKChZusRZlXvetZ5Dgy9
	+H9Ahdc3TTaIo2m6647eTDgoD5a9NZBVbrRQvj0UQb4tjRUQc0UhUV+PaTpDrn2fJBFngHjOfw+S0
	i38kZTdtjsdD3Y8xpNzsiQgHvh2hnu8e5bWujt6oYfR6S6IkLA4KKeosOS6/Vcv+5rq1u/t3jpHt/
	3lbWLkKFNGQdES9KDxZEQZc+mKe2Es8WeNZbfeVyc9atewSz10XDSuMq+XyvN322AtYysNJ+yA2ud
	17O3nfb1P/3Phu7wtykpL3YChYdodeJ5zyZsMEQXNGk6daJ6ph8Meqe35OblRW2pfDrBxYnqplclk
	62Po9nyg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxG3-00C16X-23
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 07:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688543341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
	b=MpHdjw/dMUIbYclOCPA1qQczRIiLSOUFQahep+rBJJD4YqbdW4XAE+W59q5BxoKslfwDoK
	3yqpVXL29qvrvBLOyQdIKPv1sWQjbaEAVuUL0bddLuYeT5mMBLCvCeEQIaEf/k9tZTVsep
	tUN0r0TIbcsKoza6DMpRnkOjn+ztU+4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688543341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
	b=MpHdjw/dMUIbYclOCPA1qQczRIiLSOUFQahep+rBJJD4YqbdW4XAE+W59q5BxoKslfwDoK
	3yqpVXL29qvrvBLOyQdIKPv1sWQjbaEAVuUL0bddLuYeT5mMBLCvCeEQIaEf/k9tZTVsep
	tUN0r0TIbcsKoza6DMpRnkOjn+ztU+4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-6vmUfylFOnW2EF8lQ8XScQ-1; Wed, 05 Jul 2023 03:46:35 -0400
X-MC-Unique: 6vmUfylFOnW2EF8lQ8XScQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30932d15a30so4256127f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688543194; x=1691135194;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
        b=kZA84npI1dhNsaGJAg3P7VghY+xMGgW1WjHtKwSWzWSwjrmKGs7qfUkqAuS/aPrh9g
         0a4qqUy3In4XZD9RuqxPbU2Igk6+zQ/lkp5Y5HaglGv41TBuXbooyK47yxYdaExUV+ks
         UaLnmiw7SwwxUydjXbpuZet7JEpoQXhZTH8liOefno0Ig67WRnfKlrtq1xFsIo8XkKiU
         2FvW6krug4ZCZcRt7ecT5aJgELDrVuQRYXJrtB7IK1hJJ5Lrag9GnGWlX6/+n3NTjbW2
         MMcbAfzLMtYGZE1nQTtPLc55+ODpyRNxJRKBLZQgnjS/98p0XjdUZoBEEE5LHztHF7IP
         Fgbg==
X-Gm-Message-State: ABy/qLZlMot8InB2jfk5XZl5yme7hukXl8Nuw1ysojxq5MYBEbUZ+Ecr
	mQz73MCLuv1rBpBu3Im689Il3Csu3/NjP8XQiSbO9Qsp66f2FmjjxLFHw9Flf+MXEH30SDT2JCM
	GTfzVsLutTG6J+SEmlRbK5VhIQZna
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id t13-20020adfe44d000000b003142732e81emr13085705wrm.8.1688543194260;
        Wed, 05 Jul 2023 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFsu0NXA2DcqaEBs6I3Rg+ekfJ+Y9cFLpHbU/8XeUuuyRyAepiisRLN9BUbx4g3BoqHacYmEg==
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id t13-20020adfe44d000000b003142732e81emr13085694wrm.8.1688543193994;
        Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6e85000000b003063a92bbf5sm30496891wrz.70.2023.07.05.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
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
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/12] drivers/firmware: Remove trailing whitespaces
In-Reply-To: <20230629121952.10559-9-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-9-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 09:46:32 +0200
Message-ID: <87bkgqssvb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_084908_084062_6D92B614 
X-CRM114-Status: UNSURE (   4.93  )
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
