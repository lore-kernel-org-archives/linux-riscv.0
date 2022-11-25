Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8754C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bsxw6QpjVvBccUDhG7F8O2QCa9SdxgK197j1k7DYDw=; b=g1noZ5ABDOaZP+
	lJIeI2eJol7pXqahZWk07zUkxGbfpYe37E/rHcLkVxaKi1+LF6mWA45zAaiurv+xQpk/m4UDOMfWt
	vVSy+I6bv7GgL2pmH/Wqx0o0fLygB8kSEVvyWtHkRzPwZQwDo1rCz93OQj474xzocYj7c5oictmTT
	cYgsSsInpLIS6YZA8NYEl69bnH+c/FPLQl/pVctYdfRTjfwvpxY8Y+LEtZKoU+CMrf3Nnz5q6p0Y+
	N8F0MZH1w16hT30pACTk3JdVvPXCZHlHy4Kmkn2kky2YrWAyQqwNcdM28pWUWP7Fn/aT7Fqbtb0+x
	fLxI8Lx3YLbX8zLcpfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyUdb-00Ekip-44; Fri, 25 Nov 2022 09:04:47 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyUdY-00EkgV-5G
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 09:04:45 +0000
Received: by mail-qk1-f179.google.com with SMTP id v8so2269380qkg.12
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 01:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Na1uuPG0QUm3HxGryKPw8jShOXh4QNKTq09wipPjxvk=;
        b=uTH8paLAzRby8oEWTh8tj9ZY8yaLxXnB8ZDzMeqUA3q65e4VNN5Mg6wwpbngouPauR
         4OIJ43rDuiqUS+bFaUkvQv40EAukajSxdj4YWjy+f8OjXfiqEOWwfkyp3JCasF7xWXNs
         Gjoa0kd+LC25F16vrUPISbqgmUnMG/jRHBjyDEfG0nM8d3KlF4JcV4UvM9S5pkw2b2A/
         h5MPz/K80tG4kBiomuDXZEwHF2TDt120na2QVLqrjySrN1MSAYf8lusxn35ab9WrqOxu
         4Z8g6ZiEUumz+z8a/okHOrgrI7YT1pGKuB7eU+twutdpt+mAfb2MQplgCy9DqUXkdLQK
         OGbQ==
X-Gm-Message-State: ANoB5pkSuNMn9skh64P+uR7FiwWmwHw3gr0gzkr2H3aOaUJR8wDs4i4Y
	H+3mzfQMUsU9OrdE/qx1WTgmo4u1V27OPw==
X-Google-Smtp-Source: AA0mqf49wy8iOBbdYyHE6rQ9L0lJVbn/dKnx/Vwpup50cvEksWbs6SoQkWjy/fZdNNzpqGuilrMgbA==
X-Received: by 2002:a05:620a:2225:b0:6fa:b73:812e with SMTP id n5-20020a05620a222500b006fa0b73812emr17049319qkh.433.1669367082253;
        Fri, 25 Nov 2022 01:04:42 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v14-20020a05620a440e00b006eeae49537bsm2404865qkp.98.2022.11.25.01.04.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 01:04:41 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id j196so4375101ybj.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 01:04:39 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr9302140ybc.543.1669367079638; Fri, 25
 Nov 2022 01:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2022 10:04:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbunjdFo5YfQ2t4DSDm-LX8WhvLkzAogGrOg7HY4_uPw@mail.gmail.com>
Message-ID: <CAMuHMdWbunjdFo5YfQ2t4DSDm-LX8WhvLkzAogGrOg7HY4_uPw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_010444_224494_5C2B5605 
X-CRM114-Status: GOOD (  19.88  )
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

Hi Prabhakar,

On Thu, Nov 24, 2022 at 6:24 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> Due to the above approach custom SBI calls have been implemented. The
> above implementation is in preparation for adding support for Renesas
> RZ/Five SoC which uses the AX45MP core. As with the above approach the
> kernel image might not be generic so that it can be used on other

might be generic?

> platforms.

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
