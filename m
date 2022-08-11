Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D9C19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9s0QhMUtLr6OXc3ScHpPbp+Oltjhy7gG2vZHdp958Og=; b=o9PhT2Qb0ihDEvNIdZtMC+fMBk
	UK0QZm00kJ3g8WNKVKYp6iDApZtc1ca9rkrgV7GNYThj+EZZMUuRwKjbcMYjWcKtnymeHRNUe50WP
	HKkU/ZCuNDeenBVRiO2WOd8gfgcMMV5yAqNrq5eAO+W//4lt6d2XTruY6X8mAA0keH8WVrn/ED1ba
	7MFzwLDu64zYo6BEIsf+w3UxYq+AkAC5vaw8VQJ3aib1+4Y3qbecZci95Y25jccx8SWV1Yb9RpbmK
	rEbib+O8Viyjw0RZABdZb53N7YJDdoeEwBpau+5x6cBWinIAQj2io0Sjw0weRizVXHv/nejwWkqu1
	d7CtuklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOW-005KOu-Nc; Thu, 11 Aug 2022 21:07:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOQ-005KEB-52
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:07:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id g13so11021957plo.6
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=gFhHUy/iUMik9wCmhg7AJSXwei06D+twVjuQ+voamF0=;
        b=JBAUctFELzLynDS1x2vMTz1z78JNMCoR1yAyIwosCRakfuMmof9a8LNC/gTaeuh1wM
         VTOQ821rViK3qliGE6RoTFgbH993VBnQW9mfk/AujXeP9TphdudqYEmnEdP1XSDqz8v6
         U35XUCZRoPrzQ+rHYR+20tpWCrOtHCrcuirkxPjogXPauqVxmMw9Oj1BX5rqlTuJGEtN
         dJ3fGbAXXJ9jm//Z6fmyjBd0kSEynXCOnPaldinFspM2elnqrCvdaEPVF1FE4PI/DJGh
         fjhcunhyeU0t+HOONnnd+0U6QGQF3/6HCv/VG4aVvKFE8M3Y33kd9hMO6aOZkWPFRRZN
         RXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=gFhHUy/iUMik9wCmhg7AJSXwei06D+twVjuQ+voamF0=;
        b=KWElEOtTurUJeZUl+rp7YnZowcdTZEEVOFLXuOtjnfaQ7U1XzOwtqC2HjUOkAxTIvi
         K2L8xgrrBogUOHdbExCW6g8qRmMDUsowLRQQC1ZYjb5oYHvJj+RSbgpDuEVWgHUxXnd+
         eyEdyBjHpPYE+q+UAWacvOYMj6MY6YMhoJfzLvZWqn9eha6ZI2euM7VZJW1jYZhZCoFf
         QdYSV/F48yL5+f2qTOBVPGpgpy19hZviHMM9pQizuTZhQVT0yK9s7OXJGyOaf5OHZCFy
         YyOybk6pGbLixSoFnag7tfu/xot512HXHX8J61ZEmWIv/+yq9iw1UMbKlt4iK5K9S4r8
         dVrw==
X-Gm-Message-State: ACgBeo3/47cKXceQDopOXIivTS/+3RU3Z+Hphx45DJopPamIxzLg1yvS
	4qyQTYkBcwb3lZnxSjMp/vpjkQ==
X-Google-Smtp-Source: AA6agR5JlHJ+wnI81jWJk12DK+E80q4hW1i1eo0yaukcd+nYWilUSq0AOx3twAAPW2o7yocealc7jw==
X-Received: by 2002:a17:902:e886:b0:16e:d785:5a0 with SMTP id w6-20020a170902e88600b0016ed78505a0mr968194plg.36.1660252020281;
        Thu, 11 Aug 2022 14:07:00 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id v14-20020aa799ce000000b0052b6277df9esm141476pfi.43.2022.08.11.14.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:06:59 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:06:59 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 13:58:42 PDT (-0700)
Subject: Re: [PATCH] riscv/vdso: fix missing vdso_data declaration
In-Reply-To: <654185dd-db41-cc31-ee94-db56d5dfef81@microchip.com>
CC: ben.dooks@sifive.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, sudip.mukherjee@sifive.com, jude.onyenegecha@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-66872b72-36b1-42f8-abde-3af0af59298e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_140702_221249_D8C672C0 
X-CRM114-Status: GOOD (  20.23  )
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

On Wed, 13 Jul 2022 23:34:36 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 13/07/2022 23:06, Ben Dooks wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> The vdso_data is defined by has no declaration as the
>> arch/riscv/kernel/vdso.c does not include asm/vdso/vsyscall.h
>> for the definition. Fix the following sparse warning by
>> adding in the asm/vdso/vsyscall.h
>> 
>> arch/riscv/kernel/vdso.c:42:18: warning: symbol 'vdso_data' was not declared. Should it be static?
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

This one gives me a bunch of build errors, things like

In file included from /scratch/merges/ko-linux-next/linux/include/vdso/datapage.h:137,
                 from /scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/vsyscall.h:8,
                 from /scratch/merges/ko-linux-next/linux/arch/riscv/kernel/vdso.c:16:
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h: In function 'gettimeofday_fallback':
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h:21:38: error: '__NR_gettimeofday' undeclared (first use in this function)
   21 |         register long nr asm("a7") = __NR_gettimeofday;
      |                                      ^~~~~~~~~~~~~~~~~
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h:21:38: note: each undeclared identifier is reported only once for each function it appears in
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h: In function 'clock_gettime_fallback':
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h:37:38: error: '__NR_clock_gettime' undeclared (first use in this function)
   37 |         register long nr asm("a7") = __NR_clock_gettime;
      |                                      ^~~~~~~~~~~~~~~~~~
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h: In function 'clock_getres_fallback':
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/gettimeofday.h:53:38: error: '__NR_clock_getres' undeclared (first use in this function)
   53 |         register long nr asm("a7") = __NR_clock_getres;
      |                                      ^~~~~~~~~~~~~~~~~
/scratch/merges/ko-linux-next/linux/arch/riscv/kernel/vdso.c: At top level:
/scratch/merges/ko-linux-next/linux/arch/riscv/kernel/vdso.c:22:8: error: redefinition of 'struct vdso_data'
   22 | struct vdso_data {
      |        ^~~~~~~~~
/scratch/merges/ko-linux-next/linux/include/vdso/datapage.h:90:8: note: originally defined here
   90 | struct vdso_data {
      |        ^~~~~~~~~
/scratch/merges/ko-linux-next/linux/arch/riscv/kernel/vdso.c:51:19: error: conflicting types for 'vdso_data'; have 'struct vdso_data *'
   51 | struct vdso_data *vdso_data = &vdso_data_store.data;
      |                   ^~~~~~~~~
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/vdso/vsyscall.h:10:26: note: previous declaration of 'vdso_data' with type 'struct vdso_data *'
   10 | extern struct vdso_data *vdso_data;
      |                          ^~~~~~~~~

> 
>> ---
>>   arch/riscv/kernel/vdso.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
>> index 69b05b6c181b..7564f0208957 100644
>> --- a/arch/riscv/kernel/vdso.c
>> +++ b/arch/riscv/kernel/vdso.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/err.h>
>>   #include <asm/page.h>
>>   #include <asm/vdso.h>
>> +#include <asm/vdso/vsyscall.h>
>>   #include <linux/time_namespace.h>
>> 
>>   #ifdef CONFIG_GENERIC_TIME_VSYSCALL
>> --
>> 2.35.1
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
