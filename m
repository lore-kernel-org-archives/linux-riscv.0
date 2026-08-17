Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA70FC5DF66
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFPH2YjKqrN/NyaoPBhBzsYO/Hv1dOVwlYf1SccNkAs=; b=VvEf4wbxejv6Sm
	RJy+s+RtRsDRwaVVH6bgZlRYveTOHo4QKQS+KBeFNppm1BoGGKEFCkDcCmj8al7OJZ739pScnZjjP
	RvtPvJnaDw8OSqthUhuuuTR4kJtDY5+pyImAfuFdRMAmpsyxtquBOdZL+YrYW+iXFPotcyQgMi4gD
	qatonDQ2uc878NWOmocuSZN9KPflbqMIw0Ku7wCIr/LxoV65twtde6yNooUBmhBDXuj8nrgHpvHeA
	ih1R9d/+2n7x6ukQpQv+1TmOqob6w0j1VJgNGeBJZMdux6uSgiV2AhMqb4FzNOflOJumUVCs6+k2a
	6ajM7T/yGX9TfyjjLdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz2k-00000006NcB-2Xl6;
	Mon, 17 Aug 2026 15:14:30 +0000
Received: from out-166.mta1.migadu.com ([2001:41d0:203:375::a6] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvz2g-00000006Nao-2eQ3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 15:14:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/kpJHgkNpi750FH/SGpyKpVgqGqCSp4Wcpe2Zcb2oTU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786979664; v=1; x=1787584464;
 b=uk6XiQ57o1D6iibPFn5TKPWCDhnmKhFXuHkfhwAfmPyXniTm8i72E8hoRSgSS6FxCFvtJatD
 kUmnfMkBx9oLsAHHiig6ksIVwQO3iIA/8ohr2/mwK3ZKLP8lPZNwYrmBTas2k/yJBioKWe+JgDx
 DjSVklLEX0StH/n1O0kQZ3Bc=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost (212.133.41.51)
	by smtp.migadu.com with ESMTPS id b6551f00886cde4e;
	Mon, 17 Aug 2026 15:14:23 +0000
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Mon, 17 Aug 2026 17:14:19 +0200
Message-Id: <DKRBF6LQY1L7.13CIBHAU0A87D@linux.dev>
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andy Lutomirski" <luto@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Brendan Jackman"
 <brendan.jackman@linux.dev>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "David Hildenbrand" <david@kernel.org>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>, "Heiko Carstens"
 <hca@linux.ibm.com>, "Huacai Chen" <chenhuacai@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Len Brown" <lenb@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, "Pavel Machek"
 <pavel@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "H. Peter
 Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>, "WANG Xuerui" <kernel@xen0n.name>,
 "Will Deacon" <will@kernel.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <loongarch@lists.linux.dev>, <yosry@kernel.org>
Subject: Re: [PATCH 6/6] Revert "arch: introduce
 set_direct_map_valid_noflush()"
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org> <20260816-execmem-set-vm-perms-v0-2-v1-6-90944a3ad43f@kernel.org>
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-6-90944a3ad43f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_081426_882211_39267BA7 
X-CRM114-Status: GOOD (  17.19  )
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

On Sun Aug 16, 2026 at 12:59 PM CEST, Mike Rapoport (Microsoft) wrote:
> Commit 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
> added set_direct_map_valid_noflush() to allow updating the direct map
> for a physically contiguous range in execmem.
>
> As Brendan recently pointed out [1], this API is confusing because on
> arm64 it means that is sets VALID bit in ptes, while on other
> architectures it is an analog of set_direct_map_default_noflush().
>
> The only user of set_direct_map_valid_noflush() was execmem's ROX cache
> freeing path and it was switched to utilize VM_FLUSH_RESET_PERMS for
> resetting permissions of the direct map alias.
>
> With the last user gone and with set_direct_map_{invalid,default}_noflush()
> accepting number of pages as a parameter, set_direct_map_valid_noflush()
> become a copy of set_memory_valid() on arm64 and a duplicate of
> set_direct_map_{invalid,default}_noflush() on other architecture, it is
> safe to remove set_direct_map_valid_noflush().
>
> Also drop a stale comment in arm64::__kernel_map_pages() that Linus
> bothered to add when merging changes containing set_direct_map_valid_noflush()
> to his tree.
>
> This reverts commit 0c6378a71574daa6cd1534ad42a956e3262756c7.
>
> [1] https://lore.kernel.org/all/DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Quick dump of my understanding (ignoring the NG bit on arm64)

- set_direct_map_invalid_noflush():

    x86: clear P and RW (and DIRTY)
    arm64: clear VALID

  So these look out of sync to me

- set_direct_map_default_noflush():

    x86: set P and RW
    arm64: set VALID and WRITE, clear RDONLY

- set_direct_map_valid_noflush(..., true):

    x86: exactly the same as set_direct_map_default_noflush()
         (but with a `nr` arg)
    arm64: set VALID

- set_direct_map_valid_noflush(..., false):

    both archs: exactly the same as set_direct_map_invalid_noflush()
         (but with a `nr` arg)

So basically the big issue here is specifically that
set_direct_map_valid_noflush(..., true) is special on arm64 and not x86.

And we fix that by jut deleting the API. SGTM!

The other issue I can see here is that set_direct_map_invalid_noflush()
clears RW on x86 but doesn't set RDONLY on arm64. So if you unmap
something using set_direct_map_invalid_noflush(), then map it again
using something other than set_direct_map_default_noflush(), you get
different behaviour between the archs.

I think the answer to that is probably: doing that is a bug, i.e.
_invalid_noflush() and _default_noflush() are a pair that you have to
use together. But I haven't checked if this is currently the case. Maybe
it would still make sense to just align these fully?

Anyway, aside from all this yapping, getting rid of _valid_noflush()
seems like an unambiguous win here so thanks for the cleanup!

Reviewed-by: Brendan Jackman <brendan.jackman@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
