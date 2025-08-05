Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBB9C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX3suvvqIG4cHvfZV2qCdRRslutzJrOrKp5F0O0+JRQ=; b=q8Q64Wn57Q56J0
	/SgCPxZDJ/uNTz+MAlDy1Tx+wj2a3E6nJvmhRvFinz6UBWBxNTrABmWq1Cd4HBZoh7vsDYFRIKW5N
	mRFT3bLcSv+f8XoI1OeFOlBGqVvP7L+AsRNRPgV2zl2RsbcUZ3qjHk1B27pdWuhDLy3gleEdssKnz
	AkUlLxTnAtZPN0QHCbI0tCPe/wUt/wQsDNOjeC9FBod4/RVpkj9Ww4O2aD01SutT0X8mwHmybcWEv
	YNu0n3ajzCSbsDgJA8eyz3T4AJXOb86iUevOfg+jManGWwUHwhvOENp2r0zZjQyUW4gwGM5uXDLoV
	bcdtxJhzW/H7XqPEK81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDI2-0000000CEKG-42RI;
	Tue, 05 Aug 2025 08:44:59 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCnF-0000000C7QH-35gx
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 08:13:11 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-539613258e8so641492e0c.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 01:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754381588; x=1754986388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYbREyEF6GDi+6BqzkUaervyY8mSRtfMj7JERduR6Tc=;
        b=Lv4nx3uCS/SvtdV8uECXO9D3BaQYcwdrJ4iyVpoZo00DGdds7ytCLl2SLTh/PPmBi5
         QG/LKZ2ncs8W2W/l87G9TRfsGAyq7tPZqR9euz83iuGrZ1+D3LWjhK/vZHroORao+Bx5
         P2QIeRTLBHF5YRe2Q1mjYIJRleOTnUT/KZDF3r1e2DtX6BqZy+qIjYWAqkA432Y6Lvvw
         nmAl5pJDNjPqqOxyI3RJCkbgR7hHlqbEKkDsGgoJadqPfCA6CoGQeEubinesnQSoecf2
         CoY0KtmCBuc52f1iUt4KqA7k02Q5MCovdmyYgniPAS7ngWiMklSyLPmuWg30clyyiCxD
         5sKA==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZG9yy8BvQeskfkSo0xIFWkPSSJf/188VB8SauuQOC2n2HP85mL4rdw9saVohrnr7b7kw3IeRmErOVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKXFUBiFKXayOipjYc2sNkhOSiNL03YupbwIRO3XbAc82zs7da
	3DW1VcQUFwM8RqsZ3a/jbS7I2vgbscDY+eCENzqGbcfOGh29NzE51ANfp2n1O7OT
X-Gm-Gg: ASbGncuPjxhW4u1Wlmt16eKJk1h1L5EGSH7F37QiAgzlacjqrBsviWguhH/xsrDojQM
	E9b5Ch3QU0usJGw+O3inpwP4FDYyWS0Jo2rTUZvFEEnOe6rE5tl0NSv/vGSoVFRPahWTAo9OPUx
	KRn3HAApgqlYO88jzFwzsJ/S8yMKZph+lcMyGEvxM7337lsD6tP+gfkx2H/1AMzwLPRbKGIKXMp
	nu0jXWg2Z8YrxNT1vHsvYSPdlvyDnjekB5hq1clodbFcHnFP+pguohFYv8YZViQq2YAnYiI/70M
	tpFbWqIL45/nR5qPUSYx148aqI/JCg6PLmZi1tAx+rD0j1CNtKySjNc8Q+oXnUxluS/TKyMaHwf
	+u4xNozwXXtvuzkQhr0Q9zyT2T9JjUL3wunB4o3Vd8RYRaSx4iWNCmJXjFe4HAjomdKYkVN0=
X-Google-Smtp-Source: AGHT+IHCGcNwToo513dHsL+se9kW014Pmj2eC6Bri2QcCSWNMXkdjCIMXICAJ8W41abwEs3GMVee4w==
X-Received: by 2002:a05:6122:1d86:b0:539:5d6e:71fc with SMTP id 71dfb90a1353d-5395f27e1a0mr5030345e0c.5.1754381588175;
        Tue, 05 Aug 2025 01:13:08 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b15ea5sm3316858e0c.5.2025.08.05.01.13.07
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4fec0d6fd90so1001914137.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 01:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGlR02Xu8shI8zrxuY7UjiwBC2vx0+s4PsimaCdnnDTPOysguaiwq74iy2BN9xZt3cw9oS8SDYo3fRAw==@lists.infradead.org
X-Received: by 2002:a05:6102:3a0b:b0:4d7:11d1:c24e with SMTP id
 ada2fe7eead31-4fdc480dc77mr4806207137.21.1754381587163; Tue, 05 Aug 2025
 01:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250804163910.work.929-kees@kernel.org> <20250804164417.1612371-11-kees@kernel.org>
In-Reply-To: <20250804164417.1612371-11-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Aug 2025 10:12:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
X-Gm-Features: Ac12FXxoASDmKZziFEtov1BZOWBk9xds-hH6z1CBqhINtQO4YVRNUk0c1YQzJUM
Message-ID: <CAMuHMdWRAxGqLxPY0eZkrg4zMr4qY5KUcTqPjNXEKOTeNYGc8A@mail.gmail.com>
Subject: Re: [PATCH 11/17] m68k: Add __attribute_const__ to ffs()-family implementations
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_011309_777769_A28CF37E 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, 4 Aug 2025 at 18:44, Kees Cook <kees@kernel.org> wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
>
> Add missing __attribute_const__ annotations to M68K's implementations
> of ffs(), __ffs(), fls(), __fls(), and ffz() functions. These are
> pure mathematical functions that always return the same result for
> the same input with no side effects, making them eligible for compiler
> optimization.
>
> Build tested ARCH=m68k defconfig with GCC m68k-linux-gnu 14.2.0.
>
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

# ffs: pass:9 fail:0 skip:0 total:9

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
