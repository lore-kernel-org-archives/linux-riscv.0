Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C6C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 20:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0Zxv2tIllYH3FOImSezqL6+5IPqAlhYDP6+YGW5jb8=; b=DKDsayGcX72l5M
	zBMx0zdBGGqxqpEtm5zCh3E0gJziTkxF9/lzo0ybYKspaf0MevhEC9T4OI40In02kRy9mSH/3ncOD
	ZRB6AyXt9rqRhHT63VqD5LCyX3yNxVfGoutUFNoBspOVdGcxRQ8D9486Brai7DOGdqyFg+jSLVS/7
	bZyyq6SJQKaAWxVDdCZvPoqMmU4EVmHxIgn9bVCkPW7u1yYEZCTZC1jyS1XemGzPU+++CnGDSmvvH
	QB3dX6T9KsGJsvppe+Ej3aMLx6M+0ghl9LteYqE2QFrLZC8r3gCRRMdAzzqdNOvINl4yz2nxxQBLS
	/t4Upe6xI0k2vft4lkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRIwQ-00CGz5-22; Sun, 12 Feb 2023 20:27:18 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRIwN-00CGyR-7p; Sun, 12 Feb 2023 20:27:16 +0000
Received: by mail-ot1-x32f.google.com with SMTP id v24-20020a05683011d800b0068bdd29b160so3170735otq.13;
        Sun, 12 Feb 2023 12:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dk5S206pxPvym3xCCjYF+uHuwXiN4CTZexHUkuUVlL0=;
        b=BkvWWjy29hekovMbR05VCnxtmmiqHzgJFxZsZMmz3HAdLWdOy6Te70FO7t83mydCbb
         68NS2nGLRFyLOi1AXKQuUgDkHqsvit1DOJ+qELarkZg3HsXiuc2o/Z9Lz9RAAMcBwA2w
         H4IDjEfvoTG9a7p+L9vYyQUc5ZOlu+Yj/80A39ewbcF3o6tbnfrdbR7bmv4aoU73mmsA
         QvJj7wsQhylsGv/QVdBCAAugVHldYPpBCtKdvGFi/AyOiNEKjGpulCQIYX3GsRP4lsl7
         QBIKugVuQ+V7h6JqjB2cEUlBcfqAcevbw2d3lOYTJRUxR7B4sWeiwkqpvBjQ+0kubh0Z
         +ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dk5S206pxPvym3xCCjYF+uHuwXiN4CTZexHUkuUVlL0=;
        b=tB+qutiRxaOayU9NqGL51rb7s87kGjy+6hLQcCshjnwxXryZ82C/QEHo3UKBR9xJLF
         WlnnzlPgAkQNAUQR+bguanPcZ4aQUeIpr5iEVGRa0rNSjfjXSiMkqf8tubS1/+n3/9hu
         fyg1C3+aC180VhVb6b6YQRkTa+MeZLThhE4lQGfqm3MOOqCkfmokcNEa/ZRh9/Z9ZINM
         tVTo7HbRXJNyoGOr+PUwMUK7bhlKLOq5eUD7Ccps0sEGJsgpshL7US0gP5TKxVOyge64
         6zLX+AT+Q6jQc6Kk4JoBQuWegr1rQdzlIo88tQNt15tYdUERRxx1rUV9MCoMr94otOyd
         o2yg==
X-Gm-Message-State: AO0yUKU36O6UGKy8v6PuDQM2ba63jXt+z5r79LSukkfaFXGt5NSaYu3F
	AZe0xCJvL2hXOT33j9rquE8=
X-Google-Smtp-Source: AK7set9bHXANyzTUjtfbv69H15km2KSJHo87Tw2dJtJl7ARqLSH5/3O8ywMnqkzRUNz5akIT3YBN5w==
X-Received: by 2002:a9d:1b4c:0:b0:68b:bb82:a937 with SMTP id l70-20020a9d1b4c000000b0068bbb82a937mr12681699otl.34.1676233633999;
        Sun, 12 Feb 2023 12:27:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v17-20020a056830141100b0068be5a28b52sm4434983otp.66.2023.02.12.12.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 12:27:13 -0800 (PST)
Message-ID: <89c99d4a-8f0a-4e7e-9f93-2dc9f881ab9f@roeck-us.net>
Date: Sun, 12 Feb 2023 12:27:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net> <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud> <Y+kcgcncQO/2DNLo@spud> <Y+kqi8bQE+8hLfOF@spud>
 <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net> <Y+kt04c1iRlzUNLA@spud>
 <48d2ac96-abdd-23bc-b167-08dc2c1a1dbe@roeck-us.net> <Y+kzy1y3Z3j3Ohs9@spud>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <Y+kzy1y3Z3j3Ohs9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_122715_333718_72071310 
X-CRM114-Status: GOOD (  13.78  )
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

On 2/12/23 10:45, Conor Dooley wrote:
...
> 
>> However, I still see that the patch series
>> results in boot hangs with the sifive_u qemu emulation, where
>> the log ends with "Oops - illegal instruction". Is that problem
>> being addressed as well ?
> 
> Hmm, if it died on the last commit in this series, then I am not sure.
> If you meant with riscv/for-next or linux-next that's fixed by a patch
> from Samuel:
> https://patchwork.kernel.org/project/linux-riscv/patch/20230212021534.59121-3-samuel@sholland.org/
> 

It failed after the merge, so it looks like it may have been merge damage.

Anyway, I applied

RISC-V: Don't check text_mutex during stop_machine
riscv: Fix early alternative patching
riscv: Fix Zbb alternative IDs

and the sifive_u emulation no longer crashes. However, I still get

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:71 patch_insn_write+0x222/0x2f6

repeated several times.

I then also tested

riscv: patch: Fixup lockdep warning in stop_machine
riscv: Fix early alternative patching
riscv: Fix Zbb alternative IDs

which works fine (no warning backtrace) for sifive_u, but gives me

WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:433 trace_event_raw_init+0xde/0x642

and a whole lot of

event btrfs_clear_extent_bit has unsafe dereference of argument 1

and similar messages when running the "virt" emulation. That was there before,
but drowned in the noise. Ok, guess I'll need another round of bisect.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
