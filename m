Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92754F532EB
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4wEm85YtwqLgge/cm4woK3UzzvYwlvve8qYNOS/PTw=; b=go/AYzFisgZG8P
	OttMfMH/AU0Xo6Bo/JpfnDoz5L0XBboRXHXu0vb6sfKxVlFR2ElSJ8OqIYlHjfWuuYnJW/aS5TVaL
	HnfhEUBsn7MZO2QdyMoCxSEem0t7p2v2ZVZJbhq1pbaeLGqhCNr8q4Ri+Nf/oUCvcwHYs1GY+vUnA
	r8+rMBKdAvn6kjQTrh/AOxcyB+Gnc/FNV1ko7Jzj7VWqu9DzAFH9+VrkAbLx5padN5wYvHE7dB01d
	aK9/TQ8mA/UIqSBiy8khqbUbH0kHSfDnDNYcUQVRGwdyZwwfo9YfLxaxeKkwmIRoGuv2DZ5xLB/Q1
	qLNGXHdd1IDDpIQOk1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wcg-00000000vvr-42yq;
	Tue, 24 Mar 2026 07:56:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wce-00000000vvF-1GrM
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 07:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
	b=ei/yW2RcqtcmmJKw9rAFjrWdGzRZ1k+kVN0VkPVjyHYeHg8EqsHO1t+UGbJ9oMuREpao6V
	WzahmXfavG7RotLMnQIFvAHN5MEhriy01NUbIXWGXEtFfeWpB9yEJuwxU/7FZMwdouj6FD
	cFK6yeKXYhAULgRff/emsO8XECu9LF0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-z9A0auvkMSirfLFF4dTT0g-1; Tue, 24 Mar 2026 03:56:17 -0400
X-MC-Unique: z9A0auvkMSirfLFF4dTT0g-1
X-Mimecast-MFC-AGG-ID: z9A0auvkMSirfLFF4dTT0g_1774338976
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b3d3d2d22so4201385f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 00:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338976; x=1774943776;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
        b=jBoSFzphhYROs6uFseT1ghyfYhr8WT8Ph8Lz3Ml8rO2nqtWnHN99VHJfoo1tK4J+V4
         FevK5MSUnuU6kB+2jFX8I+xLya4OeVlvqu3DciqVzp+bxSYzRgBr9NWdwCbhD42ROhKK
         D/Xm4/vLWl8Xe5+QjI9xXgCACo7WfE/Xeh3HS6osBcZKPgPWfMoZxfko8fxZhVCmglod
         lpSA9hGQej/R61U3lXmI1kQU8aXznxgkzUpifyJlCzpMW8bJ+o4FfOmwg/Wn7Wa/KTYT
         HvWLvEK7ZBweSxAHjQsIXZpWnGcB3fZVaKE4V6DaysPw1znsX+E8VLywckADane4ESzy
         fiYw==
X-Forwarded-Encrypted: i=1; AJvYcCVlZdHnt24lExA5icxLWLWqngMy3unyDxFyeUtqwR48/o8K+H7x9qR+5oSPBgvmYKiLYaMXltT4C5hFPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7z//pf8TtvRu+8RcIKl7wh8aVEEC9/1XKJidovgaMRfyBkM5q
	Bi0b7YC/UMDceHJwjNn1jYt5MGHZBecdJFiR+345teVyo4fkD7MNwmWblyVphZ396I8b+R3uaar
	0eWEuL7fY/uXL/yhE4htRSQB5mlTuSID3ilZIst1S3u2M9p44FJwJ27RwOx5ByU/9V5omFQ==
X-Gm-Gg: ATEYQzyhzbkDBC5EDuUL2gn7iinM2fko7SAhuQfHHeHAoAaYrvLsiRzKqtOYPeSgN2x
	3oQ8MAUP1moYrcbNGZ9NMdwM/+h2fHy59R/Egd1QBtaFzQZt3Ahe3OGDeI9adRwUxld/c7OttJn
	jdP980KCrUjGauy59hEiqOpfgMqCLYb3Vklens4O/zWl7CEnsblRDpxs7rRcjm552h39Q3wJenf
	FX4A+7Owdx2zaEfsPCn/lGz7+rys/VYj9zhNDsTlBXuN0S0UtHmqQYV8mOYbb7ou2kQ8Z5fTRVk
	SH+F1UzC7ENxZWMMb9o0WN0vEDr7Zgo/eoiqq1KvAYQUBTB5JwywRshowRsogucAtMPUPkvAMP3
	J0Wmfu8UmcUt6fuK0P0wv9Ybp83vf6EoWp5B983TFrpVCSwvITEAjYS7HhsXc863ti9HcW8W7cn
	XThzZl
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2989 with SMTP id ffacd0b85a97d-43b6427b212mr22640517f8f.49.1774338976175;
        Tue, 24 Mar 2026 00:56:16 -0700 (PDT)
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2989 with SMTP id ffacd0b85a97d-43b6427b212mr22640483f8f.49.1774338975756;
        Tue, 24 Mar 2026 00:56:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm34390579f8f.15.2026.03.24.00.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/6] riscv: dts: spacemit: add i2c aliases on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-4-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-4-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:56:14 +0100
Message-ID: <87cy0t8xup.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VD18eJ5uAGy2GX_TsdLwHDmc4NEoJruq-atEGvoH630_1774338976
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_005620_412423_F504F15A 
X-CRM114-Status: UNSURE (   7.18  )
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

Aurelien Jarno <aurelien@aurel32.net> writes:

> Add i2c aliases for i2c2 and i2c8 on Milk-V Jupiter. This is useful to
> keep a stable number for the /dev entries after loading the i2c-dev
> module.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
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
