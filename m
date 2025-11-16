Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CBDCCD19A
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9Ev/jtvKNGxvd8v5xpY+5HcMmh/qDFGyDyykngjPk4=; b=G6Pf44+kZk5ubM
	1N/1SjW9R1xmF5kjR6yQMdc4aYNatPbkYW2meD2W4VTF2cb44rV//12u5FmAGMkbMX5vLwFtsTyix
	6cBMkIGiiAz6Xtjc8gEs5chwmKTPRsUmN1ee5hHnD4bmp1a+Yv3cC+KPezvHFMJ0PCV7qQW5ZGHMq
	pm5k6f3XmUOO6LVLE0cIzNEDu5Yd632ZhGoO4hGyD8xSH90f3KE7WSLILn5usZ6h+DueJDiw+SdnO
	Te16G7ItyEYXOZGphI1PFoQzdMEqISKQ8Nui+Vu8MGrGj1H3AQqF/XkTOasU9chhz3TfqYmZ5GLrU
	ADCcjJPqtZuPupDx6aXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgSU-0000000Ez3n-0QGG;
	Sun, 16 Nov 2025 17:22:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgST-0000000Ez3Z-1BdM
	for linux-riscv@lists.infradead.org;
	Sun, 16 Nov 2025 17:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72A57601CE;
	Sun, 16 Nov 2025 17:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40621C4CEFB;
	Sun, 16 Nov 2025 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763313756;
	bh=ZQoa4/71BzJBFDoQZEsiK4LF7Qve7xBGlX1DGk5TiBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qXiGnZWB9Ng67BQLoGrzVSSzQ7NrNm3MJCNMAfjJYp+y5YL1eP44XvKuYuzohpOxC
	 2g4iRL4qtGAs1AJ3n1h1xVPjmTpgbyx0+WwsIz2jSdNgQ+6tpMtzwWz2kXCtCOIoku
	 8AZlPVItKR2xibjBpuQp7z6/Ijdf1mhGZibWhdWRt5/DgVt/fCfxXqPO0yD+hlm0Z5
	 zJ0xlR76NvpnomZJiNNGZEkEkoCXlktzXuh15tvkt02I1fYbUgWO1olNqpIb5vXrpr
	 kselxtDIf9H6flvjXiGUNFY3v7uYDKfZ4vu/Z1GuzfGMgHXkATwlrYahaRF5ee9uBH
	 FCFcs0+l45yfQ==
Date: Sun, 16 Nov 2025 10:22:34 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
    haibo1.xu@intel.com, guoren@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: riscv: Fixed misalignment of CSR related
 definitions
In-Reply-To: <20251114071215.816-1-cp0613@linux.alibaba.com>
Message-ID: <421f4746-8d75-227b-6459-bbd82dfd6fa9@kernel.org>
References: <20251114071215.816-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
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

Hi, 

On Fri, 14 Nov 2025, cp0613@linux.alibaba.com wrote:

> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The file tools/arch/riscv/include/asm/csr.h borrows from
> arch/riscv/include/asm/csr.h, and subsequent modifications
> related to CSR should maintain consistency.

Thanks for the patch.  A few comments:

> Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
> Fixes: d1927f64e0e1 ("RISC-V: Fix the typo in Scountovf CSR name")

It seems like this is pushing the definition of "fixes" here.  It looks 
like the only thing wrong with those patches is that they didn't change 
the files under tools/. right?  It would have been nice if they had 
included the changes to files under tools/, but since the patches don't 
introduce any bugs directly, I don't think we should include these Fixes: 
lines here.

>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Please, no blank line between the Fixes: headers and the Signed-off-by:.

I've removed the Fixes: lines and the superfluous blank line, and queued 
this for v6.18-rc fixes.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
