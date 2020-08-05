Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0E7C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:10:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC161206F6
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZAgvJnL+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdzmbMML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC161206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4C5xhezGNOb263KtuhXDbfVReQhhA5YHyQRZF4dfRWQ=; b=ZAgvJnL+msKQjTcKjtbN6wX8Y
	11bW0TG4LRcA+sW2ovgT/AEbMBVaZB/hGw/WJr43dW1I0giqkvSq6yK6WB7kk7nFwTfKTQUS9YRBQ
	7b2u9KqJgZTUNEASF0S/x0e/K6LXz8bOdoH/8MnZLyd143w1YP39xriygMgx80kTELNtm1mbaldNy
	9r52JQ5TKFUagBaUXyR6MpjUmFaLabDX5cAj+LSbZOH0dRWp3ZpHuPj2ToJ74rBqeryGnSxvQ16yo
	h1wRu6LSBaZM2heKXdVGMxLrnKVqwL7dPANh3UnXuXTyg1zJHOqavQluC9PN/B7jiBFUbbo8M+fmg
	lPzJMaLsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Mvo-0007I0-B2; Wed, 05 Aug 2020 17:10:24 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Mvi-0007GC-TI; Wed, 05 Aug 2020 17:10:19 +0000
Received: by mail-lf1-x142.google.com with SMTP id j22so18769700lfm.2;
 Wed, 05 Aug 2020 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+69HNPUBLn+0j8xa7ztNqSpAC3bH5kdSFM7se7mw/Y=;
 b=RdzmbMMLETEqNtoVgyRCKj1pU2wD/0M8qEqvRXNRRNY+b914UvXZkxoVgayVQubBPC
 CE/souAwCoROj7cmbTcH2Md3LKEYbq7hyPYtIYReTO92nMUXfSeWszPI988KPS2REOZ/
 x8Lg5axuTOlNvJMwV7URNblxu16MjbinauMnuxvVDwlqKDPHVH06HlMC2htBpXCjb11y
 71kjYcUyosO0NzQGNjoXOZVONMcKv4BHAUmemA/OfyAvVhCb2Eag/fpp10a8cB3ymmQm
 ukYz/pLgzNQdHe5F/wMNFpu3aiLl6i8gq8ye/o/O6zNgd9JR7Oi+/mkdZRJPFt4uOCZ/
 Wj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+69HNPUBLn+0j8xa7ztNqSpAC3bH5kdSFM7se7mw/Y=;
 b=OhMqp4qc1pqFKZPy5Sn3ywT/YfgifdWtkpav84N2P3/JYX0RVf5uZazYVqRrOOOMsW
 d2u4Q3sv1E+F7oFMglKoz9nguJfehS5fu+mcrOcWiC8Cq/Ummxcr8WWeQQMk3orUjOHi
 r6s2cAyjIXUoA4lqbdJ59GQ+s5M+ntLi6UL6S+S23O3ZnICNY3UhoSzYBgTqQyf91qd0
 nx5Cp3iWRfIv1+m7FELpHjEf5j3aoVe1VTpHgeEx/K9Tbqdz04t/vNJCRZaxu3CmrXrV
 73pXbDPPj4PmZMXwbaZ0X5lzyeSt0GPaaaN0hoK3cKSsJUWjQG2ZH9JU6OLSj/NqVNhK
 W+OA==
X-Gm-Message-State: AOAM5317+VNN5vJvUzaw0fIMx7ranYSFE52Plt1EbYaROnEwOFOQZqo7
 lJbasQJ6nxUCs76GNWqGrXvsGnEymL1/Cz7hQqM=
X-Google-Smtp-Source: ABdhPJwrfD4lQmBmRhZhj4oSbWRKgm3lTiWKFBcnnoErai4/oJd38wR2GismiRK0iE3hYzt+6N6iDQ3Zkito0n/twrM=
X-Received: by 2002:a05:6512:3b7:: with SMTP id
 v23mr2064439lfp.10.1596647415748; 
 Wed, 05 Aug 2020 10:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2020 19:10:04 +0200
Message-ID: <CANiq72kaw7EMePMbgYyKMCkBC+7CgERq4FV2Lp-fH+ea3H12vg@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] memblock: use separate iterators for memory and
 reserved regions
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_131019_007578_4D99FD0F 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-MM <linux-mm@kvack.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 2, 2020 at 6:41 PM Mike Rapoport <rppt@kernel.org> wrote:
>
>  .clang-format                  |  3 ++-

The .clang-format bit:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
