Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F7EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3yqdnkthQPEWsOIznBiCbFkKs8XbS0yLiI0oaTK56+I=; b=Dr2JfVCSVESGMl8aPwMIRNXJZ7
	NxGYa+iKWNTE+PJ7+rW8mhs37FfrsS0i8Q1Lss7fAX62B8QEpkIRZ9EXaVgHC0Fi3wPhuNh+N1vyc
	i02xKgoeDsG7PUjqqT7vDy+LnfTf+8VSwUehUE2Yr9Al28Fww+yzED8wRBMbDjiElU6V0CjLjfyIL
	lVo9H9EUZP/e12Yc/mfNu72R/9+6/antT4QmeMCShTYpZ4j5WdxDIrT4sZI5ruDKxBkC86ETvTROR
	fVAKET28XUincyv1wsH5jgNTVuhkENWacDTK80nMUgwwuEsDdyrEnsahwqNQJetou9SrmEUT/m8Ho
	dctp9MiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZbmP-00GvZt-Gp; Wed, 30 Mar 2022 17:06:45 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZbmM-00GvYN-1p
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 17:06:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id x31so12770640pfh.9
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3evM47VwCLxGylErU6Y4QyCQG0eDAioc78G2Q2kokfs=;
 b=ua5Ihn++wFDtcmrMoiTjHvciexOPK/VB7jStNU4Yc9dbNVj1rXdZk5lEhQqecypr87
 ZS7yQMmCmFKlb85W4i2Fbo5WyphSQ2LOtu0IL9zrJhS3y/0g9KK8zYlyDgdiXuptEQR8
 W7i5mf4ODS03/Yw0vAFLOdqgTxFAR/Jbrt7HfjA3VxDqhxeCS75ckMamhARiD5RuMTQX
 SayO2kgAY0cpJ8OUkh/GdepRdcGhBM72+moQ0oDWE8PsjZPWtW23mt/IJxPjuofCSe0P
 0o6nsFMAWRLI/fB1grRnDE7QFlaJbZUtMou3Jesxm83mtP7rf4eNuTwEKaie9RKj0KOQ
 cqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3evM47VwCLxGylErU6Y4QyCQG0eDAioc78G2Q2kokfs=;
 b=5W9SPIDkQyarbBegO9wrBRVHrqjbuprXN4zgUWwDUH3HdYUymJbIw9/eZmZuR5MReA
 TaP/MoGJ0SHEyvwp0F9xNaWmU9HHgnhEj/g1o2673GQNt6TeswbgbxTGmnbRYv9bLnNo
 VRrYSUx2yOnlvtjjTmJ+wAqGRjj//LRGWcvodchqg1ZKN0hKTnnIPP4faDpf/o47o1JE
 gJVDLdydR92fWVbk8ieU8A7wbDRz56xCM4Khr6YBVm+1elTQJovqtKC05hoYv94ipd7A
 rL4G1kBBvSAEW+gjCVdaYsat7rGEa8xS907GBIe+rKh4SckaGIkZcYuLW8JsoumB0PJj
 uNpA==
X-Gm-Message-State: AOAM531NvSPdCrtNuCaH/U5nt/E2kzJM5WMXBZk4K62V/NHZaJU4FVWN
 69t5h695PuvyvSkPRc9IktY7193yJUlHug==
X-Google-Smtp-Source: ABdhPJwFfJISubTdwwzH3FXp76+VN+Bkt3eINLUNI22ec9V2QYR5Tjlq8gxHP/QMhwTbsOWOMoM1MA==
X-Received: by 2002:a65:4108:0:b0:36b:ffa6:9c86 with SMTP id
 w8-20020a654108000000b0036bffa69c86mr6921562pgp.203.1648659999527; 
 Wed, 30 Mar 2022 10:06:39 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 r10-20020a17090a454a00b001c96a912aa0sm7248107pjm.3.2022.03.30.10.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:06:38 -0700 (PDT)
Date: Wed, 30 Mar 2022 10:06:38 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 10:06:36 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <mhng-496f47ba-62ce-4d29-b75e-99410775b504@palmer-ri-x1c9>
CC: linux-riscv@lists.infradead.org, idan.horowitz@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: phantom@zju.edu.cn
Message-ID: <mhng-a6c1ce05-6858-48d5-b65b-c4adb8feed1a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_100642_121978_6D9033D7 
X-CRM114-Status: GOOD (  46.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 30 Mar 2022 09:11:18 PDT (-0700), Palmer Dabbelt wrote:
> [re-ordering the top post]
>
> +linux-riscv, as this may very well be a kernel bug
>
> On Wed, 30 Mar 2022 05:38:30 PDT (-0700), phantom@zju.edu.cn wrote:
>>> -----Original Messages-----
>>> From: "Idan Horowitz" <idan.horowitz@gmail.com>
>>> Sent Time: 2022-03-30 15:35:19 (Wednesday)
>>> To: "Atish Patra" <atishp@atishpatra.org>
>>> Cc: phantom@zju.edu.cn, "open list:RISC-V" <qemu-riscv@nongnu.org>, "Alistair Francis" <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
>>> Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
>>>
>>> On Wed, 30 Mar 2022 at 10:28, Atish Patra <atishp@atishpatra.org> wrote:
>>> >
>>> > I tested on v5.17 built from defconfig for rv64.
>>> >
>>> > Here is the kernel code executing sfence.vma
>>> > https://elixir.bootlin.com/linux/v5.17/source/arch/riscv/kernel/head.S#L122
>>> >
>>>
>>> I believe this is a kernel bug and not a QEMU one. They perform a
>>> write to the SATP with the same ASID as the one used before (0) and
>
> I seem to remember ASID 0 being a special one, with some global-ness,
> but I couldn't find that in a quick poke into the spec.  As below, I'm
> going to read through this a bit more...
>
> (Also, I haven't had any coffee yet)
>
>>> then expect it to be used, without performing an sfence.vma following
>>> it.
>>> This was exposed by my change, as previously the write to the satp was
>>> performed in the same TB block as the sfence.vma *before it*, which
>>> meant the TLB was not filled in between the previous sfence and the
>>> write to SATP following it.
>>> I was able to reproduce the issue with the Fedora Rawhide image in the
>>> wiki, and I was able to resolve it by artificially forcing a TLB flush
>>> following all writes to SATP.
>>> I think the correct course of action here is to:
>>> 1. Report the issue to the linux kernel mailing list and/or contribute
>>> a patch that adds said missing sfence.vma following the SATP write.
>>> (Atish: Are you able to test if adding an sfence.vma in your kernel
>>> build fixes the issue?)
>
> If it's a kernel bug we should fix it, but I'm not entirely convinced
> that's the case.  I can confirm that the following makes Linux boot
> again
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index ec07f991866a..83373c2bd7d0 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -121,6 +121,7 @@ relocate:
>         or a0, a0, a1
>         sfence.vma
>         csrw CSR_SATP, a0
> +       sfence.vma
>  .align 2
>  1:
>         /* Set trap vector to spin forever to help debug */
>
> It's been a while since I read through the rules here so I'm going to go
> read them again, but IIRC that shouldn't be necessary: that first
> sfence.vma should be sufficiently global to ensure all prior writes to
> the page tables are visible, regardless of what's in SATP.  That said, I
> remember there being a lot of subtly here in the spec wording so I'm
> going to go read the spec again.
>
>>> 2. Restore the patch
>
> Presumably you mean "revert" here?  That might be the right way to go,
> just to avoid breaking users (even if we fix the kernel bug, it'll take
> a while to get everyone to update).  That said, this smells like the
> sort of thing that's going to crop up at arbitrary times in dynamic
> systems so while a revert looks like it'd work around the boot issue we
> might be making more headaches for folks down the road.
>
>> I agree with you partly, my test case is actually from linux kernel, I notice
>> the strange sfence.vma before write satp during write our teaching kernel.
>> I think, the strange code is used to bypass the qemu bug that Idan patched.
>> Because in hardware, if the stap is empty, sfence.vma will do nothing.
>> And that's why nobody report it.
>
> IIUC the sfence.vma before the SATP write is very explicitly necessary:
> without that fence old mappings could be utilized directly after the
> SATP write, so we might not even be able to fetch the next instruction.
>
>> Before patch, qemu won't end a BB after sfence (but jump and CSR write do).
>> So, the kernel author reodered write stap and sfence.vma to make sfence.vma
>> place in the same BB with write satp, instead of the following write stvec.
>> (If don't reorder, sfence.vma will place in the same BB with write stvec,
>> that will crash kernel, see my origin analysis).
>>
>> However, in hardware, since tlb is empty, put the first sfence.vma before or
>> after write satp is not really matters.
>> In qemu, as Atish's log shown, we should do a imply invisible sfence.vma after
>> write stap to invalid qemu's translation cache.
>
> The ISA manual is quite explicit about SATP not enforcing these
> orderings.  If what I remember about ASID 0 is true then I do think we'd
> need one, though, to avoid the aliasing -- hopefully I'll make a bit
> more sense soon, though...

OK, I must have just been crazy -- there's nothing special about ASID=0.  
Looks to me like flushing the TLB on SATP writes is necessary, I just 
sent a patch with a more concrete description of why.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
