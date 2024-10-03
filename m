Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E724CF34D5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 23:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIGOb3os761qbSRVhUTS4K6xkSa3W1A4Wd8Xk3+NqEQ=; b=2rWMP9nsa1+CDJ
	8F7jE3apVupO+SK5JkAoC2ybk6rA8DHyJHDJergKbyOwQWV6y/PqTGWR5qiHXTow2Q0TU88uX5aiW
	tydLoxisoJjS5iBMAahcj9bU21YirJwBaghKXtRogQaceFta1vdUG2n9yCyduYQKpDAOuiZhXp3nB
	MgrWEjnY6kDRlg0KdvLjPnVYHQR2/FZPao29q2EsvnbWgUcJgrKW0mUyaSMJp/kUHz95xRh7sBdj5
	UmK/wK+ToidYbF0mqeiw0/Yez4MdIJRltZUY25tCnDFnshfxc3zSmLVOdX4RRn0wrsbvm/qsH+GI/
	IyeDpKc1XnJmcYLj4Vsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swUsQ-0000000AaL5-1b7d;
	Thu, 03 Oct 2024 23:04:54 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swUsN-0000000AaKP-3HHz
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 23:04:53 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a1a412638fso6112485ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 16:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727996690; x=1728601490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6nfuUKflXlu0gy64XrlY7jGUy2rKVA8VyjGUfxntcw=;
        b=Cqem47HKDAzSTISJJ/Ls19hxAQvqJKIVRhH306r4TA7y7WU4xVVvETWNk2PVZpxvtB
         4+3IXjniAV4VB8nFRNXg+b6o3gQKUYa/SB6hADZXyw+CVUZIDUJr+FfcEag3t55QylgY
         dTbDDjuuW7VPtBV4FLLAnrFnWrKmR4DAlMnYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727996690; x=1728601490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M6nfuUKflXlu0gy64XrlY7jGUy2rKVA8VyjGUfxntcw=;
        b=LP26w+EmpLqww/M6lUJWgwc4kep1B/brvLn6883lPJL/Gkg7tdCefSODgO8RwP5y+H
         qBW0u5Wd2IReyE1yOwkWMOUQ2nxKR3skvu0F7BnaECUWB32GW3zzJrKkPCEfre25yfzf
         K6fJ7YhzYancA8G2pc4dBsrtEODCZhFIdepBF8Bv5f+TV8gj7FgytCB8rVjoP53jntqP
         0dVDBFuegAV7GRSEpCylzsci4lm8TJxZ26KiMOaT/95SBpz615KRMCU5thQHfBwVC+s+
         GA5JNHkG129IWRbEs91+SxY7SaBVJ9tT4c0umI6Rl5rrclNhDfonimORNUXXXtssSTxn
         mWDg==
X-Forwarded-Encrypted: i=1; AJvYcCW5Vl6oR09Fy2IuKCIu1yVxDWxj7Qtw5e13sRBHhPrqywq72N1KITIQGVrUositp1NGhLuInqbeNt3rvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr5N1Wh6saupZyKVoFrlB+WCc8Gl9ESk6wCD+vO6Ggw+RauVUF
	vBiwAO50z5/wwzSBLaN5hXvLfoer5QpIaRF9HGMo9WI/G02P63ek95yApuYI27k=
X-Google-Smtp-Source: AGHT+IEf92eF4XbI75+DDch6LT1NVeo6TRIQ29YwXnjI+iDeNTTSz8c4ISNOJ8P9ysseWA+UZhFJyQ==
X-Received: by 2002:a05:6e02:214d:b0:3a0:480c:6ac4 with SMTP id e9e14a558f8ab-3a375bd323emr8671095ab.22.1727996690235;
        Thu, 03 Oct 2024 16:04:50 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db5585f2ebsm482149173.4.2024.10.03.16.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 16:04:49 -0700 (PDT)
Message-ID: <cb25b144-a388-4535-869d-98220a601ebe@linuxfoundation.org>
Date: Thu, 3 Oct 2024 17:04:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] kselftest/riscv: kselftest for user mode cfi
To: Mark Brown <broonie@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, rick.p.edgecombe@intel.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-33-3ba65b6e550f@rivosinc.com>
 <fdf602e9-a8b1-4f62-9e26-bb62a7202d22@linuxfoundation.org>
 <b4347055-46f7-4e06-b484-bbf147b80fe4@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b4347055-46f7-4e06-b484-bbf147b80fe4@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_160451_903690_B0E5B05F 
X-CRM114-Status: GOOD (  15.56  )
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

On 10/3/24 05:03, Mark Brown wrote:
> On Wed, Oct 02, 2024 at 05:18:36PM -0600, Shuah Khan wrote:
>> On 10/1/24 10:06, Deepak Gupta wrote:
> 
>>> +#ifndef __NR_prctl
>>> +#define __NR_prctl 167
>>> +#endif
> 
>>> +#ifndef __NR_map_shadow_stack
>>> +#define __NR_map_shadow_stack 453
> 
>> Why do we need to define these? Shouldn't including
>> asm-generic/unistd.h sufficient?
> 
> We have this issue on arm64 as well, there's some issue with directly
> pulling in the asm header interfering with libc in some situation (I
> can't immediately figure out which situation or which libc to remind
> myself what it is though...) so we've got local defines like we do for
> the NT_ defines for ptrace.  I see x86 is doing the same.

It would be nice to figure. There have been some issues reported due
to local defines - the test fails if the define happens to not match.

Does including <asm/unistd.h> fix the problem?

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
