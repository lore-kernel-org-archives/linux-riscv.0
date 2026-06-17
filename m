Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB8CD98F2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbciNn8A67ZPoFZIG+O1d9VRkhages4zaulgXwAdjZU=; b=d2CE9z7w/Rbuyi
	KKD5IlASD0bIFAwO4OGgH2hR6YfWwOktF7Gpu6CFxxb1pHKQKZnU8y80x2vS5xGS6oUazajRBfl1q
	MddIhUXYjPvzE94Foo7+kAaXXjonaSmHX+PQ0t66NVrVGi3Rn7Jamfp/qnY0TXjMd4lgZspxBPYtq
	Em4B5YNTBequZBJfVTvGa4Hw4dKWCyRPhY/Eqv/lk47G//zfmOca8s4ImJAaa0bHRtTuFCNojaKhv
	z4Vw+vcF1oBNDtzCvpkcgVnMfQvQh6OfT/5trJ8Cn4te+frHZ/mulG8FxHYIFSKJ8kIyqdJBfqwYi
	yrFf+NO1j5TUwghZVixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvJP-00000000C4Y-0uzr;
	Wed, 17 Jun 2026 18:48:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvJN-00000000C4K-3uwE;
	Wed, 17 Jun 2026 18:48:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10CDD44340;
	Wed, 17 Jun 2026 18:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB851F000E9;
	Wed, 17 Jun 2026 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781722108;
	bh=wAJ/16SDwjLEOofHEjGBdhyMJ22bR01mfpkTmi9LqFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0jjWACcAyI73k4vozNk2hdrYq1Z/OE/QQr/fRC/3Fl/wMR6SalSveexvcnvhtP8P
	 sq0k5gKrOkUnhySqDsFacXi4LLQFsE4ZV+6S6Ub2Ztim/SxxqlIirTQTZyDMRypJg5
	 kTkhhdh10kVYN7b1AVsMojdJHHdWirds7fJByCy/bVzEjtn4hCnNqlP4c2Q76E07+J
	 eG9/Y/c55qkexQaoCzKYrj0bGXa4hlplXuQ+cWnkw9qoLKXnMxH0IxuDBclIZDg6JE
	 0jZ9y0rnn+J0b0RDlvVliyoQmsfZfKdlnUO5gBx+frcYJ50r+myYpGn0tA3W9QyChl
	 toG4cYtw/dfLQ==
Date: Wed, 17 Jun 2026 21:48:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org,
	leitao@debian.org, coxu@redhat.com, Liam.Howlett@oracle.com,
	ryan.roberts@arm.com, osandov@fb.com, jbohac@suse.cz,
	cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	adityag@linux.ibm.com, liaoyuanhong@vivo.com, seanjc@google.com,
	fuqiang.wang@easystack.cn, ardb@kernel.org, chenjiahao16@huawei.com,
	guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <ajLr53EK6mJbng-7@kernel.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608073459.3119290-1-ruanjinjie@huawei.com>
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

Hi Jinjie,

On Mon, Jun 08, 2026 at 03:34:49PM +0800, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> This patch set is rebased on v7.1-rc1.

Please rebase this set on v7.2-rc1 once that's out.

I'm going to queue it in the liveupdate tree then to expose to the wider
testing.

Meanwhile it would be great to chase riscv and x86 maintainers for acks :)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
