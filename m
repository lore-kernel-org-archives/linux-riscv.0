Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB093C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 21:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SgznAOVDL1lwEw2meLDG8rH2kwQ+fHPXUKFaVEELlT4=; b=yzMQhkBA20MIBKLT/eZYIrMbCw
	Se82ZPP7f7Ka140XmCAUZRswCUxb9ylou6dr45eh2edZR1CtAbkqiDHUWYbGqnNgz2u0EX0/JXLhL
	GE54itsXaAqVFmmAM/VzIf/jJdc5tvWFjDH0SD6g0OGtySTkv85f5tScKyLUeRIEXZkwaUz9b8b2a
	pXzRsVt/GDyRM/oBGMoKulsjCKKyg+T/Jp7dxBqPoYRyAJZt8mekIip6HCFXLv0c5G/sHFE4B+X6k
	ghtB31Zcw3/y9dFuNPyOGhet67/0i4kdgeEPDPkiiVO2S6+jK/2ddXG6TNfcGzEBpTN+Sgest1Z1H
	7jTDBWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfRv7-0000000B3dj-0olR;
	Wed, 28 Feb 2024 21:56:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfRv4-0000000B3dJ-14Qi
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 21:56:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dc0e5b223eso2884835ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 13:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709157412; x=1709762212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7f+UU+kGK6KC8Bi0zA+xqd0nJW4mDdydIOTkvQtToFc=;
        b=2NtzBt6H/25EbTrAH0iaSQ0ouk7VX9tefyXAhAYEKntaaOYLUJjqXsX+dB5PkKyBS9
         RhWKN9weoo4rh7JCQtlZX+Zzit2qeQVOvEyKsiJgmWRwOQDBK6SbY8U5tS+5pkBKVTP7
         sxKtym1XWZ/OgFGyHwcfyzrjZa7vZobTxZB/58Qy4wsj0Mgb/UPNPdte1RclznplfKng
         fiZsaFIWr8Q6lASCCszQCp6Q+ER7wb2Y32ExhGLZm+1JnSKrxzX4bbZYPm6UPe0lYtay
         hx71iR7lYK2NXh4cnOg7mdfD4QFmXSy4JZw0TgwftepGCS2LT5j7CpobPCZE/Q2UCzI9
         BVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709157412; x=1709762212;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f+UU+kGK6KC8Bi0zA+xqd0nJW4mDdydIOTkvQtToFc=;
        b=Vs7qPq8TtGqMbMw4gZEAthYgVVX1HUKSrQuc3QmXuvVKQMoo4b1WaTz1ePY1rppo53
         8UmL149zXF/vHlFZluF/GEssC75C/qmA1wRDJNzPUFKAmoAiluUge7wptI6xEFPPDGB8
         CYosVUIZi0aDASJg/luADNuA7Q0tiPrHLCnTE29DYRf4aKZTeQZv9pNkKhUQ0YgQAWZm
         PSmbSM1/yjprli/w8h+F56SLIXlgfIl4abU6i/6cY8aVeLWyvSqSaS/hCqcuMe7Rc0ON
         rOUB10qtnhx4LLDMEgCLtgcJWlxZPSCNmKvVNLqTMKfI9VD0cn4GysoAOHLxNSjmxqME
         LOEA==
X-Gm-Message-State: AOJu0YziJma5wrKqypNzPXmw+LODx+FW9fxNZIrjmUv8MkfnWLrU5erK
	x4YDDrritFnOTl1lWDlKoSewcljm0twvdBuS5R2tSBRgibiIyXUqj5OX8sU+hSslqJrolDzzAsz
	+
X-Google-Smtp-Source: AGHT+IHLFyoNQZAw3Fqr2vkMJxSny5PHhmsMGvxLsKEZWdnMcPsTT9DKmBIov01FNq/IVdq3a0oD1g==
X-Received: by 2002:a17:903:2442:b0:1db:cb13:10f1 with SMTP id l2-20020a170903244200b001dbcb1310f1mr274824pls.19.1709157412359;
        Wed, 28 Feb 2024 13:56:52 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id g7-20020a170902f74700b001dbab519ce7sm3740051plw.212.2024.02.28.13.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 13:56:51 -0800 (PST)
Date: Wed, 28 Feb 2024 13:56:51 -0800 (PST)
X-Google-Original-Date: Wed, 28 Feb 2024 13:56:20 PST (-0800)
Subject: Re: vector status when vlen doesn't match
In-Reply-To: <20240228-vicinity-cornstalk-4b8eb5fe5730@spud>
CC: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-5f6c5913-f2a0-4a04-9904-fc360cab91c5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_135654_526130_0FD02188 
X-CRM114-Status: GOOD (  40.39  )
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

On Wed, 28 Feb 2024 08:02:47 PST (-0800), Conor Dooley wrote:
> Yo Andy,
>
> I was wondering if you could clarify something that came up today on
> IRC.
>
> When we enable vector we check vlenb and if it doesn't match the kernel
> is suppose to not support vector. We do this in a few places, the first
> is in riscv_fill_hwcap():
>
> 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> 		riscv_v_setup_vsize();
> 		/*
> 		 * ISA string in device tree might have 'v' flag, but
> 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> 		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
> 		 */
> 		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> 	}
>
> Why does this riscv_v_setup_vsize() failing have no impact? Because this
> is called only once on the boot CPU, right? I feel like it deserves a
> comment as to why.

Unless I'm missing something, that first call can't fail: there's no 
previous riscv_v_size set, so there's nothing to trigger the failure.

Might warrant a comment, though...

> But the main thing I was wondering about was the other time it is called,
> in smp_callin():
> 	if (has_vector()) {
> 		if (riscv_v_setup_vsize())
> 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> 	}
>
> If this fails, we clear the HWCAP bit, but I am not immediately grasping
> how this affects the rest of the kernel.

I think it's actually a bug: we're not clearing the bit in riscv_isa, so 
this only ends up disabling the V bit in AT_HWCAP and thus doesn't do 
anything in the kernel.

> has_vector() just checks if the extension is supported by all cores on
> the cpu using either an alternative or the extension support bitmap.
> There are lots of sites in the kernel that use has_vector() as the
> gating check (as far as I can tell), so if vlen does not match between
> CPUs should we not be returning an error for has_vector()?
>
> The alternative that has_vector() relies on is patched before the non-boot
> CPUs are enabled, so we cannot modify the result once the non-boot CPUs
> are in their callin functions and detect a vlen mismatch while at at the
> same time using it in smp_calling(), so should this code be changed to
> something along the lines of:
>
> 	if (riscv_has_extension_unlikely(v)) {
> 		if (riscv_v_setup_vsize()) {
> 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> 			riscv_v_vlen_mismatch = true;
> 		}
> 	}
> and then has_vector() becomes something like
> static __always_inline bool has_vector(void)
> {
> 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v) && unlikely(riscv_v_vlen_mismatch);
> }
>
> Probably there's value to be gained in static branches etc here, but I
> was just trying to explain what I was getting at. Maybe I am missing
> something though? I do remember talking about this back when the vector
> patches were still in review.

I actually don't think that alone fixes it: even if we make has_vector() 
respect the changes from the new CPU (whether we re-apply the 
alternatives or make a more dynamic check), we'd need to make sure the 
code that has already looked at has_vector() doesn't get scheduled on 
one of the shorter-VLENB CPUs.

So maybe the right answer here is to flip things around, and just refuse 
to enable CPUs that come in with a VLENB different than the boot CPU?  
That way we could avoid being broken by systems that behave this way, if 
someone ends up building one then they can figure out how to make it 
work better.

> Thanks,
> Conor.
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
