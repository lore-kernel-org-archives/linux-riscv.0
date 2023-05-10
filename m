Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF2C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYagCJoCe3F+Nma7OPfYS6TTLcMWksseqtvwd7x+obY=; b=Mymxyv+96M1Ra5
	ORf7WkM7cUWrV9SZY9QILSxbBk/7Bx34sqXYy6YBJx8vBcnFfJOjwUETV/j8d7/7WJL7ErMISmlky
	s5QhuGhliu+nKRMNj6+sfP+0Xcjvajxogbu3itfYdQoHDNgYSbjm3N4HQvbMaXkYf7HukzCjK/WK6
	3VIvBhPKJLlo1SLE8gR9wCev4GbBZEQ3AEQyHjDT4x64UBQMUhn0NblgKs9QcvxDJUWDsrUp5oiA2
	7aJu++yT/yH0En+5HGJ/sKsFrv3xolc8ig86HZgehzD+9D9pBV3FYxb2H8/yWPsPMJUeqLM5ly+Sa
	S2HpENspcxfm9vENxK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwknr-006MOz-1n;
	Wed, 10 May 2023 14:28:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwknq-006MON-0m;
	Wed, 10 May 2023 14:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0EAFzv3D+ig/t/nW/DBfVu2XVoT+oGbKuJj55OeG29M=; b=J+4jUhNTtkgBR910a6YalNIyQ+
	tt7U4hJdy6/bMnMRbFwUw4R4BOb9+0Ff7LBDou+Og9xKtj0LUO5AFBoRSCgVZj6V+4qtI9NyO+aLD
	J+qjeNazYGOp2poJgBAbE4T+zzFcK94zyBMyR8CEKCOWF6cZAD/ckf9pamcyX2TCx2Ds1nYIcgMv4
	YwsUAYvAhR/VyVizekBBVt5RjwAmWL6n6bn9uhJBLmsIUjhW9TzXC+zhdjEhoglla7XqgWkvmQMCI
	U8Nml81DpOIGaOe2vCw/lngSxUt99AwWBsoMpyB54WFVQZj7RLyKtPpikab//45hM66bSiwHTonbF
	W1J90mZw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwknd-00GM7E-9H; Wed, 10 May 2023 14:28:13 +0000
Date: Wed, 10 May 2023 15:28:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 01/23] arm: allow pte_offset_map[_lock]() to fail
Message-ID: <ZFup/fG50MPFF979@casper.infradead.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <5011977-d876-6a24-a3fc-c7e6a02877b8@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5011977-d876-6a24-a3fc-c7e6a02877b8@google.com>
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

On Tue, May 09, 2023 at 09:42:44PM -0700, Hugh Dickins wrote:
> diff --git a/arch/arm/lib/uaccess_with_memcpy.c b/arch/arm/lib/uaccess_with_memcpy.c
> index e4c2677cc1e9..2f6163f05e93 100644
> --- a/arch/arm/lib/uaccess_with_memcpy.c
> +++ b/arch/arm/lib/uaccess_with_memcpy.c
> @@ -74,6 +74,9 @@ pin_page_for_write(const void __user *_addr, pte_t **ptep, spinlock_t **ptlp)
>  		return 0;
>  
>  	pte = pte_offset_map_lock(current->mm, pmd, addr, &ptl);
> +	if (unlikely(!pte))
> +		return 0;

Failing seems like the wrong thig to do if we transitioned from a PTE
to PMD here?  Looks to me like we should goto a new label right after
the 'pmd = pmd_offset(pud, addr);', no?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
