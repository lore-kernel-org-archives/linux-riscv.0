Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85990C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 18:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4254660EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 18:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4254660EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bluespec.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLT4jXnzpBo80eLd231LJzDZ3wbpzo1Nl5RJVzBKxWQ=; b=KVFbzj+S3GTEzF
	WTthXsCcVgNRfPwetZOhzsGJ0mSFbN52nnEm6lxzaA8D5MhZzLY6SBe4jGfRbPtu+L4CPaJOa1Ty/
	gDwBFPFD9bw3WqqEXO7MjlReN6e3ren1eJ4TSYISptE4onN3Dnzq5PV2AaobfElZWTbq8jxP0FsGV
	oRbFxBPsLZda1LsQOrFhpAYIPkliK7rYhAlb9uTkU0pANlAxmzTzNpYSOoeg0NnUV3ebnpOQvGx8a
	4UEPTD7j5ejUNnTM0e3Qxpz6rlbQGDw9KWvfCn4zRoD+reyd+ETEvojVZm4tlkLDrXKPdX7QrCrAJ
	5b0V7ORxt2KCwkYuMZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdFuf-005NG7-CB; Wed, 20 Oct 2021 18:02:05 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdFuc-005NFS-Q5
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 18:02:04 +0000
Received: by mail-qt1-x831.google.com with SMTP id i1so3793666qtr.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 11:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bluespec-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WTl3bWLn4r0YyGnwQypBQT886kyZ2N/6Sr56JBYL25Q=;
 b=5z+IMjw6qNm5fLB6pOGnGAOKzyOfpAGJrq4UzK+7Xmy6KihBt6X8aGnssD5oy+wzJg
 sJ2E5T5nDZGGGe7Yah+AkjgMV8J1eetcMxI5cYY0hhLsou1KsFGybu+8aa6c2nnKhnhT
 mB+iw3r4pMVLhaMZu+1rvwv6Dl4Yn8u1MWa84XWtk3/yOyPctX+sjdQHVE2ZlX+NZRDy
 RyFq/E57QXjm0vRUSY3VvHI7bv5Osew5vCshJfjhe9V6LuooMPdInemNjNc/glbpxyag
 0irT6ri/UXAIlzcm5pu5uTUrXkpF0Y3w82J2doLfRXo2s+3yDec0TbeU/oSObTtBT9CO
 VZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WTl3bWLn4r0YyGnwQypBQT886kyZ2N/6Sr56JBYL25Q=;
 b=oKXtP2ple2Lk7ndhw3jHyWbzecaDWV4jK9dBQ8GXNBASxs09wNoyHKDMUPANbfGVAa
 xs61yTI4hccmJOHAMIMhL1u9LGDln3vgds30YRqrSpCrjxF/6YwMJB0gNflav12lgX8e
 2D4v+pbduozAc4hvt7H00accAvf2kdg70nnMaiwIwbNNHObcNHDxOBM9IvO2tCIDzE5R
 1WL0tgpHeu3DZptZclH1Iu2jLO1AHms6Lzh8P/RzcfNi/HAzBC66TGFyFMKMSeRq31So
 wBNvFk0FJZwzim/dHO4NYp1DzlSZ4XaD/LiPKlrKoUqY6eqrJVoEBaN6/5e4YveECXbV
 sEVQ==
X-Gm-Message-State: AOAM531B0qn9xB7oDyOCkbMajfBi6ae4aRmsBLglmjbCaVK0uvgcwzTH
 ezrt++6D2Yhp5qVod+XEIGVl
X-Google-Smtp-Source: ABdhPJyfs6oK3KhLtZbTIC5FGvny09hBcGNuHJ+zUQb+RTtudUlvziLkiIeIcZMLp4wmfDUOhoMg5w==
X-Received: by 2002:a05:622a:285:: with SMTP id
 z5mr632708qtw.315.1634752921211; 
 Wed, 20 Oct 2021 11:02:01 -0700 (PDT)
Received: from bruce.bluespec.com ([154.3.44.94])
 by smtp.gmail.com with ESMTPSA id t24sm1355057qkj.38.2021.10.20.11.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 11:02:00 -0700 (PDT)
Date: Wed, 20 Oct 2021 14:01:58 -0400
From: Darius Rad <darius@bluespec.com>
To: Anup Patel <anup@brainfault.org>
Cc: Guo Ren <guoren@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
Message-ID: <YXBZlrz2ythccKp0@bruce.bluespec.com>
Mail-Followup-To: Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
References: <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAJF2gTRfBxXnG57Y+9z0O+GfwgoB9POmb=HL=CMCpu=uwfYY3w@mail.gmail.com>
 <YXAu7OS82G1k28bZ@bruce.bluespec.com>
 <CAAhSdy1FS+rTO8JWfqKVMLPBUOzmy0d5D1s=psfxbm4s6QrBCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1FS+rTO8JWfqKVMLPBUOzmy0d5D1s=psfxbm4s6QrBCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_110202_943321_0ECF7197 
X-CRM114-Status: GOOD (  35.69  )
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

On Wed, Oct 20, 2021 at 09:48:36PM +0530, Anup Patel wrote:
> On Wed, Oct 20, 2021 at 8:29 PM Darius Rad <darius@bluespec.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 10:19:06PM +0800, Guo Ren wrote:
> > > On Wed, Oct 20, 2021 at 9:34 PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Tue, 19 Oct 2021 14:27:02 +0100,
> > > > Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > > >
> > > > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > > > breaks
> > > > > > > > the HW interrupt state or not.
> > > > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > > > continues irqs could come in.
> > > > > >
> > > > > > Really? This means that you cannot mask an interrupt while it is being
> > > > > > handled? How great...
> > > > > If the completion ID does not match an interrupt source that is
> > > > > currently enabled for the target, the completion is silently ignored.
> > > > > So, C9xx completion depends on enable-bit.
> > > >
> > > > Is that what the PLIC spec says? Or what your implementation does? I
> > > > can understand that one implementation would be broken, but if the
> > > > PLIC architecture itself is broken, that's far more concerning.
> > >
> > > Here is the description of Interrupt Completion in PLIC spec [1]:
> > >
> > > The PLIC signals it has completed executing an interrupt handler by
> > > writing the interrupt ID it received from the claim to the claim/complete
> > > register. The PLIC does not check whether the completion ID is the same
> > > as the last claim ID for that target. If the completion ID does not match
> > > an interrupt source that is currently enabled for the target, the
> > >                                       ^^ ^^^^^^^^^ ^^^^^^^
> > > completion is silently ignored.
> > >
> > > [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> > >
> > > Did we misunderstand the PLIC spec?
> > >
> >
> > That clause sounds to me like it is due to the SiFive implementation, which
> > the RISC-V PLIC specification is based on.  Since the PLIC spec is still a
> > draft I would expect it to change before release.
> 
> The SiFive PLIC has been adopted by various RISC-V platforms (including
> SiFive themselves). Almost all existing RISC-V boards have PLIC as the
> interrupt controller.
> 
> Considering the wide usage of PLIC across existing platforms, the RISC-V
> International has adopted it as an official RISC-V non-ISA spec. ...

You mean is in the process of adopting it, right?

> ... Of course,
> the RISC-V PLIC spec needs to follow the process for RISC-V non-ISA spec
> but changing the RISC-V PLIC spec now would mean all existing RISC-V
> platforms will become non-compliant.
> 

I would expect the review process to produce a proper specification, rather
than a verbatim copy of the SiFive datasheet, and clarify some ambgiuous
and implementation specific language.  Clarifying the specification does
not necessarily make all existing implementations non-compliant, as this
has been done numerous times with other RISC-V specifications.

> The RISC-V AIA spec is intended to replace the RISC-V PLIC spec as the
> new interrupt controller spec for future RISC-V platforms.
> 
> Regards,
> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
