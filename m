Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB65FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L16Qe/S+VpwS8x/ki5/XQGQuDEIc1QInA2etLty4l/Y=; b=LH7+kzamv17HiQ
	8AJ6eZtAQAxEC59c0Xsuq/rmow2zmFht5lEWtPRknDIMDqMFXaOb/N6h1wLlgmVQWJiUf107R5EoA
	oeI6ZzjgjJxS1N7CieXaWVEai6myK3tsky7YXGA74/f09OXN4rLs+hiI6GZZnJpHsRBjH2uEqkgeY
	rVIaE/7LGKGU3vFXY+KGKMVGA36J79rwHGErNUwep+6+DlKB7lOLSqHIm4RdJ6pPindyjoVYjAVQ+
	mygGjqr22Qat0kU2/bDt/FuLoOVzFw4Q/O+7wHQZ70t/Ygtx+xv5kxKJ/nwruVjFqpDbXJnaE4Pd3
	ePvS8qon5sKNAsDTQyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPHSZ-001VAq-Qc; Wed, 02 Mar 2022 05:23:35 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPHSL-001V3i-VZ; Wed, 02 Mar 2022 05:23:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7jF46rSmz4xRC;
 Wed,  2 Mar 2022 16:23:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646198587;
 bh=EW7h6GpdaDNbwZGHiZAaI3MdXFwBu2xEgtf+Ok1PZlA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lWhC32dAUg9E3iB13asSEl3IGZdK/c28/Ypzl2ddkzEYQ3djbYgWlSP3RyJhpm5Na
 6qopH8SJWhUAcDxKZHVagvJoSIHYAL4wLxhu95pHGQSKM9mi+uqCLIDS48jN2SCDr8
 3hW1xyBgxsMtocUFA6uizbi9419Ant/1MjMx8tlYLZfUCZ6xeurWURO+6ZM4F85NEb
 XIbzne9+sy6yQbCkbNp0yFSeKJEoh6kBSZkPqvm9y4RngtUzavUWU8gPBqd3K3fTkW
 Seaz2Wd9JXTkWB5MzPd1wTj1GT7JiQk11vWz+fU7pXT7m04tdpff9zfHDEBHGpyTac
 +s8dkQbww3zeg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, Anshuman Khandual
 <anshuman.khandual@arm.com>, Christoph Hellwig <hch@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-parisc@vger.kernel.org, openrisc@lists.librecores.org,
 linux-um@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-arch@vger.kernel.org, Paul Mackerras
 <paulus@samba.org>
Subject: Re: [PATCH V3 04/30] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
In-Reply-To: <1646045273-9343-5-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-5-git-send-email-anshuman.khandual@arm.com>
Date: Wed, 02 Mar 2022 16:23:02 +1100
Message-ID: <87k0ddnd1l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_212322_205160_7E46417A 
X-CRM114-Status: UNSURE (   8.85  )
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

Anshuman Khandual <anshuman.khandual@arm.com> writes:
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed. While here, this also
> localizes arch_vm_get_page_prot() as powerpc_vm_get_page_prot() and moves
> it near vm_get_page_prot().
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/powerpc/Kconfig               |  1 +
>  arch/powerpc/include/asm/mman.h    | 12 ------
>  arch/powerpc/include/asm/pgtable.h | 19 ----------
>  arch/powerpc/mm/mmap.c             | 59 ++++++++++++++++++++++++++++++
>  4 files changed, 60 insertions(+), 31 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
