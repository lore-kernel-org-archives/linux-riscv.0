Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8233EEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jp7D8dIK9T1FDy0TgXJ6n4z3G6bcurwCzJcOAbCmgH0=; b=U4oMXM/ajWtDrf
	7Bno3lW8yAYxvncFWLZiEA2WJ6GOG02wIa3QyE1LXGcQn78gG0DnC2ZuVJQcuccPcOx2M/NsN3YvD
	PlF18OqMGINg+29HiVcpC68wL1eckSWEt62MDe/8NYXAW1h1ir1MFd+jnEpJypvqabbvzVcNk4IfQ
	K25s1n8Z8jGCJCdTZ6Yu56Kj5GLx6hB5Jdc05VxByT0t5idQJnQmCkO3LjSUorhsZln1iAKloUqvZ
	H+sDvkexT9XFe/29WXc0M/eEyuQXzp7LgXmkdsxDpzn8pO08ntBaKoDcXyAeOofieah9s4+sULnzx
	VO7pyvjBtPBFqC/d5hFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLmm-006euq-1p;
	Fri, 14 Jul 2023 16:36:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLmi-006etr-2P
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:36:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6686c74183cso2046654b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689352608; x=1689957408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ1uI9q9sU2ZQAZveePTsLb5K8q5kCpO4NQiP7h7UI4=;
        b=okKHAWGl0HU/dDrm6Nylyw0ZW/1JCHS/YMnhiAbqBiwVuC7bV22VAGkf0/nuqrB3uU
         Yf1l+ZCIuKAn94NDuPC1XHoJvcrFPq0jcjOED2EfZtC7m1tuPSxaeoEqhIfjyQqtZNfu
         ++h6EsvmIkc82XsLvzI+3JciPpWTaYKHDf0tbTGqzGIr1ho8NYiRaYeZHRRWhWtJmczL
         wTBb+W3qmkk9UThIjLWQUorLv3HScFA/HrAJGclQDgwHpRU/o3FzuyfIK4JrdszVHwNs
         Z3y+v4PsYLeiInACqeCeScTBn2paFWDP5917TuipB4tZxbxDQW2Gt4DG9rUa37w2czQB
         m9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689352608; x=1689957408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ1uI9q9sU2ZQAZveePTsLb5K8q5kCpO4NQiP7h7UI4=;
        b=efUCnqBgs6ZciWNWps9e/tcdRLQHLCJTmWwWjSjTS5jPFRqmtZgVLMZnESgdjflSDs
         6kq6fB0HfbSJhXLCKmy0QyaJShsLn9cOzE1Tb8nCyohY6CAB3+bUkTR/lZpXqhC6BU0p
         QV4v6ru+ihzPVTjGMDr6iVxbwwMDceZgsdy5RAdl2wKWTWn9eUuYFZvyjTnQSh+0IlGm
         co9CV0XZvERTCXhrxNyccKTqDC3yJf4kPlVs/zvbddXA1Dan6A4heG2yFmuoCdrKAair
         28aZdN65+nexU+C7t23agu0igdSd4WHThV2ZeGWjyfG1K8YZtqjJjyvDcZ0K1x5gFYlT
         pOHA==
X-Gm-Message-State: ABy/qLZE0Fs/jQhAqK2/dn1muR1i0+IO+/gbtDCtaOurt1jxKTcefNpu
	WnpLFQfZcZ1comj9gnQ2UYt+dw==
X-Google-Smtp-Source: APBJJlHRd1gLk7JPxHUtTov1qnh114x9KwaDQ/5sltZxt9EHRLviBFeaGdLonEvrSgYBN3Wzgzxgfg==
X-Received: by 2002:a05:6a00:16c4:b0:676:399f:346b with SMTP id l4-20020a056a0016c400b00676399f346bmr6889692pfc.1.1689352607578;
        Fri, 14 Jul 2023 09:36:47 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fm10-20020a056a002f8a00b00640f51801e6sm7373618pfb.159.2023.07.14.09.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:36:47 -0700 (PDT)
Date: Fri, 14 Jul 2023 09:36:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v5 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <ZLF5nS12R37loA9I@ghost>
References: <20230714001430.75798-1-charlie@rivosinc.com>
 <20230714-hangnail-stinking-60f9725ac0d5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714-hangnail-stinking-60f9725ac0d5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_093649_471854_47CFE82C 
X-CRM114-Status: GOOD (  21.88  )
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

On Fri, Jul 14, 2023 at 12:17:00PM +0100, Conor Dooley wrote:
> On Thu, Jul 13, 2023 at 05:13:59PM -0700, Charlie Jenkins wrote:
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. Users can now select a
> > desired address space using a non-zero hint address to mmap. Previously,
> > requesting the default address space from mmap by passing zero as the hint
> > address would result in using the largest address space possible. Some
> > applications depend on empty bits in the virtual address space, like Go and
> > Java, so this patch provides more flexibility for application developers.
> 
> The patchwork automation failed to apply this, what is the base for the
> series?

I forgot to pull in the changes to the riscv selftests so the conflict
is in that Makefile. I will send out a v6 with the correct base.

> 
> > 
> > -Charlie
> > 
> > ---
> > v5:
> > - Minor wording change in documentation
> > - Change some parenthesis in arch_get_mmap_ macros
> > - Added case for addr==0 in arch_get_mmap_ because without this, programs would
> >   crash if RLIMIT_STACK was modified before executing the program. This was
> >   tested using the libhugetlbfs tests. 
> > 
> > v4:
> > - Split testcases/document patch into test cases, in-code documentation, and
> >   formal documentation patches
> > - Modified the mmap_base macro to be more legible and better represent memory
> >   layout
> > - Fixed documentation to better reflect the implmentation
> > - Renamed DEFAULT_VA_BITS to MMAP_VA_BITS
> > - Added additional test case for rlimit changes
> > ---
> > 
> > Charlie Jenkins (4):
> >   RISC-V: mm: Restrict address space for sv39,sv48,sv57
> >   RISC-V: mm: Add tests for RISC-V mm
> >   RISC-V: mm: Update pgtable comment documentation
> >   RISC-V: mm: Document mmap changes
> > 
> >  Documentation/riscv/vm-layout.rst             |  22 +++
> >  arch/riscv/include/asm/elf.h                  |   2 +-
> >  arch/riscv/include/asm/pgtable.h              |  20 ++-
> >  arch/riscv/include/asm/processor.h            |  46 +++++-
> >  tools/testing/selftests/riscv/Makefile        |   2 +-
> >  tools/testing/selftests/riscv/mm/.gitignore   |   1 +
> >  tools/testing/selftests/riscv/mm/Makefile     |  21 +++
> >  .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
> >  8 files changed, 234 insertions(+), 13 deletions(-)
> >  create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
> >  create mode 100644 tools/testing/selftests/riscv/mm/Makefile
> >  create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c
> > 
> > -- 
> > 2.41.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
