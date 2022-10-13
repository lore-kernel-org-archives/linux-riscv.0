Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93391C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9efC1KzEKkC0nP18P5dTNbbfAEB9BXrUPRs8Lx/hKEo=; b=podDC/lzpEjFBMmdloHShChK0N
	SWVEoqpraL4qYRrVteigxx7RUlhbW6LKAgni7VCclYwoYisMxaIJ/sfuiUnfRMuRw0LZ1ruz436NR
	0/W5fsTl8mPi/F9XcVsMY3RpRKvZAipaL4zO4s8QrdpaLIq+s7LLEV5b06fbarS2IzlHUKNBebBXi
	8GjdsUhHPBx3tRVv/AyIUVGfsa69UeYq1gT7jVe5Rcs+diGXhu3SpTxuOyoGt5VL10fXskcucwFD4
	H7w/nuZl+/xNXmq9+Y5Dp8wZ6gl0ye0oJ4OmxYkSjiPQkZ/jH5T7PRlIAYZne0aYnFnmx2xeMzXyz
	XEKCR5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGf-00Ad6t-QD; Thu, 13 Oct 2022 04:56:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGY-00Ad1A-EP
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id fw14so939099pjb.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXrbEJgJQgUBGs9Wp9XyjplFrW9QFFILkC7/GE5/QEs=;
        b=3jlmYP9Xz49++kB0+g0PqTOiJKelBadtnkyUCVMPALsB5aQH+whUBAHubWIiLD/a1n
         Gt/rvonr8pqU8N06HeosOYw2QGdz4uIKB52vye+2wmuJAsDojrLXpOszmfdmXUcJOXpM
         AuYD4Utvca7Z/UuI0bY76bM9agL0wBt/Rtriybjel8QQPaLJzIZsbz6Zj+yjAqRyyHKp
         BZYsjWX+I5WUW1T0a41KI7ZfQW8GDCG3r4lZ1VHiuIgrSuzw41BBDfKJ5kXqU+QSZBH+
         qkATuWLXHj1B88DymiKDMk+qMFGMeAnqlgwh59SEz1IWlz+NTWO5y5ElV5rNyB0KQ/AS
         1Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXrbEJgJQgUBGs9Wp9XyjplFrW9QFFILkC7/GE5/QEs=;
        b=Oo8LX59DCc7vDkVSYRf4YrdaHYYeuK5qZ523IyOo4VWrTSY8XSEuHYhWt7GF2KQdQG
         l1Tyk96OalIZP8ol7nY+WXfkqQGxfoU6x95cWiOxshh1lW/GSd/4Bc1GGHoPu0ZL22TJ
         SZf831EXmNGekKvhgfioF50m0t4YquUHm/A8JdruzrCmcFTTVNt6NFvkOLi8YNMN+Ejv
         BLd1jitOI4GvAXmNYMrv2FjtTCv/lm/1TSAEo/HSsOVmXxxYoYfS81HoM43ajYMo/u/k
         Jwak68di+0Be5Zcz/mzKBoTdxEyLL+GGYpG3UxdINc5K460rcHRc0dx0Mm4xl8jXGVFw
         hD6g==
X-Gm-Message-State: ACrzQf2i89Vjt2MEZxZEg/6GrH5O7thvcHFUxldSwcctc2py/7f69An+
	damu4HLtxd47EfkvVEH4+03wL0Czynhirw==
X-Google-Smtp-Source: AMsMyM6VndR2w4IYrSD8acPyD57UhFc7XIoaBbe5WjUah7MsOvQiljtQLqOlPHT30NX/fBi1Q4JcMQ==
X-Received: by 2002:a17:902:f647:b0:183:cb8d:40a0 with SMTP id m7-20020a170902f64700b00183cb8d40a0mr11558234plg.18.1665636976701;
        Wed, 12 Oct 2022 21:56:16 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x27-20020aa7941b000000b00561ed54aa53sm819431pfo.97.2022.10.12.21.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:16 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:56:16 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 21:47:25 PDT (-0700)
Subject: Re: [PATCH 2/3] Documentation: RISC-V: Allow patches for non-standard behavior
In-Reply-To: <Yyn2Icf0GoDdtW1n@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-495b30ee-2582-4a0b-81a0-5bd21e04be6d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215618_750713_08D8499F 
X-CRM114-Status: GOOD (  40.29  )
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

On Tue, 20 Sep 2022 10:19:29 PDT (-0700), Conor Dooley wrote:
> On Tue, Sep 20, 2022 at 07:01:39AM -0700, Palmer Dabbelt wrote:
>> The patch acceptance policy forbids accepting support for non-standard
>> behavior.  This policy was written in order to both steer implementors
>> towards the standards and to avoid
>
> Commit message is cut off here.

Oops, I'll fix it in the v2.

>> So let's just start taking code for vendor-defined extensions.
>
> :)
>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> This was discussed at Plumbers, but as with any policy change it's
>> important to make sure everyone has time to chime in.  I intend on
>> letting this sit on the lists for a bit to make sure everyone has a
>> chance to comment, but in practice we're already regularly violating
>> these policies so I'm going to just keep going with the status-quo in
>> the meantime.
>>
>> I'm also still not quite sure how to write down the hardware
>> requirement: the intent is to make this more or less in line with other
>> kernel policies, with the added wrinkle that RISC-V is a bit more
>> distributed than other systems and thus has more core functionality that
>> is vendor-defined.  Hence the need to allow some code to go in earlier
>> than a requirement for publicly-available hardware would allow.
>> ---
>>  Documentation/riscv/patch-acceptance.rst | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
>> index 5da6f9b273d6..8087718556da 100644
>> --- a/Documentation/riscv/patch-acceptance.rst
>> +++ b/Documentation/riscv/patch-acceptance.rst
>> @@ -30,6 +30,10 @@ to go through any review or ratification process by the RISC-V
>>  Foundation.  To avoid the maintenance complexity and potential
>>  performance impact of adding kernel code for implementor-specific
>>  RISC-V extensions, we'll only accept patches for extensions that
>
>> +have been officially frozen or ratified by the RISC-V Foundation, or
>> +for extensions that have been implemented in hardware that is either
>> +widely available or for which a timeline for availability has been
>> +made public.  Hardware that does not meet its published timelines may
>> +have support removed.  (Implementors, may, of course, maintain their
>> +own Linux kernel trees containing code for any custom extensions that
>> +they wish.)
>
> As you know, I was there so I don't disagree with the sentiment of the
> changes & as an employee of a vendor who wants to use a non-standard
> extension I welcome the change.
>
> Only comment I have is that the sentence has gotta kinda long. How about
> a rephrasing/reworking to something like:
> ---8<---
> To avoid the maintenance complexity and potential
> performance impact of adding kernel code for implementor-specific
> RISC-V extensions, we'll only accept patches for extensions that
> either:
>
> - have been officially frozen or ratified by the RISC-V Foundation
> - have been implemented in hardare that is publically available or has
>   a timeline for availability that has been made public
>
> Hardware that does not meet its published timelines may have support
> removed. Implementers, may, of course, maintai their own Linux kernel
> trees containing code for any custom extensions that they wish.
> ---8<---
> I think breaking it up like that highlights the two distinct cases, but
> maybe that's just me.

Seems reasonable, I'm just going to go with roughly that for the v2.

> The o spelling of implementer is in here too.
> Again, am I missing some American English thing there?
>
> I think the bit about the hardware is fair too. Gets the point across
> and if someone's timelines slip all they have to do is publish the new
> timelines...

Ya, that's the idea: we sort of just need to know this stuff is actually 
alive, if there's hardware that's easy but if not then at least getting 
an Ack that there's still some plans for it to show up helps.

> Since my only comments were stylistic (modulo the potentially existing
> spelling mistake) this looks good to me on an idealogical/policy level:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

OK.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
