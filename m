Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D51C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 09:17:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD85611C9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 09:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD85611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xc8jlUvQtiu6zxB6bgTK408EJYJ4iElwR6pv5ULWb1o=; b=b2CePpd6aD30Nsg6xLIoL/TK7
	Mpg+9csoI+1YqF8NMh4whPmtnFPegb17UZRYIcz0alsGrDR+/5xh1+hCYT8EYa1GzHlQIQLhZdAFr
	e48gi4MF4JjVn8ehRT4zqywKu9qocbY1lGOw+86CHV9kRTeL4egOkpYSSeF8T6aeOuKumyc30jUFd
	FbSlLpx7SZLJKE8s3tOurE6nUsSqk4nAPT5ydt3udyjac6fBS76JFdXak4xr+qHCkUZ2WR8GNu0gO
	WW6OpRd7H0gn+Qy11cXbu0cuw16/o1MPUhmFTqKkNveV1m3doX8TfI/eUnj9l7kqKovxeATfYd0Wk
	driV9dhWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWbdf-00C7Kk-TU; Wed, 14 Apr 2021 09:16:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbdc-00C7KW-Sc
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 09:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=yUKHKB+V5H8dUAiGZbJrFX0fnMyjSFlwunjPC1r4S+8=; b=HOYlAih5y7EBPWcXsvg8WNAXQJ
 FEpbPP94sglcKpzZytvv4YrwQG5mgiLTIoYtpzRWLAtzjNnQ/sIqOFl1fECsCLO9DFwFfURLRT3B7
 Ii9jbYfcALwkw2i64pvXCZVBSMI5X9bR7DxpLDRHWlVuS86w5tiDQwBbcaNYJH8niuSFhclZKIVBj
 EVmbn6JAmsySGU6QcpMUn0vzBCn8Z8/tLUVmChV7F5ganZLvq30FLQ+mvYFzAWVHgGETkOFPBqorc
 Mmi0I6N+ZemsncvvYzP38luZO9+fAFAuiLGW6T36USN/jo/gsamJZCQ4plTX/XsTiXFKkiaUrCqXF
 Dq8tI5jg==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbdZ-007e97-P4
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 09:16:43 +0000
Received: by mail-pg1-x52f.google.com with SMTP id j7so4549914pgi.3
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUKHKB+V5H8dUAiGZbJrFX0fnMyjSFlwunjPC1r4S+8=;
 b=WQ/HJS/WRTpXqT9pdtTnpECEN0jLG1Q0EG5TGIesfGM98eg4eAXypwvCnl+em4WRS3
 JVgC/vRDah+VSLHwUMOweaHAGBlKcXG1ILdpgojFr6VFutwSDuvhxOLazsWf8PQJm7nu
 XdG1yrEnGP4l1GhCxVzX7oIN2BxGb+LvjrWNgkOtTmFo6cSQvsk0o6vqqBHBybcau7U+
 ekQGS07FgjtQ+vH8o9KtRx6vqea20RocvxPFHDWlagKGfjtH+8KueInEzu15WQtR+8eZ
 9/PNC0zzi7cKmVEcgZr/kHdEMA8Eoc3xJjHdDSK5hQCefdfpqPEKrvqa5sDOjwDIF2XI
 djsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yUKHKB+V5H8dUAiGZbJrFX0fnMyjSFlwunjPC1r4S+8=;
 b=nmmd/iE0cw/YarOV/lFTbd+vY9VO7KLqZo76AI2zGY60awOQUnJwJrUZaoExma7iZB
 y9qvKGW0sMtbVmhH0nnZ4D0zspL2SXWSF5cmgsS/hJAY8bo/WwCcQaEwueWrfuYW1grO
 lVVF4TCQp4t3IFhFKDS7ydv0E7suenNpUw9XfTEfzYdDH+ygFQ6uU6ooAyeoif638sjx
 yZAWMl/EKNJK3Wwage4GbbMQgzNxnVXDvdCnE9dCVveteevdxZMSw5RCDEpRvmpvUCso
 8o7J+IQslk96ock7g3upT9MPawOsuNjpmvHUduEnGUupGQoAkZaYBaR38YrYsD2eTqiI
 Y6qg==
X-Gm-Message-State: AOAM532glvwglegQUeivvKczZypPPbkQhYuhxNVFpWLbRVRm8+9paIQS
 CoKsWgTmowmzTJwWbXIPoEtKFA==
X-Google-Smtp-Source: ABdhPJzCZKNt5XptTVToHYyMvOfdvSlm6eAy3Y0NSlPvGMTscX6/QCrkUYH3Y75IpqVzljYp2nSvWA==
X-Received: by 2002:a63:707:: with SMTP id 7mr35442934pgh.319.1618391800504;
 Wed, 14 Apr 2021 02:16:40 -0700 (PDT)
Received: from nuc.localnet ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id v6sm11267255pfb.130.2021.04.14.02.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:16:40 -0700 (PDT)
From: Jiuyang Liu <liu@jiuyang.me>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Alex Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] implement flush_cache_vmap for RISC-V
Date: Wed, 14 Apr 2021 09:16:34 +0000
Message-ID: <9908880.BHKHtspdbC@nuc>
In-Reply-To: <18d198ac-7bc0-934d-e1e9-eca01b790d61@ghiti.fr>
References: <20210412000531.12249-1-liu@jiuyang.me>
 <20210412150817.33f49be8@xhacker.debian>
 <18d198ac-7bc0-934d-e1e9-eca01b790d61@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_021641_981655_65D166CC 
X-CRM114-Status: GOOD (  27.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wednesday, April 14, 2021 7:03:13 AM UTC you wrote:
> Hi,
> =

> Le 4/12/21 =E0 3:08 AM, Jisheng Zhang a =E9crit :
> > Hi Jiuyang,
> > =

> > On Mon, 12 Apr 2021 00:05:30 +0000 Jiuyang Liu <liu@jiuyang.me> wrote:
> >> This patch implements flush_cache_vmap for RISC-V, since it modifies P=
TE.
> >> Without this patch, SFENCE.VMA won't be added to related codes, which
> >> might introduce a bug in the out-of-order micro-architecture
> >> implementations.
> >> =

> >> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> >> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
> >> Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
> > =

> > IIRC, Palmer hasn't given this Reviewed-by tag.
> > =

> >> ---
> > =

> > Could you plz add version and changes? IIRC, this is the v3.
> > =

> >>   arch/riscv/include/asm/cacheflush.h | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >> =

> >> diff --git a/arch/riscv/include/asm/cacheflush.h
> >> b/arch/riscv/include/asm/cacheflush.h index 23ff70350992..3fd528badc35
> >> 100644
> >> --- a/arch/riscv/include/asm/cacheflush.h
> >> +++ b/arch/riscv/include/asm/cacheflush.h
> >> @@ -30,6 +30,12 @@ static inline void flush_dcache_page(struct page
> >> *page)
> >> =

> >>   #define flush_icache_user_page(vma, pg, addr, len) \
> >>   =

> >>          flush_icache_mm(vma->vm_mm, 0)
> >> =

> >> +/*
> >> + * flush_cache_vmap is invoked after map_kernel_range() has installed
> >> the page + * table entries, which modifies PTE, SFENCE.VMA should be
> >> inserted.> =

> > Just my humble opinion, flush_cache_vmap() may not be necessary.
> > vmalloc_fault can take care of this, and finally sfence.vma is inserted
> > in related path.
> I believe Palmer and Jisheng are right, my initial proposal to implement
> flush_cache_vmap is wrong.
> =

> But then, Jiuyang should not have noticed any problem here, so what's
> wrong? @Jiuyang: Does implementing flush_cache_vmap fix your issue?
Yes, I just checked this today, it did fix our issue.
But I'm happy to rework on this, thanks for your help! This week I will try=
 to =

trace wave of our core, and give a more detail email then.
> And regarding flush_cache_vunmap, from Jisheng call stack, it seems also
> not necessary.
> =

> @Jiuyang: Can you tell us more about what you noticed?
> =

> > Regards
> > =

> >> + */
> >> +#define flush_cache_vmap(start, end) flush_tlb_all()
> >> +
> >> =

> >>   #ifndef CONFIG_SMP
> >>   =

> >>   #define flush_icache_all() local_flush_icache_all()
> >> =

> >> --
> >> 2.31.1
> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks,
Jiuyang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
