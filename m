Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C43EC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRJcvjVqVeSR7z5N5KPvOOndp4iMOstBsvwQU3lswXs=; b=sRL0k3Q9Q4wFor
	vnymGLwRHwukgek+Gx7CGJwyzOOWldVMsA6N4fktE4mzzYuQTm5D//FzZTYx+uXaAY9afOuJnBDFa
	8GpgDAOWibf2mPkkChnotGK0KFLzxZIdT1X3XsIKcyzu+he27yzeJhqdqrwLJakuOhdrFA1yeLOCl
	8wZYgwHyoOMpX2MBamhw6TbvgtEdukpgvIZXSGjGtlhd7qEL5T6XPMU+mselRj9H4+U7QPhyzUMED
	FjwdzMP4V10u4AiClLUtSwgW7pvNizirHR2WX2koWNQ3gaOnFPwbAJtxxqLa1oYdaIDfPsoQoVzcu
	62AnKJCEU3w49vybC+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXnH-002XlR-TO; Fri, 24 Feb 2023 13:07:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXnE-002Xgj-Gy
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:07:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id p26so11348240wmc.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 05:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vRmr+qDGaynX3Fi6rufm9jo6Cki4j4VKaIrpKJ6hwe4=;
        b=RIzQ/rCEKDayTetLjXaZd+oSz1DZTFs/EICH39jXUnNfYZuNXnhAVn70h8MAx/r7En
         9s9Ztit2RAsX5OutmWbcjJkoU9mBD5kv04WMC7vhxIx2bstjHAjj1xeOVYwNJaVShM3z
         MSXKpi6MONd3MJNXHM3ZRafE10CLJIX6gKoSHplkfWt/wYKfHUkuSARSfw7LabxHBMej
         7+Hj+7Xcz24oxDBt9lUDiNIcYvmbGKsvwOQ6uDv4vzRQi9cfze/4mtNDEknnN7oKrxjS
         5fsa6SOiCOHWvHCnDcmSg4Fx9Qf3bP4BqNcw8pBity7kNEjBwK6FWjDX5KLT8rrlrAUs
         iiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRmr+qDGaynX3Fi6rufm9jo6Cki4j4VKaIrpKJ6hwe4=;
        b=CRM6E/xqSsI7MMVbFRk2Ln+yEhTNTiNOHiEqxwT3fp58u+eK1nMn57INBQFPmK/OFX
         sS3t1/CuBfyTHwGa+ypm6FT/5vFNNkihijt2mn2fK9u6TrkHDmZ7BcansFNotEi5KRWs
         T+27/Qgabu1qTTxIdi3u43kmgF0ymlf2sLS/aErQV0kgPILa/9ZNbTBH3sumoM3oQ0gI
         7k/skENq3wc+qOhGijCEJcbDPY1w8ZdTRSlBvTiIBhNyjofyQQJtFuUeJkESGSehYoHO
         H+YMyi0Cg0cqzQU4HzvsDve9YCO9HwVNFH7eTDv3GiFkw7QY9zM2OC5YX/zXr4thho4Z
         DAbQ==
X-Gm-Message-State: AO0yUKXukmscpYI56bqJIhKWhq3e/N6A0iFC1jIHs1we+hInmTjSw4WX
	IYU2B8FLz8AHxmpLCfQe+h7HJw==
X-Google-Smtp-Source: AK7set/jjFnC7ufdlcEvxsuUZyY5vrhEqrMGd5YSK2I2jwDD6VLGYlvjWgiKEajdk68eJyHa5z6g7w==
X-Received: by 2002:a05:600c:80f:b0:3db:fc3:6de4 with SMTP id k15-20020a05600c080f00b003db0fc36de4mr11161205wmp.35.1677244033586;
        Fri, 24 Feb 2023 05:07:13 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d4d84000000b002c71703876bsm3195029wru.14.2023.02.24.05.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 05:07:13 -0800 (PST)
Date: Fri, 24 Feb 2023 14:07:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 18/21] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <20230224130712.c42ob66ux5xhffbm@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-19-sunilvl@ventanamicro.com>
 <20230220200743.rev3djzbaa2jcmg6@orel>
 <Y/ivRjQbIna7M4R2@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/ivRjQbIna7M4R2@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050720_594962_6149D249 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Feb 24, 2023 at 06:06:22PM +0530, Sunil V L wrote:
> On Mon, Feb 20, 2023 at 09:07:43PM +0100, Andrew Jones wrote:
> > On Thu, Feb 16, 2023 at 11:50:40PM +0530, Sunil V L wrote:
...
> > > +	fadt = (struct acpi_table_fadt *)table;
> > > +
> > > +	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
> > 
> > Do we also need to check for ACPI version 5.0+ when checking for HW
> > reduced?
> > 
> We need to add version check of FADT once spec is released. Will
> update it at that time.
> 

I was thinking we need the version check already just for the flag.
The spec has a footnote that says

"The description of HW_REDUCED_ACPI provided here applies to ACPI
 specifications 5.0 and later"

It doesn't really matter in practice since no RISC-V machines can
boot with ACPI less than a version that support the new RISC-V
tables... But I'd rather we either document that fact, or just do
the check.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
