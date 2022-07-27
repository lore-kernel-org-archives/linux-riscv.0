Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDA9C19F2C
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7wdCJZiGNPNXVSYeTyxn9V/zQl3fPUQdzOQMr8iGmo=; b=oCeZw2+/mhzd3C
	Ifyc+CDwCs29bcfvb34VyavQ9r7dvusgtL/cfz8uuECOKljlUpIvxrsi6R6O9uCTXPae6rgCC55ve
	8DsWibygoS9XP5gt1QuAYiGZ3qzS+RpMjEUCQl73ycarnsdP98fJQGcTVJunViiE20iklC+3Cidj9
	JDHRC3MNG36+AkBK9LpuQHclXgRwCv4X87A0LeauDtXZMIfE2zyr1DK6dy1BDjTBQNtPX5luFcJrJ
	j4JnAtAH9c28ToxuvtcHhO8CmoDScIaHh1cWqfEvClCazYWLgBr8fsjlF2cU666wYUiN5osQFYS4W
	OgYZs+D39fx1msYJrM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgBA-00DVFz-Sv; Wed, 27 Jul 2022 12:30:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgB7-00DV9f-Tu
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:30:19 +0000
Received: by mail-lf1-x135.google.com with SMTP id t17so14630259lfk.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ps/+5VPVaYevdh/6gOs5F1hcVnusMTfNaW2Z1T8LP+A=;
        b=aneJs51DgGyKe9+lAleeq51Nfv17XMEKNKoFAMBIFEhU+PzxuRLX7O3yCmBYWHpHGA
         UUtuAYipA+JLfIwHYEYndPbayzRJU037rJv2XVArk57C7iO8aD92FJ1RPFTNvPaQ0WbL
         nTahfc/XfkSTifQIxmxyejZdwUUjONq5RpnZX/w2WeXaV2AbPLFuK58K7Oer3tYocPQC
         9MYWf6/Fe+cCzHpNc3JR6oKbgNgfqhbrPDKnzK+2njD+iRo+IEK1pScOX+9byFS3o31k
         OXS911hCdbaxYyanxSRLF0De0Mwg9dnxElewjqurL8zRgOjTe6nZYnVJd/yQPPSN0Oz/
         zfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ps/+5VPVaYevdh/6gOs5F1hcVnusMTfNaW2Z1T8LP+A=;
        b=LnQOy1QsQGFdFnwkAmlBuVGp+Iy43rNQpAeCcthJa7KKTSYC1KDgiEwBHSH76/G9ek
         za83f8LTn1xdm6ysqGFJSfKXzDBflDaoj7ttv11dA0DS+f6q38jXAv6iy97E5t2ya9Qf
         fZK+82mmj0uaNtaj0briW6EdOvvrlBA7mi7iNNS+FS7AU2Ij3GUPwCkruvic2iY8Twtr
         4bUqJ6SxYK2kIN58F2ah0b6muIkfv7NCijfL/N+WoG68hLOIfisSvYZYf6V3L07AjjLI
         rpiR2i/KAN+SM2seVObKfYfk2VAhKpuSW7E/hlcR5bskOma6nTpq+mcNjDTzJ1Zm39ot
         lCxg==
X-Gm-Message-State: AJIora855nelEVDMt/58Be4DXdK07x+hy+3onVIExsjEbJnCbRS0AInc
	b2AbaNGM7iMXVxw6vGcYSPB6t7q+qHjR/xC3bVQYIA==
X-Google-Smtp-Source: AGRyM1usi3VvuAE9QHArHqPE+QINC2fW0qFj7SnfxJ0dIbBnMc/9ltEW0eEe8ey9YdP9hysi5LJxlZnjzcb87Fg6NAo=
X-Received: by 2002:ac2:44af:0:b0:48a:9e9f:74e5 with SMTP id
 c15-20020ac244af000000b0048a9e9f74e5mr3058834lfm.100.1658925011234; Wed, 27
 Jul 2022 05:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com> <20220727121838.tpy55twdkuasjab7@bogus>
In-Reply-To: <20220727121838.tpy55twdkuasjab7@bogus>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Jul 2022 17:59:59 +0530
Message-ID: <CAK9=C2UFgZv5T433S6EVVa+4V2Uaffg6Xq1e2zLKbdFVFYhf0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, 
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_053018_011339_68838F1C 
X-CRM114-Status: GOOD (  17.07  )
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

On Wed, Jul 27, 2022 at 5:48 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Jul 27, 2022 at 05:13:01PM +0530, Anup Patel wrote:
> > We add an optional DT property riscv,timer-can-wake-cpu which if present
> > in CPU DT node then CPU timer is always powered-on and never loses context.
> >
>
> I don't have much idea on idle states on RISC-V but associating this
> property in just CPU node seems like not so good idea.
>
> This will be applicable for all CPU idle states which means you
> can't use this even if one of the deepest idle state switches off
> the timer.
>
> We have local-timer-stop in each idle states node. IIRC RISC-V uses the
> binding which is now not arm specific[0] and IIRC you moved the binding
> yourself. Any reason why not can't be used and any specific reason for
> needing this extra property.

Indeed, the "local-timer-stop" property should be used. I guess,
Allwinner D1 should use this property in idle state and we should
not unconditionally set CLOCK_EVT_FEAT_C3STOP in the timer
driver.

@Samuel Holland Can you confirm that the "local-timer-stop" property
works for Allwinner D1 ? If yes, then please send a patch to remove
CLOCK_EVT_FEAT_C3STOP from timer driver.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
