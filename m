Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD04CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 05:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48VpCMcFvrygRrw+q9pDatI+iNCw4b6xBZOxclj/92w=; b=J2bnWkkYpb8Wvz
	BHj207wh9B1KKXfr5G7PS8P3WYYptfLu/Zr4GKZbp1Pil2mwm4atFRifP7O701dvwFgrq4pnbBMQj
	1NC9K3ZLzPJmpmscp1otK9e5x96vdreApo2Xc//P1PwX6ubqMO6uhhx7Qi8TG9ag0XLVyohD+Jebt
	PukV9j8tWzeVIJBbdeP1PJPoOX6240FRJacScV+KL8JLviZtcdRq+jfCdfaS8Zb5SIvRl/gpL27X8
	abhpjYWc4+nYwkfaQvIEFqEC9SavjIk0Gj7+3EOetR6bvoAYBSixOaeSjpHaOvfXIxnQfabYG4YxZ
	tr+khgdqNgMbS9xM77Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqH8-0000000EEKg-0jbR;
	Mon, 18 May 2026 05:12:22 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqH4-0000000EEJQ-2xNw;
	Mon, 18 May 2026 05:12:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id A440768B05; Mon, 18 May 2026 07:12:07 +0200 (CEST)
Date: Mon, 18 May 2026 07:12:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Christoph Hellwig <hch@lst.de>, kreijack@inwind.it,
	David Sterba <dsterba@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
	Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
Message-ID: <20260518051207.GB9374@lst.de>
References: <20260512052230.2947683-1-hch@lst.de> <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz> <20260513054742.GA1018@lst.de> <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it> <20260515043705.GA3855@lst.de> <34C16854-1065-4542-8836-DDED58EC1844@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34C16854-1065-4542-8836-DDED58EC1844@zytor.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_221218_895492_3DC5D2E9 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri, May 15, 2026 at 12:59:34PM -0700, H. Peter Anvin wrote:
> I don't think this is a good idea. Error out; it is the btrfs maintainers' job to ensure user data isn't lost. 
> 
> The RAID-6 code has *never* supported only 3 units, and if it ever worked for *any* of the implementations it was purely by accident. Speaking as the original author I should know; this was deliberate as in some cases the degenerate case (3) would have required extra trays in the code to no user benefit. 
> 
> I would not be surprised if the kernel crashed or corrupted the page cache in that case.

It does, that's why I wanted to exclude it.  Anyway, for the about to be
resent version I'll drop this btrfs patch over the stated objection and
will otherwise not change anything.  This means the (IMHO hypothetical)
users of this configuration will get a WARN_ON_ONCE triggered, but
otherwise keep working (or rather not working) as before.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
