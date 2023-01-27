Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E13C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOE6CAwCn01Jw8D7kE9bdBOQ/Jd1B+Pb0DojIrX761I=; b=xscoLvYODv9N8n
	MXBfqLajqXtgSnNs2dRXPCj5miguG69VHtFaE26oDhaT1RLnF859Is4f3Dau8EmGzP+VG2THhI+F4
	bBQt8JEwbeluagbsU6j8OfYidGE5P6AHfeiS7A65oK8RwuKB63yj9+aiyJNMUARB0IqvsBVISVY3b
	OwIxw1oWld5xijZBFLTMBSo/42KhBDdWkpGJD9tJPsspjIFfZTUX1donMy/udhqWSCG05grm0r6cA
	LGxH7CfyYj6W5amt+TzP60MsOI5i17gbq7bZ2jQXLRE7w93FEfK6jSr8fhAkMzckaZpH++F+CIexh
	hwzCiuxH/p0k9zGXhKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOM6-00Ep11-C8; Fri, 27 Jan 2023 13:01:22 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNNv-00ELSy-Og
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:59:13 +0000
Received: by mail-vs1-xe36.google.com with SMTP id 3so5035937vsq.7
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 03:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgmw1h6HumCKIAmiKefvna0Hf/3PseJorCSc8z7I4JU=;
        b=NvTggrZpuQLvzRUb8nXqJDTuvOgJLRHwMC1+NXoMEkGXRbfvcsIgEbqXp2mFf0YAOj
         PVWU/CBCcuXZw/b9tsRyY9o8lgmQ7zWFhSk+LnsRKeDIwp9tnjODUL2lSP+Kn7M48vVv
         QFJZ4gvERv1GXu6PA8kNFNBKvMKkvyJ2S9V0k49/V5qPxQRYYu6/aIU5/c2g8oZKq7J1
         1+Vm6akp9D5LzZzju4RMrCUy07vanmzESnaMVnrk3ne7NtI5pLFmzL6eaFCbzLeU/V/M
         ZC9aUa2L281d4WdmNGSSG6xfT1N2zn3SQF81gHycm/XWgzLvChNS5TUIIC3P7/74co/p
         ioig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgmw1h6HumCKIAmiKefvna0Hf/3PseJorCSc8z7I4JU=;
        b=xXbixvCm51U2rH86vR3IpPNpPijUFoUk2uplfmzR+dsJxq3pcrTWAkvM5K1IVMskYS
         9rC4Um9Sxk2HH2ii6VQ2w1gGZJqOmqk9Usm8JJHYdCJ90mRqY12XOhXt8uzWwdux9KI4
         Ehk8ppahxqc8OK5hbqVDNW07/FPUIj//eERxsr3isNnUXXrkvrMxYfRjXIHkyrt+I924
         H5mVw6+aRdjC5yLZk3i8Y856GbJ1SVgPYYky1jm7MxUgo2659ioULaWtBFfZV0bKTNuR
         J2s/vd5jKegJuTAeKySRYZwc66LPbrm8GOkySC/sXZcHN4hNa/2c/mIMdSStxGHoB2Jb
         t4Bw==
X-Gm-Message-State: AFqh2kpNWIIwWQbwp6wfHk4MXMtJJCZSa5K55IML3LkKNt8xioqsuwk3
	b2yGsScQnP4Mk9CUoy6Enp+Fnb8MD8ylULnBcnDgyw==
X-Google-Smtp-Source: AMrXdXubHdqlaizKNTj9G102JeOsBYvmfoEFUWQ0mrfMUZ0Li5vk5eK42eJIcEWgqN/BB7YpwIsfbm0SDqDPvJhJlGE=
X-Received: by 2002:a05:6102:3134:b0:3d3:d816:c798 with SMTP id
 f20-20020a056102313400b003d3d816c798mr4957237vsh.59.1674820749156; Fri, 27
 Jan 2023 03:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-2-apatel@ventanamicro.com> <Y7YGp/7ufyRPhkwg@spud>
 <CAAhSdy2YKJfuxhBmsx9v-OMyxKQjys+J-z_ZqoPJF7q=YrE4Zw@mail.gmail.com> <Y8cIG6gKSlkTh5AF@spud>
In-Reply-To: <Y8cIG6gKSlkTh5AF@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 27 Jan 2023 17:28:57 +0530
Message-ID: <CAK9=C2VzJvpQLPedc+ruUnw8xDDDaC6_Vmj6qg1nXv+iqU-AfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] RISC-V: Add AIA related CSR defines
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_035911_974737_B5126F5F 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed, Jan 18, 2023 at 2:12 AM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup,
>
> I thought I had already replied here but clearly not, sorry!
>
> On Mon, Jan 09, 2023 at 10:39:08AM +0530, Anup Patel wrote:
> > On Thu, Jan 5, 2023 at 4:37 AM Conor Dooley <conor@kernel.org> wrote:
> > > On Tue, Jan 03, 2023 at 07:44:01PM +0530, Anup Patel wrote:
>
> > > > +/* AIA CSR bits */
> > > > +#define TOPI_IID_SHIFT               16
> > > > +#define TOPI_IID_MASK                0xfff
>
> While I think of it, it'd be worth noting that these are generic across
> all of topi, mtopi etc. Initially I thought that this mask was wrong as
> the topi section says:
>         bits 25:16 Interrupt identity (source number)
>         bits 7:0 Interrupt priority

These defines are for the AIA CSRs and not AIA APLIC IDC registers.

As per the latest frozen spec, the mtopi/stopi/vstopi has following bits:
    bits: 27:16 IID
    bits: 7:0 IPRIO

>
> > > > +#define TOPI_IPRIO_MASK              0xff
> > > > +#define TOPI_IPRIO_BITS              8
> > > > +
> > > > +#define TOPEI_ID_SHIFT               16
> > > > +#define TOPEI_ID_MASK                0x7ff
> > > > +#define TOPEI_PRIO_MASK              0x7ff
> > > > +
> > > > +#define ISELECT_IPRIO0               0x30
> > > > +#define ISELECT_IPRIO15              0x3f
> > > > +#define ISELECT_MASK         0x1ff
> > > > +
> > > > +#define HVICTL_VTI           0x40000000
> > > > +#define HVICTL_IID           0x0fff0000
> > > > +#define HVICTL_IID_SHIFT     16
> > > > +#define HVICTL_IPRIOM                0x00000100
> > > > +#define HVICTL_IPRIO         0x000000ff
> > >
> > > Why not name these as masks, like you did for the other masks?
> > > Also, the mask/shift defines appear inconsistent. TOPI_IID_MASK is
> > > intended to be used post-shift AFAICT, but HVICTL_IID_SHIFT is intended
> > > to be used *pre*-shift.
> > > Some consistency in naming and function would be great.
> >
> > The following convention is being followed in asm/csr.h for defining
> > MASK of any XYZ field in ABC CSR:
> > 1. ABC_XYZ : This name is used for MASK which is intended
> >    to be used before SHIFT
> > 2. ABC_XYZ_MASK: This name is used for MASK which is
> >    intended to be used after SHIFT
>
> Which makes sense in theory.
>
> > The existing defines for [M|S]STATUS, HSTATUS, SATP, and xENVCFG
> > follows the above convention. The only outlier is HGATPx_VMID_MASK
> > define which I will fix in my next KVM RISC-V series.
>
> Yup, it is liable to end up like that.
>
> > I don't see how any of the AIA CSR defines are violating the above
> > convention.
>
> What I was advocating for was picking one style and sticking to it.
> These copy-paste from docs things are tedious and error prone to review,
> and I don't think having multiple styles is helpful.

On the other hand, I think we should let developers choose a style
which is better suited for a particular register field instead enforcing
it here. The best we can do is follow a naming convention for defines.

>
> Tedious as it was, I did check all the numbers though, so in that
> respect:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

BTW, this patch is shared with KVM AIA CSR series so most likely
I will take this patch through that series.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
