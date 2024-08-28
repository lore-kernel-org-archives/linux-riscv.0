Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6DEC636EE
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 18:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwCbdYStesuTzXEnsxeMi+7KE+0TxcIRiEEbYIfvoAA=; b=cqkXHmXSEXUWXd
	vW/vHGPC142jN8ODwB35NZQfotyo0NLpEyMfqCRb1M6xIQlc2vSyDrShGOoJVLI8aExLdXFZkdEYP
	9vgmRgVfDio0M7C3jPXB9eam3qvHHhKxioOlHlwlxudqhkb7xR+RD81mJX78ZcpKgmcfbCl2kUGkF
	CexDE0zRMHCYXw9pPqqQJB+Og5qDMgn+Yq91dGDpNcCg+MgF+LvxLdOVCUca36YsLztY+c7ETDYHV
	sLYlF1QM2hIio3drA89yV4QLT9l5SlKIXEapBQueV+vLJFjcuihB/fk50lIrkGv1Zd87yTXkboGZS
	b7Hgl/cRuMD+TjafAX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNAX-0000000GVGz-1vqv;
	Wed, 28 Aug 2024 18:13:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNAU-0000000GVGF-172n
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 18:13:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2020b730049so56023915ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 11:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724868797; x=1725473597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LALoI8v52A4/X4uxJhIa0heHcwoa9eC5vLoHkCEA7Ac=;
        b=BsMEUmtYJm2hJH6MRHp2ou7b/pi3r2Y5rQqnM6lmP9Wdt4+vbU87HEIlVuqs5pYrEo
         AmW2ExMpEakF1WySHqh+sQbKExvxINwczUpCEpfiYZH0bTYAUl4D82+F0lQ8LGNHdtfX
         7Kc7363S5eAatA4ekiIMW9O0Vug6AJnSSFekO/hmsXl31viJuB2bUNMXHZyi++JAEPUW
         601lZOiMebMOP7r+bK6j4AtNtuJWgMNrhGD9/75NI7MWXjz4lumawU7Jw9JvdxWGWp99
         VC8eoDXH6lXgrV2n5tdqQjJQKds22hZKhDqrOOP4fvH73dZ1aQd4HTFo9rXNKcRF3UsL
         CZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868797; x=1725473597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LALoI8v52A4/X4uxJhIa0heHcwoa9eC5vLoHkCEA7Ac=;
        b=P84gMnOycU32Nv5W/Lf1MzpXyt/97IFard+i2JFYNLFUMEy+7vbsTay6U+xtFNaTiz
         x9JPVJFqVq/4CLNPlKumk2TV1HNALp2o6FKwquZ657Ev8uMhE1t5BcMjCIqdIxa9NEBj
         aR+DyiAnN1pKci3if4tyHVM6cAvVtq9GR32Z49ib+UgrdOk8NXJMtN3V5k25Hpsj2kfA
         UPTSm4AIKLtVE5/YLeM68d/nc0KqXH3wLZ9as1aX9hGiJ2Oq4cIZByKejA3tD6zzMAcv
         9SqY9dwctjjAvBXhNH3mU0Z8bSGzdF/Zw34qsOyogcBCrwUMcF4v02Hb7c28fshyTgPR
         b6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCg+JiBP+i2Zi/eRRt3/qKHGQOa18lQtmBk83PU2fWLNINHNtC9Y2ap8XM6yFsp+bo5qE0umayK35Qjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiwp1LdabFJuTQVGd0xVoNRRAkKw4dvZA/uk9P6872Z5GtcOSJ
	mp8SMko6tQVENYleLpRYFbpFyWtFzf5zImi8hZkSSkCyC9+6VjG7eCyEk+Vs0m8=
X-Google-Smtp-Source: AGHT+IGuZvjR8n1DEJgaREJ89Ekx33Df2TcjSjzsxg5aNNIN6dSl+M4/n8ZHA/SWHFgBiHe+4H0WZQ==
X-Received: by 2002:a17:902:f78c:b0:1fd:9269:72c6 with SMTP id d9443c01a7336-2050c4a5b8fmr3765425ad.62.1724868797179;
        Wed, 28 Aug 2024 11:13:17 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df88esm101966005ad.152.2024.08.28.11.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:13:16 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:13:11 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
Subject: Re: [PATCH 16/16] selftests/mm: Create MAP_BELOW_HINT test
Message-ID: <Zs9oty09IysKUHCF@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <20240827-patches-below_hint_mmap-v1-16-46ff2eb9022d@rivosinc.com>
 <71528354-4884-41e4-a4a9-318e26187f86@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71528354-4884-41e4-a4a9-318e26187f86@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_111318_330960_3135EA2A 
X-CRM114-Status: GOOD (  29.32  )
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

On Wed, Aug 28, 2024 at 06:48:33PM +0100, Lorenzo Stoakes wrote:
> On Tue, Aug 27, 2024 at 10:49:22PM GMT, Charlie Jenkins wrote:
> > Add a selftest for MAP_BELOW_HINT that maps until it runs out of space
> > below the hint address.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/testing/selftests/mm/Makefile         |  1 +
> >  tools/testing/selftests/mm/map_below_hint.c | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> > index cfad627e8d94..4e2de85267b5 100644
> > --- a/tools/testing/selftests/mm/Makefile
> > +++ b/tools/testing/selftests/mm/Makefile
> > @@ -50,6 +50,7 @@ TEST_GEN_FILES += hugepage-shm
> >  TEST_GEN_FILES += hugepage-vmemmap
> >  TEST_GEN_FILES += khugepaged
> >  TEST_GEN_FILES += madv_populate
> > +TEST_GEN_FILES += map_below_hint
> >  TEST_GEN_FILES += map_fixed_noreplace
> >  TEST_GEN_FILES += map_hugetlb
> >  TEST_GEN_FILES += map_populate
> > diff --git a/tools/testing/selftests/mm/map_below_hint.c b/tools/testing/selftests/mm/map_below_hint.c
> > new file mode 100644
> > index 000000000000..305274c5af49
> > --- /dev/null
> > +++ b/tools/testing/selftests/mm/map_below_hint.c
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Test the MAP_BELOW_HINT mmap flag.
> > + */
> > +#include <sys/mman.h>
> > +#include "../kselftest.h"
> > +
> > +#define ADDR 0x1000000UL
> > +#define LENGTH (ADDR / 100)
> > +
> > +#define MAP_BELOW_HINT	  0x8000000	/* Not defined in all libc */
> > +
> > +/*
> > + * Map memory with MAP_BELOW_HINT until no memory left. Ensure that all returned
> > + * addresses are below the hint.
> > + */
> > +int main(int argc, char **argv)
> > +{
> > +	void *addr;
> > +
> > +	do {
> > +		addr = mmap((void *)ADDR, LENGTH, MAP_ANONYMOUS, MAP_BELOW_HINT, -1, 0);
> 
> How can this be correct? mmap() has parameters:
> 
>        void *mmap(void addr[.length], size_t length, int prot, int flags,
>                   int fd, off_t offset);
> 
> You'r setting prot = MAP_ANONYMOUS, flags = MAP_BELOW_HINT...
> 
> This surely should be:
> 
> mmap(..., PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE | MAP_BELOW_HINT, -1, 0);
> 
> > +	} while (addr == MAP_FAILED && (unsigned long)addr <= ADDR);
> 
> How can addr == MAP_FAILED (i.e. ~0) and addr <= ADDR? This will just loop
> through once...
> 
> If you want to make sure you're getting mappings only below the hint until
> you start getting MAP_FAILED's you'll need to handle this more robustly.
> 
> > +
> > +	if (addr != MAP_FAILED && (unsigned long)addr > ADDR)
> > +		ksft_exit_fail_msg("mmap returned address above hint with MAP_BELOW_HINT\n");
> 
> This is just going to fail because your flags are wrong then wrongly claim
> to have passed...

I obviously didn't spend enough time thinking about this test case...
You are correct that I wrote this incorrectly. I will make a proper test case
and send out a new version.

- Charlie

> 
> > +
> > +	ksft_test_result_pass("MAP_BELOW_HINT works\n");
> > +}
> >
> > --
> > 2.45.0
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
