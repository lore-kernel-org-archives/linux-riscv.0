Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95338C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 03:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qezNpLbr407z8+ezHNIW6vhxxFZG56OfB5XVbsQo2Gw=; b=r+QP+06exp4kwP
	cHvG2/Mb04JbUTCBRsCfAx7/aK6zihG/Fzr44CkuaWI1X/zfDjA8M8yyxjAZV3HlK9/mzwz/2rSUX
	vnIVYb8STxUv50TqW3E153tjGnWhkQIvDP12EL/QCvPa6EFR3anUW+dehJR1mhGnyJpEe94YCDiDT
	7Gakxy7hc1tZRpPtLd36ehuQ/9PBApXlOzRfpeKEHLmlsfCKAoAbw9H2zaV/0YHUTbTD8x+VlyyI1
	dTgpmDkvcg5x0xWG5gB9HazZzmPiOvhq2ZR/roTSx12yF+x7KqVJpqedHRjngKMsB6dnNlM0MOT6z
	75gyfoN4Ok1c5p+WbRpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwanI-004wQZ-1B;
	Wed, 10 May 2023 03:47:12 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwanF-004wPl-2q
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 03:47:11 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-18f4a6d2822so42038471fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 20:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683690426; x=1686282426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifGsiDNA4DSRmYfOgUypvWteVU13/UhrU3vLKCdk6uY=;
        b=d3PX3NM4gmQ7YSVKyntNSesJA9EW7gEzUVzmWeHGX3KVgH4kLHj7EB+e1LZPqL/6WW
         OqrmrLLNxvxn5Mi4YielQrDlXyVVbcqyzFZwVoL3rYgRkqYwjlbAB/D6u6vZc1YgGTz+
         +QW2SQI/L/r/emHCkDA36GWbLPcSH2han1ciZWy++k3viwE7f58vNK+z7kZx+1uzIhvM
         ioMwo88nQQVy8uHQluibBcR5CB/9JFSauwqCtZ2Yk+epu+t/IvF8XhcBTp6+7T6x50Nh
         XEaZx9CbvMJsWZ3fARKULvqnL0eZCOr2tec40FKccX/SY8MW+7zGTzKQTod1CiL9rBI2
         WWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683690426; x=1686282426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifGsiDNA4DSRmYfOgUypvWteVU13/UhrU3vLKCdk6uY=;
        b=MsqUt2c1Bo2Sxh5QNEqcmJeCiCq3hlEjfttYrWXWejyqL5dM/YCUE1M9T5Ck958JOQ
         qguB/T+gtoX6VtTkaFb5mqThR05cs3qWs/d3n20GJpCAVyhvkExY8MpJM/7DJTSrpsMq
         RJL3UeDmzXZbRWPzFKFXUp1ZaTwnxqLC2KDIpmVHnxZ7HJAl40HdqCn3jKM0e5m8ow7m
         E10MqSKuQk4BS2kweNB3a9m6OU5rvEbNYVmD+w5P4N2EYcPoLjlVcHrCNT0AY18w8c7P
         1tQnePTHKO/C0ZzTZ4V/XN3WAqPck/LmsbJpLa1lzN+s2cedy4yxQCeq/FMtr6w8Cyjz
         sWhQ==
X-Gm-Message-State: AC+VfDwB7q6yM9j7EfZu2H9+xZ2L5/sTBDu1BWnHp7objOVqobyecGUh
	lR0RC/zjECv2f/mfl20viR8OfA==
X-Google-Smtp-Source: ACHHUZ4YePMDzR3NxPf56dWWs0438cRvarCHuKqCLPxWMl4dytqu+RlEXReFpB+kOAyPzW2K5KhhxQ==
X-Received: by 2002:a05:6830:6081:b0:6ab:1aa5:1634 with SMTP id by1-20020a056830608100b006ab1aa51634mr2429359otb.10.1683690424388;
        Tue, 09 May 2023 20:47:04 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id j16-20020a9d7690000000b006a6558ef17fsm5865716otl.30.2023.05.09.20.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:47:04 -0700 (PDT)
Date: Wed, 10 May 2023 09:16:47 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V5 08/21] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZFsTp/cbuPFauDui@sunil-laptop>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
 <20230508115237.216337-9-sunilvl@ventanamicro.com>
 <20230509-atlantic-writing-3ceea38e050e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509-atlantic-writing-3ceea38e050e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_204709_921610_0CA0A5C1 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Conor,

On Tue, May 09, 2023 at 06:50:07PM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Mon, May 08, 2023 at 05:22:24PM +0530, Sunil V L wrote:
> > RINTC structures in the MADT provide mapping between the hartid
> > and the CPU. This is required many times even at run time like
> > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > the RINTC structures and provide a function to get the correct
> > RINTC structure for a given cpu.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> From this patch until "RISC-V: Add ACPI initialization in
> setup_arch()" (which is 19/21), the series fails to build.
> 
> allmodconfig, clang-16:
> ../arch/riscv/include/asm/acpi.h:22:23: error: unknown type name 'acpi_physical_address'; did you mean 'efi_physical_addr_t'?
> ../arch/riscv/include/asm/acpi.h:22:51: error: unknown type name 'acpi_size'
> 
> rv32_defconfig, clang-16:
> arch/riscv/kernel/setup.c:297:7: error: use of undeclared identifier 'acpi_disabled'; did you mean '__cpu_disable'?
> arch/riscv/kernel/setup.c:297:7: warning: address of function '__cpu_disable' will always evaluate to 'true' [-Wpointer-bool-conversion]
>
> I ballsed up a toolchain upgrade to gcc-13, so the whole series is
> showing build issues on patchwork for the gcc configurations:
> https://patchwork.kernel.org/project/linux-riscv/list/?series=745787
> 
> However, I suspect that the same patches that fail for clang-16 will
> fail for gcc-13 too, once I have fixed that!
> 
My bad. It is a commit order issue. Let me fix it.

Thanks!
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
