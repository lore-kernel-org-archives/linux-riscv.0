Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BEEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pODXOGbgxtjWR5OZukwKDCarr3HLFAyMAGlWhUKxKtk=; b=XD43lWl+DBX5fh
	XybI1g2SrqB8X1Vs3kNV42I72fL36WUBwBz3vyCdyOb36AFTjmqcktlLrpHCxWC1t5wvG8r3gBUr3
	ubAXChd6cEZ/vLFR97wAxppPn1lO0gpnLxnBb0+8w95ZKzQlr5GFpm3Fx+0+wwQXEiqfBTy/GYV7s
	Wfp2BG677r+JA4fIE+idAx8tttZPDVHfQUPWq2PX3m+8wEfKP89rfB9cGf27O2X4LMO9unqdCezQm
	wkotOg1oJT3ZxH7Z8LrWcIszzm1aorKhhvmOoCcG1mkyhFuNFCi1JBiFZI540msqqO4fbLdwNTKav
	khduzkCGIkBdQc4p8JPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9n8-00Clo2-9S; Tue, 31 May 2022 21:52:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9n5-00Clla-Oy
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 21:52:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id u12so31472eja.8
        for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1k15B72sSbrLXkCADeeP6AzEw+boU5xN3dX9Ygix0Ho=;
        b=fziJdaGNRGa+ZTIWEzYDmG1x+thLhpnlrikLf06C4Otoz06i4B4WcWiGg1NPMmroY6
         wRvoIofy1VXG9kGwfFAU97ChR0D6KvukeW+EUmYLIOVpmgTFCBZiW0JE/GpjfJHGVf75
         jg+Vq2R40kuxG/FiSFcCGhRbQbq9GWUbtNfQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1k15B72sSbrLXkCADeeP6AzEw+boU5xN3dX9Ygix0Ho=;
        b=UrA0lxHdghBxw4r0wLff4VD+2xJYf13VcskXW0hTEdTSeqS3wFtr8KfXrLzZvzlbnp
         YDQ9rD4chE6ZEgQuskTT7N4WOaeMtDTWCHUlnZp+XNoX7U9u0F6WP2ICnc4Mez5WiVzu
         wfpRbXaV7iPqsM4zUUlOldfNJaN+xrHrW2hbHs3f7p7S82BpUFAqKw/Fpr4gZ8HdPiqN
         IEmP9dtmXo+QkCoSVt87aAzIyPrPp0GXSMZAzlEP1/NrKURf0NBprB6yFJ/ozjJVseE+
         gm6HAYVd1IRiwH0Kh9APnTi37I/efTSXgRWx2/A42N2OQUt7XQ5/4zti6zTqMryZqBYF
         z0JQ==
X-Gm-Message-State: AOAM530FpoijASdD3ayH46yTSvkPQBx48CAbRpAlHZEyil+hTspf3nX6
	wGbgQz/GWgBvDPF4P5zpWGMGESV9kFPrL0v6
X-Google-Smtp-Source: ABdhPJxHR6lT5bud4xZ621MCTFU+tJzYlHEDdJHYqyq4tQRwdXTjzpwfWAu1NMbRjqJks6LCC6hVeQ==
X-Received: by 2002:a17:906:e202:b0:6fe:478b:7c1 with SMTP id gf2-20020a170906e20200b006fe478b07c1mr55328176ejb.419.1654033953518;
        Tue, 31 May 2022 14:52:33 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id su6-20020a17090703c600b006fec63e564bsm84451ejb.30.2022.05.31.14.52.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 14:52:32 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id r129so3420963wmr.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 14:52:32 -0700 (PDT)
X-Received: by 2002:a7b:cb91:0:b0:397:3225:244 with SMTP id
 m17-20020a7bcb91000000b0039732250244mr25567719wmi.68.1654033952272; Tue, 31
 May 2022 14:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
In-Reply-To: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 May 2022 14:52:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMTEAuBRAS7aonfVM9wgupOok4HO6gX9X0FBzE3Uv2sA@mail.gmail.com>
Message-ID: <CAHk-=whMTEAuBRAS7aonfVM9wgupOok4HO6gX9X0FBzE3Uv2sA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145239_860989_5C331A21 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, May 31, 2022 at 10:13 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> I have a single manual resolution in the fe510 device tree, just the result of
> some conflicting fixes.  It's not showing up in my merge, but a bunch of other
> automatic resolutions are which is a bit worrisome on my end -- I don't usually
> touch other trees, but we had a handful of big cross-tree things this time.

Gaah. I'd have normally preferred for things like this to go through
Arnd, but it looks like he at least ack'ed these things..

I've obviously pulled it, as you can see from the pr-tracker-bot reply
that already went out.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
