Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36DDECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 11:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hAqztpyRtDnJVBZ07pYchMxlZooBGs5lAJ5e1jzOOD8=; b=eCNd/Uq4lvWHSI
	uR8ObjBWfjmPXLXnZuP+AfSkthTzDJW8a/CgUViT7zfvKNmtuS9MmBiVQ1hZuv+mdX3uf0ldSD+UK
	CSmwjBY0qY4QSJTn0tp+F5J1Q8AOftTWk2yXsVGOj2/BWhVGH10jzBK2Nh+WoYpI1rq8H1/5UJm44
	I/CSawn5Y0+1WZAbwpmczhJmRtakGuP9DaNtErGtHjcc7t9DJ36ncOFNKcOBPlCepDNFKKU7z0/lg
	4lai2dsdqh8OSMHTWJ7Gau4clS+OOykagwZYuysgXABPp2PwLLlzF/nVx36JRT0a/SjbWFfLf0LNB
	KWHGbiH78nTHWCZd8j4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgeh-003sj2-L5; Fri, 23 Sep 2022 11:15:39 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgee-003si4-OW
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 11:15:38 +0000
Received: by mail-pf1-x434.google.com with SMTP id a80so12106915pfa.4
        for <linux-riscv@lists.infradead.org>; Fri, 23 Sep 2022 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date;
        bh=VQV+uhZYJxC8bzOrqeUmrEMS9vh6sSAGapqForF+goA=;
        b=bhNUovQPsNnBtsCwAvruU8d3UY/OSACDr/E2Q+lFrQ7XLSJ3AJcYvvQatyD7925EPQ
         COTJD7wsHWP8CSEvL8T1GiZA9eCrlUg/YwFL+0x7j0PdVWC9LneYocgy9wPPoe5uAK6R
         EhHnCTasm3iTh3m3bD2qC7w2nu/exr2UU4nBM3wkArY4ymdEqm6aGay74ejwaY6KMnjq
         7acV9Q4YSbj/l5nq1wb/8dbHP7Au2AC8zqCqEb+RcA1ND5xSKXUthyC414Bb0+6ut33v
         munHCgz+kgXa2PwNzz3oWYhHJPq5a9tC/JiY7LLKQueEPoxQ28xWLfVn9CXmPVvXXOfO
         IY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=VQV+uhZYJxC8bzOrqeUmrEMS9vh6sSAGapqForF+goA=;
        b=6vQo0bqaP2SCNxpO6gMxPhj4Z7rrJvujuOCJk1uVp3zmpOqQ/7+URwqzlDx201UPob
         mcgMRk8kiihUEhNQJ1V+nlrSZLJvxr0aw5PXWUYkR3RdJ2LluKh6XVVY4MvlPm8nKjYx
         twxBH6JFdtrDdI9kjh5XnhiztymgWMY28hrW/qS4FXf+gyTUs89SHuH3a2+ShQ1rmWck
         4MWIiEVM+YS15yJTvgmYjzwg522qvyg9A0YdE2OaUyvuAmZ7kIDdGCl7FW6rAr3fJjpt
         NX8Mpvhjy9O02JE2soVPqpVk+5kjudAKYteym/yw0EzkpZ+ddDXzFRWu836I5A2bBWpB
         /mDg==
X-Gm-Message-State: ACrzQf2KD2mVgXCqG0KicslCi0JNkhrQ2JXWJMZwZ2NydG7aTz2bmlql
	vBYRyqUUimEGV1ncrsRJ7X38GQ==
X-Google-Smtp-Source: AMsMyM5ZtiH3mSQdpI0FbAXFnLAL+3ppxC4JwNpSIOHZvEipCUpuDEvlz9Ch8ndf8UcJKnjtlTtJWg==
X-Received: by 2002:a05:6a00:1346:b0:546:ff1e:26ae with SMTP id k6-20020a056a00134600b00546ff1e26aemr8722206pfu.45.1663931736040;
        Fri, 23 Sep 2022 04:15:36 -0700 (PDT)
Received: from localhost ([88.128.88.52])
        by smtp.gmail.com with ESMTPSA id e24-20020a63e018000000b0042ff6b0cf4dsm5360774pgh.58.2022.09.23.04.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 04:15:35 -0700 (PDT)
Date: Fri, 23 Sep 2022 04:15:35 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Sep 2022 04:15:17 PDT (-0700)
Subject: Re: [PATCH v2/RESEND] riscv: Pass -mno-relax only on lld < 15.0.0
In-Reply-To: <mhng-d88a602a-fefa-479d-bca3-b8595a89746a@palmer-ri-x1c9>
CC: conor@kernel.org, nathan@kernel.org, maskray@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-d02cc16f-0af8-41e6-8415-a43ebcb53757@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_041536_814588_CB3FF22A 
X-CRM114-Status: GOOD (  17.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 18 Sep 2022 03:06:44 PDT (-0700), Palmer Dabbelt wrote:
> On Sun, 18 Sep 2022 02:57:11 PDT (-0700), conor@kernel.org wrote:
>> On Sun, Sep 18, 2022 at 02:29:34AM -0700, Palmer Dabbelt wrote:
>>> From: Fangrui Song <maskray@google.com>
>>>
>>> lld since llvm:6611d58f5bbc ("[ELF] Relax R_RISCV_ALIGN"), which will be
>>> included in the 15.0.0 release, has implemented some RISC-V linker
>>> relaxation.  -mno-relax is no longer needed in
>>> KBUILD_CFLAGS/KBUILD_AFLAGS to suppress R_RISCV_ALIGN which older lld
>>> can not handle:
>>>
>>>     ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN
>>>     requires unimplemented linker relaxation; recompile with -mno-relax
>>>     but the .o is already compiled with -mno-relax
>>>
>>> Signed-off-by: Fangrui Song <maskray@google.com>
>>> Link: https://lore.kernel.org/r/20220710071117.446112-1-maskray@google.com/
>>> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>>> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> ---
>>> Fanguri poked me about this one on IRC, I'm not sure what happened but
>>> it didn't make it to my inbox (and neither did the replies, which is
>>> kind of scary).  Rather that trying to resurrect that thread from lore,
>>> I figured it would be best to just send the v2 as the commit message
>>> needed a bit of cleanup.
>>
>> One of the replies was a T-b from Nathan:
>> https://lore.kernel.org/linux-riscv/YsxfiKC%2FZBr7U7qI@dev-arch.thelio-3990X/
>> dunno if you wanna pick that up or he wants to resend..
>>
>> I gave it a whirl too, so:
>> Tested-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks, I just picked both up.

and turns out I'd forgotten the stable tag, so I'm gonig to hold this 
one off until next week.

>
>>
>>>
>>> Changes since v1 <20220710071117.446112-1-maskray@google.com>:
>>>
>>> * Clean up the commit message a bit.
>>> ---
>>>  arch/riscv/Makefile | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>>> index 3fa8ef336822..e7d52a2301e2 100644
>>> --- a/arch/riscv/Makefile
>>> +++ b/arch/riscv/Makefile
>>> @@ -37,6 +37,7 @@ else
>>>  endif
>>>
>>>  ifeq ($(CONFIG_LD_IS_LLD),y)
>>> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
>>>  	KBUILD_CFLAGS += -mno-relax
>>>  	KBUILD_AFLAGS += -mno-relax
>>>  ifndef CONFIG_AS_IS_LLVM
>>> @@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
>>>  	KBUILD_AFLAGS += -Wa,-mno-relax
>>>  endif
>>>  endif
>>> +endif
>>>
>>>  # ISA string setting
>>>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>>> --
>>> 2.34.1
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
