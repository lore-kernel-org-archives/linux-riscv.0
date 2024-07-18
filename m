Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6FC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKCXKqfckKTYdANvlEVuuv3QRrUwfPH91/ob9vrOCfg=; b=HRi62CdmcrPB3I
	bshBwT5E+rvuzyKSJNwMt3MMxhxszzLhLGeoyNzpDXQOm7Gq3Dolwd80pxoXSa+mPlCFN5v6xi716
	97AunrFK5hh+zsfQ5MU5XYDhXajHSibuf4w+gfFSDBt2XSGnuw3YL0YnbNpDpgcpmXA9IpmnLbso+
	rw2N5aAiGcc563OvZtmea+JEYlZ6DGcGRQ2SeDnbdJArLLODhLqLjNDQBqvHQksEw5OYXH139maNj
	qYR2G5YwzS9s1Ddm8RU7w5CVagnDLvWhsA4xK6smgoVnIZX80KBjgvMpirKd/JeK0DCNaVv2YGj7o
	aq2o5Z/WLDe2z6G/Dsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYxF-00000000lo0-2nCE;
	Thu, 18 Jul 2024 21:46:25 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUYxC-00000000ln8-43fm
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 21:46:24 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7eee7728b00so51088639f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721339181; x=1721943981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/3KVXgmf69sNo7YCAFBU75fVyP3kLvsv8BGm2iEjzc=;
        b=mk+pEd8WV8W3KnbqxV7AcMnLMWPhbbib0KtXzuDZygdr0KRuuFc/k86ZobbUwwpU+V
         Jhz9Kt7Vttvsxl4SRRl3StNGRV5SrwyZ8lt82EzjPKqHZh1hAArIJ7Tt0yQowb1G9QIi
         yvvM3RGLBF+ykUM1rEpPJ3cb+FZaRhSIvUR2zlWGCjckrgt/NTDWCHlqRDtDPgC6+KVq
         TDVhD94QWkDCfc4haJXy79XQZZOYomu5o4begscTYUzyaNaWQNqY6+DnxeTlHJPs422Q
         Jy39hHk+H8OfYlGTQxeW2As+adTk/iHU04ORiVFQ+K/UmTQo3hhT9a6H6VCbqBa23emy
         UovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339181; x=1721943981;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/3KVXgmf69sNo7YCAFBU75fVyP3kLvsv8BGm2iEjzc=;
        b=dRsUs51UhqHvIA9UNQx5UYrA50oWGfjKKQQg/880CxAEeOOR0VPcckIysRK1R5BmNg
         pfyXGoj2Wnmtsi+4YkMpnw81/RcRq30AxkZtNCuf5yinITy6ru/xmhpJP78vL7PD9yOV
         jtQh1FGLiMhZDwHW41lo5B6nBLJyRVLaUj48fjonp1kS/cCGqchpMgEugf4Bj2m4bF6m
         5ad+HLhLehT5nfU4alqGYvLHCeHGr9u5kLdtyrnTMcEqUNbsTglW9Co6ZEak3go3NRRJ
         ynVnfaQ0NyNTOjGpII2Far3gCNhLSd9wLAv7+Njyp/j5R3kWicUYJuTP5LrLTnbv27Ud
         AmKA==
X-Forwarded-Encrypted: i=1; AJvYcCWS8fUITyHL7Rr0zCPoOia9s0FThHg+c7qM2Wj1SEAOaDiIgxwLnnC+D+n3Gxa6/9qp6cHbOl2+n/4fyjii3d2DVJffApzKj+DJ6/Fxt/BA
X-Gm-Message-State: AOJu0Yyn6DgHTDyDNI8GJfNT0MvVplq1T1VPAYpRP5hEM/BpOgVD5oil
	bzRRGyOlfTJqXDVXAU5Lbt3KWYGizJ8jbHlsxrH5upJoejFIKf3ZBXEYQCjxjEg=
X-Google-Smtp-Source: AGHT+IFfmYe/UsMSfgkCsdMUFOYZdCp937Ia8bMlaDCUPuHT0PtpOJmSb9jac6FVvVir80F2WXRXbQ==
X-Received: by 2002:a05:6602:26c7:b0:806:7f5a:1fb7 with SMTP id ca18e2360f4ac-81710605dacmr801576939f.5.1721339181354;
        Thu, 18 Jul 2024 14:46:21 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2342f164esm35433173.69.2024.07.18.14.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 14:46:20 -0700 (PDT)
Message-ID: <8b402e92-d874-4b30-9108-f521bd20d36c@sifive.com>
Date: Thu, 18 Jul 2024 16:46:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] mm: move numa_distance and related code from x86 to
 numa_memblks
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 x86@kernel.org
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-14-rppt@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240716111346.3676969-14-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_144623_071404_33D3E873 
X-CRM114-Status: GOOD (  11.77  )
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

On 2024-07-16 6:13 AM, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move code dealing with numa_distance array from arch/x86 to
> mm/numa_memblks.c
> 
> This code will be later reused by arch_numa.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/mm/numa.c                   | 101 ---------------------------
>  arch/x86/mm/numa_internal.h          |   2 -
>  include/linux/numa_memblks.h         |   4 ++
>  {arch/x86/mm => mm}/numa_emulation.c |   0
>  mm/numa_memblks.c                    | 101 +++++++++++++++++++++++++++
>  5 files changed, 105 insertions(+), 103 deletions(-)
>  rename {arch/x86/mm => mm}/numa_emulation.c (100%)

The numa_emulation.c rename looks like it should be part of the next commit, not
this one.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
