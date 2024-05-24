Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6169C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgHKC54W8AeGUtjGdVgEA8zSsuHtLdzdunnLx0J9wXg=; b=DW0IuCEUAFbVWx
	kYrrQWRGGVrtXDmoRf6DeYngQN1Eb8I1H8j0ErdoANWmSX89EwEMGJJ5eS8fJ560fXQ9dK50YFjd2
	V/U1r0vKVV1y6qwVSh6+YUS+2AEoFi17Qhzg7JfN9XHTDilnNaCy5dpwMo0GkLbvtG2qsHfp7YFpO
	9FaCK/uIadBs6/veTdAldhYmeWwvEUeow82P2B7sZITdO3nPFO//yxdkG16S8+Mzm0rGmESnt/HsN
	kutNsIgkBji1neqDcKjqtzyeQHPVNOh/7P4+BBQwlkqcX3DX5JzPbl0+eSDFd+KMAhlLiwkyV8/pB
	wnax6Lua/uzzuxhhVAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAbSe-00000009nVY-31BJ;
	Fri, 24 May 2024 20:24:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAbSc-00000009nUx-0EBo
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 20:24:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f082d92864so134226355ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716582254; x=1717187054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rjNgYx0LS4/kjUZ+6MEdVkZwT2zxa+2G66XS0PLZCx8=;
        b=c8Zf5uxsadG3h/MInOSnbhN0uCpvp2q7JcxWt2yPNzyjonCqoH2FmBXTmQNzL7aynK
         KBfF7j+sYu9141OLrr/64f+Gej1/oz7BWbdNRif8UsuWTtBRCpy8kgcnZzHBMyi9VwOK
         O/X1UjtpNiUp19GOE8nAzcR2q0GveCVsGOUbUG2+r8cvL/PKirjj5GYJLPtVxvpOHOdM
         E/LNeFaSlpBY9EgViQufoKf1Od+3Ze72YaXHz37nFjdCg+5MYHnEY83x+tA0mCk/vOBA
         A6xyY0cOyO+xrE29swnbyLrGg8qco679SZXmIiDNgVAnoKf/On5k54pVnuK572MWtvEz
         9nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716582254; x=1717187054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjNgYx0LS4/kjUZ+6MEdVkZwT2zxa+2G66XS0PLZCx8=;
        b=bbzYuX9ItxdBZZXZCASzA/5vhRg71cEyoRN1+uSmvexNkvzcHwTXYeIFCQSgeH6dn3
         ssUc1WdYkp6kRA1UGDhluTudSQWJdFz4m/mow4YVa5OcbcoDLuiXSzsi0fn/Ss9+7JtY
         ipp0i6XUU+e/GBrZbnYqHAUeIRNrxnPZx1KnnT1B1jpt+WdMy2iljPAp1uVBN5zDfgsC
         mjcoYWP2qnilPrQPTEQrnL/wooCqYLgWZETbtIlS0RElv7wkBYibK2NPpWcEHqCx6tdV
         TCDrpz+wVsCAWE4KZr5Ux7WFw/T0Dfskl6ZLoo+N6foPJPUvN4CNdzcRIAkh+8NBQ8mZ
         4PIA==
X-Forwarded-Encrypted: i=1; AJvYcCUFfJL4T2RdpvYCeNuTGbm32PqhdEwBPAnKPg/RjNmU01HXO0S/hbjNT6Fm2kNXybvY7vX7j4LqLsHYO5K18RGW14btPSqnp7zeBSDW81uR
X-Gm-Message-State: AOJu0YzViCIYtaZJIle0Qv6qE6XoJ7eJ22qpvyUkd7n8toPn57s1V7Um
	aTj3X1U4KO7NPceCPPU8XVJjVUcJ9YnnIBZ1wcuLE+l5FljjWuH1
X-Google-Smtp-Source: AGHT+IEsGTXGcl+nT3WDZVUBNccpstdx6wdfVQd7Gd/Sf56hQgRvC69lFPyZsX4GBaOyAbfxLOAVkA==
X-Received: by 2002:a17:903:5c7:b0:1e9:9c6e:9732 with SMTP id d9443c01a7336-1f4486e145dmr30237085ad.19.1716582254066;
        Fri, 24 May 2024 13:24:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7a4e84sm17877145ad.73.2024.05.24.13.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 13:24:13 -0700 (PDT)
Message-ID: <c9a5c36f-3253-48d9-9258-c657e0e0ba04@roeck-us.net>
Date: Fri, 24 May 2024 13:24:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to
 function 'riscv_ipi_set_virq_range'
To: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org,
 linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, linux-riscv@lists.infradead.org,
 apatel@ventanamicro.com, anders.roxell@linaro.org, dan.carpenter@linaro.org,
 Arnd Bergmann <arnd@arndb.de>
References: <mhng-44d7a1c7-c15a-4077-ac94-23985f686474@palmer-ri-x1c9>
 <87y17zc88y.ffs@tglx>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <87y17zc88y.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_132418_190326_5DEFB0BC 
X-CRM114-Status: GOOD (  14.24  )
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

On 5/24/24 12:36, Thomas Gleixner wrote:
> On Fri, May 24 2024 at 10:35, Palmer Dabbelt wrote:
>> On Fri, 24 May 2024 10:18:42 PDT (-0700), tglx@linutronix.de wrote:
>>> On Fri, May 24 2024 at 08:10, Guenter Roeck wrote:
>>>> On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
>>>>> as a conflict resolution, which IIUC should happen when Linus merges my next
>>>>> PR.  So I'll try and remember to call that out.
>>>>>
>>>>
>>>> Unfortunately it looks like the conflict resolution did not happen,
>>>> and mainline builds are now affected.
>>>
>>> Fix is queued and goes to Linus tomorrow.
>>
>> Sorry I misesd this.  The PR I sent Linus this morning contains my fix
>> from earlier this week:
>> https://lore.kernel.org/linux-riscv/171647463438.13050.6219786365640043025.git-patchwork-notify@kernel.org/T/#t
> 
> Happens. I don't rebase my try. I just mention it to Linus when I
> send the pull request. It's the same change so the result is a NOOP and
> not another conflict :)
> 

For my part I did try to find out if a fix had been submitted before sending
my note. Unfortunately I missed it. The problem is now fixed upstream.
Sorry for the noise.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
