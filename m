Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C86C606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 19:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KB7Omxyp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EkMa9L1p1RY/EvavtA+awFRwwxaO6/GJyU5sZ9hB8p0=; b=KB7OmxypztFSL5hqsBhbFtRzU0
	ypCu4O8+RqIbAUJR7i0hvao9VqmQja8PcdH3ssKKiCLzLfRKk/fBai2pMCtwRIvYJfAL5L4gPfJBI
	o59f3E0eO8Z5SFrmDHBHVnf+lclz54E44UO/HXBI1Mwn8tZ0YVqgnkn35F1lVe7T4KNHUHUozyoGj
	E9UkoereHWupOJoGp0IpzHiGdW7RTy4PsADPdzRWprsipJ4LTOhWXlTPVgcVimG4uQJSFRxbj5ke1
	GziQB8fJGL8XxkH07Q5vJl70pUmXRqqLbgRhHsqb561F2Jp57rmKgoT4Pv3Wlrf8C9VVcmxn2vJ05
	nqwQcmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa9m-0000000Av8M-14z0;
	Thu, 12 Nov 2026 19:08:23 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa9h-0000000Av7v-21eV
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 19:08:19 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99075306daaso157242241.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 11:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510495; x=1795115295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x7avfF8CE7MQkedzx8waSCJsEYoj4qczcsv6b4mLDHA=;
        b=ie87TXdPxiu8H+Egje4pUl5jmoc3UqdxYuY8S5pfdWxTSfxjtVzxF+3yYl8klCeCWC
         f6ePXGThXf/iTytasQdjxm1H6ddGcIHWl3dlPUahNHrg5felc7gyI+TszBpj3rt6IVvj
         iqh9USCs4Q0oyBIXMi44gZktHh6qmaubD5bUA9DmKxcECkbsJF8Q6AqXHYxQcZt+8dXI
         Q1O3V0uOUpBafxgBbbbGW1Sxe6i6+Lts9HFas2f6yvdE68rhQQSwyiLAY+VhLOQB1QUd
         g2SkGkTZHPwvlLotk3lTAo4Z4NjjYTlmeAeOcegZRmoQVYc/BJGOQgywNomDEtyg6t14
         i20Q==
X-Forwarded-Encrypted: i=1; AL+hErFrJ5UtF9A2DMKc9kGxhCwnGcpBZOTue76zAmykkgepOay+MIRBhj035lbOM2If50BzuBlUzrcyCBw0Nw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8XsdN01U6UtnX/IAp0XQydPdsojsWENHKbjTy7HbXPJQf+8yip
	6KiGhtPFcrysxUUsNe7/RlDFPMidRNeDBbpGnJbcqCI1miPNJHsivbKfd9bdTfPFhsQ=
X-Gm-Gg: AYBFou1ipJ5Tco0JojG/C/IdQCImbM9aEm23Rno5wY/oidXq0/ZYudXRjqxOtlvCpYY
	xpL6no3XSNhjtBkho+V/zAZu9rYympHrIFzSIbSKCq3ubOFdhFVKsfhzNwHdIJ4RlbWXNPZoY9Z
	azcrXVLozd9luJtJhKzRfXhZs7ahRCWzstnAFsR1o6F/E1E5t+vr3Ywl8/SV5EAyI8vu2/d6+lk
	mgPrms/P/lZs41xy1V/wu5tn6t4i6DGJMVXJzDAibNOSFqNwgYagXR+olCxWm8Qj+VvMQw5BTq5
	zBYoyZidlQ8cUpE88V6lZ+wp5pWEi1LYqQ5Kzg37BC5Il5ILJBhv6qDiT9xlm2peFFn+9JT83qj
	JRBHdyr8hG49tXwyrERp1vft6zqjjVEQ6IzbJbp4DQSOfPDiA0fwLPOepJbvk4RUKALpGfZCuq1
	0rlvDtW+O5xqpHaYcPUy9pZM3ZBpGoE5czOwGOXKu/9DPEUWhaKxUPlGuIz5BaVwl9pb307rpcZ
	YXSNxMRJVHgut9p+IgGFH1ZHnF1ZdWdmoyHffr8P0zSQeGmTrGiXQW/OZFxRlb7VzotGEb3I47N
	Oh6Rt+EfldpzWdeFj50uXB3FyCuxd8CyqUYfEsAYZN/qaq4iz0e/nCI1NgIKQc/aNjt/ccNhjMd
	BwMTQmBgfgfEf
X-Received: by 2002:a05:6102:54a8:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7d64db4c78amr63240137.35.1794510495439;
        Thu, 12 Nov 2026 11:08:15 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c4b47aesm214455137.7.2026.11.12.11.08.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:08:06 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99c0c1d07feso131024241.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 11:08:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGCjxa20RsX1hle5ofW0ay04ljb84Kd9k9fpg+cn4MzqXRHo/W7CVDav/0LkxCOl9c1OBUkyLwk09mLVQ==@lists.infradead.org
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr73919137.8.1794510481935; Thu, 12 Nov 2026
 11:08:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:07:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
X-Gm-Features: AclHuK8l5OcVstuPYNpoHJ657hIuMQK5i9ySH9sE9lHb16H-lVuh0fnzCqi0JCs
Message-ID: <CAMuHMdUgOGjwOUMxSabUgtaVeKZW1wx78XOJL8joGKkZEj7RZw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_110817_565840_B3F8DECE 
X-CRM114-Status: GOOD (  17.30  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 17:43, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem() turns
> that into -EFAULT like any other short copy.
>
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
