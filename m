Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86F1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 10:24:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B902821773
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 10:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bOV9nNLo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="eZpNA8cd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B902821773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WcgQ68XU46dqTp54Ns/9iwARyBawvd7ktakNvqSvX8=; b=bOV9nNLoXKndIM
	IUyFCGmrrfvX1SiMILLj1dU2dz2c2d/avoy0WLNJJrIaFMi6m5UmnW1WN2OchG97YceyW6wLwKLHC
	QdNEGttoJUDcEzOqu480nEMOsvwaWusIug81uCxZkhw5bpxYUwiHhEdbqUrF/qwwKds0X9s6PN3XV
	HOWyk6w/kUn/22uqklNVuQuc7prLtUWF9uCEp2h3v3zm1gB43rVQ+hm1vyeBCQWdwNr5tIMTt1td/
	iUJQBM9p1xu+A2lv79Fn3FkGRnCVoyeM/t4F0vX+b+iDu/I1qGcu/oR5VojAhCj9fTD+nmJcsaDCB
	jquFr1SZMX0OzTjFXdmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9SDC-0000yg-Oh; Thu, 28 Mar 2019 10:24:42 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9SD6-0000xk-JE
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 10:24:40 +0000
Received: by mail-wr1-x444.google.com with SMTP id g3so18667752wrx.9
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWlYvfOObBZY1CN9rzeBvDWTjXjv0i6VqvWKQU37Yy0=;
 b=eZpNA8cdzCGf2AtLKROLLZ9cxAOCS8zx0Du45GYbvDAGvdkxzoe3RHV5gP24rQxFsG
 WA/MjlnTtKuRUjSzR1UP3T+5Nr2fkrn3WYuQnwci13oPt5QTXmR141L6s+zYWQNsy17L
 NSqqQ5MmtJ4samK4xvaOL+g30/XZTZZ9zkpNIPGvYmmAOt0I2FO0LXw4aqWeIC6D+PC+
 1dCJ6b29nuO9uK3baHJY3T37DRhhv0yR3+WdH/itCfT3EOaPNppzERE9438dFEMdtw1R
 1X1JVle40QZ5AHLfy6GB7WIO/ac3wSKxFENi2D3obi3TN4bBNcA0LD/Zldb+3sfjS+md
 pr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWlYvfOObBZY1CN9rzeBvDWTjXjv0i6VqvWKQU37Yy0=;
 b=F/XzQmL8ARWjp7LmQOSjT+sh475bEge/Y/TXHOuDIfG2wp7mFtAc/aiFxmGMiCgIV2
 L8QKvmq/y+Wibyc4Ld09/xYg0V5g7DSM2ZKiyEYBYzN1eDceO/Gq+hCEQMtkhT293X2a
 UeU7JAul6rqwEREW2ujZ+d3BCSAmfTiXk3OUAlVD95fHW4q6JBt0cTqrT1wlmegb5Aqn
 fmeTBtF4zayHVPK7mYoNXzKFDThDCra0Q9VVBzmgPHqKl14TXDIfQcqld1RHHp6CEdzG
 Ma7WG9SO4e3pdqAYUjgaNR5y/+nJspMrgLLwbJsIjasXXG+8fvIZEysSdzxlwXjxtiM7
 ++xQ==
X-Gm-Message-State: APjAAAUTBZsv/x7LDjIf9tUxAQN59VLIkTtiEjDIZvauXbphIUqQGoJ7
 8FNzi6k+CgbDUJ3lJC85AKWojYJFr13GudwYSuNfRA==
X-Google-Smtp-Source: APXvYqwIUCm7BwmxyVm4IQN//+s5P94fUfjd32llHQkj6aF1tVknwU7UIi2AfK1ElwLziO+dcFq0lMmPhgbCQTuiars=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr13435721wrx.187.1553768672809; 
 Thu, 28 Mar 2019 03:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
 <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
 <20190327075441.GA29894@infradead.org> <20190328075526.GC14864@rapoport-lnx>
 <CAAhSdy3URWHVY_GPNb2yRBuctRELRtTTWPM2OpwUVSRFAyXyiA@mail.gmail.com>
In-Reply-To: <CAAhSdy3URWHVY_GPNb2yRBuctRELRtTTWPM2OpwUVSRFAyXyiA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 15:54:21 +0530
Message-ID: <CAAhSdy0iXct2L9g2+SGQMo-eBw3-LOveLiKFWh6Y8u42FsuAFw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_032436_642301_1720324D 
X-CRM114-Status: GOOD (  20.42  )
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
Cc: me@anthonycoulter.name, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 3:22 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Mar 28, 2019 at 1:25 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Wed, Mar 27, 2019 at 12:54:41AM -0700, Christoph Hellwig wrote:
> > > On Mon, Mar 25, 2019 at 09:46:59PM +0530, Anup Patel wrote:
> > > > > Why do you even care about kernel mappings for non-existant ram.
> > > >
> > > > We care because there will always be some buggy kernel driver/code going
> > > > out-of-bound and accessing non-existent RAM. If we by default map all
> > > > possible kernel virtual address then behaviour of buggy accesses will be
> > > > unpredictable.
> > > >
> > > > Further, I think we should also make .text and .rodata sections of kernel
> > > > as read-only. This will protect kernel code and rodata.
> > >
> > > All of that is useful at the final_setup_vm() time - but none of it
> > > matters during early setup_vm where life is complicated.
> > >
> > > Mike suggested on the previous iteration that you only do smaller
> > > mappings when setting up the final mapping to avoid the ops churn,
> > > and I fully agree with him.
> > >
> > > So I would suggest we avoid complicated the fiddly early boot changes
> > > that just add complxity, and you instead redirect your efforts to
> > > say implemented proper ro and non-executable sections using 4k mappings
> > > in the final VM setup only.  That should actuall lead to less code
> > > and complexity, and provide more benefits.
> >
> > It might be worth keeping trampoline_pg_dir if we are to split setup_vm().
> > Then setup_vm() will only initialize the trampoline_pg_dir and
> > final_setup_vm() will setup the swapper_pg_dir and switch to it.
> > Otherwise final_setup_vm() would need to update live mappings which might
> > be fragile.
> >
>
> We finally know the purpose trampoline_pg_dir page table.
>
> The trampoline_pg_dir is suppose to contain only one 2M/4M mapping
> to handle case where PAGE_OFFSET < load_address.
>
> For 64bit systems, the PAGE_OFFSET is very high value typically
> 0xFFFFxxxxxxxxxxxx compared to RAM start 0x80000000. It is very
> unlikely that we will have enormous RAM ending somewhere
> 0xFFFFxxxxxxxxxxxx.
>
> For 32bit systems, it is quite possible that bootloader loads kernel at
> load_address > 0x80000000. Let say PAGE_OFFSET = 0xC0000000
> and load_address = 0xC0100000. Now the instruction which enables
> MMU will be 0xC0100xxx and after enabling it will try to fetch next
> instruction 0xC0100xxx + 4 but 0xC0100000 maps to 0xC0200000
> as load_address > PAGE_OFFSET hence we will see wrong instruction
> after enabling MMU.
>
> (Note: Above explanation was provided by Anthony)
>
> I guess we will have to keep both trampoline_pg_dir and swapper_pg_dir
> init in setup_vm() because trampoline_pg_dir will only contain just
> one 2M/4M mapping.
>
> Regards,
> Anup

I think we should go ahead with your suggestion but with additional
constraint as follows:

1. The setup_vm() will map only vmlinux_start to vmlinux_end and
FDT for early mapping in trampoline_pg_dir
2. The setup_vm() will hit BUG_ON() if load_address is between
vmlinux_start and vmlinux_end.
3. The setup_vm_final() will create swapper_pg_dir from scratch
to avoid updating live mappings

The point2 above essentially means that on 32bit/64bit systems
the bootloader cannot load kernel in physical address range
PAGE_OFFSET to PAGE_OFFSET + (vmlinux_size) even if
it is a valid RAM physical address range.

Suggestions??

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
