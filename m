Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C214EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kERsfCWrfh0eFFvMV4Mk9oEnQfEC5678LNSZjkTEgpk=; b=n4g9ZFkpbh+ABKle289Ti8htdA
	NQYlgRcRKRsvOhjcQAGzeOABoBOy8oAupbd8zShFHJpK5Kf6SuVofT/yLL23balSNKTY9HKd2mhP2
	XTa5+o4KRrBP9FZX0fTZGeD7Wq/i/GJsUuzrJ0NikF0BarTGeDvXTeHLruFtpLFc/mFyXuy8d5q4W
	0bMZYAdc3vQ5/sCmlfCpM9xxBbNL9Ji5rSRTe/s1QvSc1ECBszlXNJynK2LSMbx4z7l/Z4vXI+Y3y
	rPj7RtU0VJNDXXHHkjtjdhS9+WMj+90AALTJeavMSt7+YuGhYjK2FiIeCJ9PdRI6I+r21KbbUL9Fz
	ppr/4RAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbtI-001HkH-9o; Thu, 02 Jun 2022 03:52:56 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbtF-001Hes-6x
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 03:52:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id w21so3727460pfc.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 20:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=wUCm0YHDvCYDpmRLDnHBVbbCEPwJyFjXA8+1aHpeL+o=;
        b=zaQZpztukhJ1+lyofqGSIosNGZoFy6UaoiAmMwlnG7TUbBZYMI6JDC5A0D2Fjy65FO
         3wjpd7Kw7u4d3jdJYyCEszI1pWkmUKH8v0Q1Ov9X0P18sGtQp+hzLkkdaoPHXI0JoV1a
         cLJYvsDknMNt0aghuHjOJ7xw9KH3/4z+/IOArThv8R7eoqB42ZVKdfgVCvOonegYUTC2
         l3T1YsQPVkHqYXuh3E+qQ7gqBVzIt1XyRe5Nc7hiqQ4u6JczpRjD0WbOvCJOghQVRtI7
         VF+0E6/oYPX71Le2c/GPYKy1MpAiFtqKQsP0YGqZoJ+92onCoBMm/dIrq+uskO6PsVIL
         v1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=wUCm0YHDvCYDpmRLDnHBVbbCEPwJyFjXA8+1aHpeL+o=;
        b=ggRfY/SbFJMJefJBfSHf47pg5jp6BcS5q/AdAjKdMNr2lmEct6ONJK7dUjpvdho0is
         rNB61XE9DHx9JsMrpTqywI4S6EPZ+rxpSnOZze/XWnr6HgWlHDG+zfcMC3WZKOamFD6d
         U2UvRHTuFOWHYHtQRHaU/oTlPEWwc0lLRVK/mQGTTw9T0xnhmvPD3bxqj3X21Mk8DunH
         eEMCEts++cP9b0O87zrEJSKOHXipDchhMj03K6pidbviZt0dHK+Aw3EEiP2JPrv9oozk
         kH2lDhoxJmhfg+B0UwCiC5zYcQw0eLcaIvdUbu1GJj2dcJtq0mdsgJcyPAge4KWbHKo6
         CG9A==
X-Gm-Message-State: AOAM533EtdEjJ85pSWxMUlsy4oNbzYbFCErb7ywdMd1Z217gUwiqLnEI
	OUjCBaWHZUeMLsNSg6+pznHtFA==
X-Google-Smtp-Source: ABdhPJzZ4RLRiI6C1EZH9ZYpBtQQeVUud0yToyB/5r+3PaPsNavxv+x8yaDmDLNZjYowgWVR6pw3bg==
X-Received: by 2002:a05:6a00:2287:b0:518:85ee:9992 with SMTP id f7-20020a056a00228700b0051885ee9992mr2854759pfe.62.1654141963093;
        Wed, 01 Jun 2022 20:52:43 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902c38600b0015e9d4a5d27sm2309986plg.23.2022.06.01.20.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 20:52:42 -0700 (PDT)
Date: Wed, 01 Jun 2022 20:52:42 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 20:52:35 PDT (-0700)
Subject: Re: [PATCH] RISC-V: cpu.c: remove nonexistent ext from cpuinfo
In-Reply-To: <YoSw8lNHJqRDy6lg@Sun>
CC: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: i@zenithal.me, i@zenithal.me, Kito Cheng <kito.cheng@gmail.com>,
  Nelson Chu <nelson.chu@sifive.com>
Message-ID: <mhng-7b349805-02ff-47b3-b9b5-31dcbd2bb256@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_205253_292898_75123618 
X-CRM114-Status: GOOD (  26.39  )
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

On Wed, 18 May 2022 01:40:18 PDT (-0700), i@zenithal.me wrote:
> On Tue, Apr 26, 2022 at 06:08:01AM +0800, Hongren (Zenithal) Zheng wrote:
>> There are no single-letter B/K/J extentions,
>> as they are never ratified. For P, it is still in
>> progress and not ratified.
>>
>> The ordering constraint of these placerholders is now removed
>> from the spec. By commit ("Delete more nonexistent
>> extensions from the naming constraints") of riscv/riscv-isa-manual
>
> Hi, is there any further update on this patch?

IIRC there was some debate as to whether that change constituted an 
incompatible change to the spec, but I guess it's stuck around for long 
enough that maybe we should count on it being canon now?  I added Kito 
and Nelson, there's a GNU toolchain call tomorrow morning so hopefully 
we can remember to talk about it...

>
>>
>> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
>> ---
>>  arch/riscv/kernel/cpu.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index ccb617791e56..53a061ab0743 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -113,10 +113,8 @@ static void print_isa_ext(struct seq_file *f)
>>  /*
>>   * These are the only valid base (single letter) ISA extensions as per the spec.
>>   * It also specifies the canonical order in which it appears in the spec.
>> - * Some of the extension may just be a place holder for now (B, K, P, J).
>> - * This should be updated once corresponding extensions are ratified.
>>   */
>> -static const char base_riscv_exts[13] = "imafdqcbkjpvh";
>> +static const char base_riscv_exts[9] = "imafdqcvh";
>
> The base_riscv_exts "imafdqcvh" is exactly the spec now, as
> https://github.com/riscv/riscv-isa-manual/commit/db7a4a0dad0e99d1ec1fc67b582624fc0aeae98e
> (Add single-letter "H" extension to the table)
> has shown

Oddly enough I stumbled upon that one this morning, it's another one of 
these like the HPM stuff: we used to say "there's no letter describing 
the hypervisor behavior, so it's part of the base" (see the commentary 
on the binutils patch), but now that there's a letter I'm assuming we 
should split that out?

Not clear if the RISC-V folks want H to be ignored by software like 
those other recent changes, and if so it's also not clear that's a good 
idea.

Anyway, sorry this is taking a while but I think it's going to be too 
late for this merge window -- kind of silly for such a small patch, but 
it's got interface implications and it's all a bit of a hot topic right 
now.

>
>>
>>  static void print_isa(struct seq_file *f, const char *isa)
>>  {
>> --
>> 2.35.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
