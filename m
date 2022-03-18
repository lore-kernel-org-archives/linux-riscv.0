Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A189C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 23:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NkCgUfACUbBQTDa1qV7o1ED42QHNACSAMCuDAY5eP9w=; b=njTwO3wbetyGIUHov6Va4PKac5
	Zxcqu/f3fQwSFYtULwqFpad0tEDjaW+kHaU91SLN3dWFXp22OLTkTn2GYrI15NnV/gEbgd/5/JCuP
	Zd8GNE/e69QL0cAJxuYAs1GMuC1Ytf+PZoGICYQIROtFY6IKNfXNMvHqM7P2y3wfXpsbJHLc2v3KE
	PgCQ8MHwzR4XLw7XjzV8GuGj/twBannm968djfPHoRVbdIGHK08go3XQxiJV/FWZBZ78WmLiPmzxC
	khAzwmcijv/V58Xyxx7Z/26mn6WAlgxFl91K0ZZCHO01BWx2o1GACJeWQyUZflb+Q7VFyFXzIn7ME
	j5McOD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVLrP-002zjE-LP; Fri, 18 Mar 2022 23:18:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVLrM-002zii-83
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 23:18:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id q11so8235510pln.11
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IVcHCcBYklMVp4ZyFJpnqeq2akbdktOMbyQu0M7lWkM=;
 b=i6IuYY1bVJG39GO25gWKj5fXg0j0g3I1ecz1VrdlDqj3a1wuctE1U+LTJku3FqmExS
 hYoE0JspcExfIyvNBOQqVMKx/OJZAk+UrfOqDU34OjVg4ar9ahcpI90IRKK9TTATJyKo
 sYFPP+CrvR84SvMKeF17KtvCFS41Z8E1by0bBhZbwRaY2S4OzULATWkDBmzy+zm7+C6h
 4CbQMWoZGcn0rcnx+n8PiNK5h2UUO8Vpa8QvtHafxxmqGIiMNfDrAS6V6raO6EFhgIkX
 RmTzJ8+dtkMGdIQYTzz3OWpTXOd92HJS0/XWxD/chrQaICXkM0ThqSqoPBvCB2X9pDGS
 0wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IVcHCcBYklMVp4ZyFJpnqeq2akbdktOMbyQu0M7lWkM=;
 b=kHrDBaAJ3vKEElI8Z0eAqcWNDcYkQxdaKYt5WWPGzKDBQqG6PmI5l4MFGTGBRnuBe/
 qcCICm/viB4awkCDtkktS+tEdBH1mtb1vxA+wxUt7IraXa0NNWgqj2I9jnlkW6Gao5XY
 68nsOXPSa7ZpNKsD7FCKkemvJ3r7YwdLauv1fiGMHE3K54QAE1I5pMQYYFm7VL4j5qnm
 lgV1Lh4l70c33lNRLSofPnH+i60KiDQDONBR/yM3b0s79wb3ib/LsmUdh401CxxIZGLV
 D6kuw8PHi4TttqPF0wg4wImjSffkWvGWTvl8ledhkpeJqZcz8fzCG3lss6H7MInggaTW
 kZXg==
X-Gm-Message-State: AOAM532UXaF38Sw1pbE/dCXVQBRwgCjzX+ppSAdfb+prJe3i//8oMrbA
 YWjX/vx2zsYa+ds98Fzvy2CuZQ==
X-Google-Smtp-Source: ABdhPJxvNF2QqGdofMuiYHtC41lDTJzN93eVTLBVb+qhspMXCxsDm0j7jVlkPmTFfrsk+BhsNod8bA==
X-Received: by 2002:a17:90a:4a06:b0:1c6:d786:10a8 with SMTP id
 e6-20020a17090a4a0600b001c6d78610a8mr14591pjh.207.1647645495306; 
 Fri, 18 Mar 2022 16:18:15 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 cd20-20020a056a00421400b004fa7d1b35b6sm562516pfb.80.2022.03.18.16.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 16:18:14 -0700 (PDT)
Date: Fri, 18 Mar 2022 16:18:14 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Mar 2022 16:18:09 PDT (-0700)
Subject: Re: [PATCH] riscv module: remove (NOLOAD)
In-Reply-To: <YhEelqnPDr1u4uTD@dev-arch.archlinux-ax161>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com, nathan@kernel.org
Message-ID: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_161816_339617_A9B4FDF8 
X-CRM114-Status: GOOD (  20.25  )
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

On Sat, 19 Feb 2022 08:45:10 PST (-0800), nathan@kernel.org wrote:
> On Fri, Feb 18, 2022 at 12:26:11AM -0800, Fangrui Song wrote:
>> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
>> inappropriate for .plt, .got, and .got.plt sections which are always
>> SHT_PROGBITS.
>>
>> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
>> and (NOLOAD) will be essentially ignored. In ld.lld, since
>> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
>> customize the output section type"), ld.lld will report a `section type
>> mismatch` error. Just remove (NOLOAD) to fix the error.
>>
>> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
>> section should be marked as not loadable" on
>> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
>> outdated for ELF.
>
> Thank you for the patch! As mentioned on the arm64 patch, this needs
> your Signed-off-by tag. With that provided:
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> This needs to go to stable so that older trees with a newer toolchain do
> not warn.

Yep, just checking on that SOB line.  A 

Fixes: 596b0474d3d9 ("kbuild: preprocess module linker script")

seems appropriate as well.

Thanks!

>
>> ---
>>  arch/riscv/include/asm/module.lds.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
>> index 4254ff2ff049..1075beae1ac6 100644
>> --- a/arch/riscv/include/asm/module.lds.h
>> +++ b/arch/riscv/include/asm/module.lds.h
>> @@ -2,8 +2,8 @@
>>  /* Copyright (C) 2017 Andes Technology Corporation */
>>  #ifdef CONFIG_MODULE_SECTIONS
>>  SECTIONS {
>> -	.plt (NOLOAD) : { BYTE(0) }
>> -	.got (NOLOAD) : { BYTE(0) }
>> -	.got.plt (NOLOAD) : { BYTE(0) }
>> +	.plt : { BYTE(0) }
>> +	.got : { BYTE(0) }
>> +	.got.plt : { BYTE(0) }
>>  }
>>  #endif
>> --
>> 2.35.1.265.g69c8d7142f-goog
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
