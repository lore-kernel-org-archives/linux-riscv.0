Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0232DC6FA86
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DYV6PIowdihJ13qmYSoReeFWJXBOQy4fImVmc3ZnADA=; b=4tM4UYmtnKxf9020Q42S+jgs80
	vq0M3f7i9gx1f1N+VksoCbNZGlJTcOWr5raHKD7UGXDgPU2Qb6+vnqHolnoxvr2A1DIViUQVGSEAQ
	kYmMRTDXOk4d43VRzYOfbHpqQcqXi+130uCA90HWqLnPkBJ/VocWDhFHqxfuSVNbNK0J2BJ1xntXn
	23NWZmZd0BW/95I0d4uU4x/Mu9gr/khWa+xjnGGMc/2vdVDGZYD2Kr3/RZEVfwWmBER7lZvt0wepa
	hwDcEqjkkYGPFJ8CdT2P1tfYOEhtpG5/f5dfp/0cByjcKV3kL5fYKTWrFhgRTMrLrgWWGbK5NloQS
	WfYo1LuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZrCK-00EfGx-5p; Sun, 18 Sep 2022 10:06:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZrCH-00EfFN-Qd
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 10:06:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id iw17so25469383plb.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 03:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=H5mzxKM+L1LIlEMwRuLkF0u4wj0Eug830GFoMPsisac=;
        b=4X92bm8UzqJIJ64ADoA43CG46tpqTep3fjDF4JXtujb61GzpUgxT7Jlfp8Je5JB5cX
         5HDs0hrWbB4JYywsZT1C0J1BUOhFW2niknBsGbSye5Aj+CL68eBOZsQ80ByrnJfoXDdg
         7SjFVLVF/C2KvkcmvyXnJeOh6IvtaKatxIphjcFGmPqOAAKq/Zhh3Lnprey8t18lzKjb
         eGFlsu2XkBOMezuERntetjQRKMsr5NzMzyEXbm/6/m2t0DIlz7Q0U3JJJQBiDULmZ64o
         jBiOWgeFsWhmqDQ5ogbfuM9NIlvCrsjGrIlhzJS/icjg8UbefIKxOefFJhEFp5MLmw4c
         5JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=H5mzxKM+L1LIlEMwRuLkF0u4wj0Eug830GFoMPsisac=;
        b=KnQjYJzFDHZDuJ+XINjAyBAKWWz+hff8S5HN5bwmTIrpXheyaiaDXfs7qiXkRf+vyS
         s2WIlM7tNaknlEW0TwkV4MaYkHnogNLhlLlUrmmSkTuryD8ON0mlJNSlUnL03POmwJ8R
         0wnZgwt78z7jdeozZktaAiHJe/U/U1CNjSrlDcaEVhKq8DL8CnDpuarH0vMbVOZLRpnn
         9PaVuN+do6wnsf1euJegeHG7TxgvSHuGER102+sWjjz9fsS+bOztkD54aqrUsI4WJtzc
         9dZ6zTZyYgB6yH+vqXPi6ih+Q5Vm3idOKSv/swMApgAcoHsVQkoy3GDxpwwn1QiZ0+jP
         AFMg==
X-Gm-Message-State: ACrzQf3CS3K7hxo7QT1StRaQ+ogKAefonqDRajXibF4fAa6bclRuXDL2
	lVuwJbhV+U3LBuCZjr5jZtLBCA==
X-Google-Smtp-Source: AMsMyM4GBBajIPL73ZBBLtwoclSjz3P1cGaDsB+gWvWT+26P+ZmTEOk0okHipGJqte77ay67lEHMRg==
X-Received: by 2002:a17:90b:1bc2:b0:200:a97b:4ae5 with SMTP id oa2-20020a17090b1bc200b00200a97b4ae5mr14711534pjb.147.1663495605279;
        Sun, 18 Sep 2022 03:06:45 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id rm2-20020a17090b3ec200b001fde655225fsm14785281pjb.2.2022.09.18.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 03:06:44 -0700 (PDT)
Date: Sun, 18 Sep 2022 03:06:44 -0700 (PDT)
X-Google-Original-Date: Sun, 18 Sep 2022 03:06:40 PDT (-0700)
Subject: Re: [PATCH v2/RESEND] riscv: Pass -mno-relax only on lld < 15.0.0
In-Reply-To: <Yybrd99HuLs3ulmy@spud>
CC: nathan@kernel.org, maskray@google.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: conor@kernel.org
Message-ID: <mhng-d88a602a-fefa-479d-bca3-b8595a89746a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_030645_883742_C9334E3B 
X-CRM114-Status: GOOD (  19.51  )
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

On Sun, 18 Sep 2022 02:57:11 PDT (-0700), conor@kernel.org wrote:
> On Sun, Sep 18, 2022 at 02:29:34AM -0700, Palmer Dabbelt wrote:
>> From: Fangrui Song <maskray@google.com>
>>
>> lld since llvm:6611d58f5bbc ("[ELF] Relax R_RISCV_ALIGN"), which will be
>> included in the 15.0.0 release, has implemented some RISC-V linker
>> relaxation.  -mno-relax is no longer needed in
>> KBUILD_CFLAGS/KBUILD_AFLAGS to suppress R_RISCV_ALIGN which older lld
>> can not handle:
>>
>>     ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN
>>     requires unimplemented linker relaxation; recompile with -mno-relax
>>     but the .o is already compiled with -mno-relax
>>
>> Signed-off-by: Fangrui Song <maskray@google.com>
>> Link: https://lore.kernel.org/r/20220710071117.446112-1-maskray@google.com/
>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> Fanguri poked me about this one on IRC, I'm not sure what happened but
>> it didn't make it to my inbox (and neither did the replies, which is
>> kind of scary).  Rather that trying to resurrect that thread from lore,
>> I figured it would be best to just send the v2 as the commit message
>> needed a bit of cleanup.
>
> One of the replies was a T-b from Nathan:
> https://lore.kernel.org/linux-riscv/YsxfiKC%2FZBr7U7qI@dev-arch.thelio-3990X/
> dunno if you wanna pick that up or he wants to resend..
>
> I gave it a whirl too, so:
> Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, I just picked both up.

>
>>
>> Changes since v1 <20220710071117.446112-1-maskray@google.com>:
>>
>> * Clean up the commit message a bit.
>> ---
>>  arch/riscv/Makefile | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 3fa8ef336822..e7d52a2301e2 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -37,6 +37,7 @@ else
>>  endif
>>
>>  ifeq ($(CONFIG_LD_IS_LLD),y)
>> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
>>  	KBUILD_CFLAGS += -mno-relax
>>  	KBUILD_AFLAGS += -mno-relax
>>  ifndef CONFIG_AS_IS_LLVM
>> @@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
>>  	KBUILD_AFLAGS += -Wa,-mno-relax
>>  endif
>>  endif
>> +endif
>>
>>  # ISA string setting
>>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>> --
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
