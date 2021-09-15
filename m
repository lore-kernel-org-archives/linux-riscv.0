Return-Path: <SRS0=puBH=OF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85D0C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 07:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6324560FC0
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 07:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6324560FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnmW3sWHVR9z+SD6HnO0O2L2kH505drHPBowlQEncCY=; b=Dr2jxxSIEisdGI
	OdvnEDPiQo9uJTrJsfWOb0NLnF9w6LTRnCQaz0PnQj3JGlmw345FQjFoALkCV2EVdAWwHimnVO2+Q
	cOfuxcmRRaLeybGmUiOzSfRDkJ5F0EdIVDYfjCycilE9mFMTmdInf+2jEg10RZMsEy18rlIruLJMt
	GF64Va+MxJ2BxjJgsXw+RQmz8GEigSEmUeeCCep92KZiMHoidZMfLuWvmpwVpZaMxcXnIyGGtY8rB
	Vf9binenNfrUNhMxK/4G/8hs7tVykSvBBkazXsdF4NLsZP62R5NYPW8cf79MbuJFC+zQsDiJjKNMN
	ampiV1L72gFuyqZ4Ef8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQPch-008Klk-So; Wed, 15 Sep 2021 07:46:27 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQPcM-008KkK-5M
 for linux-riscv@lists.infradead.org; Wed, 15 Sep 2021 07:46:07 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2B15D67373; Wed, 15 Sep 2021 09:45:58 +0200 (CEST)
Date: Wed, 15 Sep 2021 09:45:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC PATCH V4 1/6] riscv: pgtable: Add custom protection_map init
Message-ID: <20210915074557.GA20024@lst.de>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911092139.79607-2-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_004606_399233_CF5DC947 
X-CRM114-Status: GOOD (  13.87  )
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

On Sat, Sep 11, 2021 at 05:21:34PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Some RISC-V CPU vendors have defined their own PTE attributes to
> solve non-coherent DMA bus problems. That makes _P/SXXX definitions
> contain global variables which could be initialized at the early
> boot stage before setup_vm. The patch prevents compile errors.

That sounds way to nice for someone who deliberatly ignores the
specification and should definitively not go into the kernel
commit log like this.

> This patch is similar to 316d097c4cd4  (x86/pti: Filter at
> vma->vm_page_prot population) which give a choice for arch custom
> implementation.

How?  To me it looks like a bad duplication of such functionality in
a way that totally breaks abstractions.  architectures really do not
have any business changing protection_map.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
