Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150E606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1cIR4n7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kaUZuDbPZWObq80WB29Gllmg2y6tJwQoc7RvQpRFFRg=; b=C1cIR4n7KXIpFe5Hidld0yszn7
	bGXcvtmNcfCzlS10nC43LaEjbQDeCGmuDVuPiyaIPAih2Kxsv9TvazjR31V9MpS1NsS8tmSWYW5Lt
	wBtomod4MEQwuAnhYvQE2lAWyEN9Uw5+DVzJo8zZXOb++iwdOLLtZ3PmugxofDEaqm3tNDnC/gYQP
	fcDkJ6G+ZyV63skaVxzWgJOb3ljDwRbx5CmZxZFTWd05afJEUsKHgSJsB4ECprzWpdrDTRh6Nuaj5
	Z982yO17Zkq5rY8d+RhesPG+kmx8EuzaUodDRmw81lBecjE63Pj0fxOf74YOk7uZXpvCzxlgGe4vo
	BOUG5+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8fB-000000099do-0qrl;
	Wed, 25 Nov 2026 08:47:37 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8f8-000000099cu-1A2X
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 08:47:35 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso1604228241.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 00:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596451; x=1796201251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2VZTRXJhfP019ydeKL5YFHq+Ono4E72cezNWVIlDDs=;
        b=2pE7g1w2/IvM1R42JRKLjWvnoVN0T7lzIyABCMAGKAybn4XfMpWAKu4jjhQwsiIiX1
         NmquiFnoj2or8AH3yuQJihLAfAfYxTD8wdiR8R1/72/rbhthh9/E8KMdacPpoKUfzgy/
         f75BZghfMHgbzwlTRRwfH0WO8ULAtHAGWeqFliiZBo+Z/zixlfR8njpqsRcP9Bxaiqb8
         qwCVB1zciJEGv5z9WapGuGZdJEp3k+AFjQeJ0JzKVLogRpeJNZ6NzdBgvsCR3fopDtal
         VCiHExngsp9r6tN6IpeSj+NhzuZsXImflY/xO8Adjr2Vs1eDaTEqvgrOiaYzzPG3RKCI
         tBxA==
X-Forwarded-Encrypted: i=1; AL+hErEXtnt8MJWZabqRL5STIL5SjKwbJmx6bs8jLRSSJCbBh9Pl4WU/KT/Sx854lyQJAWUFVX3rVzT6Y/s8iQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9Zrn1P7FgIw3A4qtegJ/lw6TCvLFn2MV5t7xFNNrJw/HSLP3sR
	nrn2PpBQcXsgbITgYYnQ1y3UqUMGj2X+mN49cf6qlfDMFHoSXOMpbBdigHP39yrl
X-Gm-Gg: AZFdTZdPALQdst0x2oI1y14AVQM9rF9D5q0rT0WYUqkcpKhxnkqC/UWkTA4TguLmbff
	25gaciDH8uMf1YMQCpA3IUeHCD5vvcbammPJ202LuLjHFc08UrOlodnNlWSTnN72QUcExZS55uJ
	Kk+eiAVwyCHwwEtFu32vkqleD5yXxrOLc5VB5RueqZ7hK5S65cOxhbflW/WeZs9kNUtePwtG5V+
	m+61ZalnnymrWzOSG2mpsmIdnUs79YpH95rKZ9XGHGTjjv4DwFqhP1Qby0zM/O/MprUM7yiK2L1
	rm4t214av/MOyzXVjJZM2c2Xlw+j6VT1wzqjWvhb9yuG8PKTDrUaMZbMPJ//tte1ykcj0KCltPM
	I471piEMeplmE+w22hqCsilN1mIWazzzKmPW5r3YJhtmyfXiLrxXzZ338sVi2mFC/DPXJxNwiZF
	Y+mEM6jSocU6NzO5s2kyjINN/VAoIdbL4JJFSbkEcuRaMSTVbcJUkqbTBDNcsQiR52RIUfpjcis
	lfQeYKVhQ4uTUxHaDB8hGedqGZUH3whWdLQjpFVGANwHyi/J6P+/jtxLSSKsY8XqiktCmeair9k
	uuZRyViYD6pcJeHnQbJWEmxQ/3NY7J1KezvAiBZMVlat3E6VLdKtoXXu62ZFg807okY=
X-Received: by 2002:a05:6102:441c:b0:7c3:472d:be6b with SMTP id ada2fe7eead31-7d7396c0f38mr8629465137.33.1795596450879;
        Wed, 25 Nov 2026 00:47:30 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e81cee49sm18282347137.8.2026.11.25.00.47.30
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:47:30 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso1604225241.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 00:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGf84ij4TLrag+eij4U91pH/JQD4bjaMLXkAeGD75qBvQIq1tqGJAJQhPfklkNTYaXbcgVc0kvmnjSSnA==@lists.infradead.org
X-Received: by 2002:a05:6102:cd3:b0:7cc:56a:58da with SMTP id
 ada2fe7eead31-7d7395d630fmr7124513137.23.1795596450466; Wed, 25 Nov 2026
 00:47:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-prep-meta-fw-arch-independent-v4-0-513d1c51f458@imgtec.com>
 <20261103-prep-meta-fw-arch-independent-v4-2-513d1c51f458@imgtec.com>
In-Reply-To: <20261103-prep-meta-fw-arch-independent-v4-2-513d1c51f458@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 09:47:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqGEZckVZMnmKfwpJZ-sT6Jisj7JkL31uS0S_XABCbGg@mail.gmail.com>
X-Gm-Features: Aa3M54oYWwJ4QX4LtZBAQOtixmcWW5HWWBj8NKw1oLcuyKzIqPAFolEjnn9UcmQ
Message-ID: <CAMuHMdVqGEZckVZMnmKfwpJZ-sT6Jisj7JkL31uS0S_XABCbGg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/imagination: Limit access to the RISC-V
 firmware interface
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_004734_324749_6E40CC4B 
X-CRM114-Status: GOOD (  18.72  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexandru,

On Tue, 3 Nov 2026 at 10:01, Alexandru Dadu <alexandru.dadu@imgtec.com> wrote:
> From: Alessio Belle <alessio.belle@imgtec.com>
>
> - Rename the RISC-V firmware processor header adding an "internal"
>   suffix.
> - Add guard to the RISC-V firmware processor header to prevent
>   accidental inclusion outside of the RISC-V firmware specific logic.
>
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>

Thanks for your patch, which is now commit 2f42457ad97a6d32
("drm/imagination: Limit access to the RISC-V firmware interface")
in drm-misc/for-linux-next.

> --- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
> @@ -7,7 +7,9 @@
>  #include "pvr_fw_mips.h"
>  #include "pvr_gem.h"
>  #include "pvr_rogue_cr_defs.h"
> -#include "pvr_rogue_riscv.h"
> +#define PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
> +#include "pvr_rogue_riscv_internal.h"
> +#undef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE

Really? IMHO that is very ugly.

>  #include "pvr_vm.h"
>
>  #include <linux/compiler.h>

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
