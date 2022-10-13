Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6966DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hDKEtsyE7CW3aDW6r8JE2+UWD5v3vKl76OQImVT12bc=; b=InuoK8A4hu/iSr14tr3rCKPfh5
	KIbDzkDbKal0sbuSmz6tTvByPHct6mIKxHh3KCUKurQl34jNNanG+B2ED0MGMEnvwNqqRqznl8LBV
	WYHml3f/USZnmjdvsAPH3Qx2NjujESI189xL6NKVzeUFXYlUJ0gfOW7Gpx0grjjcQovyD6qDvUNhA
	xMn9CrK44OmpZNY52726Xyn88mPlhk9rER0CoEZqvZB7LrBytJ+b/a5yRnE1/c5f/7RmT9tEoqx9M
	bqm7Bc6PNze0xWG2cgQIyZWaisrbjBJW3i+INM64kh7lPuw8t+Wk/dLGqRSDb0O+PFWyXjnx8qcVM
	qKgGTfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGh-00Ad8D-Bv; Thu, 13 Oct 2022 04:56:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGZ-00Ad1Y-Nw
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:21 +0000
Received: by mail-pf1-x42b.google.com with SMTP id g28so935169pfk.8
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXqttT/ZuhSt2Fb3VHqxuOJJ42LM4Kp3Ct1HLmlYiWs=;
        b=LAKUTGJ8WXq7AwkpubNT4aNX7LsvimPv4O8VSszKONxNshl8gZDg5vQ+y7SUTDBL2J
         0I93QMDHpx8Thjhuuo0tywG6oiDPzx+bfbtIsc8k4ogzX0OLQo3Z+O0F3VXohN1a3X7M
         DBmyfutzkJRIIWicABQoddZcj37aLAgD0WsgB1M4Uezpb99D/7KCKP29bEhd7msWZe/G
         atlAlJvA50gLYdbzlTgAY+yeOXTysg7I0yyrFIsHMqDoahfHInW89KiU3P08Nn2zdxg7
         7qXOoVoGZ4/gvUDnSy+YmqE+78Hi9dDxT4TFfxcUDv99E+ioiwd/pkhXtlcbeSBZnGcd
         htDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXqttT/ZuhSt2Fb3VHqxuOJJ42LM4Kp3Ct1HLmlYiWs=;
        b=GM5Jz8UgFg6lxSlsWfO+W0/NZy6BHM764jy9uAID3HpO2Rem4Vk8a4020SVlGTm/Lj
         Z/A+ZTisj7YXDVC7yzug45Hvwu7/F9jbzS8XvpEddfC6s3XJX72vMI/VO1+VtwkGayRz
         4vGWvRIeR5P3/MUyD1P72DU7GxN1OidlNp9j56snMZU6Xt4bO/FCV9WSK7IGZZ8vL+Zb
         pcW0oCeBil7JKt4+6JyW2n3R0lelf+CyW1lQQ0JfxYbrUxxtR2P2Q6dgiTpGt8Cp0xx0
         RIaLFfnvscvNZ+Ofgoq+YGb3Vjr0TnFGnZxxUGtNWRgnwZYbT0FX6NSdif88QYm3aNlv
         5zNA==
X-Gm-Message-State: ACrzQf2Eoq4tpRRG6s1nFskGj2pxzhzk4VwJGAtud8EkJE0vBaougJgC
	3ti7aezl9r5vjiqR1zbJG0AkjbcniWCkWw==
X-Google-Smtp-Source: AMsMyM5UO3W1Y3svHcfPvJhPrKfORdOxrpDaHhbCr+yQEwvLmYFayvUsNh8tcGGaGcsdmCA50QZEAQ==
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id s133-20020a632c8b000000b0041c5f9ea1d6mr28302789pgs.601.1665636977955;
        Wed, 12 Oct 2022 21:56:17 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z9-20020a170903018900b0016c9e5f290esm2051181plg.10.2022.10.12.21.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:17 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:56:17 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 21:50:40 PDT (-0700)
Subject: Re: [PATCH 3/3] Documentation: RISC-V: Mention the UEFI Standards
In-Reply-To: <Yyn9FJ4iuzJTfO1T@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-3af24d22-2535-459c-8c54-3855e65ff810@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215619_892691_D6592DB3 
X-CRM114-Status: GOOD (  23.75  )
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

On Tue, 20 Sep 2022 10:49:08 PDT (-0700), Conor Dooley wrote:
> On Tue, Sep 20, 2022 at 07:01:41AM -0700, Palmer Dabbelt wrote:
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
>
>> +unlikely to make incompatible changes in the future.  For
>
> Nit, but the wording here is awkward since it sounds like the module or
> extension is the "actor". How about:
> s/make incompatible changes/be incompatibly changed/

Makes sense, it's in the v2.

>> +specifications from the RISC-V foundation this means "Frozen" or
>> +"Ratified", for the UEFI specifications this means a published ECR.
>> +(Developers may, of course, maintain their own Linux kernel trees that
>> +contain code for any draft extensions that they wish.)
>
> Could we just drop the brackets from this sentence?

IMO we should keep it, there was some confusion about how kernel trees 
work when we were at Plumbers.

>
> Either way, policy wise/idealogically this again looks good to me, so
> with or without the wording changed:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
>>  Additionally, the RISC-V specification allows implementors to create
>>  their own custom extensions.  These custom extensions aren't required
>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
