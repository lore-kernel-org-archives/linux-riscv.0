Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F77C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33ED66124B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33ED66124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sws1R0smt4fT26F9KZ/v+FarIgUX0RLjgnMkz07rK4s=; b=MBZXZbfbmv4rjL
	Rkq8eO3/QNjjnkcSD/O1AMb4VG70ulDUCrpWbpn0DZPKTHM9A70SGf0TrLB4TyGTGDHzc655kPOJV
	DopZRRMuObbiFxPTGBF0k8JjZ9KvhffruYW1efocl2N8J8zNEH2DED3VkPFW8/+TyJ2VnVIn3uEnL
	KG34WYavnTmE0UhuoPYu6Ei8lw9hbQ9XcvzuxLFk81S4xnZtbN0Imlsd59jYs0qlKTX8ZptZhhNV0
	gQgpB0KstdLMa2U+T3LG6waURvAgiinweuNZC4jF+U/04SYWsydvXUcMFfIMC2uyDFdxXJ+W+BzBd
	nXEYVF8wnM+2/aOPm5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmPP-00EE7Z-VI; Mon, 14 Jun 2021 13:13:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmPM-00EE6Q-5V
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:13:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id o3so14510248wri.8
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XaqFjDhdi9dIScXFDsKNQBeWGz1HwBH0TF+QCGhEDg4=;
 b=HwYvbf7w8uywUzYEqLUcnCZiAoF1NoeXpwx56KYax2Bqehbxafzv0waHhZPevrg34z
 nMVIV1K2SC/msQ0BkfdJVwOnqO7JGAR3knwH8dySAyCL6llJHF/ZBeBexlWz9Rj1w6ME
 /qsPwb9mSuOs1YXOWxV6d8fSl67TpC0S6DAu1duEPhbxAYsXpUCUufv180Y56LA+2UA2
 7I28bWDD3lZPoygb9Mue5oUHuN2FeGyqZyD+Vg3QeMdAYFkhGqQ0om3jqjWlhXIcRStK
 cmxS9cTwwQWja5rRwcthhKqHsu/h3SifiTTuP5aWrznboqD4461X5ez91LokOV7+f/vd
 X/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XaqFjDhdi9dIScXFDsKNQBeWGz1HwBH0TF+QCGhEDg4=;
 b=lKIahe71MTylOkCjW3/yQOyI7Zrpc3tWQVVDT12hbo+tW+RW1VkRyuEhYBvQ4UOQP/
 HqrwnWsmJ12aRVrg99ROqb+LfMwVIAAX+COrVUgcUKJhjxk57CoAIwFORVVBlSsU6Zhb
 dPM351hviqwm56N2InrUbzG1v2yGSlGWkiANv7mL2weVLARaKexTmJN3BhKVeJuL2oOq
 waupxp5ysqJTjw+n8IJN/tnZMN0nMGGn26kIhShDYA3wN7vlD91EAdLL02Qnp7j+e+cO
 vcueZO5wBAWy0ORuZ/mOSJG12B+YmfhEOF9MBn6ja+rKoFMa/7tkk85DATFhvkeBlGT+
 vTMA==
X-Gm-Message-State: AOAM533yfAinBJetzxIzyMgPn/GRoQDuHaAbnPLVVZEvokkEoGWvtW/e
 P77n44UtUyfogxDmreUsxueFeWzvn2W76lSPd6tyvg==
X-Google-Smtp-Source: ABdhPJwaIml99G0JVblKb/bJU6ZJxhC4NnG3pECobXr6p0v0dm5rhMCSciB3jhJPIU6+0Ueq2o9rrQ5zrI4HAOZY5mY=
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr18528505wrx.144.1623676416729; 
 Mon, 14 Jun 2021 06:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-6-anup.patel@wdc.com>
 <878s3et831.wl-maz@kernel.org>
 <CAAhSdy2e9BsgtTL3ETRC-dvHW9hgKmgRi87Gsk+vUT-kMsJ4NQ@mail.gmail.com>
 <87a6nsrdkm.wl-maz@kernel.org>
In-Reply-To: <87a6nsrdkm.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Jun 2021 18:43:25 +0530
Message-ID: <CAAhSdy0jZTqZ+zTazpQLeCnbAHr99t40vEa-_GD0_UjBZsXWzg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 05/10] irqchip: Add ACLINT software interrupt driver
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_061341_889732_CF316F1F 
X-CRM114-Status: GOOD (  18.74  )
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

On Mon, Jun 14, 2021 at 3:08 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 13 Jun 2021 13:25:40 +0100,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sun, Jun 13, 2021 at 3:11 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > I'm sorry, but this really isn't an irqchip driver. This is a piece of
> > > arch-specific code that uses *none* of the irq subsystem abstractions
> > > apart from the IRQCHIP_DECLARE() macro.
> >
> > Yes, I was not sure we can call it IRQCHIP hence the RFC PATCH.
> >
> > Both ACLINT MSWI and SSWI are special devices providing only IPI
> > support so I will re-think how to fit this.
>
> It depends on how you think of IPIs in your architecture.
>
> arm64 (and even now 32bit) have been moved to a mode where IPIs are
> normal interrupts, as it helps with other things such as our pseudo
> NMIs, and reduces code duplication. MIPS has done the same for a long
> time (they don't have dedicated HW for that).

RISC-V is also moving in a similar direction with the RISC-V advanced
interrupt architecture (AIA) specification which aims at defining an
interrupt controller having MSI support, virtualization support and
scalable for a large number of CPUs. The RISC-V AIA treats IPIs as
normal interrupts.

The RISC-V ACLINT based IPI support is for RISC-V systems which
only need a simple interrupt controller without MSI support and
virtualization support. These systems will not implement RISC-V AIA.

Regards,
Anup

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
