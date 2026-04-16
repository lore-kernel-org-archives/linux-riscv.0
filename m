Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90FFF8A160
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtiu1pyLAXj8mqsD5vmxQmautevRD3OZpQmxEfTp+xg=; b=P2yIWI4YPS0YrG
	OEdVGuU1+Tau4PCNHHYqknmqPGtnmn6FWVl9p+kxflmbB3ujZQmhoTX1xD2kexRObI61jjhutJCjC
	ATZjk8QC2eD39p2os3gE8511DwGwrifnBDkH1dI9DL/f/8cJbIab01NG/bri7d/th3S6tioSVpwna
	539gE2T9VvWpph2HDzy3fR29KGfKOhhZQEVae4LZun4U9x2JmSAPg1Ovo6hDm9FyuTjL0OJnkw5I7
	LASOsAu2xohhm1mzTPKNeyYnyuiNlT89IOktHtcy/M7Olaf0DISqam4kVTf5epJ7nlmOeeXIJ/QCX
	gGF+K5S99oas8XJfwB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKnZ-00000002NWg-3mX3;
	Thu, 16 Apr 2026 11:22:17 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKnX-00000002NWK-0oKL
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 11:22:16 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60fecdd1efaso1386595137.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 04:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338534; x=1776943334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=RZsWg64AFoQc1y34m1mxtwJhHoivBaqZvGPtha0xdod3ZsRIUPKLaopzVwgXa0F6tV
         H7U06950UVCzZWPaCIorQNeJCd4lxKtoFF6/NJaDgRdPbTnblkzGrs8DDjP6RqLrJFmy
         Zu55hNgGrTHs8sA4HQfKIq34igzVTMceGPOWtGTg1h3E2mvGLflcKEMTaJZDUULNlAH1
         ycNn+esLjR7HO5MmvCECKYh4S51zx89oOIIK1iEkSvnt+7j+gCj8rlUYTJmcLsMeWkTn
         6xxPE0Qx9xXGoBEszajkAAdc5LKd6jYYP7xk6zZDnbnL8fjMnLA1sUiWy1T9kBP8PvOQ
         7Pcw==
X-Forwarded-Encrypted: i=1; AFNElJ+NF6KGSaYArbSSq3zavM1rt2A8B1JIsiXdRRhp6jw26U7mO3fr1/M+3J5nu3ODiSl5ae3mptyE/Zb1BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT3/Cyvq2q3Dk10k6GE/kN0hRiGczKViB/TFlYjBbgJ94m/k1o
	PKTa/kYpZ92Z0RyZW2ihqBJoRY2t1nD3sY/Fes2qzzKRE4a38ua+R5JxG0nFwh94
X-Gm-Gg: AeBDievdOIBMTL4ikGnUCeWWxLkc66RK6Gt58NXNK2dvAeYOQLIenvyrLso1mNYJAf4
	zTyUsZyvSa8+RBEZ88uExTfxvxmYIhNaG3zoUfEHpZIKOzGeB56joDt+7IpMUNwr82/4UZZbNfP
	foyfRaKLPqb3z9eFAQIrIIce6JzeB0txevkyDC7zugt6S+i95wQqlsbno61E9Ye/gBP8pEFAaqP
	FQ58cRumpvSRgqN+PsrAPEA768C84URxico1+NbrsAs3+LR1/h3re7gmHJ7ZZl28yWjtdGNw95C
	6SA/c1BO+I8gRc+1b6w7uXRsG7aADxYzG0PtpH0vMnW1RL+/b/kfdubEniZsFTev9i94lrb02rb
	JjdstLbEIukTYBoBdmhJITw1h0BSdD/sdyb8ZjOU6tUEgOlG7AbUpFTZpEk5ybSI/sjFYWUTGAi
	dsLEruNiJ1dhJAgDcHPjngVCDiUpC27EqiwgiciTsjdCOYJxV7NOSnOu6Oqwg5EXKhyuoaMQr/t
	1MXptJxqasnlQ==
X-Received: by 2002:a05:6102:6055:b0:608:f466:687f with SMTP id ada2fe7eead31-60a0115fd97mr9864914137.23.1776338533679;
        Thu, 16 Apr 2026 04:22:13 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-958652c87d0sm2134358241.3.2026.04.16.04.22.13
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:22:13 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d89f35940so2673672e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 04:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8USULlPgwqQFfqWsI9UlP1a138a1tYiJO0JOlgu7wOzIR263G8Nkn0PBG3a9gQB8A0V2nAWpTZSF8/zw==@lists.infradead.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_042215_245792_1C4F5F5C 
X-CRM114-Status: GOOD (  18.99  )
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

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
