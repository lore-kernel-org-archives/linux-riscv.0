Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77801C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 05:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFPpEF6xukwV5DrMBUG7lPlgrIoUVLiptb7hyWU4Occ=; b=Z9EhOFqDoFtbbz
	YarlWMZkUSYW9qs3q1AcWFTJ79aYbthvuMbH/8WvJwYnnZmdYs6RfpgXmlT3lPtwsfYsxn9dSB6Cd
	75pX2mKrSHb44U/xIRANYSgjDVecghDelJulKa9lohvp1Li1qY9K0fh9cqwCP/6DOt0/TgcRrz/uQ
	OJTzXB2e8IX9Sp5+gBRMpDNh3DefG/PL0sfY9kitXAu6dZL3zrkFCT5j5g0HdAiSP+Z+9VN+Tf4+c
	gXkffAtd4PtiBNLy2XU0O2wV4A/6Fb5s/QbAoru4BrssbHNrxUKqxTwHUxtkGZD6DqAbHshqYN/jt
	1FZ8dAw1TWGdakDVO0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9xi-00000001n2a-2qn6;
	Mon, 01 Jul 2024 05:52:26 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9xe-00000001n1m-381f
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 05:52:24 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6f8edde24b3so1743902a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jun 2024 22:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719813141; x=1720417941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKMU8DKIWEClgPDBnmDjtT7Ao2B1dNYMjzwF2iFrrjI=;
        b=Ujfi2jRtoSC0T6ghNWD7e6F5t6T5JCKrvYCVO+qFzTWSjjqFjK5pIIgt2d9nrFc0kj
         q9I5Mhv1wKk568huWrBnYEZOnv8D7abxldAUNeXP9ntyDi1Cray7CHLM318Ndtwx+pOA
         qdYzbxfIUDLlEqD9nndyZH3nTti0TRd/rmyuODROyAyT+fxzbUV9GfO421JDWCWZxzAf
         H5uMSHx1kA2deYy0PHWa3NR/tC28VcRh/t2oKxX/LvKiSUHTMYcLgdjxVccO/g+KeB2X
         nKpLJiugJglN+QDj0YRapFNGpVH7xLI6mjrFvVnA7K8nZ9RLlWOR8PuinOQ5Vh1rgbgn
         D3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813141; x=1720417941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKMU8DKIWEClgPDBnmDjtT7Ao2B1dNYMjzwF2iFrrjI=;
        b=FYrPuGIVkrOGdGMOgCOLyDDmKCEEwYKkZrd4I6gRekSHDQviWpUt561tIbnzHzdaWm
         tbzHvW35yTtrmkoG5ARuHFFhSEZ4qYvtNdow/2YSUHNXRwsUm1t86NNyeRvuH9gwXMj3
         meG7r4ZVY5toCdZOI4Ww14ZXpAHNQ0BfJYf+xUQF/ikjSYsoh2vAKNbCkY1NzKfJWRs4
         CeEkl06yGisJ2PZWP2dT+xNNEIQp4ZtU5tvrUuKjTLEenREMO+/qHVBoEKy6pm1ae3Hb
         SIkZUDYh728GCr94buh1pmlrJiXY+JFKweO8DAx9KHMtj/TSkjZ5H7SPMNZjZW6kfPy8
         eLJw==
X-Forwarded-Encrypted: i=1; AJvYcCVEYZihnKQSpth3Wtn2bhW95mYet2JiOmum6cDe0Jz6KRJ3+hsnIUacph5W+ZaD5Y0bkFH5LB5jPGRn68O7+v8BQcE+eGNlOEN/I0T9Ofir
X-Gm-Message-State: AOJu0YwU91LYTh1MNzUigVO3RJ/mKqP5okO9SaQUim3ehDFxBZIN5wu0
	z0pzbWgXwie5ZXz96zaEl0m3Yt4lKCoU14NkTe5OVgNblOGagBbpysIwFItlXXs=
X-Google-Smtp-Source: AGHT+IGm7YJAgZMyphMx4GQMzsUKLII+YHeZwD23+Ey+akRFhATjAn/ybArgYnMmQp/igw9JEjVJmw==
X-Received: by 2002:a05:6830:903:b0:702:1d8:4d08 with SMTP id 46e09a7af769-702076a4d47mr8000813a34.35.1719813141012;
        Sun, 30 Jun 2024 22:52:21 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7a9b2d9sm1167621a34.6.2024.06.30.22.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 22:52:20 -0700 (PDT)
Date: Mon, 1 Jul 2024 11:22:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: arnd@arndb.de, xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Charlie Jenkins <charlie@rivosinc.com>, Baoquan He <bhe@redhat.com>,
	Evan Green <evan@rivosinc.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jisheng Zhang <jszhang@kernel.org>,
	James Morse <james.morse@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Robert Richter <rrichter@amd.com>, Yuntao Wang <ytcoode@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add ACPI NUMA support for RISC-V
Message-ID: <ZoJEA85utEK6u36t@sunil-laptop>
References: <cover.1718268003.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_225222_813987_A9490538 
X-CRM114-Status: GOOD (  12.47  )
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

On Thu, Jun 13, 2024 at 04:54:32PM +0800, Haibo Xu wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
> 
> Patch 1/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 change the ACPI_NUMA to a hidden option since it would be selected
> by default on all supported platform.
> Patch 4/4 replace pr_info with pr_debug in arch_acpi_numa_init() to avoid
> potential boot noise on ACPI platforms that are not NUMA.
> 
> Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next
> 
> [1] https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view?usp=sharing

Hi Palmer,

Can this series be taken for -next?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
