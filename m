Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9855C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 17:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjWrmdW4WtIoWXFiExLZKFHrC9I2UGoKAm04GD+NPqg=; b=DIQ/OznWwR2U7p
	yxenjzu9fAG925rqmhi1ZPfJV2MLfX8yuYh9HenFcQWi+FxwLtvxU7a/gXs9U0UgikCE+XBGyjlLR
	X9y9aESE+m0JqS0ZPUWTcVXolVAZg4fT+LmYyVWDkO4uA/N8Y7zl1c/4poDJm/2C71O29+6jP8IGq
	VztXl3KVJ6ZyrzqPO/6oPuajoIywHdY7qTScAkyWJfckN+wKzb+l1EpMSuGZkBW49ir2t19iee5EF
	Z+LAjQo9rPuEBToD8sjqZPtVAFJqWwhJ8JpTSaOFJ7wI+8B3cndNS0mRoaag9k7Ji8ui2G3pHqMSB
	hZ0jlMKvkFyo/I6Rzdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rAq-002hHg-3D;
	Wed, 22 Nov 2023 17:38:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rAo-002hEH-0D
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 17:38:03 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cf50cc2f85so37678495ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700674661; x=1701279461; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB+axD1Vcc97GiHQ3MbqEUMAVWCgEbLU/Yl6K+bGqgI=;
        b=hGeKwMC2xoHf44QjUyD24tmmTHA2PsVayXbcb5zO2ZPQzQAeb18oI8+RAUC5fKpj78
         jbgOfgb8thWGaCfN9oqL9+JmY3htGlCZ4dDkmYnAGqML3XnxYu6n1dqVNhkN0YpDNWNa
         OOgx7bitt/p9wIFNO9KU3gd2KBuBbV5oJBdc93IGFaFdkQzD16DUpYcFlmmhz5Zw0Q9c
         cNANTWo5Hrqx44RylHNKFBrxVTs6Vb0roLLNH3bL+UeZAK+hZuJaaZkGeLpDTLaurnrl
         1Dm9VuQAV/vMhKKG6xhu07KvCdCvqiMiKztyX8dHzY3fLfn4h6L0O8LlYZJYX+C0wgNq
         E4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700674661; x=1701279461;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB+axD1Vcc97GiHQ3MbqEUMAVWCgEbLU/Yl6K+bGqgI=;
        b=F3/r2EQYbmYoy4PNya25MfBep5j8huPFAEsJq0DkmzMrpDS5H8YEiTu4hBO3bztQrp
         BJp+loc/a75RLF7VTJF2LmiRpcUBAaBHtrJWrAOW/gMadiOwNyAEc+c2jjE8SHshFIj4
         GuDiullM+sIieWgklL8qTn0ld4dLR/KcE9P3mzkM0e/KX3LmlSToHO2eaNrHz99O8P3d
         22Zt6V3yDpRF5t7dTM7eQ8XkVrp3HV1jx64cVZRR6LpvXST1+SFOuh9lXkDjk7TyinV1
         BIB2e6kteqiZTjFJwBcuPkaLLihICCZNW8jIEKTmvbCWE/vhTgruN1xoGVC9Z+nyVIAb
         i6gA==
X-Gm-Message-State: AOJu0Yw7AfUG+9yV3VYJSdiAaNdN0jkjXMUmjNLowEsjm0cJ4IeHAosx
	pAK9Z++g7hNQQddicPkUeDsrGw==
X-Google-Smtp-Source: AGHT+IF46NJ+qL5ZN5PT+NT5x4N0gK+lFvsXp00qpP0ZTSDTMzWCcTLDobwk4fc21ZcVVM0Kfc+aRw==
X-Received: by 2002:a17:902:bd06:b0:1cc:3544:ea41 with SMTP id p6-20020a170902bd0600b001cc3544ea41mr2553752pls.46.1700674661156;
        Wed, 22 Nov 2023 09:37:41 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5a5b:a845:b3e1:8307:922c? ([2402:7500:4ce:5a5b:a845:b3e1:8307:922c])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001bc6e6069a6sm8165114pli.122.2023.11.22.09.37.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Nov 2023 09:37:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231121-knelt-resource-5d71c9246015@wendy>
Date: Thu, 23 Nov 2023 01:37:33 +0800
Cc: Eric Biggers <ebiggers@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <3BDE7B86-0078-4C77-A383-1C83C88E44DA@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231102054327.GH1498@sol.localdomain>
 <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
 <20231120191856.GA964@sol.localdomain>
 <9724E3A5-F43C-4239-9031-2B33B72C4EF4@sifive.com>
 <20231121-knelt-resource-5d71c9246015@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_093802_103096_235DEB56 
X-CRM114-Status: GOOD (  23.67  )
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

On Nov 21, 2023, at 21:14, Conor Dooley <conor.dooley@microchip.com> wrote:
> On Tue, Nov 21, 2023 at 06:55:07PM +0800, Jerry Shih wrote:
>> Sorry, I just use my `internal` qemu with vector-crypto and rva22 patches.
>> 
>> The public qemu haven't supported rva22 profiles. Here is the qemu patch[1] for
>> that. But here is the discussion why the qemu doesn't export these
>> `named extensions`(e.g. Zicclsm).
>> I try to add Zicclsm in DT in the v2 patch set. Maybe we will have more discussion
>> about the rva22 profiles in kernel DT.
> 
> Please do, that'll be fun! Please take some time to read what the
> profiles spec actually defines Zicclsm fore before you send those patches
> though. I think you might come to find you have misunderstood what it
> means - certainly I did the first time I saw it!

From the rva22 profile:
  This requires misaligned support for all regular load and store instructions (including
  scalar and ``vector``)

The spec includes the explicit `vector` keyword.
So, I still think we could use Zicclsm checking for these vector-crypto implementations.

My proposed patch is just a simple patch which only update the DT document and
update the isa string parser for Zicclsm. If it's still not recommend to use Zicclsm
checking, I will turn to use `RISCV_HWPROBE_MISALIGNED_*` instead.

>> [1]
>> LINK: https://lore.kernel.org/all/d1d6f2dc-55b2-4dce-a48a-4afbbf6df526@ventanamicro.com/#t
>> 
>> I don't know whether it's a good practice to check unaligned access using
>> `Zicclsm`. 
>> 
>> Here is another related cpu feature for unaligned access:
>> RISCV_HWPROBE_MISALIGNED_*
>> But it looks like it always be initialized with `RISCV_HWPROBE_MISALIGNED_SLOW`[2].
>> It implies that linux kernel always supports unaligned access. But we have the
>> actual HW which doesn't support unaligned access for vector unit.
> 
> https://docs.kernel.org/arch/riscv/uabi.html#misaligned-accesses
> 
> Misaligned accesses are part of the user ABI & the hwprobe stuff for
> that allows userspace to figure out whether they're fast (likely
> implemented in hardware), slow (likely emulated in firmware) or emulated
> in the kernel.

The HWPROBE_MISALIGNED_* checking function is at:
https://github.com/torvalds/linux/blob/c2d5304e6c648ebcf653bace7e51e0e6742e46c8/arch/riscv/kernel/cpufeature.c#L564-L647
The tests are all scalar. No `vector` test inside. So, I'm not sure the
HWPROBE_MISALIGNED_* is related to vector unit or not.

The goal is to check whether `vector` support unaligned access or not
in this crypto patch.

I haven't seen the emulated path for unaligned-vector-access in OpenSBI
and kernel. Is the unaligned-vector-access included in user ABI?

Thanks,
Jerry




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
