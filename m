Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BC8E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Gq0Smi2eZ5yZkHKQzh00iHA/onJ+VZDj4aJ4Rbho0ag=; b=2GIPVYZCiKrhwydej3kPvEx0/f
	ciW3TGWObdbyEzeaDLxRihKhW/hu9wBjspxKnw3py3FLt6NEQ4/ZQHxMR486gQ/dK08BJCLH7TGaH
	oURT0SJIDRxltcah6kdoqYO2fWRUcoTG0pSbeqMGNgXo7+sGHS8X1p26ZJQwqmLjUznrDeigDZrbU
	XJaCmNCKeHAtAIdRCtlGtTLX6You5j2yK26uIq1ZTCqGnvKeNV9tuzCCxqvJ4MC6l1yKFWnWw+WpE
	uydjEO/Eva5438ZPTh5P9DUSfx5aWkXHI82VN9LywIbnnR8HiAME57yl2GDDOotC7AZf0mFzmJN2y
	ApH2elHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUkT-0000000GFQB-2BYf;
	Wed, 11 Dec 2024 22:00:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUkR-0000000GFP8-0t3L
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:00:00 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7fd49d85f82so3120804a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 13:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1733954398; x=1734559198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysfEfMkRShl7ZQ6rcvjQZizTooHGsZAtmuWoKudrSMo=;
        b=S51ZLXpBtdfE2nzj3rWO/vPPpor1BlcbWJOCmNBnMvXPoE54qGDw5zB+KIixEP04Uu
         DcNVSSHv/LJPO3RfbqgC9bGskNpQFjo91zr5O9sWRnZ1ccPT0lZ+ZjZyQb7AE1NDC/1H
         /1uoQ/3rMopxKtON1h0/2/5NsMF4kvK5sgR8dXlGsByyDwiTrafNVPgy0Il3+Ge4uggX
         eEjU1JkiKEO2beJrSU3NdgT2vLYijNcfhuPsF1FhVPsHTNxatMV7okg+Q4iPUPff8qMy
         +x+7GCRoxApmB5SH9t76F/Lkp5Bwd54WCuI1LHApWS3dUbVlG/IDsV8c7CV5d93keBCk
         55MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954398; x=1734559198;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysfEfMkRShl7ZQ6rcvjQZizTooHGsZAtmuWoKudrSMo=;
        b=tkR1zuXbaJA43rui6xHpp6UmgEJJ8IUcJ6DSIb1JijWwDmUkngPwkQkGdnSKOBDHdg
         cqgsVYsKkmtmSmblKDQKyajJNnc0LzZdjgjw20YfuQjUH08pTFoMMvPpNabyhmQ4oQ3P
         ZpAjWasnshD1dWFdWu8aPL+EPqEuEpVlSlHSPW4eA1Lc1XErTSF4+XvIaj6gMWoN/6Qw
         44zIO+7M8WhzAdoOIZ61ysXUnDlB39x9+TZlM2ou9CyIWfRxONJIkGIEwpdX+Gv7vPps
         sCptywSi8whveXMN7sqEo8MOZ5xG4s+tQpmHEVycA7pvEGifkjLfy6HwckzgJmjY/6Th
         dEvA==
X-Forwarded-Encrypted: i=1; AJvYcCVBTouadGmoIPgpe4yeVuQhqIOOmx/y5Ggi0YA4EaZO/VC1SJZc1XFzRokuWKKFJNMorHn8X6a29DkPmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMe+LeboZOpNYaLcuWlGoFshUNvJB5hyz7Hla1Cm/VHHzXjyw4
	qelWLeY4K8SevhKEm5pF8LoNfnSdMtv5MayPhgya5H2WSbjrJhFtghQVVbfArIo=
X-Gm-Gg: ASbGnctdYxmQHHUlzflSDBsG1PXjxe9uSt7Qo2+Tj4GUH/fqcdkJjuzHnWc+ITBEENf
	euWCV03sAuUUMZ3FhdHPxE5sOduDLmfEy2wrqNcXM33Xe+BV4Uh0DfTTen+2QSPS18qdgS89sUS
	07KTK1qbiZVwv8Ti2yHcBC/bLXNYHME88IXTxKyXl3veHY5P3/QodZObALJiqbillUgW3nTfIhV
	996VQTFH5OHwBl6yeWr8CMrlnP0Kolhzvegvk6gQWC0RwA=
X-Google-Smtp-Source: AGHT+IEe15JJyYKtkAHuxohnoY6qiZwwCLJ+yMJNp2SXyg2ac68X6HXMty2F6N0NtFrMS07/og1DhQ==
X-Received: by 2002:a05:6a20:cc0a:b0:1e1:cd9c:3775 with SMTP id adf61e73a8af0-1e1cea981c0mr1154087637.12.1733954398333;
        Wed, 11 Dec 2024 13:59:58 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cf9f681esm8213135b3a.98.2024.12.11.13.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:57 -0800 (PST)
Date: Wed, 11 Dec 2024 13:59:57 -0800 (PST)
X-Google-Original-Date: Wed, 11 Dec 2024 13:59:56 PST (-0800)
Subject: Re: [RESEND PATCH] riscv: Fixup boot failure when CONFIG_DEBUG_RT_MUTEXES=y
In-Reply-To: <7e93d7a9-caa8-40c4-997a-d96ad94dbe94@ghiti.fr>
CC: guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Bjorn Topel <bjorn@rivosinc.com>, Conor Dooley <conor@kernel.org>, leobras@redhat.com, peterz@infradead.org,
  parri.andrea@gmail.com, Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
  Arnd Bergmann <arnd@arndb.de>, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-a0dbdedc-aed2-4dc3-b556-3a81530e7ec4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_135959_251026_47E9921D 
X-CRM114-Status: GOOD (  27.74  )
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

On Wed, 04 Dec 2024 00:27:00 PST (-0800), alex@ghiti.fr wrote:
> Hi Guo,
>
> On 30/11/2024 16:33, guoren@kernel.org wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> When CONFIG_DEBUG_RT_MUTEXES=y, mutex_lock->rt_mutex_try_acquire
>> would change from rt_mutex_cmpxchg_acquire to
>> rt_mutex_slowtrylock():
>> 	raw_spin_lock_irqsave(&lock->wait_lock, flags);
>> 	ret = __rt_mutex_slowtrylock(lock);
>> 	raw_spin_unlock_irqrestore(&lock->wait_lock, flags);
>>
>> Because queued_spin_#ops to ticket_#ops is changed one by one by
>> jump_label, raw_spin_lock/unlock would cause a deadlock during the
>> changing.
>>
>> That means in arch/riscv/kernel/jump_label.c:
>> 1.
>> arch_jump_label_transform_queue() ->
>> mutex_lock(&text_mutex); +-> raw_spin_lock  -> queued_spin_lock
>> 			 |-> raw_spin_unlock -> queued_spin_unlock
>> patch_insn_write -> change the raw_spin_lock to ticket_lock
>> mutex_unlock(&text_mutex);
>> ...
>>
>> 2. /* Dirty the lock value */
>> arch_jump_label_transform_queue() ->
>> mutex_lock(&text_mutex); +-> raw_spin_lock -> *ticket_lock*
>>                           |-> raw_spin_unlock -> *queued_spin_unlock*
>> 			  /* BUG: ticket_lock with queued_spin_unlock */
>> patch_insn_write  ->  change the raw_spin_unlock to ticket_unlock
>> mutex_unlock(&text_mutex);
>> ...
>>
>> 3. /* Dead lock */
>> arch_jump_label_transform_queue() ->
>> mutex_lock(&text_mutex); +-> raw_spin_lock -> ticket_lock /* deadlock! */
>>                           |-> raw_spin_unlock -> ticket_unlock
>> patch_insn_write -> change other raw_spin_#op -> ticket_#op
>> mutex_unlock(&text_mutex);
>>
>> So, the solution is to disable mutex usage of
>> arch_jump_label_transform_queue() during early_boot_irqs_disabled, just
>> like we have done for stop_machine.
>>
>> Reported-by: Conor Dooley <conor@kernel.org>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Fixes: ab83647fadae ("riscv: Add qspinlock support")
>> Link: https://lore.kernel.org/linux-riscv/CAJF2gTQwYTGinBmCSgVUoPv0_q4EPt_+WiyfUA1HViAKgUzxAg@mail.gmail.com/T/#mf488e6347817fca03bb93a7d34df33d8615b3775
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/riscv/kernel/jump_label.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
>> index 6eee6f736f68..654ed159c830 100644
>> --- a/arch/riscv/kernel/jump_label.c
>> +++ b/arch/riscv/kernel/jump_label.c
>> @@ -36,9 +36,15 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
>>   		insn = RISCV_INSN_NOP;
>>   	}
>>
>> -	mutex_lock(&text_mutex);
>> -	patch_insn_write(addr, &insn, sizeof(insn));
>> -	mutex_unlock(&text_mutex);
>> +	if (early_boot_irqs_disabled) {
>> +		riscv_patch_in_stop_machine = 1;
>> +		patch_insn_write(addr, &insn, sizeof(insn));
>> +		riscv_patch_in_stop_machine = 0;
>> +	} else {
>> +		mutex_lock(&text_mutex);
>> +		patch_insn_write(addr, &insn, sizeof(insn));
>> +		mutex_unlock(&text_mutex);
>> +	}
>>
>>   	return true;
>>   }
>
>
> Sorry for the late answer, I've been sick lately!

Ya, I was also sick -- bad timing.

> Thank you very much for looking into this and finding this not-so-bad
> solution! I remind everyone that this is a temporary solution until we
> can use an alternative instead of a static key.
>
> You can add:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> The revert is still on the table IMO, let's Palmer decide.

IMO it's fine to just take this as a fix.  Reverting stuff is always a 
nice big hammer to have if we don't get a fix in a reasonable timeframe, 
but with a fix avaliable in the time I was out sick anyway I think it's 
fine to just take this.

So I've got it queued up on fixes.

> Thank you again Guo, really appreciate you took the time to find this
> solution!
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
