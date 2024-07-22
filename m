Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62252C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmGJ89CIPMFVeSJvROQ43tAcGFDJmh6nNC/t8UnzYG0=; b=LDnpp2YPVTVzsY
	PHlOeIhQCEXsVOJXx9+TsowlTT9NSbJ8JmWhTulFk9giO8B/xE245ofjX2GN9dwytgtgfYiv/EmT+
	+2PI0HpgQapo9xq+kR7CMB15Fk7oXo4fhmV2bPiP5WFtbkwWHekAnYdhlAiaooE9vDRYsjU8Zh1MF
	0HZHWjYEUwuODcInrvGNjP2kah2KGETtJuniSIqHN1ZroMj/6ZopCmPrzfXjRyBgh8EkogslPCloz
	27eiPXsWKpYzrObQbJ7LOeu41R2HkyLxjIRDpD8y8NEKXfisahrrqmwclItL57zYrfsUovCgbJaxN
	8Gau9BDAm2U7Ae9DCU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvSq-0000000A1AI-194y;
	Mon, 22 Jul 2024 16:00:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvSS-0000000A12F-3VX4
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 16:00:18 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 738373F13F
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721664008;
	bh=B79JRFTkNmY+YEKQFa2Y4q7yR0Ro15pwqlmiZVQ8ivY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Z83lOV5yfprW056cUz/fXkkBZLkyGEK7aTUsQDIWpNJXw9vhqUBgaCwWLj6984+iB
	 /PIhxjyhWLKsT0vX/G9C0jWN2KZZ0nIxj6PDQMuGPxe84mR4QTWSfI/MVkpzAI6VgQ
	 wS9IAs+vy/8GKZmNWl0iem/XoqqcHx3WXsdUeub3WjnDhGGfkcQaduUBWotqFBAgxB
	 asfl8C/5PO0sXbg+7jxZC4FlqDRdRFH5En0uF3RrI3tKwZ7XHBl1oLJDWA+9jmgG5p
	 zYLTZV7bGsGgtXRfj1TmD+SLw1A1UC2tvtJNbjnirT8h3s/dgI0gTbT02rBwsI/GaJ
	 TvlGX9e1WKFmw==
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ef2e57fb7cso17175671fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 09:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664008; x=1722268808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B79JRFTkNmY+YEKQFa2Y4q7yR0Ro15pwqlmiZVQ8ivY=;
        b=Z3se+8wjO5dxj9rvOwj+clCqmKDNASsHRn6RyfnPBoHu10afXcA4Ar3vbasM72Bmpi
         2VYb6Udowa0C0yrZ2VMKX2VgGnGluFmueRU6xTkSp0/VXycAH0+PcOo2A8IXfYNkuqWI
         EoK2tf5tfDac9MWJqzMSoF7Jh389CH7WkPJDS73fYvM0lQdjKByR16RIJx2JXezHB1ub
         4pcsy+s70fBuxbids17c1pQCCDKaNAI057ncrFWMG04/70VSOK5PQZDW3rVg/A8mPbbY
         MZlfc1NNC4e39+8cZbTVSwj5Gbw9xr4AMlCk+jbdqaTxnYIeAGbGlcU0cIdPQIxYTtf9
         xgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi/5VY9d/wGN+f1xHetprqvikNCHkCJ7jv83F1bUc9Pv1l+ljVAbrN/kPFd2OORdKQISHNHiozsyVGgke/rlpFPUSLQH9rOmHL3z5QDq9D
X-Gm-Message-State: AOJu0Yx0ehGBNY1fBk4UnefYHSkLHoDl3lWfsEi4XuresdnuM0Z5hqiy
	5+HdlWwpwflUjBGWe3WK3LZ0AZjEWSssFp4RLw/H2nawGhA3R2f1G/YOyq3ZYtkgJTEdo+4R3qO
	2KSfUatpTKh6HyAtE0WljZtIJKLhqks6KJZjZu7bzTV2YLB3VbtlxFvdYtP7rhs57tiIO+4FZsk
	5kBJ3NWeBLhwxStuGrDBXjdOfRtT9bVlPlgj4I9gS/jS4hexXRhbpqoVzJ
X-Received: by 2002:a05:651c:2118:b0:2ef:2543:457c with SMTP id 38308e7fff4ca-2ef25435305mr50795281fa.24.1721664007852;
        Mon, 22 Jul 2024 09:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFllZU3ToUHoh64OSK80YFLE7hwplCpEjwEmAU20z5VUSS9Kpyn2EmhNj3OyhfEnOFDM+0ujHbolPhk5v8HvvQ=
X-Received: by 2002:a05:651c:2118:b0:2ef:2543:457c with SMTP id
 38308e7fff4ca-2ef25435305mr50795001fa.24.1721664007148; Mon, 22 Jul 2024
 09:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240722154519.25375-2-palmer@rivosinc.com>
In-Reply-To: <20240722154519.25375-2-palmer@rivosinc.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 22 Jul 2024 17:59:40 +0200
Message-ID: <CAJM55Z-hit+-M9qixV4FnOO-i2BsKN56QXK=LkC0FCWzSBptMw@mail.gmail.com>
Subject: Re: [PATCH v2] cache: StarFive: Require a 64-bit system
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_090017_223648_EA2A8FE9 
X-CRM114-Status: GOOD (  16.61  )
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

On Mon, 22 Jul 2024 at 17:47, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> This has a bunch of {read,write}q() calls, so it won't work on 32-bit
> systems.  I don't think there's any 32-bit StarFive systems, so for now
> just require 64-bit.
>
> Fixes: cabff60ca77d ("cache: Add StarFive StarLink cache management")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> Changes since v1 <20240719163841.19018-1-palmer@rivosinc.com>:
>
> * Drop the STARLINK_CACHE_ADDRESS_RANGE_MASK chunk, it's meaningless
>   without 32-bit support (as Emil pointed out on IRC).
> ---
>  drivers/cache/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 94abd8f632a7..db51386c663a 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -18,6 +18,7 @@ config STARFIVE_STARLINK_CACHE
>         bool "StarFive StarLink Cache controller"
>         depends on RISCV
>         depends on ARCH_STARFIVE
> +       depends on 64BIT
>         select RISCV_DMA_NONCOHERENT
>         select RISCV_NONSTANDARD_CACHE_OPS
>         help
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
