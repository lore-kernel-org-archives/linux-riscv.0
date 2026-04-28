Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7865FFF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDITnFPOYB/sc96zhqA2VTe/H8/fTQMdlVZLGnHuaVA=; b=IBfPCwBeyxOljB
	0wXUo3tD1gHrCKNzNFzrp+PD4cDdfklG9nJ6yP5Y1P95d8LImWabS8PJy9UTmFHZ+9/zt66k7fFHq
	LNaCnnPaJ1GAQsiP2kkeG+jCyUutpVPCyqyQY7408g/TqcCLI3wtRRwQSKBZk8CxzSnS6JlrEASsr
	XhnR++ySQBalyYzEOmwDmASTVqiG4Otq2u7nBpqzvNm9lNJ/yIKL8oOHNSGC5vN7UykbtAW3qwjQA
	6krPYx/AeJuietloZaiJqlGTOmCIiq6Oo8TTA6QTUGbHRdOmXtoSM9QZ5OrbUBG+z4sFb69fyMA5+
	FiIVhFfyZ5V1juWxT75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeoa-0000000165E-1Bzx;
	Tue, 28 Apr 2026 09:33:12 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeoX-0000000164R-4Bkd
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 09:33:11 +0000
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so19508374a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 02:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368788; x=1777973588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=Bj/mo40LWCb6lzuAZ2HVLzdn5Kkh/TgwTa4eIeVdzaw42oZuBomGAcEZubsVTli1/1
         YZGCePu7Lblrz/oaqhNVZMt+ibuUQDG/ap2SrD6IQ7yXmqUnB+3W8ebvAFR54U1rhpA3
         Ylv0fCh2M0I1l6fMBhclKumei9pZrqXBuwL+GyjC99Us6MJnO8PXxNey4AHFqGkVnSsu
         2MgVfyNt1q9b51nig1r4ZjuJeldq8AtpIo3TOstWHXxENU/X3ELO0l9Td2JqYu5PIuVo
         Aa67OVvCRVOZHP2A3UE/INaka9FyQFwSC6zptybehrbg4NzIEZn3ZbliYQEw+hs9n62H
         1k4g==
X-Forwarded-Encrypted: i=1; AFNElJ+bcJ3UI0/cjiDASGptqgOpmGlm1jl/uB+u9JMnMUWZgJrndp0btWp57izn9xnqw1PkxaP8Yspp6qtBEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx8RIRimSyPeReWh7gVDzj9fA80rNoAo39nxeC9kfTUb3UWd3F
	o+5jkZoYsRlbLZZZnPXYFgumsTxPsYlMDBUDWLH+YQG6+tIuHM88PdxMjKP7R11U6uk=
X-Gm-Gg: AeBDievWLkN4qR4D0kVakL8Mr9PikubFhgttDZswwnNqKGeAIqVb1RvPT20lGldePzs
	6XX0c20FoTx4Ih/iOUXuCqi9BqkqyGw4SF+a9jXAG1znzAlcS63GJpfhY5oLgXGEzsN/n2msefW
	NvpVuqUXddMqcb3meB5jBtkj48dP0mJgiiGHnrd5BxxQAkFrstEvb+ToUBBs+7gp1xOdDJ6l3v9
	qUwGYpWMQxq0t9z8dszildysPspOIUH7FNi5367f3Fn5+uwdjvA5GnyO3Zp6uIykGQz+pwJc+n9
	TDjmGPajiFdESbrghiJ+/SHqZRb3BNUw0bxxFGf4GrvQP+lCOzMS34I6sjV01/UPcKLcDa8bG79
	MU1KJHUmmhgumkwdOmgchWg+7PH8pnjWIhYS7Sds9RiU5JL9dh5/YcTtAkrtH1qgxMWEN8NhNHp
	64MT4hBaat1z4ieyL7F0hYofLaMbRGUxIoJ70W0py4tYPiO1iv+4tn3QEN8n0s2bf2vqoCp58=
X-Received: by 2002:a05:6402:46c9:b0:672:8f26:8a91 with SMTP id 4fb4d7f45d1cf-679bb0637f1mr935444a12.12.1777368787962;
        Tue, 28 Apr 2026 02:33:07 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b6863309sm518925a12.29.2026.04.28.02.33.07
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:33:07 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so312321066b.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 02:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+vfJINgWgilaoQ0Xw7nBhbK5wc1qbicyc8SOjCJBIu0nUPoC0m7OePcFNgeAVm2l5xAcSJGzWDm029zQ==@lists.infradead.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_023310_044137_89024E21 
X-CRM114-Status: GOOD (  24.41  )
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

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

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
