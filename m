Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14C1C6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 00:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dudXyr1EWJ80+DCAOxwHf4YvqRvZGvgk9exTkexNCT8=; b=DYIOYR+2M3a9OG
	EYMyxFN/nox7wYn2lCYELaSfLArLAokNIOLuNId9eoGOSz1LQnyHom3w+jSHyWm7Zop3ahg7JNqGT
	jE8OZOGcXjl4LFJOclYZsnlMN2FD5PcqdJtYOX1H4T5tUr9b2c/V9f6Dp0P8WO5hQzLC/3HnsVE62
	Ium1qU+EdJAFQCCxTbgLHHEf1SJ3woFaSRbqL/H6/8myc1u1kLOeO5BSRVCnyHfK3p80OUSXL8kF0
	EgfCwUO5irLm0fQeEIIDx/TNkeEMIRTtDXkAiSgMTJ8aLaB1qttvKUJpxOZsnoc5zQFr+w6kpvDll
	tXdzCrD4uph7fcowgo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtjD-0045Pw-OU; Fri, 03 Mar 2023 00:56:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtjA-0045Or-3P
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 00:56:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id i28so1686450lfv.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 16:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677805008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hhOaUUtcn0GNvOjLHghATWbxYEsh5HHcckYl0flnDRk=;
        b=7YKwPnHYHtEomAzauAtTEVCduneHnCHVYc8wA8mlRN/RDrPlrpjPy1EGiVFb4vKoDi
         6MV2N/NOciUb1+E5YMjYIR3ngMdFO88f8EbqE0O5vDz5VV8uAql/BO6da9K0eHDyoCmd
         wolQrVIQhNVnoKabot/cyFHYMoqIBv6dkEH4eg4C5eX9fFz9DWxK9GRmMDgXZr3b1QBk
         OYbt3NVuVS34QR9on9pmWTyBv9lOgYjEUCGlusiAJO0krkT0lm62kpzwPmMwYyD7gczd
         lHYsNdbX3w5HSW6Ea570UjQW8Iz6s3R4fBVrrYOsD8PKamXDsSd6OLXl3rBidIxviSso
         KAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677805008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhOaUUtcn0GNvOjLHghATWbxYEsh5HHcckYl0flnDRk=;
        b=6IaW8GTnAzQIvlWEENr3JKME630e5XappJiAxGL8l+ipUym4XZWrSWldQHb231swl0
         504y9mlM7llZ6yGbQFUxszeCbvwS4uWKnHmAzjK1En3o7N+o3qpBa04l4nZDIzTXiXr5
         /VTLXQcWBRntgb3TOpkdu/S6hU13L7oErdvg39LaOkpVMmRk9XFKJgbvFs+GHCcMFqjI
         4Ldo2BawxYSyyr1ne1HrKcSStiK20r99tPScGfYz+tKWmD1JN0IkrSOIWgdH6/PJmA+g
         6Q8fy9q8dGtsOLEzBbR+AeN0X6VG9y3ovzqC6FOgjV9h8bgj6u7pvxnVg/wBkUaocXzZ
         sXqA==
X-Gm-Message-State: AO0yUKXFJqqF1OpPv+KdHNvowi1NvIj61vClgtCQckAopkoP0nn42rm7
	RAXvP8oyUVFFZjDx3NLr/HSfM/2cUpfPDDou5UMA5A==
X-Google-Smtp-Source: AK7set8Xec0hmZtsTEoXvSYXQ53A6NrkQ4OC6YHTS3jOwamMG773B1NC/0R48ttoRARWzEWE/Y09iqutqWRgiZkiCJU=
X-Received: by 2002:ac2:48a2:0:b0:4dd:9931:c555 with SMTP id
 u2-20020ac248a2000000b004dd9931c555mr1361458lfg.0.1677805008352; Thu, 02 Mar
 2023 16:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20230221190858.3159617-1-evan@rivosinc.com> <20230221190858.3159617-4-evan@rivosinc.com>
 <Y/0zC0Dn9gwC8N5w@spud>
In-Reply-To: <Y/0zC0Dn9gwC8N5w@spud>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 2 Mar 2023 16:56:12 -0800
Message-ID: <CALs-HsvpGCpmnVouRL-Kyaes0Yy2jOktebM8DA5wXaDR=D0yvA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, heiko@sntech.de, slewis@rivosinc.com, 
	vineetg@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
	Celeste Liu <coelacanthus@outlook.com>, Guo Ren <guoren@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_165652_376060_245EC3E9 
X-CRM114-Status: GOOD (  34.58  )
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

On Mon, Feb 27, 2023 at 2:47 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Evan,
>
> On Tue, Feb 21, 2023 at 11:08:54AM -0800, Evan Green wrote:
> > We have an implicit set of base behaviors that userspace depends on,
> > which are mostly defined in various ISA specifications.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > ---
> >
> > Changes in v3:
> >  - Refactored base ISA behavior probe to allow kernel probing as well,
> >    in prep for vDSO data initialization.
> >  - Fixed doc warnings in IMA text list, use :c:macro:.
> >
> >  Documentation/riscv/hwprobe.rst       | 21 +++++++++++++++++++++
> >  arch/riscv/include/asm/hwprobe.h      |  2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h |  5 +++++
> >  arch/riscv/kernel/sys_riscv.c         | 20 ++++++++++++++++++++
> >  4 files changed, 47 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> > index 88b015a2026e..9f2da414fbf8 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -37,3 +37,24 @@ The following keys are defined:
> >    defined by the RISC-V privileged architecture specification.
> >  * :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> >    defined by the RISC-V privileged architecture specification.
> > +* :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
> > +  user-visible behavior that this kernel supports.  The following base user ABIs
> > +  are defined:
> > +
> > +  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: Support for rv32ima or
> > +    rv64ima, as defined by version 2.2 of the user ISA and version 1.10 of the
> > +    privileged ISA, with the following known exceptions (more exceptions may be
> > +    added, but only if it can be demonstrated that the user ABI is not broken):
> > +
> > +    * The :fence.i: instruction cannot be directly executed by userspace
> > +      programs (it may still be executed in userspace via a
> > +      kernel-controlled mechanism such as the vDSO).
> > +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
> > +  that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
> > +  base system behavior.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_IMA_FD`: The F and D extensions are supported, as
> > +    defined by commit cd20cee ("FMIN/FMAX now implement
> > +    minimumNumber/maximumNumber, not minNum/maxNum") of the RISC-V ISA manual.
> > +  * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
> > +    by version 2.2 of the RISC-V ISA manual.
>
> I think I asked for some newlines, but this all seems kinda random now
> as to whether there is a blank line between list items or not.

Yeah, this was the minimum number of newlines needed to make it
actually render correctly. The relevant rules which I've now learned
are that newlines are required before a list beginning (including a
sub-list), but optional between items. I'll fix this up to add
newlines between elements as well, then it will look pretty I think.

>
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 02c2f1f7417e..f2b224550923 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -9,6 +9,7 @@
> >  #include <asm/cacheflush.h>
> >  #include <asm/hwprobe.h>
> >  #include <asm/sbi.h>
> > +#include <asm/switch_to.h>
> >  #include <asm/uaccess.h>
> >  #include <asm/unistd.h>
> >  #include <asm-generic/mman-common.h>
> > @@ -124,6 +125,25 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >       case RISCV_HWPROBE_KEY_MIMPID:
> >               hwprobe_arch_id(pair, cpus);
> >               break;
> > +     /*
> > +      * The kernel already assumes that the base single-letter ISA
> > +      * extensions are supported on all harts, and only supports the
> > +      * IMA base, so just cheat a bit here and tell that to
> > +      * userspace.
> > +      */
> > +     case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> > +             pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> > +             break;
> > +
> > +     case RISCV_HWPROBE_KEY_IMA_EXT_0:
> > +             pair->value = 0;
> > +             if (has_fpu())
> > +                     pair->value |= RISCV_HWPROBE_IMA_FD;
> > +
> > +             if (elf_hwcap & RISCV_ISA_EXT_c)
> > +                     pair->value |= RISCV_HWPROBE_IMA_C;
> > +
> > +             break;
> >
> >       /*
> >        * For forward compatibility, unknown keys don't fail the whole
>
> This looks a lot nicer after the refactor, sans the {}.
> With a consistent approach taken to newlines:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Conor!

-Evan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
