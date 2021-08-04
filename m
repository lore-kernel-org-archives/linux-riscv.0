Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5B3C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:59:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 819726104F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 819726104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZnfyJx04WUB/l++abxjYBxbT1x7CaZC8AgM9bfmErus=; b=IpuMEamCMwSMDa28zw3aZTeJla
	vLRlTz7pBy87t7A4fP6LGUdfly3pawiqTNk/kdfH8Rb7s3fGVpuwGf2CbIiPO70hwzQk8gzbPQFOV
	V98jnoqx+9aCIzW03pu8Xkr5RKX5TtWtUeLJLZB5IWYx9Pt+FqlCzpuHguLCGfFaIOcUjsAEDfPBo
	CXOhD8RjE98fJJRMaU1jOTPThim1RAddHtS6EVQQOMdYN/dFI4i8sgZ22o4WIGXJZNDiQrOhDarIq
	OVfVWuCqeYEb4+6krYvMNmDU/uioijd/nbd8Acfi17p2CBoz15jSsxt9BtajA5s0hqfSKGaIYAhCL
	yQwJ5Etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBNz4-007R5U-2j; Wed, 04 Aug 2021 20:59:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBNz1-007R4x-DR
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 20:59:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id t3so4416396plg.9
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pZBQ6NL4F4+toaLhVHgrZoytLyRcSML6nQBC9FrG22A=;
 b=FEC2AuJ9+4tza5ZzluOS5KkU+2gB1aycfZHgAMxw/hExyDtr8EtorDTSCorod7+DXf
 SFZRs40Sto5j8M/g0KUscmkMQqA2H2Sf15XWz+Cu//n7Mf7FPEHWqtlNcnr/ftXYJe6n
 5gxV6nFzs9en+Wuiqkwmp+6mgJ5AstVeGLSWYE3xNTobIPEcxgbNFvBTZ10FSkuvLzud
 RvgEw4PpdGmbQABoiRqTV2cPPxIqCm9f+2a+wBEAjVRIc9040C3RSHZOy1PqT+l8i1jx
 8gVFTj+DJyqdczc36WYSB2pw0wpbK3bqLynXufSCBvsBt6/hm9PST9gTl1OeoqrPS/OV
 DQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pZBQ6NL4F4+toaLhVHgrZoytLyRcSML6nQBC9FrG22A=;
 b=d3fGx6ZT1WEHL34VpvXGMtSzj4kqARCGhPv0mNGf8R1+uD91+PR/OqwTIokoxNotua
 VMTJgZIijqfoj3B0nY7nwwgYmAOqYF5sIAdEf9zQSZPyL8DDDQyhct+KKhaKhLGtAbbW
 cJAAdznhZk2V4wUEo3R5HA3I2EKqg386SR/Ra5yA2/JsnoqEzgV6zWN2zqSopDcVUYPD
 EJh5fS/G8NK+w/Y/lE31MQEjiOM2bCHmuv/T+Tn77WqkGTwWcIhgFfGkUU+iGzzlylcc
 VzxggApJI9Qvdev6BkPbzNYWWrI1gdI+0gwGZYQx2REhOafWO7E+AqryKjzOEs7DZR7C
 WaPw==
X-Gm-Message-State: AOAM530vO6YoXKAuw9hHbHSdSUI5Agdk0uYkFjaEX3T2rZyTn5QUvNOi
 OQLdgnmozIz/BMf61smfoPnwiA==
X-Google-Smtp-Source: ABdhPJyOzvL2Kx9LpStGs7LAOeQywvz49v18kI0V/yjkdyUdmtG+4wef7Gzb4ijfySD3m7f/tXqpew==
X-Received: by 2002:a05:6a00:2142:b029:3b9:e5df:77ab with SMTP id
 o2-20020a056a002142b02903b9e5df77abmr1284235pfk.52.1628110762446; 
 Wed, 04 Aug 2021 13:59:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q68sm4657244pgq.5.2021.08.04.13.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:59:21 -0700 (PDT)
Date: Wed, 04 Aug 2021 13:59:21 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Aug 2021 13:59:17 PDT (-0700)
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
In-Reply-To: <CAKwvOdmNji0AbYUiOSfb5cLD+g7YCpXk4oDupa8gTfgzYmxvBg@mail.gmail.com>
CC: twd2.me@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 clang-built-linux@googlegroups.com, 
 masahiroy@kernel.org, keescook@chromium.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-4af8be52-7620-478b-bf69-73306a2ffc3b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_135923_504643_90A9106E 
X-CRM114-Status: GOOD (  18.42  )
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

On Mon, 19 Jul 2021 14:14:59 PDT (-0700), ndesaulniers@google.com wrote:
> On Mon, Jul 19, 2021 at 1:53 PM Wende Tan <twd2.me@gmail.com> wrote:
>>
>> Pass `-mattr` to `lld` so that it can generate proper machine code.
>> By the way, it seems that `-march` does not work well now.
>>
>> Signed-off-by: Wende Tan <twd2.me@gmail.com>
>> ---
>>  arch/riscv/Makefile | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index bc74afdbf31e..bbc186a3ab45 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -52,9 +52,16 @@ riscv-march-$(CONFIG_ARCH_RV32I)     := rv32ima
>>  riscv-march-$(CONFIG_ARCH_RV64I)       := rv64ima
>>  riscv-march-$(CONFIG_FPU)              := $(riscv-march-y)fd
>>  riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
>> +riscv-mattr-y                          := +m,+a
>> +riscv-mattr-$(CONFIG_FPU)              := $(riscv-mattr-y),+f,+d
>> +riscv-mattr-$(CONFIG_RISCV_ISA_C)      := $(riscv-mattr-y),+c
>>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>>
>> +ifeq ($(CONFIG_LD_IS_LLD),y)
>> +       KBUILD_LDFLAGS += -mllvm -mattr=$(riscv-mattr-y)
>
> We should prevent the proliferation of the compiler internal `-mllvm`
> flags from Kbuild Makefiles; these are indicative of LLVM IR specific
> issues with regards to LTO.  Can you please file a bug against LLVM
> that `-mattr` should be encoded in the IR for LTO's sake?

Works for me.  I'll hold off on taking this until the LLVM bug gets 
sorted out and expect a v2 (ideally with the other textual changes Nick 
suggested).

Thanks!

>
> See also:
> commit 0236526d76b8 ("Makefile: lto: Pass -warn-stack-size only on LLD
> < 13.0.0")
> commit 2398ce80152a ("x86, lto: Pass -stack-alignment only on LLD < 13.0.0")
>
>> +endif
>> +
>>  KBUILD_CFLAGS += -mno-save-restore
>>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>>
>> --

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
