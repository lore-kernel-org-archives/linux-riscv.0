Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185DCC3ABA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu59TR9n003xE21/yZyrOj7Gd567a4zQqhelulIR7XA=; b=oE3mxcJrFHZLoL
	i3UY4L6+X5tHPFfuul+svfCsVaFqX60PmZdl94nfDsiPmcfers+p9dqyDpaQRJT4LIm4hGst063SC
	q9kFE7Na2P/7WOGayhLj9BKdbredwT6v+IAwn/X77fhxRCcDRIubJLCU9+qh3eE90MdPaHV8G/Tlv
	hiQDJVcGQ9pIcYPP659tgKDAiGiEsoc66d2Bm0ubB46OjSAPCkYsnwQ3fjytUtoNV0hV/5U+XJxhb
	8mjFi5T16z8aX2Z3D3POmpSSBwCE8+pW4P0mUBqhfRZ+/i+Pd7y4ecyS0cmTJT5dv6NmL6M+TDK1B
	yMtBQhCXsYqrUNqln3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nvA-0000000AGon-0q5N;
	Tue, 29 Apr 2025 16:35:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nrV-0000000AG2o-1R2Z
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 16:31:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDCA5A4AFA6;
	Tue, 29 Apr 2025 16:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47CAC4CEE3;
	Tue, 29 Apr 2025 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745944272;
	bh=dp1B5zOvRveNyTwwk3MQebtsan6h8klv0nIzLbZxH4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3Ixu6Az23E18jvbtxtm+rAG1V8Yn/E7bnzmNTNahHTP6SlUdRj23WeR7y3YExtA6
	 1CDp3wqRw2IouWVPrSEshyhcgR0h60DDlfGBn9XPzgT2xhz6O4xTulWhCV1oTWegQQ
	 SbuAXA2bnA2l3ASViOzNhNajFrx91y1vgbI3shnw=
Date: Tue, 29 Apr 2025 18:31:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org, Kai Zhang <zhangkai@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH stable v6.6] riscv: kprobes: Fix wrong lengths passed to
 patch_text_nosync()
Message-ID: <2025042945-financial-rumbling-bcd0@gregkh>
References: <20250429161418.838564-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429161418.838564-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_093113_446513_27AA6F40 
X-CRM114-Status: UNSURE (   9.49  )
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

On Tue, Apr 29, 2025 at 06:14:18PM +0200, Nam Cao wrote:
> Unlike patch_text(), patch_text_nosync() takes the length in bytes, not
> number of instructions. It is therefore wrong for arch_prepare_ss_slot() to
> pass length=1 while patching one instruction.
> 
> This bug was introduced by commit b1756750a397 ("riscv: kprobes: Use
> patch_text_nosync() for insn slots"). It has been fixed upstream by commit
> 51781ce8f448 ("riscv: Pass patch_text() the length in bytes"). However,
> beside fixing this bug, this commit does many other things, making it
> unsuitable for backporting.

We would almost always want the original commit, why not just send that
instead?  What is wrong with it being in here as-is?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
