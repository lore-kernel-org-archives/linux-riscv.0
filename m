Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74115C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 06:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O34Vm4nliY5jmT6Ik2D4VQacE+4Q4QJooWvsJK9wTJ0=; b=q4ILM0ZIMCvZeP
	v37P/WfofKe1/GMIzHZu3yTbCWOFNYGm/UXMZxNiUGaIVSmR4nGH/7VKGihW66yjnV8HhhA1nrL+9
	aMV2xK137X/OWHaM97ftJ6XmybtX5U0Sscw7P4DcA5sDQXB4g+ZeCRUSCfDGFRGKWmPMk4Z/FSx5B
	zsiHfMaFjsv964ROrvSe1S9Fyhn8Hs8OpZDn+4jTFOUQgxeBCz2U0p1sQ2Zakmu69a1M4C1Fg6i6Y
	8weoGtt+IB5SaRllluZ0UGAk0pjbV9iQbZqWjrgQEHCaDMnnHg4p7Pd64C61mx/F/KJM3vvGKc/ba
	dtHMr076xvN+7yekFh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6PJZ-006F9j-0Y;
	Fri, 24 Nov 2023 06:05:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r6PJX-006F9E-2z;
	Fri, 24 Nov 2023 06:05:19 +0000
Date: Thu, 23 Nov 2023 22:05:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: fix __user annotation in traps_misaligned.c
Message-ID: <ZWA9HwUNHDFIw0wP@infradead.org>
References: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123141617.259591-1-ben.dooks@codethink.co.uk>
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

On Thu, Nov 23, 2023 at 02:16:17PM +0000, Ben Dooks wrote:
> @@ -319,7 +319,7 @@ static inline int get_insn(struct pt_regs *regs, ulong mepc, ulong *r_insn)
>  static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_val)
>  {
>  	if (user_mode(regs)) {
> -		return __get_user(*r_val, addr);
> +		return __get_user(*r_val, (u8 __user *)addr);
>  	} else {
>  		*r_val = *addr;
>  		return 0;

This is the wrong way to approach it.  Pass the untype unsigned long
from the caller instead and do a single round of casts from that
depending on the address_space.

And please also remove this horrible else after return entipattern
while you're at it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
