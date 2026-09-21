Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5CDC982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbHpSt3bdvQ0k7/HH7nZmAGoKfx6K6DZAlvAvQmjuKE=; b=rgk+eSm0KUXGdY
	l5r4O1kcLbWQPDyOmY1Oly76v377t2ZvIx0KgXU3U6WZKxnihpV2EyQuwfnRr3sfQqGv+tnsYFwAd
	ax45Me4nCN3ikvBSH0tZ80wpgvRTlqaVVdibaLh9FA+H4kqmkEVX+csIPi1pkYnQAgxQIRl/Edwej
	FJDX5fuKCQKANx87YPQYggwbtFFgNm4/FJZg/vvcY5Gjb5ecMKtGHy8Lp7nc03yBBHWUbEO4mix9r
	JWa4LxsCZVRp3nSHE2NAELG8lZFsPBWm1H73XPNhkxiLfAl5Wr89cTjIwiPlpGX/dsf/KEsiwSGrb
	/kjYWurUOiEnENEc+hTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dVn-000000029Jr-1rup;
	Mon, 21 Sep 2026 12:52:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dVk-000000029IW-3ghe;
	Mon, 21 Sep 2026 12:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SzH6oaCFG7t+R6A2JTnhFNipDr4x6RdDll0UxEV89ec=; b=Wdc4fOJ/7YLtku8yVgNJMimjfq
	br/ykVD6+fpxJv4b/lA0Ei7QHmS3Edl5Vp+CPR3Eu8LuPtK0vMuvfs4tSmj0Cs26le5i3Lrp/Xzqg
	Zv/+78jfOzT8LdE2VkoOzqKXoOFRPGwm1FiJLQuIL5w1ZnYS4n8q0lYqoKKcxd6CyyAfpJ2Y2wY4J
	3a9zhxfZC6YDaKms+Kq6iPE7hp4dLfJwx21VvtL2Msy7xGEQMa49JmpHb7X3AJUFmeYp1vAPZr59t
	XqQ104RBGR5KGEjKTNQfhgdbNMYCyxXq4TjqUwlaM6eGXnwV7spHcWNKevrMQEr8ol0uP8/CxawUb
	KydI8LNA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dVg-0000000CIi1-3RT1;
	Mon, 21 Sep 2026 12:52:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2F87176C;
	Mon, 21 Sep 2026 05:52:34 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7E673F86C;
	Mon, 21 Sep 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789995158; bh=K/50ZomrN1bFLTBeeVPhJwuc1yciBmPSu8YX6Qsus9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFZe4bpR5E17t5D1Lm9j6zlnOoMKygimSB1DPY+3+q0C6iJgg+EiBHxg6xnrKV8uS
	 ne9l4ZgvIvWxD6dQ7eM1P+nFVo3S70EXtWpP4Lh2XJhn7wUJFW+NV19QrXwjpC/RJ4
	 gyNTyjuCs5XZdDcvhmAKMYX8J4AXAbctL+YOlquU=
Date: Mon, 21 Sep 2026 13:52:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v5 3/6] dma: swiotlb: Centralize minimal pool sizing
Message-ID: <arEojDWvwtMZnmBx@arm.com>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260921063628.362078-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_135241_628820_92ABCBA2 
X-CRM114-Status: UNSURE (   9.39  )
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

On Mon, Sep 21, 2026 at 12:06:25PM +0530, Aneesh Kumar K.V (Arm) wrote:
> A default SWIOTLB pool used only for unaligned kmalloc bouncing can be
> smaller than one required for limited DMA addressing. Arm64 and RISC-V
> currently implement this sizing independently, using 1 MiB of SWIOTLB
> space per GiB of RAM.
> 
> The SWIOTLB core now identifies this case with SWIOTLB_POOL_MINIMAL.
> Size that policy in swiotlb_adjust_pool_size() and remove the
> architecture-specific adjustments.
> 
> Explicit swiotlb= sizing remains unchanged because swiotlb_adjust_size()
> preserves a user-configured size.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
