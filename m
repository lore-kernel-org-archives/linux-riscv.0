Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA414CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcRPTpP4ZYzThP+3QYvECR/Tg4sIUsT2diSuLMb0twE=; b=SqbYVg3eQgBu26
	AzW61oi4OQ9zvq//foaYfg4+FtFs5YWoNFjkFIoyjX9q7NfFoXe4+tap4+r1s5nGfHb5dTv/pkBQo
	PJ4HyTwInaXWebqseyfsIJQm6YOLb5hvoM+mKfBwZ34amMBUkH6pOszRVCpIZ00M6mqtoZK4vAMSe
	qXDTetNUVHIzULTjCrQHhTmgE8ojXfYwxiqeXDOvY5K55v7fbohnXb4rWsVfb7YkmR6HxvIXcMTF9
	/BbAHdDwsKBBGJ5tHBGiwULYIwanDZS2Da24J10V1aC3OrQC3FGtezhgv4JYICqbE72iMLTKNf1Oh
	IguVuTNHGXaoSOTGkBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7UO-000000009fz-44MA;
	Wed, 03 Apr 2024 20:45:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7UM-000000009ez-0BLK;
	Wed, 03 Apr 2024 20:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7100612A4;
	Wed,  3 Apr 2024 20:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8F4C433F1;
	Wed,  3 Apr 2024 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1712177140;
	bh=yNRma02riMpShZw5OlGNXboXuC4yjz6G1J9H55luJl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WbDgetigVfP4aw5GQwkC4/+qzJgMfkCRZ/CwVfM+DoWhVsV2cSyKM+d0KjSYmohjG
	 D9MNWSGnvMyDqphojTexHK6yncBn+D75NAjadehGe185l4ywdlwBA4CRdqXEgUAQpQ
	 LFHfUu8b17Q+Go/GjBQs5pUYIY0N53InUiC/aUt8=
Date: Wed, 3 Apr 2024 13:45:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <surenb@google.com>, <linux-mm@kvack.org>
Subject: Re: [PATCH v2 0/7] arch/mm/fault: accelerate pagefault when
 badaccess
Message-Id: <20240403134539.fde3a6c594f2d88409be30ed@linux-foundation.org>
In-Reply-To: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_134542_159924_56D1CA2E 
X-CRM114-Status: GOOD (  10.61  )
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

On Wed, 3 Apr 2024 16:37:58 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> After VMA lock-based page fault handling enabled, if bad access met
> under per-vma lock, it will fallback to mmap_lock-based handling,
> so it leads to unnessary mmap lock and vma find again. A test from
> lmbench shows 34% improve after this changes on arm64,
> 
>   lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198
> 
> Only build test on other archs except arm64.

Thanks.  So we now want a bunch of architectures to runtime test this.  Do
we have a selftest in place which will adequately do this?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
