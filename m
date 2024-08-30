Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D168CA0ECD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 01:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9mSUwAi/wmlhVIw+IYTpHhmoO4Vdl7EwDtNi0XTwbM=; b=owICOLLSLk+Z3Y
	0fxotUmKdOENj0Md7gjdIWexxZcnXZx13p83DhhXelcZ7tPp3UGzgfu9crGGm+njD4gVXFdK4Rq7s
	ZmBNwRgrUp3SZmIU2XaOtwQGYUdJ8HUn45r6KY6vaFecz5AS/nIZiWkFUL/HDzU5r4mZsxVOF8llN
	TkRa3UySB+ta7vcPn3FVN3f50ifF1wXPZYw4NT/YYi3wWceNmn9Z6icQjamGnRke5U7THoHrdaGOc
	edRi69EuYcfJmSNjPmDsGEBoTmGIVkHytnnjjpZrQIJ2VyZ/EJ5e/U6O0d1wS6IbKbo2lgGW8hR7v
	2MSZRQ5IkeeBjFVD+2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjq0D-00000004Eb5-1GZ4;
	Fri, 30 Aug 2024 01:00:37 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjq09-00000004EaC-4BgW
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 01:00:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7cd9e634ea9so898297a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 18:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724979633; x=1725584433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LS53wxxaShUerh6Nzz4tUD12WQZd3J6t0NqAtqOlEuU=;
        b=sk3frLjyEPkV7p4OaNPpUp1BvIF0+p9KKeg9vRDMq+uxVLysKaB9fCwbq2Rf5fZeIP
         kwfi71FWOQFJR7bVt9YAcN4owzwfp0XrpT54OaEomKAd8fUuLur3MEQsSOcdWSlpSdLV
         kNmS6dr9/B4WiFu+MWWgvGCZD49zSZpK8BY2D6QIMfayw+ZughpuPFVxdzSCbuHc5XiL
         qbmSOlR1Uqjx9+5mptOlBWdv8ihm6tYs5GWNa/Z2tXMykQ6MRUqWjUW+knKCZydvQGOM
         IW2mYBzztJdrc2MPHZSsUZ7vlZYOwfifFDQQJ/sTtZsHSpHJqID+d1Jm5Jm6KDNCfyd1
         eu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979633; x=1725584433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS53wxxaShUerh6Nzz4tUD12WQZd3J6t0NqAtqOlEuU=;
        b=ksBP9bzVxKrP4Aa2AjIa2vucX68BzAkjPKJ3nxdfBPtrqoryXFxHa9GduLRKkWwb3Q
         YrXEjU9/GpV4FPGmugvtHc7Skz40OeS8rKMsNzNWWSfuPIbSruMzBWpLyREYlAATl4eM
         GIvkA4je2bUOK2kZVWdEEnnFQS/Z9fssPdlt2ahHQ6dIcWZ8YWK7SVJK0SmIUan60MWS
         IoFu+f0x043VcdYdEirRNMnzUUE0dwSibIXk1DCY4efmo9z+O4RxE8vtf+Z4EXzw9Eez
         lRlYBgzBqQYJ8YUuSHpF1DZoyjU2mt1eNdMLGaxPb+SZZ8MwQkUKihPd97zjD8ph1zO/
         1PSA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9cAoxPm9gqAhHTX5gLEEFEiFGrmLNJhyRVF2+IQwpAH+CboopEdcvpsALD76/6C5BUTPg8ogKYlrVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgtyrslmBnugbaA85zcNAj7cBDC+6w2Oxs1ePYF1JMpY4BVSp/
	4+miweVQpsCfXIpzDdnWj2hlDyRbYWwWhMXqPRkJUr3ayCDvAYM6XUf8B1Z67qI=
X-Google-Smtp-Source: AGHT+IHskamnwhuEnVsgXagVygWurPjxZHIPCEOoqvpXtCAUWcyWg3cwyRWbxqEUzrtAK6MXZRChtw==
X-Received: by 2002:a17:902:e84a:b0:202:3e32:5d3e with SMTP id d9443c01a7336-2050c3faf20mr48056025ad.36.1724979631231;
        Thu, 29 Aug 2024 18:00:31 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555bf89sm17096775ad.289.2024.08.29.18.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:00:30 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:00:25 -0700
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
Message-ID: <ZtEZqUSkVvi5Bmpt@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
 <Zs+FYbII0ewwdisg@ghost>
 <4219f619-4b32-40bc-85b8-cb11d76fde98@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4219f619-4b32-40bc-85b8-cb11d76fde98@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_180034_316997_7E8B1AA6 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Aug 29, 2024 at 09:54:08AM -0700, Dave Hansen wrote:
> On 8/28/24 13:15, Charlie Jenkins wrote:
> > A way to restrict mmap() to return LAM compliant addresses in an entire
> > address space also doesn't have to be mutually exclusive with this flag.
> > This flag allows for the greatest degree of control from applications.
> > I don't believe there is additionally performance saving that could be
> > achieved by having this be on a per address space basis.
> 
> I agree with you in general.  The MAP_BELOW_HINT _is_ the most flexible.
>  But it's also rather complicated.

Can you expand upon what you mean by it being complicated? Complicated
for the kernel or complicated for a user?

> 
> My _hope_ would be that a per-address-space property could share at
> least some infrastructure with what x86/LAM and arm/TBI do to the
> address space.  Basically put the restrictions in place for purely
> software reasons instead of the mostly hardware reasons for LAM/TBI.

That is a good point, perhaps that would be a way to hook this into LAM,
TBI, and any other architecture's specific address masking feature.

- Charlie

> 
> Lorenzo also raised some very valid points about a having a generic
> address-restriction ABI.  I'm certainly not discounting those concerns.
> It's not something that can be done lightly.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
