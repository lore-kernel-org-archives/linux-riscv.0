Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8487ECAAD3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 03:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCgRnUmo78rD3JlwxwPT49js2H6iYNHP7SapEP25xmQ=; b=wxuk5bmHj3paNb
	GrZt+MEaTxPzjAFbF5AnuN0SshHkUApEtVyTQBm33aGVEXSxr5rziD5qxXm7rcfXcvMOMBR4iwvIc
	Q5M3W1l1KnBFbfRYv6L8e+kYYtJniE+9VH7WB/QYGzWj8jURgINV1vp0Ahza+Gi5lUV2coefMfB8f
	OqNVmoqr/ki44pAgg0xs6RTeMWm+2qtaD3bDN4MQGmwXMXRx+zL/vomjwJasJSDnYKkzrp48iMn65
	r6OVM64oZVsAGYn2dKiiLrvG9mx0YzxpqLWKJZXudVS3vpCrKjp4T0JVfcuvDksxMQHNJ5BjDJREJ
	6NMt8fz9y5l8AlQRr8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSrg6-00Dict-6m; Tue, 30 Aug 2022 03:12:38 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSrg2-00Dibb-TD
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 03:12:36 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-33da3a391d8so242590457b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 20:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0Yo1WivuivvhRmPeZKwYl+1/Tm5Jx2AH00zX2jB5mOc=;
        b=TynbUNWtUYNJa5m9EplRfTPwmEY6uCrrvhvjSX0uX/EBzaal5Mnc77gp8fYK5Abw4s
         ATRMSzNXckcG0a9ZyvZm5/6CKzrQSJIQ+AC+UN6aCBXoazMeFQqfVc8+u9NJpH/LWKaQ
         DKT6zrOfp4cqbyktN+/4o/QWs4uSW2rZPPpE45I1b0UtOtnPOP53DtnJWXHPVQNOw5Kw
         +AppjWNtVCbDfyk5l0jF48f6hPODwHI/afKAwUq6D7bTnCdUf5peAnIWcmEVsvjxL+o6
         Ek1R3yl+3BFFIV5mEpbpdh7PVkQhIcA74t8Jz41NxxgubcZjKfTIbojnOo47YkjzQXmK
         O+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0Yo1WivuivvhRmPeZKwYl+1/Tm5Jx2AH00zX2jB5mOc=;
        b=zBIymR9/J9uMTo9GBzRUO8r/fGsN5hXdeZzEEzQyUzDwpltfciCC5ySkLmUvOFdkiu
         stlPY/j1jQgyOvkaUmHxIcY9jq3IZD4+vCWxM39pWKzX3El5syvT7nnoAv4Bo9NFOAk4
         y7eATQ4qCUA3lr7s1EdDelVM4gkaGhGIK00WMCvP7n9zKTLp3nuu2HMo8TCROEhiBhKu
         PQIDal+QOYfG07NWrNvaOKdhg9c1B8MnboapboNV1eljSV60dwuVJ97oSHCI2B4QTcI2
         PfXkDtNBuZ3r8puRrauiLQNyXA4PDhWXG0g1WSAPhV15Bp196ouse65aGpkLXdEzp+hB
         zanQ==
X-Gm-Message-State: ACgBeo0+HxqiXkIyc8o3g5/W3jrs+CktrLx/kqpiO6rlLEKNYwD0re4S
	WJxktj7K/5FkHbiOP3kKsVFpK26AMfdw6oZw4pku0A==
X-Google-Smtp-Source: AA6agR5B++glpRuf4xCgZTvJW+5BPMjOrGjXDcd+1m+GQn+5AJNWmVwJf3dqNw1INuB10QqVbkBRP5/QfAw467HPSBM=
X-Received: by 2002:a25:253:0:b0:696:4000:8844 with SMTP id
 80-20020a250253000000b0069640008844mr10778698ybc.619.1661829152701; Mon, 29
 Aug 2022 20:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
 <20220819140250.3892995-4-ajones@ventanamicro.com> <CAAhSdy0d8mjr5-5Um2DpLgnhPb3UnGggXvbu_=oqEHWYzMP1SQ@mail.gmail.com>
 <20220829094739.pn7iltmtimpwpshf@kamzik>
In-Reply-To: <20220829094739.pn7iltmtimpwpshf@kamzik>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Aug 2022 08:42:20 +0530
Message-ID: <CAAhSdy2OwNNq4PzFfHgVFYVGW3UQt3=geZGOGPojcA55c20rcA@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: KVM: Apply insn-def to hfence encodings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_201235_165495_AFB1664A 
X-CRM114-Status: GOOD (  22.51  )
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

On Mon, Aug 29, 2022 at 3:17 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Aug 29, 2022 at 02:07:59PM +0530, Anup Patel wrote:
> > On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > Introduce hfence instruction encodings and apply them to KVM's use.
> > > With the self-documenting nature of the instruction encoding macros,
> > > and a spec always within arm's reach, it's safe to remove the
> > > comments, so we do that too.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/insn-def.h |   8 ++
> > >  arch/riscv/kvm/tlb.c              | 117 ++++--------------------------
> > >  2 files changed, 21 insertions(+), 104 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > > index 4cd0208068dd..cd1c0d365f47 100644
> > > --- a/arch/riscv/include/asm/insn-def.h
> > > +++ b/arch/riscv/include/asm/insn-def.h
> > > @@ -79,4 +79,12 @@
> > >  #define RS1(v)         __REG(v)
> > >  #define RS2(v)         __REG(v)
> > >
> > > +#define OPCODE_SYSTEM  OPCODE(115)
> > > +
> > > +#define HFENCE_VVMA(vaddr, asid)       \
> > > +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17), RD(0), vaddr, asid)
> > > +
> > > +#define HFENCE_GVMA(gaddr, vmid)       \
> > > +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
> > > +
> > >  #endif /* __ASM_INSN_DEF_H */
> > > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > > index 1a76d0b1907d..f742a0d888e1 100644
> > > --- a/arch/riscv/kvm/tlb.c
> > > +++ b/arch/riscv/kvm/tlb.c
> > > @@ -12,22 +12,7 @@
> > >  #include <linux/kvm_host.h>
> > >  #include <asm/cacheflush.h>
> > >  #include <asm/csr.h>
> > > -
> > > -/*
> > > - * Instruction encoding of hfence.gvma is:
> > > - * HFENCE.GVMA rs1, rs2
> > > - * HFENCE.GVMA zero, rs2
> > > - * HFENCE.GVMA rs1
> > > - * HFENCE.GVMA
> > > - *
> > > - * rs1!=zero and rs2!=zero ==> HFENCE.GVMA rs1, rs2
> > > - * rs1==zero and rs2!=zero ==> HFENCE.GVMA zero, rs2
> > > - * rs1!=zero and rs2==zero ==> HFENCE.GVMA rs1
> > > - * rs1==zero and rs2==zero ==> HFENCE.GVMA
> > > - *
> > > - * Instruction encoding of HFENCE.GVMA is:
> > > - * 0110001 rs2(5) rs1(5) 000 00000 1110011
> > > - */
> > > +#include <asm/insn-def.h>
> > >
> > >  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> > >                                           gpa_t gpa, gpa_t gpsz,
> > > @@ -41,31 +26,14 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> > >         }
> > >
> > >         for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
> > > -               /*
> > > -                * rs1 = a0 (GPA >> 2)
> > > -                * rs2 = a1 (VMID)
> > > -                * HFENCE.GVMA a0, a1
> > > -                * 0110001 01011 01010 000 00000 1110011
> > > -                */
> > > -               asm volatile ("srli a0, %0, 2\n"
> > > -                             "add a1, %1, zero\n"
> > > -                             ".word 0x62b50073\n"
> > > -                             :: "r" (pos), "r" (vmid)
> > > -                             : "a0", "a1", "memory");
> > > +               asm volatile (HFENCE_GVMA("%0", "%1")
>
> Thank you for the review, Anup! I'd also like to get opinions on whether
> the caller should quote the register tokens or the call should be made as,
> e.g. HFENCE_GVMA(%0, %1), and then do the quoting inside the macro for
> C callers. I could go either way, but I'm starting to lean towards moving
> the quoting into the macros.

I am fine with the current approach but doing quoting inside macors will
certainly be more user friendly.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
