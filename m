Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7328EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 22:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88jUeIFG1YBaBkACRN2ArvjrOMEVx/mapVRI0xOTv5I=; b=cR4GV4OvXT6kMl
	cDKpr8rc3LVhhnNy7qiYrnhysdIwfBK32+kNKwFiSktaRkS+WvtztGNac58QGfGZzZ/hA+VJq7laj
	mTF4C4fQ+2I0kNv0eQgIyNXLMAo7/n+S95NcJkG2f5bQ053lPSie2JGOQAj6upCldxxbMPyMlYAMt
	gM672+rEEBri22xYG1nMaCvu/aBCRAuKkMC339bR7vIOdIC23L3/7em6fFj2rq7G4KBSsXBM1ufSE
	Z5Qiwqk//K7EvXRLhN+k4dq9CHGXsQPY124ipntgFzlXJ9e8PYQ3kvPsdDbdG3BpxIRO2IwWY4OsS
	l54TWU9hQ/umWPVXkLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHA7n-008WeY-0k;
	Sat, 23 Dec 2023 22:05:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHA7k-008Wdx-0V
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 22:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 82051B80977;
	Sat, 23 Dec 2023 22:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CABAC433C8;
	Sat, 23 Dec 2023 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703369133;
	bh=tQ9mHBh0idipynQKJvhuVlCANWRLkmPWhm22rqwDcbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmpsLpecULGXLZZ38UqHJnck/LFawAwRsWD3i92NblJzrG0z0yMfO5dr/kQ0XBBrd
	 OMIYGAbEhitkfMRNov17nF6oeRm11rEviYP9kr3I08F7ZOFU/X9XVtzxsyqpoNKLTQ
	 I6aXxwA4NPkZP/lfUvNNEIzVIYqCiH1jV8EuYGhDuH/ic0G/jlbXHw1zn0CdhppCFb
	 j+t15ZqbQsPVJpTc3kBoulatIv5aPwjtBLU7Hz5p3qnm1441iYl7O+WNkNPFp93ixZ
	 QE/3sWZIfGEoEv7rmP23Qpcuh3BIRJSpBt+HwnxLB1I353MSxSwtUkeUu17MFsZEpv
	 m1GvTOLyyXpcQ==
Date: Sat, 23 Dec 2023 16:05:27 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Qingfang DENG <dqfext@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v3 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <20231223220527.GA19298@quark.localdomain>
References: <20231223155226.4050-1-jszhang@kernel.org>
 <20231223155226.4050-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223155226.4050-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_140536_359756_4D59071A 
X-CRM114-Status: GOOD (  10.24  )
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

On Sat, Dec 23, 2023 at 11:52:25PM +0800, Jisheng Zhang wrote:
> +config RISCV_EFFICIENT_UNALIGNED_ACCESS
> +	bool "Use unaligned access for some functions"

How about:

	bool "Assume the CPU supports fast unaligned memory accesses"

> +	depends on NONPORTABLE
> +	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	default n

There's no need to explicitly list "default n", since n is already the default.

> +	help
> +	  Say Y here if you want the kernel only run on hardware platforms which
> +	  support efficient unaligned access, then unaligned access will be used
> +	  in some functions for optimized performance.

How about:

	  Say Y here if you want the kernel to assume that the CPU supports
	  efficient unaligned memory accesses.  When enabled, this option
	  improves the performance of the kernel on such CPUs.  However, the
	  kernel will run much more slowly, or will not be able to run at all,
	  on CPUs that do not support efficient unaligned memory accesses.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
