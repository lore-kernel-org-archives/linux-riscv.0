Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4803C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Jsx07pahi0oETxLn6xEPYeeWfqbNwHbIB2RKFMppZ+k=; b=fTA6+ehzhrBlSnS8NuMiNLv5og
	yceM+WU9ihKXopkZWcyhpRyXH/iKWh5osLp7qULfYxOfFyx2m/ri8GKMfpjB224RDhqb7TGZs/8S7
	oACeECn63aMA2vLoPppOo9jn3QnZElTlkj5QYBJvKrHfTcZPu326XYzOW2k+Rjjr2JosiRfUjEqth
	aJaQP/z9NLza3wWyI5oipamh0qbdEu/hSORWpZ4kn9dCJJdeWS5OEvK0klDWRh1X/VoE+b+mf06Jh
	cAUdEOsf4ywHPNxV0pr9soteN7e91UrhVF0ZgBKo1gHQ/1UNTMdSdiU4HE+BLnKSzdVnW96eKNenb
	bSUEIV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Rn-008BMd-2E;
	Thu, 10 Aug 2023 16:23:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8Rl-008BLr-0j
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 16:23:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2682e33509bso750848a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691684616; x=1692289416;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/oujXsuCZNyJ7beuH4thfI7Yg3Owqk0Evwp+NQ9/Ag=;
        b=tOhr8QlGuuLYwtzgrCExPgKzkc+mdwQSaUCSeIw8tDRrXsI0qvHEmsAOIqUBALO6NT
         n/o8YUH0REX+nURR6TwsIRoG0tKVVy9ezrW21avpnUMb+v2qqMwp9zZw5mqCNK5sPVEy
         G6vvmERyd7ksq0WDlHCrKj4788yFpjMDoF29Ge+lZ8K38Pqkt3XKD9rZqh64flWa77yC
         +vNKaeBLBZmPLZfoduB+4EvO05g5rGUkvn5xzkE9US94Xx7gAttISKzJYYheCIclMyiH
         CWqfF+3plJBQY5VJi/9sTlfDfg+VeSXC+RgtA952o/qsrsheDGc+4ZNFFXn7/4IIdR5O
         qX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691684616; x=1692289416;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/oujXsuCZNyJ7beuH4thfI7Yg3Owqk0Evwp+NQ9/Ag=;
        b=LgMBuzBK4MmF3/4kQg2TKNauar4Z7ieyIJz5fdwpa64gvYwZunP5+pn+pACf6oCu5W
         1ePJzy0Wimqwsa4HZvovD7Ew6yWCPkrdfLBEwyNWUBO5GyUfbBN9xMm9Wo1bnqFmmgk6
         XAgIi0qlWONbJolXjXCFN3o5hAVj8V5PJ+lGOIE/nj4Ukq++Lr/Z+lrZd+TbN92jZXvU
         BSgL3jOsutIrObqODCTonCFe3F9WutecZoU4/rUJyBnyK/pnZFcukG39gXrj8WgohGm/
         /if/oz6MKYoEQUwdA7smhSTSkj/tCGzH6bCk4a04nafuicwzJL3tNscAbEsqGMxWLCdh
         SIjg==
X-Gm-Message-State: AOJu0Yz7zTiMW2jgR5It8SIuKwK+KLq1fMfEvWaQoBXnPEAQLZecEiz9
	JopVQdTbyFpbcB9iaRMZFWJIRA==
X-Google-Smtp-Source: AGHT+IH5NjFG9ebyRPc7nGWmHQsTm1rfLT1IflWmJ6tGtItusVgprAJhLWBFgU4p6rhMI5D3oXgNZA==
X-Received: by 2002:a17:90a:fa02:b0:268:13c4:b800 with SMTP id cm2-20020a17090afa0200b0026813c4b800mr2650610pjb.21.1691684615778;
        Thu, 10 Aug 2023 09:23:35 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090aa60900b00260a5ecd273sm1672318pjq.1.2023.08.10.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:23:35 -0700 (PDT)
Date: Thu, 10 Aug 2023 09:23:35 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Aug 2023 09:23:33 PDT (-0700)
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
In-Reply-To: <98f523e515b2adc2aa7bb8d133353bad74e30897.camel@redhat.com>
CC: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
  peterz@infradead.org, boqun.feng@gmail.com, Mark Rutland <mark.rutland@arm.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, parri.andrea@gmail.com, andrzej.hajda@intel.com,
  guoren@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: leobras@redhat.com
Message-ID: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_092337_265769_A9333112 
X-CRM114-Status: GOOD (  32.81  )
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

On Thu, 10 Aug 2023 09:04:04 PDT (-0700), leobras@redhat.com wrote:
> On Thu, 2023-08-10 at 08:51 +0200, Arnd Bergmann wrote:
>> On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
>> > xchg for variables of size 1-byte and 2-bytes is not yet available for
>> > riscv, even though its present in other architectures such as arm64 and
>> > x86. This could lead to not being able to implement some locking mechanisms
>> > or requiring some rework to make it work properly.
>> > 
>> > Implement 1-byte and 2-bytes xchg in order to achieve parity with other
>> > architectures.
>> > 
>> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>> 
>
> Hello Arnd Bergmann, thanks for reviewing!
>
>> Parity with other architectures by itself is not a reason to do this,
>> in particular the other architectures you listed have the instructions
>> in hardware while riscv does not.
>
> Sure, I understand RISC-V don't have native support for xchg on variables of
> size < 4B. My argument is that it's nice to have even an emulated version for
> this in case any future mechanism wants to use it.
>
> Not having it may mean we won't be able to enable given mechanism in RISC-V. 

IIUC the ask is to have a user within the kernel for these functions.  
That's the general thing to do, and last time this came up there was no 
in-kernel use of it -- the qspinlock stuff would, but we haven't enabled 
it yet because we're worried about the performance/fairness stuff that 
other ports have seen and nobody's got concrete benchmarks yet (though 
there's another patch set out that I haven't had time to look through, 
so that may have changed).

So if something uses these I'm happy to go look closer.

>> Emulating the small xchg() through cmpxchg() is particularly tricky
>> since it's easy to run into a case where this does not guarantee
>> forward progress.
>> 
>
> Didn't get this part:
> By "emulating small xchg() through cmpxchg()", did you mean like emulating an
> xchg (usually 1 instruction) with lr & sc (same used in cmpxchg) ?
>
> If so, yeah, it's a fair point: in some extreme case we could have multiple
> threads accessing given cacheline and have sc always failing. On the other hand,
> there are 2 arguments on that:
>
> 1 - Other architectures, (such as powerpc, arm and arm64 without LSE atomics)
> also seem to rely in this mechanism for every xchg size. Another archs like csky
> and loongarch use asm that look like mine to handle size < 4B xchg. 
>     
>
>>  This is also something that almost no architecture
>> specific code relies on (generic qspinlock being a notable exception).
>> 
>
> 2 - As you mentioned, there should be very little code that will actually make
> use of xchg for vars < 4B, so it should be safe to assume its fine to not
> guarantee forward progress for those rare usages (like some of above mentioned
> archs).
>
>> I would recommend just dropping this patch from the series, at least
>> until there is a need for it.
>
> While I agree this is a valid point, I believe its more interesting to have it
> implemented if any future mechanism wants to make use of this. 
>
>
> Thanks!
> Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
