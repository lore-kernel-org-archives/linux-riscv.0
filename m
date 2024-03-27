Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B76C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 22:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZycPZ4YK7zJqnkol8McQmphpmOFwg/ga8IvUE3uXUfg=; b=Ba6Cw3Au7pAYf2
	Zj3Ic/gVB9Kqm7MQ7LUpwr6F6HNKbhzYkwp6tj43RzIbl+5qaFg9SOtoRAiLJ/i97glvtdgzoe0S7
	hHW6gAPCpRuCdF6eA3SV2Rt6goWL9ErKKkELpjut3ZO98HuaJMLUWCDiXK/0hqGjJ9IdXaI7/hawE
	MGg+dsT+lQhNTxLUfmyE9BpYuYa8/B2gJa2wRXZia+4gEP8HWLUSzcN6aCL27Plz7tROMK52aq+8o
	0MLfetrkHZ86kispZAnMX6GuxMDK3Emvfy4s8RKx35ptgiEQ2QJs3J3uFUMXJWGcNGZ90/wbQn033
	h6pdQ6IBL6tLfx3GH+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpbRe-0000000BMBV-16gR;
	Wed, 27 Mar 2024 22:08:30 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpbRb-0000000BMA2-1BeW
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 22:08:28 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7d05dc0709dso12718239f.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 15:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711577306; x=1712182106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bmkqc/3aYewIsupa3aI44uZjMZk6uVE6sk1O51xM5oE=;
        b=dB3ZWhhU1tiYflMf9DS9RcAnulk1eNVZuxDOFVkW6B9N4EWgZXW5j1CUNHBNhKXTfK
         ovt2nTNNsLjlhDf+R2Lw40kshH5ERAa2+VfDy6M8V0K680OET9XDZ7GZHOcn9Sx9dHf8
         qs1+vliGvTs9cNXEBTHwvu97qAwmpns+S79Q+6aoI47Q7IayeLW4yc8Om7gI764VedBo
         pzyii9mm4eXH3W2W7F3GDMSuAQ1NDMWyxLdOEypKsPWuEtRlLoUPefUuem/3Nt3HiRX0
         vAg4Scv49V5KhwG5HhtE+G91of1SurBYmM8napBh9HuBNOuUW6/ntYFHvIYrzPu9Sr76
         PV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711577306; x=1712182106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bmkqc/3aYewIsupa3aI44uZjMZk6uVE6sk1O51xM5oE=;
        b=gg6Kt+KnCRN0rv4+e0K7QUWI6HoBiPJx2DSEz9XuDzNr7VSyXSnRsNZhGS06GdmrW0
         HyJJC3uyFJWQiWeDQeQ4/kikQW63HEGqX4oCbyhbUzhjWaUhaAu0J5SjAYiPdPwnjORb
         BOfxuOfhHiPqc7PFP43nv0B/YS0ufDyuiveog2iVb8ezzbsp25W1e8c3hzBZeQWwW8Co
         E1fkP7aPTt/pzX/SHDzDChAcaCDcaxdBvnN7FPqhuS96jymEKuvoNdI6OiwS8mCjqpcK
         Z4/Q31u+1XSucVmBJVA5SaJFjhLjGm3fSVSIygYyhu+AmQKJGg1P7j/l6Gvw8t6pk4Ic
         +i3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOykdjpM8ZLTUgdoSfLcr/3FIA3mcMEm0urnsxq5TQx/LNnjTG2uF6RFvxiy/9LJmjU4OxQwadgdcBJCtZScZQhptvvRK/w2FKCKp/M7kF
X-Gm-Message-State: AOJu0YzpqBgp4efb96hrROTYBsWgXK0PVSXa4y1sJDjUZRnBbpPe+0E+
	caT57OweXrTy7xFfZIpw5ZEmRLsAlI2emqRGsiTDUctxDwgQyZrco8nzd4vrKEg=
X-Google-Smtp-Source: AGHT+IGUYm3Y8wBDca1kE2cHOU4Wfjx7H338gBLx60QGaDb6jbN+3GFHHCGUs0OMGF33wA7wIsUyRw==
X-Received: by 2002:a6b:f919:0:b0:7cb:ffd8:1546 with SMTP id j25-20020a6bf919000000b007cbffd81546mr1424618iog.19.1711577305709;
        Wed, 27 Mar 2024 15:08:25 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id f12-20020a056638118c00b0047bea529fddsm2373jas.104.2024.03.27.15.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 15:08:25 -0700 (PDT)
Message-ID: <4d9633cd-15c4-4cc1-ac67-2592e9fc7880@sifive.com>
Date: Wed, 27 Mar 2024 17:08:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
 <20240327200157.1097089-13-samuel.holland@sifive.com>
 <20240327142516.e4b1f9ba6e2ec7bc300e4d58@linux-foundation.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240327142516.e4b1f9ba6e2ec7bc300e4d58@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_150827_553350_015A7ED2 
X-CRM114-Status: GOOD (  14.01  )
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

On 2024-03-27 4:25 PM, Andrew Morton wrote:
> On Wed, 27 Mar 2024 13:00:43 -0700 Samuel Holland <samuel.holland@sifive.com> wrote:
> 
>> Now that all previously-supported architectures select
>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>> of the existing list of architectures. It can also take advantage of the
>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>
>> ...
>>
>> @@ -87,16 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>>  	WARN_ON_ONCE(!in_task());
>>  	preempt_disable();
>>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
>> -
>>  	if (depth == 1) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +		BUG_ON(!kernel_fpu_available());
>>  		kernel_fpu_begin();
> 
> For some reason kernel_fpu_available() was undefined in my x86_64
> allmodconfig build.  I just removed the statement.

This is because the include guard in asm/fpu.h conflicts with the existing one
in asm/fpu/types.h (which doesn't match its filename), so the definition of
kernel_fpu_available() is not seen. I can fix up the include guard in
asm/fpu/types.h in the next version:

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index ace9aa3b78a3..75a3910d867a 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -2,8 +2,8 @@
 /*
  * FPU data structures:
  */
-#ifndef _ASM_X86_FPU_H
-#define _ASM_X86_FPU_H
+#ifndef _ASM_X86_FPU_TYPES_H
+#define _ASM_X86_FPU_TYPES_H

 #include <asm/page_types.h>

@@ -596,4 +596,4 @@ struct fpu_state_config {
 /* FPU state configuration information */
 extern struct fpu_state_config fpu_kernel_cfg, fpu_user_cfg;

-#endif /* _ASM_X86_FPU_H */
+#endif /* _ASM_X86_FPU_TY{ES_H */


Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
