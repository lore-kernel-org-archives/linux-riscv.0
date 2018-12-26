Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A4DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 17:19:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 907EF2171F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 17:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I9h4CSqq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VSxpWG9Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 907EF2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=lbUbp8Eabv7sGpWzd92ayclL+DhwNZGZybul+at4J8M=; b=I9h4CSqqPEXXYbap8IFpTHONz
	W4O7Ed6a48cN3niOw/0OIs7O5UrjTKL/Rbk5gLyPdN7IMrkb8OtFSEgPWRhrjfOegnYKfgzhp50nq
	7YOo69gom7AW6TValqvmnkJYwPC7umJ7xI5w63R1zH7qXgEwoVgYabdPkA6bXIQjlM3M4y0MMFfZh
	iqWaznu3O2q0fvAt+w0dKd2LRTJS7nHE9IgyAp35imEjBN32Glv04ZAJv1NHrJJLp+eakalh3/CZf
	FfQM+F4TM3Cy6+mtx5czD2MdRHtkYvxhMNwfW9r8w/7xVSKDuPdhtUUPtgT6eSq+a3bwXf2QAzI1w
	8lttiSIGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcCqC-0006Xw-Eb; Wed, 26 Dec 2018 17:19:32 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcCq3-0006Uy-1c
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 17:19:28 +0000
Received: by mail-qk1-x744.google.com with SMTP id y16so9619957qki.7
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=j1UgHHk+DZRpI/p+f+3SMlTjJvqWup5u+FaeCDkLFHE=;
 b=VSxpWG9YnDu6T7igdoBS0wDIErfbCuI2sJC37cXNlFc4obTa0p8+czGaBbtbEfYdAz
 8207BjhvgcSUvOmEBKHdao5jPIPr6CKye/y4vUu38ME8ukXHBi8OAU8oD40PXF0Dh2TM
 Tx0UOO7YPbtECM1Nlt56of6scwhkBXfM72G9A5xxq3TYDZZXnR/G1fjYyqA77YXvxihn
 z20LRoyrAy/MmSeAqQi+ELeN1XFmRh4dk1fxkk80epyDDgbdsJWMETTHi8Be/7N2LovM
 gjhqSoGL+FNDTJLZM80m9E+/m7x1Y68TGzm9ON9eVfX1yzttlPV5VF2vSvQ/foiLj6eR
 NhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=j1UgHHk+DZRpI/p+f+3SMlTjJvqWup5u+FaeCDkLFHE=;
 b=fc/ikli8bz2DgtaLF+psM2Z1lI4NjGE/8QB88vus70dn/oqJsf6fw9e4lls6ks1zbS
 VjX7Fr0x3OFaC55UBgsPFt5WhlrzgCpXta8LzfcyxBwfa90z4VrMMZNZdeQoHtR/cJoT
 kYTnRK5Hgvdcqczp9AUqn73LzMH9cHWF6ej6Wk9Ikh0r3Evi+asJ8C7RtiLQ+5p2pXS0
 RPZL8aRwR//OnfHzMmbEVL1hk436pcJljHTg65b+T/Yq0qWWAFnbq2+vcIJOXgsy72i7
 zezJ1yIwYMQ1YZgiDaeDryeoVNuOfYgAe+LT8Iy622gVsKnVGD2FwT9+cxLFO7gDdpLN
 TJUg==
X-Gm-Message-State: AJcUukcoj7fOpbm5QaOu8n0emEV6oKBJSoy9/mrrcrLPZeMfQPNtO8mU
 keib9ZzX0A1T+kdLu7UFXgGVzAyMRM0=
X-Google-Smtp-Source: ALg8bN6Q7bA4lVV4OSKv+db0cEogUy/jRCfNp2DNKgtYe38Cj9qBHA5X+0BOt0p+5smb877AD7+pUg==
X-Received: by 2002:a37:6b42:: with SMTP id g63mr18174506qkc.297.1545844751181; 
 Wed, 26 Dec 2018 09:19:11 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id p48sm15501724qtp.62.2018.12.26.09.19.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Dec 2018 09:19:10 -0800 (PST)
Date: Wed, 26 Dec 2018 09:19:10 -0800 (PST)
X-Google-Original-Date: Wed, 26 Dec 2018 09:12:21 PST (-0800)
Subject: Re: [PATCH] tools uapi: fix RISC-V 64-bit support
In-Reply-To: <20181225144624.22402-1-aurelien@aurel32.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: aurelien@aurel32.net
Message-ID: <mhng-73e120d5-76aa-41e2-9fbb-d2ee3d8c304f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_091923_090932_DC66A460 
X-CRM114-Status: GOOD (  21.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aurelien@aurel32.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Dec 2018 06:46:24 PST (-0800), aurelien@aurel32.net wrote:
> The BPF library is not built on 64-bit RISC-V, as the BPF feature is
> not detected. Looking more in details, feature/test-bpf.c fails to build
> with the following error:
>
> | In file included from /tmp/linux-4.19.12/tools/include/uapi/asm/bitsperlong.h:17,
> |                  from /tmp/linux-4.19.12/tools/include/uapi/asm-generic/unistd.h:2,
> |                  from /usr/include/riscv64-linux-gnu/asm/unistd.h:1,
> |                  from test-bpf.c:2:
> | /tmp/linux-4.19.12/tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
> |  #error Inconsistent word size. Check asm/bitsperlong.h
> |   ^~~~~
>
> The UAPI from the tools directory is missing RISC-V support, therefore
> bitsperlong.h from asm-generic is used, defaulting to 32 bits.
>
> Fix that by adding tools/arch/riscv/include/uapi/asm/bitsperlong.h as
> a copy of arch/riscv/include/uapi/asm/bitsperlong.h and by updating
> tools/include/uapi/asm/bitsperlong.h.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  .../arch/riscv/include/uapi/asm/bitsperlong.h | 25 +++++++++++++++++++
>  tools/include/uapi/asm/bitsperlong.h          |  2 ++
>  2 files changed, 27 insertions(+)
>  create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h
>
> diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
> new file mode 100644
> index 000000000000..0b3cb52fd29d
> --- /dev/null
> +++ b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
> @@ -0,0 +1,25 @@
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Copyright (C) 2015 Regents of the University of California
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
> +#define _UAPI_ASM_RISCV_BITSPERLONG_H
> +
> +#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
> +
> +#include <asm-generic/bitsperlong.h>
> +
> +#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
> diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
> index 8dd6aefdafa4..fd92ce8388fc 100644
> --- a/tools/include/uapi/asm/bitsperlong.h
> +++ b/tools/include/uapi/asm/bitsperlong.h
> @@ -13,6 +13,8 @@
>  #include "../../arch/mips/include/uapi/asm/bitsperlong.h"
>  #elif defined(__ia64__)
>  #include "../../arch/ia64/include/uapi/asm/bitsperlong.h"
> +#elif defined(__riscv)
> +#include "../../arch/riscv/include/uapi/asm/bitsperlong.h"
>  #else
>  #include <asm-generic/bitsperlong.h>
>  #endif

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Do you want me to put this in my tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
