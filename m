Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F50C47082
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6873861131
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 00:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6873861131
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zqHZWsg+9hkx4steIuHR8/epzFSryYXbh8MNDv9n71Q=; b=WwouC/pA3eYUA4Gu5ULitiCJKI
	5AJIF/KutpftZDifyScmeQ3yOhz0YpXoXgbuMbLv2nvapLeAbuTAPS4A2vrohigF+C4Waf/WTMI0F
	nMVwzkli0g1F1ThuxfkldrZ5fEgkL2GtMsDJvSftKzQqy8qeTs3M2c9vhuJagXqdl04ypvytC83nP
	QooVQFE6QV2g6aHDrpPcaCsyW6oYc/3crp3R3sT5dI1l4dIGa/DheU2wjItFLq1rxCWwarrxzB9aG
	99KYjnokFZ/Po6uyST3o3cGhUNV7r6GVL6QceYq5R7Q6w6LFUBdUqstELb1epw5jDv4c38/96PbCj
	vnBRB9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln9M4-008gKQ-NJ; Sun, 30 May 2021 00:31:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln9M2-008gJd-3q
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 00:30:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 69so3410860plc.5
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 17:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lUMGhkNpzUYJl7mNHm/MIb9alcAEBQViZqKnCFlPkiQ=;
 b=IzBDDXAvaOLrqEa29uJVLU4OPt+UZpVx3SAwSF/lYpM99VEml2Jygyadpibil7SOpC
 ub135CdmEB3N6uDJOho5LxpKnKBmkfc/y4lwV9uMmRI9fPMl5pXy8XCqPAIAvq01vaDz
 /uYn0usaKGewAtoas5Equmd4zE8er4CS4amBxn6G4dtgtNJ1LjdMLwpNbrq8tiqAmi83
 Jv7N33mlpPMHfwpBtMYcrF1Sp8BhdyY0/i0dDfUed/tjzBivauNVZbPv1Iv+QuB9MI3P
 KIclbaOB96QipZnVQ3GkT+OZpx5VmVbi2F3MPuCAK6caVWDcVx2JDLgi0zkX/IFYx9Sj
 ehMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lUMGhkNpzUYJl7mNHm/MIb9alcAEBQViZqKnCFlPkiQ=;
 b=pKe6wRaWtyHajxlnav6G5KA9anW/KBWofpj0ASRAnzdZEK0DkS0xtpT2sWL4AoXazG
 7U1KPQB3yJsyepxsC7WN3vnqroELu1WENp92MBJWWBUjQ3NpDprkWsYI6Ftlf+WH3M1T
 Zd0LLRHhkg7TojIcYXyWV+j3x5YW+nkuGf8v6oDUlZWknnOc7V7ea06pXGVYro3uoxee
 t4sVmyV9JrdYM8QjI6K+b/vn9ZjaKZBgNLbpIHionXi3ZwSzJl5zw3ED+hf1CuxrDIJJ
 LRYDkZc+ro2T+3X2YcSmYBuQvBky+ZAxJcY4i79Ta5dX1p9unk4GMkqrvbX9KMZ7VGgi
 BDSQ==
X-Gm-Message-State: AOAM531esU8tKf+JvJ4xcggk/TveZX3ig3HL2xRY/IQhLJ7NY6qf9dw9
 mzDM1ohKVKoYmZ0WBlZnIZO75g==
X-Google-Smtp-Source: ABdhPJzrK7ewIhdD+iXeUeeT39stH/hdTmeacu5hMJYBb9S+GydnapzD2mWKbjiiY7+PLg6yph1MeQ==
X-Received: by 2002:a17:90b:3e89:: with SMTP id
 rj9mr314786pjb.114.1622334657147; 
 Sat, 29 May 2021 17:30:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 13sm7583786pfz.91.2021.05.29.17.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 17:30:56 -0700 (PDT)
Date: Sat, 29 May 2021 17:30:56 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 17:30:41 PDT (-0700)
Subject: Re: [PATCH] arch: Cleanup unused functions
In-Reply-To: <CAJF2gTTMYi-fr2kz5PHBtZ17iJdq0gN5UWT+eRV7ODwNfUcqrw@mail.gmail.com>
CC: Anup Patel <Anup.Patel@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 guoren@linux.alibaba.com, monstr@monstr.eu
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-fbb37e83-fd8f-406f-b258-1a8e3fbd8591@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_173058_181164_4F1A1D0E 
X-CRM114-Status: GOOD (  21.76  )
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

On Sat, 29 May 2021 17:26:20 PDT (-0700), guoren@kernel.org wrote:
> On Sun, May 30, 2021 at 7:08 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Tue, 25 May 2021 05:20:34 PDT (-0700), guoren@kernel.org wrote:
>> > From: Guo Ren <guoren@linux.alibaba.com>
>> >
>> > These functions haven't been used, so just remove them. The patch
>> > has been tested with riscv, but I only use grep to check the
>> > microblaze's.
>> >
>> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> > Cc: Arnd Bergmann <arnd@arndb.de>
>> > Cc: Michal Simek <monstr@monstr.eu>
>> > Cc: Christoph Hellwig <hch@lst.de>
>> > ---
>> >  arch/microblaze/include/asm/page.h |  3 ---
>> >  arch/riscv/include/asm/page.h      | 10 ----------
>> >  2 files changed, 13 deletions(-)
>> >
>> > diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
>> > index bf681f2..ce55097 100644
>> > --- a/arch/microblaze/include/asm/page.h
>> > +++ b/arch/microblaze/include/asm/page.h
>> > @@ -35,9 +35,6 @@
>> >
>> >  #define ARCH_SLAB_MINALIGN   L1_CACHE_BYTES
>> >
>> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
>> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
>> > -
>> >  /*
>> >   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
>> >   * it is set to the kernel start address (aligned on a page boundary).
>> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
>> > index 6a7761c..a1b888f 100644
>> > --- a/arch/riscv/include/asm/page.h
>> > +++ b/arch/riscv/include/asm/page.h
>> > @@ -37,16 +37,6 @@
>> >
>> >  #ifndef __ASSEMBLY__
>> >
>> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
>> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
>> > -
>> > -/* align addr on a size boundary - adjust address up/down if needed */
>> > -#define _ALIGN_UP(addr, size)        (((addr)+((size)-1))&(~((size)-1)))
>> > -#define _ALIGN_DOWN(addr, size)      ((addr)&(~((size)-1)))
>> > -
>> > -/* align addr on a size boundary - adjust address up if needed */
>> > -#define _ALIGN(addr, size)   _ALIGN_UP(addr, size)
>> > -
>> >  #define clear_page(pgaddr)                   memset((pgaddr), 0, PAGE_SIZE)
>> >  #define copy_page(to, from)                  memcpy((to), (from), PAGE_SIZE)
>>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> It's generally easier if you split this sort of stuff up, as it'll be
>> easier to merge if we don't have to coordinate between the trees.  I'm
>> happy to take this, but I'd prefer an Ack from one of the microblaze
>> folks first.
> Em ... I'll separate it. Thx for reply.

Thanks, I'll drop this and expect a new one to show up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
