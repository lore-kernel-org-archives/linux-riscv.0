Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03CBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbO0Ezb/jtF29Xru/WefbeV3B4GRPEe7KWKhOZ1wTwY=; b=WBMp4bbuD6OQps
	EAAQR96Ni1imq/8Npa7ox7hjSd1CUPPe092dhkMSPS6SuyKT0dA9BOstjHaGVyop1V/AnFbby3z/h
	gbJnnBnuAFojjK6jImuUhYSopgc1kfehP36H77sS+vP1TosOeevTu2IAjglkIF9F38h2H01bjtF3h
	c/4j7Zv0Xe+R2zA2EgmdIXyE/3m6fMrBafQU6AiMqvOiJtpNlYYq7JK4A69CAFkXO+SozwvOqTGDv
	XZq5IAgxz1CPkSbRDKaTsmEwelv+6+Yp8kypUMDJgKBkvtQ4AF1aDjpuzK++hNTTgC0Rd9YDuIPgt
	5x3yauToaHwPIm5gHOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQmE-006SkR-2A; Tue, 08 Nov 2022 15:44:38 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQmA-006Sjj-N3
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 15:44:35 +0000
Received: by mail-qk1-f176.google.com with SMTP id p18so4750263qkg.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50PklNH5QUfx4ckE9IHyJPBCOysgRvcLFQ0p1EQvvis=;
        b=ZLRF9doP8lpEYCnNTUruPb4hkULjfw3kk+AdrlZFXgcrjJwMMbBKKRsbxwNuQ9+AWd
         FUvSj/loIV9jKn6aCZpeUu1aeN577H3x9hPdtUP1Uik7PTfvR8XwDs2AUU5o5EtXk0vT
         HOvq49tJdPr/mJWlej6+Oj0f6nZ8VBDJN3yGydfTb0cFcTyKvxeE+qVutlu6O37+zJQc
         v9qq50t/c5EmVURc+5VqGt3LIiy4X/oIuN/f6WNMMCpeLw1rug8wjZTmlipbZAAVoctO
         niW9J4BTBMSHwazY8qY9wMU0PAH5kjmFDm7FZzgcUjaSZny6e1ElTc5KeC8GsDQXAVt2
         v7Qg==
X-Gm-Message-State: ACrzQf3AukSRG5vWrOtHJaeAsYlb4NkVwaNdkXJbIN7n1iZ3lGw7KSdj
	6P9algPLLTai2cRDAc6SodrLt5+YKUS0Kzn6
X-Google-Smtp-Source: AMsMyM5Pxausw7YHUCR8IezJccdqs1NZvmLbk+Szm0Rno+TDTNeaj508JqD8Pbk2n+FARS5Nc6HNKA==
X-Received: by 2002:a05:620a:108a:b0:6fa:722c:c665 with SMTP id g10-20020a05620a108a00b006fa722cc665mr21243866qkk.257.1667922272445;
        Tue, 08 Nov 2022 07:44:32 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id l5-20020ac848c5000000b003a5689134afsm8306204qtr.36.2022.11.08.07.44.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:44:32 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id z192so17888919yba.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 07:44:31 -0800 (PST)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr51553746ybb.604.1667922271344; Tue, 08
 Nov 2022 07:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221028165921.94487-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221028165921.94487-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 16:44:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWt1kg2o83duedLY1LV9W6ShehCNFD1MtUKr_EBg7M4fw@mail.gmail.com>
Message-ID: <CAMuHMdWt1kg2o83duedLY1LV9W6ShehCNFD1MtUKr_EBg7M4fw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
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
X-CRM114-CacheID: sfid-20221108_074434_765743_B52EF749 
X-CRM114-Status: GOOD (  21.18  )
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
> Enable the minimal blocks required for booting the Renesas RZ/Five
> SMARC EVK with initramfs.
>
> Below are the blocks which are enabled:
> - CPG
> - CPU0
> - DDR (memory regions)
> - PINCTRL
> - PLIC
> - SCIF0
>
> As we are reusing the RZ/G2UL SoC base DTSI [0], RZ/G2UL SMARC SoM [1] and
> carrier [2] board DTSIs which enables almost all the blocks supported
> by the RZ/G2UL SMARC EVK and whereas on RZ/Five SoC we will be gradually
> enabling the blocks hence the aliases for ETH/I2C are deleted and rest
> of the IP blocks are marked as disabled/deleted.
>
> [0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> [1] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> [2] arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Reworked completely (sort of new patch)

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
