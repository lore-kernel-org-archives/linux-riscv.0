Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E707C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 07:48:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CFEB613A0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 07:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CFEB613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C+NO/zJ+vnf6fuNoTOYhwUY0E2JulSUAJW4vkoS1j9A=; b=Pka+y/QO1RJuFhWhJSTLm2lZW
	wBJFwzWPlUyqgmhBTnCrjAJ1fh3A/2fprolFg2v7CMuFzSixY7TOroXPhg5WalbwN9zFeYu/kN7O5
	8kRauNVbSLIMl5FWZsxvWFdpCjbb8y6vXsc3vRJkug3/0kI6VxQ/vcDpmDPY31iZOnuYKllVx1LAP
	A3sBg8Jd0pfg62fMunJD1k6SIvjUcyx/++sOxBFw1mkrTlqybFXkfgQGpgHa1W9fO1SNHQ+UQP7eK
	NcBdmzPOAc+69BlzsL1J5WO3KKJZUkhCA4aY2Mgl0U+Z66INBmowkFK7wvzUsj7rnhT5KGWjHBsNV
	oqo/HWG9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU2vS-004RYA-LX; Wed, 07 Apr 2021 07:48:34 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU2vJ-004RWw-34
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 07:48:29 +0000
Received: by mail-oi1-x22e.google.com with SMTP id a8so17868632oic.11
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 00:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cSkDmnD6jYWKdbDVG0d7Or7vQx48fRvJDXWQ+AEJf5o=;
 b=Ib1FObJ0TiZpb8fnrkhwNgmMTDO2qhjE7PsN/95QBFKc8TexrPjEUWjuVwACce0jHh
 hpYjctFVKcBp9YbuNeFRJMBs97CasPLpedql7aCyLTYcq41kGsI9SS1sW+DWbyPvRHWF
 2ZQmPjVBZpphloas7bFXTIpB7Sjm1afMojU+r29yVRtRgw7xC+vSHON2BLANH47RuRkg
 Y8t2w4zzACJui2vnFwnJpdFArHUt1oZaE4k7XCKh41EYIrf2xw4XJQfsQRz4NFhW0VWZ
 S8GU9gvlviaYaws21klr9b+AN/gUpYoJNU1WfaESaz22mCcXP/hXSWal7nZ/kksy+8es
 RjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cSkDmnD6jYWKdbDVG0d7Or7vQx48fRvJDXWQ+AEJf5o=;
 b=CSjOjvyfEEw93KQQGhOuY7Ofxmu9jO7xhprgvVlFT5MK/darr/kTf6qAT3l1peETFD
 hozjptzPmKwnqJvPUoNTb9qhxPJseE1y14UhxmiqyWYPiVJNiAqSeEWjiSho4pxIhXOy
 V621JaDxx2qlOuEVVxUxVWsuykJo8ZzO4TsNJ7emZEGoEmLCC5VJN7MTCMeK2TBAz+Ha
 yKcuFh8E792jA+i3I2bS2LfBomq2jO8ZWYYDharUiqb+46I5mhTWvNiowaerx0xJRkaa
 Z0EJG2pLJl/F6kStmz8lMSgYJjRAuRh68UtiTFIhFfDvKdbTNpERAgkIpXpm482J7hjK
 1YNQ==
X-Gm-Message-State: AOAM533cZOylkdmYHIfExeu6JERq1Qz18fHINsk2xrBH08JnsWR5vmxT
 +uVcYHafKTqleGCFld8p9YSgggm0jUskSeSfjQU=
X-Google-Smtp-Source: ABdhPJzl64tM8CKIZ95YDdKpiWCoXJxnvV+k4J9fL5F8/0Uei93uZFyas9apbrXr2UCmvukuPvtwigRyQ4LSA08zxjk=
X-Received: by 2002:aca:b7d5:: with SMTP id h204mr1435846oif.18.1617781703030; 
 Wed, 07 Apr 2021 00:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210405085712.1953848-1-mick@ics.forth.gr>
In-Reply-To: <20210405085712.1953848-1-mick@ics.forth.gr>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Wed, 7 Apr 2021 07:45:17 +0000
Message-ID: <CALecT5iJjxh_0+thLVib2psF9wh7m2Ev+V99jMnFHAzO9igtYA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
To: Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_084826_521344_B6768659 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Nick

On 4/5/21 8:57 AM, Nick Kossifidis wrote:
> This patch series adds kexec/kdump and crash kernel
> support on RISC-V. For testing the patches a patched
> version of kexec-tools is needed (still a work in
> progress) which can be found at:
>
> https://riscv.ics.forth.gr/kexec-tools-patched.tar.xz
>
> v3:
>   * Rebase on newer kernel tree
>   * Minor cleanups
>   * Split UAPI changes to a separate patch
>   * Improve / cleanup init_resources
>   * Resolve Palmer's comments
>
> v2:
>   * Rebase on newer kernel tree
>   * Minor cleanups
>   * Properly populate the ioresources tre, so that it
>     can be used later on for implementing strict /dev/mem
>   * Use linux,usable-memory on /memory instead of a new binding
>   * USe a reserved-memory node for ELF core header
>
> Nick Kossifidis (5):
>    RISC-V: Add EM_RISCV to kexec UAPI header
>    RISC-V: Add kexec support
>    RISC-V: Improve init_resources
>    RISC-V: Add kdump support
>    RISC-V: Add crash kernel support
>
>   arch/riscv/Kconfig                  |  25 ++++
>   arch/riscv/include/asm/elf.h        |   6 +
>   arch/riscv/include/asm/kexec.h      |  54 +++++++
>   arch/riscv/kernel/Makefile          |   6 +
>   arch/riscv/kernel/crash_dump.c      |  46 ++++++
>   arch/riscv/kernel/crash_save_regs.S |  56 +++++++
>   arch/riscv/kernel/kexec_relocate.S  | 222 ++++++++++++++++++++++++++++
>   arch/riscv/kernel/machine_kexec.c   | 193 ++++++++++++++++++++++++
>   arch/riscv/kernel/setup.c           | 113 ++++++++------
>   arch/riscv/mm/init.c                | 110 ++++++++++++++
>   include/uapi/linux/kexec.h          |   1 +
>   11 files changed, 787 insertions(+), 45 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kexec.h
>   create mode 100644 arch/riscv/kernel/crash_dump.c
>   create mode 100644 arch/riscv/kernel/crash_save_regs.S
>   create mode 100644 arch/riscv/kernel/kexec_relocate.S
>   create mode 100644 arch/riscv/kernel/machine_kexec.c
>

Just ask out of curiosity (maybe out of topic)..
Is crash analysis [1] capable of parsing RISC-V kdump image? No?

Or, any plan working on it?

[1] https://github.com/crash-utility/crash

Yxun Lan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
