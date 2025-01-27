Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB0C0218A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KPt2w7cPhLHbXUMUvOY7Z2VFwrQn1Pp00nQYl3gnypc=; b=sd2SDChtb6gJ9e2AwHp73IjI55
	tCp4p5u9bOgwkc3JKORDCLUZ9OERM7Oh8qtUI6vrwBPkzD9BjgOgA2UBROEG2brErTG+zo9NTbW7Z
	JxTKtgZdUZoZUxD05IwPaB/KPQxee2ZqRWUvsEyhr0yeX4ByNDy3dg9wmXlZ3xqGxUwbUMtisvPvP
	bNQdYD60PfhjF/16XP9AIuTUCdBkwKbmDq4hgQXO0ndwVphbvK2ylgbADhv7pR1tqU4hyGrtETSER
	VsXwtRUXqkdsPgb+G3wIhRS7U0g1dg9zyBNWYw6OCcFlfni5yQk6ePa4G95q6dwOA/dPjXM2UeEEk
	5d6riRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRtC-00000002lTk-3kwo;
	Mon, 27 Jan 2025 16:23:06 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRt9-00000002lSu-3CA7
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 16:23:05 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 61E6F13801E9;
	Mon, 27 Jan 2025 11:23:02 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 27 Jan 2025 11:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737994982;
	 x=1738081382; bh=ApVJqWJrmAI+GPk+oFV8g7rgJ0iBONaFFyXlKmkLfs4=; b=
	zouG8SAm1KWB2csr0aKKjF77qSzd2OYDy0xGnQrmnZKSWN1D916uQdppeKlHxXoX
	Yq+vx5nCbHh4E9KsLQN9tHiHbRgJJH8v3x9VYmAE9IhEdMEx5tQK+iTVrA1oy1rc
	A4WcKTaCNyNVJxdfG+SDj2CBS5FQPYK40dun8Kp+YZr0SKtJcSkHZbkVLgdVS3Kp
	nEkz8FnQwzPFB9XZCSDigRHh/GhRGkmISMLgmXafey2epOcAvjBAKC3dYB8f0x2W
	ODG7STA2YwKADnfvHaeHY29vovk76VHCAwrGA+ULkKBEpj0AGrNfkff/U5FfM3NU
	P1rmxF5SctX3ksCeBkdDqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737994982; x=
	1738081382; bh=ApVJqWJrmAI+GPk+oFV8g7rgJ0iBONaFFyXlKmkLfs4=; b=b
	W2LJgmdgeGsMyCnWZDAPHla8B3nCuhP7H2HgwxZRlrZZemDx86CMWEQK1Pur9Khs
	MmN3JJtv35Dibajhtb2gFzfGJxT/wYevvB44FbcMutRegnD/J4ordet4dcT1ZKTh
	0NmjIC7IEuC0u84EwvQjRHKnaxFOTG0dmCTA/bWFpMdtvx17hMMRNVsV8r7Zoqvs
	aRQYEpgiOExwwC5PdlsZ0q0ICOFKNJYZlYQ8PRtW0A94mY9+23jCNSH+xp0IkLUG
	lqmXdmkCLXJ1B/iIu8TJd03cfTlB5XhaLUhdldnpDRru1nMqOFRNJCBK+rnX3O6N
	Zwk7wz7pB3NtnFIR7Ad0w==
X-ME-Sender: <xms:5bKXZ3MrgXQ_W86hHqmx9kIhiqc5EUh2-73IU6vzfIr7zQv6VCI30g>
    <xme:5bKXZx_uArhesD1-X16NciEe_9IS3gqgJWSjmJWFwHFpQhnCWEU_pUJqhylR_VcUN
    DDU_xHA0NrC_-VQmR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhuphessghrrghinhhfrg
    hulhhtrdhorhhgpdhrtghpthhtoheplhhihhgrnhhgjhhinhhgsegshihtvggurghntggv
    rdgtohhmpdhrtghpthhtoheplhhugihurdhkvghrnhgvlhessgihthgvuggrnhgtvgdrtg
    homhdprhgtphhtthhopeigihgvhihonhhgjhhisegshihtvggurghntggvrdgtohhmpdhr
    tghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqrhhishgtvhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegthhgrrhhlihgvse
    hrihhvohhsihhntgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehs
    ihhfihhvvgdrtghomh
X-ME-Proxy: <xmx:5bKXZ2SVI1miQAHh9zRnKxt2d4Xgw6jOObXHwopzOJ7y-QXpZEu03g>
    <xmx:5bKXZ7vfcaG8ivSbLmcYMTsQUfQ-Oj2eRXmGkKzoBeGzDlLppp042g>
    <xmx:5bKXZ_cIJrPyUGPTuT5KOy26x789KgCOPB5fGfxksCfl_uRk9MBYag>
    <xmx:5bKXZ31X2mlEs1T91sCUGAyjKGm_sHrZoaY5m1jh09eSnBUOw0IC6A>
    <xmx:5rKXZz5len_WW0ofp6Bc8HtyoCkD4iaf40ex6ytHHK88fXHG461jhg7Z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9C8572220072; Mon, 27 Jan 2025 11:23:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 17:21:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xu Lu" <luxu.kernel@bytedance.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Anup Patel" <anup@brainfault.org>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: lihangjing@bytedance.com, "Xie Yongji" <xieyongji@bytedance.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <a7d9b0e5-7ef6-457e-ace6-c56e745c3150@app.fastmail.com>
In-Reply-To: <20250127093846.98625-1-luxu.kernel@bytedance.com>
References: <20250127093846.98625-1-luxu.kernel@bytedance.com>
Subject: Re: [PATCH RESEND] irqchip: riscv: Order normal writes and IPI writes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_082303_873104_1B598A5B 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, Jan 27, 2025, at 10:38, Xu Lu wrote:
> RISC-V distinguishes between normal memory accesses and device I/O and
> uses FENCE instruction to order them as viewed by othe RISC-V harts and
> external devices or coprocessors. The FENCE instruction can order any
> combination of device input(I), device output(O), memory reads(R) and
> memory writes(W). For example, 'fence w, o' can be used to ensure all
> memory writes from instructions preceding the FENCE instruction appear
> earlier in the global memory order than device output writes from
> instructions after the FENCE instruction.

There is nothing risc-v specific in here really, it's just a bug
in the driver: writel() means access the mmio register with appropriate
barriers, while writel_relaxed() is a special case that should
only ever be used if a particular function is sensitive to
performance and never needs to be serialized.

> diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c 
> b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> index b0e366ade427..8ff6e7a1363b 100644
> --- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> +++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
> @@ -31,7 +31,7 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
> 
>  static void thead_aclint_sswi_ipi_send(unsigned int cpu)
>  {
> -	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
> +	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
>  }
> 
>  static void thead_aclint_sswi_ipi_clear(void)
> -- 

thead_aclint_sswi_ipi_clear() seems to have the same bug,
it also uses the _relaxed() version for no apparent reason.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
