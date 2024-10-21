Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E69D17121
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 17:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MK2qgbvevqxQd83OYO2C5c6JDf8Sl1KL+bHupJKYsCc=; b=xz+6077+wZoVnG
	ybEOMZXwwAvLBKf0oczLwzTP7oqARC6EO8hYImG+0mh1QMLIn9XbHMSXROLbUTp6WQ9WcH3XEDt6u
	pYDxoF8I1/htnOWGTQaxcwOKEFCw/MDKL4tHP5ba3kb3oLCINm+GtWHhgR7n9kw5bPy1OY11Pfd43
	7FI0RgtlJpob0vUg/K+iMzhjCHJCfMwXY/oYJJyIhEalfjGkkIihmnHC9C09rQZlOOs/8KtXB+z8M
	S6xyGn7yITw7lHaEAOLhtTX1K0EmwQpb7+v4b8qaUmhxnMLYtv1C4o+vayPl42UzWKTA5sQ4nfm0O
	zeTBJkYplkgFSH7J+T1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wfd-00000008CfP-1GPz;
	Mon, 21 Oct 2024 17:58:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2we3-00000008C5l-1zD1;
	Mon, 21 Oct 2024 17:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C0DCA4375B;
	Mon, 21 Oct 2024 17:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F2FC4CEC7;
	Mon, 21 Oct 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729533402;
	bh=iOp6UPk7kp6624trt50V9GCSl7TCmUx91AXnl52vexs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJQY/rj4pTIO5uEWlo1heoszsTNmf9jrwjFBD0lIbKoaTFxHVpdjurFhvf6qbFqVx
	 3p4d5v2zCCp/LbxdIlTGmC11dWGlMVeXXfBDk8A9Aml+/MAtk2IETKhnM8m6cKxkey
	 BZF/dYUet13hmxhgQOUCWlo2mvzJlbvIRi1nLRTDg+g177wJbtfgI05mwIy3+AOG+C
	 2RdO3YmkeY7RM1WJnyPqFT2fPe/8kLv+1aQd4pfj1zTvRhlxt250RD3qNZbbCGpcse
	 fs5+AtO+kgnLwq3Dm+Zt8UDEsdLr8Tbrkjy5WAyah1cfbA8sbkBGsmyodZGLNuMspU
	 cTEE/rSNQw61A==
Date: Mon, 21 Oct 2024 17:56:40 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 07/15] s390/crc32: expose CRC32 functions through lib
Message-ID: <20241021175640.GA1370449@google.com>
References: <20241021002935.325878-1-ebiggers@kernel.org>
 <20241021002935.325878-8-ebiggers@kernel.org>
 <20241021104007.6950-E-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021104007.6950-E-hca@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_105643_582295_5C665C24 
X-CRM114-Status: GOOD (  20.26  )
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

On Mon, Oct 21, 2024 at 12:40:07PM +0200, Heiko Carstens wrote:
> What makes sure that all of the code is available automatically if the
> CPU supports the instructions like before? I can see that all CRC32
> related config options support also module build options.
> 
> Before this patch, this module and hence the fast crc32 variants were
> loaded automatically when required CPU features were present.
> Right now I don't how this is happening with this series.

There's just a direct symbol dependency now.  For example
ext4.ko -> crc32-s390.ko [crc32c_le_arch] -> crc32.ko [crc32c_le_base].
So, crc32-$arch.ko always gets loaded when there is a user of one of the CRC32
library functions, provided that it was enabled in the kconfig.

crc32-$arch then calls either the accelerated code or the base code depending on
the CPU features.  On most architectures including s390, I made this use a
static branch, so there is almost no overhead (much less overhead than the
indirect call that was needed before).

This is the same way that some of the crypto library code already works.

> > +static int __init crc32_s390_init(void)
> > +{
> > +	if (cpu_have_feature(S390_CPU_FEATURE_VXRS))
> > +		static_branch_enable(&have_vxrs);
> > +	return 0;
> > +}
> > +arch_initcall(crc32_s390_init);
> 
> I guess this should be changed to:
> 
> module_cpu_feature_match(S390_CPU_FEATURE_VXRS, ...);
> 
> Which would make at least the library functions available if cpu
> features are present. But this looks only like a partial solution of
> the above described problem.
> 
> But maybe I'm missing something.

This is not needed, as per the above.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
