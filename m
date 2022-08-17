Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEAAC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NofP2my8+s4BazNEHSE1c+VZumnZHruLK5dD7ZLd/iU=; b=X3bIAina36F9xu
	jBGOwWvLVVI85TdKX3Quihk3ng2Xcpxj8Lgo/urzjkEa5be3opddZlxy9oRlzmJeOCwwjTnsV/D5+
	GBjctAEntvlXakcsigA7k+WdQikKfUBmlyRLxfcxctHcZpOElBdCpG3GeSp1f0cUAZVKo7LAsk/RA
	VUyIgGMcMNNxVYMQUgSjJJ6kS6kZ72oPGEbyjUwqThvo6vo3IBdF9NEUpRjfxyXwHJ2tZ56Hc7e7R
	higkvh96Ttx+Is8NWURH/y84PHE7AsxqRWApep1AzKlVBhoj4OiWY0/9Xu+YyklmwXJgCjWK7qgKn
	o0VJHFVQHyoOpVUUGLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOL1Y-003Ikc-8h; Wed, 17 Aug 2022 15:32:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOL1U-003Idu-Nr
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 15:32:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id k26so25184605ejx.5
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=a/PIyfsanhuZllpPivL8Bh2mQBuFyAwgudcPaKdSSHQ=;
        b=Y3aPmPl8Gl6Ticd5n+ONhVYew/dhHhrWtA9QzSdIK2WfxGUQcV+aTEE5sBioizif58
         OMIiUU2yFGe+LN9MNuo6NvHBMzw6a1w1uAUbDruLKacHo5ZwTMXNuD5lIKa0EX0HsCjm
         nY/m5XdLBg0kQmNnRLGHYHl4hEV3XqzIMyb6y1aSac9kD1+uMVmyUXmTExjLMqfpt1WZ
         TdtVqqeYVi0rxxTde2WbCPYcQVAOLu/KA3ft8im+QLVC2HK8rz5uj/KkRRC3oPvIGVJY
         UbzT8TBpVh9yfFxFH/wE81VFXr+d0wzfOSZXH4sQVceJdWaPnM4U1Msj1qWMfcLSuyAd
         S2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=a/PIyfsanhuZllpPivL8Bh2mQBuFyAwgudcPaKdSSHQ=;
        b=x5fEtwxNLqrJiy1RKY62g73fitUz7LsC6zdZcpksvWFZsBCUKgZ/4WM542VfI/KEIU
         u8YUOMfRdUD7EmRVetxXpcBNZmB0OS16sq/czKd0xKuY4Ci125Jcw8YtjWlk8WoJHLF5
         BNDpp/weJvi8VWWuvaiZGIBETpt2EwuupDE75Bs+10xMIrS2xBqGMOZCt1l/rZmRdJOj
         4wFaiH0/bnamzEvgLePvW6V0SIEDe7wuFsA5lM1JEYE1WRxyYwT6cNlvgSgcrFhfVjS2
         FcI6Nc4WnWyX9nHNm+SA2YwihncmTZu+aAyqQVcu43zHWBJ6EpHgAZrb0KkYzMT3yU1m
         3GpA==
X-Gm-Message-State: ACgBeo31vkckRRSLzM6dw9nvxdLyqBzFMcIR38wB6uR9MWgFBDzI7MRa
	vBdBgEonWzujM5RbWQzy+ZlruQ==
X-Google-Smtp-Source: AA6agR5EXt7m0iYui0lTtqSryBN00lK2V0UI74nd+7U7PhHJGidvWTUIyrw9wqSAXWbqjfZ9oT/8aQ==
X-Received: by 2002:a17:907:7e9f:b0:730:d954:c2b5 with SMTP id qb31-20020a1709077e9f00b00730d954c2b5mr16466931ejc.311.1660750312930;
        Wed, 17 Aug 2022 08:31:52 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id fn3-20020a1709069d0300b0072fb3704e49sm6892820ejc.46.2022.08.17.08.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 08:31:52 -0700 (PDT)
Date: Wed, 17 Aug 2022 17:31:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, atishp@atishpatra.org,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, daolu@rivosinc.com,
	Conor.Dooley@microchip.com, re@w6rz.net, apatel@ventanamicro.com
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
Message-ID: <20220817153150.fvht2isdiqjpk3my@kamzik>
References: <CAOnJCU+Gx44ESHWyku7Kb6u5QnzjXiZcat5XmVWjksdFpcQ6nA@mail.gmail.com>
 <mhng-dd00cb27-4162-48aa-834d-30fb90e194cf@palmer-mbp2014>
 <Yvz7byY9F0ow1bgf@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yvz7byY9F0ow1bgf@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_083200_788855_95439CA2 
X-CRM114-Status: GOOD (  29.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 17, 2022 at 10:30:07PM +0800, Jisheng Zhang wrote:
> On Tue, Aug 16, 2022 at 09:29:36PM -0700, Palmer Dabbelt wrote:
> > On Tue, 16 Aug 2022 16:41:46 PDT (-0700), atishp@atishpatra.org wrote:
> > > On Tue, Aug 16, 2022 at 9:31 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > 
> > > > riscv_isa_ext_keys[] is an array of static keys used in the unified
> > > > ISA extension framework. The keys added to this array may be used
> > > > anywhere, including in modules. Ensure the keys remain writable by
> > > > placing them in the data section.
> > > > 
> > > > The need to change riscv_isa_ext_keys[]'s section was found when the
> > > > kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
> > > > add Zihintpause support") adds a static branch check for a newly
> > > > added isa-ext key to cpu_relax(), which kvm uses.
> > >> > > 
> > > > Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > > ---
> > > >  arch/riscv/kernel/cpufeature.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index 553d755483ed..3b5583db9d80 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
> > > >  /* Host ISA bitmap */
> > > >  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > > > 
> > > > -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > > > +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> > > >  EXPORT_SYMBOL(riscv_isa_ext_keys);
> > > > 
> > > >  /**
> > > > --
> > > > 2.37.1
> > > > 
> > > > 
> > > > --
> > > > kvm-riscv mailing list
> > > > kvm-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> > > 
> > > Thanks for the quick fix. Tested with kvm guests booting in Qemu.
> > > 
> > > Tested-by: Atish Patra <atishp@rivosinc.com>
> 
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Thanks for catching the bug in my code.
> 
> > 
> > Thanks, I hadn't realized how static keys work but looks like having them as
> > __ro_after_init was always bogus.  Sorry to break stuff, looks like I should be
> 
> Sorry for breaking the static isa extension key usage in modules.
> It's a good idea to make them readonly, but need to cope with the usage
> in module properly. This may be a good improvement item.

While some static keys do use __ro_after_init, they're almost all locally
defined (static __ro_after_init). I see a few instances of __read_mostly
global static key definitions, though. That may make sense for
riscv_isa_ext_keys[] as well.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
