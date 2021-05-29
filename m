Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEA0C4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 18:43:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A512E6113B
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 18:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A512E6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qtPbqjfYdQs4OLHsCW34VAufhjs58uco/6djPvf89Bk=; b=DOoJ0t2YgzKBKnakKP0WAF376h
	9zL8/hXZw3ItPzJYMonVcOo4UBRCm9wpxogEsTOFYPAPjrFgPTi5ujFFla6b61PyU4JWBywLY2XjG
	PbWWSH5Slwja6McpELVYv7R2htFKbbCKUYgt1DahY5i5k8l+g/yrWVLraqEfGP2E4eQro0botGJOu
	47sc7pnMme11emv6f3n60HEhZkyaf3guvHxYuaiZJEkd8gmZuH50TsdFNh3hxlzUMs8PFGS/yOKDa
	zzPJQusVTScHFOKGZBLxzo9z9rylaffh/7fglrkkRw1JrzOz8SeSLRGRoPwt0iuvn40VtnreVt5GL
	RsbG1lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln3v8-0086cr-1M; Sat, 29 May 2021 18:42:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln3v5-0086c1-Oe
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 18:42:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d16so5777135pfn.12
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QRvt82Fk5G1R/VJTNZv2cjtE+BcwohNm2dB6FQUZyq8=;
 b=qE1EKzqnl7ERvrf8KvZdXD9nvfiRZ8zSpk6vI5ylBhvrXwgSmfFCRx76q+Gjl71O2M
 3zmUpYQoJlPjQYFCj0YBWcoETy6I5ndn5DlCCm9BYKVrurICoxOf1M0g2RN5rANcsyiC
 AudIxqqrqMEx76j8L4V/27utcmStQyvxX7n6MtUk9TFi1b/41XOCsUzrdIpER3TmM6WD
 3mDqYfSPu+m1ly7bipnjKFM/LWdzVbebambRCkN/MMJpLFaH/ue0dJqaVovmd9Zg2MC6
 dcx+n8ireZ20TFsL01+cnBFJoDCTiocVx65h0MhCo1P9Qs7KpUQ50uCxDmuzhWVs+y2L
 E74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QRvt82Fk5G1R/VJTNZv2cjtE+BcwohNm2dB6FQUZyq8=;
 b=j10tpSxYZsF8H8RklvoL6sRX72diqWdb0EkCfYwXfSP4nLck0agkEuqBmuNjIL+uPz
 Q9TqZ53zqaHd32hluYhWhoHJOgUHB6VufXzLIZZ24kEzmM04TBYly4PpHeu+BJNXyweb
 V6/+TsOmVRC2K5npZyui3wdijiUhrAhbp4TMKQxNLCk3M++Nme8Lnimd1O3uNfc0n5HX
 dQzpHviYJMDGFmBHi0x1QzhDlFrJRlCrSF6zqvh4EVC1/nDcayu0Ha/tPryh02tX7BHl
 PAv7Pre+CepZ1Pec79hptIjF2RGlDdcO1G1mKxJlbjn1fwaYwN568ZvTVPea8jXAzKC7
 WoUA==
X-Gm-Message-State: AOAM531Raon2fr6yM9UzNULFYPi3n492kjiEmpLj+6hQtNjHSBtT1bU+
 OULIIJn7DoQow3jDadr2tecUxdjyIJrQCQ==
X-Google-Smtp-Source: ABdhPJwTa0Yuem7jSdi0tGXef3E87fhYdXBcXBSp5QBFjzCFD2ndjm7OjINlWU0QS1nC4dU1S0ZXQQ==
X-Received: by 2002:a63:fd46:: with SMTP id m6mr14696455pgj.403.1622313766709; 
 Sat, 29 May 2021 11:42:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n6sm7758439pgm.79.2021.05.29.11.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 11:42:46 -0700 (PDT)
Date: Sat, 29 May 2021 11:42:46 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 11:42:44 PDT (-0700)
Subject: Re: [PATCH] riscv: Use -mno-relax when using lld linker
In-Reply-To: <mhng-d39fe45d-7a16-4287-8cbb-1233abe46729@palmerdabbelt-glaptop>
CC: linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 Khem Raj <raj.khem@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <mhng-43e3ed27-afc3-4842-8bb8-ab6cc8f79231@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_114247_824212_15F22A8F 
X-CRM114-Status: GOOD (  14.60  )
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

On Sat, 29 May 2021 11:40:39 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 14 May 2021 13:56:43 PDT (-0700), Khem Raj wrote:
>> lld does not implement the RISCV relaxation optimizations like GNU ld
>> therefore disable it when building with LLVM=1, Also pass it to
>> assembler when using external GNU assembler ( LLVM_IAS != 1 ), this
>> ensures that relevant assembler option is also enabled along. if these
>> options are not used then we see following relocations in objects
>>
>> 0000000000000000 R_RISCV_ALIGN     *ABS*+0x0000000000000002
>>
>> These are then rejected by lld
>> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> ---
>>  arch/riscv/Makefile | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 3eb9590a0775..519f133e0d53 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -38,6 +38,15 @@ else
>>  	KBUILD_LDFLAGS += -melf32lriscv
>>  endif
>>
>> +ifeq ($(LLVM),1)
>> +	KBUILD_CFLAGS += -mno-relax
>> +	KBUILD_AFLAGS += -mno-relax
>> +ifneq ($(LLVM_IAS),1)
>> +	KBUILD_CFLAGS += -Wa,-mno-relax
>> +	KBUILD_AFLAGS += -Wa,-mno-relax
>> +endif
>> +endif
>> +
>>  # ISA string setting
>>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>
> Thanks, this is on fixes.

Sorry, replied to the v1 but I merged the v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
