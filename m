Return-Path: <SRS0=kixk=WB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61948C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 11:56:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C75720657
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2019 11:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rsCyS2wR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="j2cxRWIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C75720657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnY6YrbyjzTOT+i/FpZLosynjNC933jj3rSrgmqQ9fI=; b=rsCyS2wRdxvK3o
	oEJ66nqFBrQlKj2JtsjTf3IsWUzrJy9FzDdq3indfYawOVn3A41KdgcuwxTLJKHrZV8JwBLhTG/Rl
	LBt5pKTynAeUcJgmARLOIPt+nzmNamfvQKUEobtZTKHaNP/dCw77O+JWr6g+hI1gvB4jwJSrLNh/8
	bkIlOXCDlZRYd1zirHAUfr2NZUXHyW22X93TZ+b2nHYVU+5uiK/Jvf/uTdUw1n03rzgaqxpuO9ajp
	fwdM2eYdmMOPBMgvCuLsxJcCSh0w/FRom/YSb78xmMQ03ycT/fgkAlrVq6BT7xP122HpsWkMWtU+K
	0hoegnr45TnT1BWTxgSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubbS-0008CF-8H; Mon, 05 Aug 2019 11:56:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubbP-0008BU-0l
 for linux-riscv@lists.infradead.org; Mon, 05 Aug 2019 11:56:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id s15so51364739wmj.3
 for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2019 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vhTBJZEcsjvTkvOpSV7JcEtFKAA9Exg0pMP9uE8HBUs=;
 b=j2cxRWIzJWwkZSXOsd7iqkdySk76thOrHaNvBOCn2itmKfoj5zmnKFKd5PZ83DQUpd
 VWN6CriBZdpZ6mayWW41Dg0KK6Np+Wv8SZf0ZyjwXE42dDXcHFU2P964QIOrXYcB9RrJ
 th68YmT5hWQKspO1CFMPKRhlZ68MHu1nfflC4c316MaJM41iyU3eG+5jEOH6IOSi6FDc
 JOQPdmSu01w6czCcx8rCHJLaXZ4Ig5ko6Qtd28QVjqmvlANS2GK+V/gisiBAt9NChtg0
 e42XgEfznhyur69CRHk2XN/GF62OC+Xd06npgkw7ZqGvaqWVi0uGxeeRuDsHgwc+JF7P
 /5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vhTBJZEcsjvTkvOpSV7JcEtFKAA9Exg0pMP9uE8HBUs=;
 b=Nq/x+MG68zZuC604eihuQzdJ9NLn8yjysFwFVwznmQJJiiKa1rwxWmTycZbE0PajR7
 WoEvsjuwXi70+dpALzXFzBA7E8ALMW26619fw0O3clBgQwpRskGfBn+d9DK7JYun73D+
 +WHN55Q91A6/QzEQiEKNRbpWV/1JS8Zqe7xEvyLCgLTGOAhfQcxG0QZ0v8YIt2hu6Hp5
 ZbLCL543VFs2ZXXDDXsfnzQquKk23wDYtkrqkkWCkeiiA/5Su3XkJnRAF6XlGatdhoP0
 DEifpsxGpeiTEdXDB9DRGurJdsQpboa8uXA9FR21I9VidSJa52EcDfgBzi9kIwmIhGc2
 CRng==
X-Gm-Message-State: APjAAAWq+OZmN7qTYvWNCVU4BxjJnbKNp1ctsfsm+5jiWS8w4o91euGB
 Tuf3UYKeSnA1QOdytuLf4h21U1f0EEMJ+1aOzxA=
X-Google-Smtp-Source: APXvYqyF2repcCJOaZYS4p2lUuk5LTjS5XFEImFO3Oxk67YaRU8tEsimiGNdEpidJLWjEePzjO3jrxahGnlJVrib7EY=
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr17243611wma.171.1565006193144; 
 Mon, 05 Aug 2019 04:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190802074620.115029-1-anup.patel@wdc.com>
 <20190802074620.115029-8-anup.patel@wdc.com>
 <edbed85f-f7ad-a240-1bef-75729b527a69@de.ibm.com>
In-Reply-To: <edbed85f-f7ad-a240-1bef-75729b527a69@de.ibm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Aug 2019 17:26:21 +0530
Message-ID: <CAAhSdy2PDSpTy1JEEC2LCB4ESvZHBbkVEZ2wqz-D2b7SKD5VSg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/19] RISC-V: KVM: Implement
 KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
To: Christian Borntraeger <borntraeger@de.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_045635_083813_E9D2F1DE 
X-CRM114-Status: GOOD (  14.77  )
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
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 5:08 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
>
>
> On 02.08.19 09:47, Anup Patel wrote:
> > For KVM RISC-V, we use KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls to access
> > VCPU config and registers from user-space.
> >
> > We have three types of VCPU registers:
> > 1. CONFIG - these are VCPU config and capabilities
> > 2. CORE   - these are VCPU general purpose registers
> > 3. CSR    - these are VCPU control and status registers
> >
> > The CONFIG registers available to user-space are ISA and TIMEBASE. Out
> > of these, TIMEBASE is a read-only register which inform user-space about
> > VCPU timer base frequency. The ISA register is a read and write register
> > where user-space can only write the desired VCPU ISA capabilities before
> > running the VCPU.
> >
> > The CORE registers available to user-space are PC, RA, SP, GP, TP, A0-A7,
> > T0-T6, S0-S11 and MODE. Most of these are RISC-V general registers except
> > PC and MODE. The PC register represents program counter whereas the MODE
> > register represent VCPU privilege mode (i.e. S/U-mode).
> >
> > The CSRs available to user-space are SSTATUS, SIE, STVEC, SSCRATCH, SEPC,
> > SCAUSE, STVAL, SIP, and SATP. All of these are read/write registers.
> >
> > In future, more VCPU register types will be added (such as FP) for the
> > KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls.
>
> While have ONE_REG will certainly work, have you considered the sync_reg scheme
> (registers as part of kvm_run structure)
> This will speed up the exit to QEMU as you do not have to do multiple ioctls
> (each imposing a systemcall overhead) for one exit.
>
> Ideally you should not exit too often into qemu, but for those cases sync_regs
> is faster than ONE_REG.
>

We will certainly explore sync_regs interface. Reducing exits to user-space
will definitely help.

This is the first series for KVM RISC-V so here we want to establish a stable
and extensible UAPI header using which we will add support to QEMU KVM.

For time being, we are using KVMTOOL for debug and development.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
