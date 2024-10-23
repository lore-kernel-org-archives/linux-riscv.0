Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7BDCF538F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gDYv9CrDcbWLgldGw+fvlohp0h65m1VwQ85rYmbKFY=; b=02MShm0aLW6UFn
	87PCAZfae06KB/gW5euwOUOoQWzdoxQB6yZ3QEGmtg2uK3OZCUPsNVZewy38Ds7v8hILJSuc7bQVn
	AW0ijXY7eLyHGsZkpZWSucNx+QVXkE+TzizHPZSvZl3RDWaJdHuHLy127jaGexd8zARcA6OUYTS83
	Zmq/ealhO18hNcW9Hq6KxzXi4ZHST/EpGtCX31MY8zEToy7nx0/KOKn7cUhwKXVz5qRP4OI0s+S98
	YOEdH1Goq45e5WFJ2wZpIgnSfLoUQ1kXuwy+zzg/0vAmdkWzczQJlZ+1jIT0EFX6JS2AP/Jg4D+Ts
	s4WRs71y9FTt43inhWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cIn-0000000EggB-3LSY;
	Wed, 23 Oct 2024 14:25:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cIj-0000000EgfB-1wKg
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 14:25:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-431688d5127so45804665e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 07:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1729693524; x=1730298324; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbBGUrTTwoSsEPHprz8mGE870fzfQn9kpkbrOCXaRAU=;
        b=fUjLRED43TJt5o3rLOOQKxkPtnYUJO4cfs1UgnI7tcPP2L+r9ysjKkLhzd6/AGO1hL
         l25OGTAJlY7iQOnb5T5Kdsr1Htd7yFzVF002jrtrN6X9wLu9yuU6S9YZhWkpbfVCKlAS
         UuiPMcuRtTtRXEiOMO6SKYgi9oV7VfoRkQHZ6uyUblMFNSSolnEEuSw1u25Gaor+LEjf
         s3vXgmAJ29ARgy2qkfHWiCR4n01G4zyxNA5Q6MU5lrFNl7mRr0IzuiqX00vN8+vgFf4C
         J6CxBChJuPxAdSBCw/DJGog3wy1YKLlhax5+r/2rvNIy1thNj6+WEPILZ0mh7RkH43H5
         ZuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729693524; x=1730298324;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbBGUrTTwoSsEPHprz8mGE870fzfQn9kpkbrOCXaRAU=;
        b=R/4nxM8MAuFHKBTeqbqvlKZYOtsc0esrmhcvZDt58UPYp6F3MITYUpy1c9ptd67FEH
         prLZlcpWE9IIQ2N3lqyKCQkON82nqHaEGUHbHE1Xti5N58wrAsNDd8qS6rL8vebZ1OQS
         UiXYahSdQXVBM3OR1HPLzjRG6ydkYg2ev8yLfAawLq0h7F7ZUKXEYNlssGdy1DrM6lUM
         mKV0opEIwEhd815xxtBu5GgleymTzne/5TaFFLvdZ+K64E+ZehdzAzQURc6rdj0fVOWe
         usoJSEcfS+x5Z+j5l9rEtxO4P7vn+d23jhnJdSqcVqmwClflKyqJbfEulYroS/AetrIy
         9ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPNAMBuDyGaU5YIHPSai+cAhYBmiREPjJRlgKbnaNEvu2ZRgajvBFf2II/Jq4oPO1NMXntX5WdZNNehg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTbemsGRK8Q5WU0STj26UBqB8FiSgQt5QrEu9KytvVTt3akfPO
	6K5oSh93GdCnKi9fai0V6TcYCm7msO9m7k6ByX0eVSBUQeKMC23CXcNyNIf628Y=
X-Google-Smtp-Source: AGHT+IH0BmYhNGb6Zb0oJGSdG6YllMWt2Vog0aTsr5Pi+a0czFvT36y4AITV9lfciKIwZL7MAwqiDA==
X-Received: by 2002:a5d:6707:0:b0:374:c4e2:3ca7 with SMTP id ffacd0b85a97d-37efcee8e52mr1870049f8f.5.1729693523957;
        Wed, 23 Oct 2024 07:25:23 -0700 (PDT)
Received: from localhost ([149.57.114.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a487bdsm9064779f8f.32.2024.10.23.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:25:23 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: palmer@dabbelt.com
Cc: Alexandre Ghiti <alex@ghiti.fr>,  punit.agrawal@bytedance.com,
  paul.walmsley@sifive.com,  aou@eecs.berkeley.edu,
  alexghiti@rivosinc.com,  chenjiahao16@huawei.com,  guoren@kernel.org,
  vishal.moola@gmail.com,  stuart.menefy@codasip.com,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org, yunhui
 cui <cuiyunhui@bytedance.com>
Subject: Re: [External] Re: [PATCH] riscv: add a warning when physical
 memory address overflows
In-Reply-To: <CAEEQ3w=S=Gn9qER=qNwUn8+Gs9AN4Y5-0Zg0w8-4Vps4L7n97w@mail.gmail.com>
	(yunhui cui's message of "Wed, 18 Sep 2024 11:49:27 +0800")
References: <20240814062625.19794-1-cuiyunhui@bytedance.com>
	<afaa4192-da08-4180-a09b-2b953293ba76@ghiti.fr>
	<CAEEQ3w=S=Gn9qER=qNwUn8+Gs9AN4Y5-0Zg0w8-4Vps4L7n97w@mail.gmail.com>
Date: Wed, 23 Oct 2024 15:25:22 +0100
Message-ID: <87fromgalp.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_072529_864688_70947566 
X-CRM114-Status: GOOD (  19.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

[...]

>> On 14/08/2024 08:26, Yunhui Cui wrote:
>> > The part of physical memory that exceeds the size of the linear mapping
>> > will be discarded. When the system starts up normally, a warning message
>> > will be printed to prevent confusion caused by the mismatch between the
>> > system memory and the actual physical memory.
>> >
>> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> > ---
>> >   arch/riscv/mm/init.c | 8 ++++++--
>> >   1 file changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> > index 52290c9bd04bd..c93164dc51658 100644
>> > --- a/arch/riscv/mm/init.c
>> > +++ b/arch/riscv/mm/init.c
>> > @@ -236,8 +236,12 @@ static void __init setup_bootmem(void)
>> >        */
>> >       if (IS_ENABLED(CONFIG_64BIT)) {
>> >               max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
>> > -             memblock_cap_memory_range(phys_ram_base,
>> > -                                       max_mapped_addr - phys_ram_base);
>> > +             if (memblock_end_of_DRAM() > max_mapped_addr) {
>> > +                     memblock_cap_memory_range(phys_ram_base,
>> > +                                               max_mapped_addr - phys_ram_base);
>> > +                     pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
>> > +                             max_mapped_addr);
>> > +             }
>> >       }
>> >
>> >
>>
>>
>> A bit weird to review and test my own patch, but here it is anyway :)
>>
>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>
>> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Looks like the patch has been ready for a while now. If there are no
further problems, can it be merged please?

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
