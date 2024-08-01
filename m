Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB2BC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qPP/UB7QaPjCZqB0Hr2HQWAMMsm3xltPCM29hdQtP6c=; b=fQEGVLQFXy77ZQnF/68fYyGWYI
	SvFl6SXhE7LTji3goLhCIfdnRnL3tMWaLzjGSHYzJCPVj4XK+zET1JL7Z+6igCPH4cvX98wBHlFXa
	t7jlTh9l88bcd/3fr+cEwbrzseBP8N2npmnhgGYnx8whT2lDtyuMxar43AOcvsmSkWBOMUMnUUuR5
	5YkSqS7uvyLAcfC9nBCt9lS7VFvNLxZXrT1ggDfyHuRTuMqNcRatGKXfcRgz01ZVHmLTG9/qNpJX0
	czfLDqjcWahJ2HU29+StgQaCA8LnVNDajGxDyh5S0LGK0nUOPPTbWn/2BrpYrCSDsEzRttlHIjzfD
	tDObu1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZapo-00000006Rat-2FjJ;
	Thu, 01 Aug 2024 18:47:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZapl-00000006RZe-1PN1
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:47:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so5555342b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1722538048; x=1723142848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7Tgg9cuzRhQime+MvrA+O4z2pgv3NTD6cHJUCBgHjQ=;
        b=CE90Re78sycT1bWyLw81blTSOBjf2ZAbP0vQ3cKkyg2TQ3DQFwWUZ1sClEkSmTukrx
         nNFg0tOKlUmFE2yNTS3+M12nkNAKVDhoSxHkyDUU5G8L/4FBhlaEWZFaumRc61OGAuqi
         xGHMXlAvXq4lku2Tm9FJbW2xJGZQGvPwuIpACAfWZ54T6H/KxLEd0vI+C6QY7Iu3x1SQ
         9qcGBMr5rQJHArOsr61RkxBLaTZ6VIG32l6mVVWR6yBUUBS9tAQqNlqxSXMaxJFehM/K
         5Sz7zdLFObkdz3jZR+mkyfwoeG4AG90GKXmc5ZR0NNxa+DEJqCXD8OpcYnpYZm9oZ005
         88TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722538048; x=1723142848;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7Tgg9cuzRhQime+MvrA+O4z2pgv3NTD6cHJUCBgHjQ=;
        b=DOA+3yBFlTKUj8lM3qCUjyShnt80TKeskIl+CjiQ73GfPQ/lnq0oofzj3hekir8qdd
         /q//Wnjco/hSFtMhwB0CiJoq0XJdLBj/r55BSYEEFBVjZE3xbqzPSXP9bAuK/YbPaMBs
         n8GIDuKAYiC+kAFaXUvPn5HAuAFOpeDkfBiIYAMLxsAFgGVxzCakQaB3IO+udVXyYkBQ
         zq14IbTOphMDf3yrZehIDE4JTj13uvjRGHDb35w8ZBcAtJkGrLDUE+6JNk6xEDyLFRmq
         OaFK2ZqnC7IXVxLJ+drLf6Sg6CP/zQLPNUwJm60RVFsK/pK8AIR/Ec5oqA+iSuRbThI/
         8Sww==
X-Forwarded-Encrypted: i=1; AJvYcCVkj4h6vPYNI0R39pgp/DmP2b+Ewsr9VI48kWJoyoS61GOkgxk1hid9jPDYuFcPsBZW2OTgtsJrSl6vsHs/E9wcU5iRxp9JCRK9QMWliIkG
X-Gm-Message-State: AOJu0YwjHbrv8rMFSdaqYnXa7t8laDj6VAcTxYqxj4yl36W/biB7KNHy
	1GccC4aoCuPTr+nH9xU6Rd/0/0sJzxw+JBYp/OjX3Dka0+4eRdA8YTKBQMQVhGM=
X-Google-Smtp-Source: AGHT+IGGuihy01UVG9qtEpMnoM6jrsoEqBueNqLxQZUmecP8v5t35MiWuJCPX37Fz6yDIzLQLBwF4Q==
X-Received: by 2002:a05:6300:668b:b0:1c4:98f8:9ccb with SMTP id adf61e73a8af0-1c699620ef3mr1315223637.34.1722538047805;
        Thu, 01 Aug 2024 11:47:27 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecfaf1asm147821b3a.142.2024.08.01.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:47:27 -0700 (PDT)
Date: Thu, 01 Aug 2024 11:47:27 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Aug 2024 11:47:25 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: Re-introduce global icache flush in patch_text_XXX()
In-Reply-To: <0719e155-0a07-4878-87e3-cd96fed7a1dd@sifive.com>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-b8350c55-39e7-4502-b797-2b4a2c4dd758@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_114729_646947_5E92A71D 
X-CRM114-Status: GOOD (  18.68  )
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

On Thu, 01 Aug 2024 10:32:28 PDT (-0700), samuel.holland@sifive.com wrote:
> Hi Alex,
>
> On 2024-07-30 8:59 AM, Alexandre Ghiti wrote:
>> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
>> patching to avoid illegal insns") mistakenly removed the global icache
>> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
>> reintroduce them.
>>
>> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
>> Reported-by: Samuel Holland <samuel.holland@sifive.com>
>> Closes: https://lore.kernel.org/linux-riscv/CAHVXubh8Adb4=-vN4cSh0FrZ16TeOKJbLj4AF09QC241bRk1Jg@mail.gmail.com/T/#m800757c26f72a1d45c240cb815650430166c82ea
>
> Shouldn't this use the permalink for the specific message, not the thread?
>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>  arch/riscv/kernel/patch.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
>> index ab03732d06c4..91edfd764ed9 100644
>> --- a/arch/riscv/kernel/patch.c
>> +++ b/arch/riscv/kernel/patch.c
>> @@ -205,6 +205,9 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
>>
>>  	ret = patch_insn_set(tp, c, len);
>>
>> +	if (!ret)
>> +		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
>
> This patch was based on an old tree from before
> https://git.kernel.org/riscv/c/47742484ee16 removed the "tp" variable. While it
> still compiles because flush_icache_range() is a macro that discards its
> arguments, it will be confusing to anyone reading the code.

Thanks.  Alex is going to spin a new one, so I dropped this.

>
> Regards,
> Samuel
>
>> +
>>  	return ret;
>>  }
>>  NOKPROBE_SYMBOL(patch_text_set_nosync);
>> @@ -237,6 +240,9 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>>
>>  	ret = patch_insn_write(tp, insns, len);
>>
>> +	if (!ret)
>> +		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
>> +
>>  	return ret;
>>  }
>>  NOKPROBE_SYMBOL(patch_text_nosync);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
