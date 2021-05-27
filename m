Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31318C47089
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 14:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0BA61284
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 14:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0BA61284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AwctlBUFNVG+7vqzcXmaG3ScQRn5M5sRUBtrFB4kdg=; b=5Eu+EhxONMo+K7
	RZXI8itxBnTuRqbFOyNfborML5cnvkr3gQMDsq+uBzsFv+0hSM7GkSZtlISf9cqls0MfPNqYWA8F9
	2ba2MnI59DF1jkKZqKDNPrQI8w8/SoyoxKUJthlH+ibNYQXsil8A4O8Rd3FW/k9RqWIHSzGOKQvlB
	DDVnKf20InVU38uuc7fltigXCRUNBjOLkW40Whiy6gqmFPqUaYsrHuKTICTiPZ8W4qxDsD8vhaDYs
	2zQfPbquPUNwXgIGgQ/tgfoAD/10DGCgO1TubG+qK0bw41Z01mFnwF/Pa4AUEtek7wUYNjNyxfR5X
	KF3nw2aCBHytO5xqWrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHQN-006xgj-Cv; Thu, 27 May 2021 14:55:51 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGya-006mZt-9G; Thu, 27 May 2021 14:27:09 +0000
Received: by mail-ua1-f51.google.com with SMTP id w5so292307uaq.9;
 Thu, 27 May 2021 07:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cM98qANGM6gq7eFVcE8HDyKOCug9AFSASwSyFw9YbSU=;
 b=BSPk6jgOZhRmNi/r5xbGN2rQnfX5tyqOaZ3G7xB0IXEnu+9yaCpXJS9EwljT8ie+l2
 6uiLzKkd7CZMslrfFJog41m6HNisuDUlK0grHAQd8KknYg/aJMYazXiAup0+fJgpAK9E
 AtO/d7OrLT2oldaA1HGl0nEaIzZSjd3aWqs2jMvj6/AZeuqPy/QLuMllcPcGXldGLNBT
 QDXPGRi0MDxcrgTjYlP5EiQYqY2rLbwE2Y9ku45usdAfxtONxIpg95aPv9/z+Sn/skCj
 FIHij5dE2/+UYvp6Mr1kLJrQ1+zUTYyGlkql9w37bt2qdb1WGOTqVCdgnZTKAqSWXOjR
 GRAQ==
X-Gm-Message-State: AOAM530QSbPxpxyftwITXyz0jJnGRyXYDNKVNAu26N4z0KF9LHElY1xp
 GK/mlZkUJMYdxHGLbg4IIY5adKQ2dV6tR/14Low=
X-Google-Smtp-Source: ABdhPJyES3OOZdc3Rm5NIbkZQm2fOdpikY6zvw2E4r08/fVYUQL+sn3/8udU48KybuFSf+RW5DgGz5xYI5whS1QJ9so=
X-Received: by 2002:ab0:3d1:: with SMTP id 75mr1793111uau.106.1622125626361;
 Thu, 27 May 2021 07:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 May 2021 16:26:54 +0200
Message-ID: <CAMuHMdW0uSDEu67CoFr9dMtH_aR8SBfDd5mpZ-SzNSjacjK7VA@mail.gmail.com>
Subject: Re: [PATCH] mm: generalize ZONE_[DMA|DMA32]
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 alpha <linux-alpha@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "David S. Miller" <davem@davemloft.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Henderson <rth@twiddle.net>, Russell King <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_072708_354717_175F8CAA 
X-CRM114-Status: GOOD (  19.61  )
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

On Thu, May 27, 2021 at 4:21 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
>
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/Kconfig                      |  5 +----

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
