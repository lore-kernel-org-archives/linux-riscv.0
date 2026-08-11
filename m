Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC6DC5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKIXs6j7AHM7pNJc4RItJDCQtp+oAThb4lEXrx0UTSc=; b=zfwxkVSl3pPpSO
	/wCde2OeCbQc/eiJrUrR/VOXh7ORwcYHsNsjkMSE7S7NNiTNq0SCBMYfGX/tC/Fv1acrd6cJnEd51
	zn5ONWwcaJb4RGm332uB9Q5V27l6Gb0LOF9MvCaLGTbdQLxWreQtfWHEhfCJS3r3qaBYuPFpX2nng
	cE03uw2ZjQcDWDJlAZZDP7VA/KbfAIdMQB5i+XB8E9SasXlTwxfqU0TuNuS4AHFl+BaZEhM0ySI33
	/8InGey1EeXLwlYj3GWwhuK75KRJiOIX3ZrvluLCNqVcEBWukP0mvQcV8igcXSJTPc3GzarPdZ3g5
	mVxIEaLoGS76mcWg2Aug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgO6-0000000DSpg-1oYA;
	Tue, 11 Aug 2026 06:55:02 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgO3-0000000DSp2-3pvn
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:55:00 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ced3386430so30684995ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 23:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431299; x=1787036099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=lcHfMvbkkj9gXpBj8guydYR5+LzyTHX/+BkdyZmJIsNeD/cn4Sql1Wr77bLng3R+9/
         hjmaANJLGdRJHykWolPxOMHmorNEPNzA8KFhKBEms5zlt5huecAjtxFUpURZKRHa1zbc
         I0gRLXAFY9bBHinKMp+fm5NOpSaysprhHNW/X8rSI91dfPQAs9jjey6aOzQlqQ6S8Xzc
         CFSYz6CgnYiyy94YUBIfMe63ekuZrA3Vms2QlkN2cQnGOXlJUlJCiHdA3Z+DmoJnz/Sr
         e4UX3BhCoZlHJkXTK5iA/B/kSuhYrgjTC7WrVIaWK48FzZIHyH+bGeARNskuSqamF3GB
         XopQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1F8+cOkyzy6bqTT6aQsCMNOA+ikp8Oabofsvi9rFKR1dih1Si1Tn9HtMX5e1WVO83o7oj3JG5z0nCrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0aOEXAiJn2GtatQ011CaKyf22L3V8Dks0A5dU1RYk29hf3iyH
	NPc4YGHKB3NNaj/ktNnFk4uOKnwbpqlL9430h8XJCX4unq9dYD41Z9c1ETwCM4HQ
X-Gm-Gg: AR+sD10yw3cYsWNoGWoNJHptf5g7Dlr9x87BYYxucVGBlEcqNd7VgM2U/BQSn/Bhi+7
	H8JnWYyt/XB963HEBXZO0de2qXETBf2w6EGFeguxSgmA0ZskDyNSxKIZJv8hTamonjLOi2M1kv9
	v2GJ77CBnNfIvSXoFzXkJhyRvp5t6iaa0bzHjlEG8zGWdxcd2Y6g+Rgb/wALPK7G0mrEhLv1coD
	x8pG1r2BJ/hyAqMjol53BQlrZBdX7/5qGr9PiLIHc4F75U56o6R+U35OCDU1H24wq6wj4BvqXV0
	0T6bUGPKm/r8NaAH8OsDLpp39EwTggfjoQ6HlwxRNww6dmfNFBbCcIaZY+Um7Ws6C1+BQJVjA2m
	TdnKOZBFk3muBWLxR2jumbuumkjFoFeFUQAZ537ss0LqKBqKWL1vpFstfwmG7E1GJs/+eDLk9Um
	FisFfiTSJeMRW7NEP6IzWRwcK9ThgJ/e6BKjtREsDdfPZBGaxfO0FE2Z1qjKHf8wv9HwXLr29Zj
	dyNCiCbSRykWL2TATm1zpf97w4tBg==
X-Received: by 2002:a17:902:f64a:b0:2ca:6d87:cda0 with SMTP id d9443c01a7336-2d3177c40c7mr16187635ad.6.1786431298688;
        Mon, 10 Aug 2026 23:54:58 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f458casm2711375ad.33.2026.08.10.23.54.58
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:54:58 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so36279545ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 23:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RozPmG5qeAUILnJEmRlcVErlTo2wqgywD+YAh8oz9ua3xOqaLj23L3BafIXWX/Rnt9DgKDGWBIE3e1XQw==@lists.infradead.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_235459_954015_F601BAC0 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

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
