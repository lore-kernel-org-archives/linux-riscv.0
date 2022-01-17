Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 04:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaX2BoDc0FoDy8mt2BXP11/nFcNoHL5u8iU+YRQCCEA=; b=X3C9AR7zHCYxEt
	jWRJLZSfjZwI7ikUIiOKCQNGfPjBe7H85tAVax54GXc9fkDggnhmeEhf/xPn1FLPeMyvfQCnEsn9y
	/wenNP3xNqZZgsqzOIacgxu4s7kBpqUcnqTMe04Jr0aYJazuyEY34dkVomnE6DBARQR8SU6ywn90F
	D0URrNf8LzbmOZ60jVXJibpQHnW7fUCYs244UqGhItaEu1SZ+0SaG6J4plDtXVXlErEGhZOklUAOq
	tDRWNhjYhkYVdmh3973d5jftJY8sRw+uYkLrnHgw+zrRiR5dbS4zX318SZRZxNQT/3UJzOHy92kNm
	/VBNK9DrqpSH98QpklZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9JPM-00DO0h-Kr; Mon, 17 Jan 2022 04:14:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9JPJ-00DNzb-FU
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 04:14:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso21274318wma.4
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jan 2022 20:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uC9QK9tDrDJ8bYUEkaLZMfhd29it01RtK3UNjGu6F+0=;
 b=ciayjtT67GxQzlTSXm/xVUEcDMmOUTYKy1dGlkK0RlBk8DAWiHlAzcIKbvbDYe/5NB
 eEMT+ivFn9XuyEiceNYjrBlFxJsKpmT1yBe+LEQM6wCmvJgGaDLNnz2IQvJldm9p9LN8
 sjZMLhJvUa+jlS971DBqTx2JiV8MYE7VyRVbDQmkSCN2nZ/trP8TheKpE3SYVP8o7GRl
 mKBVTHRYjfCaidRz00H1J+UyTio36Vc/fOt5C3nAm3iwUg/j/x/e/GqRm8HQD+XzItiI
 gB934+DIUJ5Orh198FNLc5fF0SsjA5a2mJAfGzvcrEsMXUae/kwTZsnK3s4MYhi9duCa
 QxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uC9QK9tDrDJ8bYUEkaLZMfhd29it01RtK3UNjGu6F+0=;
 b=OgXp6fnyCUHCrXVtM7tNRKEVLr8VrXnF/5Epz0miM1A85BIEQyb+W57iQeRR6doBvf
 PNLrT0/9hVtRyqH2Qg6Unvz1y0NvbyNQKdlblmD/QOvoWADUF72cQdQgVk6MClf3GvFG
 OKBQ0JcU92TEA0JG8oBZNLjz/kItVlG2FW8MiCiuSUcxaqmCz1xUwfYmF2I5ugmHrPRi
 CR5PN4Ej07QZ86cZTjjcLj9EMhcbsxqcLw2SPOu3ZyJ0OHpVEeTbAIpqNZKTZMiWQKPV
 V6BxpAspD8M58ZGFoEzA4Fwa140XwVOWjMb4cRNTfB5lKI0itT0hoJxRk/B0nD56vEMQ
 5p5g==
X-Gm-Message-State: AOAM531FCABnbCMmY5OwzZ/mp/JFlJ1TwbmwyAF0Z4gGZULre4dp6imP
 TuHIhBdxd+0hEQhJS6Ji4kVsJvfilfBNz7Mz010o4A==
X-Google-Smtp-Source: ABdhPJx4fa4h5AQb2MyTrvdM9qwAZU72bUbMnBBf3yoS2z9C11Wfyu6Dxyi24T7agTe5QbcUb33joJwV51zePD0brdE=
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr19465099wmj.59.1642392851103; 
 Sun, 16 Jan 2022 20:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20220112114024.7be8aac6@canb.auug.org.au>
 <20220117085431.7bef9ebc@canb.auug.org.au>
In-Reply-To: <20220117085431.7bef9ebc@canb.auug.org.au>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Jan 2022 09:43:58 +0530
Message-ID: <CAAhSdy3gEW+SC1GCH0V4iVA9h1sxeVV-V=x4kG7w_9tcVTtamw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm tree with the risc-v tree
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Walmsley <paul@pwsan.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_201413_615392_0D706CAE 
X-CRM114-Status: GOOD (  24.27  )
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

Hi Palmer,

On Mon, Jan 17, 2022 at 3:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 12 Jan 2022 11:40:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the kvm tree got a conflict in:
> >
> >   arch/riscv/include/asm/sbi.h
> >
> > between commit:
> >
> >   b579dfe71a6a ("RISC-V: Use SBI SRST extension when available")
> >
> > from the risc-v tree and commit:
> >
> >   c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
> >
> > from the kvm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> >
> > diff --cc arch/riscv/include/asm/sbi.h
> > index 289621da4a2a,9c46dd3ff4a2..000000000000
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@@ -27,7 -27,14 +27,15 @@@ enum sbi_ext_id
> >       SBI_EXT_IPI = 0x735049,
> >       SBI_EXT_RFENCE = 0x52464E43,
> >       SBI_EXT_HSM = 0x48534D,
> >  +    SBI_EXT_SRST = 0x53525354,
> > +
> > +     /* Experimentals extensions must lie within this range */
> > +     SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > +     SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> > +
> > +     /* Vendor extensions must lie within this range */
> > +     SBI_EXT_VENDOR_START = 0x09000000,
> > +     SBI_EXT_VENDOR_END = 0x09FFFFFF,
> >   };
> >
> >   enum sbi_ext_base_fid {
>
> This is now a conflict between the risc-v tree and Linus' tree.

The commit c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
is already merged in Linus' tree.

Since you are yet to send PR for 5.17, we have two options:
1) Rebase your for-next branch upon latest Linus' tree master branch
2) Send "RISC-V: Use SBI SRST extension when available" in the
next batch of changes for 5.17 after 5.17-rc1

Let me know if you want me to rebase and send v8 patch of
"RISC-V: Use SBI SRST extension when available"

In future, we should coordinate and use a shared tag for such
conflicting changes.

Regards,
Anup



>
> --
> Cheers,
> Stephen Rothwell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
