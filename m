Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E09EC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7PRg3gp8wAleDpBITl0Qdx3l0b781Q+G/Ois6UokAnw=; b=plDMuC+CqPwAj+2iNkxMWgR3i1
	mfvnSMHtB0bRFpclxbREzSg8r4MvgqiIjCbR6wZ5urqPbaWkpsA2IuqoBHlaY1Wbcmxpl3MVXzXA5
	91YZ026CgiOxKSGJIz0G5aeiBpXKfbbnglANtF3QL0EYIW6HnNnil+Cryp3D83Ld8URknioypRmp0
	WRU8mTH14Q7b5n8PkedUFFo6umlV7/ea9zWab1v/eQYjy61IB2PGgfJp2H5KQQ9w34NpPTwHARzHi
	9D3TInzF5I077QM2jGygJ9lXaZrZo4MgqqLyeIlS+pSKAovhWGcd3AExCRyMEmQM6z6bH+98wWgYu
	ZjHg2Low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAs-00Ab84-Qf; Fri, 12 Aug 2022 16:06:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAj-00AarR-L8
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:06:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id z19so1155462plb.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=p+n/wXat3IicPgw3zR2wdm+hvoMr42yL/jx3ZzW3k3c=;
        b=umkmkElFWqasdlj0OOiR+9ZvRSq80+cM5LpF8TfrtfzZt32OtGlEemvNmesMuSP+Fm
         vHGYaCwIrcOhI9tbc0LjFCPxbI72zvum4sZebWRVDYFk5//o+mVEQLTl+ofdD5jz2RiA
         AwTmkF5PMHw6W/060fiHIM2/fxyIFXmn0650aebqoRxM0PKZPbfDWahrbnMFE+ZXx6sf
         yqVqsiPf6sR/Ob0u074PcgssCTcfImofrpM2Y0TaXfZ+aEjqlVvPxHM/2/d3Aikv/6AH
         yz7og2Ye/odfTuBtOpmcseL0LQ73ZFGhmOFFENw0gk32BjUmra2RpK2HP8KZea8N+9Dl
         JZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=p+n/wXat3IicPgw3zR2wdm+hvoMr42yL/jx3ZzW3k3c=;
        b=R8s2z304XIR2RNsxe2Er22ZQje1X9A1IxF0U75aM7hLQ/fPEpJOivpyBg8f/Hx7hEf
         qmzwciBP+b8CSsZ8avA1lzheTSw+zFKrXr4nwjDehW/tyi/E/W7uD6aDVK9BFXPnafoP
         5myJPjM5sC3fGpuYcc+mkLED/OYc/y6QnxwJRqcJUuUe7sB5pSzqgBWzA9MTHfM1PxJv
         f+/a5o+m7ugrGoQnkUUASYuFYWXOMG9V00tuRXea6e4zZRPry4Pdh11tStRlDCSgScMK
         6KZRAi6nwxFrCcnH1bvxpq+jnxvOcbfD1e5JzHOZzEKQDam4eHUzHuzral/lxRpjBgCd
         z5Tw==
X-Gm-Message-State: ACgBeo1uoPtKe5H1mn32rikU2pS/C7zZR+NaxmdSboPI8kvOnDDsRjym
	Lo94/Maw0F2hyIK1cKH18huXv0OGx/PD/Q==
X-Google-Smtp-Source: AA6agR5Qi1tew7R4MJkqakYNE9Mn6OoXkZn6CcUjNH0fy5SbZFeOGYD8W8LrRk4BEY3DUANnTq1HSg==
X-Received: by 2002:a17:90a:55:b0:1f7:4513:8cac with SMTP id 21-20020a17090a005500b001f745138cacmr4702002pjb.93.1660320353420;
        Fri, 12 Aug 2022 09:05:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id 192-20020a6217c9000000b0052d6058b10esm1766734pfx.60.2022.08.12.09.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:53 -0700 (PDT)
Date: Fri, 12 Aug 2022 09:05:53 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 08:40:24 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Don't truncate a hartid in the cbom-block-size mismatch warning
In-Reply-To: <CAAhSdy05ne-q069EwhTrmj+EvCxojOt-cvA1n9uaTuk1aa+P2g@mail.gmail.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org
Message-ID: <mhng-917adf3a-c843-42d7-9215-c01ccb95de6e@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_090605_835848_C94675EE 
X-CRM114-Status: GOOD (  15.72  )
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

On Fri, 12 Aug 2022 08:13:54 PDT (-0700), anup@brainfault.org wrote:
> On Fri, Aug 12, 2022 at 7:54 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> I forgot to update this when sorting out the 64-bit hartid code.
>>
>> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Looks good to me.

Actually it looks pretty bad to me, I just sent a v2: 
https://lore.kernel.org/r/20220812154010.18280-1-palmer@rivosinc.com

> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
>> ---
>>  arch/riscv/mm/dma-noncoherent.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
>> index cd2225304c82..61a4337cf7b1 100644
>> --- a/arch/riscv/mm/dma-noncoherent.c
>> +++ b/arch/riscv/mm/dma-noncoherent.c
>> @@ -83,8 +83,7 @@ void riscv_init_cbom_blocksize(void)
>>         u32 val;
>>
>>         for_each_of_cpu_node(node) {
>> -               unsigned long hartid;
>> -               int cbom_hartid;
>> +               unsigned long hartid, cbom_hartid;
>>
>>                 ret = riscv_of_processor_hartid(node, &hartid);
>>                 if (ret)
>> @@ -103,7 +102,7 @@ void riscv_init_cbom_blocksize(void)
>>                         cbom_hartid = hartid;
>>                 } else {
>>                         if (riscv_cbom_block_size != val)
>> -                               pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
>> +                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>>                                         cbom_hartid, hartid);
>>                 }
>>         }
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
