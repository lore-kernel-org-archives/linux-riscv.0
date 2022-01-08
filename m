Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A336C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jan 2022 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Exv8hsBIdtxe6g/XGUnQgDobR2MiQZY3XHuZfEmHE5U=; b=sB/q4gXgyVxJF9
	LbPLSEtjvFVeR6/ceJ5CnJzGUTsp4tyR5kkzm8Ynw5t4f/T0E3ULY0VR36fqQhDUCTgPEl3lazzC5
	b99isgYXWmJ4PXWyUunxfUIn4NHWsAPcWICZZHZ/YWu7+XV2xEHYbrfc2BchTasTLQNCHtPrxbEhx
	fL8mIEVeInpmlx3UsBnnWXJSpEntvK/pfD/GWUiuFuo4EQYpUmRmVrTiFku2dICt2hwEh/alEUgAg
	qyQUMlkzlI8IrHkg+ptuN+kQg0nUVfXC98VJMRH8SM9dU77EVvYM15wqYdk83X0szphh9QQj48RCi
	9CUPaqXM431ynP1jCwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n61PD-005nxr-Sb; Sat, 08 Jan 2022 02:24:31 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n61PA-005nx9-Oa
 for linux-riscv@lists.infradead.org; Sat, 08 Jan 2022 02:24:30 +0000
Received: by mail-yb1-xb35.google.com with SMTP id p5so14539519ybd.13
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 18:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QROqgPW59BmcvlO26kw/MeYQfypRFjouqTufbGjALHk=;
 b=FZATxcc7mOnkcgbLCbKdkEj0rbX6avAvHEXE4Il3SPKEFIRJ+WPL51JijNz4IUDwUo
 /70F9R5DidMxgWPt5pIN1MKNes2dV9BjA/8+kkooVvmeP/jFJ6toPLH1HrBNDDnUD2/h
 QpYQWUlVpyQTb1B+Q2EDsrhmrYLrfVCC67MxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QROqgPW59BmcvlO26kw/MeYQfypRFjouqTufbGjALHk=;
 b=6OPTpTrcwtKlHN/6Qi22kSVZXDnFsVWgxaA+Sb3r1RooZtfB7gnjJGB+8hob6oJ+1j
 466FqfXsI0zpRmBPP/1yBUgO3ApE0S+A4F3nes0mv5lTjJch+Ee7Soezh3WhjTodauXB
 wrQA/QJP6kAED7Zgt23Xv/fDRf/IuaqVzbHw3GfZ+6zNpR+R5g1a/eWqEtIlv9k6wvmA
 USBGmlELIFP0QrHULSUsh61ZWYV/HW7X5rbE+yUaSDo5v+ejgsz+/8L5zmFdhqecRDjX
 YHV6RSmgoZ8uBxAfAobK+/LWIi2Z08kkBzRlkkuX/0Vt5W1J+Kkc7geSC9gn4/G8eXJy
 WtIQ==
X-Gm-Message-State: AOAM533087eDeTlUH3uHH9GPV8IaYUdVliYWq8qCxgGTDMN6yRFQhoLM
 0INjg7sQgySeNNQGVEb6vfVac+/4hanYzgwv0A03
X-Google-Smtp-Source: ABdhPJzmlMAHa9+09iIXNJube0f30s+fSJGYHVyUNzBRhM1K9SIardeIOp+GRLW2iSehiv5zDlHXWWgur6iC5+YRkHQ=
X-Received: by 2002:a25:9191:: with SMTP id w17mr1876051ybl.10.1641608662771; 
 Fri, 07 Jan 2022 18:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20211224211632.1698523-1-atishp@rivosinc.com>
 <mhng-791652b4-53f0-48e4-a640-f4c418c9926b@palmer-ri-x1c9>
In-Reply-To: <mhng-791652b4-53f0-48e4-a640-f4c418c9926b@palmer-ri-x1c9>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 7 Jan 2022 18:24:12 -0800
Message-ID: <CAOnJCULirV30g6ti7QvY40=p_W9+-XG+nAbxiZ4qDZLo28RJ6A@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Provide a fraemework for RISC-V ISA extensions
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_182428_856347_D0842FE2 
X-CRM114-Status: GOOD (  26.37  )
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

On Fri, Jan 7, 2022 at 1:58 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 24 Dec 2021 13:16:30 PST (-0800), atishp@atishpatra.org wrote:
> > This series implements a generic framework to parse multi-letter ISA
> > extensions. It introduces a new DT node that can be under /cpus or
> > individual cpu depends on the platforms with homogeneous or heterogeneous
> > harts. This version of the series only allows adds support for homogeneous
> > harts as there are no platforms with heterogeneous harts yet. However,
> > the DT binding allows both.
> >
> > The patch also indicates the user space about the available ISA extensions
> > via /proc/cpuinfo.
> >
> > Here is the example output of /proc/cpuinfo:
> > (with debug patches in Qemu and Linux kernel)
> >
> > / # cat /proc/cpuinfo
> > processor     : 0
> > hart          : 0
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
>
> IMO this is the wrong way to go.  I get that the ISA string is very
> complicated to parse, but we've tried to come up with other
> representations of this we've ended up having that interface break when
> the ISA string rules eventually change.  We should just stick to the ISA
> string for these interfaces, as that's at least something everyone can
> agree on because they're defined by the spec.
>

Fair enough.

> That said, we should add the spec versions into this interface.  At
> least the user spec version is relevant here, but given that we're
> passing through some other priv-level details we might as well pass that
> though too.
>

Tsukasa already has a version that extends the isa string parsing for
multi-letter extensions
and versions parsing. We just need to add the ISA bitmap support on top of it.

I will coordinate with Tsukasa to have a complete framework based on
string parsing.
It would be good to have this series asap as all other series  (perf,
svpbmt) will rely on it.

> > processor     : 1
> > hart          : 1
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > processor     : 2
> > hart          : 2
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > processor     : 3
> > hart          : 3
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > Anybody adding support for any new multi-letter extensions should add an
> > entry to the riscv_isa_ext_id and the isa extension array.
> > E.g. The patch[1] adds the support for sscofpmf extension.
> >
> > [1] https://github.com/atishp04/linux/commit/a23157264118d6fd905fd08d8717c7df03078bb1
> >
> > Atish Patra (2):
> > RISC-V: Provide a framework for parsing multi-letter ISA extensions
> > dt-bindings: riscv: Add DT binding for RISC-V ISA extensions
> >
> > .../devicetree/bindings/riscv/cpus.yaml       |  9 +++
> > arch/riscv/include/asm/hwcap.h                | 31 ++++++++++
> > arch/riscv/kernel/cpu.c                       | 16 +++++
> > arch/riscv/kernel/cpufeature.c                | 58 ++++++++++++++++++-
> > 4 files changed, 113 insertions(+), 1 deletion(-)



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
