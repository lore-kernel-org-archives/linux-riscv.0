Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF7C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9vzaTlD1A+M3s4yr5VQlHCHS04wYDGKwy6FvxdtW1M=; b=Jnuv7bAMQdC0du
	nuWEcw4sebcaggkYazip+UyMdN8aISJVlh9GdsaMge78yaZ4POvxxvBLFPLwMHx/rxvLw6n26X2aM
	x2fWoObm1CtwCJE0oaXVIboHA2OWb+FQGY1B5dM1EbnSL0WfGomzbk3o7QfNQwIiyupGNnlPcPVc5
	GILIucodz3twbcPiej5UrW0whZLBuGH6m5n3zhtifNN/TDNhJJxtHE9rlFVH4CTsYX75Atcr/h8/Z
	XOMa8BhyvkvN8uac7kQ0I2gTzt0rEt1275VNpucMQK/OZ7eFuzQGwV3XlNRXmMDgF1CdH7Vvdm5/X
	UNxslr8ShhF+lTsxP2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFgL1-00ChQV-Kd; Wed, 11 Jan 2023 19:00:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFgKy-00ChPt-8m
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 19:00:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so15081366wms.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 11:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AxzGT4R96/nRowldYLVDQHHEyiV31tMmTSZl+oggOxc=;
        b=Xy8x8icInMETm4u+h3XJ9qIbsF8j4m2qaOL7GOVWXb3l/xPDjNIO3AQcf6iju5y2v+
         WDdPkPw3ZznjJYhNrHfyf9y2jw4sfxfvq7qVIBGX1Lsg2JotYHOrMrgX6WAtwrgERhLa
         AdX1on1tOt3j46QepgXUZy8YpE69L5kkSYacWBIbh8ym9OqMoOqCZ8Z7EFA7hRJ81dl2
         4j1LGKWKMXobVx629QD9nf312blasABrKfKrNP4x75GDddFj7IedI5FupiY1umCdEofm
         4PRBc7Xvw0wfrDkXcmSlP718EUFFLYh9PQFp900/gWf6XdQLWLF5B/kRGjqzX3shIjUZ
         LJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxzGT4R96/nRowldYLVDQHHEyiV31tMmTSZl+oggOxc=;
        b=KuyrTKewWc8ly0WohiqKULtciYSRSpFnPYcTrRF41NqLXN/duDZYOG2T2IH4pJimLt
         RTD0/gSp69XOgV9ElzYsw5VmrmvQW6P+sIboVZvLjTheYkV9umpFF9+A0XDGsbInYFFI
         McxkYurRruaXzydBMMH8MF2eLEldkxaRIvosdR3A6db0H0dE8VIkXZUW99BBMsn5s4rE
         +tsRW9ZhsXHAXVChMJB3aT1ArMP+LQL1cJsJwyQ19Ugajq2Dz7lJ6H1QbWLhg3dxv64g
         s9r/7lLDNtx/Sk3BF/qpCerKHrtSPMXdVLwVAiSyrKgmsYZ7sYbK6ZbpR4ddskjEX2d1
         sjZQ==
X-Gm-Message-State: AFqh2kpM/Suv9jdy1I96m2Tu+nJf9IOtuSKCOLg/6K4Z7KeTtN8odZ6E
	xvTORtrJ/S3lmx36bdM+kgeQTw==
X-Google-Smtp-Source: AMrXdXt5URI//btgtQLhAlGXzc2GUt0bQGMiM7Zg7kMHDxCJyL0TCI1M4p63aM+UFDH/jeUQoGyUXg==
X-Received: by 2002:a1c:6a16:0:b0:3c6:f732:bf6f with SMTP id f22-20020a1c6a16000000b003c6f732bf6fmr52927572wmc.13.1673463631368;
        Wed, 11 Jan 2023 11:00:31 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c020200b003d9ef8ad6b2sm11136454wmi.13.2023.01.11.11.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:00:31 -0800 (PST)
Date: Wed, 11 Jan 2023 20:00:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com,
	alexandre.ghiti@canonical.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v6 RESEND 0/2] use static key to optimize
 pgtable_l4_enabled
Message-ID: <20230111190029.ltynngqnqs42gatd@orel>
References: <20220821140918.3613-1-jszhang@kernel.org>
 <mhng-30c89107-c103-4363-b4af-7778d9512622@palmer-ri-x1c9>
 <Yz6T4EYKKns7OIVE@xhacker>
 <Y0GJDqLXFU81UdfW@xhacker>
 <Y5W0bv8Y/zCc+Fco@xhacker>
 <Y77xyNPNqnFQUqAx@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y77xyNPNqnFQUqAx@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_110036_356556_D79B7A23 
X-CRM114-Status: GOOD (  53.08  )
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

On Thu, Jan 12, 2023 at 01:28:40AM +0800, Jisheng Zhang wrote:
> On Sun, Dec 11, 2022 at 06:44:04PM +0800, Jisheng Zhang wrote:
> > On Sat, Oct 08, 2022 at 10:28:35PM +0800, Jisheng Zhang wrote:
> > > On Thu, Oct 06, 2022 at 04:37:57PM +0800, Jisheng Zhang wrote:
> > > > On Wed, Oct 05, 2022 at 06:05:28PM -0700, Palmer Dabbelt wrote:
> > > > > On Sun, 21 Aug 2022 07:09:16 PDT (-0700), jszhang@kernel.org wrote:
> > > > > > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > > > > > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > > > > > boot, so static key can be used to solve the performance issue[1].
> > > > > > 
> > > > > > An unified way static key was introduced in [2], but it only targets
> > > > > > riscv isa extension. We dunno whether SV48 and SV57 will be considered
> > > > > > as isa extension, so the unified solution isn't used for
> > > > > > pgtable_l4[l5]_enabled now.
> > > > > > 
> > > > > > patch1 fixes a NULL pointer deference if static key is used a bit earlier.
> > > > > > patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
> > > > > > 
> > > > > > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> > > > > > [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
> > > > > > 
> > > > > > Since v5:
> > > > > >  - Use DECLARE_STATIC_KEY_FALSE
> > > > > > 
> > > > > > Since v4:
> > > > > >  - rebased on v5.19-rcN
> > > > > >  - collect Reviewed-by tags
> > > > > >  - Fix kernel panic issue if SPARSEMEM is enabled by moving the
> > > > > >    riscv_finalise_pgtable_lx() after sparse_init()
> > > > > > 
> > > > > > Since v3:
> > > > > >  - fix W=1 call to undeclared function 'static_branch_likely' error
> > > > > > 
> > > > > > Since v2:
> > > > > >  - move the W=1 warning fix to a separate patch
> > > > > >  - move the unified way to use static key to a new patch series.
> > > > > > 
> > > > > > Since v1:
> > > > > >  - Add a W=1 warning fix
> > > > > >  - Fix W=1 error
> > > > > >  - Based on v5.18-rcN, since SV57 support is added, so convert
> > > > > >    pgtable_l5_enabled as well.
> > > > > > 
> > > > > > 
> > > > > > Jisheng Zhang (2):
> > > > > >   riscv: move sbi_init() earlier before jump_label_init()
> > > > > >   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
> > > > > > 
> > > > > >  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
> > > > > >  arch/riscv/include/asm/pgtable-32.h |  3 ++
> > > > > >  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
> > > > > >  arch/riscv/include/asm/pgtable.h    |  5 +--
> > > > > >  arch/riscv/kernel/cpu.c             |  4 +-
> > > > > >  arch/riscv/kernel/setup.c           |  2 +-
> > > > > >  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
> > > > > >  arch/riscv/mm/kasan_init.c          | 16 ++++----
> > > > > >  8 files changed, 104 insertions(+), 66 deletions(-)
> > > > > 
> > > > > Sorry for being slow here, but it looks like this still causes some early
> > > > > boot hangs.  Specifically kasan+sparsemem is failing.  As you can probably
> > > > > see from the latency I'm still a bit buried right now so I'm not sure when
> > > > > I'll have a chance to take more of a look.
> > > > 
> > > > Hi Palmer,
> > > > 
> > > > Before V4, there is a bug which can cause kernel panic when SPARSEMEM
> > > > is enabled, V4 have fixed it by moving the riscv_finalise_pgtable_lx()
> > > > after sparse_init(). And I just tested the riscv-pgtable_static_key
> > > > branch in your tree, enabling KASAN and SPARSEMEM, system booted fine.
> > > > I'm not sure what happened. Could you please send me your kernel
> > > > config file? I want to fix any issue which can block this series being
> > > > merged in 6.1-rc1.
> > > 
> > > Hi Palmer,
> > > 
> > > I know you are busy ;) Do you have time to send me your test kernel
> > > config file so that I can reproduce the "early boot hang"?
> > > 
> > > Thanks
> > 
> > Hi Palmer,
> > 
> > I think the early boot hangs maybe the same as the one which has been
> > fixed by commit 9f2ac64d6ca6 ("riscv: mm: add missing memcpy in
> > kasan_init"). Will you give this series another try for v6.2-rc1? If
> > the boot hang can still be reproduced, could you please send me your
> > .config file?
> > 
> > Thanks in advance
> Hi all,
> 
> Just request to comment what to do with this patch, I think there
> are two independent points to consult:
> 
> 1. IIRC, Palmer gave this patch two chances to merge in early versions
> but he found boot hangs if enable KASAN and SPARSEMEM, while I can't
> reproduce the boot hang. And I also expect the hang should be fixed by
> commit 9f2ac64d6ca6 ("riscv: mm: add missing memcpy in kasan_init")
> 
> 2. Now we know alternative is preferred than static branch for ISA
> extensions dynamic code patching. So we also need to switch static
> branch usage here to alternative mechanism, but the problem is
> SV48 and SV57 are not ISA extensions, so we can't directly make use
> of the recently introduced riscv_has_extension_likely|unlikely()[1] 
> which is based on alternative mechanism.

We could rename the "has_extension" framework to "has_cpufeature" and
then lump extensions and features such as sv48 and sv57 together. Or,
if it's best to keep extensions separate, then duplicate the framework
to create a "has_non_extension_feature" version where features like
sv48 and sv57 live.

Thanks,
drew

> 
> Any comments are appreciated.
> 
> Thanks in advance
> 
> [1] https://lore.kernel.org/linux-riscv/20230111171027.2392-1-jszhang@kernel.org/T/#t
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
