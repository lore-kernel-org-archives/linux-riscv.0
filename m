Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB64CC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKGzX6yE/I0P1qBeyrVkY5BnT7ywpbw4nd39m0yxTVs=; b=qJTUdComYPWwc4
	8G47FdET9PSELRkBPyLA6ApFmAcmKEbRNHHK2W86rMj4j7yF0rF9s91Cfh/m2+iQvMrVgqQty6Gru
	ltaYuOl/+a2tg7PZP9jwcLPBgaJVWswEToka37/Foqc4muhPXyYAbh+zemRkDyx/PgoGj5nuepWgC
	WfVohcqHQYJd1hIM/g+c3iZvUYaKg7fxcu7O84C7BTIvWqU4Cn5PLJ2Fqb92O7STLVqTuhplPtjoK
	z+c0hRyAilHLvZgtIL899dhYDDbx9TSSz1D+M33+poPFRQzpGWeA4MLsn6I1rB8eLFwMf404QWFAs
	8kBeoMMa8jda4n6oITPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4blJ-000aVL-RC; Fri, 24 Jun 2022 05:21:45 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4blI-000aUe-MC; Fri, 24 Jun 2022 05:21:44 +0000
Date: Thu, 23 Jun 2022 22:21:44 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
	christophe.leroy@csgroup.eu,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org, openrisc@lists.librecores.org,
	linux-xtensa@linux-xtensa.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-um@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Message-ID: <YrVJ6GaSzD/4kD6M@infradead.org>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <YrVHvv0spuMsC1In@infradead.org>
 <33bdac1e-207a-192b-bf43-818abfa49fe1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33bdac1e-207a-192b-bf43-818abfa49fe1@arm.com>
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

On Fri, Jun 24, 2022 at 10:50:33AM +0530, Anshuman Khandual wrote:
> > On most architectures this should be const now, only very few ever
> > modify it.
> 
> Will make it a 'static const pgprot_t protection_map[16] __ro_after_init'
> on platforms that do not change the protection_map[] even during boot.

No need for __ro_after_init when it is already declarated const.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
