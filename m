Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF53C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnIpseUPp8yeTFErykSxWx6WE7i+d5PuI1HXRWukEGo=; b=h8JTXnW2IazI1+
	RsueHbKDG5NEs6gC0RZyPVm47vRflZekOxBfIdvWI+N1aZofF65Bx1B7ahFVBBPYC6SP1WUDV3ymA
	VbHOuCvutM0SjDNVsOt+c3p+jsNTYclAQjjiFGMuYCAfhD4JaQ/5R/9LMapTYlu8qC+a5pysJ8T11
	0qffOWAWBp7fuW2w0QFmLKkjEPi8AA1qDmMPz5J889faZMoA3kTmwYZYHbgY/zotSkzsVBCCkDF4i
	c7F33vAVDpA/MhPl+aD3tnF/thH6RPIUDkTVJsBQYSFMYaM2YqCqUtqxpGZH5woor0303dYKncIK1
	Usez1PTYkbDjAjrV/OoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfCd-0000000CYU9-192u;
	Tue, 14 Jul 2026 15:37:47 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfCY-0000000CYT3-4AXh
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:37:46 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-81e8fa1b8d6so35906027b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 08:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784043461; x=1784648261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA6CdRsuIEfzWnFUXJQW7oI+G4RwVrl/m9/NqdXdUbg=;
        b=ZCXFfC4QyAkOaU6FH/07OfQRbUw7n5yKv5lCqIbTw19dpaWmPdkhYJ531sEgAYI6cR
         s2BtmbjXO/QLXPiQK76FA9vvyW8GlCD0tCibfJTQMzqhDDXfwxpaI7MgfZJ3AWNLFvpK
         jtjtydJ3c8ISjTuohrpUrmA6rxSuZwcrjC+hJ7k269qkNgx21SCDVPdJkR8nfq0OpbNJ
         cryp2R3+TwHAhTtxpxmv6XScwjruQ5Dx+Kz1tAFyyCnlybXNW+D2gdjrcfccNEW5zE65
         emprKFQxDjhYwgxigTGpmpYcDmIgFqK/CpaBgYIWflW3y4b+nmXsUNZFHPHMDskVAuuc
         UWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043461; x=1784648261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA6CdRsuIEfzWnFUXJQW7oI+G4RwVrl/m9/NqdXdUbg=;
        b=m30Cjflpp2iJ7QEq0byVbhcDSJtPFq0/BLiV8Jk/qLxEbWU44j3xJpE151eK8vknlV
         /YmbfbXJiVhLcV87hFPK22V96AurFAt4arta22894S3NJRAdXKzRf7hmoCiyCop+IYuS
         mvdK8ALf7iej4cPyk0xTzrLuUGjLjspMTN1kMr42od07q/LSTAip0PzBXbaaBZLRBj8n
         TOzxHBYj/YH1WbSiutlv7d0oVPLPYQwi+v6E0gbN1VGf5wzvLYbu8dL+C7XefwnwFwzu
         TX3++ETVLl+Sq5XE4e9m3SnhfqQvS7BiLNI3Pc25tcCrzh13OxyPGHPAshhpz73hOEZO
         L9Sg==
X-Forwarded-Encrypted: i=1; AHgh+RpuycpVLAMFi5vYqs5/ii+YAaD8qTZqU2JfMdHKTVRzQcWcjPf4yYcvzqB4IJkqyJbDPo8dsIHc6tSnzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZjNq74S3iBHcACf4Aa89t960iXFOuvjsk89OPNyut+Km9G43V
	ZxEZYIeEfSHiJcJUcxaW4qSyASUHkNZ0/6KHxNyI166YGgUN0jmuy1nog32YOs7m8pPLMKIhQwf
	WEsIgmTc=
X-Gm-Gg: AfdE7clZSVPQhHJjKm4g0i2AYXSsY4/yKbja71510Op0RdzACSh0DnpfIT/s8fJs4pE
	s3OfMmCY9qaGbhq21914YmbdqEm+zLmW1cY5gI3uG82z+bNLC5v8KehstW2Oty5qkOTh+cQzD/k
	3MINstQM2YT9yyCtUlWk6oWNV4mDmneiUuRW53Tp8JsqC2UcVRB5JKUGRVY0yqY9irrPk+Thwj8
	ZVNa/egGslnVxOj3ePkNJ165w6aT3UQQTdhSpMOVml6ZJIUi9DNa/lYlhHzvfaexgbjscwMQ5zu
	OBg79D1XStEpgwE11PH6ppKe8jdZ3WbbPwRhPUfNom5tuVaVZQqG5b6Lr6zIEQHHoKivKSe0p/c
	HsHYB3F5vFzBzn81kjMx+HlKGNdQxAndc/6MboPTQ2x50mx60SmvBe63NG17PN0LEF1BlMnaGCg
	eyfYdUn4gca1gUlVRbFISja+0EU0nzl2Ljkxd5kh4OSELFTUKOzPp2
X-Received: by 2002:a05:690c:316:b0:81e:6d9b:156e with SMTP id 00721157ae682-81ebffe8f58mr18337777b3.47.1784043461541;
        Tue, 14 Jul 2026 08:37:41 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1e5706sm144738627b3.34.2026.07.14.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:37:41 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:37:31 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
Message-ID: <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_083743_089538_D39F778C 
X-CRM114-Status: GOOD (  15.02  )
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

Hi Paul,

On Wed, Apr 29, 2026 at 07:41:54PM +0800, Troy Mitchell wrote:
> On RISC-V platforms where the entire physical memory (DRAM) resides
> above the 32-bit address space (i.e., above dma32_phys_limit), the
> current SWIOTLB initialization logic fails.
> 
> This patch addresses two interconnected issues on such platforms:
> 
> 1. Incorrect 32-bit DMA bounce assumption:
> The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> that a 32-bit DMA bounce buffer is required simply because the maximum
> PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> no memory exists below the limit to satisfy this allocation. Fix
> this by adding a check to ensure `memblock_start_of_DRAM()` is actually
> below the 32-bit limit before enforcing 32-bit SWIOTLB.
> 
> 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> For non-coherent hardware, a bounce buffer is still mandatory for
> cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
> Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
> from low memory, which fails completely when DRAM only exists in high
> memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
> permitted to allocate this alignment buffer from high memory.
> 
> With this patch, systems with non-coherent DMA and DRAM entirely above
> 4GB can successfully map the software IO TLB in high memory and boot
> normally.
> 
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Do you think you can take this patch in?

Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
