Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BFBC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fGL9C0Tqt4xFoa4GzZeY/VD2Pyf4tW2dzsVB52lO0w=; b=cgCQSaP4/gY7pe
	OvOHoFzoYdoxoa1fJCWkkbAfSce6TzREG+WKAbH/bpRSf8GJoxtYMONsIpjHXxH6hv0zbnLOXFhqS
	dm30zEuOswSNzd6oowrgIZ6l7b88Qu9aJVw3w4Dfd+Rx+OOnzfPBwWQk8K1ufdlVjEqRIuhPtRofU
	+VDjQTXPKSUUY+ZEUhNM9Ndgfw/ye/jTDAmTikvXDnb3zCVl9Bop+rGg99lOMlbN+2kFRWwljVod7
	gp+qhbWzR1tPStL64CCVuu+FvNTFuNhoC4tPUlMQCBMV5PJ8tj+f6Vrost3boeqCGGwXDfdTH1avA
	6cmzaX3v9vcID0RYYv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4baO-000UnE-HS; Fri, 24 Jun 2022 05:10:28 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bYc-000Ths-6G; Fri, 24 Jun 2022 05:08:38 +0000
Date: Thu, 23 Jun 2022 22:08:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, hch@infradead.org, christophe.leroy@csgroup.eu,
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
Subject: Re: [PATCH V4 01/26] mm/mmap: Build protect protection_map[] with
 __P000
Message-ID: <YrVG1hohcGD56pwV@infradead.org>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624044339.1533882-2-anshuman.khandual@arm.com>
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
