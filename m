Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8319FC48BF6
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qr2Cw1XX29FMPPXAWA2MxyWBM+EHHEo9aygxX11elYU=; b=Jklx1aafJUdZR8
	NtBdGvU4M4gWYOBC6d3d9IhObw3tEfNsqyKsyM1eeTeQU+C6CpVw8z9rBGS+nI6ChSv5tqMLEv5LD
	5kIuwdJ+kq/yatxk51NYTVUhxbQ7fNKDRIqdMQTpllDe52/2o3i46o1z3z4x99SWRWflc8W0vQXYj
	nFTI5yef0o/XhTFKt/R1QmQ+VC+ez+EleiZyYgFcZsAoA3couAYmB2iM+dHw+9/zDiKTIJA3VzM7w
	fzXnO49bAesdfvb3HPHhBOU2sbJqogSCwlDBWaKcw6M0EK6Q05GTMUtSk3ACwWDP7Bj1b92A9U+Nr
	xC/fku9Pnr8z6ZkzV8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbhqz-00000007pZN-1Idz;
	Sun, 18 Feb 2024 14:09:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbhqw-00000007pYp-1ZOa
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 14:09:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e3e7d693ebso103186b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708265348; x=1708870148; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRGb3mX7HcgDDvjFe46dagDpGQNmLyrCz8IWS2FWblE=;
        b=LMhq5FulEvVMD5+28L0ZNR1UhHMoVCABVRebuqbhmqNumsideG4ZjRdJEvp+mB7hvP
         xh5jFSTTT8V/hkW4lPB+2lTPs4MWFYUZqckENErUF2EcY2NJ4Phc18FxUV84bol6DKxj
         JqBJYZcotv9wXy1o7DBvfzzC6lmJI7UoJuNATbdiBTc+Z+LFTHD0kZZdTqYoTGshSgPP
         g5QlRsmxvZXOqoXVIJ5vPWi8ta3YELw5YBQV7W4Vblu0Lbfs7suZ3fcwT7NO0StdWUAQ
         i/AQwQPkuKeAL7VD/HhP/bduVElZKBT6WEB0yjkbjm5nWPimjmD8qV4zkY4e/sAIQygM
         einA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708265348; x=1708870148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRGb3mX7HcgDDvjFe46dagDpGQNmLyrCz8IWS2FWblE=;
        b=BUmuOW33DfYqiOI3PkgvqRBTx5j4KJ/r3fXVl6MSjnzmGjD20/BSyEGGoNmwErMqB6
         Nc3w8SQMPJ1oW7tadfgbyLVxqg+y0EYZGVyXXr4aCKLNo52FgXI+hgnxMP44ZZkHHGnz
         vU/t14z0Ml0ymTfeTZ5mVU+oEuJHCvL1QAM0oors5VdpDSY7ZMaKU5HzMMpgvIhXJKsn
         03awrvq84gUOeZTuFE8ya7jqGkBD4I5PQOSi3pRGQa1oTwAvS8AiB2YxdBXfEy8iWBzW
         9QUXxDfkwGPHa5bz5rCZL9P0p+GUzdN0GgMlufAVSGYAeK4jQSe9xFHJHCq8w9TfNDLA
         Hdog==
X-Forwarded-Encrypted: i=1; AJvYcCWSp0briqW7wLRW7fly7luS4gGaBsxZ2+xSV8/F8XkGqVtrUPh2uziT61rrHSzEUZBNzui082bghlEXzmMbtVwBkaDnEHwkAhQvN2eipJ/S
X-Gm-Message-State: AOJu0YwgKv4TOLzyOf3WvznrKX4IqOpx1Tu/EYsw+ESoZSe6YV0ywN5E
	st/il5Gn9O97+pdngpDLjR/hB012ny4rHImseabJN4GhEfwWrFg2Ympa2GJTk04=
X-Google-Smtp-Source: AGHT+IGZueP1XhtEkxOygwlGosvd1hAAIICkpyELEX/5HlzrfzCc/ANAAbrp0uNstOSRE3cqH8XXRQ==
X-Received: by 2002:a05:6a20:6f07:b0:19e:5fe5:ff98 with SMTP id gt7-20020a056a206f0700b0019e5fe5ff98mr10072947pzb.52.1708265348435;
        Sun, 18 Feb 2024 06:09:08 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id y5-20020a62ce05000000b006e2dde36edesm2783886pfg.120.2024.02.18.06.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 06:09:07 -0800 (PST)
Message-ID: <d947f326-e527-45aa-ae7f-bb5a18efa399@sifive.com>
Date: Sun, 18 Feb 2024 08:09:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v2 4/4] riscv: Save/restore envcfg CSR during CPU
 suspend
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-5-samuel.holland@sifive.com>
 <20240213-86af3b49821630b5bdd76c0a@orel>
 <937f0593-0bc8-4df3-aa0e-9059acfd7636@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <937f0593-0bc8-4df3-aa0e-9059acfd7636@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_060910_634967_9F68ED75 
X-CRM114-Status: GOOD (  15.88  )
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

On 2024-02-13 11:53 AM, Stefan O'Rear wrote:
> On Tue, Feb 13, 2024, at 9:49 AM, Andrew Jones wrote:
>> On Mon, Feb 12, 2024 at 07:37:35PM -0800, Samuel Holland wrote:
>>> The value of the [ms]envcfg CSR is lost when entering a nonretentive
>>> idle state, so the CSR must be rewritten when resuming the CPU.
>>>
>>> Cc: <stable@vger.kernel.org> # v6.7+
>>> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>> ---
>>>
>>> Changes in v2:
>>>  - Check for privileged ISA v1.12 instead of the specific CSR
>>>  - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s
>>>
>>>  arch/riscv/include/asm/suspend.h | 1 +
>>>  arch/riscv/kernel/suspend.c      | 4 ++++
>>>  2 files changed, 5 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
>>> index 02f87867389a..491296a335d0 100644
>>> --- a/arch/riscv/include/asm/suspend.h
>>> +++ b/arch/riscv/include/asm/suspend.h
>>> @@ -14,6 +14,7 @@ struct suspend_context {
>>>  	struct pt_regs regs;
>>>  	/* Saved and restored by high-level functions */
>>>  	unsigned long scratch;
>>> +	unsigned long envcfg;
>>>  	unsigned long tvec;
>>>  	unsigned long ie;
>>>  #ifdef CONFIG_MMU
>>> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
>>> index 239509367e42..be03615486ed 100644
>>> --- a/arch/riscv/kernel/suspend.c
>>> +++ b/arch/riscv/kernel/suspend.c
>>> @@ -15,6 +15,8 @@
>>>  void suspend_save_csrs(struct suspend_context *context)
>>>  {
>>>  	context->scratch = csr_read(CSR_SCRATCH);
>>> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_Sx1p12))
>>> +		context->envcfg = csr_read(CSR_ENVCFG);
>>>  	context->tvec = csr_read(CSR_TVEC);
>>>  	context->ie = csr_read(CSR_IE);
>>>  
>>> @@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
>>>  void suspend_restore_csrs(struct suspend_context *context)
>>>  {
>>>  	csr_write(CSR_SCRATCH, context->scratch);
>>> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_Sx1p12))
>>> +		csr_write(CSR_ENVCFG, context->envcfg);
>>>  	csr_write(CSR_TVEC, context->tvec);
>>>  	csr_write(CSR_IE, context->ie);
>>>  
>>> -- 
>>> 2.43.0
>>>
>>
>> We're still exposing Zicboz to userspace in hwprobe when only
>> RISCV_ISA_EXT_ZICBOZ is present, which will be the case for anything that
>> either doesn't implement 1.12, but does implement Zicboz, or maybe does
>> implement 1.12, but hasn't started putting Ss1p12 in its ISA string yet
>> (e.g. QEMU). We should either stop exposing Zicboz to userspace in those
>> cases (since it won't work) or rethink how we want to determine whether
>> or not we have envcfg CSRs.
> 
> opensbi treats the existence of menvcfg as sufficient evidence to prove that
> the hart supports 1.12.  I wouldn't object to having Zicboz imply Ss1p12/Sm1p12.

Zicboz implies menvcfg, yes, but I don't think menvcfg is sufficient to imply
S[ms]1p12. It's entirely possible for hardware to implement menvcfg but none of
the other S[ms]1p12 features. Or it may attempt to implement S[ms]1p12, but have
some bug that prevents it from being compliant, and therefore prevents declaring
support in the devicetree/ISA string.

What I think might work best is to have a cpufeature flag for "has the envcfg
CSR" that doesn't map to anything in the devicetree/ISA string. Then Zicboz can
imply envcfg, and Ss1p12 can imply envcfg, but we avoid any possible false
implications going the other direction.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
