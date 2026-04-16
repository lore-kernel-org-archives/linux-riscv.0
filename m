Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF47F8A160
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4V5vtyXKQ3nZLIShznwSyE9f2nIxAJCIPCHxhGGgv+8=; b=w3fs4toqNyVOq3
	9inlhlOo8EGLhB9zGWs/l81r3c3PaVE7G2uXwIP2asb4+QyKWktzP7r4DMPkV6Qd/SYmT/crqTA8v
	9+uylNNXOfemgrSyKLmrQ4dUvFcZC6rqCm05g8TzcbLYl2dbp1WGPIq4bLfgNn/yRSR0Sb/D6/ra/
	OOs87oS7nYkX7g/ZuBIsuoiWkrPBJtAwmmFEnwl88wdQ7WxQAm1Hkfks8JPejC6pf+3MYI+RwubTt
	Y7YYFseWFA5k+C1StVcqI0nBTM/xHPiiX6SIdR/+pneqIuqRqI85KQsQYf6On2WvLHjgFM7CJskmb
	bP+tio3TtoRvFEVLCS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKno-00000002NaG-28Ve;
	Thu, 16 Apr 2026 11:22:32 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDKnm-00000002NZK-1AwK
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 11:22:31 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f75445470so2068716e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 04:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338549; x=1776943349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=TkpPs01d3Fr/wsKTvt2BMuA1c5K7NAz9LdmGxP7xUxDU3lRFNLrbqMaeytF4+dZzGe
         jnKpYAKbTaKUha2/YW/YxL3JMyA2PFJVbN00zzi56K+oQNvw1MBfOBdXKp3rLqIHOJO6
         rZeQ2JjvzqE6mtFon8ZNl/z2/w9oqsYbXYVomdIOaIEHkFg3knnrj+0tC78LNddzAWqr
         e4pANN8mYXBO17YpFISOz3L8Ay0bKgiSbfcSNNg8JPQaa19dhFZmHnzSMj1JlP31yxoj
         z95rvKWsRqMDtbO+w++E0GArH0AoP3hTS+1t67rFALkP9VdjYEo5nZO3o2r7SPAJUz+W
         pl+Q==
X-Forwarded-Encrypted: i=1; AFNElJ98L8rGpNKieXfF4qCzjkMDtpglAKQSrIdcxDjQRBpoe+BY+QXBj39iez3sXx+zjPfx/fBhGt+/isF15A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFV0gLLkuC+jRASVnmJXlZar02T0sUlx330lWT3+tVrnFmfIcV
	GDxKoETHs1WLg4SCYcifnH/fpwppUGgMRpGvjvM/QViinu9skFnAjGPeFLWKTRLK
X-Gm-Gg: AeBDieuJScjMsjwF0plZ5+lrSNAt+PdhFOIM2+kxeiMDuKuyDU9DXq/81IWjOrqEvSD
	XVNjgrimRTMtVnojEufWCMOZdmA+zWhK01E1N/DdjuX7KKbOP5G5sPpPmlg9qT7qu+KDDJMj2Q2
	ZuUrh2FEpAP9vsA4a/3nkde70oGZTWkYusfKnDQRT9PmlK+LH0Mb4tnSgssBtEyXIK/PAeOvtJI
	6Mqj7MLLsYQCYgEl91IT/YiIVQj6Oi8/UToy5xeHF5iIihfjd4f2CFLofIlxHOAY3VbW+ykbkrP
	2L0c57HLAigtEerRty3LRYliDQo7rb1YKXrr8JgkOnxCvYQGmTRowGjdSSvkRKg6/id2NuwQARC
	r7bV1bL8E/mYG806nKLTc02BHV0+DEs6DVPRreCIclw/MZQIUglrKxbYzEVsHiXj55caIJFLj8Q
	ZvoY4/bFBPqOBLV1IxNjOa3N/G6bJstLz5q2Gu089ZCjj+9PJIbTw9Fv8xnbwp0suwUWv2lqpOk
	AO3W+6d2A==
X-Received: by 2002:a05:6122:2896:b0:56b:7ec9:f54 with SMTP id 71dfb90a1353d-56f3bcb26afmr12667423e0c.9.1776338548947;
        Thu, 16 Apr 2026 04:22:28 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89dd36dcsm2692845e0c.1.2026.04.16.04.22.27
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-605823aec55so4583983137.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9HM5u6y182Fztz+tM35Z0gks8OCi3TyBwamPZRfkP/82NxvN58iusng+qC/hnjzdr5GAKEmPzSSdMbsw==@lists.infradead.org
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
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
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_042230_327257_081ED7FA 
X-CRM114-Status: GOOD (  17.80  )
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

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
