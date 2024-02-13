Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E23FC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 21:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkQMJtniJt1sGMDccFhb32BsQTIaKOFqLWFdQZxif+8=; b=YL6BMDBAMiL06P
	O+4zPS8sSi0Ek1Xwt2vIZbt/5hX5TsKEqPZj6kP2AxOIMm2rNB5Y8X1ob/KA8FjyDCJRnGL47RI4W
	DLJiL3ypK7FYpL+1DUMrBDGtShTAbJsGxRllDZe3wKddFRvt4qoPtd2043QUp099b/VEGvaOmVWzH
	9VucKOPZXRcEmZDfK8nt2fZreFaHcfDnTOvn1uGE2+IbI6NscAEy5OUl9bNv4AtTjrEgin3lnYfbw
	WsRs6fZF5rdfXvk8SLXJYR/u27eBpWtqP3pbQaCIUORWBWYGGXfrbQPo1F7khfL9pZlSasAzEjEX2
	2ZqqR4AZLOzDenyJb2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0N5-0000000ApT1-2RSR;
	Tue, 13 Feb 2024 21:31:19 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra0Mz-0000000ApSW-4BTN
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 21:31:18 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-787225a2addso39077085a.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 13:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707859872; x=1708464672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYDJgiAqQGDP9GzbDPgSy0bCIuBLtER9XQ6AW4LDXW4=;
        b=DBxe6gLDnRyQPoUugQ9SRdinHavxcP+lE+y/XumtsZSb0cWCVO4c7bRhrZO6PxBGWN
         AWmJ1LT63zKNJ4iuk+i4J/y24aqK+LfDWjklCzo2mDTS+R1+z/H4JUT7IRCRhHGjB4BT
         dDlHofTmCOlD+dFWVnNEEOLK+fN+QXJykfIKJHhkqrlJbE8AxiclFi+nEaAFiHiqWBr6
         +w9y3bGSLR+F5IrsEj/AHDohThiI8CItsvzBFHkhpanxLvWGd3y3sNvzhns8Mywn6zMl
         Z9EiPHYjK9O/tAayUt3EcEJdrve5HRuAHG6R3J26dOJZ5WwPihIVtAd0nO97OoAvmafo
         dHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707859872; x=1708464672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYDJgiAqQGDP9GzbDPgSy0bCIuBLtER9XQ6AW4LDXW4=;
        b=u3mDxLQqSZ9gW5PkQHxHO5aT9dj/gu/RMzmidtxz/ny+iuPA8AuBKkPbxZJyKioiVH
         XHq9pCBw+btoBr7lIqLrEbqHLoT6Znxm7z4nvthP0s0xT8+X2ojLiJQxGGg7CTSfiFiY
         AS8JEOcR/yFjFqsLC+Hv2k/gsABy9rzJuVYRZMXDzPvf33Esd9kmzrBe1122fgLl/JMc
         FFcn++MYQvCayHdZmshAi4SKVfF1TgU6Ba75lSz4FCtEvkp1ujyzedqymYmEEO9YkLXh
         +zlc5HN+I9CJxdsyesiSZIPzkGo0Sy9blvvTEGBxyyLfPLiNPYptmkokfsbuntX276r9
         JP5A==
X-Gm-Message-State: AOJu0YwjxZoOHoUARInCC0bKUVoQhzvqn6OwAeM55D+G/6v4P8dJfWSm
	0yB5aGnD+ULHmjEn0ri7YDF1HlUi5yxAB/ETTlYFWXQYU/HODVlxVmipzGUoLYEC3lzjQhZnKVw
	c
X-Google-Smtp-Source: AGHT+IHX5ZndTgR3eB3QRccjYFz6p/B01Rxl6VSza90Zs12k6nHa+nYxGtGAK3tnBpKEI6San/qQng==
X-Received: by 2002:a05:620a:4590:b0:787:1631:6920 with SMTP id bp16-20020a05620a459000b0078716316920mr1029472qkb.34.1707859872527;
        Tue, 13 Feb 2024 13:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+BDpt4pBjCo/TnTlQWv/RqyO2ITx8HDD405KDduEgmwpfU99upKZQBNXadPD86wkWEO518ONVRpCM19z3Mggm5L4+2fTCH2q2L7NeRVMflHX4HjAkuguQvFriU5HKvtXBpcYrICdOOVZV6DMMiBp+p8trk4/JBFLJOcLEk/vI0Yd7Awn8tB0tXj/C7hECIhcF
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id v15-20020a05620a122f00b00785d3729eb0sm2265833qkj.41.2024.02.13.13.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 13:31:12 -0800 (PST)
Message-ID: <2d4d939d-4b49-44d7-8405-e075de844884@sifive.com>
Date: Tue, 13 Feb 2024 15:31:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] riscv/barrier: Consolidate fence definitions
Content-Language: en-US
To: Eric Chan <ericchancf@google.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240213200923.2547570-1-ericchancf@google.com>
 <20240213201210.2549488-1-ericchancf@google.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240213201210.2549488-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_133115_859669_D30ADE3A 
X-CRM114-Status: GOOD (  13.46  )
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

Hi Eric,

On 2024-02-13 2:12 PM, Eric Chan wrote:
> Disparate fence implementations are consolidated into fence.h.
> Also introduce RISCV_FENCE_ASM to make fence macro more reusable.
> 
> Signed-off-by: Eric Chan <ericchancf@google.com>
> ---
> v3 -> v4: fix the form that can pass the checking of checkpatch.pl.
>  arch/riscv/include/asm/atomic.h  |  8 ++------
>  arch/riscv/include/asm/barrier.h |  3 +--
>  arch/riscv/include/asm/cmpxchg.h |  1 -
>  arch/riscv/include/asm/fence.h   | 10 +++++++---
>  arch/riscv/include/asm/io.h      |  8 ++++----
>  arch/riscv/include/asm/mmio.h    |  5 +++--
>  arch/riscv/include/asm/mmiowb.h  |  2 +-
>  7 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index 31e6e2e7cc18..19050d13b6c1 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -17,13 +17,9 @@
>  #endif
> 
>  #include <asm/cmpxchg.h>
> -#include <asm/barrier.h>
> 
> -#define __atomic_acquire_fence()					\
> -	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
> -
> -#define __atomic_release_fence()					\
> -	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
> +#define __atomic_acquire_fence()	RISCV_FENCE(r, rw)
> +#define __atomic_release_fence()	RISCV_FENCE(rw, r)

This change removes the omit-the-fence-on-uniprocessor optimization, like you
added some instances of in your previous patch. Should we keep this optimization?

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
