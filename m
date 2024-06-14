Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F533C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XZ7RUTU2cyjAOOOGxOUrXGlMcS9+INuNdbNvWwnk98=; b=AxHc/SjcJKajRH
	dXI68Uuz0VPEX3sepNui7m89Q+/Q9SNMGSAXeccZR/XLUdoQUOe1+NuSWPUswExwypoHFEk84uIds
	h27HPwxnPw5UzvAW2BwIz9ZnW2l+Ufi2A/5A6BnX4kMidnmFgMu10f+bUBEt0C1Jf6efZqqVWm4PX
	OJ4BNdxVWA2b6Qgh9wyd4BDarJ7rsyay9sV5i++XzREzD4ywWhxYbXpmE0M+3GRDEipRbCdMESQ64
	NFNuxp2Ba85Y+zwi5l49+ljRRMRsmP9LjBiX6jBx57IlxKf/G6uZPlsbIZikNh+wKJXBEa/0vS8Xu
	F3u1HT6IokWo2USF/8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7uy-000000031lY-1Fl2;
	Fri, 14 Jun 2024 14:28:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7uu-000000031kr-2HMA
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:28:38 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-6c4926bf9baso1880901a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718375315; x=1718980115; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+AS47E60QeHhUZsqoLBw7psRgmmP43ASuDhPpTTvN0=;
        b=y1h5l5YATct3jfaM/zH3i6Tsva+iFT7k1bneFSf64dKpWxzCJ9KwuP9UcNsZVPNEVt
         hq4fydEGx2BoBs8xiC46BkkrR1N2ZAhojIwExAd2PF051r/FzKANqn5t1DbSTgzOCwyp
         r70jPTlOAOuhspx0mT4dF2qirDmuJDKs3LSvYWaVjpzZqChqcyB+ijerHQolgna+4MSS
         vm8MP6JdtcEUsHwTnm80r4Iuip+z8Svzb3B9lY+cJZaMTskLl2ML1brPqRcFYw/BTfqb
         2AL3FoVrx9a7MfjKqLezZ2KQByH2HUcvBOL/2Yt6cxFwaE1e5YgpkgY+JLjeehcImhsO
         HVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718375315; x=1718980115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+AS47E60QeHhUZsqoLBw7psRgmmP43ASuDhPpTTvN0=;
        b=fpseAob7pPC40QcuGmTRqvHt9bvT3OYoC9vvcmaoRfnvzdHKqrT3f089Hie5GNOR/w
         jo7Ho7KG7NmOOy/pU1cCf5dRKZpTrpcZw8LMEZYYYdBwpIK01JfbxEtiUXBkM73SvmFz
         cc9DJXbweF6Gi91WVO7nmHlRAGXxKFjEnB516BGU5iapdWNKC4krhb+Eq8JWmgb1c44g
         ikMTEnjcbya1ywVggw8vYhQCV3RdOM8+SCck6gl+VHRW6+uzd5thDtf9Qvya2vZbg3xv
         koCnsPQDM8xNoyb/kjn4qpjlhXtQHvvcB94/mLh5nbK3pIksnUNgxRLizfZXv9fCUfOp
         C+Yw==
X-Gm-Message-State: AOJu0YyGfRH20v+xM/CQHGO7FkAChSezQkFGmM0apml6lb23hlNn0hij
	sLWgWq6sq3i3XoGm1n848aI1D9u+lAj12LawYwgrATeSB7eRSbC0uNECcH4BC/E=
X-Google-Smtp-Source: AGHT+IFlCjL08b27lesj/M0GSbfgPmaNXoKZh84hCGeFfyGBJsLwWWKLF7r4KbtLWMpGVc+/CtaW+Q==
X-Received: by 2002:a05:6a20:4314:b0:1b2:5baa:7acb with SMTP id adf61e73a8af0-1bae7e14cb3mr4139421637.1.1718375315129;
        Fri, 14 Jun 2024 07:28:35 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm3211617b3a.19.2024.06.14.07.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 07:28:34 -0700 (PDT)
Message-ID: <acb7a467-fc0e-4f32-8410-cd7aafce8bae@rivosinc.com>
Date: Fri, 14 Jun 2024 10:28:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>,
 Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
 <20240614-viral-dinghy-71d5f6585a55@wendy>
 <20240614-distaste-negligee-ba9216a8684e@wendy>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240614-distaste-negligee-ba9216a8684e@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072836_729314_4BEC19A4 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 6/14/24 04:40, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 09:36:55AM +0100, Conor Dooley wrote:
>> On Thu, Jun 13, 2024 at 03:16:13PM -0400, Jesse Taube wrote:
>>> --- a/arch/riscv/kernel/unaligned_access_speed.c
>>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
>>> @@ -19,7 +19,8 @@
>>>   #define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
>>>   #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
>>>   
>>> -DEFINE_PER_CPU(long, misaligned_access_speed);
>>> +DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>>> +DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
>>>   
>>>   #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>>>   static cpumask_t fast_misaligned_access;
>>> @@ -268,12 +269,18 @@ static int check_unaligned_access_all_cpus(void)
>>>   
>>>   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
>>>   		for_each_online_cpu(cpu) {
>>> +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
>>> +			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_VEC_MISALIGNED_FAST;
>>> +#endif
>>> +#ifdef CONFIG_RISCV_MISALIGNED
>>>   			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
>>> +#endif
>>
>> Can you IS_ENABLED()-ify these two as well please?
> 
> Ah, you can't cos the variable doesn't exist in the other case.

Yeah kinda just dealing with how it was originally written ideally we 
would use IS_ENABLED. I don't really want to have a 500+ diff patch
IS_ENABLED()-ifying the original code as well. I can do that if 
necessary though.

Thank,
Jesse Taube

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
