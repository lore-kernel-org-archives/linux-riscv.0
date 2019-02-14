Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53984C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 00:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232B92083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 00:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLQLIj3P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SFYHNJwa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 232B92083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vu2eAJ017Gq07Qogcqtp4eC3bwGxLJwTlb/n2KgzXgQ=; b=LLQLIj3PqKSKC7HFTam34P/4N
	pCPAPrnR7H35lh8bAVcuoGN44sY/DvC09u5F2L/Kn/8hifQ3v95ogoIBjGOuhVM1Azl+aRtKFvS+o
	ocIlTJ2YV2pGchZSMynubfZnDBduukK/ZnjR9I1ZG30nefYEXNub1mjANN+okXLoh3q9Jj1La0FS6
	vKpGT8EOqVWSpEsaBLSpwAPuDqXtBXNwAevpL/0SrUDUzdo2FS04AEU4hMHSPfjDLYaJL5alO8CR/
	nUb2Z0we8bxRlKOb841/ZUZqbSPZTuaHJAsvM4Y4+RZ6vVnHPYhrsGZxl4loeWE+SibLwJLbKPB+T
	9C8xWjjMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu52H-0005Gz-Li; Thu, 14 Feb 2019 00:37:53 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu52E-0005GA-R6
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 00:37:52 +0000
Received: by mail-pg1-x544.google.com with SMTP id q206so2039208pgq.4
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 16:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4YNhA6G9lOW17v41GSeYMA4e4WObkqs7yOUhebPENCA=;
 b=SFYHNJwao4o90ci76fZTWarqbVmPkwGywvih8o8qdaKTFg5KfiNuLhkEXoK9EBRdaq
 Yy888l6TL/uQk3JGPY2WCYZWPu0B1GJGB8uin+O8I/X+/ybQAHHwQkynA6IK3/vZEVij
 j/GBPR6WjMtQsQhy6wR6gfiqBhgzgLu8qY3E4iM9TXAkE6Q30gxWyfZAMNU6HII73NiS
 prJEqQV3zwuTLIeOrE3Q4DVPd8oQzDmAEg4AzeWqrM2/ZLMoHStDgcIq95GCCLqaNvpb
 5JVZ14C3KJj+8hLLAAP6QJ5q7b2zF10dvbvMlIicmLfTaKI6zQTOIdDi3Ant52Ebcqu/
 p52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4YNhA6G9lOW17v41GSeYMA4e4WObkqs7yOUhebPENCA=;
 b=jKS11ZbAaEcxuFIPlCGNlESUL9hkioo5qjNFY/5x47pBTq1zUca3jk0fKfKyKKqai4
 TIa4T7oSRsY6zsn99mBO9xEfi3+gQNqa65GIIPfLsMe/ofhL2HajrxrU+EWGsk1f11kD
 fsxCxyf7bTkVCx2wFlLGUebh82ACvrNzdsWOBZISJ1p+tThLBxZWkvprG/NKX6kKS+3i
 1O+rKxWB9smUNWavo33r1lzK2jnQatncmxueojp41YJX4opsnmP7PE0AQffNmo0BVtaj
 N2SdllJTjSm0ZjBNHVmWX4NBTNnSUnmeQhRIdCo5HbD6hhoG6pfoupMNIp0X+dkT6XA4
 hKWQ==
X-Gm-Message-State: AHQUAua9wW/65zUkbW6TuMg41/rt0cEPvECkjfLv/BYU/Bm9wxJoDg33
 B4I8ctrjf8YgyQ4FwEiTo/+LIA==
X-Google-Smtp-Source: AHgI3IZo3qJsAB1d7GpfiCPPVovu00Txb4as/tL1c/8lGjP1SPQEI2Uj55x+uU/DGwmDZFnH4EUkOg==
X-Received: by 2002:a63:2705:: with SMTP id n5mr954284pgn.429.1550104669632;
 Wed, 13 Feb 2019 16:37:49 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 184sm685108pfe.106.2019.02.13.16.37.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 16:37:48 -0800 (PST)
Date: Wed, 13 Feb 2019 16:37:48 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 16:18:21 PST (-0800)
Subject: Re: [PATCH v2 0/6] Fixmap support and MM cleanups
In-Reply-To: <CAAhSdy25GUFWfkQHBDy6HysVCVFOpv-ZLY6vr+oH34XbqScYFQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-c25efbc6-094f-46ab-a4d8-480b53944cde@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_163750_903737_F63735A8 
X-CRM114-Status: GOOD (  19.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 00:21:43 PST (-0800), anup@brainfault.org wrote:
> On Wed, Feb 13, 2019 at 4:45 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Sat, 19 Jan 2019 05:27:53 PST (-0800), Anup Patel wrote:
>> > This patchset does:
>> > 1. Moves MM related code from kernel/setup.c to mm/init.c
>> > 2. Implements compile-time fixed mappings
>> >
>> > Using fixed mappings available, we can now get earlyprints
>> > even without SBI calls. For example, we can use kernel
>> > parameter "earlycon=uart8250,mmio,0x10000000" to get early
>> > prints on QEMU virt machine without using SBI calls.
>> >
>> > The patchset is tested on QEMU virt machine. It is based on
>> > Linux-5.0-rc2 and can be found at riscv_fixmap_v2 branch of:
>> > https://github.com/avpatel/linux.git.
>> >
>> > Changes since v1:
>> >  - Use more characters per line in changelog of PATCH3
>> >  - Removed #ifndef __ASSEMBLY__ from PATCH5
>> >  - Use more characters per line in commets of PATCH5
>> >  - Added PATCH6 to implement keepinitrd kernel parameter
>> >
>> > Anup Patel (6):
>> >   RISC-V: Move free_initrd_mem() to kernel/setup.c
>> >   RISC-V: Setup init_mm before parse_early_param()
>> >   RISC-V: Move setup_bootmem() to mm/init.c
>> >   RISC-V: Move setup_vm() to mm/init.c
>> >   RISC-V: Implement compile-time fixed mappings
>> >   RISC-V: Implement keepinitrd kernel parameter
>> >
>> >  arch/riscv/Kconfig               |   3 +
>> >  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
>> >  arch/riscv/include/asm/pgtable.h |   1 +
>> >  arch/riscv/kernel/setup.c        | 114 ++++++----------------------
>> >  arch/riscv/mm/init.c             | 124 ++++++++++++++++++++++++++++++-
>> >  5 files changed, 189 insertions(+), 97 deletions(-)
>> >  create mode 100644 arch/riscv/include/asm/fixmap.h
>>
>> I'm getting some git issue when trying to merge the third patch via email
>>
>>     $ mhng-pipe-show_stdout 4 | git am -s
>>     Applying: RISC-V: Move setup_bootmem() to mm/init.c
>>     error: patch failed: arch/riscv/kernel/setup.c:163
>>     error: arch/riscv/kernel/setup.c: patch does not apply
>>     Patch failed at 0001 RISC-V: Move setup_bootmem() to mm/init.c
>>     Use 'git am --show-current-patch' to see the failed patch
>>     When you have resolved this problem, run "git am --continue".
>>     If you prefer to skip this patch, run "git am --skip" instead.
>>     To restore the original branch and stop patching, run "git am --abort".
>>
>> can you send a PR with a signed tag?  I'll include this as part of the next
>> merge window.
>>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Okay, I will prepare a PR with following patchsets:
> 1. Fixmap support and MM cleanups (Author: Anup Patel)
> 2. riscv: minor fixes and cleanups (Author: Johan Hovold)
> 3. RISC-V related changes from "Various SMP related fixes" (Author: Atish Patra)
>
> All above patchsets touch same source files so this will
> help you.

Thanks.  There's also a handful of comments from Christoph that I agree with 
about the keepinitrd stuff.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
