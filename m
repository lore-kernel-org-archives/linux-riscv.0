Return-Path: <SRS0=216k=BM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF46BC433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 18:02:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3FC20738
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 18:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zWE2wZoL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uIs7/vU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3FC20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vX5+AkMNbHUyPEXk0y30CsW8AesC4S7dFR+cmsUhaOY=; b=zWE2wZoLGKNM0OzIBPy3VGDtt
	RXbC/qON30eiThV7pcRdrPfViwV/mDl/y9Bg+rF/dM1T/V/SAghqn6axLWP5rjR2wqOG0FHqRBeBb
	QfYDR0ooMhQp7eJvceYnsjLm+wHpp7kWe0jT9nDO9JLK1NA0bRems9U5570+k2pOBAeEhqBtUTs+J
	zXVF6NYZcxY9CwkNJwL1uv357oynawxrO5o2VaE5v2aufXkPVNDZLlj/hcFVB1fLbbyaVowoRRbLf
	C2uzlQu5CgumyvbrPh5HEnRjyzfNBVBH1lBewjUnoY7z7UiaxwhvYGsVNeQqBO2L9LfJ+UmqJBnRM
	EESib3ygQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2IJb-0008NT-Lp; Sun, 02 Aug 2020 18:02:31 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2IJY-0008LO-1z; Sun, 02 Aug 2020 18:02:28 +0000
Received: by mail-ed1-x542.google.com with SMTP id o10so15991898edh.6;
 Sun, 02 Aug 2020 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hIidJgHuEfm+QUxSjJcyWhB4lu2Xjl7LW3yKbJJeIh0=;
 b=uIs7/vU9Kx/pklkEtgD7hBiuHs6a0R+dGlNTjUGRPw721sRkbKusjxGi7PfHcXOJ+P
 EjAE8Vd54opYw74GdBkeR4XNF5IP2MPUk9fmgk6V6Ahfe99oRVQ2eTOjx4V/HNnjxo1p
 8JTL4om9ZC3cnlFf7IvLus1+6HB/iVpPvgkNBuxCV3vkFTVqsYvmHOwMCmyNnjJul9R4
 NyUbZELRb/+vAfU647duOFbumJn5NHcHvq2jBsmvofhPXlaOdyNnECGIYrfm3l1GH6Kt
 lYQels7sHnZLCY218xDI/G+/wAKH/pz8dPVH6DrvKapbnVTrwoCPcuTqLRUxp8GcwS18
 4m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=hIidJgHuEfm+QUxSjJcyWhB4lu2Xjl7LW3yKbJJeIh0=;
 b=ujSAFqlEHsDzH/wibsHfGtbXP/AAfUi9kbskqF69ZUyM8eXnWODzaHRBarlwJsgex0
 /fVtEb227R6Ha9AkxVgl3jX02YtACGRfOcMg5++/vJst26vPdXjPgUu0egvGa90L6iy/
 B+sJ2lMGEfcDr+HZcUSJHVwa0dfc2Z/mZIUBCM8qBsnHY4PyjwSoPgRy9EqYI6lJuHfV
 pjvD6W5JXU9HtTkF6mFaLXnLMSqLSmRDWHicl6ux5dIJ8R5iZv5eE9sIt6AugNupSSpB
 0+IuHBYPYBKBuMCz5LWTKQLppYTyraCm0fYuPD0baXllqLxjUnCpu0XgOLiyX4LYDjEU
 WqAQ==
X-Gm-Message-State: AOAM531M2rL+VIAvwgX+Il38fY4PxTc+9bfc9UQAcR5BIcBYI/6yA6Tg
 a4SVOQa4U8UvIaY7X7SWL0Q=
X-Google-Smtp-Source: ABdhPJxqUvJyL87Stg26v1+JoHbkpad0yhpL8P6CjttoB9bwnL2tuiWl2R60zFRBWtP21v7K7J2UFg==
X-Received: by 2002:aa7:cb15:: with SMTP id s21mr12929126edt.175.1596391346876; 
 Sun, 02 Aug 2020 11:02:26 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id j21sm14090092edq.20.2020.08.02.11.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:02:26 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:02:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 14/17] x86/setup: simplify reserve_crashkernel()
Message-ID: <20200802180223.GB86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-15-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_140228_135281_6930E30E 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


* Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> * Replace magic numbers with defines
> * Replace memblock_find_in_range() + memblock_reserve() with
>   memblock_phys_alloc_range()
> * Stop checking for low memory size in reserve_crashkernel_low(). The
>   allocation from limited range will anyway fail if there is no enough
>   memory, so there is no need for extra traversal of memblock.memory
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Assuming that this got or will get tested with a crash kernel:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
