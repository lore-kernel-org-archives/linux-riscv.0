Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AB2C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5548360F4F
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 00:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5548360F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=d+3kKSVwTPx5KP+tg9SH0LYNhpseWq511dEMa7+gK+Q=; b=cQt0VGKCFIbvti7hRWG/N23o6d
	eBQb+G2Zp6SJiI9J07s3Rjhw5wRUlcTI9O6QHmRC2h9k0g/ssCCH/VSXpXxRWq0z+7BLo1R7mtmqj
	LZAAM01BSlmTv1bCfLcyXUFixUpgl/omjo7dyoCJSHJBKYWN5FG+TwiOrTwX3nl7jqqaLxjcdHVXV
	qGQ6v+YH+sTL3JdWdwz+aLIerZ5aVHFwgnlOv8DDiXoQbvltkRyiwos/v9cxwW2e1WOxxOnO/aIyH
	kkQpaJGCdTH/S/yqx88fFN7rIX7S+BVcBsSvT1+P9IOvYN5Zl2lfo/mK5sF0IKj/RhJ6mLpRud7Zh
	fcwyK9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXYVk-008TL1-23; Tue, 05 Oct 2021 00:40:48 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXYVh-008TKV-Cv
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 00:40:46 +0000
Received: by mail-ua1-x92c.google.com with SMTP id f13so7854407uan.6
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eu6xQaZ+L/7SEbm2kM+MqievePKlsmmZKrxh7/j0Gx0=;
 b=bYFTdC458YYvLwQWaj0LutyFeNvzV2xOB8z/FiTrRLph+G40abtUQCO7uUSITFUICI
 Q6cb7RZQtPqpGs1yeUuyknrm9ehOepAPItJA8O2rB7N9n70BN4qJD5/t5kPv0rOI0Olo
 z+WrLDXkCwM0aBqbChhu8CfCefkTcdgpyO95qPPdXZo2FLQ11C484aoaDvJM5o9Mky2r
 0a3Fx1sjtyjW9RyIr49QLvfFzsBMDZpA/g9eacX+dNIQGaE4K57YpCuR6FAcdRC9ab7f
 ahCVe92QuHDG7m5m1873+sqz6WK3jJ+wF4u0SVZ5H6bnIJz83eua1IRqSJyST4qk98SY
 IODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eu6xQaZ+L/7SEbm2kM+MqievePKlsmmZKrxh7/j0Gx0=;
 b=LTkpOZ8Bkz1BVsHRcAE/LXaILJlkEIpzcCMYaIlDQM3bt+Cnjmo5Z61D1m++JcIriR
 9V54GiymAQDlddyG4YS7xkOgDEjuQRuILVRUFxbj3XOg/9AaZvMaZRx/vRXTQFzSoD0g
 bMiB7AKQoU3OPIKtoqCU6e2e+/Z2Yak7rzXX4d8BSjdCsvFpMoa+i4Ihs5t7brLtybxf
 fZ2zexlt6x9WDCf+oZP9jDvldFzBwMAeStANJiD8sx91HEHlAoaptZLdK0zRKKQozmaF
 4QVkGxLA/qpVkYShui34GxiH6keP6Z7lWV7Nau24BHzwExXzzMfvAaRS00F9KEnr8boq
 fkNQ==
X-Gm-Message-State: AOAM533lPRWAUxsgkQ0Gv4Qr2yncCLmAMIFuQA+NlEGCwNIfpN36tidC
 4Ues9ktaHbTRIQ4UX6/V/X+PZw==
X-Google-Smtp-Source: ABdhPJww3mVtU7cqIbTqZq2nACjciZnsKEYgEPbhUhT9+QN5X45mMFKcavhdWpRrezYolgErPY2PnA==
X-Received: by 2002:ab0:494a:: with SMTP id a10mr10097245uad.90.1633394443206; 
 Mon, 04 Oct 2021 17:40:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g20sm8030772vkf.33.2021.10.04.17.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 17:40:42 -0700 (PDT)
Date: Mon, 04 Oct 2021 17:40:42 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Oct 2021 17:40:37 PDT (-0700)
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
In-Reply-To: <202109130923.E294BFD5C@keescook>
CC: ndesaulniers@google.com, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux@rasmusvillemoes.dk,
 nathan@kernel.org, masahiroy@kernel.org, 
 joe@perches.com, arnd@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com, keescook@chromium.org
Message-ID: <mhng-387507df-2708-4ea1-9854-780fcb35eb1d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_174045_522390_4239DCB6 
X-CRM114-Status: GOOD (  11.36  )
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

On Mon, 13 Sep 2021 09:23:45 PDT (-0700), keescook@chromium.org wrote:
> On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
>> The minimum supported version of GCC is now 5.1. The check wasn't
>> correct as written anyways since GCC_VERSION is 0 when CC=clang.
>>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Yeah, good catch for Clang too.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Only this patch ended up in my inbox.  Where you guys planning on 
keeping this whole series together, or did you want me to pick this for 
the RISC-V tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
