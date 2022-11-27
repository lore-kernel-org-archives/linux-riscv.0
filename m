Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE90C4321E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWIqxZv1Sp5xBgw+DJH/WTs3ZA6idXhkN+J4gSU/bM0=; b=ACphapjkOC6/O7
	63b4KpbuEh6RtK7Rmk6GxCPNIjL/3ogcMHKfToKans8qIWtBhdWAt0SQVo3xPHR7lioFq4p+hCvDb
	75vZyqj+0TceMhD8kDV8kDq6txztTtgdvtrk07cUtzyKnZ9oa1xhc2uzzz4yOq5++3rWbRESK23eD
	eais4F1WSohEZlHkLeFDXFCrb7TNFUu4kH8aCR10jgHm2jdXsKQZpSPAAfJlSNwPhpNaLM7ivOwhO
	xnyqHYCocc/3xBwxsIG3JAsPPUX5F4sTUh06C7Qa7NzdIp5BDgFsVhlrCEC2dQJizsnMS1YmjrgCK
	SXDYxMEj2xDnLJ+Y/B5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGdT-00BB4Q-Um; Sun, 27 Nov 2022 12:19:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGdR-00BB3l-9j
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 12:19:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id gu23so1528791ejb.10
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jza6Z//NnhC603MChrX9Y1mxWIhgstBbV7SQVlCghrA=;
        b=u9BsVmQn4l1P9N5SSYmW95s95Wcd71k2mP3wh4YR1pz1VvY+owHKVAO4cIUKlK42MP
         fGna7JGde7R5krea4qJqHAOdVnCzDjsiFXakjrjVD5T6Lyx7Ez2p35KPQOBBcGG6a914
         fbemsDLTCcD66b2vR+9GAd+JhIZL93DfcMEnad6f1t/XkqtzHxmxXfnb22oqvqPPMGAi
         e6RDdUldlyCx7VFn/6NP4jb+hudQQlHVeY3uKaS/xve46s7pZE6Sn0pkLoYkaK2f9dQf
         Hl60TofyvIILNqcEKiMfMchzYvZtt5+RcSitft/eZCIQ5TrpboCe7ft0pZiDUVsnifEh
         9VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jza6Z//NnhC603MChrX9Y1mxWIhgstBbV7SQVlCghrA=;
        b=g8uMC/PqPpmBfYmrDNO5IABKaBkgFf/bw5vvwEaMM5hVxy3oUuO5C15hfJkfW/32LY
         9etanJ8Q/i7Djob8NovFnykayeKHbf2krNYxTFO8URxjRm0/gqt9KA5srRlbKR40yLHG
         3wSrS3X0XDWlipPKPQ+Vf0M1waI2v7OBCfn6KL1HmcuuSs2LZA+ZfRrJSE1HgM7R4Cr1
         o3PZEA9tefVLe9QFn4bQ+STKuoJ+MA1ZDdtBMsCRdNj9HYEOTRUz18/k9ldoLkf4j0rC
         3B3ozPTz9Ml8B/be2wEcDWZ58mBmXaphq+NYoV0cItVrr1nHs39raGlKysrFgEtP3Q1T
         0d3w==
X-Gm-Message-State: ANoB5pnpTSpzXq85ROm5m68k10XgtFt9S4icP33fYc635RFkomMqnM5j
	Q+jwFE8XJwP0BNsBxHPpv9k24oeCy6mQfNhJZK4SixboRxwzVw==
X-Google-Smtp-Source: AA0mqf44+RQqrxuAnUVydhj6enVKkFQO9iOFt0II1GZhmlIzhD1xCZyb+TpdrO2pph0BWrZGOg8nfdhgqrYYD8JMPkQ=
X-Received: by 2002:a17:907:a044:b0:7bc:27ab:6b2d with SMTP id
 gz4-20020a170907a04400b007bc27ab6b2dmr11615745ejc.750.1669551586661; Sun, 27
 Nov 2022 04:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20221108115543.1425199-1-apatel@ventanamicro.com> <mvmiljpd4ht.fsf@suse.de>
In-Reply-To: <mvmiljpd4ht.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 17:49:34 +0530
Message-ID: <CAAhSdy2FnvRYo6AySDpKAt+O+8RzyH8fNaZekjyqs1pnmg_RQA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
To: Andreas Schwab <schwab@suse.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_041949_383997_25CFE8A8 
X-CRM114-Status: GOOD (  21.29  )
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

On Tue, Nov 8, 2022 at 5:48 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Nov 08 2022, Anup Patel wrote:
>
> > If xfer_to_guest_mode_handle_work() fails in the run-loop then exit
> > the run-loop immediately instead of doing it after some more work.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 71ebbc4821f0..17d5b3f8c2ee 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -984,8 +984,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >       while (ret > 0) {
> >               /* Check conditions before entering the guest */
> >               ret = xfer_to_guest_mode_handle_work(vcpu);
> > -             if (!ret)
> > -                     ret = 1;
> > +             if (ret)
> > +                     continue;
>
> If that is supposed to exit the loop, it would be clearer to just use
> break.

This is a convention within the run-loop that we continue whenever
whenever "ret" is no longer suitable to continue. I don't see any
particular advantage in breaking this convention over here.

>
> > +             ret = 1;
>
> There is a condition on ret <= 0 later in the loop that no longer can be
> true.

Yes, for now the "ret <= 0" check is useless and the compiler will
optimize this comparison. We will be soon having more stuff added
to run-loop (such as AIA update) which will make "ret <= 0" check
useful again.

>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

Queued this patch for Linux-6.2

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
