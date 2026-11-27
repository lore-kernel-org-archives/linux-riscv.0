Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE40606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hd7w4Pyu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DCwKqdhi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5U1n/tpqrFxxttxK/6XACiO7Ae7YrjOXTt3+gLYJI1E=; b=Hd7w4PyuDznlyYk5c6NKpfnDSZ
	DTuw6PRA2ll0ZgZLlvQu9Mks27d/tw6ny8YEdEAn9H883R/fuvDxowkgyx7jNuU9eTpUIN4YwiKS2
	pq/+Z+Z9ozRkR8KfZU26HGGMYKqtYVgNKhZes1N+TF3liHD0xA75hZaIiKs3h7p7x/fB9A5FNyWXh
	2wbDyhb1P6V4WDjQJnjAmkZfzNHC7rNwSvyg//Y4AaMS6X5MO0cWyphGDfbsUuJ20d3awRuErzGYT
	SFJRsYdUes1vJwSNTH3SGtAfQ6pUhP/V1loBCIrCXXUQVsnVUvDSxwx9vR+7SunhpZYEsKrm/8LC6
	t84sDitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpBK-0000000F0X2-2Oct;
	Fri, 27 Nov 2026 06:11:38 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpBI-0000000F0WN-0Len
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:11:37 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8b2d14968c9so73007587b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795759894; cv=none;
        d=google.com; s=arc-20260327;
        b=JCeAlSydHq86c/pPMTzrmOkbMgbRKskPgnthG6YPOa9BF6JE+WwgOjHVHD1tiBW5w2
         AfsMR3i1lDzGitffBDaqOqj+aj9JCDiL441u8KOAz5KtzJi2LARQ+UCavuyeHg+tHpob
         RLKSsB30qgrn2TIR4hH1GfihENtm3w5ExaTAF1hK1GBylS0sU8X1tG4pEMmk2w/vhZEr
         xbpHHRkyFORxg+Bhyium4jayCtuOL/j+hmXlDEw4haZYmS3u1p02DuleODCK+d+PL8a6
         J6qD5cNiejOQSX82PJ7VBxqbMobZGu02EqyuQJ20SvxKIMqi+MiAaHYtCPpHJYfWzfXj
         WK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
        fh=dRiHog7UpYfZKenpOirphLe8U3kzWtwRfvivYtmELxY=;
        b=WtYfC57MnMztWc7cTUlG9KtEWFvPXPeF1erX1RF6XkcgHVO2DHBCe/w6YclCCUh1cb
         UCRGZP/LCdSoYyJHWDPQqAEJ2qFkSQV12EIgbQNBoOzwjWpJEQTVnCS+Qhw3+OlpeaMB
         05mN8w0N89Qruk9+MYAFmBCUInofOMTPRTazusyW8nF6jr1LW1Qgn+cJL2qDTBZQHpHA
         hI6k38DHXdoLM5bhheEZVWoiDF8/uBxhJq8wO5izwbsMIMwodD/CCS8oychpULQuG0rb
         b6VnrnIfn3nzHItiuczvF5bcDtBe74NdOQJS24JSs2GExvRFUzAXhlDu/kc4dJOA22v5
         7sxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1795759894; x=1796364694; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
        b=DCwKqdhi+Cro6eDEDQ4puRWYY6Z683Ty0sHFinUeyjRlydmgzNQl2Ibi29inW9aKQv
         dx88EDM5S+uzSLKwuv1pOkb1hdPCRIFrYAlRrLheP5M7n0x8mIQiOqfSXSSBcGTyJxZX
         kxudUD5isrv2/wWo3lPWW728DNRG+jye0vJHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759894; x=1796364694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
        b=jinFAum92R18y5I1Wh+PD0T16eBwh2Erb0KBiKU8mf3VqK1aLcZIStUBSvnx6KcHOu
         s34cOW7cMlOi399gAegL3y+PHP8qiHuo1XEiE2C4Nh0f9Zq5+hVDVkvxn2UuQ+wTSzbH
         UQOPVCXSxITksdTjmO9L1+33rZy+8XZCCSjS+fQ3uAMaPpKI+TAylN3kFpmpVmvKkJw/
         nEm4Orr/hwv9kNHLCBVvrTfRBnSK0WMX91HPsxAgep4CsGIwpa1H8ctWVZsd5KDVvpaD
         qV/P1319axVtfAoT7QDxbF0gN6MqR8cfkqJ3iC/Ryj0bAQQgTbEW+0E5jTkJaeEtlNNw
         47lA==
X-Forwarded-Encrypted: i=1; AL+hErE+yTXGnIYLQHOlzowoiwDaHNHwPGKMVBkA3DHUFQL4GnkcFLfQUjn9Om3QxySQLLtHueuSpIbGtcGXrQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/t7m99fqYkl/H2diNRO84dfg3CqBzy2qgBTh0nT2yf1YLFRs4U
	rJOZj6amXzro+5tnab22CQ+BgKvEM3Xl/dy3vo/Oeqt7drXb/IsiT5aBUO3MkAIX+te8C8H5XuO
	kQjJI4sNOufvLs8N9ZvyaolA0KVcsFm2APIqE
X-Gm-Gg: AZFdTZeWKqePScUrKS/gaK/rgJT6AnGdjA95IkMnnX1yCSMVeqorAV4tZNJWEryQRiY
	kn3b1MtPsanClykc8SA6fMiffAp0WV5R/f77T813ZwHSi+ZHjeqCAelOpspGbge5ow/V0AM6Ty4
	rjCqzgUyMtv4Q7gzUwphK9oEZxPqmaEhWlrWm0oL2pfZMbfwBHVlKAuxHt57apHKcdephtAysrI
	N8iZGRRsNGjtgDyUS3mR8zBfnJhL2ih6kkY7wwzM7OwGNKPJrFqsXiFGFreFY71eeb4zEM8Q3LK
	HP98mC2M0BxVO2lhTCYCiDqfeoNEtHjilBYoY+HSiz0i19qY6O2d2463ATrHU1BXMzCnLL+NhYV
	009JoN4gonMk+t2P9Y7Mq6U9tzgdbRg8Jc0FRpaFSBRs893DncX8OwkED2Pyq9enCjqcGIxn/3G
	Sxsbc6jCvEn2V5damb560UH2mgetT7kim+gQz19ptCbaz7mS2ayJonrGkeIFg4lRNs3eyx061c4
	M3zBKMBOjGhbA==
X-Received: by 2002:a05:690c:990:b0:8b5:6a83:5e0b with SMTP id
 00721157ae682-8b56a835f62mr24337447b3.13.1795759894475; Thu, 26 Nov 2026
 22:11:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-8-joel@jms.id.au>
 <CAJM55Z_zrUjaWrxSqZ=8VWEJqbh_Oa6gTHf=UJZyR2__MCVueQ@mail.gmail.com>
In-Reply-To: <CAJM55Z_zrUjaWrxSqZ=8VWEJqbh_Oa6gTHf=UJZyR2__MCVueQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Nov 2026 16:41:22 +1030
X-Gm-Features: Aa3M54oFZihiIV36Dcy6W1EGQUXnzGceYVdcHza3Im8kbnWUM1Yjw7rBqcfA4gE
Message-ID: <CACPK8Xc2oCDV9jeN08mrsGoS222JL3KphheOAp-pOP9_3ee=CA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221136_524313_2930674F 
X-CRM114-Status: GOOD (  21.82  )
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 at 06:02, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Quoting Joel Stanley (2026-11-09 06:10:47)
> > Add initial support for the Tenstorrent Atlantis platform, based on the
> > Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
> >
> > The evb machine represents an internal bringup vehicle with just the
> > interrupt controllers and a UART. This will be updated in time with a
> > full featured machine once details are available.
> >
> > The chosen node sets bootargs to earlycon=sbi to aid debugging early
> > boot, as the platform may not have a bootloader to fill out the chosen
> > node.
>
> Does this mean OpenSBI uses a different uart from uart1?

If you boot OpenSBI and Linux with this device tree, no, they are
using the same one.

> If not that means both Linux in S-mode and OpenSBI in M-mode will
> both try to use uart1 at the same time. It might work by chance,
> but a much better solution would be to just use "earlycon".

Your suggestion will configure the early console to use the UART
registers directly, instead of through OpenSBI's driver via the DBCN
extension. With earlycon=sbi only OpenSBI touches the UART until the
kernel's serial driver takes over, so the two are not writing at the
same time. If there's a problem with both writing to the registers,
plain earlycon makes it happen sooner, but I don't think it changes
the outcome.

OpenSBI doesn't normally print anything at runtime (unless it panics,
at which point all bets are off), so no corruption occurs. Was this
your concern?

We will keep using earlycon=sbi as this has the highest chance of
getting characters out the serial port when debugging. If we go with
the UART directly, you can't tell the difference between crashing
early in the kernel and kernel UART being misconfigured, which can be
annoying to debug.

Cheers,

Joel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
