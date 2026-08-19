Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A9BC5DF81
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XqBLFLSS8PKktDleqDE1jOZr/vcplyhd4oOF1nI+k8=; b=Uz0rWUsUgzUJE9
	tF6M0X93lsNPFVUMz1CrLzFD4HOcz0sExRfZ6hP5lkoBfxVAZk1TPogKl26FY2w2vW6g5dpDGBD+N
	zX5Xj3A5Y3ozwzn4667vJS21JlE8nm1467sHbbO7l3SGB8LEJlltNrM9Nyolc1N73XoTF2pN+6XVu
	f3Ag7J3GkND3WiV8LtXcJQmgDcBMkMvHxzV9n/Kgg6FykOUPsLpQQkHSgDGsUvWTtV1d/cBkp98FS
	vAgyIgYm6XsoBl+nuDXPV0RTSL+xiIt+/MNMEx14jaRTnsMhn3htj+85Md7TKFlhK4rHvktcpnxva
	GtlODpKcOchM4V6xEnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaUn-00000009AVL-0945;
	Wed, 19 Aug 2026 07:13:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaUl-00000009AUo-2hAA;
	Wed, 19 Aug 2026 07:13:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0871601FB;
	Wed, 19 Aug 2026 07:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCAB1F000E9;
	Wed, 19 Aug 2026 07:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787123634;
	bh=MEh93umEkAdwM7W7h5DMLx7l0jri6Tex4Ey3QmOKRt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJV0OzwVbpNuL1O7IKYFMOfkJNn5jUunHF3YbR6s3DRCL2TlLVhLPBotWdiGtRokA
	 tmvHyqyp+imK+t1Fq3nxpk977s16W+HIjEKyInWVUV1oA//lPAb6rPWocpZquA5Ccm
	 bgwCf3DzoBtBiJCPGwlFz9HjCr/lq2MMwhpgdxHoSsupRhmU3NSJ07HL6c5BUc2jmQ
	 uN/InEQopdQkSXzswZqrN8YxkDoenas2ccCQodY70U8cWRig2OBGou4vh1U4PakYtX
	 vAKsses0e/ZiFmKxHArYa8yhDZVE4w8x5VBUX22681OzmQsFslwRWWGAKw1WggWAbV
	 zsPrgq11T43eA==
Date: Wed, 19 Aug 2026 10:13:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev, yosry@kernel.org
Subject: Re: [PATCH 6/6] Revert "arch: introduce
 set_direct_map_valid_noflush()"
Message-ID: <aoVXolZ1pEJBZNjF@kernel.org>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-6-90944a3ad43f@kernel.org>
 <DKRBF6LQY1L7.13CIBHAU0A87D@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DKRBF6LQY1L7.13CIBHAU0A87D@linux.dev>
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

On Mon, Aug 17, 2026 at 05:14:19PM +0200, Brendan Jackman wrote:
> On Sun Aug 16, 2026 at 12:59 PM CEST, Mike Rapoport (Microsoft) wrote:
> > Commit 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
> > added set_direct_map_valid_noflush() to allow updating the direct map
> > for a physically contiguous range in execmem.
> >
> > As Brendan recently pointed out [1], this API is confusing because on
> > arm64 it means that is sets VALID bit in ptes, while on other
> > architectures it is an analog of set_direct_map_default_noflush().
> >
> > The only user of set_direct_map_valid_noflush() was execmem's ROX cache
> > freeing path and it was switched to utilize VM_FLUSH_RESET_PERMS for
> > resetting permissions of the direct map alias.
> >
> > With the last user gone and with set_direct_map_{invalid,default}_noflush()
> > accepting number of pages as a parameter, set_direct_map_valid_noflush()
> > become a copy of set_memory_valid() on arm64 and a duplicate of
> > set_direct_map_{invalid,default}_noflush() on other architecture, it is
> > safe to remove set_direct_map_valid_noflush().
> >
> > Also drop a stale comment in arm64::__kernel_map_pages() that Linus
> > bothered to add when merging changes containing set_direct_map_valid_noflush()
> > to his tree.
> >
> > This reverts commit 0c6378a71574daa6cd1534ad42a956e3262756c7.
> >
> > [1] https://lore.kernel.org/all/DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> So basically the big issue here is specifically that
> set_direct_map_valid_noflush(..., true) is special on arm64 and not x86.

More precisely arm64 differers from all the rest.
 
> And we fix that by jut deleting the API. SGTM!
> 
> The other issue I can see here is that set_direct_map_invalid_noflush()
> clears RW on x86 but doesn't set RDONLY on arm64. So if you unmap
> something using set_direct_map_invalid_noflush(), then map it again
> using something other than set_direct_map_default_noflush(), you get
> different behaviour between the archs.
> 
> I think the answer to that is probably: doing that is a bug, i.e.
> _invalid_noflush() and _default_noflush() are a pair that you have to
> use together. But I haven't checked if this is currently the case. Maybe
> it would still make sense to just align these fully?

All set_memory + set_direct_map functions very much rely on caller to know
how to use them right. There were only handful of users outside of arch/ so
it was kinda sustainable. With the increased demand for those, security and
whatnot, the whole bunch of set_memory functions needs some love.
 
> Anyway, aside from all this yapping, getting rid of _valid_noflush()
> seems like an unambiguous win here so thanks for the cleanup!
> 
> Reviewed-by: Brendan Jackman <brendan.jackman@linux.dev>

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
