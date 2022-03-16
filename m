Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234D4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aDEKpxJvu9QAlenVNQ5Nm79qAuvxO2dsVn8gig4bEA=; b=nXnD0M7xSrlhr/
	BAaNeLujnBqhOOMgleEfKayQH8MmqomlgCNHAQBArI2TgH279+1iKvb9jzUVp/A8Jbtk1vQifrIGj
	NKvLYqvJwiIkV5IsPn4BJ24x7PEmYlern+6e0V3CeZ53Cnnj1D6KAT6CANTCCrXNePL+qs+JYsk+t
	NR6G4dHtZ7Hzmn/1lgdrMGL5K2iG1FXBGLRKJWpB1vZsHVAjpu3gav8tVTolF8UbxOAdbdPvcjqpn
	lbXQQ1LWZO4nblxF/W2zDX7D5ExE9wJzQyQoE2bJi1FZ0eHxoYgBIqnvRClJ2ULAFapfPdZNRtazt
	KsifXteNLmC7aVPdZiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUIrH-00B7JM-Fi; Wed, 16 Mar 2022 01:53:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUIrF-00B7I5-50
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 01:53:50 +0000
Received: by mail-lf1-x134.google.com with SMTP id w7so1452351lfd.6
 for <linux-riscv@lists.infradead.org>; Tue, 15 Mar 2022 18:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/w6g4UFapgjJyWigEntfY4YR+4uWCSZSSrQixa3u6+g=;
 b=NOuO/gH2k2r8FqAWGTSFu3/K2RelH8l1bUKZJrYmiVaqA+UTjEqKY666OVXfT8d219
 2YlKjBcEbW9rsLFaO+lVQexhLzkDhDnQGUhQ6bY4urMhIT5FyhNYWPgdC5OvZaiN9swo
 /zne3iP33JmXYXygB8OBviNrskeEf2CIACj4MnvcwOiNM9JiuDaFHLDOnvuVC7Hg/n7i
 XrNztpYGFUn6I7YMjneJT3ad4ZI8dzWyZuSAkx4zMcPbHYeRU8K1Y6jjkkV7xw0ze/KC
 +eMZ95j3B3AybgLC9l3crRekrK+Y0eIwj3PxUJeA1TEud6ZXDuDCRYdWKXyGdbPpzgL8
 W0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/w6g4UFapgjJyWigEntfY4YR+4uWCSZSSrQixa3u6+g=;
 b=4BBXgSjrL9jxg/RqCivhSv+tUNukbn5ruZeCOmHdOGLnvZmL/K5WAj3bD5j5K1VMmn
 MswTiQAMSFg3sb3ueUt7nYaItFONPhyh1AtyqrOJlJT2TFJwIGLBkaRTu9uYQzOfJ/Jr
 3XZZmvk8XjALAssj8oLVgkMNzUtG2Pibq1GSLw3rFDhgb+gFXr1R2GA30YDxKfUhR1De
 t7Rq4dxPFJp8lwR1TgMU7miifnU5/GP+ezAOehms7iPyD1MKM1lTmnAyq0HexCZpTGCZ
 sNLwaYYLIHo8vlx1aSH9A0LUdC4j7X8Id0yKwmr7yAik2DdKIGBdM/wu66Q7wcM4FIN2
 fw+g==
X-Gm-Message-State: AOAM531fSs/1vUamI6Hxf6TLZcY4N+zBSskJslOpB3lKgdcKUut2DtAK
 qNwwULSTIiXQpbJpL6iIi9tLdbdi7KDEIpw78kNh8g==
X-Google-Smtp-Source: ABdhPJwJrWMGPCVAe9Kdw4+yO4dxhyREg9HzABowyT5uPfqBiphteSCarJzNDqam5BVctAGvnqC08Kzr648dwxePEXc=
X-Received: by 2002:a05:6512:1510:b0:445:cbc3:a51f with SMTP id
 bq16-20020a056512151000b00445cbc3a51fmr18924746lfb.116.1647395625908; Tue, 15
 Mar 2022 18:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646388139.git.zong.li@sifive.com>
 <db92d209fa700f7da8bc8028083476fcc138d80e.1646388139.git.zong.li@sifive.com>
 <20220315225459.73F2DC340E8@smtp.kernel.org>
 <20220315225652.CDAD1C340E8@smtp.kernel.org>
In-Reply-To: <20220315225652.CDAD1C340E8@smtp.kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 16 Mar 2022 09:53:36 +0800
Message-ID: <CANXhq0oAsxqL2PxkB8eOu_8L10pX_oWgwPH5y4edq5tw6ObWiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: Change the macro name of prci in each
 device node
To: Stephen Boyd <sboyd@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_185349_251655_311E678B 
X-CRM114-Status: GOOD (  14.09  )
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

On Wed, Mar 16, 2022 at 6:56 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2022-03-15 15:54:57)
> > Quoting Zong Li (2022-03-04 02:03:19)
> > > We currently change the macro name for fu540 and fu740 by adding the
> > > prefix respectively, these marcos are referenced by some device nodes,
> > > they should be modified as well.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> >
> > Cool. So it looks like I can take the clk patches and not this one and
> > it should be OK?
>
> To speed things up I can take the whole pile. Thanks for fixing the
> bisection problem.

I appreciate that you are willing to pick them up. Many thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
