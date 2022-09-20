Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30803ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDasBx2FqvnxOsJfjNK53e7P7LgNXW9RyEyqi+4Ma90=; b=UB0gxPD30oNh8M
	p4j31Ficsvr8K4MGFw7Fjnnw0XVFM7hDbS50ZLQ6lQQ5BUlRV+nuxkq4Hjpf3WDzKbQB7yEnNndRS
	z71saF7pQOO5OB1ntTo2vhDyapVVXck37sDuXCMKRH9+8BfhGcNIVzvjnjV0nFCGQQOYR0a6O1Rn1
	X1pbvMSIKcOo9/wcR3sewateIun35yB1exkIyyHL+EORyzCl/lGOtMkujvUuvys6JezmH9osoIbGL
	ccFiSODAP9LEVxny11DAv+LkWhfPpc6LnlwUtz7yUzPTwo6vKZRO76/nlLuf3mFkem+T8In20pTjZ
	I2S4+83TWSES5tOXrCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacSk-003jvj-6o; Tue, 20 Sep 2022 12:34:54 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacSh-003jtO-S0
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 12:34:53 +0000
Received: by mail-qt1-f179.google.com with SMTP id s18so1543369qtx.6
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DScy5TK0GP5AqTqFl701GW46IDwtxGgy76xOd2cvfOc=;
        b=l+5jx/iwH/VYXssvyKZ6BW0YZHz05FcRL3Oor2l3pp264lNFdXlWmxvBsVwLve2uAW
         kOKMQ9Z5ePzKWcdIJj2jNCbWntc5qitjGsPRhbLC5yl/IKYVJ8vF9KjA1ZKCYCZB8BvZ
         BXsAPDB6RRbgdjZw4sA1iQz9dia/kEZ8hL+jftuTgPsYcMCiRnCCVPnCQWNk/vyn2FH4
         697EthAiAxVJ8GgKw5vaf48sa/wfYy+/mqgT5kRIbdjQyfTkFXYdF+1vI2jj7JzCDY9g
         rtHcNZNoQX5J/qgoSgSSL2Qb1b2XkNuD/tTfTmZ3Oxkkw+47AxKZFUAgySUj8fspeX6E
         7qNg==
X-Gm-Message-State: ACrzQf3GrEYccR3tT+QKY9FJuhWyUKLyM0xax8p8VuzQjAAFTAb2OzeJ
	F2Yh7w1wZhqGZYpPYPQFSJPInTjPAJHKxQ==
X-Google-Smtp-Source: AMsMyM7A1/pj1OBKbcVRMobEHaDU0TuN6N4Kn4W25pBXC466+vNVlD9Ow575XKsbinMdU8IcGvKAfw==
X-Received: by 2002:a05:622a:28d:b0:35c:feca:1dbe with SMTP id z13-20020a05622a028d00b0035cfeca1dbemr825351qtw.52.1663677287424;
        Tue, 20 Sep 2022 05:34:47 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q17-20020a37f711000000b006ceb8f36302sm40921qkj.71.2022.09.20.05.34.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 05:34:47 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id a67so3169293ybb.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:34:46 -0700 (PDT)
X-Received: by 2002:a25:3746:0:b0:6b1:4a12:b2d5 with SMTP id
 e67-20020a253746000000b006b14a12b2d5mr16262084yba.89.1663677286562; Tue, 20
 Sep 2022 05:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220915181558.354737-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220915181558.354737-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Sep 2022 14:34:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWOGRpdG5=GLHc=fySqn7ErHtO0c91bJsgOO+Bp1ZUoA@mail.gmail.com>
Message-ID: <CAMuHMdUWOGRpdG5=GLHc=fySqn7ErHtO0c91bJsgOO+Bp1ZUoA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] MAINTAINERS: Add entry for Renesas RISC-V architecture
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_053451_921745_79705A06 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu, Sep 15, 2022 at 8:17 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RISC-V architecture as part of ARM/Renesas architecture, as they have
> the same maintainers, use the same development collaboration
> infrastructure, and share many files.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> * Merged as part of ARM

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
