Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A1FCD4F4C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Sep 2024 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeIB1BzbHPwGhhiEBtAVsdr2cd9LikiFrRiufYnsdUU=; b=PUvwbK0UXVfLdK
	FlXwuxvqxu2nGn5DxZQFSfcXP+UQmR0ObmAC6tDzg4ajIQIBgk9jeBPcO3/S+RtvqeFCLL4h4k5QK
	u42WmXOkOwYKq6s6bG24ll7mBzYeKVKk7AiDFaWgzAJERWryC0HvZ1IvpfSXT6HTnLnDWAyb1zqVC
	MLQeNum/oQdqgQlWJySKehAe9XtaOwtXxyMHxnSO6oZRWZs4/WYQU6fdmaZMgn1sscRB9nqI/0UrE
	dd6MLJom8h+fOtz1atkB4qwG2E7EHLX6Cfh2Pa1CYznUhZGye32l9loqvCk8Y7Gvk7y+yUxAob9gk
	mN4jScnDNtwJGh8dauww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIdT-0000000Gulv-14vu;
	Sun, 08 Sep 2024 14:11:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIcR-0000000Gucn-1C4U;
	Sun, 08 Sep 2024 14:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E96C25C06AE;
	Sun,  8 Sep 2024 14:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66505C4CEC3;
	Sun,  8 Sep 2024 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725804622;
	bh=L52NrvFH6cCL7WSJulp5eAsipG5pw57QkN8inQ79Oco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g21nXnFpknMI2iSsRnuzU8ofufypbHq8Lycu/54iYLStunG5IRZvwfEehMdKJCFG+
	 o/lsVIe/S+2/vXnDXjLQnFUUA35NEZxM9SDl/lsd9iyNA0rTGcFNN5pZT2Uak6fhOB
	 EXTO5l2M3fz6xF3tSWgeivOPR0rTxa1b+G+P+SK0=
Date: Sun, 8 Sep 2024 16:10:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: stable@vger.kernel.org, sashal@kernel.org, alexghiti@rivosinc.com,
	palmer@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, dvlachos@ics.forth.gr, bhe@redhat.com,
	samuel.holland@sifive.com, guoren@kernel.org, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, willy@infradead.org,
	akpm@linux-foundation.org, fengwei.yin@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, conor.dooley@microchip.com,
	glider@google.com, elver@google.com, dvyukov@google.com,
	kasan-dev@googlegroups.com, ardb@kernel.org,
	linux-efi@vger.kernel.org, atishp@atishpatra.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	qiaozhe@iscas.ac.cn, ryan.roberts@arm.com, ryabinin.a.a@gmail.com,
	andreyknvl@gmail.com, vincenzo.frascino@arm.com,
	namcao@linutronix.de
Subject: Re: [PATCH 6.6 4/4] riscv: Use accessors to page table entries
 instead of direct dereference
Message-ID: <2024090808-elusive-deviate-3bbb@gregkh>
References: <20240906082254.435410-1-wangyuli@uniontech.com>
 <D68939319C9C81B0+20240906082254.435410-4-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D68939319C9C81B0+20240906082254.435410-4-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_071023_653999_C3B28C4D 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 06, 2024 at 04:22:39PM +0800, WangYuli wrote:
> From: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [ Upstream commit edf955647269422e387732870d04fc15933a25ea ]
> 
> As very well explained in commit 20a004e7b017 ("arm64: mm: Use
> READ_ONCE/WRITE_ONCE when accessing page tables"), an architecture whose
> page table walker can modify the PTE in parallel must use
> READ_ONCE()/WRITE_ONCE() macro to avoid any compiler transformation.
> 
> So apply that to riscv which is such architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Anup Patel <anup@brainfault.org>
> Link: https://lore.kernel.org/r/20231213203001.179237-5-alexghiti@rivosinc.com
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

all now queued up, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
