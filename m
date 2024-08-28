Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B9FC7112B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 20:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuFnIqRUehTCmc7t5h/NwVMDEaq/BkUqkmns+8aWR14=; b=s/EQoP6Gohi63B
	YTHUBY9vN6RMPbKJP3X+pT82D6CDO+s6R5OHyX+KvhdIS0RKIEQbXYjmBWmqblWQjsPt/fvaQFh1v
	jyX0WeU+oQzs6WV4s9grlAcYRjNFoljTNNFR2J49HGDIrfKbfIRilG9+AaMrp/EM7+rbF0dbUNd58
	w61mz/JWjkbSFLVZ9e2S5SEOdIKD79g/E5WJqBjJ9wiIHgSmbbNpU3UKNJRLi+jE2ilhTuOkDFblG
	uI8rIpKNUMCEgR0YuH+Z08ObsUnJFSsKY+pPlnKjidu1728KHoA+ruo19/3HkDkQcClOdhtOC8CEP
	MU6cbK25encgBrTI34oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjP4t-0000000GqR2-2qzd;
	Wed, 28 Aug 2024 20:15:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjP4q-0000000GqPP-1WA4
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 20:15:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so5886336b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724876135; x=1725480935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=H+Zln3Adt7l/kyg0O1PFWFKzz8rT5UHTM1VYb3tZQrj68VzfjBsr6cUUMs8f226pRZ
         4dbaZPJs1HdTKwzMLQ2RE7e1ZjICuFEfAHrh5K1wzeLYLMSQo57ycbF1CELRJNB5RbI3
         X8U9qketOq+YapzNNJKJDv6nL6g/WrOBWdpEJVowz3cgfB/x1wTB08J9IYt5p+AtlcyI
         pWIhtnahbgKynqGLm3wgKEQxzRvn9ZQfsq9NudE2Qm0Uu/Ty6Pp5yq8B2duReRhryrx8
         HgYz2iJMiZjbsEAqu57ufBNVRg8/MadT7RDNJnWTi+u4b3rZ//HV0fx+lWupNTGQIg9w
         CdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876135; x=1725480935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=RdjwqFqUTlv3DM7BPDVYluMOHCRiurTwU8EbIXElDvuajL8NfhMMn9ahboQZ5j31wi
         smJ/LmRQFoLC1Q6RtcVrE8jtfiOBSFX7/zqy9jEp/pSRYVDQmIL6+ZAtNAHDLhuVtvQK
         6/757nDWAuOW/OQLtaFOyfpeu0TCbfKpglHbNyumdgh4nvnjvOob+zzX4TOuMlUi38rU
         H0FZkd6PfgEH2b4HkRDhkvDPqZQZEsOu0rsmoanhiIr1lv8aCpK33HEZ4lWJPNeFSJIL
         aPIhmlNEhWlidTBAz9DP/9V44b/5ZaMk/voTE9UpYIFusJnV4YReWhqTRYhwknljzsEt
         0Erw==
X-Forwarded-Encrypted: i=1; AJvYcCV4X/VNT+C4k2LI/ZLkdIq0xoduy1HvEoSAuTFdrfJuw739eT3O47DA9D+/Naux6d19/1J4rJcWR15n4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCEmHykizq/d6ZHJSSZcHtfYCxX9A1QePg9i79iJ/XD4AmQLOa
	SDFufQGNCVFh15036QqIn/9PbssIjvLIhUR7fmAI+h4mG7NNnkbuK9mbbIAQzZI=
X-Google-Smtp-Source: AGHT+IHnVszzxRV7qQ07aFqnxjDB7ZJDRj+3FpzGhCxnl0U0Ndnw3gA3qfk5sipB0cB/w/7yeJxxIA==
X-Received: by 2002:aa7:88cf:0:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-715dfc042a7mr734410b3a.13.1724876134994;
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343097fasm10850305b3a.173.2024.08.28.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Date: Wed, 28 Aug 2024 13:15:29 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Message-ID: <Zs+FYbII0ewwdisg@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_131536_616410_78E558C9 
X-CRM114-Status: GOOD (  21.31  )
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

On Wed, Aug 28, 2024 at 11:29:56AM -0700, Dave Hansen wrote:
> On 8/27/24 22:49, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the maximum address space,
> > unless the hint address is greater than this value.
> 
> Which applications are these, btw?

Java and Go require this feature. These applications store flags that
represent the type of data a pointer holds in the upper bits of the
pointer itself.

> 
> Is this the same crowd as the folks who are using the address tagging
> features like X86_FEATURE_LAM?

Yes it is. LAM helps to mask the bits out on x86, and this feature could
be used to ensure that mmap() doesn't return an address with bits that
would be masked out. I chose not to tie this feature to x86 LAM which
only has masking boundaries at 57 and 48 bits to allow it to be
independent of architecture specific address masking.

> 
> Even if they are different, I also wonder if a per-mmap() thing
> MAP_BELOW_HINT is really what we want.  Or should the applications
> you're trying to service here use a similar mechanism to how LAM affects
> the *whole* address space as opposed to an individual mmap().

LAM is required to be enabled for entire address spaces because the
hardware needs to be configured to mask out the bits. It is not possible
to influence the granularity of LAM in the current implementation.
However mmap() does not require any of this hardware configuration so it
is possible to have finer granularity.

A way to restrict mmap() to return LAM compliant addresses in an entire
address space also doesn't have to be mutually exclusive with this flag.
This flag allows for the greatest degree of control from applications.
I don't believe there is additionally performance saving that could be
achieved by having this be on a per address space basis.

Link: https://cdrdv2.intel.com/v1/dl/getContent/671368 [1]

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
