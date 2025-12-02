Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC46ACFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 05:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9I5giQSq6mpRZVIfKw13AsHZrlR435VmIsA4Zs9U1XA=; b=MtNXrlm0yxZTuP
	R9SCSMYl6dsX7cE3w6VMR1dk3xTpwMq6cA7OFSPtpPOJiiZjL8nGb+0coCEobnu8dOYpeHrzAdKgE
	MwLGSYhT3ZMC1DFAC1JVxnOG+CVEWUhYHNsUDu3AnngsxV05TFQfvkehTbH5SyNGS9BESY2koP9kx
	aHdZbc9ICyfQEbNn/ZYqM++ujVJPUfF9smS8g+uCHPl4HeKCFwA77jIQ4U7zauKaw73UbZ1Ny6Qy0
	nqsDvxX6AlWuquEwlVdGnSjG08Ng5IH2x1PI8VRFokUx1VYl+dJgjTDAv8ipeBv95MxWTVste0KSm
	dYWSfve/x6/jx6Ggn12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJ0j-00000004qS3-36t8;
	Tue, 02 Dec 2025 05:33:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJ0i-00000004qRp-36W2
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 05:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC58860008;
	Tue,  2 Dec 2025 05:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274EFC4CEF1;
	Tue,  2 Dec 2025 05:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764653591;
	bh=47IMsY1kQA4YwR5Mz8xcNpK665wyScNkGv3MmAg3+3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQ2Ua0KijlAy42Za3O/QMHe2KK77BMZyuCrHRTcbI01AGh5q5z/1eUMdAfnM0bzl8
	 NpJvnhAEG8DwxcfzU3DltT3xJrSsxxfRoEtRVacrd1+HZ6ClhkgYDCxTf88YeiKam7
	 zKM2Lc6XpovHqjr8GrJXFNev8pKyoLfa8zJYLzpGkxuA+FT3bAeVxL4NnLx2M/oIp4
	 Ed+1n8jz7MQLnnkUp36RA+WS8Bw+G5NlMIfsHFLLk8U7fmYj4xCIZqfSAiNP9VfLpB
	 6C8CvyulTJKJc5KSlAbIWUtaal+8AYQvAo9SEmXY5dhEwg+hYhQBMLo66Bbghr88Y2
	 SELkfRn/QpCMQ==
Date: Mon, 1 Dec 2025 21:31:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Jerry Shih <jerry.shih@sifive.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
Message-ID: <20251202053119.GA1416@sol>
References: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
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

On Tue, Dec 02, 2025 at 01:25:07PM +0800, Vivian Wang wrote:
> In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
> by reallocating KEY0 to t5. This makes stack traces available if e.g. a
> crash happens in chacha_zvkb.
> 
> No frame pointer maintenence is otherwise required since this is a leaf
> function.

maintenence => maintenance

>  SYM_FUNC_START(chacha_zvkb)
>  	addi		sp, sp, -96
> -	sd		s0, 0(sp)

I know it's annoying, but would you mind also changing the 96 to 88, and
decreasing all the offsets by 8, so that we don't leave a hole in the
stack where s0 used to be?  Likewise at the end of the function.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
