Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1745CCA482
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2dGTeglm/JIuaKdEjkkh3hPW7Ax3RF9Qm/qswH72Us=; b=g4FrNhSDjPrMvH
	N1hGrd6Bji/IXzBLE9SY+9Y4CyoLIyYRYo8raVKuUnQUUaZfs1njZd+2JuDzKQHPom6prU3LJMF3F
	MNCAQE5fANfbmC4oP/1unAp0qQQQeeS0GVejo/QYxPLrPgZL0aXlkiklGWndmK9YWwR4nTdrAum3Y
	IEBFrqCLsibRNexFJaS/rFE7Zeg2LIdqh8LVUAMBbeuI00IIMzl9kO6w+rTxghhkLMHsunCOfyXMw
	n2sMqiv7+OgX/UBtsWxDiS+8thUZBPMKvxYww+4RoEpQ4gJHxOUQq0E9qiGTNEEIl1DByMaAxNLKV
	0pudSJcTNH1hQBxwE5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCR33-009nhW-Ou; Fri, 15 Jul 2022 19:32:25 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCR31-009nda-HH
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 19:32:25 +0000
Received: by mail-lj1-x22c.google.com with SMTP id p6so6747223ljc.8
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=62LisgB4vdQ1c8/8kKz4C1ZR0gAFFmPHrTTuWUasxRc=;
        b=I357LQfZoWHINcZeQOB0qENb6Wm1+23xXnjo8XkSmZKLJEzFpspjbAypIfyusq4IOA
         wtLfUE0E++I5ViHa1WBkjLsa9pRMaElsmGv9UeCg0DKFIlwSeg+Z4ApouD1x3KxU6o8U
         2nhnwZS2bJkJtVL+/iBuaLnZ/t45wrQKFA07cDsGQFFEAE7qQBCKyf6CPrXSzMCu3vKt
         mNc12vbFt0QU05MaHiKUS3CHtj3JaHPZD+LQO3uxjyqezzuZkg98BA92P93zrogwpQkC
         UAnCSDmbQo/DHTuq932KrHsIAiCZcfsSifethSJe5MVFC2xJ+yn+05GRU7W9gSopiH2C
         S3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=62LisgB4vdQ1c8/8kKz4C1ZR0gAFFmPHrTTuWUasxRc=;
        b=N8IRS/nT73UkZMET0fD3uQ7cmLBWFM7s5FFyiQowJZyyecxfwX2vVZITvhL3TMrsNZ
         KtgoR2MgIFX14AVymoe+xDl7lZ3Fpz6n2Xh5VP8JbXJNZBUpGl6Uj1P2ijBQ22/vpqYD
         l9Iv7fKbaeUs+R2TgJZkZrXppqr3vAWtfTN5cs2gaE8QttZ06SGIyOvV+CS/M9RDpDhR
         rIJx8fQqvo7BIF26r/PgP4g7P124miaSQDJv7na8n4lo3KXxcarItU7V0IS08k7L2Px/
         ttflW1pcorXTNgR22PAdZfIbi5q7kEABwmom16Cv0HQVP5D/XBnF1gbuFhtuq8FECb4W
         uOeg==
X-Gm-Message-State: AJIora9aCV+ytuQO1pey37tWbLKEzvEyXFcvZBdAAh1h90MG7MFApn59
	VDcfbfpvRZUdLi6U5f2zEOA4T8R0CJU2NsXmg3F07A==
X-Google-Smtp-Source: AGRyM1vXl7wBE94PXzXIhMJnnOOI4FEuJNATilHuOmLU7pVA4YVkFPgDacg8SvhrLvy+nbmyEgKcJLDK1Vj/rnk63u8=
X-Received: by 2002:a2e:be22:0:b0:25d:6179:4439 with SMTP id
 z34-20020a2ebe22000000b0025d61794439mr7834488ljq.369.1657913538165; Fri, 15
 Jul 2022 12:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220618001618.1840806-1-seanjc@google.com> <19bba1a0-8fb7-2aae-a65a-1111e29b92d3@redhat.com>
 <YrHbml1HAfDtvMfn@google.com>
In-Reply-To: <YrHbml1HAfDtvMfn@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Fri, 15 Jul 2022 13:32:06 -0600
Message-ID: <CAMkAt6p8_OUQ5rv7DsSjPX6_EUQV6TUn0L3Q4uT1B23e32PkSQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: selftests: Consolidate ucall code
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm list <kvm@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <drjones@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_123223_590433_B6D4B216 
X-CRM114-Status: GOOD (  18.37  )
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

On Tue, Jun 21, 2022 at 8:55 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Jun 20, 2022, Paolo Bonzini wrote:
> > On 6/18/22 02:16, Sean Christopherson wrote:
> > > Consolidate the code for making and getting ucalls.  All architectures pass
> > > the ucall struct via memory, so filling and copying the struct is 100%
> > > generic.  The only per-arch code is sending and receiving the address of
> > > said struct.
> > >
> > > Tested on x86 and arm, compile tested on s390 and RISC-V.
> >
> > I'm not sure about doing this yet.  The SEV tests added multiple
> > implementations of the ucalls in one architecture.  I have rebased those
> > recently (not the SEV part) to get more familiar with the new kvm_vcpu API
> > for selftests, and was going to look at your old review next...
>
> I had forgotten about that code.  My idea of a per-VM list[*] would fit nicely on
> top, though maybe drop the last patch from this series.
>
> [*] https://lore.kernel.org/all/Yc4gcJdhxthBKUUd@google.com

I just sent an RFC of SEV selftesting using Sean's suggestion built on
the first 2 patches in this series. I think they work well with the
encrypted VMs ucalling.

https://lore.kernel.org/all/20220715192956.1873315-1-pgonda@google.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
