Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B015BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tcV13IzFIBUBEVkAaIPkQ1FaPuuXfL5gAaHPWa6lgY=; b=DnLPrdq+mSt/OL
	cawxh/C8uy/c+VQnIFDox6DJqh8PDdxMGCCU9Se6XENgXtgM1WcSrm3LQ4wh3DcR7leX7RI2afkvC
	l3TBKYzHDGVK//ZjSjZks1QjA+IiB356l98AGw2G/PWX5QZ00h7rSyUqZNNFyx1+gYjA49uyuz+mS
	+loYitsRc85upNFUZVtClEQgyOW0sTrRNPemjx9dYQ0Tjl7ZCBPTUGig/dnya3VILms1HdLFhZN2R
	UTmAUpQU42Rg2u+w4NrVLSpTH2qSkf5idjYn/WIOwe3eGwD1tF6/QQBuXFMCQxsjA1/eP44AuXAKa
	54R6KaJlpdtiwzI7z3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwv6-00AuFI-2o;
	Tue, 12 Dec 2023 07:11:08 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwv4-00AuEj-0x;
	Tue, 12 Dec 2023 07:11:06 +0000
Date: Mon, 11 Dec 2023 23:11:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 05/12] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Message-ID: <ZXgHisDUsJMw7z3N@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-6-samuel.holland@sifive.com>
 <ZXczty+Y6dTDL4Xi@infradead.org>
 <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c40dfe8-f245-413f-a424-bde52ce21b6a@sifive.com>
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

On Mon, Dec 11, 2023 at 10:12:27AM -0600, Samuel Holland wrote:
> On 2023-12-11 10:07 AM, Christoph Hellwig wrote:
> 
> Unfortunately, not all of the relevant options can be no-prefixed:

Ok.  That is another good argument for having the obj-fpu += syntax
I proposed.  You might need help from the kbuild maintainers from that
as trying to understand the kbuild magic isn't something I'd expect
from a normal contributor (including myself..).


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
