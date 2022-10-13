Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F2C4321E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=9jHqWYuWclgSNXfRl9x7ET9cTsikGSF4IUotGmTskdY=; b=GFnl62wvSZ0COv6Fd5+5y7tTBW
	5flUColQJ+aLyOFNmVevrdMKKpLqjlsLI7j+DVFls61RAKZYiXC4UCAcR0ozcda3mCEFcHuAtteok
	faCYFOIQ3lsP8XAzjGOgNb6Xqq5dI7bk+tg6JVPVGoROc9uQmEHVBWGBqOGhBx3XQpIlHo1EEFUsf
	qQcyrPmpRlrjbQN64ro0sgiOyJ7HEoYsFjt8XN6DGsZQGiz+kV6e0mxe66kAJ9JgPTdMO9IZ65Nrn
	bU+DqYs7Zz4aVIQXn+0q/LUSsihUO+65PksQK08JbpypNTOHPPRgLSUEnRbK6BuEisg4nK0ax29jX
	r4CpObpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGj-00Ad8h-0X; Thu, 13 Oct 2022 04:56:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGa-00Ad2L-SL
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id c20so822084plc.5
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjVHm38TkoPaPRn9bdA0LI/CRhXB+NuFLF7t8WNluEY=;
        b=Ln9VR56tnnEzs8M7+4kKQan13gLkJ6B3gdwBFkp8qUuc8xH+0qk8cPaHi2oved0QBh
         FQGkKEhiNKMU4r7G3yfVaC3hEVxmhQWypvkpeJW4SLaMcADFgKfmFTZ+pw9mKAWWdOQp
         B+izn6YrnRpEdep2jOSzV7wvu/Xkg4kznsDEyWBSTIUVanqdiWD0CHfzb7oGE6pxwVQx
         NzMr5XpHKEh6Ui5CjafnE/40PXHzopM75EdjPzyUfs1mOPZrgFkN7W84Qgrw6gEljl4D
         EIvVTS04WIGALDiQeyFSMTk6fyp+SCuiLY+xjjGijmFE8yYe0mE6d8AAYHZdzFzTRv6M
         PBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjVHm38TkoPaPRn9bdA0LI/CRhXB+NuFLF7t8WNluEY=;
        b=D5heWiN5PpK0vWRojWqweMCFrGUsAqDsb2zJD4JofmtyzIwT92Q5z2Tg9baFk/gONX
         jbNui+lat0BZk4xU3457vc7fCKbSLrjjARmqNawuhTXUOJiEFh1ubHoU01s187aQj4yp
         H4XscCZHtIggInQZ5oNeiK+V4x1x2f2LRwAMrywQr0PeripNbCtSlInS/gQAwED6YXMB
         l4lQIsiWFMPZUsocROdlA/RVom5ivmQrkfgd8Q/da3c9fZMj7LrJEEsX7RgiY4fBlRWr
         YJz3ewd8Vuk4De377YHGxfylujmNw6e9BIxjvZ3CURar477rcxG4Q+BVhV6LKBjcO1jB
         WcnA==
X-Gm-Message-State: ACrzQf23P7BRhe+Aw2Rn8KND6OVGwm25Z3lmbuNOlZDu0BwaeAlnyVJ9
	wl/7x8fDPfcWl73ewFRKGniSTC9sCGQR1Q==
X-Google-Smtp-Source: AMsMyM4mu89yHwGHMLz5APKBAxEqiY1GP7eeIv/xAG70DkI1UxJsL4IIk/QRQxm7nTKd7TqVG3Yv4w==
X-Received: by 2002:a17:902:d14d:b0:185:31b5:808f with SMTP id t13-20020a170902d14d00b0018531b5808fmr1789780plt.36.1665636979159;
        Wed, 12 Oct 2022 21:56:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902a38900b0017f9db0236asm11508115pla.82.2022.10.12.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:18 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:56:18 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 21:51:45 PDT (-0700)
Subject: Re: [PATCH 3/3] Documentation: RISC-V: Mention the UEFI Standards
In-Reply-To: <CAOnJCUJW2Zp22b7=hwUaevp1fiB1t5Xiz1La5C5yp9yxmOWQUA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: atishp@atishpatra.org
Message-ID: <mhng-944841f3-7a9f-44e1-ad79-c502cebd8d27@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215620_945915_727F128A 
X-CRM114-Status: GOOD (  22.35  )
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

On Mon, 26 Sep 2022 10:34:07 PDT (-0700), atishp@atishpatra.org wrote:
> On Tue, Sep 20, 2022 at 7:31 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The current patch acceptance policy requires that specifications are
>> approved by the RISC-V foundation, but we rely on external
>> specifications as well.  This explicitly calls out the UEFI
>> specifications that we're starting to depend on.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> This also came up during the Plumbers BoF.  The other discussed options
>> were to wait for an ACPI/UEFI specification to be published or to just
>> not wait at all, but this middle ground matches how we handle the RISC-V
>> specifications and it seems like there was broad agreement on it.
>>
>> As usual with policy stuff I'll wait a bit for others to have a chance
>> to chime in, but I think the wording on this one is at least easier to
>> reason about than some of the others.
>> ---
>>  Documentation/riscv/patch-acceptance.rst | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
>> index 8087718556da..08cb92324eaf 100644
>> --- a/Documentation/riscv/patch-acceptance.rst
>> +++ b/Documentation/riscv/patch-acceptance.rst
>> @@ -20,9 +20,11 @@ Submit Checklist Addendum
>>  -------------------------
>>  We'll only accept patches for new modules or extensions if the
>>  specifications for those modules or extensions are listed as being
>> -"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
>> -course, maintain their own Linux kernel trees that contain code for
>> -any draft extensions that they wish.)
>> +unlikely to make incompatible changes in the future.  For
>> +specifications from the RISC-V foundation this means "Frozen" or
>> +"Ratified", for the UEFI specifications this means a published ECR.
>
> It would be good to explicitly mention "UEFI forum specifications"
> or
> UEFI/ACPI specifications.

Ya, "UEFI" is definately wrong.  I went with "UEFI forum 
specifications", I think that's likely the most accurate.

>
>> +(Developers may, of course, maintain their own Linux kernel trees that
>> +contain code for any draft extensions that they wish.)
>>
>>  Additionally, the RISC-V specification allows implementors to create
>>  their own custom extensions.  These custom extensions aren't required
>> --
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Other than that, LGTM
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
