Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E951C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 21:30:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C96A2231B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 21:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wTyoq77s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="DudHOiER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C96A2231B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FqfZL9sRTMxX5w7RGpWpbpRJ2rPn/O9GDFm9LSGJosA=; b=wTyoq77sk/zk4xtg73XUuyjYx
	Kktp4nHLW5xSOv3lYtdCO2oe/DANLRCvd06s6TSdqkO0/xfuxQs5bg6SsfGFF6/pfrhmZuvnMcmRq
	4OlWIRJ6bjzdZjKnZZCfQL6Cshp2hRPkGdLLrSV4JwBC39CdNHCo1bmOLDRaoHxryCUX6OltKCNpC
	xhDmoO0tf1gYS/ooQqnflaKU0sYoMKBy9i8RQSX9oGD1Ohkhwzy7TTsf9X6JZS7sR2yMb8Etj+Lh0
	83jGO7D3/Q22k1DvXovrV/O+W9qaB/MA/YWeryXsnsfbBBNzdYZa96QG3OKd7RMXuAsUSalhqw9at
	lh9KGep5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUcjY-0000x3-5H; Mon, 19 Oct 2020 21:30:24 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUcjV-0000wL-Ch
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 21:30:22 +0000
Received: by mail-pj1-x1042.google.com with SMTP id hk7so533170pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 14:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rZYhKAIK/CTzJe6R9x8W3sg50ZvbSzRMIoJEcrLqu8M=;
 b=DudHOiERuzz1tDVL7EiSQZgiTARWZcg9wEuAuIbrh5pgEIPiGpBImyOgToTQv/pgaE
 +sicT7TABXgY80atmdgByVdIRRhZGXOZJ8JCkfkQW8ES7g124jJOhYZtAkG6DZG07jxY
 qlVUo7NTyHFBrydg1Z8L7rsTBkgjEtnQRxjG+mwbgmEUlb8qK7su7n5Z+fFlzZbfnPKO
 B4eh1hPPqII+d5UbguzcnW7tEh6zqVWIMO5jeCDK4dgqnMWRMKlCqU8Xqeo/TvXaWuJA
 krdz2MgDNZz9Z7QKL1TnjXyvfPAV1vBFEvqYoYAeH1lWx0/5pXz/rcpTfunF6LetGUJl
 +6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rZYhKAIK/CTzJe6R9x8W3sg50ZvbSzRMIoJEcrLqu8M=;
 b=n619I+tatoftzPPqyuQxr+BWmU5fFT2keq1adiahsji2CMK2MS3cpGy5G1jMlLJK9V
 KZeFiXwzx4Q9J1V5SVPAALLafHFN70KN1K77ziLg9n4G7okbVQEiT0p8tjKiy8XxIarK
 cJoi2mDzLox9IQiPDUtEXIRzTjEqsb4omMPYLXTY75V68DsuspsZ6qfmHsLGiHgCu1bY
 9RxuVD0ICmbWRaH+35Pi+HA33QVpfma2BBRCA6+sYrFZwbwgpGglL19V+cvSrEecAH9k
 dIX38GBFp3pqYAAbyojJ+1YAEQ33KL0Sp2ZUPAJXXDRpT5m2vrSuUOfM5K6y4FfiFqqt
 RYpQ==
X-Gm-Message-State: AOAM532ehETeQ9GzaifSxV9/8ri8qxNUeFEtHsABnArBnyeJV0GDlaMy
 WGRP3sJVG0aK4gPw9KpqntPLEA==
X-Google-Smtp-Source: ABdhPJydXDOsEfhE0j4FbL9oG0N/NdSa7o6K3hd4CmeFvLTqrW6uI9We/mYNiVAfXvj0SNTjMgqFOA==
X-Received: by 2002:a17:902:c1d2:b029:d3:e6e9:c391 with SMTP id
 c18-20020a170902c1d2b02900d3e6e9c391mr1794898plc.49.1603143019231; 
 Mon, 19 Oct 2020 14:30:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u65sm688776pfc.11.2020.10.19.14.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:30:18 -0700 (PDT)
Date: Mon, 19 Oct 2020 14:30:18 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 14:30:17 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 1
In-Reply-To: <CAMj1kXHsguWaxqOVDuD0PTSW0+dJPcEaJOMEcPRB86ORA_ggeg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb@kernel.org
Message-ID: <mhng-8bba103a-a680-4a21-829b-bf260590e1cd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_173021_432264_375017D2 
X-CRM114-Status: GOOD (  29.66  )
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 atishp@atishpatra.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 14:21:33 PDT (-0700), ardb@kernel.org wrote:
> On Mon, 19 Oct 2020 at 23:00, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Mon, 19 Oct 2020 13:43:27 PDT (-0700), atishp@atishpatra.org wrote:
>> > On Mon, Oct 19, 2020 at 12:08 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >>
>> >> The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:
>> >>
>> >>   Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)
>> >>
>> >> are available in the Git repository at:
>> >>
>> >>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw0
>> >>
>> >> for you to fetch changes up to de22d2107ced3cc5355cc9dbbd85e44183546bd5:
>> >>
>> >>   RISC-V: Add page table dump support for uefi (2020-10-02 14:31:33 -0700)
>> >>
>> >> ----------------------------------------------------------------
>> >> RISC-V Patches for the 5.10 Merge Window, Part 1
>> >>
>> >> This contains a handful of cleanups and new features, including:
>> >>
>> >> * A handful of cleanups for our page fault handling.
>> >> * Improvements to how we fill out cacheinfo.
>> >> * Support for EFI-based systems.
>> >>
>> >> ---
>> >>
>> >> This contains a merge from the EFI tree that was necessary as some of the EFI
>> >> support landed over there.  It's my first time doing something like this,
>> >>
>> >> I haven't included the set_fs stuff because the base branch it depends on
>> >> hasn't been merged yet.  I'll probably have another merge window PR, as
>> >> there's more in flight (most notably the fix for new binutils I just sent out),
>> >> but I figured there was no reason to delay this any longer.
>> >>
>> >> There is one merge conflict, which is between my fixes and for-next branches:
>> >>
>> >>     diff --cc arch/riscv/kernel/vmlinux.lds.S
>> >>     index 67db80e12d1f,9795359cb9da..ffaa3da375c2
>> >>     --- a/arch/riscv/kernel/vmlinux.lds.S
>> >>     +++ b/arch/riscv/kernel/vmlinux.lds.S
>> >>     @@@ -66,8 -71,11 +70,13 @@@ SECTION
>> >>                     _etext = .;
>> >>             }
>> >>
>> >>      +      INIT_DATA_SECTION(16)
>> >>      +
>> >>     + #ifdef CONFIG_EFI
>> >>     +       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
>> >>     +       __pecoff_text_end = .;
>> >>     + #endif
>> >>     +
>> >>             /* Start of data section */
>> >>             _sdata = .;
>> >>             RO_DATA(SECTION_ALIGN)
>> >>
>> >> ----------------------------------------------------------------
>> >> Anup Patel (1):
>> >>       RISC-V: Move DT mapping outof fixmap
>> >>
>> >> Ard Biesheuvel (3):
>> >>       efi/libstub: arm32: Base FDT and initrd placement on image address
>> >>       efi/libstub: Export efi_low_alloc_above() to other units
>> >>       efi/libstub: arm32: Use low allocation for the uncompressed kernel
>> >>
>> >
>> > I thought these 3 were being taken through the EFI tree. I already see
>> > them in the master branch.
>> >
>> > 762cd288fc4a efi/libstub: arm32: Use low allocation for the uncompressed kernel
>> > 1a895dbf4b66 efi/libstub: Export efi_low_alloc_above() to other units
>> > 6208857b8f7e efi/libstub: arm32: Base FDT and initrd placement on image address
>>
>> I see them in Linus' master with those exact hashes, so IIUC this is all OK?  I
>> guess I just assumed they were supposed to show up in the shortlog, but it's my
>> first time trying one of these multi-tree merges so maybe I screwed something
>> up?
>>
>> I obtained these by merging a tag from the EFI tree (that's already been
>> merged) into my tree, which looks OK to me:
>>
>>     commit 8a3f30c4319dc70547f11c18da2e7b5987543aa1
>>     gpg: Signature made Fri 02 Oct 2020 02:30:05 PM PDT
>>     gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
>>     gpg:                issuer "palmer@dabbelt.com"
>>     gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
>>     gpg:                 aka "Palmer Dabbelt <palmerdabbelt@google.com>" [ultimate]
>>     merged tag 'efi-riscv-shared-for-v5.10'
>>     gpg: Signature made Wed 16 Sep 2020 08:57:07 AM PDT
>>     gpg:                using RSA key 9CD2A0DA6AD8F7330175E2BBC237207E9574FA7D
>>     gpg: Good signature from "Adriaan (Ard) Biesheuvel <ard.biesheuvel@linaro.org>" [unknown]
>>     gpg:                 aka "Adriaan (Ard) Biesheuvel <ard.biesheuvel@gmail.com>" [unknown]
>>     gpg:                 aka "Adriaan (Ard) Biesheuvel <ardb@kernel.org>" [unknown]
>>     gpg:                 aka "Adriaan (Ard) Biesheuvel <ard.biesheuvel@arm.com>" [unknown]
>>     gpg: WARNING: This key is not certified with a trusted signature!
>>     gpg:          There is no indication that the signature belongs to the owner.
>>     Primary key fingerprint: F43D 0332 8115 A198 C900  1688 3D20 0E9C A632 9909
>>          Subkey fingerprint: 9CD2 A0DA 6AD8 F733 0175  E2BB C237 207E 9574 FA7D
>>     Merge: 54701a0d12e2 762cd288fc4a
>>     Author: Palmer Dabbelt <palmerdabbelt@google.com>
>>     Date:   Fri Oct 2 14:29:51 2020 -0700
>>
>>         Merge tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/efi/efi into for-next
>>
>>         Stable branch for v5.10 shared between the EFI and RISC-V trees
>>
>>         The RISC-V EFI boot and runtime support will be merged for v5.10 via
>>         the RISC-V tree. However, it incorporates some changes that conflict
>>         with other EFI changes that are in flight, so this tag serves as a
>>         shared base that allows those conflicts to be resolved beforehand.
>>
>>         * tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/efi/efi:
>>           efi/libstub: arm32: Use low allocation for the uncompressed kernel
>>           efi/libstub: Export efi_low_alloc_above() to other units
>>           efi/libstub: arm32: Base FDT and initrd placement on image address
>>           efi: Rename arm-init to efi-init common for all arch
>>           include: pe.h: Add RISC-V related PE definition
>>
>> I think the actual issue here is just that whatever I pointed git to when
>> generating the PR didn't contain the merge of the shared code yet, so
>> git-shortlog included it?
>>
>
> This all looks fine. Usually in such cases, you don't know which
> branch will gets pulled first, so it makes sense for each PR to
> describe the shared changes.

OK, good to know -- I'd just been pointing my PRs at Linus' latest tag, rather
than directly at master, as it's less of a moving target.  Sounds like that's a
reasonable thing to do, so I'll probably keep doing it (unless I forget ;))

Linus: Looks like this was all actually fine, but LMK if you have any issues.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
