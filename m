Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A36CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KkvVA86w7vu18OgouF2rj4SWv1dSb74J9dtySjGy0cw=; b=K3neKSd8xm2Z9pEiLq+TWdLPbF
	dmC0yv8RoUbnbfEnlhxeDplg7Qt8Idqry+4Lq4YXgPl4/jHnhwo9eYjRnqZa05u/zgGs/UFumywkU
	IbBNHlr0tQkDzi1+S/r6sJrrCsoJlDvbpHDNIm53jVUKklYDSRbR3gfYO8Ox5DK7yHU9t+b/4JNna
	PpVSTSb9XYaGY3xZcXtD6ptiMmABw4WWjuDaf25xIGq75wa4pQ+KABwRxP4cHZFRh90HInIgMwXDQ
	6lD0seljfNcFHbIZhjz4HJ4rcELvaafZdVFD9iMeMXlUHSjvvS6bwCKDF0EJ46kFLaerag3fbwOn7
	GFs0gHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdHc-000hQY-11;
	Wed, 12 Jul 2023 17:05:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdHZ-000hPk-17
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:05:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-668704a5b5bso6447794b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689181540; x=1691773540;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21TFtO47lX1gePbfGONsWzXilAI2kPVFSsUHWiu16KY=;
        b=s4bOORzC8HM4m19JGZSCJhSSPeRSR7TDt//M5UaL5GAPJQG/PqQ7OjG7zBPuM21pl6
         mHv1OcECZhWBz0dZq2SLi/hF3HLi6X9cpkpdTjg07LcCvtUnOkU+w0Tub7UQ0ht9bDb8
         TyqzPSwNYOcP+B0O0B5BKjuCfcBe/ZxQXsgtT+vPwccgTbGVYJ/zhODCvVLwweYjJ1z0
         1/MC7XNFCjDSTiW+bihgNyVX+jOZd+FyXdx9j/d8pP0v2FfWC4Q+OddrHtitjjgIIGXj
         WLwrEJ8cfWBT0p0NyrXD2bJ8P+SHezP06DukuDwyRohenvEIBQa5NnAS+zKjH2KXmlWT
         Lk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689181540; x=1691773540;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21TFtO47lX1gePbfGONsWzXilAI2kPVFSsUHWiu16KY=;
        b=WZvDCNOPZAyXtyMKcCtvoEmlc0U1SEQZJ9zR9Jwxnlmidn6/HXsxk35fB6hrKY2mAb
         wq6fbDz61xJ7AUzBVY+LslcD6tGVr0dVYaWbUGyYlSsO1UqtKOXBEU9yM1z9f05RPgAu
         AFbdoKmS38XArjoUkwwx0/ILWdqMRrMLaZFBdsO4cFm2eRU1bxM16st5513EU61ikvmG
         v8tpjT/P8E5fYLo29//8DKZEJfsVR8UroF3LVplgP9gde45frOBHqrz5gBntfknnKfU6
         TzdEaPcSMMcDo+CEDg9gR+Xy9QFk7V/SWejMLw05rMPr9fm7OV9iYEN5XbKGun4F2tAa
         IObg==
X-Gm-Message-State: ABy/qLaHD3vxhgvCQtmjKTsko3JLL0PKCv5ByUJd112FedI/CRZrAMy9
	J7TsJLM13sF2rboY1pI8g2t3agLHbEBh67HPMk8=
X-Google-Smtp-Source: APBJJlF/hYh+SvwXGm3heNKVtObAeBTQ3BflHoRR5j7nTnXOsc0C3K7htOdn7DIq4aIheE43bQNblg==
X-Received: by 2002:a05:6a20:938a:b0:132:bdba:5518 with SMTP id x10-20020a056a20938a00b00132bdba5518mr3757873pzh.54.1689181540368;
        Wed, 12 Jul 2023 10:05:40 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id o17-20020a637e51000000b0055b30275adasm3832634pgn.37.2023.07.12.10.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 10:05:39 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:05:39 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 10:04:35 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Don't include Zicsr or Zifencei in I from ACPI
In-Reply-To: <20230711-slideshow-plaza-4ceaa37f6c00@spud>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-c30cb4e2-0574-4051-b220-01601d9579de@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_100541_622102_E13B3AD8 
X-CRM114-Status: GOOD (  21.72  )
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
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 11 Jul 2023 15:52:56 PDT (-0700), Conor Dooley wrote:
> On Tue, Jul 11, 2023 at 03:46:00PM -0700, Palmer Dabbelt wrote:
>> ACPI ISA strings are based on a specification after Zicsr and Zifencei
>> were split out of I, so we shouldn't be treating them as part of I.  We
>> haven't release an ACPI-based kernel yet, so we don't need to worry
>> about compatibility with the old ISA strings.
>> 
>> Fixes: 396c018332a1 ("RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()")
>
> I think, if anything, this is actually:
> Fixes: 07edc32779e3 ("RISC-V: always report presence of extensions formerly part of the base ISA")
>
> Although my rationale was that if we get as far as here, then Zicsr and
> Zifencei are going to be enabled anyway so there is no harm in setting
> it for both. I probably should have been less of a cute hoor though.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I think there's no way to get here without the extensions, not 100% sure 
though.  I'm mainly trying to avoid going down the same rabbit hole of 
ISA string compatibility hacks in ACPI that we have for DT, though -- 
I'm sure we'll end up with a mess as soon as we release, but might as 
well catch as much as we can.

>
> Cheers,
> Conor.
>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/kernel/cpufeature.c | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>> 
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index bdcf460ea53d..a8f66c015229 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -317,19 +317,14 @@ void __init riscv_fill_hwcap(void)
>>  #undef SET_ISA_EXT_MAP
>>  		}
>>  
>> -		/*
>> -		 * Linux requires the following extensions, so we may as well
>> -		 * always set them.
>> -		 */
>> -		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
>> -		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
>> -
>>  		/*
>>  		 * These ones were as they were part of the base ISA when the
>>  		 * port & dt-bindings were upstreamed, and so can be set
>>  		 * unconditionally where `i` is in riscv,isa on DT systems.
>>  		 */
>>  		if (acpi_disabled) {
>> +			set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
>> +			set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
>>  			set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
>>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>>  		}
>> -- 
>> 2.40.1
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
