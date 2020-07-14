Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E85C433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 03:48:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A524D206F0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 03:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWWUg8fT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Dn/xsk6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A524D206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pXnW9YjSSS/YWFCxoHMguZBB4gs972ag+vRkGqX/qy0=; b=eWWUg8fTnVtW7NVUcEtbts7+n
	8OGQyIqGn1qW/fF+Ts9TPK4ZC+CQfBTMQC6YWveZn5JWxf1ePKIAYbQfoCIhu/nMLQ+V33GeGa71c
	N9pWFzzAQiqiUhtHLf8RBchf3bb9SVEiY70qArLHBj9fQArBcSlgeaqnvfHCZbIBkUT6yzo+GXWDv
	tLBTg/UVBIuSck8HiF7sW+M2/KFlTIXGkAOnldorQA46cSqgZ0RrHBhZXwK7gnHEG7YuZqaJ2boig
	QABZY0U3T9cDcfxI46OSxx5EMdLz/+2/yIavLD25UwiYuPrimaj7U+fZC3QdPIY5FsQOk+NPhOm03
	P5cgfI+xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvBvB-0007ZU-OB; Tue, 14 Jul 2020 03:47:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvBv8-0007Yw-Uy
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 03:47:55 +0000
Received: by mail-wr1-x444.google.com with SMTP id k6so19546040wrn.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 20:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qI24xBB/rzdG/cpOm9YsxEJKq/zwmC3JEgqbChZ686c=;
 b=Dn/xsk6EaU3zSb3BKgpl+10/FOdZR1egP1f1UGyP/yNSXO++t5ytc1+ErOGmvm+3Qw
 sKKbiNY4LnTQ8EzxXcs6o3fPg+FB3aGqwwk3T6BNlzi4Ebc4Vte3BvxGAccxcvLgprJa
 dFBBCrQvDqm3cTojPiUdKlSODLmPVNibHOmFmaV2z2OCkvZrDheBxM9q99AG3Wx/GhRM
 k91NIQFoXCd1vjRmkwAntBQQEg72tpb5qFckMM4QyANyda/c40HxMabSblMYJX4kJvGL
 FujGdM2y3OlTkTveXMZupSqKsV0sqI50l2HoHWCBz7yh3OzxseS/idJUYn88p5lbQsXx
 a7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qI24xBB/rzdG/cpOm9YsxEJKq/zwmC3JEgqbChZ686c=;
 b=TrXhZWQTsB88YpEKIqquSh3mdJOjG4i0yvysm6euwIfQjSAV/pfnRECj0spPszWO5B
 1EBlhtMlLziPpezUylL6a6rnjUsoPNVuULVKM9vnD93ZJJXY5RsCxteNBG63cZmgv/26
 HMit5CvI29BBBMbhC4tRJ2eayUEZVmL8Dm6xKMIKmZJk2/gsiBhCNyN0Ll2X6/1+TysP
 BySXr0eXIl/ShmgQgoJyep/LXpKcpaUO1+C3cWc7GwgJZcvJDsvuv2Z/BdTi94et//Cb
 gqlCNqdXU6r6dN9SpVvIiaO43+rqL9GAkh+UV26k9+rIRUQdbMReNDpwWksDfQyepIwn
 QY7A==
X-Gm-Message-State: AOAM533O0f1VVF3RicDLmf8aobcWbT4wRit0LcYtyCC5yn0W+YBw1agN
 IQQdjmrJS5GihbU/EqtUY7Mh02a4QLEOXw8XF7EArA==
X-Google-Smtp-Source: ABdhPJyzmGfojs4K3LUS8fPXgGa7xK2rYTn4JhLpsd4yeuJCR3uTFmQBj4zD54/cXBQfEZqb4E1JRCJz4UWUThjGymE=
X-Received: by 2002:adf:fcca:: with SMTP id f10mr2659455wrs.325.1594698471722; 
 Mon, 13 Jul 2020 20:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200627161957.134376-1-anup.patel@wdc.com>
 <20200627161957.134376-6-anup.patel@wdc.com>
 <20200714023748.GA1164267@bogus>
In-Reply-To: <20200714023748.GA1164267@bogus>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jul 2020 09:17:39 +0530
Message-ID: <CAAhSdy0O0YoDJ84NX8OasjuTdE8pd=Yk51WJWLpBiAEk3AcCQQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: timer: Add CLINT bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_234755_009814_0A732ADF 
X-CRM114-Status: GOOD (  21.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 8:07 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Jun 27, 2020 at 09:49:57PM +0530, Anup Patel wrote:
> > We add DT bindings documentation for CLINT device.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  .../bindings/timer/sifive,clint.txt           | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt
>
> Bindings should be in DT schema format now.

Okay, will update.

>
> >
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.txt b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> > new file mode 100644
> > index 000000000000..45b75347a7d5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> > @@ -0,0 +1,34 @@
> > +SiFive Core Local Interruptor (CLINT)
> > +-------------------------------------
> > +
> > +SiFive (and other RISC-V) SOCs include an implementation of the SiFive Core
> > +Local Interruptor (CLINT) for M-mode timer and inter-processor interrupts.
> > +
> > +It directly connects to the timer and inter-processor interrupt lines of
> > +various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local interrupt
> > +controller is the parent interrupt controller for CLINT device.
> > +
> > +The clock frequency of CLINT is specified via "timebase-frequency" DT
> > +property of "/cpus" DT node. The "timebase-frequency" DT property is
> > +described in: Documentation/devicetree/bindings/riscv/cpus.yaml
> > +
> > +Required properties:
> > +- compatible : should be "riscv,clint0" or "sifive,clint-1.0.0". A specific
>
> A new versioning scheme from SiFive? To review, we don't do version
> numbers unless there's a well defined and documented scheme. IOW, one
> that's not s/w folks just making up v1, v2, v3, etc.

The "riscv,clint0" is already used by various RISC-V systems (including QEMU).

The "sifive,clint-1.0.0" is for being consistent with the PLIC
versioning scheme.

There is no clear documentation of CLINT versioning scheme. I think it's best
to just drop "sifive,clint-1.0.0" . Agree ??

>
> > +  string identifying the actual implementation can be added if implementation
> > +  specific worked arounds are needed.
> > +- reg : Should contain 1 register range (address and length).
> > +- interrupts-extended : Specifies which HARTs (or CPUs) are connected to
> > +  the CLINT.  Each node pointed to should be a riscv,cpu-intc node, which
> > +  has a riscv node as parent.
> > +
> > +Example:
> > +
> > +     clint@2000000 {
> > +             compatible = "sifive,clint-1.0.0", "sifive,fu540-c000-clint";
>
> Doesn't match the binding.

Okay, will update.

>
> > +             interrupts-extended = <
> > +                     &cpu1-intc 3 &cpu1-intc 7
> > +                     &cpu2-intc 3 &cpu2-intc 7
> > +                     &cpu3-intc 3 &cpu3-intc 7
> > +                     &cpu4-intc 3 &cpu4-intc 7>;
> > +             reg = <0x2000000 0x4000000>;
> > +     };
> > --
> > 2.25.1
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
