Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15124CF6D38
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2chCyGEcRkI/ojie/gJO3tTG9LmpOOop68NE2t4t9Jg=; b=mPT80YSpDzrz1bBAukMIVgD73R
	BuX4FCwq85Li1HYYGIqK4PaahvR/1UOWDLIekWR3LRy6Mim3FMjsCxLM43Pp44/rD+8a02Wp1BsWl
	pU5rbqyGsb+uW6mkH93bF5zlV7sULw5watlp53HlDeN0M7IoQuZ08NV7h1WoSR44OU96Ov1tMV8iI
	dj5v9VyL3p12l8RtWzoKk79JWNvO8YDm6uUVLgWg3THdYcbyl6E6W5IjzyMXAxYT4gbubdqfVd2Gy
	iDAgJ+6J3mYGSTyk8B19LRtSOUlQGFZWUXgvuIzUqSGyxHiRST1cgD6bvdzbTM+9lk2zHQdE4rz0t
	ScGXtn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1EF-00000006dor-3mk9;
	Wed, 02 Oct 2024 15:25:27 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1EC-00000006dmR-1p6z
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 15:25:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e188185365so814614a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727882722; x=1728487522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BR5QBB3+PfO9ZNwu2cFCCrdYnY/ZX4Z3G+e0nrn8jsI=;
        b=HvRsNzpvmofImNSiRQ2EGiLXGiDNaOPoYz9uYvciYmNQszVfVg69e+D20WU3RnCcZw
         ml7hfTDo5sMXRrhxYEd7b7PAWlQig8hwp423cHPqebvi+eTACyJA4XN0MwMVViXvuUbm
         IHq2I/yvrVNLrVPiLvcqn1xaKwf+V7Mfye7PZce24EV2LRq/7mZFp4jc8QvHAfBwekI7
         0ARcKplbe2KeBwtKbQlTJAMsjURM/dZ3byqXztON/QCZEO8a7LsC4rAEhKPJ9dq0e7KK
         q7A+JoNXNBnReh0G02sPUwuiKg2I8oJkHqwPIjyNqaQRgm+JJa1X4XOyx2njtFOQCxZD
         7MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882722; x=1728487522;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR5QBB3+PfO9ZNwu2cFCCrdYnY/ZX4Z3G+e0nrn8jsI=;
        b=gfA8NK3B5QZkeo4MAtNVKU14d5mw3TfMuG6jLemoPl1BRag81tYK7WeLLdRZsAUXLP
         9euHFaxkMyGyzmQc4/8jtOqmhHkoIDIinOPD2ZiyG/AmFlrl3QhF4BLtCOKaI9DHZOIr
         hhwQtb9BN336isjkmED8MMRSBviRn7NHGNKvlOG264QQpaIYwBQrkiR9h1v4/vfsBoQw
         e/JCP/6TBe2KofEuk78tkQ7V6fr4sZtTO3ab5/wply4sLxaKObVHDaUSNxUwWMVHvk4L
         qOOScpencwI4HRYxDZOvqNSOK8ZXzmCGHaskUhZzJ/9jg7YHTZxgXdOFRFE7AzIBlmxx
         qPJA==
X-Forwarded-Encrypted: i=1; AJvYcCXW2EegHClbG5XE9tM2w4TS5LrT3PwoR1ByWfSn/p2lJQ3xSd0USGJqnyLL4yaHkjrj4n+CIuMX4ioCdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwveIb1/yFFfRigQricHnSmNRAovcON6mKdR934UETezYi7G3mG
	HUs0AbKYai7ntH/eTiQMi88z7kXinSbEDirVvdKOPTkrg1pxdkEFXcHz5562648=
X-Google-Smtp-Source: AGHT+IFE5uX+FU2pDt/yab+HNUFuVX1mFPUjH/ILE2TfvHghbwT8ASHbfmGmK/2FrFu03J7ZYVzj9w==
X-Received: by 2002:a17:90b:3ccf:b0:2e1:a81f:5520 with SMTP id 98e67ed59e1d1-2e1a81f5c2dmr1529944a91.1.1727882722140;
        Wed, 02 Oct 2024 08:25:22 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f92eeb8sm1685692a91.48.2024.10.02.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:25:21 -0700 (PDT)
Date: Wed, 02 Oct 2024 08:25:21 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Oct 2024 08:25:19 PDT (-0700)
Subject: Re: Page sizes supported by RISC-V
In-Reply-To: <alpine.DEB.2.21.2409291631010.21893@angie.orcam.me.uk>
CC: jeffreyalaw@gmail.com, fweimer@redhat.com, linux-riscv@lists.infradead.org,
  luxu.kernel@bytedance.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: macro@orcam.me.uk
Message-ID: <mhng-cf875057-9015-4792-92d4-28db31eedd5e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_082524_699774_49E04BA5 
X-CRM114-Status: GOOD (  19.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 29 Sep 2024 08:49:34 PDT (-0700), macro@orcam.me.uk wrote:
> On Sun, 29 Sep 2024, Jeff Law wrote:
>
>> I strongly suspect the lack of specification here is mean to give degrees of
>> freedom to the implementors, but sometimes those writing the specs don't
>> really understand the implication of leaving things like this unspecified and
>> how much pain it really causes in the end.
>
>  But 64KiB pages have already been mentioned, so sanctioning this possible
> size in binutils (or LD specifically) would be a reasonable thing to do at
> this time IMHO.
>
>  FWIW out of the plethora sizes (from 1KiB up to 256TiB) possible to have
> in hardware (and available on a page-by-page basis) the MIPS/Linux port
> has settled on a fixed for a given kernel configuration page size choice
> among 4KiB, 16KiB, 64KiB, and this has been reflected in binutils, so
> perhaps copying the MIPS bits might be the path of least resistance.

This comes up every once in a while and we end generally end up deciding 
we're just stuck with a 4KiB base on RISC-V.  We've got 64KiB fused 
pages in the ISA now, so getting userspace 64KiB aligned whenever 
possible would be a nice to have, but that doesn't get rid of the 4KiB 
base page size.

When someone wants larger base page sizes then they're going to be stuck 
with all the pain that every other port had to go through to make that 
all fit together.  It's a bummer we didn't sort that out ahead of time, 
but we've got a lot of baggage to unwind ;)

>   Maciej
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
