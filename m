Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05529C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7whGW3WfoKpW13WwYZYv+zhkwl1uCwaHsbZdUwOk254=; b=tv5/4H31MY6szv
	s167Jix2X0kLJfzhuVqh4bsKGxD6TcMdYQUg7sfGa4Ff6hwHlMqrgo1SdEQY8QOTXrabJr+XWZH59
	wwOZbv+XOipEq3BPgz/m9BaLzDf68GK/BVy9mAOq3A9Bm3N5YAZjx0wPXk4kzTSm+gCbie90b47H1
	BzsP/A1p5XR7QI1mF0IXC7TjwpHUe73NLg4PH+fxwIihM/NvrKKfqtLS9ebXIMxk/TSRIsDxUgn5a
	SiTKkCvh8Rbf4K1jKVLNnKeaeO5VOZjLOyBpIg1gW4SYprGAZDhQG80QEm0+EAr+9h963kOHnkio0
	TlHphRMolrXiwayNovuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrDm-005yo2-JY; Thu, 16 Dec 2021 13:54:58 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr6d-005vgN-4E
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:47:36 +0000
Received: by mail-ua1-f50.google.com with SMTP id 107so6842497uaj.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iBZapDL2eyvVMkB+C0NRFzbY4IahVxxfAnthP7sPxY=;
 b=bAZ/exWNV/2LKfs48VWPAbeMZ69deZ0E2kFz6UkrCg0v+D83OqOKVJnSwChIKKe9I8
 yE0aXNLKRuW64xRTZZaAr84XcS2pH0vnZGOnKDxSzwkxbINixWhlFgUh7Ws7lY8Nloqy
 IHIRNE7oOMcvCyj9e+4w3F6b0fZpi1In15P5KWCyPVZuHdiEznjwcykeDPpOwoxLwXcq
 sHpwHGKPW1CM/eAUGKkuFaZBZ+4TeBrLPhuLBxux0B/C8q8O8M6MBg5YrhgXIeMZwlfa
 V44rs1ymhlCg3IPF65F7cg5eRUHZkEFCHsq5UFGTiey56ZTaUDCMsA11qKIYbHjjEyJl
 ZtYQ==
X-Gm-Message-State: AOAM531j04aWF9RUkMjrCU+ZM3+7C5BADNmBzfpKD9y0llo6eLUj440f
 T/PcpYkU5otAUcp8LjSnGBM7Agcc4HM5rg==
X-Google-Smtp-Source: ABdhPJw8DzrQbnKcp5pFJJWjub5z4AS6xV7W8aIoM72od2W3c08vJPOUq7GQ8HQbT0MutGHKNAFR5A==
X-Received: by 2002:a67:edd7:: with SMTP id e23mr5428092vsp.52.1639662453450; 
 Thu, 16 Dec 2021 05:47:33 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id l190sm1072398vsc.26.2021.12.16.05.47.32
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:47:32 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 30so47211977uag.13
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 05:47:32 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr5231958vsj.77.1639662451912;
 Thu, 16 Dec 2021 05:47:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639661878.git.geert@linux-m68k.org>
 <20211208104026.421-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:47:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUambn+yZu0Nnc9G1ErVRR4cfjC7AHfs139GZAW1GBqjw@mail.gmail.com>
Message-ID: <CAMuHMdUambn+yZu0Nnc9G1ErVRR4cfjC7AHfs139GZAW1GBqjw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
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
X-CRM114-CacheID: sfid-20211216_054735_209046_A4A7F784 
X-CRM114-Status: GOOD (  19.45  )
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

On Thu, Dec 16, 2021 at 2:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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
