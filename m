Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D45CA0EF5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucO7HG6kYeAqEtm+n3WiDLkgAOvq5WeMVRxmrovk0gU=; b=gjQvpdSGc3j5lr
	iLpSNhrppVrBUjYGN4tFVBpktbIv2wrKTDeJLYV3sI/4PL3sR0w+pCEbDLHuLLaCRNaEoRLTTaVy+
	ZcOVwn6J/ueO/tRk+zVmoNXw7YDu/SFgcbyaCmZNEEey+3f3M8wm48GS+1FFom3vuOWHU0wFBBGXY
	9JPJbzUD8U/Ow2QhZPP4Wf5JNNyM2Im1CMHtLOhP6f+MEIDyTGeC4WJH1usO+3B7PzdplvtpiVjKV
	tI5mV5TD6L2jtd5X7jTUgFhCvmvbCfyn6sA+3RiR54t60F0Q4LI3KwFZMNZBwySSb+xBX0FCneTo5
	An49bhBbIDQF3ykjlAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoB8D-000000095Tn-1LeN;
	Tue, 19 Aug 2025 01:27:21 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoB75-0000000958F-1aFV;
	Tue, 19 Aug 2025 01:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1755566764; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5OVVf637/rFSQpfwdp/hg0O0Ow8p4WzZ4tWTlQ0JpQc=;
	b=XetVaU+0XQ04QNdiA+DzFvMllbtQw6WhwXiJ7WQuP8Deao4S8yPbmXByvGTp6EdnfiZN4HCGZF4XCu73m1D57YMTr13sSx1VYN3M+5MtugHXwATwaRyKl1WTsu9E0nr9vjKTQ+4tCYJi99VaGVJkIIQs5lppkyjpCHApCZqrQH4=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wm4m1nl_1755566758 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 19 Aug 2025 09:26:00 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@linux.alibaba.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within kvm_riscv_gstage_ioremap
Date: Tue, 19 Aug 2025 09:25:58 +0800
Message-Id: <20250819012558.88733-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAAhSdy3omyk7YGVHNV5mgR13cON1SxdpqsxGQJsWWE1Hoyw=5A@mail.gmail.com>
References: <CAAhSdy3omyk7YGVHNV5mgR13cON1SxdpqsxGQJsWWE1Hoyw=5A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_182612_018629_9755F322 
X-CRM114-Status: GOOD (  14.82  )
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

>>
>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> Currently we use kvm_riscv_gstage_ioremap to map IMSIC gpa to the spa of
>> guest interrupt file within IMSIC.
>>
>> The PAGE_KERNEL_IO property does not include user mode settings, so when
>> accessing the IMSIC address in the virtual machine,  a  guest page fault
>> will occur, this is not expected.
>>
>> According to the RISC-V Privileged Architecture Spec, for G-stage address
>> translation, all memory accesses are considered to be user-level accesses
>> as though executed in Umode.
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
>Overall, a good fix. Thanks!
>
>The patch subject and description needs improvements. Also, there is no
>Fixes tag which is required for backporting.
>
>I have taken care of the above things at the time of merging this patch.
>
>Queued this patch as fixes for Linux-6.17
>
>Thanks,
>Anup
>

Thanks for your review.
I will send a v2 patch to fix these comments.

Thanks,
fangyu

>> ---
>>  arch/riscv/kvm/mmu.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
>> index 1087ea74567b..800064e96ef6 100644
>> --- a/arch/riscv/kvm/mmu.c
>> +++ b/arch/riscv/kvm/mmu.c
>> @@ -351,6 +351,7 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>>         int ret = 0;
>>         unsigned long pfn;
>>         phys_addr_t addr, end;
>> +       pgprot_t prot;
>>         struct kvm_mmu_memory_cache pcache = {
>>                 .gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
>>                 .gfp_zero = __GFP_ZERO,
>> @@ -359,8 +360,11 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>>         end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>>         pfn = __phys_to_pfn(hpa);
>>
>> +       prot = pgprot_noncached(PAGE_WRITE);
>> +
>>         for (addr = gpa; addr < end; addr += PAGE_SIZE) {
>> -               pte = pfn_pte(pfn, PAGE_KERNEL_IO);
>> +               pte = pfn_pte(pfn, prot);
>> +               pte = pte_mkdirty(pte);
>>
>>                 if (!writable)
>>                         pte = pte_wrprotect(pte);
>> --
>> 2.39.3 (Apple Git-146)
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
