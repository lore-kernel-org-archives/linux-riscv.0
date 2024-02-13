Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955A8C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MA2MUk4dAQursNCFAvDZ7vWqydPeliz4/3Kh1FjWEBs=; b=4MJ+KLomaENxXR
	04Q73+gxSQShal1LJQxNtyqrbia/bdQMip+xYmPVkotYiH3LBx9N8FLGvi2fTdg25z7GGGK4ngUW/
	8f1GGs1WcV1HxyGDhDU0VTXhfPvZGUIfpiBRd02VtGjuH8RQ2H4j1gBu4E0cTP6rkZRV7tzODZaiR
	3v3vos0cSdkuEsuobLpJ7mtRFssEDAW/jlZOrcYRvmIk9jX/JIcsz7aiW2FSbQwefNkZqRf4YN1/M
	AKO3R+geCO63TSst6brtuIudPT02OkOqUa+MOn/4k4nJBBoBCvNbLd8c4Ok2UjffY5Yv1j3m98A1r
	aDf/cAcI4UkQNaWg4qgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZq88-00000008qcr-2J4f;
	Tue, 13 Feb 2024 10:35:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZq85-00000008qc6-2vwd
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 10:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707820508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WZVndzVRjyrQRaSUy0ogx+hkksdl7fZOhCR3PdteitI=;
	b=TIcLqYGE3nevvT/V+do61yBRqJzAjbdWHJI3TUh//lWtp9lK12kDHrtR5HL8Z/V3HgvjdF
	Mih+9mJqlNAmzzQXH/KuQQTFr4DqcaR1zjIbrZGRJqmCRm55Z0y8KqIn7Y+MXNpyRRS/B7
	gtlC5TS1piuwwHZ/jzSn/RiiIRHqSw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-XpAmrAtvMyit6HmEcM-vjA-1; Tue, 13 Feb 2024 05:35:05 -0500
X-MC-Unique: XpAmrAtvMyit6HmEcM-vjA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-410dfd0e1caso9858145e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 02:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820504; x=1708425304;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZVndzVRjyrQRaSUy0ogx+hkksdl7fZOhCR3PdteitI=;
        b=IgDIwgMPMLvLDGKogJAEXOnDlS4MoYqeCyn92BHA/q3slGnbIZHIT2oSTz/8qWpcNr
         i+6w7lOh7uv/pP/8v7F9tgMAb5WikgkDdPMUPFRz1AOQuwiAyE8gmbjk931GoMuhhZ/z
         SpMi3Rkcxa6/KTvcBremE9noWjgJKOTPIJsMuz8oQgAGthTbHDhbvEIE99xGQjKho9Jq
         NI8j2gf0F9+jLzrAJJw6/yPbweCHg9Q+eZN69mOKzps4ytgCFgeUX28nl1bDzmTGVGy4
         yIcTN6Lqp2KSutXo36bebv8/k9MLGddu0FWXhfVlc1E1oNvFaesL+kn/S14NqiRctnIX
         WPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYDJnOqZ1PqMbXX6lzfbVH7aKnjh+ntqYS+WpTyBv2svKCzrP8Ld9FAepfazqftNOBwSjk8u/byY/Hy1zThAtkGw7i/eaNLh+gMBztTaRH
X-Gm-Message-State: AOJu0YwRMYCM+QFV+1n/MmtE2sA5X90mmG/xdjb4puoAEavj3upuvkEz
	PJlWY9gB1gwOootUsd2kgRs/b/3Jf7dNJpW/7qs1IUo6007Q8r3kfCVL5a5RXqlW4wHvexAbcbH
	/Nfu7/RBDlzzhPLQC+cqiE31wn5dtMDffbmMM71rmrVZrhgVtCmz1WWVUAcQuM7HAaA==
X-Received: by 2002:a05:600c:310f:b0:411:5fd:42e4 with SMTP id g15-20020a05600c310f00b0041105fd42e4mr2743359wmo.5.1707820504218;
        Tue, 13 Feb 2024 02:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAG7EtbPdlIeBXhpA4WAotkRxeLP+pJzlGoLB/DZ6/Ye/sSYjmBYr+PL2bco75XRQB6eoH0Q==
X-Received: by 2002:a05:600c:310f:b0:411:5fd:42e4 with SMTP id g15-20020a05600c310f00b0041105fd42e4mr2743329wmo.5.1707820503811;
        Tue, 13 Feb 2024 02:35:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxdidEZpVvFVZJv3iOI9AGFzEFa+F2I2/6Qh4cgJ5SvXENMJmwyhXjIgcZL2KUjknaQX+Lkz/MVkZodCdEhUoX/M7qZwcy0jsONwIS0oCDrFjFmYSSvzSXPhG6ZW4wXQ6crBjK8f1w9VQHuXJuf6N8pyBXfYpWjuPabNUnaAlEYZRXPWs0ON7MOwNEUjYP69Lw1g5vcS2MrtCpx+paB8FrBt4UZXezifO4ATFUw6Dkie7f110FpXCfESK39LiM8UAhpCF7MTX9ouv32O2cBjyZvmKLGdaKCHPiPz9Hsy6j0kNDpb5uKM1tONfhfe7bZ7U1RlOEwFdnwAD44qi3zOQLKynTivDfyvzZCwkwnH1+UuPObica2oOrG4UsEXLPH9G/arpt6F8tbzQmJm051CodoCm/IEty7qSQA/7vGC1KyZQcyCFb2+T4tAGgzVumekKIWIo7d8hTC4xyaWqlJgwN7PoRNyNNhSac3+M1AARIwxhW7zcGy2jvYXxz7WIpi3wa6j0vPqgaqDN3r3cNn699gciz9eO8E20BPh9C40TvxQqr0DyvEU+/9X05HKpWBfT9b8//fzp6QAbgceTL456I30y+8lUji8YBlVKtMSjjHHa/rVrWnCPcPRXfZQ6Z0cLP7UXpVaYAmvIpdayU2xMqCT6oNkHu4kVETCNMB/oALKtDW7+hlANxwBGtBjfU3wNr0F+zXC7Sfuxwqg05c/6/AMKsXAoX4nfFNSJ6RHucopt7wp0XxacYBk+oEwVQ38alspn4JfQkACZA4bubSUsFTzsJnS4FTjIK7d84dvsyVNC95cEtcQYWU6EDdlSMBDFCLcWV4mNpI0pe7QqkI390y+eiDjQLrjRwuJbChNkai6kgMhS33abQOgMFeB/UuOXk1ZODCikobfhonVbVavMgQ7sXrgsr1sbfHJrx3RhenbKuaArMVqr+MlvJECL1YN/Ge2
 bW15Tdzf73CL57ah04ng+veBjLn1HPlOGt7URVa1TCcNGS8vCSFJCt83lUAV8gVFGhLwWEuWrwPJr/MrLhqtsgyczBiHDkjOP4+R7oENkWnbuDQ95UbDrGxY0inMmHaYVDK/+PQ7F+DrQPa05MhO3oLMkcPlbjxEOk5Hu3S1W+1DF694GVxvSHP+FWluBwRmC3ZVaSbx8WaDppb5Mpg4Vzqc6MTxfFYVuwthTYzgGt5TvB8YQBUgFEnZUZk2YakXp99opEAqMMhgicHXkxaziK1HFr5ozxknVraRxzWS75a4NkvA9gubQFErYIkqq+32c4g5KFf22yzxbUMsObDRSXF/AzO3H3aK/IVcrhiiMNBmR2Tnm6tp2h6U5tY36DwnZFI43EKd0xDcV0GjyOzoBS78nO61ZExP60YME+sAzr2DqciQEWPxv1HUUvNkSr0dOrBi1VJlfSksK0EFRzLe5LXiQc3GlT7Bx8dyScLyeqMncSB7fr6ZU+FWSTpdtIai4hJdD5wSznlNOCy56qM8oBwnOOW28vbmDMhUOZJlB1LqWPjA8bKOHoAonHN3D02dlA2rE2h7XNIOAxSbl4ctWPB/3BmIEMD8dzCB9p65bRgNSF2diqeXljGP2OLSkCM2QOFpe/aqBwfM0uMrNn8EqX0/JTpaeaJZAN1H2EIYLsyCPthmAMC2xxDZT+ghP7JV+1qSXa/k8HjssPloZ2Vq4M80owdOanftI51zQXTW5ahy14NnduzT/opMYFs5wLhCQp5kdcaawE07iv4xUL+LpYk+EIKoBlCKyAY0C4o0paZ0yU3R0OMKOhhh+CWGbMcUKYfzaT+QLtsvEYCsHKhAl1INUzfwf4ShTE8vvzcxbowRRd74YTI4XM7zs44EAjmw96POjU2wVf2AqI8zd1psldM49vYQNlLvVWIAKALzIOiBhWf3mcdVD9t5WPDf0GSpoSSxxVzN51A8OzY/sYn0DAqfq1Wxfs6g6/BJu
 3uMvMURKhFk98TuZlAHOOXCkUwg==
Received: from ?IPV6:2003:cb:c70a:4d00:b968:9e7a:af8b:adf7? (p200300cbc70a4d00b9689e7aaf8badf7.dip0.t-ipconnect.de. [2003:cb:c70a:4d00:b968:9e7a:af8b:adf7])
        by smtp.gmail.com with ESMTPSA id bp9-20020a5d5a89000000b0033b4796641asm9321521wrb.22.2024.02.13.02.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:35:03 -0800 (PST)
Message-ID: <45d5b98c-bad8-471d-a285-47f47c5b50bb@redhat.com>
Date: Tue, 13 Feb 2024 11:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 09/28] mm: abstract shadow stack vma behind
 `arch_is_shadow_stack`
To: Deepak Gupta <debug@rivosinc.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
 kito.cheng@sifive.com, keescook@chromium.org, ajones@ventanamicro.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
 bjorn@rivosinc.com, alexghiti@rivosinc.com, corbet@lwn.net,
 aou@eecs.berkeley.edu, oleg@redhat.com, akpm@linux-foundation.org,
 arnd@arndb.de, ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
 guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
 xiao.w.wang@intel.com, apatel@ventanamicro.com, mchitale@ventanamicro.com,
 waylingii@gmail.com, greentime.hu@sifive.com, heiko@sntech.de,
 jszhang@kernel.org, shikemeng@huaweicloud.com, charlie@rivosinc.com,
 panqinglin2020@iscas.ac.cn, willy@infradead.org, vincent.chen@sifive.com,
 andy.chiu@sifive.com, gerg@kernel.org, jeeheng.sia@starfivetech.com,
 mason.huo@starfivetech.com, ancientmodern4@gmail.com,
 mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bhe@redhat.com,
 chenjiahao16@huawei.com, ruscur@russell.cc, bgray@linux.ibm.com,
 alx@kernel.org, baruch@tkos.co.il, zhangqing@loongson.cn,
 catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org,
 joey.gouly@arm.com, shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
 jhubbard@nvidia.com, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-10-debug@rivosinc.com>
 <2f34f6aa-99fa-4545-b706-a1d50864f9e9@redhat.com>
 <ZbKVNm5ubV8yQtSE@debug.ba.rivosinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZbKVNm5ubV8yQtSE@debug.ba.rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_023509_855910_A21278FA 
X-CRM114-Status: GOOD (  17.84  )
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

On 25.01.24 18:07, Deepak Gupta wrote:
> On Thu, Jan 25, 2024 at 09:18:07AM +0100, David Hildenbrand wrote:
>> On 25.01.24 07:21, debug@rivosinc.com wrote:
>>> From: Deepak Gupta <debug@rivosinc.com>
>>>
>>> x86 has used VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) to encode shadow
>>> stack VMA. VM_SHADOW_STACK is thus not possible on 32bit. Some arches may
>>> need a way to encode shadow stack on 32bit and 64bit both and they may
>>> encode this information differently in VMAs.
>>>
>>> This patch changes checks of VM_SHADOW_STACK flag in generic code to call
>>> to a function `arch_is_shadow_stack` which will return true if arch
>>> supports shadow stack and vma is shadow stack else stub returns false.
>>>
>>> There was a suggestion to name it as `vma_is_shadow_stack`. I preferred to
>>> keep `arch` prefix in there because it's each arch specific.
>>>
>>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>> ---
>>>   include/linux/mm.h | 18 +++++++++++++++++-
>>>   mm/gup.c           |  5 +++--
>>>   mm/internal.h      |  2 +-
>>>   3 files changed, 21 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index dfe0e8118669..15c70fc677a3 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -352,6 +352,10 @@ extern unsigned int kobjsize(const void *objp);
>>>    * for more details on the guard size.
>>>    */
>>>   # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
>>> +static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
>>> +{
>>> +	return (vm_flags & VM_SHADOW_STACK);
>>> +}
>>>   #endif
>>>   #ifdef CONFIG_RISCV_USER_CFI
>>> @@ -362,10 +366,22 @@ extern unsigned int kobjsize(const void *objp);
>>>    * with VM_SHARED.
>>>    */
>>>   #define VM_SHADOW_STACK	VM_WRITE
>>> +
>>> +static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
>>> +{
>>> +	return ((vm_flags & (VM_WRITE | VM_READ | VM_EXEC)) == VM_WRITE);
>>> +}
>>> +
>>
>> Please no such hacks just to work around the 32bit vmflags limitation.
> 
> As I said in another response. Noted.
> And if there're no takers for 32bit on riscv (which highly likely is the case)
> This will go away in next version of patchsets.

Sorry for the (unusually for me) late reply. Simplifying to riscv64 
sounds great.

Alternatively, maybe VM_SHADOW_STACK is not even required at all on 
riscv if we can teach all code to only stare at arch_is_shadow_stack() 
instead.

... but, just using the same VM_SHADOW_STACK will it all much cleaner. 
Eventually, we can just stop playing arch-specific games with 
arch_is_shadow_stack and VM_SHADOW_STACK.

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
