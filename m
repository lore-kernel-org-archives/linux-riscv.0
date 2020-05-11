Return-Path: <SRS0=qmG6=6Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3E0C54E8D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 07:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 149A5206B9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 07:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Irnw8wjp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 149A5206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aNoZEZ57CrI9/0G/8w94E+hwvPuAlWx38MUKzKDQBhc=; b=Irnw8wjptGuVYKOoVSMJpKYub
	zvm2pMpqYaNPN+0lHFIRysDfu+FsEglP1gX8wqVYSHNVl3EjthIL3c/RYfFBEaNTgWev8m+1bSbL3
	ef4425MOXWFfuqyGJIsS7XAW8YYd/rkzdtTTL7WGXnBU28niFxrxQ/JeXS/1OgX37pqL3xFRGlahO
	SmLn3czDDOM/t1toGIixRUgtCGBjrLXhqPw6eYhRaPiITP58Gr/1r5C7HS+Smg5o8HDWma8MsQ2dW
	4FpGYMz3EnYhGWOjAZUjfKwiMxL691elcFNbZVGrgkELejYN43Ok8XDb9k1a8YaE7oMwiohhSFjUd
	aO46uQQpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY31R-0002w8-NM; Mon, 11 May 2020 07:38:45 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY31J-0002lN-5x; Mon, 11 May 2020 07:38:38 +0000
Received: by mail-ot1-f68.google.com with SMTP id t3so6785825otp.3;
 Mon, 11 May 2020 00:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNoZEZ57CrI9/0G/8w94E+hwvPuAlWx38MUKzKDQBhc=;
 b=EbnXJRT29pdGoKKCtwgAc2Ah1/zOBIu4tZ0TQ3wobvKFPA0pUy7ua1fBpsxxVosxRC
 4ICjp7DjJx9nGtPAq8sGBzhn0UtOSU3LxRtGD1JKOJouiigwbmBz4eha53ZvlRRzdG4A
 WiFo6diWZnFWOj2CTNmKx/4sMI73QDoOWLUs41q5OMr6vrYf8rE+12wjWq9lNlrL/j29
 zp9YN3d0neuYBjZtoKAg29BOlrWo0GQAo+bAYH24lmqCY5Z3sod9NNtXSOMhZ+4aIwnE
 lSVWFGgERr9dW9EeE0d573WChq9wFqZO1LPAcfLoT0zMphBBC3sufQafww6qiL4b4ciC
 BRyA==
X-Gm-Message-State: AGi0PuYUHp/4HwckwJZzTPNFR6wKhEyP3hnjyU2TBJoGVvGJcUnkrXIg
 wp3MPktLPjlD/DhdCqBuvzwm0TJuN/onQ8vW/jo=
X-Google-Smtp-Source: APiQypLoBt4t5N0l098m7w2IDSx4KyTJchn19q3bmw0+va1jJpmuNmPwj2oo62ETWA1hKW2oSkbgdMOlQ069s61RJoI=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10874719otl.107.1589182716617; 
 Mon, 11 May 2020 00:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-27-hch@lst.de>
In-Reply-To: <20200510075510.987823-27-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:38:25 +0200
Message-ID: <CAMuHMdUTAA_mkS-KY70ykr-n-UJxfqM09EYcVQVKA4+FSkC1Og@mail.gmail.com>
Subject: Re: [PATCH 26/31] m68k: implement flush_icache_user_range
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_003837_223480_BB7AAE39 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
> Rename the current flush_icache_range to flush_icache_user_range as
> per commit ae92ef8a4424 ("PATCH] flush icache in correct context") there
> seems to be an assumption that it operates on user addresses.  Add a
> flush_icache_range around it that for now is a no-op.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

