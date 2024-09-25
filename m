Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A034CF9C6C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlylsZP/obsVTx6WPvOQfdQK5I5qG1CgaGv/K1CFX+Q=; b=3wvdd+SZtQ5uMh
	Je1mRZ4dY2uTDzjy0a/tHZshOR1UgJm1vpxeIEuLvkq+CC2ZEG6Lk59w6jTLvz97HhxK2r3UgmU64
	7u4mDjBWNwLPUcfaPMAAXoFbISbBIu0WPUrYHgCgGLz3xF2SqYHSy2IrfgO3rYqibFF29Nx70zt4f
	AVn7hYBnyruE2nCE3OaoGoL+8pDM/GtTSKr+Td5qR8nDeqXrRs3vqRuPieDNEl6u9neJmvOTnOqTf
	ioTmC6bbFgj1assINm1Lm1SdFhkd/huxFWjWf/CGzi7a3St7w+v4NHeFx+mMnDdzYZoze63DBScNM
	J+dlQxARS7N3SX3KYB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stSci-00000005Wa8-1J2A;
	Wed, 25 Sep 2024 14:04:08 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stSaz-00000005W7v-39qC
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:02:23 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e1d22ecf2a6so5981899276.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727272939; x=1727877739; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
        b=g/Nf9cMXz5nkcRUZWSlurOcNSbxZJF3HpvH3QNdfuDtmus2ZzoX9SldTUe30BV3Ewt
         JWIVGUJtrwLE6Q8yCReSfI0O4h/v44yL87MvI10dDmQDzbMwuZhrj8Mc2//hCayae7jk
         fcXrI2yY+oi4Bjd+ZgNHk3s9NiC4mTBV9w0AIKM65aqdwRJvNQeZlAtsjEtof1ic5mqz
         6krlsvdX8lhtbOhhSu1yF+qi4XyiFPVkBR2bwGRn8lbncgU9f4EMSJp2nufjhmFQ8MTi
         eHi8nZ2113r5i9SWJJSIztQuSuErb4PIeyXamTlin/Oryb1A3d+Uy5OKaRWb38viHUnb
         UbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272939; x=1727877739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
        b=OINk/LormA7DJUTwN9+FZpWiLdR1l6NQYTcIueVSZSmlvBy9anY5xfGnAlKTBGvTp7
         6UxcallQn1U+hCldlvNTEOpsbN58spw9rwtftyHzq6uBcq3m/opRx1/ukM3W41DXEK9M
         HYQ9qTG4tQ2Qv3q0lz2TUnj5leUEWhyGKWOLJgtSt4UMc0HjzZ5jgQd128Z8Zn6riLU5
         7xIB7Rtr+OyBusYb7+MMn8ajS/5M54VQgPB57OxWd/3fvbS7aLMroeT3rEXzcqpNPPw+
         12zCEKxsejh5/b+1Q9C+A5OleRtQqucNzr1Yp2r2yjTyVGO8KT7UrNGO8Zni/FP9GlR2
         nJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBjko3QX4XdVrg1oaSAmx7SujlatKzEAaIUi89e6BxrazZ6fWAHp66FaQ5VZ94JtTs3wrCpsbnRxNVSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9cqWfyS7gooi9viB3WWP0/fV1dluEg8ydpf/5mwRjiEdtVQAu
	ahjEqYV4sT4QeTfxuXCTDQEfLE0Too0/d6H3asps2EnJyJBj5FqnDHEJHY1Rxw8bA3ygOvGAu6g
	Emrj4n5MEk8gXmucWMtGhzgm3BPE0gF/yMRQExQ==
X-Google-Smtp-Source: AGHT+IE841pjxIKVha/+JpcEn2ee0Lx4ty464a7C8jVO8vOObnE+8Yr/dOWMzAzJZ++Do5wiVDiWTFPS1iajgW2vevE=
X-Received: by 2002:a05:690c:67c7:b0:6dd:bcfd:f168 with SMTP id
 00721157ae682-6e21d833475mr25994197b3.18.1727272938607; Wed, 25 Sep 2024
 07:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240826081900.2284-1-liulei.rjpt@vivo.com>
In-Reply-To: <20240826081900.2284-1-liulei.rjpt@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Sep 2024 16:01:41 +0200
Message-ID: <CAPDyKFqJAwr7S9nMywnEica77+UeT9pbbcZ05g7+xmT_1Xtd7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] usb drivers use devm_clk_get_enabled() helpers
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bin Liu <b-liu@ti.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_070221_799986_6286E82B 
X-CRM114-Status: GOOD (  16.13  )
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

On Mon, 26 Aug 2024 at 10:19, Lei Liu <liulei.rjpt@vivo.com> wrote:
>
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids calls to clk_disable_unprepare().

As I stated on another thread too [1], using devm_clk_get_enabled()
isn't solely a nice cleanup of the code. It may actually introduce a
change in behaviour. Therefore, I would not recommend applying that
kind of changes, unless some of the maintainers acks it or it gets
tested on real HW.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20240827074857.2671808-1-xirui.zhang@vivo.com/

>
> ---
> version 3 changes
> Fix the email thread.
>
> ---
> version 2 changes
>
> The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of
> certain interfaces due to the lack of synchronization during the
> commit updates. These issues have been corrected in the v1 version.
>
> 1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
>   devm_clk_get_enabled().
> 2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
>   devm_clk_get_enabled().
> 3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
>   corrected to devm_clk_get_enabled().
>
> Lei Liu (5):
>   usb: aspeed_udc: Use devm_clk_get_enabled() helpers
>   usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
>   usb: r8a66597-udc: Use devm_clk_get_enabled() helpers
>   usb: mpfs: Use devm_clk_get_enabled() helpers
>   sb: ux500: Use devm_clk_get_enabled() helpers
>
>  drivers/usb/gadget/udc/aspeed_udc.c   |  9 +--------
>  drivers/usb/gadget/udc/pxa27x_udc.c   |  6 +-----
>  drivers/usb/gadget/udc/r8a66597-udc.c | 16 ++++------------
>  drivers/usb/musb/mpfs.c               | 22 ++++++----------------
>  drivers/usb/musb/ux500.c              | 18 ++++--------------
>  5 files changed, 16 insertions(+), 55 deletions(-)
>
> --
> 2.34.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
