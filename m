Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B8FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyzxM4SPRqWQ8pdQJn3qr4pVl4zMu9t8lOlgHh/c2FI=; b=PW4a0doKSdqAR6
	T8TKavhMnVL3D6JZKYp/vpAkZ0ECz8nZf7/c9A0fF0Wh1mzV4FQDfKHb7nSkeR4PqvBNXphfOvRrf
	LFa7dVMK9zPh90fK81TwgxqYQQkEsMliFXhglLzKrgJqOJaSVb3L2/C+ue3ZyRMryPWgQd4ZKaorz
	+pPLSq1kq0ao46meTPiV1YeDBQs0Khy6h/eITy5hhEdltuEtIdBM4CpS3rnAbPnjOxBUAuZdi0yMA
	nQn6VY+D5/457rgsYz4w2imy1jkwJJkWUG7XkL6uLOypIHMc+WI6yTpBK4hVn8Jm0++Qp0uLVAIMo
	th/ybRD1Osd4s49fb2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrwPQ-00AqhN-So; Fri, 20 May 2022 06:46:48 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrwPN-00Aqgi-TW
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 06:46:47 +0000
Received: by mail-qk1-f173.google.com with SMTP id j6so6325390qkp.9
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 23:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fEsG1REenhTDQ83emJMZQJrbaqrpI3TQgu5APLMoJ0=;
 b=CS8rBcsGpv8OqPQr2bwjlN6Rvn/VV6AeR6MGfYWsnDmZdUra7ln8nMta8D2OhV5T1z
 hvLA1l/lsD7MrzcG8UqRupSqdOjR0Sq7p0zJsQfTNy9oQofqpi5dLWqxKvitU/FVsSqb
 +H0SS8Ads4ebYV93YG7fO0Y6Vh2XEjDGOl56VwXgTRHtessIZDZOLjdAR8xU06DdiS3N
 z30ew1zODqKyvQHp6OtEwIeEM12CDMXuxF/4o/bThzIwqIfpfV8BIYyZucJfKrGvzwKs
 UJDhquT7IKLzwiP7dmNti8hkZlXLXFPVJaYCF8UJg1O88607xvEHDXAMNDhwxTFF5NcL
 bR4g==
X-Gm-Message-State: AOAM530GC0lEGgo7tm0wxVKl3rTPgkY8DzXQkEO0raMh+zwoCd9g+aeV
 nNnE1iP6Cnp6eJuPZwIZBApaUJ7sXLE8sw==
X-Google-Smtp-Source: ABdhPJzSUrSc+DbRaXtqZ1VXTQwKU3HBsvAYq40KZzSAQTspNe6EAMnTOav8JJpL10UwkIxKawc7gA==
X-Received: by 2002:a05:620a:46aa:b0:6a0:2372:6f01 with SMTP id
 bq42-20020a05620a46aa00b006a023726f01mr5344172qkb.297.1653029203945; 
 Thu, 19 May 2022 23:46:43 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 y10-20020ac8128a000000b002f3dc9ebb4bsm2496509qti.65.2022.05.19.23.46.43
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:46:43 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id a3so12701158ybg.5
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 23:46:43 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr8192031ybu.604.1653029203180; Thu, 19
 May 2022 23:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
 <202205201122.xuM6bWUt-lkp@intel.com>
In-Reply-To: <202205201122.xuM6bWUt-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 May 2022 08:46:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
Message-ID: <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Make the irqchip immutable
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Marc Zyngier <maz@kernel.org>,
 kbuild-all@lists.01.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_234645_991322_A2AC2772 
X-CRM114-Status: GOOD (  16.47  )
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

Hi Kernel Test Robot,

On Fri, May 20, 2022 at 5:29 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on linusw-gpio/for-next v5.18-rc7]

As of commit 2d3535ed2c73fee3 ("MAINTAINERS: update the GPIO git tree
entry"), the GPIO for-next tree has changed to
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next

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
