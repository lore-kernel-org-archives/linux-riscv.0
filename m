Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200ACCD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/KTqqjxxppgKNPpo/a/DyXM+A60q3WO4pche4ARbKE=; b=xHKgmvN4iLR2uR
	YS+UJ4Hk/jFFuPXJo+bYil0zmR4CSDtzhmwiqjewsHcWQXkdjR1aco+SRmw21CCqUtUoSZsj7RB4u
	BxdeJwn11Oq/MdlTZAAJ+/8Ge5O2xKhwGDUNtO7qzjOL2XLH0dbnEJM33U/ek5/ALxKDAMam1jwPz
	/WqGIQxvOi1eXv/wTA/VlL4EqwEfXdgOh5El6tDBKV9HOC2V5/DDKHrUhWm91YH6ZrasZ+2gsziJ2
	omqHfIvLWFtgV0wQ1mqkTFfR5srKDfe8R6z19yQomh+mqQVF9hVUq744fJrF1/KYr8t3yxKIIUQIA
	9D4vsxqNZq4etmKUW8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQRy-0000000Dgi8-3klR;
	Mon, 11 May 2026 13:13:34 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQRv-0000000DghE-1o3s;
	Mon, 11 May 2026 13:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M8lmcQvjJ5LUpDA4EmGDDTnt8GNDhiFnrJNCJhkuZWM=; b=XmiFKaklZ3QQYtH8/ygJpRi6/c
	cJ9m6w27ps4ZkaQs+L3zmaULdxP92hxNU3mBsUHkvC5gV/Gr2OWyX7UNQwKGJQMGSIgDGnMR05nSr
	6Hz3vsI22lcNtQs/VMzI48fbeiQc3TW5qrsNxcffxftFa5xlDo5LQ3kJ7Q0m2F5+M5D8c3G+2BDUt
	Wr7OwYwQSZNfs/cIihoRG+30TDa9XqeX3dKysWM/Sidq9OVS27lVgnLamFYvGQfr7bsghipMWPyrI
	mYwBzzTjZXPAId0EF/iDyo+lUuvmMRF8iddzWl4iCApO3hINgAD4OJDf0mLBEMdj/gGrp5p3Xx6ka
	a7gITkwQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMPmt-001bCJ-0c;
	Mon, 11 May 2026 12:31:07 +0000
Date: Mon, 11 May 2026 05:30:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, pmladek@suse.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, kuba@kernel.org, 
	ebiggers@kernel.org, lirongqing@baidu.com, paulmck@kernel.org, 
	sourabhjain@linux.ibm.com, coxu@redhat.com, jbohac@suse.cz, ryan.roberts@arm.com, 
	osandov@fb.com, cfsworks@gmail.com, tangyouling@kylinos.cn, 
	ritesh.list@gmail.com, adityag@linux.ibm.com, guoren@kernel.org, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, wangruikang@iscas.ac.cn, namcao@linutronix.de, 
	chao.gao@intel.com, seanjc@google.com, fuqiang.wang@easystack.cn, ardb@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, takahiro.akashi@linaro.org, 
	james.morse@arm.com, lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v13 04/15] arm64: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
Message-ID: <agHL1zzC5bzgoCiJ@gmail.com>
References: <20260511030454.1730881-1-ruanjinjie@huawei.com>
 <20260511030454.1730881-5-ruanjinjie@huawei.com>
 <agGkvrg06KNDNfDi@gmail.com>
 <79c14bee-b1f5-4d70-8345-6582d6cf0128@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79c14bee-b1f5-4d70-8345-6582d6cf0128@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061331_499273_B74E62CF 
X-CRM114-Status: GOOD (  24.30  )
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

On Mon, May 11, 2026 at 07:30:44PM +0800, Jinjie Ruan wrote:
> 
> 
> On 5/11/2026 5:46 PM, Breno Leitao wrote:
> > On Mon, May 11, 2026 at 11:04:43AM +0800, Jinjie Ruan wrote:
> >> There is a race condition between the kexec_load() system call
> >> (crash kernel loading path) and memory hotplug operations that can
> >> lead to buffer overflow and potential kernel crash.
> >>
> >> During prepare_elf_headers(), the following steps occur:
> >> 1. The first for_each_mem_range() queries current System RAM memory ranges
> >> 2. Allocates buffer based on queried count
> >> 3. The 2st for_each_mem_range() populates ranges from memblock
> >>
> >> If memory hotplug occurs between step 1 and step 3, the number of ranges
> >> can increase, causing out-of-bounds write when populating cmem->ranges[].
> >>
> >> This happens because kexec_load() uses kexec_trylock (atomic_t) while
> >> memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
> >> with each other.
> >>
> >> Add the explicit bounds checking to prevent out-of-bounds access.
> > 
> > It seems you have a TOCTOU type of issue, and this seems to be shrinking
> > the window, but not fully solving it?
> 
> Hi Breno,
> 
> Thanks for your comments regarding the TOCTOU issue.
> 
> You are correct that the current bounds checking only "shrinks the
> window" and prevents a kernel crash, but doesn't fully guarantee header
> consistency if a race occurs.
> 
> In my local environment, this race is extremely difficult to reproduce,
> but it is theoretically possible.
> 
> To address this properly for arm64, I am considering two steps:
> 
> - For this patch: I will change the return value to -EAGAIN and keep the
> bounds check. This ensures that even if a race happens, the kernel
> remains safe (no OOB access), and user-space is notified to retry.
> 
> - Long-term solution: A better way to solve this is to implement ARM64
> CRASH_HOTPLUG support (similar to x86). With crash hotplug, the kernel
> will automatically re-generate the crash headers whenever a memory
> hotplug event occurs. This makes the TOCTOU during the initial
> kexec_load less critical, as any transient inconsistency will be
> immediately corrected by the subsequent hotplug handler.
> 
> Does it make sense to you to use this patch as a safety guard first, and
> then I (or someone else) follow up with the full CRASH_HOTPLUG support
> for arm64 as [1]?

It would be OK for me, but, make it explict that there is a TOCTOU
issue, that depends on CRASH_HOTPLUG.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
