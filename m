Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35DDC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYz5M07xua4lpvuft+KWv1vHhMJ8zsUOrPLS/P/TyxU=; b=cTRP+KHUe7mZ3h
	lYCbxfbeHBkl463eObqtKzBkEZl0S6kF6wFhYEg+zx8vw0ZPn1VrGYUg/yFxUHFGMsZ6u8k4muuc5
	hSJA42CgbRPLn/86bsl8+R0KuvHOSmyw2c0JJz15IeJ5r21TS4G2jV3zyUEC2FDQDTnqbEI+2Kk8x
	gaqCTmYNRfjibXvDj975nGTQovGzarLm9rfUkMKJmRaPg04z7FUHsFmCVTVYAoEzualAStnCgANan
	7c3EMAP/IhyxKKCp3dzNj9LoLOSliPFou9hIn2gL1tYxSEzneE3Xe71ubTD9thSjdqFsIaK6nCs1p
	3sx+3+7R2rL1Zvmewa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqiYM-001rcO-Sy; Thu, 03 Nov 2022 22:19:14 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqiYJ-001rbR-Jk
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 22:19:13 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N3J7j4yHJz4x1G;
	Fri,  4 Nov 2022 09:18:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667513939;
	bh=VR6Mm9ZHp7WtU2Fa2nUanqpeKXo980HrZ6AWhIqgPP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R7HTBz4l7NOogMvdkkYnluPBOStvtLJb5Kjm54ZcVKtSUxohHMPydfXwVamBQvux+
	 kWILI3eGk8inAfxlkK3Zuy4GCckJRcN19RV87u19RkO3cWYbWn4WXdFYoQULPYr97d
	 3OiqJodFQ6p33NpSw1vnbbYntsT/lRnq/sMbdV0kaE90G1WUJevDYm4trxn/WCQaYV
	 G+kbYmjjidV2kxWM707p1x0Vlcf1tbkKuHgSCjSma6s9d8+VnJxF9/NJFyqiNzychW
	 n9ETDtlJQCjWuDRSMrXcrJ88soYBZhH7nbRfSNSo1p7mg8R+Vto6z7eNE+CtxAH9ze
	 Q1TRR9azQ7HJw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 schwab@linux-m68k.org, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, guoren@kernel.org, arnd@arndb.de
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
In-Reply-To: <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
References: <87o7tossaa.fsf@mpe.ellerman.id.au>
 <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
Date: Fri, 04 Nov 2022 09:18:54 +1100
Message-ID: <87iljvsmup.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_151911_901516_77D59B35 
X-CRM114-Status: GOOD (  11.94  )
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

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Wed, Nov 2, 2022 at 7:09 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>>  - Fix an endian thinko in the asm-generic compat_arg_u64() which led to syscall arguments
>>    being swapped for some compat syscalls.
>
> Am I mis-reading this, or did this bug (introduced in this merge
> window by commit 43d5de2b67d7 "asm-generic: compat: Support BE for
> long long args in 32-bit ABIs") break *every* architecture?

No. Just RISC-V and powerpc.

> And people just didn't scream, because 32-bit code has just become so rare?

I had two systems and several VMs that booted happily with the bug
present, so there's some luck involved as to whether your userspace
trips over the bug in a way that matters.

But we did have people scream eventually :/

> Or is it just because those compat macros are effectively not used
> elsewhere, and x86 has its own versions? Looks like possibly mainly
> RISC-V?

Yeah. Although compat_arg_u64() is defined for all arches, it's only
used in places guarded by __ARCH_WANT_COMPAT_FOO macros, and those are
only selected by RISC-V and powerpc.

Full list is:

  __ARCH_WANT_COMPAT_FADVISE64_64       riscv
  __ARCH_WANT_COMPAT_FALLOCATE          riscv, powerpc
  __ARCH_WANT_COMPAT_FTRUNCATE64        riscv
  __ARCH_WANT_COMPAT_PREAD64            riscv
  __ARCH_WANT_COMPAT_PWRITE64           riscv
  __ARCH_WANT_COMPAT_READAHEAD          riscv
  __ARCH_WANT_COMPAT_SYNC_FILE_RANGE    riscv
  __ARCH_WANT_COMPAT_TRUNCATE64         riscv


> Side note: why is it doing
>
>         #ifndef compat_arg_u64
>
> at all? That macro is not actually defined anywhere else, so that
> #ifdef seems to be just confused.

That goes back to the original submission:

  59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")

I guess it was following the example in asm-generic/compat.h where a
bunch of other things are guarded by ifndefs. But agree it's
unnecessarily flexible in this case until we have another definition.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
