Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140ADC021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RvWHbJbwvOFW3w70n+HcwLvqhG3M0+uqyD76sbbnp8=; b=LiEH4l7Mfn7CTj
	o32pZh/ai5V1m5iohmm2adP/kE/s3kjluc3u3P3ZcWYRJhZJRVbrOwKv+SpDI/SsYStPanjx8nXpb
	iK40ne9L1CxKFXTDFmWq45w3EQu5ZTnXmrg2YFJxKvC6rkGs0Dhu8PQY3IE91BhaVdF8AXic7Q8+w
	xPX2dp4IPf+8htGVwS5mQs88woaJbzvxb3DIh2HFEtH1Pthxe+Pqv2covwEphIbXMGHjVdS+eBxlb
	S4SsSt43rO3e04oDXQ/fhSHH7p4PD/aQCqUy8TAAtSXqPzLTixZTYTogFnJJtOZ2/6A43uqQD7XT2
	IZrphKR9HSwSHMwh9jGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNNh-00000005CkE-10ld;
	Wed, 26 Feb 2025 19:47:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNLl-00000005CQT-1fId;
	Wed, 26 Feb 2025 19:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C58876112C;
	Wed, 26 Feb 2025 19:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4275C4CED6;
	Wed, 26 Feb 2025 19:45:40 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:45:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH V3 3/5] docs: arm64: Drop PTDUMP config options from
 ptdump.rst
Message-ID: <Z79vYibFJl7--Tmw@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-4-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226122404.1927473-4-anshuman.khandual@arm.com>
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

On Wed, Feb 26, 2025 at 05:54:02PM +0530, Anshuman Khandual wrote:
> Both GENERIC_PTDUMP and PTDUMP_CORE are not user selectable config options.
> Just drop these from documentation.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
