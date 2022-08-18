Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91BCC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7zXCES6u59AMIhbC4r8nmJZh5YYFkmXAnajiDtTDR0=; b=2a902+vkD6Hciw
	48ZrntEbjgVs9ndg3MuRUFSVVcZSwnZvSkCn595ht3OTYM7m9KZRrIwwSLRVkSPxYQ4VP13yDKTEC
	oCjmaqNpx5tRQ8hrY1rJcl/svBXoaEnMA0SCp43z8d9tH7L7Tv7Xz8lg/yULZfv3onYUaJMf82loH
	c8jDA3smY210qyWTKpob7PWzP5VkAxGMVvlpgTG9oix9GkT7GiIt3/+Tqk5518w8Wr4WGJ9Yw8HQh
	EzWeQvHoJVn81qHMXGuzX04+2rr2fMIpGXAoLK4D3GZ9yUAU4Nby+V7HoDyAR161BFQVJEnYiVUDp
	/a9pqRUNfmfTyDtQN7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOfe1-005SWb-Vo; Thu, 18 Aug 2022 13:33:10 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOf8i-004yXu-Rt
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 13:00:50 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so1650280fac.12
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 06:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=G6NRVtnuSqWqwGqpWt9DLp5hNULRC9LvfIAkNgdvtjM=;
        b=AVYR98b7WU5rMP2C4HYRhs9PXrSNk3SpsNPjwMuDeDOBhB3bYXMHWKJnOuX+epURSV
         gXuk06eIrYmioL0dUtFSDrwUqtydyaDvuWngYE1tEGlvwc2sCzNLckdj9MPUueDx/bV8
         REhiZ3gj6CiCJVJq6VM0NSQrlZAxGtgjfP/zj/3UnQDu5QU6xlPA0QQ+H/DoRYFufTVA
         2YUGWJcj2Uoc/Ce8L11Xgtq7OjlQT3KwQZ3lYWpj6bcKvSBmHl3uNEQXpuVRSkrs1LMz
         LOk9BKid2y6JZdug7x0J0EfSRnByuJsoI1tidJvcp/JbRuXXY15yML7X7tu++J1psEGx
         Xyuw==
X-Gm-Message-State: ACgBeo3zHb5DrIG/HE709kNZPgKjrHyt510dm5ChJS7goSABSsBWBnJY
	YyRaEIi/hc5wYuax4gxZyyYn8j9LXdDr0A==
X-Google-Smtp-Source: AA6agR4NMcP6FhnDYfoGjpKEVa51+EYoVqpdTktfdVdYqoil8VZooa7Nrg0Aj6FEkH6f9qQHlbxm7g==
X-Received: by 2002:a05:6870:a910:b0:e6:dca:5fd3 with SMTP id eq16-20020a056870a91000b000e60dca5fd3mr1244554oab.202.1660827646288;
        Thu, 18 Aug 2022 06:00:46 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id v134-20020acaac8c000000b00344f28a7a4csm338313oie.22.2022.08.18.06.00.46
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 06:00:46 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id n16-20020a4a9550000000b0043568f1343bso349660ooi.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 06:00:46 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr2514289ybt.365.1660827625358; Thu, 18
 Aug 2022 06:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 15:00:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWv0MUsxJgy1XLNm3CENoAkRgZ2dwcYDgPdAkApA4=fQ@mail.gmail.com>
Message-ID: <CAMuHMdWWv0MUsxJgy1XLNm3CENoAkRgZ2dwcYDgPdAkApA4=fQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Sort the CPU core list alphabetically
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_060048_936180_FCAC7DDA 
X-CRM114-Status: GOOD (  16.53  )
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

On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Sort the CPU cores list alphabetically for maintenance.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



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
