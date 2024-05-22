Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C908C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBsdKDl2Y3x8nz/bEqZGNlitKuXEwOlS1xqWgq2TNaU=; b=d6W1gZMymBdcKV
	NEWd6X23L96o4q/2KznhrpMZ2i1nVoaCS1nLCaZMkM2shtxQBBW23uFoDgz3Iqdb32Pp8/Fbm4zRG
	WacuLSar0NhvlYhCa6Ky7QBDAnTxd8TTY942LTsK8hKLIV7ng10DuVbzFloRjufTVo8H9fjjMTdEz
	g0ZR3sstGXWQRcc9yegsNRnZac6wZbUjgvAbh1GE3fwG60POl14N10YEjDkKlaDu7IaarT+Y0ERDR
	cSql3wS0RoaRRZ1IFE7GQ7IAAKKYmplQrPaTfv2I11kX6Q4ytrDd8WSXVhRjGI2H3anAWhycD15Fx
	aj0j7VaSW8b++g9B+H7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ptE-00000003flH-0NSU;
	Wed, 22 May 2024 17:36:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ptA-00000003fje-1xkL
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 17:36:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f693306b7cso2043787b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716399391; x=1717004191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fDl/ZkDPbSW3xCzUR/DuRNxJiVwY9Xt5ThAS5ddvXhg=;
        b=a5ODbdqgGz/XvRA6ttW36VufDGYPsuVwUTuikoeZQADdCyWDv8dUkaSXtcTGhSYMgD
         SPm6ggFWbx0+IlqhU/w/QGM91GHxf8jU+c0a3/1jedV/FInxBnoMWY4qAXkRC3xSD8R8
         UppucRgvWGLfXrmdXpwHYu/fs+DAMAZnlpRDOTCtkyeQWmkWJHimyQW+29+8Fln4dRRN
         yNHJDzznSl5ow5khJYPvLJqnChSUgvRr6NZ2J7KFiuFeKdKXeH7R9x+cHujqFnvVH6mB
         O7qOdX02W21Y6p/m/ELripd8GxJDSmyHMZghfWtShC5wXB2vWwHH7Ih3WWh/XaM/I9af
         t3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399391; x=1717004191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDl/ZkDPbSW3xCzUR/DuRNxJiVwY9Xt5ThAS5ddvXhg=;
        b=u+wekCa7LYqpa77zex9/BI+f2rJEwwG4jUGLtil0zGOcbF1N3AokmfR+PjxG9QkbMI
         l0Wb99i1x2O1AbbWgPyyT+TRSC1bACElx1ztBfSp8HNrY53bSEmkT09PIAUenCkIA3mM
         6Ya1M8n6o5fZEmymk+TLDF+L/LQAhVl8w/378KLiHDC5x0VRWXiLwYZExp2zm3/ukVoT
         X7MUzdyaJsNtp4kVwl5jxyj0KfReci88etZr/hKWz7/7vSrMHjMnkeLkDG8BL/4X1IrY
         vtW89eTiqPorPPGrpG/ZUzipDvglDFNxwDqkeq/TqgcReuePjpM87MsYPMlADRHSQevc
         /Biw==
X-Forwarded-Encrypted: i=1; AJvYcCW9sRJ9yk7nnwsircRq5Bt5owUJ3m2wn9FCTpYZEIQCx4+XbLYSIapON/Su8jdleZeurAu5hox7RCcnKxiwXRu1OOXxbxmkrozMWJ2yknSX
X-Gm-Message-State: AOJu0YwLHh8Gjn+iy+BhBUrybDCfZSvUh94GDpucpHntGG04bENP/mi9
	mnkzVWGfYKWz1WvRTb/M8IHrI3xBZDU+qqVxRQtl09+e6MdwWlOEXNcctmRoXgw=
X-Google-Smtp-Source: AGHT+IE/Z1uXsIhp0DCO9v3F7b1s/kf5KJKCU5p/KxlUXSDW4uxdWvE53WL9qx0kDHx4AoziD5mkTw==
X-Received: by 2002:a05:6a20:258e:b0:1ac:8824:156f with SMTP id adf61e73a8af0-1b1f88a30a9mr3119543637.33.1716399391193;
        Wed, 22 May 2024 10:36:31 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0fc9sm22689883b3a.132.2024.05.22.10.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:36:30 -0700 (PDT)
Date: Wed, 22 May 2024 23:06:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: arnd@arndb.de, xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>, Charlie Jenkins <charlie@rivosinc.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v3 6/6] ACPI: NUMA: replace pr_info with pr_debug in
 arch_acpi_numa_init
Message-ID: <Zk4tDa0UPL3Xo/0H@sunil-laptop>
References: <cover.1713778236.git.haibo1.xu@intel.com>
 <70870d88a26f50677eb31ac72bd8c343f428e5b6.1713778236.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70870d88a26f50677eb31ac72bd8c343f428e5b6.1713778236.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_103632_617076_A0023DB1 
X-CRM114-Status: GOOD (  19.26  )
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

On Wed, Apr 24, 2024 at 01:46:26PM +0800, Haibo Xu wrote:
> There are lots of ACPI enabled systems that aren't NUMA and If the
> firmware didn't provide the SRAT/SLIT, then there will be a message
> "Failed to initialise from firmware" from arch_acpi_numa_init() which
> adding noise to the boot on all of those kind of systems. Replace the
> pr_info with pr_debug in arch_acpi_numa_init() to avoid it.
> 
> Suggested-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  drivers/base/arch_numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 5b59d133b6af..555aee3ee8e7 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -445,7 +445,7 @@ static int __init arch_acpi_numa_init(void)
>  
>  	ret = acpi_numa_init();
>  	if (ret) {
> -		pr_info("Failed to initialise from firmware\n");
> +		pr_debug("Failed to initialise from firmware\n");
>  		return ret;
>  	}
>  
LGTM. Thanks.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
