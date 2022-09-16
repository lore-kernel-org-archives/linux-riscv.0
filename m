Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33585C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f/F0GtpbJtcgkz8gezR/Mm/pFWoTOmGa8tReHSDJItk=; b=yqALiKS78U09G1DkZBl/ZD6wfS
	dD19yUxOlxt+jBCf1rfAWfCWcioGaBzqeAuKRY7Qxvhr+48lbjXTfIT0nTnbetFo05wBLoYs6pg8D
	vFXbT8lNOL1sFFRrpW2Ze5snCCv1crZVxE/PyRMd9k97fCARiS2DPgR9LQ0wpgQNlWkRT3QkYaHtc
	c6cHBU9tyTeGr7QFJtIzKKiplzyCdh+Zl7jlLz0i80Nf5i8L3tCmdo0IIYbrUfSdjgwufkfX5Mxx2
	a11J3kUBATnBLNrZiGvce2IcV/jVI4r6bfSjddYAo0eaI0GmsWcmJ2/+wIcqAqSXtkwBSiOSdF4Un
	98MqCJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8MB-00C3g5-TZ; Fri, 16 Sep 2022 10:13:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8M8-00C3eE-RN
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 10:13:58 +0000
Received: by mail-pj1-x102d.google.com with SMTP id fs14so20592350pjb.5
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=WnyaOUdAwdhGuoSKLMfkbnLqHMb9GaEy8+agcHeprAI=;
        b=xmHCXH3dTxhVEmwtulDTy0FW3GI+mBURqnSKifdSV7+MLBOutTkM5dQODvOUVUvqLS
         oDQV9aBR5ScVl0jhjWIm3brnnn70tx2HautlFeOoWxjqYcltpdWZLta8YcjKgGyNKF3K
         g3OXC4Tml26FpWo3ZO5cL6KqRP4JppBqKS/oOyrC+CTzPegpPhiBcCeMl7yxd6GbiF3G
         SlFKy4pj1ESBlSPJf1PuLUhgDf/SNYLea2ODxtmRA5UNESE3IrbvpMp3a/ZBhcp7MZDs
         AQWxRtv1yhUpu8c1oPCCl17LWNavc4CeknjE2+S1D7OBL9lN3XV53qaTMZvQccR9xMtc
         Hfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=WnyaOUdAwdhGuoSKLMfkbnLqHMb9GaEy8+agcHeprAI=;
        b=ceSgxpj5zjTeKVfco54mFeriqYXfVnixvKybgB0iRstaBCi5ovhokSG4CzKN0R+0a6
         n73+yLwdiuynin2wyUvY2hA5A6iX+oVtOm29M55dNbRePNFMFiCqyaayxuQd3uXVc/pL
         dAB1RVDyylA01JpKIvh67hB3lk5Rjzh4kWthU/2OLh3tlNugxitwTx1U2LDh+OqSXGiu
         rJXB47vfe3lWqoph/on1Gwt06zXHJh9js4ryzi39Bs/ILMCFp9qcQN1vvjCtwLg/V/8L
         qUqgxyacCmB7bO83DYWuHmcVLPFtrOyR+bwZaIaSYf3a3TKdqNBgZ0i3ugEPjOs7qlh0
         u1iA==
X-Gm-Message-State: ACrzQf1WiuhL5ukGCUv0jL5GtaXqkwaME4W0GxhTdmEoTudBYY5fAOdV
	o71kF8eVj1Hk+ix5ij3wgmkp/JdL6Qyj0Fv/JJc=
X-Google-Smtp-Source: AMsMyM7mukMH3VIw7Jn1b0Hb7d6os4h7bvv+ti/v3OQfATonGq3E8RiNw4cBut+RC1P1lFLmmKwVgQ==
X-Received: by 2002:a17:902:e14c:b0:177:e7be:2ab6 with SMTP id d12-20020a170902e14c00b00177e7be2ab6mr3974874pla.25.1663323235120;
        Fri, 16 Sep 2022 03:13:55 -0700 (PDT)
Received: from localhost (guests-out.ms.mff.cuni.cz. [195.113.20.231])
        by smtp.gmail.com with ESMTPSA id q1-20020aa78421000000b0054ad9c6b70fsm1144259pfn.8.2022.09.16.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:13:54 -0700 (PDT)
Date: Fri, 16 Sep 2022 03:13:54 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 03:03:57 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
In-Reply-To: <2123713.Mh6RI2rZIc@phil>
CC: linux-riscv@lists.infradead.org, stable@vger.kernel.org, lkp@intel.com,
  conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-ccfa026e-f1ec-4266-bda0-5cf07d7b47a3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_031356_901419_5FF511DB 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu, 15 Sep 2022 14:15:13 PDT (-0700), heiko@sntech.de wrote:
> Am Donnerstag, 15. September 2022, 19:09:00 CEST schrieb Palmer Dabbelt:
>> We could make the T-Head CMOs depend on a new-enough assembler to have
>> Zicbom, but it's not strictly necessary because the T-Head CMOs
>> circumvent the assembler.
>>
>> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
>> Cc: stable@vger.kernel.org
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks, this is on fixes (a little late this week due to the 
conferences, but I'm still hoping for rc6).

>
>> ---
>>  arch/riscv/include/asm/cacheflush.h | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
>> index a89c005b4bbf..273ece6b622f 100644
>> --- a/arch/riscv/include/asm/cacheflush.h
>> +++ b/arch/riscv/include/asm/cacheflush.h
>> @@ -42,8 +42,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>>
>>  #endif /* CONFIG_SMP */
>>
>> -#ifdef CONFIG_RISCV_ISA_ZICBOM
>> +/*
>> + * The T-Head CMO errata internally probe the CBOM block size, but otherwise
>> + * don't depend on Zicbom.
>> + */
>>  extern unsigned int riscv_cbom_block_size;
>> +#ifdef CONFIG_RISCV_ISA_ZICBOM
>>  void riscv_init_cbom_blocksize(void);
>>  #else
>>  static inline void riscv_init_cbom_blocksize(void) { }
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
