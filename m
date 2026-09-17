Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CBAC982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ePFPw+PQ3mvB5J8ctUp5sb7dFOQj8NMjKERnOe2xWs=; b=i0set+tBNnuCkk
	x9giT6jvSCYgS4tRH0Jekxo+eluJY8BCsbGsmmrXAMYH32tlmdIm3fjyhvUJ6VKbhkqRhjH3HCOXH
	XuZSRMRm+CHud35nVyrs6TPUp+BMAOO7GY/3/IxFSmdQ8wDmUgBMGKA1IcKvpz43GdMGMK5anDfuZ
	eDtaTlEzNfn8mG19G8dwtJTo9R28TR6xQcrJ+ptFwKEhUYEdSN5xNSps+ekCizckL+MSAeMA29Bv2
	Cei3A4M0FKhvzEAX43lBiUVog6JwQDoku1OYBmLRom2xIRhiyZKd7pr9o0OPrd5Qf24tWMKTxspLy
	0qhniNSNsa60N9QoNotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gc4-0000000CC4Y-1wGL;
	Thu, 17 Sep 2026 18:13:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gc2-0000000CC3w-2mvV;
	Thu, 17 Sep 2026 18:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QAr23lhx8wGsXT6yVi+oXiSZp/vetZhFYtO/kqi1324=; b=pWn0euMqbr6+SOQwdN2z09hjYk
	eVeiJEsWykWVYO4yrkjOng1RjNzFV+T+A/kVqOQGYfxhtpFO2ZOV/2SfDj3sPlsTLtgaAjfNTPs5E
	sqJgRtdo97rqiX1AqhajpGR9a9/VyVZG54Xe9UyKsslL4wklUQd+BlSLqutS4SS5hYeegWVyIhwqh
	qT8mQ6TOZPbE49QzFJus5g8F8k+Sv+Y690d/Ue7z52sZb4Mz9ig+4agaFePZGjgboE5i0XPzWWL4/
	Q11HlpKEA7MBVCNDQjpFStNHPBhlcIyiDzXPjJIcFBrnkoN/1seOjFINScY13QOKn5aC83HMmWpcZ
	pmc6nXrg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Gbz-000000099NJ-0Rsu;
	Thu, 17 Sep 2026 18:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB24D1F91;
	Thu, 17 Sep 2026 11:13:25 -0700 (PDT)
Received: from [10.57.7.135] (unknown [10.57.7.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69F63F86F;
	Thu, 17 Sep 2026 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789668809; bh=QAr23lhx8wGsXT6yVi+oXiSZp/vetZhFYtO/kqi1324=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aYA7qe3TJmI5eXy7zuCDNvjC424BNkx9TqHpOMlyNEkNvwpgRn5lsECsH9o7hC0RG
	 5jIxS0q8ZHaQOP2dIWzY39HZw+w/QDzFAaZ5etprv7QyoTOG2UkZgMUVBbr0E0ztmK
	 wHMiHRGdA5HaFJ3DgcETN41w6QqxGhhxvHgViRbE=
Message-ID: <685fa7b1-af6d-4dc0-8764-5bcb169b39ae@arm.com>
Date: Thu, 17 Sep 2026 20:13:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] mm/execmem: use VM_FLUSH_RESET_PERMS for ROX cache
 allocations
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-5-949b64a9f755@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-5-949b64a9f755@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_191331_544109_70E97BE4 
X-CRM114-Status: GOOD (  14.09  )
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

On 03/09/2026 11:28, Mike Rapoport (Microsoft) wrote:
> Initially execmem completely removed direct map alias for the memory
> allocated for the ROX cache in PMD_SIZE chunks. When that memory was
> freed, its direct map was restored also in PMD_SIZE chunks to avoid
> fragmentation of the direct map caused by vmalloc::vm_reset_perms().
>
> This required execmem to implement the wrappers for set_direct_map APIs for
> proper sequencing of removal and restoration of the direct map aliases.
>
> Since then x86's CPA gained support for collapsing the direct map page
> tables for ROX pages and execmem switched from removing ROX caches from the
> direct map to making them ROX there, so execmem only needs to update direct
> map alias permissions when freeing the ROX cache memory.
>
> vmalloc already handles those updates for areas with VM_FLUSH_RESET_PERMS
> set and vmalloc::vm_reset_perms() does not force split of the direct map
> for PMD_SIZE chunks.
>
> Set the area permissions with set_vm_flush_reset_perms() when populating
> the execmem cache just before flipping the area to ROX.
>
> This way freeing an allocated area on an error path won't incur two
> updates of the direct map alias of that area and TLB flushing in
> vm_reset_perms().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
