Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E63FCC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 06:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s2+DbjtNEDwlqFQV8ztAySozV0/MIhfVTKKleEIcnA=; b=aNoaFmKFk8efzv
	swGlTbGrh9zhtaMdc99QS0vWgziVnaXVQpmC8/73uhNsNTXob16lqeakIobHKJynb4rlXxoToVeN6
	wvIilFx0kDkZa46mq+IuQm9OqkIo+bKnuxdYipfShQIr477OBd7EjE9nyyiymTetskuG/cb6dwBnX
	JfQkm62GPPUpx9ReBynZqQ1eZT3hvyIay8tOhdjc1P3KErUEr08n4LPKB9TXWWaX8riaqOu8WexU9
	AHzcpMtwPHFsHvppDz4J46dfd/ZEuMeydCSOEgQ42fR1Jt2rsPO5Bv6S55VTPB1HBWLgArs2iK9Uc
	klAgL1TffavhKMpgm6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVyG-0000000C8qt-0NWG;
	Tue, 13 Oct 2026 06:26:44 +0000
Received: from out-242.mta1.migadu.com ([2001:41d0:203:375::f2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVyD-0000000C8qC-0Vyb
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 06:26:43 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ijzhhCvBzPeAT3SqmYXHx89D90VBI7qukSZjs8T278I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791872798; v=1; x=1792477598;
 b=u9i9HxGsO3x2RvdZiMo1y0Po1scVIFQibDJHRCRougUnPXM9w7PcUAd1D5oZEM5Q58NsF8KY
 CTMpA5sg+FfSAq+7QglTMJahRbZKRUojynG++lked1XiHGWAQoySDRDBtF72CCpb/hM08/hxCum
 JrAENks08xw5/XfDhdt0Xc38=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id afbacc7007ea9f8d;
	Tue, 13 Oct 2026 06:26:38 +0000
X-Mizu-Trace-ID: afbacc7007ea9f8d
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261012202532.f059fd5ab947510a21d34cd1@linux-foundation.org>
Date: Tue, 13 Oct 2026 14:26:15 +0800
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <1F709D85-8F18-4237-BA0B-BE8442DD221C@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
 <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
 <200A83B9-233C-44C7-B4AF-0900BA1E09DF@linux.dev>
 <20261012202532.f059fd5ab947510a21d34cd1@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_232641_637749_59B45508 
X-CRM114-Status: GOOD (  12.80  )
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



> On Oct 13, 2026, at 11:25, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> On Tue, 13 Oct 2026 10:50:21 +0800 Muchun Song <muchun.song@linux.dev> wrote:
> 
>>>> The correct trailer is:
>>>> 
>>>> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use pagetable_free()
>>>> 
>>>> Andrew, would you be able to update the trailer in the patch when you
>>>> pick it up? If there are further review comments that require code
>>>> changes, I'll fix this trailer as part of the v3 respin. Thanks a lot!
>>> 
>>> I don't know if/how the -stable maintainers handle a comment like that.
>>> I expect it's more reliable to do this via Fixes:.  Possible?
>>> 
>> 
>> Thanks. I used this format because it is explicitly documented by the
>> stable kernel rules.
>> 
>> The shell-style comment is the format documented in
>> Documentation/process/stable-kernel-rules.rst for specifying additional
>> patch prerequisites:
>> 
>>  Cc: <stable@vger.kernel.org> # 3.3.x: <commit>: <subject>
>>  Cc: <stable@vger.kernel.org> # 3.3.x
>> 
>> See:
>> 
>>  https://docs.kernel.org/process/stable-kernel-rules.html#option-1
> 
> Oh.  Consider me educated.  Edited.
> 
>> A Fixes tag alone cannot express this dependency. It does not specify
>> an additional commit that must be cherry-picked first. The documented
>> Cc comment provides both the prerequisite and the required cherry-pick
>> order.
>> 
>> Would this be sufficient for the stable team to pick up the prerequisite?
> 
> Hopefully.  I suggest you double-check when you get the emails as these
> are applied to the various stable trees.

OK. I'll keep an eye on it.

Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
