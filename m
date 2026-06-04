Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5D4CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKUrUTuQM1X4lkoRuJmgaDUp9qkJFk7rCFwcyaNG9GY=; b=ZKJZNdhm5iJgto
	pbP2zLhnPMRUvE/wxjppdX11XPmy80UD1mEQ6ulZLXM4/bjPJuaOzjXmpqZCii//vbMV/nT1STdli
	frppKIA1ygBJMFr9shoJ06FXEWX+MXEu81QjeYZqEyK/hzhDTCD2yb2Hxo9werwH32AkVAmF5olkP
	W8pAu/UflxPqrbsCxuFe6LHT8QHKUqDdYPGndMPD7p7z50Sb3SWLv7qkPJmbOKRoz2mxTTOnfW2xA
	oO8Zo/K/7ZbYMMtIZt3674FMdVEz8mLsoRLeIxuFfD3QlBKEwvbhRX0MUcc128B4l0nBV+7uj6NQr
	dUI545z9Tt+ERj/dtKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9EA-0000000GugU-1jx7;
	Thu, 04 Jun 2026 14:39:22 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9E7-0000000Guf2-1DOV
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:39:21 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7e87602f26aso8643647b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780583958; cv=none;
        d=google.com; s=arc-20240605;
        b=ReEy13euDw0w0xYdqjh+4yeSjmMbsLYWRNkmY0ZgcWprLqKQ5wTpuhXQXfoIai6+2y
         ez/cut3GM1H43Xpedjt2sqK4qWw8NRO4G7z5RC+DqdHUOaxH+vlsG7a0R7eTmFPGK1OC
         LGh+q0PwCQMrI4i8lpmV/eYNUOv84MpnGbplW9Uu7z7fS4B29ArVctpoYwM/mLHY7Frp
         UxgVKZaOjp7s6ZKmJPr+u6nv4Ex/b9lE0Bn0TdKCRPtMB1oEZPEPpTyFGYtN0S3o47W8
         LmlTA1n+PwvvKBy9u4Ctduaw6siVBmC9/HliN++0z3TiVhKvuoVw3TIKUFkMVPu6eVbV
         ZSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KyQNq22zTHoCpyrA6QRDxZ9CuxarMcDHHStBIe3Zk+8=;
        fh=4JfoO4mN/r7lQGEaJCUKeJBy3+Fgch+lAWvagJe6uAI=;
        b=ZsnmI5iUOpFVblMM69xjJDWnqVicP066ZyMtDQcoSj0ijD3Y2DCfrfjaH3pkEw2z+R
         SpdQDq5fCDXZvjk1FitqS+wHco6skQowYfBqkkECoKf58keGaJVV8tFgeIn2ObiweJYh
         u6hTPJMn6X/5fcxrHksxNKFF5P2GJcvte7Q90NDdAjUWfe8IZIjBHc5gdrC8WtQ6tqk9
         2vN3VmY/HPBl6uBNW4crpvkDTb//pybWI2RfJyXqtqzxANRvscFd9Q+FwmQFBfihjywi
         68vcN/Vw7IF56GeDtnk5SaNqXEdJPYuo4rr0WBgSwP3/Xas5YazXD8XX0P1VxuZRsUPu
         dDyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1780583958; x=1781188758; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KyQNq22zTHoCpyrA6QRDxZ9CuxarMcDHHStBIe3Zk+8=;
        b=fUPIk8za/1jDWRnAGQqpeaYn8P0v0JWn6DyRUqK8KEDO/ijsx+RWUHWEwCAU5xnW0R
         q2ynd5ViIoWsQytr2I1qMTt5a2aGMj+eOsv2XKaYH43g71nNLy8MDdBZgBDGSsj1j01/
         uIxw3F52mgiUKURB+1ASiJGlAiFdx2YoKUUK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583958; x=1781188758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyQNq22zTHoCpyrA6QRDxZ9CuxarMcDHHStBIe3Zk+8=;
        b=s2nG67lNunkXdRyITtXxs4WuWFv9XrOyUYNuwaw8IrTTs//s8nKX/8bLcWw538LVGd
         elYXzGaPvnkZeUou6eFKbLrheROclRMnPJ4bgNHwercVhDIS0GCYzMHa5wtvFbxlJ4Cx
         plANSCZp+Xf6ZqoS2iXHV5grFrgXaf4yTZkEN2AFG1wOzwSptR1xMRVag8ltmrxglNr/
         QSdognG2RDR3rOBx+qaicpKDjRbTjr2LTwX4BGGAsovf8Zo1c/ShJgdYJ41ADRglXct+
         AM0hT5M8+w54HQv2F62DCc8pKhNKxVwdbum/k2tpzMHrmHApap7aLWCghFHdLHDkPRTw
         A9Kg==
X-Forwarded-Encrypted: i=1; AFNElJ/9oPygt55BJxuOLCYs02MaRDw6/RFtPK5lqSHq8zD+rRByf5VGmvBiC1YMZmeaWiCCaP1e1YsxBEUppQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMJeMEr2dvNN2TfY3o9zPFMn89Zh+pU7tNyx5T8KUvRtH2p8Iz
	jeTmnIf4If8C4JLyCTAW6e1nlRkhfzQeVtlr0cGEY+cv8VcZ6x/5kTUq53HUTMGxqDpo1RsTek3
	rqQJHvdOiLofQRW0ggFJBpJl54q2YIPs=
X-Gm-Gg: Acq92OFjIZ6hmYvJ7BpqoRbhNsoKUxrHTEjfM9S1SpQHASpUD4g1wDPxf8mKRkHGowx
	MmnK23JVbOcqwH7PgfA5tPUpryiwgaKkvhggKorYe76u3+PeJw4BMFzOFD93phlGNaGqMD5AWsT
	LFO7QN9DTiaubbQP/kkPChPGOVdfRz0gKyg5YJJm23pS0x4Nxk2pWE6HP+CyO3aOYJ3aGrRxTBL
	MMk3GXFpXmuf1jlKkPX7UYHicTNmsXd4jkD+J5lXnfxeX2Byk5flfqBJzMijpzVrwrEGkmo8Etp
	47UZgKuVS0H6jfxRmEpPAFuKmg9U6IbMc8zjJRkw4h5TwFQpSQMfvKMIk61hJ87adDXh7z5J3QZ
	shqITxl9zGA8IXATV5LHBzpjT4691Ihu2OKA=
X-Received: by 2002:a05:690c:6aca:b0:798:5213:d90e with SMTP id
 00721157ae682-7eb8d2aa5b6mr29552117b3.25.1780583957632; Thu, 04 Jun 2026
 07:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260603074222.593243-1-joel@jms.id.au> <20260603074222.593243-5-joel@jms.id.au>
 <20260603-tadpole-slept-8b6eeae9cd47@spud>
In-Reply-To: <20260603-tadpole-slept-8b6eeae9cd47@spud>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Jun 2026 00:09:06 +0930
X-Gm-Features: AVHnY4IpYYxRTj3rx2pop7nqyDgzfgVuavgDjhbxh2LAlMZ1aHHhJtAB9F9dAbM
Message-ID: <CACPK8Xf=Ec16jR+J399Pqi=O=2GgFjkZOPFo0AKaAA+58R6-gQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_073919_426869_2EBAE8D2 
X-CRM114-Status: GOOD (  20.94  )
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

On Wed, 3 Jun 2026 at 18:53, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jun 03, 2026 at 05:12:16PM +0930, Joel Stanley wrote:
> > Document the bindings for the RISC-V ACLINT.
> >
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  MAINTAINERS                                   |  1 +
> >  .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++++
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..43dd9873bbc5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23005,6 +23005,7 @@ M:    Joel Stanley <jms@oss.tenstorrent.com>
> >  L:   linux-riscv@lists.infradead.org
> >  S:   Maintained
> >  T:   git https://github.com/tenstorrent/linux.git
> > +F:   Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> >  F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
> >  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> >  F:   arch/riscv/boot/dts/tenstorrent/
> > diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > new file mode 100644
> > index 000000000000..192ff3fcf79f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Advanced Core Local Interruptor (ACLINT)
> > +
> > +maintainers:
> > +  - Joel Stanley <jms@oss.tenstorrent.com>
> > +
> > +description:
> > +  This RISC-V ACLINT specification defines a set of memory mapped devices which
> > +  provide inter-processor interrupts (IPI) and timer functionalities for each
> > +  HART on a multi-HART RISC-V platform. The specification can be found at
> > +  https://github.com/riscvarchive/riscv-aclint/
>
> This is a draft specification, so having a "riscv,aclint-mtimer"
> compatible is not appropriate. Ordinarily I would say that you should be
> able to do this once frozen, but this spec is archived and unlikely to
> have that happen.

I've reworked the binding to reference the privileged spec, which is
ratified and has a section on the timer registers:

 https://docs.riscv.org/reference/isa/priv/machine.html#3-1-2-1-machine-timer-mtime-and-mtimecmp-registers

I'll post a v2 now for review.

Cheers,

Joel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
