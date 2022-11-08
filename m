Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0ABC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ds2TfaBRYMlQuPjsb6OIADAMyCS/sHElBR0vfvBYok=; b=N6QFeaBDrnQFE/
	LhO8IGcMT2XODsDRUs2uQL29iihUtUivJUa/E1NF7a9TMvcNn2Qj1fyyVZugqQ1W6tCLZhQHTFgTz
	/6snC8yTXuwVl64NycU6vnBNyZLrEHWzHymgkcOjD5RVxzMi531zlpVffD6VzjzgccSpbpRiOO/WN
	X5M0pRJlfc+GQBV7LJMDsTMtFphqKvNrgryGVBShRYDhrzDzJf+pv/vme5bV4Cvjk0VDWR8H4e8VN
	8ABrbCV0d4BwPT7k8KqXpRcC8asTkFNl0FZEBkzEi3AwY+evCUMl3OFY9lBBUG8to2ByJgKl1yfoe
	ZYtTLks25D+3EkV9Cwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQfw-006NsH-4G; Tue, 08 Nov 2022 15:38:08 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQft-006Npo-MV
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 15:38:06 +0000
Received: by mail-qt1-f175.google.com with SMTP id c15so8833963qtw.8
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1z+a2J7Rl+GyLpkq46imOOD0yWvTx4mqso+OFzooPY=;
        b=radpK7YNruzVZCDjhyaQYMZQ831nk46LSmpDZESlOBI2sZF4RRQ3zF4DWpp1JDjopU
         u21rRlsnbrgNnGi84Uwn3llNSL7zGArgxPWoT4jynHIL76GWJCVXwLIbI7dFMuPHqD9X
         1B3aFN6FLZkYqujSV19h67PMb9d9pf4Eclz33Yh5Z6uleuv/T/Dbf9CRCfvP0B9xfuFZ
         pCv+cekd8aBSTvP9lNSArvBe8Kayx29brOGtDzaDZOs8w6S+qUjYPKxcq5opuCOgHisP
         eo7zEL+DUcBL9viHqvwNI55mpi4oE7MOHZKWUGRG+DRLR4udrqGJD5vMqaLBHFRnMGCR
         Pe3g==
X-Gm-Message-State: ACrzQf3oQY9HhH0NbkwG6SA4Mp8rnY4lSA1BBo4feFiDCgaisx98zWRL
	F06Y3NngddFskL0LSgCKmjhohtwBbFoNuzCe
X-Google-Smtp-Source: AMsMyM6g3G9e/eU8ilLingESe4Hgg80Na1B+OROMsS3P8isSnVRH7QUPw3eu5voAq6bjdp/X5bPCqQ==
X-Received: by 2002:a05:622a:6118:b0:3a5:758d:8f40 with SMTP id hg24-20020a05622a611800b003a5758d8f40mr14514515qtb.95.1667921883041;
        Tue, 08 Nov 2022 07:38:03 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a259200b006e42a8e9f9bsm9414344qko.121.2022.11.08.07.38.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:38:01 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-367cd2807f2so137459617b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:38:01 -0800 (PST)
X-Received: by 2002:a81:12c8:0:b0:36a:bd6b:92fb with SMTP id
 191-20020a8112c8000000b0036abd6b92fbmr51884942yws.316.1667921881301; Tue, 08
 Nov 2022 07:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 16:37:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFnCDz2FaH6hCxADBgrzkcCC8ASh2qDXbkcJq4=B1UUQ@mail.gmail.com>
Message-ID: <CAMuHMdVFnCDz2FaH6hCxADBgrzkcCC8ASh2qDXbkcJq4=B1UUQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_073805_755656_146CD0D4 
X-CRM114-Status: GOOD (  17.97  )
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

On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add ARCH_RENESAS config option to allow selecting the Renesas RISC-V SoCs.
> We currently have the newly added RZ/Five (R9A07G043) RISC-V based SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4 -> v5
> * Sorted as per SoC name
> * Included RB tag from Conor

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
