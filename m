Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A77C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQqM2157SEuoZAvCpwZUN9KV3obn2Kwc45w0EJHm1Kg=; b=14TzjPttOPBgYg
	qFR8/ix7XrpHx04d65ziwBSpGXj5JEbz5RkJXLL9MbRLGsGUwi0CEbtsRQbukzCseSGSANvkLnk9Z
	GuFQvJqWetfRE6KpzCJUv7lJLM11nAkLmJ6VwRDhMzcnTaAxgFv9U96i0DAim8iBkiXIcX4yy5pXB
	u7eRXNvernkxkJHMLMb/l+N5pY79eZCCsDOs0XptnvWziVdy7okCQtqKagC18WkXopqTUKmN9zHgZ
	iahZO3l8wrKyGFbQrCH+K9MFJQJLRBtv3T0iDfvBgoypL+ZvWYCY3hogt6bom94tWWJW9xe3E0wSx
	45uRAG00/R2gsMlqYMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT6I-001Tic-4z; Fri, 24 Feb 2023 08:06:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVT6F-001Thh-VW
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:06:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id m14-20020a7bce0e000000b003e00c739ce4so1183821wmc.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 00:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y86AqSVNy/L2Mo1XNuLub99aFp5gaf/Oj9LPE5YY7h4=;
        b=XGCeQoYPcV17aVSQLr6VbQSeKzge6EZF5zIqIiKjCj30YbSoaXLjxpvLQGlUCFXWkw
         RiN4yDV+tZbiXs4ZqchWTg97nEZW1iyWcbFZ9tf132r2yDQSkHQQwsH8GWcG//jhlz3q
         qBTICLbkgrHdhILW0gHmTW7treI7h2Xp+t+zj6Nz9dN3CEwqTyKD1zJ4e+vSHRzEnr5f
         1N2oytwGxmUYKV5GOnDkgn7gc6gG1l5yxqcqE9fRq/TjfBm36FJQWrCcrz1ZZrcVXldh
         RMgPAJtjkSXDB5F3AeBgciA1yTkEb3GlSze92OVupPceL644psn6BinRYUwTJEZ6eddt
         cjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y86AqSVNy/L2Mo1XNuLub99aFp5gaf/Oj9LPE5YY7h4=;
        b=C3SZ4HwlxgKqXiDQKGosYNnmdzFR4K8WCh6R81VOxqxyFPshDQG3FS/Sr+jHLbu1DO
         N0PJOj8pzR7664kOKagdXOSa6rRjw2JSHm31iTtXZs+csr3iT7bYb5SGaHpWsMhh0tg+
         wn6QJn4ko7HCMWwmA2nk5/dCjoNZA0sw7OtBUoPmlu+XqhzvmK+oF7zF32obC4kUAGR0
         sg2Mz7zV3uUD9GfIPjKUzSBZ3qZbBFVG8AD8SwDTa7RDf8IJoozHyaKkOpUvre96BKFE
         jiBTylwLY7djlDN5GK0eli5J7RkP93bD6rthqNvTP+A/Vjbra5IeszuWcQgznurlIuFG
         giVg==
X-Gm-Message-State: AO0yUKUK3Rc+onVWPLgSJL5Sino7PAwUE44swsf23ELjO4lhNVZdbF+T
	IoXmG+htMOPquG25Jf2Ghw1YZg==
X-Google-Smtp-Source: AK7set9t7S4XdZ3PG1brtxfBVWOGtbYRIbUpq09Rh8w8mtLBxPewwgtNQWbTVkZ8e1ncLAeqF3TNXg==
X-Received: by 2002:a05:600c:3b26:b0:3ea:f882:bb3d with SMTP id m38-20020a05600c3b2600b003eaf882bb3dmr1613404wms.4.1677225997228;
        Fri, 24 Feb 2023 00:06:37 -0800 (PST)
Received: from localhost (78-80-61-208.customers.tmcz.cz. [78.80.61.208])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c210900b003e2243cfe15sm1904162wml.39.2023.02.24.00.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:06:36 -0800 (PST)
Date: Fri, 24 Feb 2023 09:06:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 5/5] riscv: cpufeature: Drop unused includes
Message-ID: <20230224080636.bxqypcslzer5b3nf@orel>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-6-ajones@ventanamicro.com>
 <Y/f25zqMFNDWD2ix@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/f25zqMFNDWD2ix@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_000640_030060_14A23F42 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu, Feb 23, 2023 at 11:29:43PM +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 07:56:03PM +0100, Andrew Jones wrote:
> > Do some additional include pruning while dropping errata_list.h,
> > which is getting dropped, since cpufeature.c includes hwcap.h
> > directly to get cpufeature IDs.
> 
> This commit message is a wee bit confusingly written. Not advocating
> for a respin by any means, but putting the thing that motivated the
> change before the opportunistic cleanups would have made more sense to

I'll rearrange the text for v2.

> me. /shrug
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 85c99ae64017..151e1a715db9 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -8,19 +8,14 @@
> >  
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> > -#include <linux/libfdt.h>
> >  #include <linux/log2.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> > -#include <asm/errata_list.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/patch.h>
> > -#include <asm/pgtable.h>
> >  #include <asm/processor.h>
> > -#include <asm/smp.h>
> > -#include <asm/switch_to.h>
> >  
> >  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> >  
> > -- 
> > 2.39.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
