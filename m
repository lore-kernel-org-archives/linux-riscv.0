Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC29C5478C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 04:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSC6WFjBx1yVv7FmBzDa/DxswaoppOQL2Q0ca7x5fuQ=; b=kd1P54jKRHlT29
	LYGHYdRkPdwowv7B/howQhsmAKY3sSh1TkaSwXmnbPS3t+LGAj+xobCf60tEUrwtRXin+TZJrtKBt
	VpiIi+GrQ0Rf1YB712I+vWGnvY+VKBt6IZ4ijeFc4LFW+xpq9u0HL/I+YdJ6raiRS2FsuVWUz7PlI
	EJzWdg7j2m3vxi0m8jTU8EvvrQiOQ2audwA+4z0stVIBqgiV7jDezqkG3nO0MvaCpHQ34iiuGx9vJ
	ESljK0WhR4sA6rRgJf6QfQw42pVAVbMdnWIaPEUJcxGjWr9AVO9mVvL8poq/vvwAZzu64QRAzHBnO
	/tqTKTiizj6+59IaLn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhMfI-0000000BtGy-0ruF;
	Tue, 05 Mar 2024 04:44:32 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhMfF-0000000BtGC-0OWm
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 04:44:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e4560664b5so4352301b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 20:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709613868; x=1710218668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SEmCILRrIWZpalXXrpWDX7rbP4qw8KKDAl0Yn0w+NeM=;
        b=THpQCzrZt0Nrw9pEMH0imfqMZJV+W8rCIi0iRHGUpKpSnBlhy8vN68fGsnmoKYekMJ
         vFd5Ah/FFWhjD5w+sVUflHyUn98dIjhzF0fmT3IIGrWWPuqqc5dHEbk/tNVOLDw1Pprq
         ggAhNCU/qn3DynScyQAVUxB8uN6T+jKmQNGX9ZKMN7J3sqhhNCbj8tc7/spSmwI92KNf
         x2SHv/KuiFu68SD+y7muDjnOF1FcudqxuJSMxzwVtNk1uXKwRBpocn/ojNV/PSJocIpc
         eEoanJLqqNoeQkcRbnUfOe+lY4mcx1P+D+EunelkpeZecOyUEMN2vhsirJm5YPQoAA3U
         iwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709613868; x=1710218668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEmCILRrIWZpalXXrpWDX7rbP4qw8KKDAl0Yn0w+NeM=;
        b=FWkw0wo55oTF6xCFFRXdcALLvWUDksSFEKB9GBQfdsHjN0VBtcws8CMP8aW7SuRBaX
         n96TFG3QUTjZu9qlNbL8w3TQKphRO1wNbkpUvzzCKY+nWKcjHFufJTTZWQG6TkjxUJKN
         gBbcLBdX74RRB4vU03WW+2z1YiC+jPn8MMPDP5rveuYzDn5IYBTHr33yydXKFiGPuhMf
         LuBX+9J2x4nGbeIXEyqMEEP/IleTt506XTkUfephnbwEXm/hKdSCXvThobSkxSqWcPTi
         nUxz9blfBJXIx11dUDCtjpp0TpBFchq+dB8rtqUyR+W9SUT2oZ07Pwb/gzSdXcDxPMIT
         az3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUD+4PjH9JloLUMAznHzsAPu4zkxRl8Ac/ZYknAtURu2gCUAbtN52apUhMhLjCEWLsFKorhiuQi9ypsO1ExP3bjfafu23cqGYlLueCWiFM/
X-Gm-Message-State: AOJu0YxmJDPAQRf2EWzsQu2Ef7c5HMgbQmH8inJ7M1c9WRhQzxbPSVCB
	qHNqrM1RLLWX0tRqmdF4LwoPP5ukIC4JyYYfRpbn+qutfeA4DdCDHJvVi9Bi/TE=
X-Google-Smtp-Source: AGHT+IGzdE2wBh5JMNN2REb28BcAMWbrN4VvpnatTms7qSnw73XZkAoXt6ydG0CS93YADlTRvZf9Ag==
X-Received: by 2002:a05:6a20:4304:b0:19e:4aa7:e6ab with SMTP id h4-20020a056a20430400b0019e4aa7e6abmr909690pzk.47.1709613867818;
        Mon, 04 Mar 2024 20:44:27 -0800 (PST)
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b001dcfaf4db22sm5467653plr.2.2024.03.04.20.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 20:44:26 -0800 (PST)
Date: Tue, 5 Mar 2024 10:14:14 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>, James Morse <james.morse@arm.com>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Tony Luck <tony.luck@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 0/4] Add ACPI NUMA support for RISC-V
Message-ID: <ZeajHkn6dTQ3krsL@sunil-laptop>
References: <cover.1706603678.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1706603678.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_204429_157881_0C0A518F 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Haibo,
On Wed, Jan 31, 2024 at 10:31:57AM +0800, Haibo Xu wrote:
> This patch series enable RISC-V ACPI NUMA support which was based on
> the recently approved ACPI ECR[1].
> 
> Patch 1/4 is generated from the acpica PR[2] and should be merged through
> the acpica project. Due to this dependency, other 3 patches can only be
> merged after the corresponding ACPICA patch was pulled into linux.
> 
> Patch 2/4 add the common SRAT RINTC affinity structure handler.
> Patch 3/4 add RISC-V specific acpi_numa.c file to parse NUMA information
> from SRAT and SLIT ACPI tables.
> Patch 4/4 add corresponding ACPI_NUMA config for RISC-V Kconfig. 
> 
> Based-on: https://github.com/linux-riscv/linux-riscv/tree/for-next
> 
> [1] https://mantis.uefi.org/mantis/view.php?id=2433

Please avoid providing mantis link. It is not useful for people who are
not UEFI members. Better to provide the link to the PDF version of the
ECR approved.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
