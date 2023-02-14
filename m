Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0705C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CI+PuF2th1lTA0qmImI+b3cHrDXTIk5STl9sdGwR1Q=; b=kq6ZP6se22ioeg
	QBY4YmWWnbzZk4A+Ky4+0hELoThXQzEMIHWCZkHljp0NV/fJm1Fc/tfqAs8fKZl9zso3fhU/jn9MT
	0fAydACJvuwp/HU/v9yYYxw94KBwsyqHjXxvUkwsTOj+DCalO519xFuogmpigpe/a7HIQuT8FpdkY
	tG0BeABQhlfhplXElfoVig0L/7S6PIfcrURpWUxNxtQuwNFxkToc/7KuIJ3V0UuXs3ynyrr8TvHIV
	3mqa8/mp9qP8guCKp/J5mW+ZsCPxCnWm1IsNDLfcB1XatLwTfic0iJOV0uROfwg6OnuTXOs8uQtrs
	aU4LCm2xG7wFeePI3+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3JD-003iIi-Q2; Tue, 14 Feb 2023 21:57:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3JA-003iHM-Ks
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 21:57:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id w11so25278307lfu.11
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IzW7EdWt+H2V3Kpy1BOzuIn0tS7BIsZLy45FNNVskpE=;
        b=m6cZUxfcZuoQo87I9BrwOtVNeBPdIrbWsZoY40av2UhL/nx1lWG+Mi9IYEme+H5sqL
         UpRuyH0anVyktuduXrWORwY9Uc4DZQBgbRJyebRz9M7U1xujvpSEX+hbZixx6b6cPTfM
         XUslox8Gm7hScgluBdfNiwl/HRPtDw1cOvrM61kwzE4E1HKK2h0KXCTiyXLQw5ErCeGu
         PAp13Jj49WXXeujXpumhodutTWO7CJh8TPtS9omtoVSvDzYEWwaXQXAtFd6snoLimJwk
         Qntbhu5FuiUN8ZnFdLjErGbZJqJxDauZ8t0HKyV76d18XO1be8q1n3CJGc5Xfwkwqlhq
         Atqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzW7EdWt+H2V3Kpy1BOzuIn0tS7BIsZLy45FNNVskpE=;
        b=apUj5mT2rM29wbvSEnL5tEI1k2JpVjhBdsUjxWtp2YfXtdMYexkhFikWx+0ugNjCfm
         aWCCy3bmKIwNrsF+JstPfsUwPQlLY07LmNwnJCQm9G9Y9krAeIlAj9PM1X+UKIh4jMRY
         RPqFaARt2+IwBM6++yotvcAhQVJLsqnhNSsLR0dM7ZPG27ojvhJmJOa/QthtTI9+JyP4
         UfGaisgV5cmaBaLjZNsr/v7s3RBvck16GlDmsxvcZ3IYSuPZuLxWR/OFb/hvcsgWSX00
         EgBGX9bCWyNiD2y3jsR7L2V+ZtCFnUHFTRIY6vOrzHuYvLHS/pVE15I2Zg4tCP6eLiQH
         eA2A==
X-Gm-Message-State: AO0yUKWAEWB2wWIwJ5GrCnLl3ZyojCtiWe6f1UGLlLlxSnuvHezc50oP
	4xhlqnhKoMfUzq1A7I2rJgkRm+1hjuSKLnQjgSfhVQ==
X-Google-Smtp-Source: AK7set8J6iKIR76FeerAHsSRTfApXB6vWeYie51yHarQ8akNmOtIbVvyDDDQIVgP2xsJFPM1ouMHew77RV4hIpUDfas=
X-Received: by 2002:a05:6512:ba2:b0:4d9:869e:5c54 with SMTP id
 b34-20020a0565120ba200b004d9869e5c54mr709041lfv.9.1676411869729; Tue, 14 Feb
 2023 13:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-2-evan@rivosinc.com>
 <Y+v/Yu/ELfzx954s@spud>
In-Reply-To: <Y+v/Yu/ELfzx954s@spud>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 14 Feb 2023 13:57:13 -0800
Message-ID: <CALs-Hss083BHj=bXv_nOqHXB8FNJEc4SSLW8ETqAh2+AmL0ocg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] RISC-V: Move struct riscv_cpuinfo to new header
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com, heiko@sntech.de, 
	slewis@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Randy Dunlap <rdunlap@infradead.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_135752_934910_9BB36252 
X-CRM114-Status: GOOD (  23.60  )
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

On Tue, Feb 14, 2023 at 1:38 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Feb 06, 2023 at 12:14:50PM -0800, Evan Green wrote:
> > In preparation for tracking and exposing microarchitectural details to
> > userspace (like whether or not unaligned accesses are fast), move the
> > riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
> > need to be used by more than just cpu.c.
> >
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > ---
> >
> > (no changes since v1)
>
> Really? I don't recall seeing this patch in v1? ;)

My bad, that's an artifact of the tool I'm using (patman) to help me
with patch formatting.

>
> >
> >  arch/riscv/include/asm/cpufeature.h | 21 +++++++++++++++++++++
> >  arch/riscv/kernel/cpu.c             |  8 ++------
> >  2 files changed, 23 insertions(+), 6 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/cpufeature.h
> >
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > new file mode 100644
> > index 000000000000..66c251d98290
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright 2022 Rivos, Inc
> > + */
> > +
> > +#ifndef _ASM_CPUFEATURE_H
> > +#define _ASM_CPUFEATURE_H
> > +
> > +/*
> > + * These are probed via a device_initcall(), via either the SBI or directly
> > + * from the cooresponding CSRs.
>
> May as well fix the typo here while we are moving the code & a respin is
> required anyway.

Will do.

>
> I'm sure we'll need this patch regardless of approach, so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thank you!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
