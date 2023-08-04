Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BBDC001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1EpyuI1Z0GOKEyl0gRAy4x059MeuQMkt5JMLcpqMAo=; b=RU6dUHM7awbhf4
	bs74/cTaglH8MCdbCif8AdKVBNHTLC9lbTKIE8nXRxSG0gIwgfqme3uhzTqiB391GXq1z81xgbCUV
	+yd7pkWN4T+UNhVZz/BNVuXXmATijTE9cOiHmTkk/ZdL94AD6QpBg0LvogtW5p1V4Z5jRXChz0v1e
	2rF5r1sCjrPcd3GgmxK+7y0lwX7TbeCkT6M5PLyM0XzzzEtbubXaGqUhtRsqyFhpvzswBxfoHgTT7
	GoQuneg9WKBJuF2gbG7wEErHzyV4cGk1UZ82qa74upwMGEB6wBoL5M/pxW+ryKQjg/SiwhnurK0aa
	9/7FCR/5eCoXVufDcBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqzK-00Bzdc-0w;
	Fri, 04 Aug 2023 09:20:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqzH-00BzcN-0R
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:20:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso1400911b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691140845; x=1691745645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p2ObDLhJobQ9FX8zrDm+LEp86QCexPfSdnjmPctJdSo=;
        b=F4/McMixxcOMhEI5apZ4RiT+M6GQ3Y1FulhZiK9GD9FMHjwnXxiH1LCf65R0H6ghim
         181Yd5r0KpK7HXoP32NBwHOYeWls/+uSmkIpeDfegw8IW8DZfjy03nWwt9rgWRIyuI7K
         k0FfY0LXSfohvE+hpFPhEQIto13y1R6sxgyePSF4Wb6uS3VoXHeJc5Ik9Ef3JLKkAkbo
         MKYwmaVdVpb54LANPaVIcAm3fzWPKuymwQfADR5qJvbx/m+63ttr9aehvptKX7mRMI4n
         wCCoonjfQkU0eK2kop4Az5gc3o07/UL/tdLRdyIXTHzwD+QkF8LxjejSrhXoajObwFiJ
         ZWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691140845; x=1691745645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2ObDLhJobQ9FX8zrDm+LEp86QCexPfSdnjmPctJdSo=;
        b=GX/PLNo8OnKxgYXj09xXRj8Veu6GRxYj/E7u8GwT2oUdqcRpKJtZinXBgTrZjkrLKl
         62CHUDSU233o+/DWLVjWXU2w6R8DkgcTaKw6fy5f7d9TtyGM8Vyg2Y+LV52bY4xmQLw6
         MP5SaTNievb+CXom96XKqae0fNBuEwrZEGjfNLZxnSnB2E+B2ZLJebYJuApZKnAgfo/h
         Ojc1M32UflxfnYs/JG0XqW5WvaYmJwSZ1nnY9LgyHQcQFtsRus7UidblBA45crb2Z4d/
         8qyZtBoZd+8FZeLLanQuQLD7U5pvvKSksUraGqprMDxFJv4+suti6r0k+xAXIInKJvTk
         zDpA==
X-Gm-Message-State: AOJu0YwGDU8F3zgOb9Adk/giDjvUB6rNNr7EIDJYB80+mqMEz0fLhvTT
	aFyt3/Xc7CtbYJcG7qnB7C4sMw==
X-Google-Smtp-Source: AGHT+IH2yLk3kVTwlVX2pFEM7MDeX5YS0pIZvWjo5KAsJ2OCrs9SAbu2ByBxMEsWLIv7WIsy+kk+YA==
X-Received: by 2002:a05:6a00:1252:b0:687:9a0b:9265 with SMTP id u18-20020a056a00125200b006879a0b9265mr1122535pfi.29.1691140845486;
        Fri, 04 Aug 2023 02:20:45 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78482000000b00666b3706be6sm1171935pfn.107.2023.08.04.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:20:45 -0700 (PDT)
Date: Fri, 4 Aug 2023 14:50:34 +0530
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
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC PATCH v1 09/21] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <ZMzC4nHOJOfp0vaa@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-10-sunilvl@ventanamicro.com>
 <ZMyTDcffqXYT29JX@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMyTDcffqXYT29JX@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_022047_203854_6FE04E88 
X-CRM114-Status: GOOD (  12.99  )
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

On Fri, Aug 04, 2023 at 08:56:29AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:29:04PM +0530, Sunil V L wrote:
> > Using new interface to get the CBO block size information in
> > RHCT, initialize the variables on ACPI platforms.
> 
> ...
> 
> >  #include <linux/of.h>
> > +#include <linux/acpi.h>
> 
> Can you keep it sorted (to some extent)?
> 
Sure.

> > +#include <asm/acpi.h>
> 
> What do you need this for?
> 
> >  #include <asm/cacheflush.h>
> 
When CONFIG_ACPI is disabled, this include is required to get
acpi_get_cbo_block_size().

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
