Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCDBCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cP3E4pjmUV/VayD9OFAQyb05m2ZZHxoLThFgyOlYwCE=; b=NHEfIsgcLcgFKV
	W5VOCzypJIFvnz4BSnQaZhBbiJjid1VV+6HMha+Zx+lUtJ99ofstipHN5xBpvPZ+EczlU8iB5L0WL
	Y9xHKIMaS3ZYMYPQ+AX5R4SkPvbmG4Rcwqk/83J7HZ9chd59gC5L+EcKszcT1aVVoWaL3FPX9E4Mg
	EK1X550qYziYjPbutbO7Cq2UjdUzNe2oARm0ZqPlTf4itTH2EDAduqa8IS97C4/3gj2hIjkkK2O7X
	VrsgX8U7MtjhAaMWNcqbCkZK5yquGw0ue0RrF3Q9qcSKTkVfiLI6Cs2bS53tmL8zh1dvW1A+GBN5G
	ypzzyjF2rZqerkWt5ioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyI6-001NHT-33;
	Thu, 12 Oct 2023 16:12:02 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyI4-001NGj-1U
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 16:12:01 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so1540502e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697127117; x=1697731917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYS5W9Z03T6vrSfeNpNs82VdhyyCt8mPt+b9SqwDluQ=;
        b=JX1Zkb7IWjt0JFXbk9PF8e/fRRel9xlZ92LKq7uQK2x46OqtHYhJG7dAfVP26pJY0H
         bTM1pW1Qt0GVuvRI977b3hWRVa4CiwBOgz/R3xoDXUHBiQQ5A3XJKBMtqk56043KFx4w
         NPG/8nrbPXIkJmSIanyAGTwjOBWQcjCZQNob599ijEqPql9HWy7KvLLz+wVB5CGvgDut
         0/b6topJ1pmiZNBWpZdtVlPQy3hClxfx9nIA3WMuQEuf3ecIglpkKla4nRpLxdcJ+GHA
         qBzWinvoWdQYf5Q+mOvoj1iB9wBaSeU/SZHwS6jSCX59XlqoLhK0dgLR5g5zpA0boADM
         FP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127117; x=1697731917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYS5W9Z03T6vrSfeNpNs82VdhyyCt8mPt+b9SqwDluQ=;
        b=LyR1TJ9WrJgZ1tDzoMIqlDA7psbVxVUqGZqTD62Ycl1SQlgdCpsE1P/PC7u+/SWV0h
         3c3S0clhuh3E1dDsbKmnKCmuRqZ/243GTlEh1iSQiAnMqSK7GbLYAsZpES/o8yoO5Ftc
         IsmSZwZqWgWp3TgwH6XB3P6phReZMeTpCgH8njn886Zc99Ow/bbfrE3ARQFo4nywWywo
         mSShUy1mk2xRQom7BhPMWHIJ9UNdF0P8gi65XZRKRb/UVG6o6JIJt6g1kVTZNEV2KHvz
         Gn9F3ZzOoKBc+ynd1YCt5Y4hoR6oe7QCd9G4fRYruG6N6KYzdfsavShdnPUlXeSfiVYT
         hUmA==
X-Gm-Message-State: AOJu0YyhGXVvRYzEyGJOQr0bxox0/QGd9wIQY+C5KpjUeNBeU2ot/5p+
	/gKq7hhQ0O486RjyZaWywwl6OQ==
X-Google-Smtp-Source: AGHT+IFusfN3pG1qZtYVldE6+1L8PXpE8UERQFcUErZqbGPrMuCelJl2EoJRheYvp4VV2OT+gVqHDg==
X-Received: by 2002:a05:6512:3b28:b0:500:7de4:300e with SMTP id f40-20020a0565123b2800b005007de4300emr27804557lfv.58.1697127117151;
        Thu, 12 Oct 2023 09:11:57 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c00c800b004068495910csm215389wmm.23.2023.10.12.09.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:11:56 -0700 (PDT)
Date: Thu, 12 Oct 2023 18:11:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
Message-ID: <20231012-3dc2e811d6a57ffe90719d2a@orel>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com>
 <20231012-geologist-ramp-71c76a4305c7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-geologist-ramp-71c76a4305c7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_091200_495560_E31592CE 
X-CRM114-Status: GOOD (  15.57  )
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

On Thu, Oct 12, 2023 at 02:45:14PM +0100, Conor Dooley wrote:
> On Wed, Oct 11, 2023 at 03:56:13PM +0200, Andrew Jones wrote:
> 
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -0,0 +1,276 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * The hwprobe interface, for allowing userspace to probe to see which features
> > + * are supported by the hardware.  See Documentation/riscv/hwprobe.rst for more
> > + * details.
> > + *
> > + * Copyright (C) 2012 Regents of the University of California
> > + * Copyright (C) 2014 Darius Rad <darius@bluespec.com>
> > + * Copyright (C) 2017 SiFive
> 
> So uh, this is all new(ish) code, originally written last September,
> that is being moved, right?

Yeah, I just pulled the Copyrights over by standard practice of code
movement, but I agree they don't make much sense for the code I moved.
I suck at copyright management and would be happy for suggestions here.
If Rivos would like to put one here for the work Evan did, then I'll be
happy to add it. Or, if people prefer, I could add a Ventana copyright.

For me, whatever protects the open source code best is best :-)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
