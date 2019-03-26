Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C6FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 04:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C4420828
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 04:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WMRj7LMK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="A9VeeXFq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92C4420828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cfp6CCFqCILz3VH+RLtdy2gb0dJbHqGJEf4uCqgkFo=; b=WMRj7LMKRxmCbZ
	CNqVWtUg6Zpo0rhqBBvmcE0Mf8U64PMdsdZDLh6x2eqpEI3xw9Bd8Aai8T4U+GsGi7P4f2tSwehRP
	9qPwUoQx+bTDQa2j+HPAMsIjr7yEzpe2O224PNlg2CvhOQ1StS3GkjxJ0BeYkKmOcwncgd7vBPpvN
	IgcER4xre+jwPbuylYzf/UH3hU/8Q3NCbpTlZAk878xfXZ5fdahAYPq6WWkRvAhUTLTYZzxSO4YUY
	dFap4GpfS49Ipc7Zv5xbUdBPtRg6fzxt5rB9a5wiBxwqn1ytEGmQIV/Zg/CXg3PH+6xBxFoHMoi6F
	WVBp2SE9ysn4HKU+QCAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8dHZ-0000al-V9; Tue, 26 Mar 2019 04:01:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8dHW-0000Zu-7w
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 04:01:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id s15so12574211wra.12
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oFufxt99trQk1HrJ4DBQy+Tki5RtsOLE22J4daML9P4=;
 b=A9VeeXFqjsG81fFSUA9hMLPRtVGYZKYYzkZLKEU4RLZ3dHQhZYtk/mzXr0J/fMWwRd
 /X8MEpkRsr0FRmmfEjfmKMUBv+9d0zPL3TS4VbcR2Un6ePOYO75E8OOv1YqiyeABE0vP
 eZCSyI1TCvlvAupaiL03MdO/Z/H+4RugYJJLji2pN+CrGcp+XkRe079drkx054hpjTxf
 umvaGW3zh+S2PbfAXQ5rt1tQ/JmN7sIKtY9W+d+Q9iLkktCWEkxRzPeQuEla+/U7h36y
 uGRmDB6LHDCwhojFwJ7RKxFaZqilQdq7yG8nxgzcmaTVGVIOJLUHL3Z4+go3PXTPYDoq
 sYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oFufxt99trQk1HrJ4DBQy+Tki5RtsOLE22J4daML9P4=;
 b=sd/T4VLbhwG+lpYsmmOLOHbIa66awaF03J52JzhKYKsZEehCQqrY9laz7Y6ffovi+q
 SXgR8+zePSQhT5KlAy3bi+pze5t7EDijhsOa915jzWag1j920CirMIKLnL7ZTxnzc0kr
 2GYwb18E4DbLttK557ytVkjplrKQ7rGyl95Ch77gQtBsWH3JlANUPoZYxu2QBznTTuWG
 Jzv0NKZTEyI0yf5nWwsK0YzrJ0ZwCx8OUlOHnPXt7plrfRYZQqohz00k++14fb0l9Vob
 g7BZ9c5V9rbdA4GDuyXac0F7MZ3oVaVl7rtpXZhLq43tfXbjk8AF5RLliZiYTaV9H8ry
 d5Lg==
X-Gm-Message-State: APjAAAUbH5/yHUN2TVgCdolN2+XUx0hmuuteDsGI2+uSGiAiu5ZBZZF3
 IPGg1nPxs0l+MxcKJHjW976cJ4w6Hw2DWU8dEjQugskeI1Y=
X-Google-Smtp-Source: APXvYqymD/u0BO41fMRa6kBbI8PhOpFAubq3PkqMFeDFkLGxTdC2E1fTjoZ9HIDxgNLQQ0tQb2g6B1MVCbbodzSS1eM=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr4272556wrx.187.1553572897984; 
 Mon, 25 Mar 2019 21:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2-CX729tVuuZzArswpFEC_OeRXhwXtCaiNe53AuzqdTw@mail.gmail.com>
 <mhng-8e00a3e3-5a69-4828-b7bb-2bf000199b48@palmer-si-x1c4>
In-Reply-To: <mhng-8e00a3e3-5a69-4828-b7bb-2bf000199b48@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Mar 2019 09:31:26 +0530
Message-ID: <CAAhSdy2POcL2Y8VzULCHRa6cLKZ82GkEgXCgx_SoNZ1vMPvQjQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_210146_285414_1522069D 
X-CRM114-Status: GOOD (  22.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 26, 2019 at 7:52 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 25 Mar 2019 00:01:45 PDT (-0700), anup@brainfault.org wrote:
> > On Mon, Mar 25, 2019 at 12:18 PM Christoph Hellwig <hch@infradead.org> wrote:
> >>
> >> On Mon, Mar 25, 2019 at 01:25:50PM +0800, Alan Kao wrote:
> >> > Hi Anup,
> >> >
> >> > Sorry for being late to the party.  I think one more thing should
> >> > move together with setup_vm():
> >>
> >> Ah, I wonded about that yesterday but wasn't sure.  Maybe notrace
> >> is a little cleaner?  Either way we should probably document both
> >> the mcmodel and notrace assumptions in source comments for the next
> >> person touching this code.
> >
> > The setup_vm() should be allowed to call other functions within mm/init.c
> > so let's go with file-level notrace (just like how it was done) for
> > kernel/setup.c
> >
> > I certainly add comments for setup_vm() based on all our findings so far.
>
> Sorry for being slow here, but this is the right approach: setup_vm is called
> before relocate, which means the page tables won't be set up correctly for
> absolute addressing.  We instead build setup_vm with medany, which causes all
> addressing to be PC-relative.  This is all a bit of a hack, but it's the only
> way we have to do this right now.
>
> You should be able to add a preprocessor #error to check the code model with
> something like this
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b379a75ac6a6..d6fde6af8d75 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -172,6 +172,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>         }
>  }
>
> +#ifndef __riscv_cmodel_medany
> +#error "setup_vm() is called from head.S before relocate and must not make any absolute references."
> +#endif
>  asmlinkage void __init setup_vm(void)
>  {
>         extern char _start;
>
> Marking this notrace is the right thing to do, as it can't call into any
> functions that aren't medany (there's probably other issues as well, since this
> is so early).

Thanks for the suggestion, I will add "#error" in v4 of this patch.

>
> Sorry I missed this the first time around, I wasn't paying enough attention.
>
> Can someone add instructions for 32-bit boots to the QEMU wiki?  It sounds like
> it's time to add that to the testing list...

To start with, I have send a patch for adding rv32_defconfig which is right now
"defconfig" plus "CONFIG_ARCH_RV32I=y"

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
