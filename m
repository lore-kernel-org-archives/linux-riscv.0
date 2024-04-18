Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFE4C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4O6NcYZH7iUOwiROiys6xXARz+DBNUd6Lr9Mvf43pI=; b=RbDud5dzrzsaoF
	XwCxIHCTGhpCQrE22G70QduxF6aKPh0vFapaD692x3+kikqihBLOQM8HqRvU7D9XM+ZiknQB+qXr4
	/PoCabYQHX15JqsHKjtauCDOvfRnYQPAUPCU0qzJqnj6Zidjxy7+EntNbxHfvL6KRsFAkMSOtphnV
	kKCXhXm4h6tmsl3N9K/yB6iudY5fjpFIZJ0ljMH01gPTVPLDVsgbUZZtEc6zJsbr8xbz13jW97nSx
	jDSkm6BmkdlyIWzxzJXXd2YJCLD9g2w/GzYVHiclZf4cbH+6XnB5An/SSskO7NkC60wZhyB6SXXk8
	VpEUBeR73zc9w2LUl1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQDS-000000022mc-1yfM;
	Thu, 18 Apr 2024 11:46:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQDO-000000022lc-3yCq
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 11:46:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e51398cc4eso6806075ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 04:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713440765; x=1714045565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tse31PpId242mWCWoF9F68b2IO88pQ6rFBjaTyilK9M=;
        b=UvEng+BhsQI00F5NyWnH8TFLnUuHb9PLGQJQO1w79hnx1sm6Va2wobTeOjMTVpjd5g
         Ua+pLus+l5t4YWJkCfLbaLmSLAfxlic3tWZf4T9wnLQqWLHSGZHb/X5XniDH+o/HYwHU
         LWoLxdIR3mHTz1NJGO7mRNEHGYVB1NYeKnPcisnrl+BOxmnCEW1hWHOMLvRmv2K9FZO0
         YMrsw959WgEheE99TRbgTVmt+M20Qlxvx5dWCTXmfwXlUyKhH/JicPS/pWMebB4bW518
         GGq9CbqUByzp4miPgJst0+PZNpwa1f2im5yKevIsljZ1YZ45rwLirTJ6QoYIV1Dtluzh
         kNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440765; x=1714045565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tse31PpId242mWCWoF9F68b2IO88pQ6rFBjaTyilK9M=;
        b=FyiD8OGwg92eVwvWIcGOG2IbDfAfyVCVtBkm//DqpiVWCW6ME+EZ31a4bhy2B9U2y3
         SWdzFGBgEXQ+hhWbrdCEn8QMUC85mI+nm+qjds4dUT2bysoae3aqjl2DHeVopF1f3FM0
         O29d4HxmNUCU+UFu7XDI331ELE3JgreoF1MsSuBtoaP5jIGjIADMC8rv4vTjcVK0wDBC
         CgB9V+M9EJUVRpWVAr63XyVjtsgp1jnQeQ21LFRLx2QMV/Se38R2/I3fKFBUfiiIKq/y
         BJuptLKgpA+leYBxPMsgEpwhnHxXbX/outfnXddVvLj8HGyPiJzCFffzmE/09LkaFvm0
         /d4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW10AZtZwmSmpdci0RVcS/1zlpv9L6eOIZ757hOE4m26QJ7juLA/v68aqXrkBvlFduApCJfJQBMl0nCEjhhKJFsDwRzJSP6hgMu6TaLsztQ
X-Gm-Message-State: AOJu0YwZKYC8koiL+ZVD/+XYFsiPx0PKvfI2NbriLIeB2TQ5LOfReasz
	aZS/M6fHajYihpneHrbaofeJuuy6YU/W0OBKXsbeSj6IBzEh5RwJc7i3XjgElhM=
X-Google-Smtp-Source: AGHT+IHRN0PX0++JRfnr2/T3yLJtW4R020dQU6g3OEB6EOIeUseXqxzCCZJlgMQ9PVF1Si/Jw1nqbQ==
X-Received: by 2002:a17:902:ec90:b0:1e4:911b:7a6b with SMTP id x16-20020a170902ec9000b001e4911b7a6bmr3458551plg.61.1713440764817;
        Thu, 18 Apr 2024 04:46:04 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.72])
        by smtp.gmail.com with ESMTPSA id x1-20020a170902ec8100b001e5cadbdf8csm1327734plg.37.2024.04.18.04.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:46:04 -0700 (PDT)
Date: Thu, 18 Apr 2024 17:15:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Marc Zyngier <maz@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [RFC PATCH v4 03/20] PCI: Make pci_create_root_bus() declare its
 reliance on MSI domains
Message-ID: <ZiEH8VF6VhCMnXz1@sunil-laptop>
References: <Zh41pOmtAJ0EcbiN@sunil-laptop>
 <20240416204653.GA164172@bhelgaas>
 <Zh/rroBTGTq/Q/FN@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zh/rroBTGTq/Q/FN@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_044607_021163_C4D03CBE 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Bjorn,

On Wed, Apr 17, 2024 at 09:03:13PM +0530, Sunil V L wrote:
<snip>
> 
> I think fundamentally there are two issues here.
> 
> 1) MSI domain should have been setup properly when
> pci_register_host_bridge() is called. I see that pci_arch_init() which
> is supposed to get called early calls x86_create_pci_msi_domain().
> pci_register_host_bridge() also calls pci_set_bus_msi_domain() to setup
> the MSI domain which can walk up to host bridge to find. So, not sure
> why PCI_BUS_FLAGS_NO_MSI is getting set. Is there an issue in walking up
> the tree?
> 
I think I understand now why this is happening on X86. In X86, even
though x86_create_pci_msi_domain() sets up the MSI domain, it never
informs IRQ framework. Only later in pcibios_device_add(), the device's
MSI domain will be set which is too late for this bridge logic. So, when
pci_set_bus_msi_domain() is called from pci_register_host_bridge(), it
will not get it.

It works in RISC-V (I guess ARM64 as well) because, the irqchip driver
for MSI controller registers using pci_msi_register_fwnode_provider().
But, if we set bridge->msi_domain = true in X86, it will disable MSI
even though it supports MSI which is really bad.

Please correct me if I am wrong with the analysis. If correct, what do
you think the way forward if using CONFIG option is not good? I tried to
register the domain in below commit but I don't feel it is a cleaner way.
https://github.com/vlsunil/linux/commit/d6cf76f10c225c94fffb286b7a3e803a4e37df54

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
