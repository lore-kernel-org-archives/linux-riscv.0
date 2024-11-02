Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16018E67809
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQQeDnxgwfH+/725ophZe1xQQuB9nr3jkTFB6T7Dlt4=; b=KTEi0MgmbAxffS
	mp3QYFNReL81DU26fovcc3y0lwXxVnHyReSsgO5Lw3QZ8QlQYbK7VuHtfJ2Lc3ZWl3H+9pH4i5GXE
	SEKk1H8YlY4rrWmuuouP5eZ/r9VeRNv3SulDrFKsbtYtD6sfRHk/frrXiMBgPv0bjKEuIth/Pn4J3
	rph1dEsFLd4mhxEoHb3CeWaryOdckvGKDYXjSBybLieVmjb7Xo0k3tRyz9OYQCrOr1OqJziDWIpkA
	8pL9hcCtR/tR9pikPp7nPMklASEaQ2mvFWQZOIE7ZzyK31p7qmwH+EmcawI6Gr0LXAllmQMRMzhP4
	L4LwuDAB1j6pB6SCuduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KZX-0000000ALwT-1VOn;
	Sat, 02 Nov 2024 20:18:11 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KZU-0000000ALvs-36ND
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 20:18:10 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-83ac817aac3so122445039f.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730578687; x=1731183487; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uv6c+k0dm8ixfMK+kRUbChJ5vy9Z65ImLeSVIElSlFk=;
        b=R42MIOmoEj1rCIlJ1vRrWs9koldoN4EQ12Db45IiJbFu3jIvTCTGzgao829k2BswLj
         Qws6MfATnnPKF6lhsjoNeY98QJMKsYDUfW3fcvg8JqNfkblzYtQi7RHSPHyvpf/lW1Bx
         VGRmLEnSd5zG1schvR742fJTZsXmfKWHe3+f/yaP94aQZJIhdmLXfSpa9X58HslS8gwE
         lQRobZd505lDtLKeA+EpZXTfvVCC008zkuRLt2nNrfkZYPX0OCZC+DHo6kChIligAAT7
         Ba40hv8eAB84pO0/i2N87c0OSdDOQjzN5OcDT1Hrl2gE1sh5bsdcYMm9M14yjVG7MOnM
         qiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730578687; x=1731183487;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv6c+k0dm8ixfMK+kRUbChJ5vy9Z65ImLeSVIElSlFk=;
        b=I8CPVFrdIwixAREzBH/uzKz0dcJkrMmcp5ZAbVhLtL6Kwzwws+grwRgPQa8yMi7eSn
         sEpTSAjj8A7Ltee7jbuFJX7Hi4RNbV494rYAzCznHrpQikKwrr61RgrWgwMhuzf7KPb9
         xfed5jcZDFTzmDjr1zWQEVY/qzx8d+EClKBee6ssvVSciOEgdgMyjLsppwRJqq9bwxoF
         8gf8g/HL7p7EofvoaNCNCORvaJwoFMAX31YqgpdiyRrydxzh6kDIFjWk+T2J4ybYToUc
         9s2It30Sdl+4RkwKUUS6UVzqoOr4E1j2AKo+UHGiYmkRY7DfDkNNTsc5N9fQNcJRiUTG
         3BmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWomXClmdp18GmvtjseT/bYkA83Min4iRTs1XRQ+h9JTaiXEyCcdhCz6La3nNnMxAAZyf97U9RjnnRH9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvkMcehayhiyp27cToM18PhuWfmsSlnN4hn2pWKTbbWrk54Cku
	vvmAQ+Yar+rbXUrHOE0Uo8MQWTo3eyaVm6tpqRvnBUptQ2eYCAYocuNoIeLwxpE=
X-Google-Smtp-Source: AGHT+IEJc+EiNFpj9B5V/ByTf51tnyN0Vtl+t+p6pQirqCmqUqbkma3bOQA4lF2nU6yG6Loqga/zcQ==
X-Received: by 2002:a05:6602:2d8d:b0:83a:97e7:8bcf with SMTP id ca18e2360f4ac-83b5676f6c7mr1760042139f.11.1730578687159;
        Sat, 02 Nov 2024 13:18:07 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de0497794asm1274337173.88.2024.11.02.13.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 13:18:06 -0700 (PDT)
Message-ID: <9617eb4f-842d-4678-926e-478471de479b@sifive.com>
Date: Sat, 2 Nov 2024 15:18:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] RISC-V: separate Zbb optimisations requiring and
 not requiring toolchain support
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com,
 Andrew Jones <ajones@ventanamicro.com>, pulehui@huawei.com,
 Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20241024-aspire-rectify-9982da6943e5@spud>
 <20241024-chump-freebase-d26b6d81af33@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241024-chump-freebase-d26b6d81af33@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_131808_816570_89E323FA 
X-CRM114-Status: GOOD (  12.94  )
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

On 2024-10-24 5:19 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It seems a bit ridiculous to require toolchain support for BPF to
> assemble Zbb instructions, so move the dependency on toolchain support
> for Zbb optimisations out of the Kconfig option and to the callsites.
> 
> Zbb support has always depended on alternatives, so while adjusting the
> config options guarding optimisations, remove any checks for
> whether or not alternatives are enabled.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig                    |  4 ++--
>  arch/riscv/include/asm/arch_hweight.h |  6 +++---
>  arch/riscv/include/asm/bitops.h       |  4 ++--
>  arch/riscv/include/asm/checksum.h     |  3 +--
>  arch/riscv/lib/csum.c                 | 21 +++------------------
>  arch/riscv/lib/strcmp.S               |  5 +++--
>  arch/riscv/lib/strlen.S               |  5 +++--
>  arch/riscv/lib/strncmp.S              |  5 +++--
>  8 files changed, 20 insertions(+), 33 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
