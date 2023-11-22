Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39582C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7odv7VUhGczoQwxg8D7uFclPDZWsDRBJcj8pWkY5cLU=; b=t/8LeS2TCECGxYq6FMbRyTuQNH
	a8ukahx/VLURaGIKJhrjYdw3fZmz9S64yc7PKDAGG7W7VFHMA0CWTFR9UgElBTFYN6HxsZPKIUJFM
	HcriKSi6ZELdlmJD5Bly0VYZlqE62stpm3qIz7rcMkCbiBx6zjO34pJOWEyUtuskopNiMrq6IIxXL
	lyFEWGrvRIojFQy9fmqHFIS9+1NtC3hjh3Fv3Vitq1GfZN+xZYTFJ74QwCk16UfC6VFpxIE6yHjSW
	1B8IpKiqgFpA/Jl7iW8pVp95l4WEzeTLQZQW0aszVBW2JaeNj1Mqpzcg5kpv5hWYkCN7w1L0ccGoG
	jZ6hb0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rbt-002lFf-0N;
	Wed, 22 Nov 2023 18:06:01 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rbp-002lEe-0y
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 18:05:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so885967a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1700676355; x=1701281155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRia2Osk7RLncdx2O06OJMmemHtGkLvZU7Z5fC3vj8w=;
        b=QSfjiH6y4T/u6z4ETxEiR1jzuGlbVmn3nGf7U4auRj8WvhX6tnYqmPXaGaJZJPjlj1
         WpJHJNqtizVedSQ4eJ8ORywnf99MFE+j3w+nZZ43miJtLdjBFat93KBJFG/7BHprw0FD
         QGEwbgcdtby0opYdfVisChvAR+LJS9HVxmfUqq+1cDT90+GHCSscQHX0hpz2hJjfWrJ9
         XJTl6h7++GTijJUZFqnOcWzA71zCQnOLNdsJ9gfGXhk8IBAwXN33+d7IuSHiU8hs/2KE
         ZkmrZJPD1c/eHziu6M1+3ebEZLup6ydFwHKijL7qMDHUsLOybLoFWNr0a+H1/Z/RdAwB
         JSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700676355; x=1701281155;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRia2Osk7RLncdx2O06OJMmemHtGkLvZU7Z5fC3vj8w=;
        b=IbF1RuwoO3pG5218+ZUAQfcAEMMbKIZTqcLfAaXbrcee6rgzQsQ1hlhiG29JDu+ADE
         qGmw0eO+szlm4aAnLWn11XETehi6pWZ3or+8o//3rXV6NXhaPpwg7FtQ4VxE1Eh8TPkr
         G6CWWM0Ijxax9jsdvueT0zn1dppMUEJOW14C19zVJEwipnc+Y5MoVhZa6F7W8kwVcUbC
         D+FN9yjS3O2+XYUkvkHdbdZT1F2EwRCKgplUfiA09ZEzx4oqo5V4EfxWsDYHNNV/2e9A
         MLGhBSjMnhTqVh5pDwU9XcBEvTkiOhW0I1jHD9JNZWSldIjGXO5meIm6B44+2TnPoMw1
         Ho0w==
X-Gm-Message-State: AOJu0Yx1LCDyrDjflUHedfAfNhgT9LQEQEHThsGHpbQfejETS/lMqEJ9
	nw6PKKJRvpl3CA7QM62ZT8HQhg==
X-Google-Smtp-Source: AGHT+IFuh32jvNbuYQwaf2abCwtPo2iaOyP3NbHblJ1kjKy0eGzHgihIRy7Qu5I3jl5CSAZMf+hz1w==
X-Received: by 2002:a17:90b:3ecb:b0:280:735:bece with SMTP id rm11-20020a17090b3ecb00b002800735becemr267052pjb.16.1700676355055;
        Wed, 22 Nov 2023 10:05:55 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id jw13-20020a170903278d00b001cf5d508246sm6186562plb.224.2023.11.22.10.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:05:53 -0800 (PST)
Date: Wed, 22 Nov 2023 10:05:53 -0800 (PST)
X-Google-Original-Date: Wed, 22 Nov 2023 10:05:51 PST (-0800)
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20 implementation
In-Reply-To: <3BDE7B86-0078-4C77-A383-1C83C88E44DA@sifive.com>
CC: Conor Dooley <conor.dooley@microchip.com>, ebiggers@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, davem@davemloft.net,
  andy.chiu@sifive.com, greentime.hu@sifive.com, guoren@kernel.org, Bjorn Topel <bjorn@rivosinc.com>,
  heiko@sntech.de, Ard Biesheuvel <ardb@kernel.org>, phoebe.chen@sifive.com,
  hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jerry.shih@sifive.com
Message-ID: <mhng-1c7aec6e-c2bb-4ad3-a458-7dce3cda0475@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_100557_575903_AD54B6B1 
X-CRM114-Status: GOOD (  35.71  )
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

On Wed, 22 Nov 2023 09:37:33 PST (-0800), jerry.shih@sifive.com wrote:
> On Nov 21, 2023, at 21:14, Conor Dooley <conor.dooley@microchip.com> wrote:
>> On Tue, Nov 21, 2023 at 06:55:07PM +0800, Jerry Shih wrote:
>>> Sorry, I just use my `internal` qemu with vector-crypto and rva22 patches.
>>> 
>>> The public qemu haven't supported rva22 profiles. Here is the qemu patch[1] for
>>> that. But here is the discussion why the qemu doesn't export these
>>> `named extensions`(e.g. Zicclsm).
>>> I try to add Zicclsm in DT in the v2 patch set. Maybe we will have more discussion
>>> about the rva22 profiles in kernel DT.
>> 
>> Please do, that'll be fun! Please take some time to read what the
>> profiles spec actually defines Zicclsm fore before you send those patches
>> though. I think you might come to find you have misunderstood what it
>> means - certainly I did the first time I saw it!
>
> From the rva22 profile:
>   This requires misaligned support for all regular load and store instructions (including
>   scalar and ``vector``)
>
> The spec includes the explicit `vector` keyword.
> So, I still think we could use Zicclsm checking for these vector-crypto implementations.
>
> My proposed patch is just a simple patch which only update the DT document and
> update the isa string parser for Zicclsm. If it's still not recommend to use Zicclsm
> checking, I will turn to use `RISCV_HWPROBE_MISALIGNED_*` instead.

IMO that's the way to go: even if these are required to be supported by 
Zicclsm, we still need to deal with the performance implications.

>>> [1]
>>> LINK: https://lore.kernel.org/all/d1d6f2dc-55b2-4dce-a48a-4afbbf6df526@ventanamicro.com/#t
>>> 
>>> I don't know whether it's a good practice to check unaligned access using
>>> `Zicclsm`. 
>>> 
>>> Here is another related cpu feature for unaligned access:
>>> RISCV_HWPROBE_MISALIGNED_*
>>> But it looks like it always be initialized with `RISCV_HWPROBE_MISALIGNED_SLOW`[2].
>>> It implies that linux kernel always supports unaligned access. But we have the
>>> actual HW which doesn't support unaligned access for vector unit.
>> 
>> https://docs.kernel.org/arch/riscv/uabi.html#misaligned-accesses
>> 
>> Misaligned accesses are part of the user ABI & the hwprobe stuff for
>> that allows userspace to figure out whether they're fast (likely
>> implemented in hardware), slow (likely emulated in firmware) or emulated
>> in the kernel.
>
> The HWPROBE_MISALIGNED_* checking function is at:
> https://github.com/torvalds/linux/blob/c2d5304e6c648ebcf653bace7e51e0e6742e46c8/arch/riscv/kernel/cpufeature.c#L564-L647
> The tests are all scalar. No `vector` test inside. So, I'm not sure the
> HWPROBE_MISALIGNED_* is related to vector unit or not.
>
> The goal is to check whether `vector` support unaligned access or not
> in this crypto patch.
>
> I haven't seen the emulated path for unaligned-vector-access in OpenSBI
> and kernel. Is the unaligned-vector-access included in user ABI?

I guess it's kind of a grey area, but I'd agrue that it is: we merged 
support for V when the only implementation (ie, QEMU) supported 
misaligned accesses, so we're stuck with that being the defacto 
behavior.  As part of adding support for the K230 we'll need to then add 
the kernel-mode vector misaligned access handlers, but that doesn't seem 
so hard.

So I'd say we should update the hwprobe docs to say that key only 
reflects scalar accesses (or maybe even just integer accesses?  that's 
all we're testing for) -- essentially just make the documentation match 
the implementation, as that'll keep ABI compatibility.  Then we can add 
a new key for vector misaligned access performance.

>
> Thanks,
> Jerry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
