Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DCCCD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnStKO9ZC5/R5eRGAgg1FgKBnwofiFGGfLSIRinI1ck=; b=HXCygnsdbALTtY
	JRTcS9YY0fybhaWCrCvBrwQruM2GV6pVAkGDr9j/nrnYV5nXkkmRrCD4/38acgc/Eju1JQ8x0+ncy
	SORBu7Ozlm2Ofb3GdaN5CfWvLYQbR5bI3qdVd6GJ1aeFqM0Pz530wrdqVHRSs0IHkUk7WivG8m95j
	9fWnpR2CsG9nWGjA8aeQU2LvN9w7ZhFRgCPtaNF8c5FCWeCE5e54OpjlA5ZNFPxx/HEBkOrcF+ON0
	CEf0J0g46TIWdk7KM6zyAaWQkctExMF07EXZUauNPab7/00AZfqJoPqCHzIX/w1PpVJcdQe7TXRKZ
	Tk+Tcc+mflmJJsAntSOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWer-00000005rXX-3ctg;
	Thu, 30 Apr 2026 19:02:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWep-00000005rWr-0eMV
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 19:02:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0B6640D71;
	Thu, 30 Apr 2026 19:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7879C2BCB3;
	Thu, 30 Apr 2026 19:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777575761;
	bh=cRC9KLktut1BkXa46+AfHyESKr2HdVz82WI9F/V2NoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDAMgEREKkqVs4jRy1kzycqsSMU4+2ac0/ee9kzHk+1+dZxHx2Ci153SmyDbsVaa8
	 BfEefBumvppLupo4HEZk/+mHUNa597DUgcd9BgrspTgN9aBfobWLUItkq+2StE25lc
	 I1ShObOCRBwzUL4GHF92EBNlKJbG4mwfZB7wc64RoaAqGMXS1Rwa6Tcvgmql0cVMBV
	 o3GLeeNP3ivGFAkPXzs7Ourg+UvcwRPLdl4Eus4b1tLN8MzrSLZuAx9yz9ZYLqrdR9
	 CyCp2TxbC0vu1fl3ptZqKtPq5cYkNpahpp7mHDGmfALYEHGA8/NcDwZpadQJKrbMIO
	 1XouleDbXPi+A==
Date: Thu, 30 Apr 2026 12:02:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, arnd@arndb.de, akpm@linux-foundation.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, david.laight.linux@gmail.com,
	cp0613@linux.alibaba.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v5 2/3] bitops: Define generic __bitrev8/16/32 for reuse
Message-ID: <20260430190234.GA438371@ax162>
References: <20260421130752.607500-1-ruanjinjie@huawei.com>
 <20260421130752.607500-3-ruanjinjie@huawei.com>
 <20260429202922.GA3575295@ax162>
 <afK0oL5FS8eLobpV@yury>
 <20260430035943.GA2164248@ax162>
 <afOGKj9SfozoS3x7@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afOGKj9SfozoS3x7@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_120243_214399_FADF4E0B 
X-CRM114-Status: UNSURE (   7.78  )
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

On Thu, Apr 30, 2026 at 12:41:14PM -0400, Yury Norov wrote:
> Sure. Please let me know if this works for you. If it does, I'll make
> it a regular patch, combine with Jinjie's work and my follow-up and
> resend. Meanwhile, removed all bitreverse material from
> bitmap-for-next.

My builds saw no issues overnight with the CONFIG_CRC32 version, so your
plan seems good to me.

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
