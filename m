Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A536AC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4ZTdhB+4EYqDIpXR3qNODAjwRkmW1hd8O9piheKO2I=; b=P/P/OvPgGkzgFj
	XS46uiMttRswPAVjtde2uYJSrr4KLZGeg8CSUGtDQmTKzyxXCgTim3Pd4RCKhD/ElMHuXh5RAblo6
	6tcBkke/j1gPhxZvUCTndiF7baobIsY9L7atBuMns0DbGzf/D+fGLbnw0LERhZkJQIN9BuaIAyzg1
	lnmr+BDqUs+/UCWNlXzr28XTDKJeKB3W7OBO5Le0eMvMEY6IyaCZy/GkOHQKAuubRNI+iEfAF1W3F
	b+Xq/zHV1AvkHTZyQe2jOyPc/W5cHFNikOxgHkY3h/qEozzmODoLk1FX9tLVRNDOGDFuHaXrnwZx6
	G6Hqa5f7eRkPHz9PfxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1qi-00El0P-2B;
	Thu, 26 Oct 2023 15:00:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1qf-00EkzY-2u
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 15:00:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 580512F4;
	Thu, 26 Oct 2023 08:01:15 -0700 (PDT)
Received: from [10.1.36.151] (XHFQ2J9959.cambridge.arm.com [10.1.36.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 649033F64C;
	Thu, 26 Oct 2023 08:00:32 -0700 (PDT)
Message-ID: <ca11d0f7-bc4c-4f05-89e8-690da2169fda@arm.com>
Date: Thu, 26 Oct 2023 16:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
 <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
 <CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
 <20231026071300.e12dab3be1edd26007db85ee@linux-foundation.org>
 <32d9627c-821a-48f0-b430-0532a47b8699@ghiti.fr>
 <36aa1ec7-df13-4741-be09-c53a05f3d591@arm.com>
 <20231026075415.47c0a032906b604de08ed39b@linux-foundation.org>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20231026075415.47c0a032906b604de08ed39b@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_080038_039109_1501957F 
X-CRM114-Status: GOOD (  11.15  )
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

On 26/10/2023 15:54, Andrew Morton wrote:
> On Thu, 26 Oct 2023 15:30:44 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>>>>> Those fixes finally did not make it to 6.6, I was hoping for them to
>>>>> land in -rc6 or -rc7: for the future, what should have I done to avoid
>>>>> that?
>>>> They're merged in Linus's tree.
>>>>
>>>> 6f1bace9a9fb arm64: hugetlb: fix set_huge_pte_at() to work with all swap entries
>>>> 935d4f0c6dc8 mm: hugetlb: add huge page size param to set_huge_pte_at()
>>>
>>>
>>> Oops, sorry, I missed them this morning!
>>
>> Those two patches that Andrew highlights are the fix I did for arm64. Weren't
>> you referring to the corresponding patches you did for riscv, Alex?
> 
> These are in mainline:
> 
> 1de195dd0e05 riscv: fix set_huge_pte_at() for NAPOT mappings when a swap entry is set
> 117b1bb0cbc7 riscv: handle VM_FAULT_[HWPOISON|HWPOISON_LARGE] faults instead of panicking

Ahh, great - I think they were probably the ones Alex was talking about.

> 
> I'm not sure what happened to your "riscv: hugetlb: convert
> set_huge_pte_at() to take vma" - perhaps it was updated.

I modified the approach for v2 (pass size param instead of vma) and it got
squashed into 935d4f0c6dc8 mm: hugetlb: add huge page size param to
set_huge_pte_at(), which is in.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
