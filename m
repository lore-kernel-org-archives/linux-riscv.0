Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76905C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1AE64F6A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D1AE64F6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=nUEmDdfwjI66cFc95QKorOzFMAoFSSHSS2BVNKWiDNc=; b=xyiNDsfGeqfrji3Dhcxaipt9L
	8ViHs0etfW5M8RiHxhJpbiZAs8PO3o3qkpnulzMcEePEuWhTb7CYBP/uvpiP+flnFniFntSk3MUHJ
	3r/8WSs4FWhjGDE1Yi6OkC9u+bzWIHVxgpci1wLYfk6fNuSYYNUyWS15zTq4CIkAF2QdC0wE1kVDd
	A7Q/rjLd1dw8J8ANNEnefN3Lns8cWEkJCziAinF7J8IlRL+zVdup2AHwcvg3so7MiNCxXAbWMkcwu
	7lBInXPWqHvO19Tf/AvuOZfFKYr0tvAYgVLZMG6o69tMh06up0mLzLC88jIOjgOyt0ZeGcAP5HaSp
	R7WsPsSUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l780a-0005SQ-2s; Wed, 03 Feb 2021 02:35:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l780V-0005QI-6r
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 02:35:04 +0000
Received: by mail-pg1-x52d.google.com with SMTP id c132so16273429pga.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 18:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fPQam4ndzft14C3DaSgN+91Ad7etOKCRLDjQjoeYJK8=;
 b=OTXg56iU1hkJ7HWuwulOElr299NtTWhlmzuxg05V7A+0w9gy8hR5UaKR/v+7dxkzjj
 +TleqnWVmTiaDeY9JuD5IfUYvbyG/Ijc6FxxDsalbeVNUtGy7JKzklUDbrkTHBS7dO+2
 We92Bw15uhSbI6UCreDJlwayqFGKbdYK4ggQrMcjTp7cr4WrZPmlD8DL3UaE+XD7bxHj
 irMFvCkINaLRA9hGsnQaV7h/Yr2C4o60VppLExRZ5ZvJxPSrJYXv7K513Vjy0cMP/KqI
 mSKetFvsNlk1fyBGXuYXphyzzrAwI8Jk3oVo+3YsvxNRHCJPKcjv6+ijPGEFHsqDE77j
 LVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fPQam4ndzft14C3DaSgN+91Ad7etOKCRLDjQjoeYJK8=;
 b=FEsuWqn2ewmPhIiCCzi+shZBi/IWfoT7WrkX9ANceJ51EnXt1X/DUrQRzTICjsbh+k
 omBC8x3H7hvXAJaJ6fUYlu2DG76P2gyHEZ1Mww7eEZiaa8knceKmIhl6yhuN9A18mQfV
 5nLj9544b2H8WTmq0489fG/7lY7AS2YzhVsMS1ayPbQz/bRRZ5HceKshFFHiSTgSV69I
 q3Aii1SezXs7z5CGf0Wts+cdkKPhx+w4y9j8DN8uFRDK1S9k1TKhiCaxGy56AO2mr7os
 QX+Dj1+zZcOdDL4v7tadQDEVx+AGME60yZU1KKzT63T01LRmHN/SnCWhNTy31xXj4XZ0
 s4YA==
X-Gm-Message-State: AOAM5314kqyyzm/fbBioY4t/d6ctbwa3YnQ2O3bo1hr5bx5J8z5kBwS0
 j5K1uk0dMU2np44pAKdzhxDivQ==
X-Google-Smtp-Source: ABdhPJwwzoE5DQ65GzSvq8HYxGVwxgvuO0KnV/mVnlwlTP9TGyTJNOVC4wrBFr+Is9GPBJsZDCBQVg==
X-Received: by 2002:aa7:9402:0:b029:1c5:4e3e:11ad with SMTP id
 x2-20020aa794020000b02901c54e3e11admr965443pfo.15.1612319701181; 
 Tue, 02 Feb 2021 18:35:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t206sm275715pgb.84.2021.02.02.18.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:35:00 -0800 (PST)
Date: Tue, 02 Feb 2021 18:35:00 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:34:49 PST (-0800)
Subject: Re: Kconfig-induced build errors: CONFIG_PAGE_OFFSET
In-Reply-To: <mhng-9b4a74fd-62d8-421f-8150-9147da7e39b2@penguin>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-c04f6080-f52b-441b-a4ef-65c4559046f7@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_213503_259487_49191650 
X-CRM114-Status: GOOD (  18.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 geert@linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Feb 2021 18:27:42 PST (-0800), Palmer Dabbelt wrote:
> On Fri, 29 Jan 2021 05:52:51 PST (-0800), geert@linux-m68k.org wrote:
>> Hi Atish,
>>
>> On Thu, Jan 28, 2021 at 9:09 PM Atish Patra <atishp@atishpatra.org> wrote:
>>> On Wed, Jan 27, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>> > I took a riscv-32 .config from kernel test robot (it was for a clang build)
>>> > and did a "make olddefconfig" (using gcc tools) and got build errors
>>> > due to this config item from arch/riscv/Kconfig;
>>> >
>>> >
>>> > config PAGE_OFFSET
>>> >         hex
>>> >         default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
>>> >         default 0x80000000 if 64BIT && !MMU
>>> >         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>>> >         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>>> >
>>> > PAGE_OFFSET is undefined for the case of 32BIT && MAXPHYSMEM_2GB.
>>>
>>> Because, RV32 doesn't support 2GB physical memory yet.
>>>
>>> The compilation errors can be fixed by not allowing MAXPHYSMEM_2GB for RV32 and
>>> MAXPHYSMEM_1GB for RV64. How about this ?
>>>
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -253,8 +253,10 @@ choice
>>>         default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
>>>
>>>         config MAXPHYSMEM_1GB
>>> +               depends on 32BIT
>>>                 bool "1GiB"
>>>         config MAXPHYSMEM_2GB
>>> +               depends on 64BIT && CMODEL_MEDLOW
>>>                 bool "2GiB"
>>>         config MAXPHYSMEM_128GB
>>>                 depends on 64BIT && CMODEL_MEDANY
>>
>> Thanks, works fine on litex-vexriscv.
>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Atish: did I miss an actual patch?  I just see diff here.

Never mind, I found it.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
