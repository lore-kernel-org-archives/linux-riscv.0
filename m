Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEEBD31A38
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEceEnpbX1mK7HKsPgERd5qDwPo4RaU77eCWoR1GBvM=; b=HgpAgqaunILlU4
	rHVNQn7zsDP1Iaf4Iz47Vq2YkzH/AUfHRFAVs3h7QZIF2qhqJTq+fMIsJHhRaFUwByNWOERB/XGlx
	ibx3uKWlbqSlOkqxrq7Pipg2cxO0CH6pPTTw4JbEgqPpbwidg02VAv7u/iG9YiCB/OPa9umu+peSn
	F0X88LNalDjmB8TR7UvJoFonv7ysq86j7Dj52lLO7uM/jt6mfeeNBFs/V2fPq1VWoibSBYNvKqcQu
	XLlDwtWl16RA1AQmTBG89WLXF8qbUOo7e6WR9+Lr/dRJCbQAlLaVqnZebG/RB4gzNJQYIGz2kQhXb
	Dv6DD8rqX5BVQVpH0nIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxpv-00000008iUE-22hU;
	Wed, 14 Jan 2026 10:10:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxpp-00000008iOt-3qxU
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 10:10:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so38570525e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 02:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768385436; x=1768990236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTsZYQGV8ojRPa+c6PpWwRS4BhgS2Cix60DMHYVltjQ=;
        b=DPkSwYXQeVsAdSMD99KSUo+mR9mdZdZ58qO4hzL5YNceaCT/9t8Vd6i6n16oMnk9PB
         keLAA/LJVaJs4vUezbp6bNHtZ/9I0wpJoJYNstRdVSrN6m28ooTmmgJujjwa8XSetHED
         wHmcMlqSK8YLM7yQSOOMD8htQEbe24b58hv/wGPKKNSKlqYOBQuLjPw0Q8SVvMbAemlx
         krYPPTOmDuskMnAI/KvC/Bs/EYZPLDGQ1smi96ygwFQyMhcPpFF7Br/4S5Gu1FgDuZZY
         Mt9pKDn48ojd2PjW0Q9p40na34w9WuONbqufLnvkayt1CoKa5EIHEYTuIjxL5F1jHwNI
         hZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385436; x=1768990236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iTsZYQGV8ojRPa+c6PpWwRS4BhgS2Cix60DMHYVltjQ=;
        b=SrjLYSQbhTJyR1Wr/IEHLGVRXZ5KxRm334YkVd9NQhS8+EymrRJZhBIHcNG/brYToL
         68NZhabRTShnd+voiJAd9e6vUTZBKk39rj+U8H8tv3yhvepfwRhK67yWngosPFrV/LaS
         8mNYKtJl9Hq8gGGasw3VOCneVZSbLu42p+NDIVv0Rc9WPIrANTv9aeE2YZZAZMzmRZ/S
         cIXyq3KjxAf8L5uG7fvZj6RZFM8v2L7rL8kvEHAe66UZN3OeI+0QN4/o34u6gz4CZmay
         7DznjrqceH5GD9kaCdVeR79ATatxw8er+Ihkxh1z4mraQobkJUemQLV/uMWrrT40RjTk
         Y9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpZtAbtXal1GqJKUyvDMODU+TgarIHVIzfGP4bV46l7Ic4dhHFlsEjtVZ76p/uyWwOLvBbz/8bkFYKjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3dYVTZiWKczGa7lDcBneqg8Htx3iT7D+IWZhIcjW96/hVHdS5
	Tha19n3OZ0Xq03XxpD8HoP+Edj7fHyozFXNZ6EPQtb8b8im/HLH8mdvb
X-Gm-Gg: AY/fxX40pbKAi8YySA56SBgTVLrw/f3eAhtkegAFe0vaPkIC6glf0ZtGuQ2Hm3Lal0y
	t2x7AWJqq6vSVs9RUcvoYCbw00Dr0CktnFhrKk41UxiZwYqF2+x66JiIu9MGQxrSxeBMGYtc3MW
	HBAzMvNQrNqvZH90TP6X+K8HdwRIU6DO0HGZRSMGDOkLTk0ZmOZHQeh8Vk1/q1DXbXA1cIS585H
	0ak9+/Kdz6W2npgYj4sivyBTaDUogMRotg8U+595jC+JSLzbXG3BtK0aKSrz+avKdcUQxS2FQrt
	KmBYK86u95okZAgc60kR0O+QI4d007AHzEnOm7Xb72iJdyBtRMLsPBk5nmVyrrICQxZ9oyItlWu
	5qZ9zrBxm9bP70xkWqd/eyYstEszZbFtfwA/ese7eDKmKSQJaB58/cy77BEBkliLpJnku3RRnd6
	etuLCyHWYO4CwypNj71vx3OTz0GPV7t1VYnk9yREROKxOcdS4DvzSO
X-Received: by 2002:a05:600c:1395:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47ee334407fmr21631815e9.12.1768385435670;
        Wed, 14 Jan 2026 02:10:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57fe917sm20267895e9.10.2026.01.14.02.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:10:35 -0800 (PST)
Date: Wed, 14 Jan 2026 10:10:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, kees@kernel.org, andy@kernel.org,
 akpm@linux-foundation.org, martin.petersen@oracle.com, ardb@kernel.org,
 ajones@ventanamicro.com, conor.dooley@microchip.com,
 samuel.holland@sifive.com, linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into
 __generic_strlen()
Message-ID: <20260114101034.7961852a@pumpkin>
In-Reply-To: <20260114000151.GB2178@quark>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
	<20260113082748.250916-2-jiangfeng@kylinos.cn>
	<20260114000151.GB2178@quark>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_021042_015637_3D765A77 
X-CRM114-Status: GOOD (  14.53  )
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

On Tue, 13 Jan 2026 16:01:51 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

..
> A similar problem exists with the architecture-optimized CRC and crypto
> functions.  Historically, these subsystems exported both generic and
> architecture-optimized functions.
> 
> We've actually been moving away from that design to simplify things.
> For example, for CRC-32C there's now just the crc32c() function which
> delegates to the "best" CRC-32C implementation, with no direct access to
> the generic implementation of CRC-32C.
> 
> crc_kunit then just tests and benchmarks crc32c().  To check how the
> performance of crc32c() changes when its implementation changes (whether
> the change is the addition of an arch-optimized implementation or a
> change in an existing arch-optimized implementation), the developer just
> needs to run crc_kunit with two kernels, before and after.

For the mul_div tests I arranged that the test code could #include the
source for the generic implementation so it could run that as well as
the version compiled into the main kernel.

This involved wrapping the function in:
#if !defined(function) || defined(test_function)
type function(args)
...
}
#if !defined(function)
EXPORT_SYMBOL(function)
#endif
#endif

So the test code can use:
#define function generic_function
#define test_function
#include "function.c"

to get a private copy of the generic code.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
