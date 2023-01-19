Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44601C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPGClptiRXdJTtPloPi24w5HXxCr69zEDhDqyO69mEI=; b=O93RsKbTB+GFM6
	d4ErIj28qTs9AJZI3eyQOiZ8VVcrLu/20+gp5Z5R3GSnH/LBckhWlyfq8bRn8GGatFSL2mwHhr+/e
	f2JVEuNb3QZeduHds8lHsdUKHySlTT+4DgygZf7mcxoLMGquK+fQbzsrO2y/3mtYxtKVaIMuGC10H
	1frBRQ4UTzGANTY2DTeqb6lxr7855eFKGkSAVFSZltGwPLXa409tY2kYQ6o7ndpIko24qihuo5utO
	bq5kcy4J075kcwajv6+2GA4ujkASpo1IiKEyIPWTBNMjrpvFczcliF9i4Ki5dcN3tBWNS55XesJsM
	HCGjPGjKB8J4ZiOzzWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYUz-006D09-UN; Thu, 19 Jan 2023 17:14:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYUv-006Cx2-UM
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 17:14:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 78so2045044pgb.8
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3m6FnRHon/ERdNuMp939FY03hOnkC/3DfqdGHHNZVo=;
        b=NZnk8qAovjYt9d3M1s9Ed5R/SzYS10fphjbMp0Qm9eEu2q/Ehkf3+pz3Iz8dY5jpD4
         EhYeMq2MoG4Y5XN2GnpybBkjybdFyqBtQNMk0vpZsEOPYopuFi4vyPQzqyMao6Djew1Z
         eEntn5yb8iXVqoEKyIYOUekjO8DVRF3fhgsoePHjhAFtDrtu5vQA41uLgLxEXem4eDHf
         6XWqtHPGos7auud7cSkHdJi/QRWsyfQ1XNpoIVyanUogFvJ9hrjTarqtF3+qwA7154E2
         3685e5v3o9QVK/UeKtvoIRQt7WJyRCSoLAzCMN0Mhw76RdScYb6VyS6nw81RWkgeu6p0
         XF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3m6FnRHon/ERdNuMp939FY03hOnkC/3DfqdGHHNZVo=;
        b=F31Skukt4+e5HAZjBUQn4q2xgmaQzIT87UgC62O8JrcRmA2iBPQFW1ui/bWHtMUpoM
         lJY4Xnto/VakMMI8gYvlDedah+Ql8WjV1OeELBcM/UT0sZ8CluvTTVm/SFmzornSMIrH
         Fw2wYXqZGXIVEv3II1m7+i8Z15eHcGoqHJMT/afQpz/PeW3/FT7jfllXrX2RPVBreRqR
         JvFpuk7gMGhoi+eRrMyYUJGmGufihBaZHOh/QtW8SPTKUbvqAkp58YxCJROcmMAewzTm
         Tm/31hREmDH5LX95kfEZDvD7SLDWknC8EJWrFl6NXb4IJIhVCn5upE4BhS0u2bd13K9x
         YRmw==
X-Gm-Message-State: AFqh2kpbEqczMyfnfVDSbjlsQOQUmBly3oI9IHEF6VwhSHJ+A8U0wTg2
	/3yTf48PtU+u+OoF8GlaWJhJzQ==
X-Google-Smtp-Source: AMrXdXuzV1QqiuKjtYWMTtGC8EBn/MaadWuvHkkuJ9ZASZGXOhkdhowXaNHl2xYH7k1qU1kPQqtwDA==
X-Received: by 2002:a05:6a00:1c84:b0:581:4260:a650 with SMTP id y4-20020a056a001c8400b005814260a650mr10769799pfw.33.1674148481271;
        Thu, 19 Jan 2023 09:14:41 -0800 (PST)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id b20-20020aa79514000000b0058d91fb2239sm9246817pfp.63.2023.01.19.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:14:40 -0800 (PST)
Date: Thu, 19 Jan 2023 09:14:34 -0800
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Nadav Amit <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
Message-ID: <Y8l6egh2wWN7BUlZ@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_091446_052475_1E3CCC75 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, Dec 08, 2022 at 11:38:20AM -0800, David Matlack wrote:
> 
> Hello,
> 
> This series refactors the KVM/x86 "TDP MMU" into common code. This is
> the first step toward sharing TDP (aka Stage-2) page table management
> code across architectures that support KVM.

Thank you everyone for the feedback on this RFC. I have a couple of
updates to share and a question at the end.

First, Alexandre Ghiti from Rivos is going to work on the RISC-V port.
I'd like to target RISC-V first, since it has significantly lower risk
and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
[soon] nested virtualization to deal with).

Before I send a v2 I am working on sending several related patches.
These are patches that should have enough justification to be merged
regardless of the fate of the Common MMU. By sending them out
separately, I figure they will be easier to review, allow me to make
incremental progress, and ultimately simplify the v2 of this series.

What I've sent so far:

 - https://lore.kernel.org/kvm/20230117222707.3949974-1-dmatlack@google.com/
 - https://lore.kernel.org/kvm/20230118175300.790835-1-dmatlack@google.com/

What's coming soon:

 - A series to add a common API for range-based TLB flushing (patches
   29-33 from this series, plus another cleanup). This cleanup stands on
   its own, plus Raghavendra from Google has need of this for his ARM
   series to add range-based TLBI support [1]

 - A patch to move sp->tdp_mmu_page into sp->role.tdp_mmu. This was
   suggested by Paolo as an alternative to patch 4, and saves a byte
   from struct kvm_mmu_page.

There will probably be more related cleanups I will send but this is
everything I'm tracking so far. If anyone wants to see a complete v2
sooner, let me know.

Paolo and Sean, what are your thoughts on merging the Common MMU
refactor without RISC-V support? e.g. Should Alexandre and I work on
developing a functional prototype first, or are you open to merging the
refactor and then building RISC-V support on top of that? My preference
is the latter so that there is a more stable base on which to build the
RISC-V support, we can make incremental progress, and keep everyone
upstream more involved in the development.

Thanks.

[2] https://lore.kernel.org/kvm/20230109215347.3119271-4-rananta@google.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
