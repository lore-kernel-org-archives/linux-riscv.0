Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C66FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 00:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01AD061AF9
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 00:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01AD061AF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+ovOrUXR9KY7rw/XbqDqeFCGnXOrgjItCoc1G5h+JJY=; b=OAvzRSVvY9KJVme8bVXELi6/h3
	gX4PtyuL3oqHyAdN2z5QnRTXyMhHJhwSWz2CwmrPSBA3BRsb+/JDuSJAR25MxaAXB2sAZgeQG63hx
	jWVL1tPzsHrMM7JJk5FC2LI+qKCw4SCd8fAl1ibEtyL6lQ7CttVO+OhAJUHjeNObrwI9IybSUaoWd
	/ZN9z6LCa6g9SnrSQT3C0Q/ekivMKuRcLCKUc2xPYbcsyFHWIqu6EBw7tUXtm2JcSqe0zB1wuYRPQ
	aEWqbz3ChVFu+vQJsel+DvdYdFLhvaSRfHVaifIwuuKbKrNLppPnwO9rRclbeEPcX4r4qLNOLgua0
	4zzYw/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWpmp-002yrt-FA; Sun, 03 Oct 2021 00:55:27 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWpmm-002yrD-Ia
 for linux-riscv@lists.infradead.org; Sun, 03 Oct 2021 00:55:26 +0000
Received: by mail-vs1-xe30.google.com with SMTP id n17so15587914vsr.10
 for <linux-riscv@lists.infradead.org>; Sat, 02 Oct 2021 17:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=djJsGg90kg4oJko+2Lt7RSfBk+xtjnXBU952CSew/TQ=;
 b=XdP+sFc8kz42JiRzrAVzpPKTLaB2xs9MWKfHmXaWBU7h9acHZCr64GP/p3l51Bz0ng
 9LOhQcobxVJfv4tkb5cQ55um5eGZq8dVUS3606qhKXzy5S0E/eaRQT/Km2L/oZ4NhXFm
 /nNr8Smk+U3CURKe6bgvr69n8FQ0nvstFJxihGHL+5PWNi6DzBXr6bHvIDfCJQxfgO2I
 xxN2ftbqhTnhPPsvv5cPO97l5H7nBJ+cWTvJJ8LnjGX2Pt+jAVG/GLy/9nPtBcAkaLDG
 ZSPtVbunYqN2jDX/tFa9WVmKvHoHzPOibKj/40YxCNXx8bjHEatqeoKDZCiRK+dW9p2I
 xtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=djJsGg90kg4oJko+2Lt7RSfBk+xtjnXBU952CSew/TQ=;
 b=l0Ys9Ep3ioTzwXqBDaZOY9qK47uoKy0NXwyyGivVh5DlX/LE1LbkpTObuPx45v9jAQ
 cIqnhPWmi5TeUBty4CnrntDZCHf0b94RqQsXwKKHLIJ6YADGuEiWVR8e6LbciZMVOhnA
 4NlO0fAmYaYgxcqdCM9hymWlGhhsJi5WYihLO8S09Sydq4BAinbLOy4aM5V07bhUP8A1
 CkyKBf4v+wrRDNCjAIyOnk00MzCk/vae0vjP1VQ/KD6R/SQsdvxsgoLjIyVlhKm1qhDo
 SzCj6QmjVBenUe/mUNZQFyqMLMPzfJQfMNA2MjtmuHNqOsu0kgJmrhZig6TCer5/TzJ4
 dHkA==
X-Gm-Message-State: AOAM531203ArVkRwT3X5lNydERUdhCVXGSKfCj1x9EwPu7W3h1E0khkq
 baRXaTO3UTFCO5J+nsgvTV2kKNcKd2XQfg==
X-Google-Smtp-Source: ABdhPJzwIlGKaimVyAAJjK10WOqm0/se1s1ilSVs0DCa/ocQj6kYd9j8c+bqxCVKgrk3gE5ne2qZDA==
X-Received: by 2002:a05:6102:3bc7:: with SMTP id
 a7mr9193504vsv.18.1633222522914; 
 Sat, 02 Oct 2021 17:55:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r3sm5251665vsi.23.2021.10.02.17.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 17:55:22 -0700 (PDT)
Date: Sat, 02 Oct 2021 17:55:22 -0700 (PDT)
X-Google-Original-Date: Sat, 02 Oct 2021 17:20:59 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Inform checksyscalls.sh about the rv32 ABI
In-Reply-To: <CAK8P3a19pW2o7TRKBgM5g3-=g_iZgS9pqdphNdu3fpY0d+L5Pw@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-489c7e27-e598-40b8-99fe-8c577d4e8ed3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_175524_660537_B76E69A3 
X-CRM114-Status: GOOD (  21.82  )
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

On Mon, 06 Sep 2021 15:57:32 PDT (-0700), Arnd Bergmann wrote:
> On Mon, Sep 6, 2021 at 8:52 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> I remember having seen some build output from this before, but didn't
>> know what it meant.  These are now showing up as errors.
>>
>> As far as I understand our 32-bit syscall ABI is fine, the issue here is
>> simply that we don't need the syscalls in question because we never had
>> the legacy versions to begin with.  One could imagine describing these
>> constraints in an arch-generic way, but I'm not sure it's worth
>> bothering until another arch comes along that behaves this way.
>>
>> Fixes: d4c08b9776b3 ("riscv: Use latest system call ABI")
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>>  arch/riscv/include/asm/unistd.h | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
>> index 6c316093a1e5..cbc2646b4662 100644
>> --- a/arch/riscv/include/asm/unistd.h
>> +++ b/arch/riscv/include/asm/unistd.h
>> @@ -14,3 +14,17 @@
>>  #include <uapi/asm/unistd.h>
>>
>>  #define NR_syscalls (__NR_syscalls)
>> +
>> +#if __BITS_PER_LONG == 32
>> +/*
>> + * RISC-V never had the 32-bit off/len syscall flavors, which means we don't
>> + * need the the explicit off64/len64 versions.
>> + */
>> +#define __IGNORE_fstat64
>> +#define __IGNORE_fstatat64
>
> These should be in the checksyscalls.pl script: new architectures can all just
> use statx() here. This has nothing to do with 32-bit off/len though, only
> with time64.

OK, I've sent a patch to add it over there.

>
>> +/*
>> + * RISC-V never had the 32-bit time_t syscall flavors, which means we don't
>> + * need the explicit 64-bit versions.
>> + */
>> +#define __IGNORE_clone3
>> +#endif
>
> clone3 should be implemented, IIRC it's only missing because there is no
> easy way to do an architecture-independent version.

Not sure what I was thinking when I wrote that one.  Luckily there's an 
easy __ARCH_WANT_SYS_CLONE3 now, so we can just use that.  I'm not sure 
why it never ended up in rv32, maybe because we were only testing rv64 
at the time.

I sent a patch for this too.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
