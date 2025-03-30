Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1519C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P8b0nFsJ6L1Etf5WOLvbf620GgurZhqTtBXj6VyE51c=; b=wYwbYNCpwnIzjwLgzel41g6LWa
	jRGI9KoEnxz1b+y1qZD/AkG14u2QOAXuWglt4Id9lfuGHi//xTKqGBc3yhCIG3z8cO67yGPILfDK6
	Rhqr/ETbesgfu9TEmIQawf4FGgGZp7USan4oj9l3ElACta0pjOHsciT1bwcUJOoyCdJg1uC1MA8Db
	GYMw9GkxXeusPZo0I4vJXpeQQLKVrbRKp6zNeBhHhS+INcK5yZCFW6BFa5aoJ6CptnqMqM6PU3Qpp
	0dHhx8o6gvGlIA+YdxBCGqj04OSZ4/H6Er4iGFOh1bZvTpgsmi9arzr/A3DJwzQSM2v4gFRcOCdgt
	TllgpPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyfC-0000000Gbw4-0GwY;
	Sun, 30 Mar 2025 19:49:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyWk-0000000GbJN-1jSw
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 19:41:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2240b4de12bso43915535ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 12:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743363661; x=1743968461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OuhYgE9UKtdazOjGt7lZhWPBMr5ttmJNU0h7Ws00MA=;
        b=TybaaBj9scJSnl9t8n448/qp5F6N4JoEvr44ufJJtvG54w29WK/p4TspbN1rzIBwbI
         2jYtzjeLXHJ1zV1NDgd3Lma/JrdCjPyO7/Uj3ANhORDgOCGy3McGAkqzI92UJBSmk0ew
         r+RrzcA9iEUgts/62EbB+NdbcA/gc6egdOtcA2dqf9Ki7+j2S1EYlDJJi3zqjW6uj3Gi
         bWbEK5TUHDOPxHvbVOgCuhSj/HAvS4vdGCTfdL1+d3ZgCKYgox95+y+6BUlJHlda+DJH
         Woh79KzCpIHKOUPCyDi3e+b3Zj5Ibt8El7T4DRQNU+jKhEUQ+GTAEUidE5807iHYQLH3
         AuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743363661; x=1743968461;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OuhYgE9UKtdazOjGt7lZhWPBMr5ttmJNU0h7Ws00MA=;
        b=oiHgbpUDj4QDKbotPk5y/rW9ZaY0xpmXhNvGB4ro1xgl9EkM//h84ziK0WmS0FIGxE
         E9uf1d6yvF28cGdn1TMbSOaPs8xwRedrrzRoT0qGsbrKUG+dOUEHd5kSOPCEMM99g7/y
         ypxUt37V7S70RVeRcntW6M+uK1xpcES5t9viiPsVfLjMge/pPScNzVj7Mc5PYrSQ1QOh
         qT52/Nd0g/TSLlS6iNdQHuxx8+VEXroPp3nrBiTnyBm9bvOD8eKg261opSzKhKg9sSeC
         eYHgH6OTHA/wCGlhgNx4VNIQsH6tVBtpQgQN/0dTCHn6YqZLtUpi0rSwFgXxaw6vRkmm
         49gA==
X-Forwarded-Encrypted: i=1; AJvYcCV/CgC4WAa8bh5GB/mJqEAhmdIOawEIYnOlTQcK0cAjPlVAxIvyjYdCdn4vLaqFoQOyVtHirkGCfjN5SQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeKEQ6JawjfUhTGA8qhd1RZ92/X9r6LXABmKo8dul7KqsX6heG
	qxYSEQ3XJI5IR9jp6mj1ozfjXQB1yMqRh9g5E1OTJncoE6NlrmkbcL2WxXQ6/KKS/9QO/w86EXD
	5
X-Gm-Gg: ASbGncucUJB/Te1Ihgses+2aLpkoL5ZUHLeWhBBF/WRfdb+oi664XXdv827hXuDef8f
	xyzomPHA/ysGKN0CbIbcu6sgZ/raO8oOgTvq9ZvmaTqFD6tW2EptgCBR4RvITePGOiKJnCorUsq
	8sswd7Nman1GONAP67wP9FDKP7Oq9H/SO5GCaKuK6aLTTauzHhzzF5RsWGsxUcWQDsGyMh5/1Z7
	4lAIrjrR53hk/xu8sDNlKl4GfWNo5+w6ZIgxS4fpBHf5lrVPLvg/hfrpTaE9yPrcWg+ERv4HGTO
	dcZNwXu5KD7LV7UEsttolCUvOkicheESYhNTxTtFxAI=
X-Google-Smtp-Source: AGHT+IEG7YrYhpL/w09D8dnY5K3an5rvJtbNaqnybIxihpbpyRDNZbeGKtMfVSy2S9ch1DWCihaYZA==
X-Received: by 2002:a17:902:d505:b0:224:7a4:b32 with SMTP id d9443c01a7336-2292f95bf43mr76417655ad.20.1743363661089;
        Sun, 30 Mar 2025 12:41:01 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f69desm55779605ad.253.2025.03.30.12.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:41:00 -0700 (PDT)
Date: Sun, 30 Mar 2025 12:41:00 -0700 (PDT)
X-Google-Original-Date: Sun, 30 Mar 2025 12:40:53 PDT (-0700)
Subject: Re: [PATCH] RISC-V: errata: Use medany for relocatable builds
In-Reply-To: <14b85486-c94d-41a1-aee5-c9ca101bdeaf@ghiti.fr>
CC: samuel.holland@sifive.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-b55f8035-7ce3-487d-92c8-988f5c8b58e7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_124102_725701_0D99C9E9 
X-CRM114-Status: GOOD (  17.15  )
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

On Fri, 28 Mar 2025 01:18:01 PDT (-0700), Alexandre Ghiti wrote:
> On 26/03/2025 23:45, Palmer Dabbelt wrote:
>> We're trying to mix non-PIC/PIE objects into the otherwise-PIE
>> relocatable kernels, to avoid GOT/PLT references during early boot
>> alternative resolution (which happens before the GOT/PLT are set up).
>>
>> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/sifive/errata.o: relocation R_RISCV_HI20 against `tlb_flush_all_threshold' can not be used when making a shared object; recompile with -fPIC
>> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/thead/errata.o: relocation R_RISCV_HI20 against `riscv_cbom_block_size' can not be used when making a shared object; recompile with -fPIC
>
>
> thead erratas are already compiled with medany if
> CONFIG_RISCV_ALTERNATIVE_EARLY is set
> (https://elixir.bootlin.com/linux/v6.14-rc6/source/arch/riscv/errata/thead/Makefile#L2)
> so why isn't it enough?

Those are linker errors, we can't pull the medlow code into PIC objects.  
So any objects in relocatable kernels need to either be PIC/PIE or be 
medany (which can't reference any absolute symbols).

>> Fixes: 8dc2a7e8027f ("riscv: Fix relocatable kernels with early alternatives using -fno-pie")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> I'm not 100% sure it's possible to expose this without Samuel's NOMMU
>> relocatable builds, see
>> <https://lore.kernel.org/all/mhng-517c0318-c8fb-4c4a-aa0e-0d08f8d34d78@palmer-ri-x1c9/>
>> ---
>>   arch/riscv/errata/Makefile | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
>> index f0da9d7b39c3..bc6c77ba837d 100644
>> --- a/arch/riscv/errata/Makefile
>> +++ b/arch/riscv/errata/Makefile
>> @@ -1,5 +1,9 @@
>>   ifdef CONFIG_RELOCATABLE
>> -KBUILD_CFLAGS += -fno-pie
>> +# We can't use PIC/PIE when handling early-boot errata parsing, as the kernel
>> +# doesn't have a GOT setup at that point.  So instead just use medany: it's
>> +# usually position-independent, so it should be good enough for the errata
>> +# handling.
>> +KBUILD_CFLAGS += -fno-pie -mcmodel=medany
>>   endif
>>
>>   ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
