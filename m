Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAC7C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rossn97COvbhAM4tyE3Dn5ViNRjIjrCCaF7AsagGsc=; b=TDbqMgEHoguryB
	eeey0e05wADvfszUlAOlXr+MQrXtf2Z9ovtlRD9HM5feW0F8PLqZws2Q3dd8jmhZrn1My4IThPi5A
	nq82L4HZ+fPqi21RP781zsaEO1rsPFPWuy9AQ/ZA1uNIx+13XQGtil/hIa2ZOqI/VZS9YImbuJubs
	kdM6mGhlUQHC8bdZrsd3xRy9nMNQfZxMtJOAfUpk+f2N3ZcRR/sm3eIdITR3nXXu1+gdAKBDjqcEB
	1/jsJk8aN5YRY0smlRdbleZ5l1ZanO5J7N9LV9IR/wlQWyWRmqPZJdz/GZNdseqxrz3qXKAXo+dwZ
	5bBUMwhrLpGWEe3kdgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozize-003gD2-1R; Mon, 28 Nov 2022 18:36:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziz7-003fg1-V3
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 18:36:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o5so9369384wrm.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 10:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nOZjMbMo96D7jK6HEe/+t9X8Bowh9uZiGdvN65gOws=;
        b=oEkLoWQGxOS1awqe7QmwayKLBEaAdW0933WHxdwnPkSG0HKhBsfcntFGwd0XZUGLOx
         WJzZtRhTclTxy/5XZvA2ptFPUJgGpzQjczqw4lzYHxaqlab2vdVBY33ydlUErInP0B2K
         5BW+NOvGtyLB5LbGfk5mALU8/Br4SH+r/B1x8A42nj2VYteNmgPmxWW1Au+SH1jQsjVG
         dhZZmSbmzE+KADACkDLyRT0uplk9eM3dqGL6y0Kez2HXrgzX5QFQl/QE51nOljeyJisc
         Hjhfa4QDLTWEQhzbJKG8NrB4vBrvlWrc/k5i+3eREwAjeEZw6zk0MO4NLzd0iWpi8NIL
         yowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nOZjMbMo96D7jK6HEe/+t9X8Bowh9uZiGdvN65gOws=;
        b=fBzYOc7lfcxY29K/c3OaPvgsaHOHTJLb/dXoBfiDB8EZ6eyfknLfkWV9dD//q+HJWB
         zOfmePtDSRXfmwV7xdnS/IUPccB3+BG9PRBLW7tRkSQtbjaX8lqSEhZQ5qY94uo57CFo
         VNmhids2uZVHFY4PFIVbAQVMJbTY3QWoxmWKIA/mCzVN3LHBP8CXB9Et6zg6A6I4CVPi
         /tSf25gGrRXRhZXSUgG/kvwM1sodk455Rk0P3k2U+h5daQBQUdIOQCzxolSNBXPSq6eM
         cpT48bRZQMzntgmGMshpJfaua/EEJP65jUiuaSA3cUQpgvbQKj4aA9wW2gKCeJ93GUNP
         XwXw==
X-Gm-Message-State: ANoB5pkga+OUWlimKimidSWi8WrhkLsokz0S3I9aIOLkQpZ/qeRvRZCR
	xGTO3x6pck3LOuSwvpGwEmX/RQ==
X-Google-Smtp-Source: AA0mqf7olKVFDTdYeQAjldLUgW4jENbq321Qdm1A37f0wZK0gRbWnumHsAsDgtBg3pXJdela/gsJJg==
X-Received: by 2002:a5d:5948:0:b0:241:ea80:878 with SMTP id e8-20020a5d5948000000b00241ea800878mr17223417wri.124.1669660561353;
        Mon, 28 Nov 2022 10:36:01 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u2-20020a056000038200b00241cfe6e286sm11391928wrf.98.2022.11.28.10.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 10:36:01 -0800 (PST)
Date: Mon, 28 Nov 2022 19:35:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Fix NR_CPUS range conditions
Message-ID: <20221128183559.5ei5fx4cl4mo3ioj@kamzik>
References: <20221126061557.3541-1-samuel@sholland.org>
 <Y4IxdOPWhLLg5rwd@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4IxdOPWhLLg5rwd@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_103606_060090_1368D401 
X-CRM114-Status: GOOD (  18.42  )
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

On Sat, Nov 26, 2022 at 03:32:04PM +0000, Conor Dooley wrote:
> On Sat, Nov 26, 2022 at 12:15:56AM -0600, Samuel Holland wrote:
> > The conditions reference the symbol SBI_V01, which does not exist. The
> > correct symbol is RISCV_SBI_V01.
> 
> Huh, good spot.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Yeah, huh. It never occurred to me that we don't have some sort of symbol
referencing checking in kconfig. Or maybe we do and I just don't know how
to enable it? Anyway, this issue made me wonder how many more dangling
references we may have. I wrote a script to look for them and found 29,
including this one. I'm not exactly sure how to report them since they
touch so many different places. For now, I've opened this kernel BZ

https://bugzilla.kernel.org/show_bug.cgi?id=216748

> 
> > 
> > Fixes: e623715f3d67 ("RISC-V: Increase range and default value of NR_CPUS")
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> >  arch/riscv/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index fec54872ab45..acbfe34c6a00 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -319,9 +319,9 @@ config SMP
> >  config NR_CPUS
> >  	int "Maximum number of CPUs (2-512)"
> >  	depends on SMP
> > -	range 2 512 if !SBI_V01
> > -	range 2 32 if SBI_V01 && 32BIT
> > -	range 2 64 if SBI_V01 && 64BIT
> > +	range 2 512 if !RISCV_SBI_V01
> > +	range 2 32 if RISCV_SBI_V01 && 32BIT
> > +	range 2 64 if RISCV_SBI_V01 && 64BIT

And for this patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
