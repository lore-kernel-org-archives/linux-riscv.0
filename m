Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE68E7C4F0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pneZ5YxsTUlYygMNwO+vgnD4vfs7Msh6CU0oeV/qniw=; b=tQL247SSC7pcWI
	TFVapnxV4pcaN83Z6POiglxokKdoKzZH1UV7HvjMsTgi54NGVB3JAYLZqVoCbUzuFsNQrXkzJXZUM
	/kaNjrUoIZ4WypPFo4hjShMPRnV0kC23CKP3g8olT7G6+YJlP8OVe0FoAVelMLbqudVSgtnAISwdU
	Qs7lS0Df3BNhIluQUw1Itb6jGmD+RXnS8F0YPuy98XtS3xIS97YatBGU/UsAI+9YC14stYaj4zOv0
	4UerzyZOz+syiM2q28IM+d2MVxBI/vjfWut5To8T31AaMHclrOn+6quz8h02nYq1QhSRfDFphCXyE
	AyJE5KfNiO+/BkPA/2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo7ro-000ov6-1R;
	Wed, 04 Oct 2023 19:49:08 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo7rj-000osT-0v
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 19:49:07 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 058A83200B34;
	Wed,  4 Oct 2023 15:48:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 04 Oct 2023 15:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1696448935; x=1696535335; bh=m+YtaNHzQeGnCoR5VELbPcNaBJr8BuhJhCG
	DiydOwyM=; b=VtjhnUVnQWbSSL2m5Vu5p1ueIV2tTe+F24x+q7dFFGk3MsIp1YK
	iQgaH+bfA8wSRvfglMry2Hph2e5YnRwUvRTqVjiNvvVBigfzdTwuKW+N8lQpjKiH
	RtRhEuqT0y7wZMvmnox4T7J948uu/n07TNtl4ziGnN7xjtNUglGCXMW70vAAot5W
	AiBLtmbii9txvSko6jdkYXWNFT67+78AyRcIaa4WtXfYlWaULyrTHnFQL7nhujXF
	Wz4x6kUI65bsdTK1ZPDXuif+fC6DEWqRi4jjhMF3NJ7jQ0g4n2To8eLNbfNqbssQ
	xHHLY3ACwbG2CaFyC1idIH9B6sqCERvYPPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696448935; x=1696535335; bh=m+YtaNHzQeGnCoR5VELbPcNaBJr8BuhJhCG
	DiydOwyM=; b=kL313fO69JOvFIS6+vVd0YaAbhojiybKvB7PbyW6NTQfoiuuQRQ
	9J2GTyEIvID7PIk3flN4ktCFX1e8Sl17Q/iujoo13+Jt6mgjlKLenonTgUDR8LYf
	omo65Ot8BjHXRgTDqYZ0IOvBd8yegeWFuCmpujaY6VYudkfqmVoevkq8pjoH8Okw
	pgsTyOeTbO4GEejrsLDOkQoUiFV0I2vCnsBFwLLwcbs38GHBylrONzwUraqj//oi
	jtIMB5p8uVVRTWfxPIA7E7TyaAVWTLOHW5XX629EDsLylTQqKdhQvOhJ8rn/RNhq
	/xspX2xKcJXOffuFBBv5Q3R3CoK7FEpzBnQ==
X-ME-Sender: <xms:psEdZV0VENkjVQcOqzWI5J2fCgpIrFj3dok6zlU_4cZzYe5M7vOAvg>
    <xme:psEdZcHCvH5RgCkpDhawsIPCnU5_tpo6iBsdUKKf4oKKrdWh6xZhc2Trb73JpcYcV
    2mv0fFp3O30WjGf0Q>
X-ME-Received: <xmr:psEdZV6qpGz2Xsey4GHLzYyA05yYmJJQv9lH96TwJ7JR0Ia8aRTT9sIQSUk1NJ2uPo6SCFod9V-49fceL9hyn30Xt-CINV0whKB5m5jd3_h1QC88KiVq28RjNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedvgddugedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeekjeelleefiedthfdtgfekgeehudefudeugeffvdfhudekleel
    fedtteejhedutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:psEdZS1quAo-q1_r6ecRaAsX_J0BMgN8P5MdVf9AN8koLL0L5QtCRA>
    <xmx:psEdZYFnqWN39u-mGLX6Cw_bES65Q7BmYKvEYHkX7qayzFOJafLH8A>
    <xmx:psEdZT-U8WuCJcM0v9U76Q21PRz1YCQ2_A48wPW3Ah1g4iF2wcY_5A>
    <xmx:p8EdZTBwIEMm32g21FP92PpT-C-_KUif9G2ZMUIFS0MKCsYB82Cyyw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 15:48:53 -0400 (EDT)
Message-ID: <e91a5006-ffa1-79a9-1679-cfb02bc974e7@sholland.org>
Date: Wed, 4 Oct 2023 14:48:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] RISC-V: Fix wrong use of
 CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
Content-Language: en-US
To: Jiexun Wang <wangjiexun@tinylab.org>
Cc: conor@kernel.org, guoren@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, falcon@tinylab.org, jszhang@kernel.org,
 tglx@linutronix.de
References: <20230913052940.374686-1-wangjiexun@tinylab.org>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20230913052940.374686-1-wangjiexun@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_124903_353434_D83B8396 
X-CRM114-Status: GOOD (  14.24  )
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

On 9/13/23 00:29, Jiexun Wang wrote:
> If configuration options SOFTIRQ_ON_OWN_STACK and PREEMPT_RT 
> are enabled simultaneously under RISC-V architecture,
> it will result in a compilation failure:
> 
> arch/riscv/kernel/irq.c:64:6: error: redefinition of 'do_softirq_own_stack'
>    64 | void do_softirq_own_stack(void)
>       |      ^~~~~~~~~~~~~~~~~~~~
> In file included from ./arch/riscv/include/generated/asm/softirq_stack.h:1,
>                  from arch/riscv/kernel/irq.c:15:
> ./include/asm-generic/softirq_stack.h:8:20: note: previous definition of 'do_softirq_own_stack' was here
>     8 | static inline void do_softirq_own_stack(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~
>       
> After changing CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK to CONFIG_SOFTIRQ_ON_OWN_STACK,
> compilation can be successful.
> 
> Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Jiexun Wang <wangjiexun@tinylab.org>
> ---
> Changes in v3:
> - changed to a more suitable subject line
> - fix the #endif comment at the bottom of the function
> 
> Changes in v2:
> - changed to a more suitable subject line
> - add a Fixes tag
> 
> ---
>  arch/riscv/kernel/irq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Samuel Holland <samuel@sholland.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
