Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D74C2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 17:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B696A616E8
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 17:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B696A616E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VV5VarPBb63Bw1jwT9JnGlSFIuhKkl7mK1DwaJWXceY=; b=UoVuSNqauyRkO+
	/ZG7WcPkMPhUnqfDq+/o+GgWRGKcKuplnwPs91xB0LrDpvkRMLp2/WTCts8jKQykvQPv815oYulA7
	elw0lKNcMMOZ3zc+dF50Cs+X740n2sgv/JgiU5CU1fZsqa1XYaAkpmJ6pfVmuZDaT/bvl0hshTHAn
	54l39phbqSYqviOwrL0qHCAzG2otf1lDlVQPwJivRA7Mszzcpp/wSZmNTcwQW/FbhSIJ70jlPD6WR
	dY9LoEHQiphKmDtjyn0IkLMOn8FGY0Koaa2TEkz47PldvygJM8qfDP+bT4kVeODp5Jb4lGt2LQnP5
	KDizJmDPZCQ6NU5t36mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwptl-002VZ0-WE; Fri, 25 Jun 2021 17:45:50 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwpta-002VWb-EF
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 17:45:40 +0000
Received: by mail-lj1-x229.google.com with SMTP id x20so6783890ljc.5
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jun 2021 10:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iNeEazWas8i0I5pBcB4dOYRPkmz0cs96RkB+Oe7gaq0=;
 b=Ac52bmzzRQZNPpekUSeIo1vprJWyBsB2D6XCnvGCluM4dZ6WZ50+TRJJJ4HfCWDmc9
 lumagY+Ziz6bqZpSUwMJMGnnb3wFVrYOKlk2H4g2BdjjEegYbXywOPrugRhUyFZ8EZcd
 H/RX38fv0SCz4uA5bAdae+IsRb5zWoJuz2/b+jR4taXazXvI2I/Qo8XMgVUwoJdXTNgk
 JBhubaIYShCYoBwjrNkfKm2CRjLyaDCmVg6xqtCTcecTIVFdgae/qsV+tUcwFAsyHMc/
 DYA8muvxRDkFZ1xbrxJFyLIlv+03s+rWFjvYrYMOuqd/uzLpDZ/4OvUVH96/F4maQFAb
 NXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iNeEazWas8i0I5pBcB4dOYRPkmz0cs96RkB+Oe7gaq0=;
 b=YNko5rBl/40rJiy+WcVf8V7n2tXVhVyEbBbVkBRMPvcW5zQWHNk6tWI7z5/vgMdNWK
 FfT5+NV0rjvl9Ojyfy2Jk7n7OeEjC7D15QUMODBiuFaMnfN7BuottrV2bFGrMYMzLpYK
 QimUNs5feaZPdXQWnk4c1pqZjXMvQjMT6FB/JpepgXHgt4VuPzR7Os+4TXqAiisC8p+u
 yLgjNA7TwvZxYT2i1EIyFPQFiTTi69UuwwjctjeMJJi+3TGp3ByoqW6lLZUQvfoptpi8
 a+5/8+6xN2pwx9+7uqnWQYlqW0N6npIjGfAeYqZOkrFAXcf923zPFKXb02bycvF//l/q
 WrLw==
X-Gm-Message-State: AOAM531wmTEciyQi2FjtMO0wqQ6ANK0TbpzYKKYXg0RzppaqSSo1ZR9X
 86nClHf8OOdCNeEteaKgORWTUwuSjOK4MsPDrj6XDA==
X-Google-Smtp-Source: ABdhPJyKg9KDZxebXTZT/Q8tKpmXlmmJWeK8MlwoundUry0HUACHyeyHhEnBID/ZTAlR9vDWotblOTcc2rQdjLigUpk=
X-Received: by 2002:a2e:a492:: with SMTP id h18mr9229016lji.495.1624643133384; 
 Fri, 25 Jun 2021 10:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210625010200.362755-1-mcroce@linux.microsoft.com>
In-Reply-To: <20210625010200.362755-1-mcroce@linux.microsoft.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Jun 2021 10:45:21 -0700
Message-ID: <CAKwvOd=rzoCFtUPrB+Hh8ZneGJwKc_2jW=QN6apb4T033r+kYg@mail.gmail.com>
Subject: Re: [PATCH 0/3] lib/string: optimized mem* functions
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
 David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>,
 linux-arch@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_104538_514294_22E5F6A0 
X-CRM114-Status: GOOD (  16.89  )
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

On Thu, Jun 24, 2021 at 6:02 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> From: Matteo Croce <mcroce@microsoft.com>
>
> Rewrite the generic mem{cpy,move,set} so that memory is accessed with
> the widest size possible, but without doing unaligned accesses.
>
> This was originally posted as C string functions for RISC-V[1], but as
> there was no specific RISC-V code, it was proposed for the generic
> lib/string.c implementation.
>
> Tested on RISC-V and on x86_64 by undefining __HAVE_ARCH_MEM{CPY,SET,MOVE}
> and HAVE_EFFICIENT_UNALIGNED_ACCESS.
>
> Further testing on big endian machines will be appreciated, as I don't
> have such hardware at the moment.

Hi Matteo,
Neat patches.  Do you have you any benchmark data showing the claimed
improvements? Is it worthwhile to define these only when
CC_OPTIMIZE_FOR_PERFORMANCE/CC_OPTIMIZE_FOR_PERFORMANCE_O3 are
defined, not CC_OPTIMIZE_FOR_SIZE? I'd be curious to know the delta in
ST_SIZE of these functions otherwise.

For big endian, you ought to be able to boot test in QEMU.  I think
you'd find out pretty quickly if any of the above had issues.
(Enabling KASAN is probably also a good idea for a test, too). Check
out
https://github.com/ClangBuiltLinux/boot-utils
for ready made images and scripts for launching various architectures
and endiannesses.

>
> [1] https://lore.kernel.org/linux-riscv/20210617152754.17960-1-mcroce@linux.microsoft.com/
>
> Matteo Croce (3):
>   lib/string: optimized memcpy
>   lib/string: optimized memmove
>   lib/string: optimized memset
>
>  lib/string.c | 129 ++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 112 insertions(+), 17 deletions(-)
>
> --
> 2.31.1
>


--
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
