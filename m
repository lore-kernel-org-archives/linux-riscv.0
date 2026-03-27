Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B81210BA430
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZpqvw14Kc6F7W9qCyFrc78QZP8/dXr8JUDux8NIwsg=; b=h8O6pBM5Wi3yb6
	JwEWcKWy1Hb7yr4ymQXH0+nwUcQPr046tEIfmrWC5shvQeHF+/r+a1NxO02XiZL0cF3LIsYWRiBha
	psjHUZzeCQev1W0+lNwSfizCR7ZEFhzJp+m2u+aCgQ8t54QHjCXPAkTZ8gGCTbexfjMXYzWb3fYJy
	IG8kgrle3vGCWhsx54vlH/1vb0Ca83jgg2MmmF9ngGoBAXx0cJZMazlj+hMECfBU3Fc3wFsctG/vs
	xUwSeA1oSoQw1Fnui755sUoRtZXBKut4/1KnzQkrh/BE7H47TMo8/xmB5WO5CvxfIiel9IkJ7/7b8
	tyjuIbBkt6xcW2sUJQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61GD-00000006r8I-1XHn;
	Fri, 27 Mar 2026 07:05:37 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61G9-00000006r6q-19R8
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 07:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774595091;
	bh=C5sPPhxc2ESUsfKZcmePqfZSGtd39KSgY9EBT4h19Z4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=oJT4MR45zGFsDiQoi7e3V7hweAfxTuleEh3YMiT8E1pJVzLnTy7gQkvT3j/L9hsBT
	 8hOTgyJ3jYWn8Snir6f6LKegADFzc6U8jLNeX1bOOYZg5wbx4a2oQwhFloMOjjkgl8
	 dQsJpnoncULL7vYfFXAsEaGIh18sbWqT0gY9dWAI=
X-QQ-mid: zesmtpsz9t1774595088tae86de95
X-QQ-Originating-IP: w/WyDemxcbjpJuaCt1YW/wsPI2c2ZYwcqhNJMRnh9EA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Mar 2026 15:04:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1752965271814094096
EX-QQ-RecipientCnt: 21
Mime-Version: 1.0
Date: Fri, 27 Mar 2026 15:04:46 +0800
Message-Id: <DHDDGG4TDFOS.2DPHBA6U2JMVE@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Conor Dooley" <conor@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
 <20260326-explode-surplus-24c0e0813099@spud>
In-Reply-To: <20260326-explode-surplus-24c0e0813099@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: McJfg7Aee/FZuqgBLJa/xaD93ptxSj5gtrQRlr2BHMhaSuQ7Hmc7FSVm
	nIbSM/Gn9ozMbLDAzyDH+vq5F/k9zjNFar+BG0Flj5Fv5Qb3kLBOQgep/HUvaEWm+0REQgk
	utQdzLZlWXNyZv2nn0GyzOdluz6WiLSYfnDkvmLzrjDA1IDE7LTjtyNcunyenvlBbjYaBL7
	mEa7uvvsPio6wr4K+A8wHylXqbN1xA5Omj74pPKdJ+wtE1q9+WC3rVp1Ss5BsRB8d2ghPly
	NbCS9jz/nQTk4C2cOLP4oNcXZ+C7rrA3EYWGj3tICHboN6UMAl1rPf7fA6NKoqLBaPD6a6E
	b8X62kTE4p8pepTCHO0caY5TYjyPWGFznU+M06CCNS9yzqWnErMdhJQ0Pdnr5gazRMTq+kj
	bnz6JW7yTTJ0OBaE2grKZjRUb5XfmfCOPkzi6RQoXsJ34mtxevGQKnXfUufsCCM+TasNNYF
	bmlQf+G7vCOo+Rt952DsFtLZt4xuH05ppyLSgnFQOjXzZoj3TKEj6EOfwrfnivwaDImWGpm
	twhLEFYC552lvFErafayaB9W64nfLbRea2jgYNRNxNK5sckvJ7IXERvCT9xDZXp2JkrZ9Zb
	jqB9h5NezcuFHQzSd92GpEx4yB/mqPX325JDsllEaoxHm9z8tEJ1YK3mSklNr67A943Uze0
	/Q/lTzNybK/WbckQe+DCVkk7TxkHPwmGxNgNiMgH8lSBQnZ+tTJKbnK8L+G8dDgusUS6Fps
	CIhnSCyOr1nlHKL/tWEwK2sBNzt6DfcW4XD37Cv9CTWqQgyThhGlnVSSivvBYDqR7pOlC9V
	herj0wt6QAME/Q62DeFPxjHm17xsYWWc9J2Eo8WvZYcI0n2BCp+4lN9f7mebQTwbtq/QSrg
	uzgfBsa5kTO7UaFg/BDsF3Ye+YSMuI7L7nG0z6YKHWVrcOUa2Ni5leJnuDmxQb7EAaY9Slv
	t0l42y7QZtI8y6/adItDuv1OjHxF5HeXI15wNe7gmfFLcCNbxu45AngCu038T5mo/mFAQcL
	DTr/SpmtZPiOILKrFUksajYQkjbJT0oAAB4HCDo8zzeQQm2O8g
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_000534_365048_077F5F0C 
X-CRM114-Status: UNSURE (   7.62  )
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

Hi Conor,

On Fri Mar 27, 2026 at 2:34 AM CST, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 04:17:17PM +0800, Troy Mitchell wrote:
>> From: Guodong Xu <guodong@riscstar.com>
>> 
>> Add k3 compatible string.
>
> That's obvious. What you need to explain is why it is not compatible with
> the existing k1.
>
Thanks for the review.

The SpacemiT K3 PDMA requires a new compatible string because it is not fully
backward compatible with the K1 implementation due to two main hardware differences:
- Variable extended DRCMR base: The DRCMR (DMA Request/Command Register) base
  address for extended DMA request numbers (>= 64) is different in the K3 hardware
  implementation.
- Memory addressing capabilities: Unlike the K1 SoC, where some DMA masters had
  memory addressing limitations (restricted to the 0-4GB space) and required a
  dedicated dma-bus, the K3 DMA masters have full memory addressing capabilities.

I will update the commit message in the v3 series.

                                              -Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
