Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E002AC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 23:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0aKsgsRGMKDdD4mlcKnJ8iR5wfpfdHvFvRPMw1WesU=; b=ee3M3TKfb402G+
	tpK3VBwzlk8bUrm8m82Bi7sBli49nab2NV+8OMRjdktKuio0sDcr2AZndPPxEG03a7J1pxUHGYIeE
	lH/KZLf1Ze6OmdkO7KTdLwPsJmYxeWkFNHwGrtB6UsinZYHjqdOWNbWWJaREyNrG95dnyB/hl2qVA
	mGyfIUrEhOTPtqyGFsCfHKR8Hi5CZDToEAfUgj4JGYvFPbV2jGfPeQ+LUYHe5SSf+3JobYnT3UcZs
	c4gv1L7EvABXi4OFg4fIqT3hr7d3a5NYttFeVqJ/HohFRUzpT7F0MynSD+HKvBnWndiKDW8UOf6Ka
	8HCtuuKPRcaPK3Lad+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8sES-003x0c-H7; Tue, 05 Jul 2022 23:45:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8sEQ-003wrz-1b
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 23:45:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 667A0608C1
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 23:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A96C341C7
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 23:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657064724;
	bh=O2xYU5CkL9Ph+6qBDgbyB4cF2m+wiL5NvjsIa8CLe94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=slV3YB196w9HorVvSsTm1xGJRrM+oEDaoWrFaXMmFKY7GH8WkHha4ME61hXtk+l/F
	 0bL0tmXnIJ/3MmTHOQg5idBt8C+G3hnSSMR4sLJJfWD9ce8ezU1kpzketlpCKnQd29
	 QLLcQQ2S7tI+fuwZBRjYfmQgorZUtFTMN6LNb50C+s88zRKNKkGJAG+wEj+3+7KUwd
	 nRrdMpmenLvu1lCjBVjse1loGr2/jjqQRfPuo2yk4TASvvqezmbaUXfwetTY21FFhY
	 7iya+KYhTjBXE9k3rKCnjQxd10y61jkZIsqOHgSk29cNivKXL/+/wuft2nUqg8s65b
	 M7G4T6WH9njDQ==
Received: by mail-vk1-f172.google.com with SMTP id az35so6672891vkb.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 16:45:24 -0700 (PDT)
X-Gm-Message-State: AJIora9ulqMygvBURTMgg4B/6cbbG/0V8FpUdPEYdhvhIoWeAuWxXLRx
	CHeKvENGUFyipqMlWxTGFXZuJK1pJVkjMKFvp5A=
X-Google-Smtp-Source: AGRyM1vTjwWOcp8Cwy3RmMdv2I+UvsPY4j4YAm0a1NtBOOj3g5Gz089M9Ai7jowuYBNy4LAGi4qNj7VSG2Rh1KtL/cI=
X-Received: by 2002:ac5:cdcc:0:b0:36c:547d:d9c4 with SMTP id
 u12-20020ac5cdcc000000b0036c547dd9c4mr22374706vkn.2.1657064723716; Tue, 05
 Jul 2022 16:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220705100523.1204595-1-guoren@kernel.org> <20220705100523.1204595-2-guoren@kernel.org>
 <YsR0M9ZyyUJxSpOk@infradead.org>
In-Reply-To: <YsR0M9ZyyUJxSpOk@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Jul 2022 07:45:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ_E+etqErBA5-2T=-ihQ2L+k8==oUpgqw1T25_7Dgukw@mail.gmail.com>
Message-ID: <CAJF2gTQ_E+etqErBA5-2T=-ihQ2L+k8==oUpgqw1T25_7Dgukw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] riscv: Optimize satp_mode data type
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_164526_169546_BD665466 
X-CRM114-Status: GOOD (  15.44  )
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

On Wed, Jul 6, 2022 at 1:26 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Jul 05, 2022 at 06:05:20AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Fixup satp_mode data type. Use ulong instead of u64 for rv32
> > compatibility. Because the u64 type didn't cause any real problem, make
> > it as optimized.
>
> The changelog loooks odd, but given that CSR are Xlen sized this
> is the right thing to do even without further justification.
The last sentence is the reason not to add Fixes: tag.

>
> > -extern u64 satp_mode;
> > +extern ulong satp_mode;
>
> .. but please spell out unsigned long.
>
> >  #ifdef CONFIG_64BIT
> > -u64 satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
> > +ulong satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
> >  #else
> > -u64 satp_mode __ro_after_init = SATP_MODE_32;
> > +ulong satp_mode __ro_after_init = SATP_MODE_32;
> >  #endif
>
> And maybe make this less of a mess while we're at it:
>
> #ifdef CONFIG_32BIT
> #define SATP_DEFAULT    SATP_MODE_32
> #elif defined(CONFIG_XIP_KERNEL)
> #define SATP_DEFAULT    SATP_MODE_39
> #else
> #define SATP_DEFAULT    SATP_MODE_57
> #endif
>
> unsigned long satp_mode __ro_after_init = SATP_DEFAULT;
It a little involves the other coding convention work.

ulong satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ?
SATP_MODE_57 : SATP_MODE_39;B
The above seems readable & clear to me.


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
