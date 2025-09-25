Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EA9CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 23:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXXZOpWS6PwmJDGKxpewKeDm9IP1cHWnXvbsBVg1neg=; b=WtRMQM/cAZR1Wy
	7XYcxnaSbk9uvBllh9R8ZNeZt49WamOIudEDN8JRUaLNWenOveq7qfJSNx1xCkC5J3lGA7dBh+Oe0
	Zo+zxeUjYeU0rpEZWeiHYc2Ww+E7bLcYO28VmOD79JWeshiq3YJdAV5y9rYsObeS5ONY6DSNTpBAC
	MUdZiduUvTTwl0Pb1M0n8vOvEg0bx2p/EegmQMB1GE06VEEvEQ2IHqAC8PzBLN6AHYbwO7EsLg3jA
	IcG8D1pt+myMoxR7u0Ztc2XoHUKDeULlMa4fJsCIF6Y4F7NbeCF/ZJXyEOcoMXXZ+WE56yhCd3cEb
	Kz+yFiYn/bWGO5HigwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1vDP-0000000DtxX-01kK;
	Thu, 25 Sep 2025 23:17:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1vDM-0000000Dtwb-0lPk;
	Thu, 25 Sep 2025 23:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93B444044F;
	Thu, 25 Sep 2025 23:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17829C4CEF0;
	Thu, 25 Sep 2025 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1758842247;
	bh=UwBJHVT+vWTJwWZDgObwFp0nU7Jl8uwGl6zSa7Yy8ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zEu5uNbkHJ/tF/idnqJzhDukNEJsCLAt/cqSv6tmmHekUCwoTCaP46y0WDQiNW87L
	 ipPmAS3ipMBid93CHivs8o7CJ8NPaK7SW3j3hOyNv/GBxiPdQBauzCuvQGhxuJj74A
	 Acuptcch5exZ/orzwU4SsPt32okZe7NaXtlVer38=
Date: Thu, 25 Sep 2025 16:17:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 sweettea-kernel@dorminy.me, nicholas@linux.ibm.com,
 christophe.leroy@csgroup.eu, alexghiti@rivosinc.com
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
Message-Id: <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
In-Reply-To: <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
	<336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_161728_249124_AE7A1839 
X-CRM114-Status: GOOD (  22.51  )
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

On Fri, 26 Sep 2025 08:42:35 +1000 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> On Tue, 2025-09-09 at 19:13 +1000, Andrew Donnellan wrote:
> > Support page table check on all PowerPC platforms. This works by serialising
> > assignments, reassignments and clears of page table entries at each level in
> > order to ensure that anonymous mappings have at most one writable consumer,
> > and likewise that file-backed mappings are not simultaneously also anonymous
> > mappings.
> > 
> > In order to support this infrastructure, a number of helpers or stubs must be
> > defined or updated for all powerpc platforms. Additionally, we separate
> > set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrumented
> > mappings.
> > 
> > On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_page()
> > requires the address. We revert previous changes that removed the address
> > parameter from various interfaces, and add it to some other interfaces,
> > in order to allow this.
> > 
> > Note that on 32 bit systems with CONFIG_KFENCE=y, you need [0] to avoid
> > possible failures in init code (this is a code patching/static keys issue,
> > which was discovered by a user testing this series but isn't a bug in page
> > table check).
> > 
> > (This series was initially written by Rohan McLure, who has left IBM and
> > is no longer working on powerpc.)
> 
> Is this likely to make it in in time for 6.18, or should I respin it post merge
> window?

The latter, please.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
