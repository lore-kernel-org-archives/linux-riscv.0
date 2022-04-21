Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41951C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pgIfpS/pa/g8qW1YETK7CytntURhMEd50MAQTGvQfio=; b=Zw96+b+TzLqVcz0P8jtmgCyeQI
	6z/JXF7xvvvAj8NgwYdV7aZ6+US/2iSKPkq0h9y0K1x2L5ykLxAqUnpWRBGsD/m40qYMtJT/J0+rH
	qKMd5S0U92d0TfU3y+oOZEwjPg0CM3OCAuP7qFilDrveIiKCk9wXCjOOWCv52ucasW9Tgol10RceA
	9W0XqHox0+58RmMtv8CEABy1yXHNBW7aAQamR3adi0vUgN6uJVulWFdaEKn35s/q1JO6ncdJ20AVb
	YTmvdvslPWtzCwOkMCoThOjEBgu9jQzq1cdZ+Xg65NJ+0koquUvY2ztvGEBB83N0pK6pHaGl12KTy
	1xJqw5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhe6h-00EzvQ-Fz; Thu, 21 Apr 2022 21:12:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhe6e-00Ezun-RP
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 21:12:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id q3so6491865plg.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Av/ziOvsBe24F2oAdgKNQqRde9/UDT0IRqk3LqZYlqs=;
 b=S6Q8xGgqM2kfoIUPKvTDKebAdhxR75QL9mtWQP3WR5Jm3lbnjbvaiVV6Br7rZy+pzt
 5cRgVtohDq1YlQvWSplyA61T3eO/4DPMCQ/Fbdw4pCvXJyutRP0j64EnFN14wvCedz5r
 lHxF76La2CJL8tCvUeZdTPU14bKLgyBykRINW/78Ldd/6OYbJEKYfBNfYjOcoWULuMnr
 3I5B46xF9AZ+F/xUhnJ0b/zSNlLUXiLb3odiOHZJfsYIEQnXn2q2uEzZdDldP8IGAsp5
 b0wokV7PIGRjQg40xvtCh/aUweT6Rl6ffS/02fBvhaBFsOu+epFmnXwzdKusJBuC08R6
 fklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Av/ziOvsBe24F2oAdgKNQqRde9/UDT0IRqk3LqZYlqs=;
 b=QtTeCzVDQ8SsW454dEqTLU1a/yyEgh5G5Ob2VLSLVhTSS17m5etpqcs1mNSLdzX5k2
 vVAxhJ8t13Rkml8QhSYFgRVvUxvBHawIl0E2G0+I8oecqVnFfiEiFXHlLqme0/muFVnW
 65pitr4xUtMSoundhgQVMe2KgX+fZhl1bTFXwSWueiRZGvKyAP5p9IZHO2yASaHOMgpf
 rG3bduFiDCJ3U5sWBQAQ1ZlrGVc2ZN/q+tqQ1PsTVsZc7QaiCL/C0SwI+IPvLDatbny0
 tdC19o5YiiHRrqeeqof6a1yVn6s6zXh+5GSQJd2WutGLMXQ3NbnCSDiPQbHNvKFNlzO8
 mQMw==
X-Gm-Message-State: AOAM530EdYCwytftdpRepkRoCMX7z2btXjWF2PFHooj7d2V4zuh46aF1
 ZzDbNdSoY1GAAOlJG3aGNy+uMg==
X-Google-Smtp-Source: ABdhPJyx2PWRx3w0ZujjulplgxOwGoryhsFics0FxSW0K1o19/akULPWPf5g9n8TC6i+DmteyWnUQw==
X-Received: by 2002:a17:90b:4d01:b0:1d0:f39f:6073 with SMTP id
 mw1-20020a17090b4d0100b001d0f39f6073mr1628253pjb.175.1650575570116; 
 Thu, 21 Apr 2022 14:12:50 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 m23-20020a17090a7f9700b001cd4989feedsm3697189pjl.57.2022.04.21.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:12:49 -0700 (PDT)
Date: Thu, 21 Apr 2022 14:12:49 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Apr 2022 14:12:46 PDT (-0700)
Subject: Re: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not having
 Sv57
In-Reply-To: <CAK9=C2UB-SKcb2Lf=m9VQZnOmkoY1W=kNeSJ40VcVXfr5WuPZQ@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, alexandre.ghiti@canonical.com,
 atishp@atishpatra.org, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 mchitale@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-95003209-d4f2-4394-be70-d041a44af77b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_141253_140878_A7943D59 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, 21 Apr 2022 02:30:05 PDT (-0700), apatel@ventanamicro.com wrote:
> Hi Palmer,
>
> On Tue, Apr 12, 2022 at 9:04 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> When Sv57 is not available the satp.MODE test in set_satp_mode() will
>> fail and lead to pgdir re-programming for Sv48. The pgdir re-programming
>> will fail as well due to pre-existing pgdir entry used for Sv57 and as
>> a result kernel fails to boot on RISC-V platform not having Sv57.
>>
>> To fix above issue, we should clear the pgdir memory in set_satp_mode()
>> before re-programming.
>>
>> Fixes: 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
>> Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> Can this be considered for 5.18-rcX ?

Sorry, there's a queue but I just say this one at the top and it's super 
simple so I'm going to take it now -- IRC is good to ping this sort of 
stuff.

It's in fixes.

Thanks!

>
> Regards,
> Anup
>
>> ---
>>  arch/riscv/mm/init.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 9535bea8688c..b0793dc0c291 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -718,6 +718,7 @@ static __init void set_satp_mode(void)
>>                 if (!check_l4) {
>>                         disable_pgtable_l5();
>>                         check_l4 = true;
>> +                       memset(early_pg_dir, 0, PAGE_SIZE);
>>                         goto retry;
>>                 }
>>                 disable_pgtable_l4();
>> --
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
