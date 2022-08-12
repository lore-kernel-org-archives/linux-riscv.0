Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D41C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gNB7fRnGKp9rxVUpzo5B9/QVVlzC0E8K+7mEW7PzwlU=; b=l04B4b4WGp3VCpzo1Ayx1LWR1b
	6mvynZP1WfDMM1ezQi0Fvrxoq9i/ZNeV6k/ZzUwshd2YZwoNR5Af8DkP/DtkZSgvJMo/luZiEgMpq
	nk55Ut/oi6Tgjo2T9fxprxX/Mt8+VH7qL+2ckjzNhM72G9pc6P+QOOBAMPDu8Qa0sEV6vPSfnkoTN
	74HkYt1kYMET5jHnjL0yV3FI7nBJ+2CrOsYDxRL3oFXo4jxhbgx/7cBpZtkS8uLOR+huuH2GWpvdv
	7vqkBvoOdqXQIicF1PXQl5wBwrdtqzMXspxAnPRodyvzW+UMW8IFJaPIKS+PwR6mErJWwJgru+E6n
	ZlpH7w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMdkm-000Rvu-Ff; Fri, 12 Aug 2022 23:07:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMdki-000RtU-Kr
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 23:07:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id p8so1905933plq.13
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=hZeXJdHuHw+er5OMcI8nBj+zMk/zulQKqTWuBszYS50=;
        b=PVrccdhftwmbnjcBYfC7aK+2o2BJPrUNxd5D95bvgdZeXKEXpQHIl+jIemLb8TCY29
         P8p0NMe2fFGeb3J9YLWlz4j7quTRiLgt8wramfNsFlj395/GCXiu0frlq0z5BDSJ7bez
         aMRdUDgJp344iI1knjRC6FgEBXiXTHcyGCaOsOos57OAzVy94vIdjb5/0SN7v4V2Ke+W
         nq0nuSud2Nc+TXKORkVwE70j5vSeqq5GCjUKdx1JLiAe4Dl3FwSFArcja6Rc8rh7ZAcm
         O5mPuPLLXyJfC50+TZajyBS584E2q8CL6nWGwRhQVjlUBV2RWIJROaulxRvGQYX1VbJp
         KGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=hZeXJdHuHw+er5OMcI8nBj+zMk/zulQKqTWuBszYS50=;
        b=Yef0B9X1ivvNBzKjmj1yLw4IyLyBnP2gVvOiYQn9xgqxNbziDxOYfjiZT0Eh7jyIqy
         +KFv+1mc+tMTzZQ2ufDJvg47t9eGKmC8HWOir/TXxJiAMa4iaQt5IiHo8QwSlt1bUvYR
         dJ/gUEW+Jm6y0em5my1VR0voazB1xKfnx2f2ub6eiwdBX+359CrYMABmXKfI0OnyaZX7
         wKkTVNEIAS7Yl1Be1AjO/A5Fc8KfDpG+mmss8RW8O5/A+EDNLYXG4KQyXLduCw96IBH7
         vjarnwlKznJVaVgCQQe+7eUG2fHNr796F0OP7dysUf/mQ76mpoCHjoXhGGnzS8bUinYz
         ZGFg==
X-Gm-Message-State: ACgBeo1t6/JcOn6zDB/XhlPDw6fsZLpZdSAOsEKsItb01zjowxseKNmT
	s9rExQc1a70eRnk2HFuStBYFrF2XvyH7jQ==
X-Google-Smtp-Source: AA6agR4FU8gLcoCP5Sv3hnx460nVsO6+RG22mCWN8gnXK6SqTYBKBzRTYlTHK4abHkQFTLvbQjeYNw==
X-Received: by 2002:a17:90a:fa91:b0:1f5:1f52:a2ba with SMTP id cu17-20020a17090afa9100b001f51f52a2bamr6252473pjb.16.1660345657171;
        Fri, 12 Aug 2022 16:07:37 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016a7b9558f7sm2283828pln.136.2022.08.12.16.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 16:07:36 -0700 (PDT)
Date: Fri, 12 Aug 2022 16:07:36 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 16:07:34 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
In-Reply-To: <CAOnJCUL2_qJzDfX_9FVUqMtHcKf9xdg551HqoQ_kVsL_Pp=XAQ@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, lkp@intel.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: atishp@atishpatra.org
Message-ID: <mhng-897dd8a7-bc9f-4a5c-a336-3d48633a1e58@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_160740_914578_27336386 
X-CRM114-Status: GOOD (  27.76  )
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

On Fri, 12 Aug 2022 10:43:02 PDT (-0700), atishp@atishpatra.org wrote:
> On Fri, Aug 12, 2022 at 9:06 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> This fixes two issues: I truncated the warning's hart ID when porting to
>> the 64-bit hart ID code, and the original code's warning handling could
>> fire on an uninitialized hart ID.
>>
>> The biggest change here is that riscv_cbom_block_size is no longer
>> initialized, as IMO the default isn't sane: there's nothing in the ISA
>> that mandates any specific cache block size, so falling back to one will
>> just silently produce the wrong answer on some systems.  This also
>> changes the probing order so the cache block size is known before
>> enabling Zicbom support.
>>
>> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
>> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> ---
>>
>> Changes since v1 <https://lore.kernel.org/all/20220812142400.7186-1-palmer@rivosinc.com/>:
>>
>> * Everything but the unsigned long cbom_hartid.
>> ---
>>  arch/riscv/kernel/setup.c       |  2 +-
>>  arch/riscv/mm/dma-noncoherent.c | 22 ++++++++++++----------
>>  2 files changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 95ef6e2bf45c..2dfc463b86bb 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
>>         setup_smp();
>>  #endif
>>
>> -       riscv_fill_hwcap();
>>         riscv_init_cbom_blocksize();
>> +       riscv_fill_hwcap();
>>         apply_boot_alternatives();
>>  }
>>
>> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
>> index cd2225304c82..3aa3572715d6 100644
>> --- a/arch/riscv/mm/dma-noncoherent.c
>> +++ b/arch/riscv/mm/dma-noncoherent.c
>> @@ -12,7 +12,7 @@
>>  #include <linux/of_device.h>
>>  #include <asm/cacheflush.h>
>>
>> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
>> +static unsigned int riscv_cbom_block_size;
>
> What is the expected behavior if the block size is zero in CMO
> operations ? As per my understanding, it will be equivalent to a nop.
> Let me know if I am wrong.
>
> If that is the case, this is misleading as well. Maybe we should just
> disable CMO extension altogether if it can't find the DT property.

That seems reasonable to me, even if having a 0 block size is allowed by 
the spec it seems way more likely to have been a mistake.  I'll send a 
v3, after puttting together a toolchain that actually builds this 
(assuming that's why I'm not getting the failures/warnings).

>
>>  static bool noncoherent_supported;
>>
>>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>> @@ -80,37 +80,39 @@ void riscv_init_cbom_blocksize(void)
>>  {
>>         struct device_node *node;
>>         int ret;
>> -       u32 val;
>> +       u32 val, probed_block_size;
>>
>> +       probed_block_size = 0;
>>         for_each_of_cpu_node(node) {
>> -               unsigned long hartid;
>> -               int cbom_hartid;
>> +               unsigned long hartid, cbom_hartid;
>>
>>                 ret = riscv_of_processor_hartid(node, &hartid);
>>                 if (ret)
>>                         continue;
>>
>> -               if (hartid < 0)
>> -                       continue;
>> -
>>                 /* set block-size for cbom extension if available */
>>                 ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>>                 if (ret)
>>                         continue;
>>
>> -               if (!riscv_cbom_block_size) {
>> -                       riscv_cbom_block_size = val;
>> +               if (!probed_block_size) {
>> +                       probed_block_size = val;
>>                         cbom_hartid = hartid;
>>                 } else {
>> -                       if (riscv_cbom_block_size != val)
>> +                       if (probed_block_size != val)
>>                                 pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
>>                                         cbom_hartid, hartid);
>>                 }
>>         }
>> +
>> +       if (probed_block_size)
>> +               riscv_cbom_block_size = probed_block_size;
>>  }
>>  #endif
>>
>>  void riscv_noncoherent_supported(void)
>>  {
>> +       WARN_ON(!riscv_cbom_block_size,
>> +               "Non-coherent DMA support enabled without a block size\n");
>>         noncoherent_supported = true;
>>  }
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
