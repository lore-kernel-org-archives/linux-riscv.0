Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F117BC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 18:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkniM+/ifF+iC571SL8hqzbVYj3vnNDwbKUR/V/mOX8=; b=N/miVI1MknTCB7
	EUgbLglOzf967LsBWBrqLOrK/zwBdrTM4ybKjU/iamh71fftGL0LuTvE/WV0V6awaEd9vsA3x8O0I
	KsOQP6fOD4MCDnsBQ/3SjYy2XAnXRbSZzWsCM031DyNtME/OmZH/cGTBeVvzw0jeUBh3UwXIE5zkP
	7ZMkTPZhq5q6M0GuHryYFgIHc33OkK/2tRP+jja2loS+COTxlAhBU7VzCUzgrL3eEYh3LM4CbnMwH
	+ZCamQS/yUaA3guB+uKLJLbfL4ZTjpReiJFShsUx98abPY2swBB+jvEMg3lbY5J5nsoSphKJvt2VS
	Z9A9em8b6qFb3W6sShug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2Xo-00000006VCG-2MtG;
	Tue, 27 Feb 2024 18:51:12 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2Xj-00000006VAj-0SUp
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 18:51:11 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7bade847536so264665539f.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 10:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709059866; x=1709664666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drJreYx4pAFp2nnVZ0PvEgVW3Uejo7zf3o/ymgjKE2M=;
        b=WAyg4eE25O079j13laNYCnKnjJJM+MLDagLy83Icg+MZPd8mT5+OQtuBRDgr0PdVmr
         /zPRcHBjRDmNJ2YyeoQhrFn7zPRYdoWWmGlTUzR5kwq6SUShW7MTkUFBUGyY6NlLWZGd
         +yex6qjj58k6VglxbiKhdnQ/4BU6XWE8tE1lYnCrwIxRnLD4Fc/6eimfPH9LDK7aaY09
         4BuDHfxoYvJrx+F7mQGPwfmQibUWibmKXCKd+fp+1puY81baBJ8a/9ZPNIeyAnJVye8A
         smJDNZFX5oqT9oe//x0iH0Bh2rIHsRa4l0Yk4XbvtPTVtUIsgXrgmEBrohx9NN3Rqhna
         fgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059866; x=1709664666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drJreYx4pAFp2nnVZ0PvEgVW3Uejo7zf3o/ymgjKE2M=;
        b=F8vBUs2b6AV6EaEi+tpq6a2+szuer8YymvtSMSfo/YHH9mDZnZZlpA0PsVO3jEp9d2
         ehWslK0ctIrK2fBbcYfwhG4e01lxWqfiuhBybUxMwGiX6iIaWQtL3733KHEh6K222nAd
         7qIp0FvNkWZ7vyccVOzGx0n1vYNzrs/BsHRUru4w2kt9oPEUsFqD34/P7YemyDwgicgo
         bbZha2dmpDV8QYkKXYDpIwBDVM1iGFDK6em8TuiA9A9TZor56zXjv+3SeLSQMRP2uVCF
         9Sy8kYi/9CMOQxo5xjXe7XZUNuP3FY6vs0QcWJqiqL9jEDKDznlU5EkaX9zEm17h4IS8
         JQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCVsDGUzsYY1ZdMZtYt1x+FYLM6x0hhIbfp8Xdh02uyXk5B4Yp9kztA7MYY7Zvz+BXMq8qkydnDk2cHcJra6lFgcvoQAf2n2C+RpnXD2xq99
X-Gm-Message-State: AOJu0Yw9dLocoNjqW65m9CZjwGCrdYtc7wVRuvKIKa4V0zlpXrRwQ3Lc
	SN/GtVVpt0A2LiQdJVry9ELN5SONZY2Cc0B2z2mKQgUZ4E7FhXZzwo3YReVqP8RdwB8EulrgJou
	W
X-Google-Smtp-Source: AGHT+IHGhL7UOJoJ/kl7lKOY8POXqisT6wepMEGy8eV2MwZHoopmjBN5qT0lMDUZs6Oa7UBaxHoQAw==
X-Received: by 2002:a5d:9606:0:b0:7c7:ef39:97dc with SMTP id w6-20020a5d9606000000b007c7ef3997dcmr1397618iol.15.1709059866084;
        Tue, 27 Feb 2024 10:51:06 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id x20-20020a056638249400b004747c4f663dsm1602054jat.0.2024.02.27.10.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 10:51:05 -0800 (PST)
Message-ID: <e07f9c83-1d57-45aa-98eb-982371d1d02e@sifive.com>
Date: Tue, 27 Feb 2024 12:51:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] riscv: 64-bit NOMMU fixes and enhancements
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227-footage-porridge-949a43ee8ecb@wendy>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240227-footage-porridge-949a43ee8ecb@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_105107_250400_2CC8D6F4 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Conor,

On 2024-02-27 6:13 AM, Conor Dooley wrote:
> On Mon, Feb 26, 2024 at 04:34:45PM -0800, Samuel Holland wrote:
>> This series aims to improve support for NOMMU, specifically by making it
>> easier to test NOMMU kernels in QEMU and on various widely-available
>> hardware (errata permitting). After all, everything supports Svbare...
>>
>> After applying this series, a NOMMU kernel based on defconfig (changing
>> only the three options below*) boots to userspace on QEMU when passed as
>> -kernel.
>>
>>   # CONFIG_RISCV_M_MODE is not set
>>   # CONFIG_MMU is not set
>>   CONFIG_NONPORTABLE=y
>>
>> *if you are using LLD, you must also disable BPF_SYSCALL and KALLSYMS,
>> because LLD bails on out-of-range references to undefined weak symbols.
> 
> That's not new to these patches though, right? IIRC that's an existing
> issue.

Yes, that's correct. I see that arch/riscv/configs/nommu_* have KALLSYMS
disabled already; this may be the reason.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
