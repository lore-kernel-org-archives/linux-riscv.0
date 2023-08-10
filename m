Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622ADC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WOtykEvlYv9R7W9u2BeAlKwaKUmiHvMZoBbLYbQ1bA=; b=Nu+HEPWUeNaj5Z
	miNapq4Fp9mYeEQ7UBIQl3p1OZJro8Xt21ru77AL1GuVixWCLdvamVq9zLN5ChL/U/WE1+vRT4NF2
	XRwZ+bmaQC2T+qaUiLuBwlZd7YuQigv59VdL7bwxWq9H9KxClSKeLHY/1NhJRYWaY0kkvmyHX0J3y
	78SEunzRQI1tTBPiEI3Xb9tMA/lmbyxzlgb2qAAMaAzf89eruRz3Ywt+GofhZCqtqGtHSjh79M+eC
	J4pOWzJ/fg4AYob76TNw/zz3/5QrFghrlS5gXQFJBXclUtqLMqLPlrHeckThDgtngCdSqGQTlQ09P
	+PlTYLkquo0Q+UZsOUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBa7-008Zyo-1V;
	Thu, 10 Aug 2023 19:44:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBa1-008ZwI-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 19:44:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bc7e65ea44so9417745ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 12:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691696659; x=1692301459;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y7zOvxXwIuA5rgiamcnWYKungJc3z5komgZPppKVkg=;
        b=D0sQojkFas15jrjLj99bibUCBLyzaQ7EgzRCtjHmB2i4oUZHoeNZLK12l/pTqSvM0T
         q6y/4jjDt61peozlrloDOuif9MPZG/sgfEQLyRBiA5oLQNfPwLqYTbYMqTNzSEvc+vrc
         83aOhjzfayJEp76O/mjpCco4pZPBabArlbwQnjtw8WfLRWhwz97rli2Y+wH4/C/Q33xs
         WQw9CYmYUTxikLEWcV2Q25ZtcBWMP9U/CmM73HHATYmRnGCFa8K5dEtcgkWln8nclwub
         vqiEVq4AMBdLcoqur0nyjBxwgKeqG7aze6fs0uZjelm6XtXjvGb5cEhAvGoB/PEohCEq
         oQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691696659; x=1692301459;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y7zOvxXwIuA5rgiamcnWYKungJc3z5komgZPppKVkg=;
        b=TW0e+qpRmz+5aaxkXOc9rTRdCd366HwwJTty++tymyxQqAV5lYJ4tsJOy1kqfnLzuF
         OZC1h9r2EccQzKKL2ctturYheAYuiKfUBvVG32NLajgE3pfD95Ed1dC2ysah5/hTCxyi
         lapJzx+IOKB/CzR38JksOZuRv3iSNaj4ggalvaPeVZa2P6qCCiKiVtQ59065UMNr093k
         VV2AsDeWa1uyezNrD4nu0FJg0OA1TeGE4eSqc7mD7GL/XHdoXHxALOeXVhlNAuAzUwmr
         97xo6e5ZX62sJkD6pILqdxWPjvulUbcuUfBxn4Mw3yxjFbMmYtJ4bN+mA6pEBvVASxii
         f3Yw==
X-Gm-Message-State: AOJu0YzJo+tZ4mlvLwAhcakKbsyOI3yeaxeiBzob5RZAtGudnWlB3Tae
	z1SsgrKCBET+iUMtDWGkTzXOLUrlbiM1A4OjYXg=
X-Google-Smtp-Source: AGHT+IE2eIz04tQ3tBDeTsX6jx4bnSOGfuo5x1j5j2oFvlwLIMiEXDUvEPMKiaI3BkU4/JtlhziMaQ==
X-Received: by 2002:a17:902:a40f:b0:1bd:9c43:c887 with SMTP id p15-20020a170902a40f00b001bd9c43c887mr3338597plq.10.1691696659289;
        Thu, 10 Aug 2023 12:44:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id je1-20020a170903264100b001bb9aadfb04sm2160601plb.220.2023.08.10.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:44:18 -0700 (PDT)
In-Reply-To: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
References: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
Subject: Re: [PATCH v2] riscv: mm: fix 2 instances of
 -Wmissing-variable-declarations
Message-Id: <169169664361.3729.4946663711060334827.b4-ty@rivosinc.com>
Date: Thu, 10 Aug 2023 12:44:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
  Nick Desaulniers <ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_124421_219095_3294A250 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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


On Tue, 08 Aug 2023 09:35:00 -0700, Nick Desaulniers wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance in ARCH=riscv builds:
> 
>   arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
>   for non-static variable 'trampoline_pg_dir'
>   [-Wmissing-variable-declarations]
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       |       ^
>   arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       | ^
>   arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
>   for non-static variable 'early_pg_dir'
>   [-Wmissing-variable-declarations]
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       |       ^
>   arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       | ^
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
      https://git.kernel.org/palmer/c/d2402048bc8a

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
