Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69DDC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:31:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3996461417
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3996461417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2+ir8WDUHXJ/nMaEoOcJ9vGOuryeZKiU8y42kYecv3I=; b=AN6VEErnDI0oAuUzgvfOKz5Wj
	9PmwsEUBw9zPp7KcKzlPQpeUG8Z8ANL3fhIX58vLKWrBAxQcaCo+soMqDw6Kwr1baWB5C7BlhqVLT
	pOf7hfJ7dXlWgO3KqiYaLPySR804cnMCCrNpBP+nfdKTMS+1Mgup24ei59kDiEnUkAoFrSuI9HiMP
	Pph+wJK5M65CWKsSz+iwNRTCfDh0TeWinJdLb46nnXiASc5PLVlFJujcm7ImLgXBcEWtpamIfhBF+
	Vchp72h4BNMPka2NbUDJniZu/qacAOfj/zEUTH+IqpwoJlrvfk/4GFgA3HqZx/GzmgqhPfc0SGN5V
	vgS/5O2RA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmXZ-000TS2-Ux; Fri, 23 Apr 2021 03:31:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWs-000TKM-Tj
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=qaw2z6Fiz8budmcbQpSjS3rq3t98QrIaH/1JDnF8/CI=; b=F1r5xS2adXJ9DgE42MJDdGltfq
 WeUGBW3fPDG57zRoUInJ+6Ds8qha4Ldrs5lw99PKftbYGhcy36DyukWfa0zK8Xj795Q3TgSy8c20H
 hrRP9OjCEjuWbTr88sNo3RfE30uedCJUE6dA+8+M6HN2Nlq51TwjxXov8vi+qz8zDrBNuKkIFoHTD
 HGiqwbxPeEftYvmcxcgPplElhYO5k/GJmgJPEbuElfQLxpX/E79AygJCb3Sc2VCg3X4qLk9vt7KQ1
 xxRMCQNrv4kMJkPjkj0xDyXQH5m0auucCjRI7mVj6QCJhMnS6BOGeNuu5RhCxDj5Tj0W4q9KBnqa8
 diq+0/ow==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWq-00E7HV-5F
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:30:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso512394pjs.2
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qaw2z6Fiz8budmcbQpSjS3rq3t98QrIaH/1JDnF8/CI=;
 b=Twjiu66cRGDiSGf+hENnGoVVrxWmSAHDo4wVWo04Sm68c0+kRHlyolVR9lSyKV9aPh
 CChttEIa3EbCHiPptC0tV/KUh+VoCql/phpfoWhQIC+ZsGvRZqxLdo9MfMpRxjdWbALM
 zhOAXIyzhNYJIT/aouIxAm8I1GeaxWI3Wh7fMhMJEg6hvhJBkHRQtLpO3JFpoKKlSgXj
 D72pUt8+obFY6SFBoSQR1GsUlHBblJ8LOaalrdD6R7aSTTg5bzUxcnIVwjrzUkYKYs46
 g/OXAdpNbA7lIyseTRzaBzdaWwTikSgKU0W9QzlPFJxsvd3FUmC6CjnqCknQa/+UZbeg
 Zm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qaw2z6Fiz8budmcbQpSjS3rq3t98QrIaH/1JDnF8/CI=;
 b=VvTpLhbLidu6dgKHZZrRgoAlmf6jtwQtBl9HIyyerBLInwn/4xV1fK0GlmkO/Y9vm2
 grLPEvL4duErlvcFNgj0pKG6CyhoC+JhKgr65Oi2ZdBCiCl87JpMTcuwXSf3ugPJff6y
 ANrxdE3KsSJT/UInQ/MVJQa1mB+mHwHcf+fX8LOZmY3Ij+NeJi/M4kBsm9lVacIAaSaH
 7xJvc5HXuM+Dz0Um+xy2vDQNf7HcbHrsxKjtn07TsRLpJCIGLdJXghVLvoDf/CH8CFRl
 O1LMabKL/Idk0p4E2ea3lRLoAo+dQMR8K7tJEtQp8i9wIfyD0545c5VCK0ysmVaY5Vhu
 vDUQ==
X-Gm-Message-State: AOAM5313FnMGPiLwPuE7JieBZ6KJmxjcRt1nbljKAMBHp9cZQC2zWE5Z
 kwLKtuBddTos9e9IVKzLL8gPubq+JcxAOA==
X-Google-Smtp-Source: ABdhPJypdjFtPqzzjXh0/a1Ykmfvyq/pU6f4BqrwPfq6B8TYM5PC1MceOudhWdAKtt7OEr8SIDEUBw==
X-Received: by 2002:a17:902:ea89:b029:ea:c781:daad with SMTP id
 x9-20020a170902ea89b02900eac781daadmr2006310plb.62.1619148651234; 
 Thu, 22 Apr 2021 20:30:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l132sm3502524pga.39.2021.04.22.20.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:30:50 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:30:50 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:30:40 PDT (-0700)
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
In-Reply-To: <20210405085712.1953848-1-mick@ics.forth.gr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-kernel@vger.kernel.org, mick@ics.forth.gr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-4f2d27cc-6dc2-4d3d-ae61-5681b15372b7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203052_220458_9967F6BC 
X-CRM114-Status: GOOD (  18.16  )
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

On Mon, 05 Apr 2021 01:57:07 PDT (-0700), mick@ics.forth.gr wrote:
> This patch series adds kexec/kdump and crash kernel
> support on RISC-V. For testing the patches a patched
> version of kexec-tools is needed (still a work in
> progress) which can be found at:
>
> https://riscv.ics.forth.gr/kexec-tools-patched.tar.xz
>
> v3:
>  * Rebase on newer kernel tree
>  * Minor cleanups
>  * Split UAPI changes to a separate patch
>  * Improve / cleanup init_resources
>  * Resolve Palmer's comments
>
> v2:
>  * Rebase on newer kernel tree
>  * Minor cleanups
>  * Properly populate the ioresources tre, so that it
>    can be used later on for implementing strict /dev/mem
>  * Use linux,usable-memory on /memory instead of a new binding
>  * USe a reserved-memory node for ELF core header
>
> Nick Kossifidis (5):
>   RISC-V: Add EM_RISCV to kexec UAPI header
>   RISC-V: Add kexec support
>   RISC-V: Improve init_resources
>   RISC-V: Add kdump support
>   RISC-V: Add crash kernel support
>
>  arch/riscv/Kconfig                  |  25 ++++
>  arch/riscv/include/asm/elf.h        |   6 +
>  arch/riscv/include/asm/kexec.h      |  54 +++++++
>  arch/riscv/kernel/Makefile          |   6 +
>  arch/riscv/kernel/crash_dump.c      |  46 ++++++
>  arch/riscv/kernel/crash_save_regs.S |  56 +++++++
>  arch/riscv/kernel/kexec_relocate.S  | 222 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec.c   | 193 ++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c           | 113 ++++++++------
>  arch/riscv/mm/init.c                | 110 ++++++++++++++
>  include/uapi/linux/kexec.h          |   1 +
>  11 files changed, 787 insertions(+), 45 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kexec.h
>  create mode 100644 arch/riscv/kernel/crash_dump.c
>  create mode 100644 arch/riscv/kernel/crash_save_regs.S
>  create mode 100644 arch/riscv/kernel/kexec_relocate.S
>  create mode 100644 arch/riscv/kernel/machine_kexec.c

Thanks.  There were some minor issues and some merge conflicts, I put 
this on for-next with some fixups.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
