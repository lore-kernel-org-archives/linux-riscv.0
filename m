Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A294C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hs9ErJigGDdePpbGpfu4qnF+jTYv/HcmCakMqevSYqc=; b=MezD2AejWtLtIH
	viv5OdumKyzVSXoIZS/0SmN3obc+d1ADK5TgHrRxKGLF8mmJpMQCzMq/LEpUwRdqz66+SpZHmIbc6
	o/0VQYnDC07jLZMgSwtmq3jSbA+4NkDwwBCdKQOzuoLB5LtsMSIk5/YxzzUVidYZwc4bcScMK59bc
	3ea0SCeO62ggSynTQ7yfgucr1fB+IYA/68TvmtJEOvQJgHkDh5bnj5FuU7e2TgWhlku+amUdxtzxf
	YOLJJnL6cnKnVr20eqq2vH+kyZfr1hi5IPLveoTSeG/Tpc/59Ki+41pah3KkYmgsJPtGLgR+IQnZh
	IfuXeLBRQJZMsAOYB8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrLe-0061cN-7P; Thu, 16 Dec 2021 14:03:06 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrDS-005ydQ-21
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:54:39 +0000
Received: by mail-pf1-f179.google.com with SMTP id k26so23672178pfp.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rzheh/b2C4XgE1n4fabpDIDD9PrwJO02lF9Zwrd8B1s=;
 b=S7w80t+221SJOj4qdqOFDBfAgDOt1q5aQA9y7kMn4lLUonKi7WLqJ+RZFYbmMITncL
 tLxzlTToADfxqvJe9J+3+YlMp/IoCIBI5Lk8lMXZh7sNq1joM9BXDw+6s6WBc06ad8MV
 2mCAaGglJYGpb+CwEBaLNwckMeBAfkp9LyJaxsv92G37OFw3qu5RxN1mDXW+r29FZxEB
 YujIAgys98ovErzdsEkXbA3jbKZMI31M7DLkPcB810JBDk4E1v9nYL/g8jvlfHo23X6n
 qUmnCrv9irjHo3NUCrfPiOxRCJUASdfDVf0m4+cLmflVKGCGFCvPWjkqs8K/4Ly8p4Kh
 dCQA==
X-Gm-Message-State: AOAM530m2BV30jldCUlhK7YnqQc4kjeEdF4sgYJwUDSJcB4NBcAQWyp5
 7NWyvfnjwBPMQicH72ja7s33mIczXF87Hg==
X-Google-Smtp-Source: ABdhPJynAzXdUkc/dhQcbVF6/sQwO7YbDyyWH3ETC4YHl1rxQZYPi7nKTvOdWEMGFEfpxe1DAjeGow==
X-Received: by 2002:a05:6a00:1392:b0:4ad:5688:3e7d with SMTP id
 t18-20020a056a00139200b004ad56883e7dmr14141202pfg.59.1639662876982; 
 Thu, 16 Dec 2021 05:54:36 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53])
 by smtp.gmail.com with ESMTPSA id x1sm5411130pgh.1.2021.12.16.05.54.36
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:54:36 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso977919pjc.4
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:54:36 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id
 z15mr6137098vkn.39.1639662427136; 
 Thu, 16 Dec 2021 05:47:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639660956.git.geert@linux-m68k.org>
 <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:46:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEF8r=usQMUGdw5NMLrgthgsvAB=LVm0j_uMx-eqepow@mail.gmail.com>
Message-ID: <CAMuHMdWEF8r=usQMUGdw5NMLrgthgsvAB=LVm0j_uMx-eqepow@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>, 
 Biju Das <biju.das@bp.renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_055438_142982_BE142B2A 
X-CRM114-Status: GOOD (  18.57  )
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

On Thu, Dec 16, 2021 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G2L SoC embeds Mali-G31 bifrost GPU.
> This patch series aims to add support for the same

Oops, please ignore this email. Sorry for the noise.

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
