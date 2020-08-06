Return-Path: <SRS0=vd3C=BQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF1AC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 12:16:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6D6204FD
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2020 12:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XxIx8YIf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="q44JM/Mh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF6D6204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eagY8VR9VfB2+K+bSkfUHpDN89YrUnHDPoeqGeYjgfE=; b=XxIx8YIfzcMObqhveqZMeBw2Z
	M10DnqwysTppazILRwdja1SqUp/Vov7mDDePYqTxngvyGd7waDmwgmenBJIQ2TJpY3W9FYFu6d6AJ
	WhPzvpHuFJxpwqsNrGSMNfQeRwvbvqd5NlmmsGecPQyVsLZ1yn+nBYPbfaVNRXkn606PtVMlRUbFv
	sNu9fR7hyWWG5cfMlM2Vq06ExaRPV+Uza4v9UKSdnKdqB4+V+Yf1Lsz1drdP7N/V8jEDhrGmz6sHD
	Aa/PPsvqw9LjKw8vpy/YP1T1X0xI4U74bXa77IHNvdE1xttXcBDSKWyxIOitCOpxJp8jaXlTs2azD
	5+7D0etHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3d7u-0007pf-E6; Thu, 06 Aug 2020 10:27:58 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3d7n-0007nY-I8
 for linux-riscv@lists.infradead.org; Thu, 06 Aug 2020 10:27:53 +0000
Received: by mail-lj1-x242.google.com with SMTP id g6so38507632ljn.11
 for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2020 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kMBgMZhsaHkiYpNXe6mnulxBmErGl6mZVT718X/hP1s=;
 b=q44JM/MhPtGS1X8CEtdPT8jY1IsznRmL/EUJCRVKZ0SQjpJuKmiF3MRSg0V201k6/0
 7wdleRwGXgcpS6GBcJQn3aN4+K1pHDGZuvFRDvTF9APAIhXb+a2xl9Jp+eur4UHwQKOG
 a+RLO7aCLHiHjNUkqDHv3KHpAByqNpYKygFYVYfjG2rDRNZ1boVJjHid9G6QxHXMRDHj
 lxu6G5SWy3EMKBtlkZJxRZeLycn9DXYVVNUnw64xSNl8FhKmMBKmB/5GaDUrg6bknGVy
 69EcKcUZE3qqrUPWzoTffaHacemMJWCOZb/G6QEBjYa8rAKMuVSkNGFwC876gdtvvS/j
 Xp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kMBgMZhsaHkiYpNXe6mnulxBmErGl6mZVT718X/hP1s=;
 b=bG3eHptUkYyzMZZxd1AbbMbxlIjv0cyzaqLzrpqkpYRaa4rIxFUdzFOVhk/xr7RrKp
 R2ZuwNBVyeJo1oaT4dHbxQOBcCxYV09ORxEEdW+LqosdZxfSzPAJqEVozd6BFz6Td0jX
 7XIlMeIrYw7EWii5vGicEyqFEVu7cTWTVnH5n2CVQKf9FRcc+pYGYYeI2zx6CwW/Bg82
 JFnBTYDyActBAAaVp6/TjBvG8bRh9wM8TbvUZ5b2zAkDXNUS0HUfLgpMZ/dy76Yz72Eh
 K4wq36bSS5NK1ys3Kwu/dMhPUWeVBYqsutiwVb7YNGFGkpsLrzBt7dkV70UEIRTIm61c
 0Dcw==
X-Gm-Message-State: AOAM533wF57+k/vkwLrjPsyIhgDGwM1aDEK9IewfvJ3KiU+3/iIe3ZE9
 3/ch4IMT/jWFpeEltddOykvxVA==
X-Google-Smtp-Source: ABdhPJwKs0kOBphzk4nhXY72GuBZVVKvwfIRMs8kMWmC7io4Zo82tk1RHZ72Ob2Qcz50sTYcK1DvmA==
X-Received: by 2002:a05:651c:201b:: with SMTP id
 s27mr3653296ljo.468.1596709669841; 
 Thu, 06 Aug 2020 03:27:49 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id h18sm2208204ljk.7.2020.08.06.03.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:27:49 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 80A47102E1B; Thu,  6 Aug 2020 13:27:57 +0300 (+03)
Date: Thu, 6 Aug 2020 13:27:57 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 3/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200806102757.7vobcaewdukr2xdl@box>
References: <20200804095035.18778-1-rppt@kernel.org>
 <20200804095035.18778-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804095035.18778-4-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_062752_334416_F39CE1F3 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 12:50:32PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Introduce "memfd_secret" system call with the ability to create memory
> areas visible only in the context of the owning process and not mapped not
> only to other processes but in the kernel page tables as well.
> 
> The user will create a file descriptor using the memfd_secret() system call
> where flags supplied as a parameter to this system call will define the
> desired protection mode for the memory associated with that file
> descriptor. Currently there are two protection modes:
> 
> * exclusive - the memory area is unmapped from the kernel direct map and it
>               is present only in the page tables of the owning mm.
> * uncached  - the memory area is present only in the page tables of the
>               owning mm and it is mapped there as uncached.

I'm not sure why flag for exclusive mode is needed. It has to be default.
And if you want uncached on top of that set the flag.
What am I missing?

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
