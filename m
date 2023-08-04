Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9494C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjdCG5YLK8ZNcwwOropiBUzZ8mCH1nWMgzt796l6Xtw=; b=KfLTgBIC7fTGN4
	bH6sT10Od2yPm95OEX1Mjf4N9CgwKftILZzT0S/Kk/vttM7Crxzy/6SSOWoDMgUfrxNgm042BCdhk
	tkXa9tGuGHWRxiVLIVDu4mz8NK1VUNBu4HEHYAWYvPF4ixBUVEuZY8kNpkkvwYZxDrhDC3Io1W+fj
	Ziu8aL4xFOCFP2+kJohRw9+0nGtfv7cqWYKzAQP6vGA3K3HN1xh7x3VTT7jP4h/sgdJbPMJbQOKr0
	oebBeT/MvFpY2szizL/FWMPN70fDiB8MKScKhcPEdbu++GzfRG46MSk/Nb5gwau8fREj15AgFESUH
	FzXkB6SeYlyiRsr8e0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRq2A-00BrjS-1Q;
	Fri, 04 Aug 2023 08:19:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRq27-00BriG-1C
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:19:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686b879f605so1298867b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691137178; x=1691741978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6p8ZmyjWt9EkIhx2x7mQdHkPI32JR/rPIgt/KaUyrM=;
        b=Xy7UXj5rKhL+uu8tkHk9ALkF9uUbocA2LUGuUDTCT+UGGvvTrismPG1zBkJkoUphar
         GFIBh9B6MWwxSsxdU7gxlE57mN66vXeN52obzKwYx5CxoHQybxqezGy7NIg+855c764S
         XNF/oYMsJJ5Rt/2MYOeT2lTd6jXCIw8p1xhmuAbrL+ZL+sCs0RmmNBE1mk+AOBq6Eq9W
         F4pwgeCm+zv78ejFX6n1IKU186BdKmiIkBCc3ojk6wDZAKKAN2w8IQf6CZtDJd5Pa6Dq
         /f/CXnPRCEHLAkvvcZXchDfjlnHhtZnzkRvEjbeedsy/ciaI5ykfwG3vd5RKwNUEGKzl
         UCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691137178; x=1691741978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6p8ZmyjWt9EkIhx2x7mQdHkPI32JR/rPIgt/KaUyrM=;
        b=YMSzdNlNb+rCdZ8jopUauoR+cPgutKPUr/EA1CmFmoFPa2Qgt9bhw8FREWGl2zP/cq
         f0O9iPgxOmURy8Bye2yEaLbVpZcc8TUsgrQNB1ZYLk7X9J0VQa0WctTwcA7qah5KrsWb
         46EctHYWVco+IrHwSdhW0xfe1fl23gMHXM06eW2ik0zZiV9ipQRvw3g3EMFayb//vSOq
         SqZeu7fTIxvIDaJQIt0MeFwaGqrIogz4zjYBfb/VXiqDYn/HMeJKgTkaxJReIG8sdxZS
         RSa4XP86GYcPtmNM9dOL6QnNkHKYJRP01hgE5AQ7CiUEcIb/NmEoS64FxRL4ckiDNccg
         Ns4A==
X-Gm-Message-State: AOJu0YwuqzmwT0YVXpLSJBrkjHMI0RMRWf3yvMwZBA/kDWvBV+U+jJfN
	v8+TXxJ7MksAEl/4fRsGxHH6Yw==
X-Google-Smtp-Source: AGHT+IFmU2okWiufqxbBgTJlqhXztctK8e0s9XMhsjLRvyxOqapi7NDJcuaofoqHVSzZkHv7M/zO9Q==
X-Received: by 2002:a05:6a20:938a:b0:13e:8ce5:cacd with SMTP id x10-20020a056a20938a00b0013e8ce5cacdmr944703pzh.26.1691137177799;
        Fri, 04 Aug 2023 01:19:37 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0068620bee456sm1046915pfd.209.2023.08.04.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:19:37 -0700 (PDT)
Date: Fri, 4 Aug 2023 13:49:24 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [RFC PATCH v1 04/21] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
Message-ID: <ZMy0jC55N0+nKEye@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-5-sunilvl@ventanamicro.com>
 <ZMyRCRRkTnR/sK0u@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMyRCRRkTnR/sK0u@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_011939_406325_6468FFE5 
X-CRM114-Status: GOOD (  23.67  )
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

On Fri, Aug 04, 2023 at 08:47:53AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:28:59PM +0530, Sunil V L wrote:
> > Enhance the acpi_os_ioremap() to support opregions in MMIO
> > space. Also, have strict checks using EFI memory map
> > to allow remapping the RAM similar to arm64.
> > 
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> You may use --cc to the command line when forming patches.
> 
> Also we usually consider Cc: as a part of the tag block, meaning no blank line
> should be here.
> 
Thanks!, Andy. I specifically wanted Ard and Alex to look at this patch
and hence added Cc. I was not aware that no blank line should be there.
Thanks for letting me know.

> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> 
> ...
> 
> >  #include <linux/io.h>
> >  #include <linux/pci.h>
> >  #include <linux/efi.h>
> > +#include <linux/memblock.h>
> 
> Can you squeeze it to have some order, like to be after io.h (taking into
> account given context)?
> 
Yeah, sure. Let me update in next version.

> ...
> 
> > +			if (memblock_is_map_memory(phys) ||
> > +			    !memblock_is_region_memory(phys, size)) {
> > +				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
> > +					&phys);
> 
> How %p can be useful here (it's mangled), but also wouldn't this give a hint to
> an attacker about the kernel memory location and diminish the KASLR protection?
> (IIRC after boot we always have the same salt for the mangling the pointers when
>  printing, so at least theoretically it might be possible to bruteforce the
>  printing algo to give a clue about the kernel address.)
> 
Okay. This is copied from arm64 version. But I think this is a good
point. Let me just print the warning message without address in the next
version.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
