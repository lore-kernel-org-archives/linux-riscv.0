Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2576C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:36:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4AB2100A
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 21:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4AB2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z2TK+5VwvphTQEMyfMrFl9LPGW4lD8Pzb/ICWj5Kr4I=; b=3cV+KDg/7iXsQdKdRDLdWeLQR
	IqHB9k+BnZPBBUcQiaiXIe75fS094ZV1iBP/qlp0MX+6v9Tm43IcYGSZ5PTWOJSoaOzz1N1R3Y3fv
	CMgrw7xAbbi1xHGcJxVKAtpp6+HkRDB4NSDoNxd0Dgtxa1bCB04NTP9jGP9+vjHYiIUdmq792PRR4
	0Itno/AySYeyvyoKApLLTLr8pfoTlOkUFpofZe2lkfZcgv8SruX9uSDiVNZ5BXx5hPlvC1T3fikgi
	DcaP9wvt0cGzET+hl6k01BqmAJ9a1LkU6Hg1bIke82CCX9OW5y+U97QsUI0cT8vQJJpdmPwk6g+Bz
	4pJ8smjwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l49XO-0003FS-27; Mon, 25 Jan 2021 21:36:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l49XH-0003Cl-VZ; Mon, 25 Jan 2021 21:36:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 743FA208C7;
 Mon, 25 Jan 2021 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611610595;
 bh=ajaCsDQ6e4U1hUENrIDNUbcuSNalQWKY+iQc4S18YHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfQR8nUEYwM75PG5OUFV5JcmnnumpQwkS1CnVqcT2d4p/kUpcS/2u20YYyJroZRCW
 Jbt8N0i9NWstZhVeQAoWuL0s1n+n5az5ZLRoklNtsiaP1TJWCjFUBgluHnK4qcx2vR
 E16vQW+kwJovzCui9zqUqcbslF/9K9Il+/0P40Td3raK5Q2WzGx+8y38H1+/m5CZ3T
 SSW4VXI/VuuQaVG+TxLnGPfGOo0qcOYMor1OjHyeeaSkuT9z8sM7rhBjawSDsbXbG4
 xDuvORI7oTg4YIT62Z9kQe6ps0I6CSs8pq6QDrPQmTgAxuIU4vdgt6s4t3c2vLy5LL
 LDqeEHslmluVA==
Date: Mon, 25 Jan 2021 23:36:18 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210125213618.GL6332@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
 <20210125170122.GU827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125170122.GU827@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_163636_176269_6198399B 
X-CRM114-Status: GOOD (  22.18  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 06:01:22PM +0100, Michal Hocko wrote:
> On Thu 21-01-21 14:27:18, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Introduce "memfd_secret" system call with the ability to create memory
> > areas visible only in the context of the owning process and not mapped not
> > only to other processes but in the kernel page tables as well.
> > 
> > The user will create a file descriptor using the memfd_secret() system
> > call. The memory areas created by mmap() calls from this file descriptor
> > will be unmapped from the kernel direct map and they will be only mapped in
> > the page table of the owning mm.
> > 
> > The secret memory remains accessible in the process context using uaccess
> > primitives, but it is not accessible using direct/linear map addresses.
> > 
> > Functions in the follow_page()/get_user_page() family will refuse to return
> > a page that belongs to the secret memory area.
> > 
> > A page that was a part of the secret memory area is cleared when it is
> > freed.
> > 
> > The following example demonstrates creation of a secret mapping (error
> > handling is omitted):
> > 
> > 	fd = memfd_secret(0);
> > 	ftruncate(fd, MAP_SIZE);
> > 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> 
> I do not see any access control or permission model for this feature.
> Is this feature generally safe to anybody?

The mappings obey memlock limit. Besides, this feature should be enabled
explicitly at boot with the kernel parameter that says what is the maximal
memory size secretmem can consume.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
