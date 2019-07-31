Return-Path: <SRS0=UPnX=V4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432EAC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 07:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13711206A2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 07:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CcIycWal";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="A75tXU1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13711206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EguuovnH+8/7Qp1k8oK0mRrOc37daeH96kz4YVJu0xU=; b=CcIycWalHcUnky
	nDwDTM3EGsfJ45RaU2y8FMFiBKgk4lvSsH7eCQXxR8J4aP74JBcRvCGxY7fL8gjz4L58t5yUaScQP
	zS7BqGJoutHRiGBcItdlk/oZEMc302LzhRAjhHM2SYtxHwSJy7+HlcReywKR+5bTqE4zGV7lnZVj4
	MaSYaHo3csX2v5AUY95OD3zTnf0hQld33A8xTZIGD0BpR1CpK21IIcFxkTrY/eik20b47TYtQNRiU
	E6Idn9WHw7tvEz6fJjOfyiVTTrk4f3hN4svvwrDdi9cAVz+PIPLeKzO3MdXTHraWyuanXKUIEkEUI
	BFqTYp8NoQjtMmiUadag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsiy2-0000Zm-UZ; Wed, 31 Jul 2019 07:24:10 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsixz-0000Yh-Fv
 for linux-riscv@lists.infradead.org; Wed, 31 Jul 2019 07:24:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id p13so68416985wru.10
 for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2019 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2evDZYZurYJQbFSuSciK2TUoh0fXPuEDQACEld/aYOg=;
 b=A75tXU1odVHd2oqqipCCjQrkrK+gkBSiyV5g3p2eGuJLxhvTDMB7LZfPS25FJ6rxLw
 K1sYCoBGplsoVDFyP5m/AaR0wQqHdkVoqTeF5PUjJzkpUev3f1V8KC+teaciof3/4q9J
 eC2eHJreipGNgoQzyt5J7mNVbNZCfLP+l45JPeHfTCHIsJyOyOuys8lmOCwU1BqwwhpL
 1fZdUQY4APgMTlNqWvRv+FmO+1ElL6PQjEj3xbRidCfT3XQ43w+eP9KrFFE6NATFJmKF
 VhZCjgGmvz7G05AZ5fqiXLZyzHQrs45lgMF7sx7oy69fRDwtk9wFLndZeVUDw5JU6+CK
 bIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2evDZYZurYJQbFSuSciK2TUoh0fXPuEDQACEld/aYOg=;
 b=qwwSPPsCBhK0SMmla6GtswfN2+/h61VxBdC5y1+A5P6T6/XwjmnkNmum3HhrbO6nT6
 hoe7Wzf5+qF7QU4Ws3TZKWaNI/14wUDlRJUMQAOBFYX1rEi4m6JXdkW0SC+V6vXKzU89
 hg/argDSDHDTO/uUpNffsaG4ltz9GwmRsg6sZjUDXHLZBGVw91Bbf00A0oHcEW7uhl/x
 fC0XLeCfQVQA/smCzr3GCC2W8EiIXlqDLr7jaBM47JKahmwgQSPvXYmPm19ZKiFAInyR
 AolhyNN1a9WDK1ocd5hcOd4b+f2KFk77T13N/diUR8hVJr1FmLTir1A2uKK12zMqbXgN
 Xdkw==
X-Gm-Message-State: APjAAAWloDWpeslE+hqjC6ajYbc6kze664R9aCivbhVXYILE0LLcSJOw
 E95CUu8rc9onsUD8O7hYqUZbg+4XZfS/ImWyadc=
X-Google-Smtp-Source: APXvYqwuN6IBm0tVgx0DbJMkVlA5+z7xdtFRwEmr06AoaLDh/qCzFrlo7pERQF4wqinABZXnPNRDN2ZbRxDtrHkTMz4=
X-Received: by 2002:a5d:5448:: with SMTP id w8mr131770724wrv.180.1564557845356; 
 Wed, 31 Jul 2019 00:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-9-anup.patel@wdc.com>
 <05d41219-6c0c-8851-dab6-24f9c76aed57@redhat.com>
In-Reply-To: <05d41219-6c0c-8851-dab6-24f9c76aed57@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 31 Jul 2019 12:53:54 +0530
Message-ID: <CAAhSdy2ZiYYbg0oaNW_bnbdaHw+up9Ah0faoE5T+qr=-CTA3pw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/16] RISC-V: KVM: Handle MMIO exits for VCPU
To: Paolo Bonzini <pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_002407_535074_AFC30638 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2019 at 4:50 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 29/07/19 13:57, Anup Patel wrote:
> > +static ulong get_insn(struct kvm_vcpu *vcpu)
> > +{
> > +     ulong __sepc = vcpu->arch.guest_context.sepc;
> > +     ulong __hstatus, __sstatus, __vsstatus;
> > +#ifdef CONFIG_RISCV_ISA_C
> > +     ulong rvc_mask = 3, tmp;
> > +#endif
> > +     ulong flags, val;
> > +
> > +     local_irq_save(flags);
> > +
> > +     __vsstatus = csr_read(CSR_VSSTATUS);
> > +     __sstatus = csr_read(CSR_SSTATUS);
> > +     __hstatus = csr_read(CSR_HSTATUS);
> > +
> > +     csr_write(CSR_VSSTATUS, __vsstatus | SR_MXR);
> > +     csr_write(CSR_SSTATUS, vcpu->arch.guest_context.sstatus | SR_MXR);
> > +     csr_write(CSR_HSTATUS, vcpu->arch.guest_context.hstatus | HSTATUS_SPRV);
> > +
> > +#ifndef CONFIG_RISCV_ISA_C
> > +     asm ("\n"
> > +#ifdef CONFIG_64BIT
> > +             STR(LWU) " %[insn], (%[addr])\n"
> > +#else
> > +             STR(LW) " %[insn], (%[addr])\n"
> > +#endif
> > +             : [insn] "=&r" (val) : [addr] "r" (__sepc));
> > +#else
> > +     asm ("and %[tmp], %[addr], 2\n"
> > +             "bnez %[tmp], 1f\n"
> > +#ifdef CONFIG_64BIT
> > +             STR(LWU) " %[insn], (%[addr])\n"
> > +#else
> > +             STR(LW) " %[insn], (%[addr])\n"
> > +#endif
> > +             "and %[tmp], %[insn], %[rvc_mask]\n"
> > +             "beq %[tmp], %[rvc_mask], 2f\n"
> > +             "sll %[insn], %[insn], %[xlen_minus_16]\n"
> > +             "srl %[insn], %[insn], %[xlen_minus_16]\n"
> > +             "j 2f\n"
> > +             "1:\n"
> > +             "lhu %[insn], (%[addr])\n"
> > +             "and %[tmp], %[insn], %[rvc_mask]\n"
> > +             "bne %[tmp], %[rvc_mask], 2f\n"
> > +             "lhu %[tmp], 2(%[addr])\n"
> > +             "sll %[tmp], %[tmp], 16\n"
> > +             "add %[insn], %[insn], %[tmp]\n"
> > +             "2:"
> > +     : [vsstatus] "+&r" (__vsstatus), [insn] "=&r" (val),
> > +       [tmp] "=&r" (tmp)
> > +     : [addr] "r" (__sepc), [rvc_mask] "r" (rvc_mask),
> > +       [xlen_minus_16] "i" (__riscv_xlen - 16));
> > +#endif
> > +
> > +     csr_write(CSR_HSTATUS, __hstatus);
> > +     csr_write(CSR_SSTATUS, __sstatus);
> > +     csr_write(CSR_VSSTATUS, __vsstatus);
> > +
> > +     local_irq_restore(flags);
> > +
> > +     return val;
> > +}
> > +
>
> This also needs fixups for exceptions, because the guest can race
> against the host and modify its page tables concurrently with the
> vmexit.  (How effective this is, of course, depends on how the TLB is
> implemented in hardware, but you need to do the safe thing anyway).

For Guest with single VCPU, we won't see any issue but we might
get an exception for Guest with multiple VCPUs. We have added this
in our TODO list.

In this context, I have proposed to have separate CSR holding trapped
instruction value so that we don't need to use unpriv load/store for figuring
out trapped instruction.

Refer, https://github.com/riscv/riscv-isa-manual/issues/394

The above Github issue and missing time delta CSR will be last
two unaddressed Github issues from RISC-V spec perspective.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
