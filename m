Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A7BD609C2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6IViQwOwBHfO3mXeHkUatjBidTx1Qz0S4fbHzbjahs=; b=bGKS4g2vZejnKO
	2pWhFV5/3MoL1tQyxh2J674ZTro9YHwt/5lDNlk4+iwbnY3hC7JBDisdybVIdqxeJ5Cgjx5VutHmQ
	Br6n1Cpgod+43GxXldE7tlKPYqTJlGbeNkEGv5LOIbE0UD2esSQN0fxBhhZuqWY0B7d7izhHRzO0O
	GVdieBSBNP1y4k/TwbgQ+xn14NC8J3Mnzp8p7ma02vvdjO2sC9LJo1nBfMbfpk2cR9V6ySzAAP5yW
	nS3hDjhnQHe4rsrcK8T7PBu9BH6y+2C6pIopa+X4kztDRs6lOv+9uSWDsa2RwxSAF0biuQvTSMWV1
	xnmo6/R4beUhiphVXTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZ1K-00000005cfw-3Eb5;
	Tue, 16 Dec 2025 17:39:34 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZ1F-00000005cfG-0DDJ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 17:39:32 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78ab03c30ceso44207117b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 09:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765906768; x=1766511568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDRVcNBtR+iW6Yf99Q/xL+9AQK2g/UaoVu1pJaWUN/8=;
        b=LjcyD6wHMPyY/xi8wkfbg1wIlYPAArwVqgap1iUPahMnJWxnfUYFBs/TfZM4bZhBrT
         9uxM2BpJ5OvQxFP+e8H/MhmEx6aDZnwW6Qm6ijq33ZbYO7l11bkrsXjKQBSwUz5DjOBH
         X9u61k4ceJs2+eFk6zitZQilQDaECd7wqirZZ2Xp0HW9i9usQOeXzeHitJYLziX/5Qoc
         3uoXI93IyZO3PuykSN/BMQY23llYKK7EdHQBd0d3R8FBYPpK8m5fv8A8Rbu3ivgCa2Ka
         tl6nsFSPcp4wh4DBXUJImQMHkZpYYOOd5gB+rrxUXV4KuEmRsLliZOvOt7h1o/9nD0k4
         bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765906768; x=1766511568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDRVcNBtR+iW6Yf99Q/xL+9AQK2g/UaoVu1pJaWUN/8=;
        b=AlbSZULEdUSZ0fqUSud5cloNmq1SPPZmreaPcNcPeUMaK+9zLtYCiHAcF34f9UuPLG
         NxYRnFp5CYrBdLLhYVMT3rzHxdTGCbbm+chwwtAddJbKthITPvCVvm0gTH8v8CJIQzF2
         1xS+1KxnBxNBKCtGgw5t1A9UI2keOZ06G68Li2EZsouMRq75i7YUwghozIX6mHJ2noUT
         o01kUO2uW4QG7eKraB7KHdXQnc2XY7oMqXqwhL+oIC+MDeDdtBkUla4AUlGvRYM0YyIB
         pTVt3j26huC4MZTUu83ped/p5Fzx3nQqsCFGoQHaXRrONDmUDPNcu0UeDGlCQqAlGklL
         5/bw==
X-Forwarded-Encrypted: i=1; AJvYcCUOlsAWoylrjBCT3eC8XbGfpt921KVT3b+r3W/Ik3Pqatlu3ePChEcraboDI8IIEFZWaJHvCJcpeKnerw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhniJktT1g+thHzZBPEIU/vxTLgw1xVzkRxqJiL4kYEZYPq6f6
	0aaT3zo9ej0R71IPJqCFM+5A7XwJFJ25fGYZ6DqU8zPTyrylvQ3hflFL
X-Gm-Gg: AY/fxX4Nnr1O/T0dalV17QShta7qUEvw5NYPd1tFDUArwNDYHMyGr1X5MQOqy+rSqiU
	ZDQkTnfsiUYSnGdfY3KQCeAXbPwtO5ZzO4/LUhnwWO8+4c+EYcr8AWDw9K0e2bp4Ri9YM+CsOSp
	43bXQybAuW3qag6GfHAC+gitNFIpix5FexUfRsWnmTtX5f7kSF8Gu84TtejtM/eNoLzCxOpayH4
	e9Tg5nCtSDFcTO8vYh4OItvPfO52ZWU9isSQFv4fzie7oCygqxAbWPI9tn2e0AG9/f61+YyzAP1
	dcLctAJS0Tol9og3UQN5rwYv+Jn0h/WFvXKB6qdM83TlDOZb4g262oez7vfUFCIg+2pworXpFU0
	9a3gQrLyayJ3604laX7X7/a5ldLwwXypYYxnJBXD5yF8bjOEw93/5OsS0ciLy4rsMsoqq71GW25
	1HApz5OboKeolnILOMfw==
X-Google-Smtp-Source: AGHT+IE3NinGFdKlAN7UhDAbPKCkBHxHtNBkcwDeZ6wptkYuBgdRACzHAMbsJH1rL1T21esZqKIaWg==
X-Received: by 2002:a05:690e:1248:b0:641:f5bc:68e1 with SMTP id 956f58d0204a3-645556680bamr11330010d50.78.1765906767566;
        Tue, 16 Dec 2025 09:39:27 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:7f3c:658f:3c84:2aa3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e74a57202sm41212187b3.57.2025.12.16.09.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:39:27 -0800 (PST)
Date: Tue, 16 Dec 2025 12:39:26 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, andii@kernel.org,
	andybnac@gmail.com, apatel@ventanamicro.com, ast@kernel.org,
	ben.dooks@codethink.co.uk, bjorn@kernel.org, bpf@vger.kernel.org,
	charlie@rivosinc.com, cl@gentwo.org, conor.dooley@microchip.com,
	cyrilbur@tenstorrent.com, daniel@iogearbox.net, debug@rivosinc.com,
	dennis@kernel.org, eddyz87@gmail.com, haoluo@google.com,
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk,
	martin.lau@linux.dev, palmer@dabbelt.com, pjw@kernel.org,
	puranjay@kernel.org, pulehui@huawei.com, ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com,
	sdf@fomichev.me, song@kernel.org, tglx@linutronix.de, tj@kernel.org,
	thuth@redhat.com, yonghong.song@linux.dev, zong.li@sifive.com
Subject: Re: [PATCH v3 1/3] riscv: remove irqflags.h inclusion in asm/bitops.h
Message-ID: <aUGZTkLGYuew7-s1@yury>
References: <20251216014721.42262-1-cuiyunhui@bytedance.com>
 <20251216014721.42262-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216014721.42262-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_093931_115335_D0EDCD3A 
X-CRM114-Status: GOOD (  15.92  )
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

On Tue, Dec 16, 2025 at 09:47:19AM +0800, Yunhui Cui wrote:
> The arch/riscv/include/asm/bitops.h does not functionally require
> including /linux/irqflags.h. Additionally, adding
> arch/riscv/include/asm/percpu.h causes a circular inclusion:
> kernel/bounds.c
> ->include/linux/log2.h
> ->include/linux/bitops.h
> ->arch/riscv/include/asm/bitops.h
> ->include/linux/irqflags.h
> ->include/linux/find.h
> ->return val ? __ffs(val) : size;
> ->arch/riscv/include/asm/bitops.h
> 
> The compilation log is as follows:
> CC      kernel/bounds.s
> In file included from ./include/linux/bitmap.h:11,
>                from ./include/linux/cpumask.h:12,
>                from ./arch/riscv/include/asm/processor.h:55,
>                from ./arch/riscv/include/asm/thread_info.h:42,
>                from ./include/linux/thread_info.h:60,
>                from ./include/asm-generic/preempt.h:5,
>                from ./arch/riscv/include/generated/asm/preempt.h:1,
>                from ./include/linux/preempt.h:79,
>                from ./arch/riscv/include/asm/percpu.h:8,
>                from ./include/linux/irqflags.h:19,
>                from ./arch/riscv/include/asm/bitops.h:14,
>                from ./include/linux/bitops.h:68,
>                from ./include/linux/log2.h:12,
>                from kernel/bounds.c:13:
> ./include/linux/find.h: In function 'find_next_bit':
> ./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
>    66 |                 return val ? __ffs(val) : size;
>       |                              ^~~~~
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> ---
>  arch/riscv/include/asm/bitops.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 238092125c118..3c1a15be54d80 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -11,7 +11,6 @@
>  #endif /* _LINUX_BITOPS_H */
>  
>  #include <linux/compiler.h>
> -#include <linux/irqflags.h>
>  #include <asm/barrier.h>
>  #include <asm/bitsperlong.h>
>  
> -- 
> 2.39.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
