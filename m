Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19665C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 15:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEBC9604E9
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 15:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEBC9604E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IBWnT65k74SbYLurP91YHfopQE6EcL7F9rSLNIqFAbw=; b=swsw+jTsVWJFqw
	hjFA636sjSIo+ouS5ANSE5EcUfOTmZNA/K2wcZ9ArJ3pVu/cKHeKJ8dy98jNjGXF9vHc09ssLdyAO
	ozqSbqfc7AGGF1Y3fdZ4MwGbGbaeJNzI1+bnNWFJBbBGSbJXdHK0gDWVy9UnlWTVjHK1dpYa8E80K
	I83MSnxt4aIVzRDsm/Zpnz4D1X/Kt1VdXXQVw/OtXlsUnBmFNlM67yPgZhWHrkqceUXl/0cIg5aJj
	Vp6SHwdEY+h99sG8TID4rkNNZXluDgll7reasrrbNBeNhEht3FfrWrCGSH2EtpYa4wGR1v/Eu7zx1
	WIoE6q+TBRKk8u1/PyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZETm-005lmA-17; Sat, 09 Oct 2021 15:41:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZETi-005llS-95
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 15:41:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id r2so6215423pgl.10
 for <linux-riscv@lists.infradead.org>; Sat, 09 Oct 2021 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=0gQT1wDNziElgFccRviJGzaeuhF8bzANmDqRrn7eERw=;
 b=6eF0EPdFNDsqwF05KLJBzQZIXqTbjSrF/+ogFX2DV19hbeyYOOb8Ar8FGLdrtptK5T
 giTmLcHnCQJcVLYwWn3tv6SjAIvmIG1NJnhPY+lbkEs3BXzJbNDmPYFdEm8pASl6LcY3
 B9VVtF+Pf0mEDmGa5S3qkQClOcnlE8m6xvJPqvwkP91TXQljbNhZ6S4bctF28NfPkJiO
 N0/jpNId9M3H/wWx2l8khCtNC3o1pDzuAIllN2sIgPl6KDpdB3eDN2ZzoFt+/6MgU4Ko
 veIgQ8gvhZfxIkGRagM4/tpFeEQlX2xw0zLSyVJ1IbPnnWfmHd+7r40cqexSWlt7heEr
 LjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=0gQT1wDNziElgFccRviJGzaeuhF8bzANmDqRrn7eERw=;
 b=hB6/lHhcl2NX8IgW9neALfxana2/5z/y2yS9J/AnTY8Hl5CvlAL+zA3IhbiQQZDTDv
 9OHEZHXGkIw/LQF24s5UDWHqJtHMuT8fpR720kMsvp/Y9Tx7N82zdbSjgGt/em2VoE+H
 UlU2uANeXdgxDCr5Q6fufcg0sc03uLQalxWCnklra9lv+Q0Ylbtv7h5whRD5+dXqpMgx
 PKfdhvnKGjg1smMOeXTwKzKApqUmiwhMoXmCZLiFZ8j7BfEiS7T4x9pH3nozEJrwcyJ8
 /r2UaYtecyWOHkNberPdXCKq50SH3lIeLc1N3u0YvCYwr15fSC2eyWjiqY4BW4H42C7l
 hbsQ==
X-Gm-Message-State: AOAM531yhCeBqOdr8C7ytNCDZishd9Buz2n+cui1kR/d4Z4gcn4ZmA1N
 fao8hfOO8PvSohSBOdqPRRbnvdN0ZH/zdQ==
X-Google-Smtp-Source: ABdhPJwotUF7gJqBKy6Z/80gjOF943OgJqU4wLfmFLwu6aHzRApgRBXwzM6qE+CBXW5RTEgn0Kmgsg==
X-Received: by 2002:a65:6158:: with SMTP id o24mr10132170pgv.141.1633794097133; 
 Sat, 09 Oct 2021 08:41:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e9sm2611981pjl.41.2021.10.09.08.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 08:41:36 -0700 (PDT)
Date: Sat, 09 Oct 2021 08:41:36 -0700 (PDT)
X-Google-Original-Date: Sat, 09 Oct 2021 08:41:26 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.15-rc5
In-Reply-To: <mhng-26107d68-d2af-46eb-a8a4-43c1496a9ef4@palmerdabbelt-glaptop>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-8bd1a7b1-4ed8-4da1-b2eb-96b189dbadea@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_084138_394281_30A0A8E8 
X-CRM114-Status: GOOD (  15.46  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 08 Oct 2021 21:38:14 PDT (-0700), Palmer Dabbelt wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
>
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-rc5
>
> for you to fetch changes up to 3ef6ca4f354c53abf263cbeb51e7272523c294d8:
>
>   checksyscalls: Unconditionally ignore fstat{,at}64 (2021-10-07 17:16:28 -0700)
>
> ----------------------------------------------------------------
> RISC-V Fixes for 5.15-rc5
>
> * A pair of fixes (along with the necessary cleanup) to our VDSO, to
>   avoid

Sorry, that should be something more like

   * A pair of fixes (along with the necessory cleanup) to our VDSO, to
     avoid a locking during OOM and to prevent the text from overflowing 
     into the data page.

> * A fix to checksyscalls to teach it about our rv32 UABI.
> * A fix to add clone3() to the rv32 UABI, which was pointed out by
>   checksyscalls.
> * A fix to properly flush the icache on the local CPU in addition to the
>   remote CPUs.
>
> ----------------------------------------------------------------
> Alexandre Ghiti (1):
>       riscv: Flush current cpu icache before other cpus
>
> Palmer Dabbelt (4):
>       Merge remote-tracking branch 'palmer/riscv-vdso-cleanup' into fixes
>       RISC-V: Include clone3() on rv32
>       Merge remote-tracking branch 'palmer/riscv-clone3' into fixes
>       checksyscalls: Unconditionally ignore fstat{,at}64
>
> Tong Tiangen (3):
>       riscv/vdso: Refactor asm/vdso.h
>       riscv/vdso: Move vdso data page up front
>       riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for write killable
>
>  arch/riscv/include/asm/syscall.h     |  1 +
>  arch/riscv/include/asm/vdso.h        | 18 ++++++++----
>  arch/riscv/include/uapi/asm/unistd.h |  3 +-
>  arch/riscv/kernel/syscall_table.c    |  1 -
>  arch/riscv/kernel/vdso.c             | 53 ++++++++++++++++++++++--------------
>  arch/riscv/kernel/vdso/vdso.lds.S    |  3 +-
>  arch/riscv/mm/cacheflush.c           |  2 ++
>  scripts/checksyscalls.sh             |  6 ++--
>  8 files changed, 56 insertions(+), 31 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
