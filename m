Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF1D1356D
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2cfU+1+6SJ9kbjogEoOgtqfZ4ztHiSabjS99b+wSc8=; b=bCknnZqIRdTUfU
	seZYRF5Wc7FmEA4SGESf6W0vtYJpYGetbZ04lyuM9S1bWbV3REMXytDPU9e8LyqLEZ551sWq93AML
	BPQiaI9Skjr1Ieg02rIKXphJjeQWZwxBtA2T6WDxCL7Fw9llqwpIDf84n5yjrY4AIbcx7CX8ljDyA
	9+DsuIvSewq6hKQvDOr8F8In9rm5bqLimcIO5lz/+i2Dxg3y6CkSJepCHFHrGMwz3DI3ihs+SbY/c
	+YMyzv3QrkBzihLF0Hf5WXSqaRTS0cWzfAeuVIQlwuVYLNSakckDqG9byNqQleIiUSZp2YyMdaU6C
	SrP52ONHVZe7WGlKqgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t56eM-00000008Zg9-0DuR;
	Sun, 27 Oct 2024 17:01:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t56eJ-00000008Zfl-0CoR
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 17:01:57 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-20ce65c8e13so30125835ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 10:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730048514; x=1730653314; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPBOGpzcEG2EFtlczykHW2gB/qiltl7CT8g6dvLe7n8=;
        b=KW38Z7nTituVIfe8JQzlsp4o7Xn/XPZb1O9SC8k3TwezfXwu1+13niOMX/Kdotj+/A
         Wsd9Tfl2DJYfMkCJO8AlpRDk3l5QwKFNqkza084VZ7E1TDuhk++Q741eGT7nCOqxtoEO
         jL50TKks9l9J803NZbdd1emArIPxZKyIPt+t4tTY+wh4UnSw8TPdxenv039S1l+PY+zb
         aB7UKSH6k0pvMZtMXKpklWYdaoKJVMxtdF359M16lCU9e+74H7Tyll10QkqnGYG4zXbO
         +m9S1As/AQzuQmF6gmi3dbWOCGBJz0RzIuAdh0QqJaW4LQpPmHiACnK5QHtyg04swvyo
         JIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730048514; x=1730653314;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPBOGpzcEG2EFtlczykHW2gB/qiltl7CT8g6dvLe7n8=;
        b=WyEcgIXclQvAfpWoef816WQYOrmQAwyVu/++tx7MA7Sj8oI6uHevXRmjSqff2Mcwcn
         5cBkrQ2kgIWcYQaQY36tQcxQtZSyNPiH/78iSIGvl0LDaEP0KsaZqB5e6WBGH82DxMhD
         LMdPtHLVw5/NTuKh6hwwfqwrhw6qXeQCJsSSfjVfLWKSbXjPCHASzegyumm4iutqLNY3
         dh4VCN/jQYqjuD21OI7JbfM1yW4yLb5xTzK3Y+8yI85ecrUHbY0Uysjd6dx2l7n2HL+a
         /sI8/anidMSruzJf9ZWOb4AV9jlqpAJKTFxAORqn1zIyz5hoKrRsMnCoivTV8m8iHCJi
         dQIA==
X-Forwarded-Encrypted: i=1; AJvYcCUdEnLsoMopdlPFfEnhSozRSGCQeLxjeWlLchPgEa0Jsuh49Qa4A98zoILqAXx6mIN0Cl57cdyyLpphHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytn28u2jIDPX0VASpAacg/cr4tCAjCmjCxsODe/PMskDFBTqHU
	lP7LNPti5/uNqJ4jMtkRC1sWfNT37tnbbA/9qgSn7gBZN1/2qH0UpFiGFPiErHw=
X-Google-Smtp-Source: AGHT+IFA8uFIXnnI9pdBU7yuLhvtyCZqDBBasv0CDsw5x+ToMDcx+9IE0aZYL+O+zy/xaRXnlPGt2A==
X-Received: by 2002:a17:902:c411:b0:202:28b1:9f34 with SMTP id d9443c01a7336-210c6d3c766mr80597685ad.56.1730048514016;
        Sun, 27 Oct 2024 10:01:54 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0179e6sm37230475ad.168.2024.10.27.10.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 10:01:53 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com>
Date: Mon, 28 Oct 2024 01:01:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
Content-Language: en-GB-large
To: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>,
 Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <87ldya4nv0.ffs@tglx>
 <3dc10d89-6c0c-4654-95ed-dd6f19efbad4@gmail.com> <87a5ep4k0n.ffs@tglx>
In-Reply-To: <87a5ep4k0n.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_100155_123428_AF31D81B 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2024-10-27 23:56, Thomas Gleixner wrote:
> On Sun, Oct 27 2024 at 23:29, Celeste Liu wrote:
>> On 2024-10-27 04:21, Thomas Gleixner wrote:
>>> The real problem is that orig_a0 is not exposed in the user view of the
>>> registers. Changing that struct breaks the existing applications
>>> obviously.
>>>
>>> But you can expose it without changing the struct by exposing a regset
>>> for orig_a0 which allows you to read and write it similar to what ARM64
>>> does for the syscall number.
>>
>> If we add something like NT_SYSCALL_NR to UAPI, it cannot solve anything: We 
>> already have PTRACE_GET_SYSCALL_INFO to get syscall number, which was introduced 
>> in 5.3 kernel. The problem is only in the kernel before 5.3. So we can't fix 
>> this issue unless we also backport NT_SYSCALL_NR to 4.19 LTS. But if we can 
>> backport it, we can backport PTRACE_GET_SYSCALL_INFO directly instead.
> 
> PTRACE_GET_SYSCALL_INFO only solves half of the problem. It correctly
> returns orig_a0, but there is no way to modify orig_a0, which is
> required to change arg0.
> 
> On x86 AX contains the syscall number and is used for the return
> value. So the tracer has do modify orig_AX when it wants to change the
> syscall number.
> 
> Equivalently you need to be able to modify orig_a0 for changing arg0,
> no?

Ok. 

Greg, could you accept a backport a new API parameter for 
PTRACE_GETREGSET/PTRACE_SETREGSET to 4.19 LTS branch?

> 
> Thanks,
> 
>         tglx
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
