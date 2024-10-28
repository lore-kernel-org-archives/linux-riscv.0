Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C8DD3399B
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Prc/796ZZrajh2jZw6I7qAr3JQ+kTartGjeSEIBsFsc=; b=0zrbqgQDGbwLjn
	HgoY39rnaxT2gQhc9X3eFKroxVwgjSCQkjTb6I6uTLDjhfjnPjrUf/e3hsx8c+Ptt65edgveywYGR
	AGCRUdAunRmjVRuwPnUt2GQfddNeuQJkObn5UYSrAxi+SkRaCuVgu/oj3i9ALESf9WK+A7im5ZP9D
	U6XoggaTadxUT6Ye0OoNaQwdyejsodlofp88f0cipLcqicePtzTKrPjoaTbJEJ86qICj1XSCi/iHc
	cCdSl8zayEUmCjBbbKLALac6DkEx2jYXPQ7V54POh3dTcTfJE3J3qWey6H/feeAy8srOqdwxDVKom
	jwi8ejtsPrLpN86Xm1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sky-0000000BWMt-1eZc;
	Mon, 28 Oct 2024 16:38:16 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SZ8-0000000BUI4-158b
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 16:26:03 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-20c693b68f5so46925985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730132761; x=1730737561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zi/YPCKq2pnvwaWzJ1+lBWDNA5pML5O6ykDvgXbiSGY=;
        b=Q8nG998uumL/9w9xdOrBEt+rF5HMjVOy4AvrhYbXcYLMUjBfHjKvM6swlD40aYVGgR
         eLoGmlnB5Bh9bfjtq4E5lrXtaQROTZ9NxR+ypD7/KO/mirN//W92n6dtNcrvtpkRZ2lZ
         lItRL/S8Scxk2CpZXKwPkwKjPJBv/vga4bpw+W4PJLkmaOjZk+vlDsnqrlfnuzlJrjHy
         Qlrr5qMJJzRN8naAW6gyet9WeYA8ahxNeNxvGgtYfhYSRDOQurcXN6SIrZUyN55Fu3C5
         529ywmF5fQOaP72tX+cYOhh/h7NVMXllkoW3u1tMOPFsrLwaJzf1oJINJxEnpP0KPrBu
         e6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132761; x=1730737561;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zi/YPCKq2pnvwaWzJ1+lBWDNA5pML5O6ykDvgXbiSGY=;
        b=Q0w7evhDutHmAADzmRR3o90mI19iO1G0Z8xK4mEknMO7e50szrDpmRuh3YRjYfpIbB
         UAk224J9mNTSW64l2t12CqlN/j0g7NSZc7Di8TtDuvoIh/kbSZLbT5c61GYCrNxyYaMY
         GAYFZOUkX1leOZa2Mm5rGB4X1ljHzGPd3Fstl8JAO5Cr/JqrJTu/N0tHglhF8Vr8ri95
         6ykWrcbb2k3c1M3VBMFY+yV8dN4bGXGwrR/ESly26GXQxls4ZfYMYw0Ro2HAxujn7CK2
         P/UyO3TC3hl46drsY+G28hWFXdxEYsI/ZnnYXp2tc16t92uYp4I+H5XmZ/L4SLgiSpw+
         9nJA==
X-Forwarded-Encrypted: i=1; AJvYcCXscxDFZNNIWX0sxQ9GBvMBsL3AKzZS7bwj5oaJR6Db87W0wv+YI3e/FfWOK//MGhAq7fcYfIBAwtOFDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRG56kHXUPBFEg1ap/to/ZxSgyK+bICJw7kWFJ0Ak/XbFzmSKh
	b4uQ6EzkxPrrrqS0j5lr0jkrzNB9S6dI4cgkja4LNt/KQCbcOkGG
X-Google-Smtp-Source: AGHT+IEEIhIcjSj9a4I/Em/9bk4VIo7UIAOODWRRjuGix7T52NUnL+2Mu/j8znXSNfqN/pfRwVna9Q==
X-Received: by 2002:a17:902:e848:b0:20b:9998:e2f4 with SMTP id d9443c01a7336-210c6cf705bmr96246315ad.61.1730132760809;
        Mon, 28 Oct 2024 09:26:00 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02eb81sm52187745ad.207.2024.10.28.09.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 09:26:00 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <109afaab-05c0-4228-8ea0-1dc1aabe904f@gmail.com>
Date: Tue, 29 Oct 2024 00:25:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
Content-Language: en-GB-large
To: Ron Economos <re@w6rz.net>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
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
 <2b1a96b1-dbc5-40ed-b1b6-2c82d3df9eb2@gmail.com> <877c9t43jw.ffs@tglx>
 <81afb4bf-084b-e061-8ce4-90b76da16256@w6rz.net>
In-Reply-To: <81afb4bf-084b-e061-8ce4-90b76da16256@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_092602_331954_1E4D6A4B 
X-CRM114-Status: GOOD (  12.10  )
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


On 2024-10-28 08:17, Ron Economos wrote:
> On 10/27/24 2:52 PM, Thomas Gleixner wrote:
>> On Mon, Oct 28 2024 at 01:01, Celeste Liu wrote:
>>> On 2024-10-27 23:56, Thomas Gleixner wrote:
>>>> Equivalently you need to be able to modify orig_a0 for changing arg0,
>>>> no?
>>> Ok.
>>>
>>> Greg, could you accept a backport a new API parameter for
>>> PTRACE_GETREGSET/PTRACE_SETREGSET to 4.19 LTS branch?
>> Fix the problem properly and put a proper Fixes tag on it and worry
>> about the backport later.
>>
>> Thanks,
>>
>>          tglx
>>
> I wouldn't worry about backporting to the 4.19 kernel. It's essentially prehistoric for RISC-V. There's no device tree support for any hardware. Also, 4.19 will be going EOL very soon (December 2024).

Ok, I will work on preparing a new patch to add a new set in 
PTRACE_GETREGSET/PTRACE_SETREGSET.

> 
> Ron
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
