Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCAEC77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uUnt51TrcRbLNi+6YZR4PLNblJrD6Bjp8fgusNCaBlM=; b=01iawVYqSTAK2DsbOc10BiKLh2
	eaeEz/aF820DgtPZ2VqcYXTXd4S+FAo/Z8Fl5cJ8QtPdAKKZivWj1S9/yXe2azVh7HvCupja4NBsy
	17Up8e7wC1uPCezVc0utcUYvK7hD17tpwD2I780/O2FGeystWe23UCXrgVJP+qX8Mw/0DsZUA9WyY
	nAPuqoIfaF+nRxNAOAuCY+ksMoV2wwQH6xKspmjSA6IBD/V6mE7CoUBZmkGXllwGbKU3jo6YLbIr/
	cul7fEXtZnLd5T3SDUNOALGsNXqVzsKZtrgqfW87jeFwd+DmFTw/oDxuvdmg1thvGyzLRey4VspxS
	0xu6Dcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgA2-004Cz5-2y;
	Wed, 26 Apr 2023 14:30:22 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prg9z-004Cwv-3C
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:30:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a69f686345so56725255ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682519417; x=1685111417;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wSK8TbXG/D57t5FR6NzDPZIasD2O4lYbvKihJBPvU8=;
        b=s9Teh+sZjLWfqdiD6ZTZnd6LVSgj88Y9ZrC0GvXtRUCi2L4nGDIW23V1ooSbAOZdqB
         Q78YwKP314TOWyV7pYcgpVNwSqnF3siF7d0dKNqVdZ/AbpBfSyLUUhSAZnTjWxZ9MtqM
         srbn9oKNlVlzYcYfN4KaG2e1GKRCBpmcm6cQ2Bu/kgNTPHXTUIcgXAVAePXZFJgjRQbG
         doo9L7jSBcZHPVHj5ffGCyrlnzehe6LoqjvpohcQ5BZSpitr029CQ/J2Zvs5Q2+DEu/I
         Qa8B9ySo6Azzbpgmgt4Eq2mgJFz3cZJG6jOjmMI5w9C7eroorBW83Xpcti8uRmjje3/N
         9bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519417; x=1685111417;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wSK8TbXG/D57t5FR6NzDPZIasD2O4lYbvKihJBPvU8=;
        b=bwtcZ/p0G/CMOGHec78u0PJJOWP2m6C0lo4RhdLfPHr8t97dCXSnNfYie4fX+G10M8
         jl9ygKTY7yZ0r0PHA+DwjHRpe8PJ4jrjTxJgERUyNNbNVqJr20jvDUT8jUvhKhde9D/D
         JDiyr76WssWc5BSh9cW6D/R1cGtoB1RUkEjTBsd+MTxVzhECNXgJD+ax3OsVlXD9kjsk
         jUvNKdjRnlkBP7QhCIQGy5HqU+XSzRweMST2eHvEQq0Ts2QzmNQVbdQ+qmHtvVQ5pxNQ
         ihWHUkUQOCs+Zp+Cxhls+bvOdRU/oFUO5mMzXluMpV+y7Keg7Tgln0Ne92isDJfPVrl7
         5rvw==
X-Gm-Message-State: AAQBX9fZr+HPRLla60twL0ZaX1NttJstJ/c+2z/ohBeIwuxalz6a+4Ao
	J9fM9OHIgNLWarmcfcyvI/cb00/nsVv3gOJh2oU=
X-Google-Smtp-Source: AKy350ZudvAt+f2Ag8RAzsSUTJHDK0TPS7JYyzwc1yLSgSG+PezWLhWivD1IQ5LUF5DC4t3a2LLa/w==
X-Received: by 2002:a17:902:e80a:b0:1a8:32e:3256 with SMTP id u10-20020a170902e80a00b001a8032e3256mr26229422plg.35.1682519416796;
        Wed, 26 Apr 2023 07:30:16 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001a92aa516basm10075468plg.210.2023.04.26.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:30:16 -0700 (PDT)
Date: Wed, 26 Apr 2023 07:30:16 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 07:30:09 PDT (-0700)
Subject: Re: [PATCH RESEND] dt-bindings: riscv: add sv57 mmu-type
In-Reply-To: <168244896648.2081233.16478595076932550051.robh@kernel.org>
CC: Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-3f7fe3ac-fda9-4adb-bf63-7f6fb1715a60@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_073020_028380_7383527C 
X-CRM114-Status: GOOD (  14.46  )
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

On Tue, 25 Apr 2023 11:56:06 PDT (-0700), robh@kernel.org wrote:
>
> On Mon, 24 Apr 2023 18:05:43 +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Dumping the dtb from new versions of QEMU warns that sv57 is an
>> undocumented mmu-type. The kernel has supported sv57 for about a year,
>> so bring it into the fold.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Resending with the missing CCs.
>> Palmer, you can take this for 6.4 if you want, otherwise I'll grab it
>> after the merge window. I doubt there's a rush when it's been missing
>> for a year or so.
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>
> Acked-by: Rob Herring <robh@kernel.org>

Sorry for missing thist the first time around, I just picked it up.  
It's in staging, barring any breakages it'll end up on for-next soon.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
