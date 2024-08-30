Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D622CA0ECE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 01:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGARh8EdeLnC2zExPVkQZb3YTDWM6Fg6wXARu3dd1nA=; b=DanmjNEB5jghn2
	EBOzYcwwUPuh5B8rwwy7LJ1+/9HHrJBZjMgYPBQ1D33Nu2mxeW3FGQd7PZNQ9gbXJYF2ixWl9KIMl
	2R+HKcFhNB/ubQbDtLeYL8B4LzHlqC2YqJ6QfBDKJ02ieQ7IbK5Bsvnqwt5KUWzG1AVzYuLBX3+2m
	RtEodsNCUkVPUC9m0iYAgQqJR0AQvp3TGYBeEqAsxo7O4Db/GFEo5MUrjZt2Oozu5CJKfoWUbOt/u
	/upDkendYwfmFgM+S06q0Rci7YhJBXBdMcZM7WlM17m9hyFEcTBZyiU7KTkwPJBVAIm9tLhvt4FjY
	Flz7WjNDLI/XiflWe5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjq9S-00000004Fdp-1eAg;
	Fri, 30 Aug 2024 01:10:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjq9O-00000004Fcd-2wpb
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 01:10:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-714263cb074so982736b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980205; x=1725585005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwoqNPnm0PFMKEw2mojvKZssW8GhVCDsDfQmuaD4p/M=;
        b=onx0PFR8wi2r7ZuNKIq5yH9NVeG4OzMhI7MsirEShCOu6nPUfvFh9QOe7bJ/aY1Ved
         CWQvGFwoQS1M1nJbrLjP9v7DTAWxqSfLnw2+oj4XKI8Cavc0FqzU40V8Vj9RkVQY36K3
         vb+4bJjNnsUFpy5sWtDOSrSDGWqc9rf1g8P2NIrGo17gEiyit0vKhzCVSNtuGyLOAKkB
         LdaJfMpwbpE7dkYNMUmCWJi1IEHtizjMx9baFUrFjTEAL1/uL9IPdTJpfOR9Jl21OLv4
         VMVRPFW7T1cZpoW8HuxDozyG0nfazC834eqIV3FNA0zVPSIV9jbwtr67pRdK7OesVcFm
         +BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980205; x=1725585005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwoqNPnm0PFMKEw2mojvKZssW8GhVCDsDfQmuaD4p/M=;
        b=pjd8OnutvWtVNxxw4Rbfzt15DrbrNvtdWMmZ3HfwfBGIosjIbbBkE7n46NdyjnCpKU
         MLbn+fTtMx8i6OELaSMUw+yArRtwrcNV6QLUSVNRkKA/U1m3bpQuYZCKqU+z44EiKY5r
         I2Xv19Tr5u2bAkbto9Enku4GlqiOdQa+xDp4aB60WXoqlqBTsIARxAcJBEsG7F9pO+bh
         LQ+LDDwd2FRHEKCYgdjnrUDzd7adCpKUKWdCo7jaE+HZubePBjT3D0J5tWcM3lIKA1h+
         JqwSLSds6ZbQh70CLAUHneyn8fvW7RRQuCvtOZawFEyz10pbEXXeVkoI+AljbK+l6hrJ
         AlWw==
X-Forwarded-Encrypted: i=1; AJvYcCUZU+1t2RS4vNWXiNzt4a4fBo/OWevVAboH02SUfah+5FJBgeDBnFz6nVKRtPMSxPdAM4DGdaRwr/laHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ce60utVhJfALrnMKpN/gsyIPUpiPfJopRccPnH5I0zC6GSlN
	diu+JEt87Asw6NayOqLcDCPbSfXQVdPQO94vNpVzkGLyItAgUPLS/NNsPdQ4jjU=
X-Google-Smtp-Source: AGHT+IHjWR5hohyc19lNozH4CTnGNOicvRPszOH5PvlKyMQFSKFQKAXiGMUabKYrMEs/kL3dRfpZ8w==
X-Received: by 2002:a05:6a21:3943:b0:1c0:f216:7f20 with SMTP id adf61e73a8af0-1cce10ec619mr4946320637.49.1724980205096;
        Thu, 29 Aug 2024 18:10:05 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1326sm17228115ad.35.2024.08.29.18.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:10:04 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:10:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Message-ID: <ZtEb6EogqifmKrQU@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
 <Zs+FYbII0ewwdisg@ghost>
 <4219f619-4b32-40bc-85b8-cb11d76fde98@intel.com>
 <pzxlpwxbrs3pali53bogsorwebi45ayqivxmpeagrhvdh7zt4u@ybsa2vnkze7v>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pzxlpwxbrs3pali53bogsorwebi45ayqivxmpeagrhvdh7zt4u@ybsa2vnkze7v>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_181006_754538_FDE553FC 
X-CRM114-Status: GOOD (  39.47  )
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

On Thu, Aug 29, 2024 at 03:36:43PM -0400, Liam R. Howlett wrote:
> * Dave Hansen <dave.hansen@intel.com> [240829 12:54]:
> > On 8/28/24 13:15, Charlie Jenkins wrote:
> > > A way to restrict mmap() to return LAM compliant addresses in an entire
> > > address space also doesn't have to be mutually exclusive with this flag.
> > > This flag allows for the greatest degree of control from applications.
> > > I don't believe there is additionally performance saving that could be
> > > achieved by having this be on a per address space basis.
> > 
> > I agree with you in general.  The MAP_BELOW_HINT _is_ the most flexible.
> >  But it's also rather complicated.
> 
> There is a (seldom used?) feature of mmap_min_addr, it seems like we
> could have an mmap_max_addr.  Would something like that work for your
> use case?  Perhaps it would be less intrusive to do something in this
> way?  I haven't looked at it in depth and this affects all address
> spaces as well (new allocations only).
> 
> There is a note on mmap_min_addr about applications that require the
> lower addresses, would this mean we'll now have a note about upper
> limits?

I don't think that's a viable solution because that would change the
mmap behavior for all applications running on the system, and wouldn't
allow individual applications to have different configurations.

> 
> I really don't understand why you need this at all, to be honest.  If
> you know the upper limit you could just MAP_FIXED map a huge guard at
> the top of your address space then do whatever you want with those bits.
> 
> This will create an entry in the vma tree that no one else will be able
> to use, and you can do this in any process you want, for as many bits as
> you want.

Oh that's an interesting idea. I am not sure how that could work in
practice though. The application would need to know it allocated all of
the addresses in the upper address space, how would it be able to do
that?

> 
> > 
> > My _hope_ would be that a per-address-space property could share at
> > least some infrastructure with what x86/LAM and arm/TBI do to the
> > address space.  Basically put the restrictions in place for purely
> > software reasons instead of the mostly hardware reasons for LAM/TBI.
> > 
> > Lorenzo also raised some very valid points about a having a generic
> > address-restriction ABI.  I'm certainly not discounting those concerns.
> > It's not something that can be done lightly.
> 
> Yes, I am concerned about supporting this (probably forever) and dancing
> around special code that may cause issues, perhaps on an arch that few
> have for testing.  I already have so many qemu images for testing, some
> of which no longer have valid install media - and basically none of them
> use the same code in this area (or have special cases already).  I think
> you understand what we are dealing with considering your comments in
> your cover letter.

It is definitely not something to be taken lightly. The version 2 of
this is completely generic so that should eliminate most of the concern
of "special code" on various architectures. Unless I am misunderstanding
something.

- Charlie

> 
> Thanks,
> Liam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
