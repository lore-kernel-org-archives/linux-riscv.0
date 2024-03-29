Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636DCCD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QmboRdvGgb6JELGDAPj+TgMYGfIflY9Plp3Wnv7TZQ=; b=H+nm+M13DOJzpd
	sgWiuQmOeavFwfJKTqO29mcVzn9yyXP1roBIdi17lKU8XryW2vGlh4qARXanVkxe/hIhUhkQhZgwL
	Ab78TTxqZm9oy3RdrHcY23qVs8fOrOKug9aSJ9V/Y5tgjkTNeSuZGWykxvaZbZSItL+ZyUbX+jueB
	QewmtJvEqbGXdat/F0MKmSWoXXwkwUMM1/5pv9tpnsFBgcB6+FQIT5aRhdWAOZbzpWFfPOU4ChBNe
	AllEH8FkbzzkAldrBtzBgZMw199yikwOzp2VODZLUCaiBKet9YIYj0OBKYZ4LwHcfSAvWR5Rojfg8
	Q9BGY8Sh+cOy4t43G0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGZG-00000001YWi-3pKA;
	Fri, 29 Mar 2024 18:03:06 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGZD-00000001YVf-1NGy
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 18:03:04 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-36867dfe940so7463345ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711735379; x=1712340179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdcMw9p8wYMiyXmXvRCHMMbWNQHaQ3aY6vG2uVIiJB8=;
        b=lO2RcpYbiUUmJP8++XV/c4+r2rkGLedUW48LGVj9uCGQuZNMTYzR14ycuDZTpb82aK
         +LKWg2Nc1CUgH66Y9A6yLShRhi8OsmtSml64jSq+EKIVhrsB6TmmWQfqSuqb0NCkNbZc
         mk50XDvNqYEM++oURzXG+PT7RLliRpOXDxs1BeaYeVVpypKDUNwzhvIw5ij71KALt8bi
         dBUto9T4+LikeKra00P2Wx1METDnLlwJJKFiPg3KZqZ7gtRrlkP6KiLsnsJzeyDgy+Jv
         IoTAdwQJChQj6YCrlMm5fZirJKTmuqHrD7P5YJlG2qeHSN18ptKGaXV1yqFLxhqogY/K
         ig0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711735379; x=1712340179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdcMw9p8wYMiyXmXvRCHMMbWNQHaQ3aY6vG2uVIiJB8=;
        b=QOeNK5UYv2517iFbuboRBNxa0S6TtivOfh/UBQXg/BSGNyMpSQY7I/md2yJv6YKR8x
         c7J339ezzAoNnLux6ydQN3DbO4Do7SkYn91VLkD+wasG6yydfmbiS8vfR3zDvI4knqXm
         xGWNfroTM/emR1N0KWB6C5Snm8DBzY5SbyGNfGDZwhfVzn27kI0QeUkhicWtcTaPd1/M
         0zrkYTRMxZwM9KzjyxZCIHQvaAi8eO8z9N8kzpOsLSO0TuBoOBdRjRydHO1f4klRktQt
         22FkPlKM/Bujid6RU8LlMYaVYpEMW3JsvYMayVldsSOkDkOo939vNy2/KCUGyccLVqCp
         2NKw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJ64sIovOXARKw9xGFYC3BYUXbV/JHo3R9JL1fzHnyHPbe/J0c9HxMry7OYJVF2Guvs3RMJQ0j35tkXJzyukLVe/sVz0HLBN0y+W0Q5Bu
X-Gm-Message-State: AOJu0Yzcp5TGrpVCL6vWAafuD9jW+xzhivM8C29mZqCKERrKRChZg348
	tXlJ447+sMUbg3y2/S5zOMkbOgaR+C82YR1+npQMw0nYFjUGjVfy0X60SptUnys=
X-Google-Smtp-Source: AGHT+IFqMNmDL2GVO2cyYm+vIEEaj43NPiUKo2CRXyyGfQmLknY9TtLFDSxdZDVwWotlePg1wJz6nw==
X-Received: by 2002:a92:ca4e:0:b0:366:ab6f:f6a with SMTP id q14-20020a92ca4e000000b00366ab6f0f6amr3003624ilo.24.1711735379197;
        Fri, 29 Mar 2024 11:02:59 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id k4-20020a056e021a8400b003689a9e5017sm1217549ilv.47.2024.03.29.11.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 11:02:58 -0700 (PDT)
Message-ID: <0319d84e-ec4c-45a6-9edd-a606809371d8@sifive.com>
Date: Fri, 29 Mar 2024 13:02:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
To: Dave Hansen <dave.hansen@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-11-samuel.holland@sifive.com>
 <d2c3cd78-cdc6-4a39-9804-4f30402751b1@intel.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <d2c3cd78-cdc6-4a39-9804-4f30402751b1@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_110303_384151_D669CDAD 
X-CRM114-Status: GOOD (  11.20  )
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

On 2024-03-29 12:28 PM, Dave Hansen wrote:
> On 3/29/24 00:18, Samuel Holland wrote:
>> +#
>> +# CFLAGS for compiling floating point code inside the kernel.
>> +#
>> +CC_FLAGS_FPU := -msse -msse2
>> +ifdef CONFIG_CC_IS_GCC
>> +# Stack alignment mismatch, proceed with caution.
>> +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
>> +# (8B stack alignment).
>> +# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
>> +#
>> +# The "-msse" in the first argument is there so that the
>> +# -mpreferred-stack-boundary=3 build error:
>> +#
>> +#  -mpreferred-stack-boundary=3 is not between 4 and 12
>> +#
>> +# can be triggered. Otherwise gcc doesn't complain.
>> +CC_FLAGS_FPU += -mhard-float
>> +CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
>> +endif
> 
> I was expecting to see this (now duplicate) hunk come _out_ of
> lib/Makefile somewhere in the series.
> 
> Did I miss that, or is there something keeping the duplicate there?

This hunk is removed in patch 15/15, after the conversion of lib/test_fpu.c:

https://lore.kernel.org/linux-kernel/20240329072441.591471-16-samuel.holland@sifive.com/

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
