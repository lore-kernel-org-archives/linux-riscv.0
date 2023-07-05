Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA40EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcDvL+MljEg95sXa0hYRK8r0wdTTeST2wgEe3VkZVGI=; b=fA7F75sTE8d62N
	cyrDUPHwMqx5kF43eYXqEZOJkug2MumgLubOarT614iz9+I/hKtadNzRGvmKDGdQhLSu5y27O5W2R
	SkRlCUzYHzSUrCq9o9wBNGGaTxljHnycxZOTP962jmhWS1n7ntQF7Rl2C1+E9qam3ahCGopnFZQKE
	pZVcPEKZ7xjjPNsbxxsn36j+Kz0Ipq73+o1pEcbaumMo943JaSjNo8zP2SB1II+1EQbI5QV6Om4n+
	asBDtKKx/3oMDdqYQsV4yvGbufZaOO1aXfOWLf1/GCoPGySL2vd8HEIC0sQZKgvD+nSNmLWsQHsDt
	UIoGHMia6qYMGqjoqYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH25Z-00FwEG-22;
	Wed, 05 Jul 2023 12:58:33 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH25W-00FwCs-1R
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 12:58:31 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51d9c71fb4bso6497329a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688561906; x=1691153906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQrDgXonDxL9axtRl5lwZsakY/CjkoP6IKvWcgWl998=;
        b=Vge9U9xIPTzswsZaPbqYxfhI6z8Z/UuxnLvU2uyCUZE3k5aAhdD7iJVTVc1UI0mEHd
         BhGcuR5WPggmOqTff8QC7f1LX50jW1RrYyNiBkU+GfpkHIaA+5ogqBO4UzA/ehcRYwSt
         92rcaer+1OM3e9Or1FJcTL9sWLRV5Me1sMhVCgU5S8VapRxf4Fb8vvyRss/TF74u3GJe
         J5k3CjvPrBAHouwI3hn0z3wbdtsSLssVxiH0/UJq2MBxD6KxJHHOmgfRHWzrMmddr5zX
         qoaP1R8WXwKNYb1sEsDJptZcCB9YuZzgzHO8e3kU1755r/KZzZ1ACukIdcJSFApMSdvG
         lUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688561906; x=1691153906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQrDgXonDxL9axtRl5lwZsakY/CjkoP6IKvWcgWl998=;
        b=XUEoCsk0ugcR9MFPCZdnpo6UzXaXMFCySBpG0NgekoUY4xa+01AP5R+MVAYHtVHLgm
         UfGXh4WZGpbMsc1nd4c4CTbk7bBkyDyBwV2S0JmgSYpUhp0vIsXwruy8h6LSy/90F+0v
         0tBU37xI8JQwtEORBD6usz1I8j5g9P6Yb5QD3AnesRJmyOMocM6BgdDwWZOiNa4Bn0ki
         cQQP8TbV5Aolk3pEL6feO5RKiZ/89C3CQRU+qgo83y5kf/oGePRW+qjH68Vw5EzPkZ6x
         P5gZKuPOPgRuxznshX6gaZeFqSlKn9jcJMHN6+Sdgibs2EgqoQlYMlMXCniT03qOY9sQ
         DcqA==
X-Gm-Message-State: ABy/qLYrOcZ5nnxiQAZNN7dR6LM0c9Dd8c2yNrJIx86/f1nidXJoL8fs
	n9V1/53NoqI5QqG9MxCIuIwVKw==
X-Google-Smtp-Source: APBJJlHiqjKjBQiht3ujNI3mPjt2v0U8ymFWVRPidfULSVfKhueCcRmrXgy7sd1cyBj91qvzThz7ug==
X-Received: by 2002:aa7:c98c:0:b0:51d:9db4:8201 with SMTP id c12-20020aa7c98c000000b0051d9db48201mr11179630edt.7.1688561906257;
        Wed, 05 Jul 2023 05:58:26 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h8-20020aa7c948000000b0051d87e72159sm12571933edt.13.2023.07.05.05.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 05:58:25 -0700 (PDT)
Date: Wed, 5 Jul 2023 14:58:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Message-ID: <20230705-602410a4b627f419f8f9936c@orel>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
 <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_055830_485559_5EFE4CE8 
X-CRM114-Status: GOOD (  20.43  )
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

On Wed, Jul 05, 2023 at 09:33:26AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 7/5/23 09:18, Alexandre Ghiti wrote:
> > 
> > On 05/07/2023 11:15, Daniel Henrique Barboza wrote:
> > > KVM userspaces need to be aware of the host SATP to allow them to
> > > advertise it back to the guest OS.
> > > 
> > > Since this information is used to build the guest FDT we can't wait for
> > 
> > 
> > The thing is the "mmu-type" property in the FDT is never used: the kernel will probe the hardware and choose the largest available mode, or use "no4lvl"/"no5lvl" from the command line to restrict this mode. And FYI the current mode is exposed through cpuinfo. @Conor Can we deprecate this node or something similar?
> > 
> > Just a remark, not sure that helps :)
> 
> It does, thanks. I am aware that the current mode is exposed through cpuinfo.
> mvendorid/marchid/mimpid is also exposed there. As far as I understand we should
> rely on KVM to provide all CPU related info to configure a vcpu though.
> 
> A little background of where I'm coming from. One of the QEMU KVM cpu types (host)
> doesn't have an assigned satp_mode. The FDT creation of the 'virt' board relies on
> that info being present, and the result is that the board will segfault. I sent a
> fix for it that I hope will be queued shortly:
> 
> https://lore.kernel.org/qemu-devel/20230630100811.287315-3-dbarboza@ventanamicro.com/
> 
> Thus, if it's decided that the satp_mode FDT is deprecated, we can ignore this
> patch altogether. Thanks,

We'll eventually want the ability to get and set vsatp.mode from the VMM,
so we'll want KVM_REG_RISCV_CONFIG_REG(satp_mode) anyway. For now, since
we only support CPU passthrough with KVM, it's a convenient way to read
the host's mode (while PPC qemu-kvm does read cpuinfo, I'm not aware of
any other qemu-kvm doing that).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
