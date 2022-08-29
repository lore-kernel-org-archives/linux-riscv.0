Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD62FECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuIAipr9ECQ0uSVXLtNsZkjdWjKq7PLKqtLq/rpudxU=; b=OVuVS84fMawhUf
	8sdfc7rRiKMwAS2lxeFVyo9CxX5MPTKj9faXoi44LiOp2qxqy/ZnNw7+OYKp6uB8sqpO6jrfPDoKi
	sY1G+WSrGam+4opR4kE2BvCH1cyXQBkeeC/V9YqbOjADp5jvlknZPZ4j/le4801owToBpBOa4qhfd
	d3s2eKgRY11QAAZVRDXEPmgnnHnxVgIjeW/4BXgez6BagxvApYC+QK6V5nX/yMiORnU1bO9Jm+ZMT
	TuRcHvEYsGG7QGGwwT3JveBlFU5kOTMEijF/LcyamyQYv9k5PS1slQW15jl1J+APEr4CJYn2isTNe
	jQ3FVlMGInGFXeC5NMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbN1-006vBn-Nw; Mon, 29 Aug 2022 09:47:51 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbMt-006v4B-5C
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 09:47:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id w19so14563631ejc.7
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=QaOr7kjQluQGEI4QV2hD0EQiXL95H1mMxF4HdlYCuAE=;
        b=f7o8fPMW6B7WvFxln1Qe3eGbeGqhFkg2XYREZfxcyBy1e9mUqrKPwYvihO/8xI+4kL
         KyoXDYhRnW/IsW7Dr1yRSkL9+Ysg5pZ1VI3EluWXHKPUelhPPQpMuO5Oxojm7UIw++hN
         KR9/gaNSSkIFbah6BJ7AaMZlvrjCBqZi3cYbwKWi1svT4eoV7no85EROHVo2AVGNINdA
         6D3jXQaQFNyKbTntuzD5iSHAedL8KoYJ6uojNd/E42poYjqITLFFi1gX3IYCh8RtMwHa
         Qj9NVVj71RUaVve/TAsC6zAg/lA/AvxHRH2IIWC2w2htHtz+1drcRU6LbvcpMjae6gfH
         4KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=QaOr7kjQluQGEI4QV2hD0EQiXL95H1mMxF4HdlYCuAE=;
        b=J3MeSMt0k5UCzKW+5SLjKlni39ZF0xoxcBfonlYbjo0VoVZRfx9MsIsxoXlprb96wh
         tqNDAl6z0e/hzBFqegyv4OIUyG88Iv+/gbeiHK0P0TZr6AJTl0WAB8d8LsE7B277UwrB
         OtnlO0AQG+xNZiXVXDsAL3rykdc3olrESVwQOe4Px3mmL5X3Q696yRdUi5n7P3+nX7z6
         T8Jisi0S1BesRJFME95OuWktTMtwSGpYkQWQreZ4VVUwGGdxuTROXGF/QpUm3+leHmf1
         dSK3hZ6c5OjcN0IfkIZumDCQqbga60Xh8aC10bjZSrNfQBR2xlKiW/SMPvfN2riTrb4y
         m5pQ==
X-Gm-Message-State: ACgBeo3+arcbMjskXwJqRVXOPD7TL4jBE/66tvpoVRSHqY4gUrTSg2sL
	wwkjYY1BJ7NmgHlK0/4nwfaEWQ==
X-Google-Smtp-Source: AA6agR7OYg5w837dFUNhKmYdquqWXSlFv2lZXe5CSTfsBz1vezlDTWNN194U8OpIYE9XoypLOD8OSg==
X-Received: by 2002:a17:906:ef8b:b0:730:d348:61b9 with SMTP id ze11-20020a170906ef8b00b00730d34861b9mr12883076ejb.350.1661766460573;
        Mon, 29 Aug 2022 02:47:40 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id r4-20020a50c004000000b00445f2dc2901sm5486165edb.21.2022.08.29.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:47:40 -0700 (PDT)
Date: Mon, 29 Aug 2022 11:47:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mchitale@ventanamicro.com, heiko@sntech.de
Subject: Re: [PATCH 3/4] riscv: KVM: Apply insn-def to hfence encodings
Message-ID: <20220829094739.pn7iltmtimpwpshf@kamzik>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
 <20220819140250.3892995-4-ajones@ventanamicro.com>
 <CAAhSdy0d8mjr5-5Um2DpLgnhPb3UnGggXvbu_=oqEHWYzMP1SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0d8mjr5-5Um2DpLgnhPb3UnGggXvbu_=oqEHWYzMP1SQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_024743_285489_10B2BA29 
X-CRM114-Status: GOOD (  20.62  )
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

On Mon, Aug 29, 2022 at 02:07:59PM +0530, Anup Patel wrote:
> On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > Introduce hfence instruction encodings and apply them to KVM's use.
> > With the self-documenting nature of the instruction encoding macros,
> > and a spec always within arm's reach, it's safe to remove the
> > comments, so we do that too.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/insn-def.h |   8 ++
> >  arch/riscv/kvm/tlb.c              | 117 ++++--------------------------
> >  2 files changed, 21 insertions(+), 104 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index 4cd0208068dd..cd1c0d365f47 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -79,4 +79,12 @@
> >  #define RS1(v)         __REG(v)
> >  #define RS2(v)         __REG(v)
> >
> > +#define OPCODE_SYSTEM  OPCODE(115)
> > +
> > +#define HFENCE_VVMA(vaddr, asid)       \
> > +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17), RD(0), vaddr, asid)
> > +
> > +#define HFENCE_GVMA(gaddr, vmid)       \
> > +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
> > +
> >  #endif /* __ASM_INSN_DEF_H */
> > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > index 1a76d0b1907d..f742a0d888e1 100644
> > --- a/arch/riscv/kvm/tlb.c
> > +++ b/arch/riscv/kvm/tlb.c
> > @@ -12,22 +12,7 @@
> >  #include <linux/kvm_host.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/csr.h>
> > -
> > -/*
> > - * Instruction encoding of hfence.gvma is:
> > - * HFENCE.GVMA rs1, rs2
> > - * HFENCE.GVMA zero, rs2
> > - * HFENCE.GVMA rs1
> > - * HFENCE.GVMA
> > - *
> > - * rs1!=zero and rs2!=zero ==> HFENCE.GVMA rs1, rs2
> > - * rs1==zero and rs2!=zero ==> HFENCE.GVMA zero, rs2
> > - * rs1!=zero and rs2==zero ==> HFENCE.GVMA rs1
> > - * rs1==zero and rs2==zero ==> HFENCE.GVMA
> > - *
> > - * Instruction encoding of HFENCE.GVMA is:
> > - * 0110001 rs2(5) rs1(5) 000 00000 1110011
> > - */
> > +#include <asm/insn-def.h>
> >
> >  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> >                                           gpa_t gpa, gpa_t gpsz,
> > @@ -41,31 +26,14 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> >         }
> >
> >         for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
> > -               /*
> > -                * rs1 = a0 (GPA >> 2)
> > -                * rs2 = a1 (VMID)
> > -                * HFENCE.GVMA a0, a1
> > -                * 0110001 01011 01010 000 00000 1110011
> > -                */
> > -               asm volatile ("srli a0, %0, 2\n"
> > -                             "add a1, %1, zero\n"
> > -                             ".word 0x62b50073\n"
> > -                             :: "r" (pos), "r" (vmid)
> > -                             : "a0", "a1", "memory");
> > +               asm volatile (HFENCE_GVMA("%0", "%1")

Thank you for the review, Anup! I'd also like to get opinions on whether
the caller should quote the register tokens or the call should be made as,
e.g. HFENCE_GVMA(%0, %1), and then do the quoting inside the macro for
C callers. I could go either way, but I'm starting to lean towards moving
the quoting into the macros.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
