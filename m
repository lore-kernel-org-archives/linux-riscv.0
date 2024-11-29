Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC69D6EC05
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH/KaTZmNBtSRbHbuEY27KMHPTTLz4q1w74AIJMMPmA=; b=yEt2COViZDoDku
	KFFj9W4P4hcnIiLq6L5fxUopN7ynrHvpvk7ZBHbQdfuw9jHLLlw5Uos5fr6i4h7rh04us0Qzgtddt
	8tqce73yzdliBuLL5ps2QpaJI/3Cr320ajEezRrAegsaBRYJASgOdZtXJ6QbLySk75PIvybCEolFy
	vu81WhYFy3GjSDDCQzJ+b0DZDKFVoHYB+sDWMfnN76xbtXUR/wjgdzLiqaadE1ZPqWl3EPKTM4u3h
	K3FYO+fpuxf/SDG3jtT1w1fSEf6THKej+xe2uEtL74vUAS8Z96leM79rkABeMZOR3pgg+HkM6LXO5
	+CSJauDA0dO7l+BUV48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzyV-000000003e1-3RW6;
	Fri, 29 Nov 2024 12:19:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGzyT-000000003cX-2ZGQ
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 12:19:54 +0000
Date: Fri, 29 Nov 2024 19:19:29 +0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732882790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=194Dl+Ndd5fhcCTGY5CqE8SBD4dv8kTBgN0LNYowsjM=;
	b=X9nr8zOJWF6bBVz9rngb5ykLjOrZOhPXw2tNOEJaDM+zHtaI/XRDT01NS9jAlwprCxgncC
	woiZmqBZajLS3k/bsTs5oKGSyLMkY2NhnJfVDn4HnDnocAgrDpe1atKzVhyon0Mr8P6mbg
	Vj/OHIuxKgfPd5NR2jEgFYdvXvJ3El0X1QTvfLGjHud94bvOUBOSol9d8Q9hJzAMHvuVw2
	KdHB/2nL5kN5XGiM1r6C/M6RuiiDgzymeFpJ7OP3ofFzn3gd4ewwIcSkS8lWOZBVYXg0e+
	vT0fP/Aq3G9Z1gULIJnUap0FIM7XAwd1p+coazJwd9ib4WmrJCFzAkmYMknNDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732882790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=194Dl+Ndd5fhcCTGY5CqE8SBD4dv8kTBgN0LNYowsjM=;
	b=qtmVVG8xie1wpdQ1GBPd2eSy/fK/mjWvICrZ5Wmu1NcIFQjS+NpOVFlPFT3mjCGLsWkJSQ
	y1mP4KaZHY88bmDg==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: kprobes: Fix incorrect address calculation
Message-ID: <20241129121929.tOHlWxwS@linutronix.de>
References: <20241119111056.2554419-1-namcao@linutronix.de>
 <7662be43-16e6-4695-9bc4-077e1dd3ba12@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7662be43-16e6-4695-9bc4-077e1dd3ba12@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_041953_787364_5AACF955 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi Alex,

On Thu, Nov 28, 2024 at 02:02:40PM +0100, Alexandre Ghiti wrote:
> On 19/11/2024 12:10, Nam Cao wrote:
> > p->ainsn.api.insn is a pointer to u32, therefore arithmetic operations are
> > multiplied by four. This is clearly undesirable for this case.
> > 
> > Cast it to (void *) first before any calculation.
...
> This looks good to me, how did you find this issue?

I found it while working on RV monitors (Documentation/trace/rv) which
use kprobes. The monitors exploded on riscv.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
