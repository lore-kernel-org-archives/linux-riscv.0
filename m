Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557DBC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2F2LqQhYjwoLswOWexUm4Zh5AoJNXKP0Rd39f284HUw=; b=Rgb5Ej7BaNFN7v+3KBb1sX+nRQ
	H+HyF66/kxr58Osjezq7ipA1Y6MgaUlG1k2+sP6nkBFoKQhIYEV23vxIMY19a58hJPW643ajCjrgL
	bLrYo1OdfmuDlMMKHVXrw8urz84fYHo3OIWqWPnA358p5WDjuKwwvk7fOsipGR0ErFtmY8LTPhiLX
	yCAQ5dRkhUncfyJJepwfhGzkP7pfk9NFnEMT11UmN15ZCpsOA8ONgyeZjU3ONCUcKD1pcp5HVU/8S
	OGYMHVRRXusKAeXS8YIwbP/Ly8Ds70qg+SCszwoF1CmxUlB3mLq0wHxhlmBJLq5lxGxPUy5OFmcHm
	t6PMuuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHID-00000005Mgw-3Wf4;
	Wed, 31 Jan 2024 20:34:45 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHIB-00000005Mg5-1Akq
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 20:34:44 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso232075a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 12:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1706733281; x=1707338081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToCSOyY9UgT3lZYwTMmNWF442wR42KPytzlol85Izbc=;
        b=EtTUpfNHUmbaIbGuuxQTK7+TVPwVY4Aug0kDOtPNJKB5fpQ/oDRiE5FgdnhxZVpS8F
         Y58anXxveXd8Q9l+ZJdMmC1W3bRAzHWtK7RNg+8MjxVHEBu+uvy6XAYB5kjHdRXd1cUX
         mYXBF/mLXuDvbUZDTovm9xL4CZqHwSjNPGBcIhn0DnmUbl3wzc1HbwZAkW/bo4hVjJQQ
         MGfNaTQ5fkFiBH8jvUYjZv4zIhk3UWQE7Mylqi33fF2Y34B+9AtclODwHRzmjZUeD+UR
         4tciydD2V8pTRa0AaIziwEYUZP0usY/ZRGFujw/K8tBzDm8hCqdgK3GZuASA++MD0pvW
         JCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706733281; x=1707338081;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToCSOyY9UgT3lZYwTMmNWF442wR42KPytzlol85Izbc=;
        b=MRICvD/46Ol/4I1HMdUkJKmQSAEPGoUPxLwGQkrKQ0NIYMy06gxIWfrE0IHNXnb1rb
         7eaRtW7O+E8SPM3WLKRJKFid+fRDpcDQBlfKH5XJkLuwJ1KO8YNUn1hnool/pFiM2mZY
         R4RnhgbMtobNQ8K/b/A1wKAjC3caL7+ueePuGp7+7olNnOTRqYfQG02HenCDY4bcHvhE
         1SwdgRMClFTZtcpcTj2wrarOuWAi82AdGt2VHTXh9dyNjqhV4YBm73JbQyad9xoz4Vyh
         kg972LyueLR41IdJTnlTsfXK1P0z6e6ehmvPOQiXtnKtCuUjzck8ePC+39ai7LGnQfI1
         thzw==
X-Gm-Message-State: AOJu0YyMPku/tkNb/6PWPh0w3UshiUoqERGbD1kJOyAecyXCPikeXJL8
	/yJiGFxi79Q6HIVs7rTZuvrqMj2/XGZ4xZrx9fcn0hbHkSlofeqHYqbmZ346Ytc=
X-Google-Smtp-Source: AGHT+IEsFzJWhwkZHvWSeO6eMVC7rMYmcrfSRDwnS5J+jMrysPE3aQ1rfKm6FrvZ3viTgCzDnZxSkQ==
X-Received: by 2002:a05:6a20:f3a6:b0:19c:ad6b:e1c2 with SMTP id qr38-20020a056a20f3a600b0019cad6be1c2mr2839985pzb.12.1706733281551;
        Wed, 31 Jan 2024 12:34:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXqfWhjIx1TNL1IuyBOTEw7zpq0DQTBViDu+wnKkWGpI2jfceGOMShnRxYQcqH9PG5CsOjLDzniIjDpMJapuRkaaUmsJXgGuGs6v291UHPiNHY0seXAX/ag2QwQeq6+DLyZOm9bhoRF/Jvr9Bswuc3lIdtsoy6oOD7CsfFJdg9LUomiqByc0cDRvcwLeaYhkQDvCG/cro+tY2ymBZISpPksVyT45q7VNFXa4bupfBFtDn6mfcQ=
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id v27-20020aa799db000000b006dde1001a0bsm10275840pfi.190.2024.01.31.12.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 12:34:40 -0800 (PST)
Date: Wed, 31 Jan 2024 12:34:40 -0800 (PST)
X-Google-Original-Date: Wed, 31 Jan 2024 12:34:39 PST (-0800)
Subject: Re: [PATCH] riscv: Fix wrong size passed to local_flush_tlb_range_asid()
In-Reply-To: <ZbdpTPMOw4lsPxBi@snowbird>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, geert@linux-m68k.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dennis@kernel.org
Message-ID: <mhng-d603d0d3-2f72-4dfc-b635-c270ae79fd85@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_123443_535288_2234BB63 
X-CRM114-Status: GOOD (  21.45  )
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

On Mon, 29 Jan 2024 01:01:00 PST (-0800), dennis@kernel.org wrote:
> Hi Alexandre,
>
> On Tue, Jan 23, 2024 at 02:27:30PM +0100, Alexandre Ghiti wrote:
>> local_flush_tlb_range_asid() takes the size as argument, not the end of
>> the range to flush, so fix this by computing the size from the end and
>> the start of the range.
>>
>> Fixes: 7a92fc8b4d20 ("mm: Introduce flush_cache_vmap_early()")
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>  arch/riscv/mm/tlbflush.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index 8d12b26f5ac3..9619965f6501 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -68,7 +68,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
>>
>>  void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
>>  {
>> -	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
>> +	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
>>  }
>>
>>  static void __ipi_flush_tlb_all(void *info)
>> --
>> 2.39.2
>>
>
> Sorry for the delay, I just pulled this into percpu#for-6.8-fixes. I'll
> send it to Linus this week.

Do you mind if we do a shared tag or something?  It's going to conflict 
with 
https://lore.kernel.org/all/20240117140333.2479667-1-vincent.chen@sifive.com/ 
.  No big deal as it's a pretty trivial conflict, but they'll both need 
stable backports.

>
> Thanks,
> Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
