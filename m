Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B52C433E7
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:04:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D154422453
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 15:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Edpk1IT4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0Yaex1f/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D154422453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=exv70tCQPPrTrVeIabR0RXpWQEf+nkbsB5FScC6FNEk=; b=Edpk1IT4yaF4wsBWs9AxMOA+L
	9qYisxe08GOiIbf2bEvtUIEyKo1EV+c22fO9FOSIL9SY3UDZbSeyp6ekO9bEIMUNzgXHFE94kWkrU
	omMVFSy2jQWxxN6/79XsfNNGg6QKyPvzc8B4QIckxNRzCDs5HI82xhXm4E7TNUUhZqEx8yy8jb5cH
	uyCV+/PNb31vLRviQMsN84PJ1/3KSDRXHO3sy48Nrpy1QlapQAsPjv26O8tmqbQINroyilKS3kEDg
	J82MhTcFmJ8B1NQu30SGPIZk8+ITfxAkGZgdShNimiiqesKsQYwY/1q9M/+0fZvJKhKXp7GKRh1jg
	IspIXCAKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvMTr-0008I3-O5; Tue, 14 Jul 2020 15:04:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvMTo-0008HM-QA
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 15:04:25 +0000
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE21A22516
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594739064;
 bh=FYCfNCt5uaRkVo5QbOItUGbXRJQEdHEvBhLF5JIiyX4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0Yaex1f/6ldTkIAO0d3Rk2HfONj2eMQ0N+HcfaEuKFQj7beUx4qgw1jg46Zt7ydTb
 doNPcEm/d0nMSQ/Y8Cr5BolXv+g4tfDbsnY8uTvOmaKGYbw5p9HZ3sAzvWwvGNFYbK
 9G41aRAlpGksPHkQBe8t4WTu2Wp0BaaL34aCzD7I=
Received: by mail-oo1-f51.google.com with SMTP id c4so3395202oou.6
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 08:04:23 -0700 (PDT)
X-Gm-Message-State: AOAM533MiFC078CKhwJe56Kn6KBuy3JEox6G/qMGqBKUw2jnGxaCcozt
 Ozm1WPcVys1UdIEaqukHq4T3gsPkh+hFlDFNRA==
X-Google-Smtp-Source: ABdhPJwsDP9x0kim57Rk9m1PvNioEMAED/geuEjKV85XSOp5N+kWkC9OHZn74arPvotNxGhaS6KiH03426VYKBf/v/I=
X-Received: by 2002:a4a:ae07:: with SMTP id z7mr1744282oom.25.1594739063197;
 Tue, 14 Jul 2020 08:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200627161957.134376-1-anup.patel@wdc.com>
 <20200627161957.134376-6-anup.patel@wdc.com>
 <20200714023748.GA1164267@bogus>
 <CAAhSdy0O0YoDJ84NX8OasjuTdE8pd=Yk51WJWLpBiAEk3AcCQQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0O0YoDJ84NX8OasjuTdE8pd=Yk51WJWLpBiAEk3AcCQQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2020 09:04:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9xcnzNAtL5nM3tt21pbfwz8qB_BSwfFAtXe0mj=MVEA@mail.gmail.com>
Message-ID: <CAL_JsqL9xcnzNAtL5nM3tt21pbfwz8qB_BSwfFAtXe0mj=MVEA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: timer: Add CLINT bindings
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_110424_986554_D357FC41 
X-CRM114-Status: GOOD (  23.25  )
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

On Mon, Jul 13, 2020 at 9:47 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jul 14, 2020 at 8:07 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sat, Jun 27, 2020 at 09:49:57PM +0530, Anup Patel wrote:
> > > We add DT bindings documentation for CLINT device.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > > ---
> > >  .../bindings/timer/sifive,clint.txt           | 34 +++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt
> >
> > Bindings should be in DT schema format now.
>
> Okay, will update.
>
> >
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.txt b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> > > new file mode 100644
> > > index 000000000000..45b75347a7d5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> > > @@ -0,0 +1,34 @@
> > > +SiFive Core Local Interruptor (CLINT)
> > > +-------------------------------------
> > > +
> > > +SiFive (and other RISC-V) SOCs include an implementation of the SiFive Core
> > > +Local Interruptor (CLINT) for M-mode timer and inter-processor interrupts.
> > > +
> > > +It directly connects to the timer and inter-processor interrupt lines of
> > > +various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local interrupt
> > > +controller is the parent interrupt controller for CLINT device.
> > > +
> > > +The clock frequency of CLINT is specified via "timebase-frequency" DT
> > > +property of "/cpus" DT node. The "timebase-frequency" DT property is
> > > +described in: Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +
> > > +Required properties:
> > > +- compatible : should be "riscv,clint0" or "sifive,clint-1.0.0". A specific
> >
> > A new versioning scheme from SiFive? To review, we don't do version
> > numbers unless there's a well defined and documented scheme. IOW, one
> > that's not s/w folks just making up v1, v2, v3, etc.
>
> The "riscv,clint0" is already used by various RISC-V systems (including QEMU).

Not my problem that undocumented bindings are being used.

> The "sifive,clint-1.0.0" is for being consistent with the PLIC
> versioning scheme.

Where is that documented? This is what I expect you to be following or
updating to match:

Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

>
> There is no clear documentation of CLINT versioning scheme. I think it's best
> to just drop "sifive,clint-1.0.0" . Agree ??

No, because then you are left with a very generic compatible string.
You need something specific enough to handle any implementation
features/quirks/bugs without needing a DT update. Typically, this
means a per SoC compatible string for a block as even the same IP
version can have different integration quirks.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
