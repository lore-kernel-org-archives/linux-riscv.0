Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC576CFD377
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 03:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvKAFpORm5vsjrUlAJzyKTDYpWbZQ6/qVhEygyM+ryQ=; b=nvPN9Kn5mqcNQs
	0ietySCmA/0n27QCudN1qJ6S8gkBkVbeFF1KiwCxaSfUk3uS0qIdieTgijf8R9ZtyjZEdQdYfHhyO
	6QhCF+CrVy3UjkGcX+WW2LUSQgywQZfCv0K9mRRXQvZdkbbxChZ6WRPUYujliGvVb6OKxvEiQgJ0r
	S6jtzwV0q5apbrwfkk43g14okECC2d6k1cqTrnW/DSb5TsL5w/KqdLvcPooU+OiOK2Kf0RbIIgscC
	eEJE0PXgp9m3fCpMBkIlQroxpw5OsgGFEeBjqQfBeTDQafBp4XcZMYeU8tBgGawbv3VWhRQGvvAkk
	FIDWQBM0mkk5JDI4cOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjhG-0000000Cg3X-2l4C;
	Tue, 25 Nov 2025 03:26:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjhG-0000000Cg3Q-17rH
	for linux-riscv@bombadil.infradead.org;
	Tue, 25 Nov 2025 03:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z6b3jIy5U29fYjk2YowbODbgMZwh0DPU1URFbpiQ8TU=; b=Bgidt8g3fOBcjVvlKj+4+8EQgJ
	izURK3ERdFEOLGTl+0fwFX0E6np5peAZm88WT32i2zryEAFaDsiUg2b2o367Ve/K6B4D9QfWOCT/x
	nX6zmoL2GptVJjZwvq3Zhz7gT6sUcdb5ynyiJh49KaPttNut2+zJTZ5Efox0NvulDseTq7id81Lha
	ReonU8OWmIN8fLxTstXHkLywH+okaZ14fwHJJffkLB/6CeicBSFC8ib35unC0rutwqtp/jbwwH7eG
	Eb+75YsUZwPXdSJQr6R5UmU3GlpkHWVDrmrxqV79Bx6BChm3RYXtxOffI8VV4nteYoM7fQKFe9CFg
	YcruiokA==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNipb-00000004xLk-2qRR
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 02:31:05 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3D49225FAE;
	Tue, 25 Nov 2025 04:26:01 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoLdeC5lYiO1; Tue, 25 Nov 2025 04:26:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764041160; bh=WZOjQURqId+CZRRksRPejtKE7iaWEe0VkQ6Rm92giGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BrcIIohoKNNkMI5m3sBYxAL6MUaym4qL4VxXqj6mBdmYccDyW0/M3pRIibsNWATrF
	 +wpaFRbTHjpfB7GojepF6QK83pZmjDgKbuwJwRbaank+aico/a7lYUhzlGlOCx44Fw
	 WZiyMZXPYCfmszvqN29j0ht/0fnu7VceNmOkn6JsrtHFEGujDTKpbW1BvHgQxHRYaJ
	 6rXsTRmcAjLv7I7izPNvM+A4CjH8g418bf7Dylux5u/3niP7TsQbYdlXIhXGarvCGc
	 kUp3lQ63pFIU2sm1U/K1GCxHtVjV2wh/aq7tee9ZLpSUG28pOo89WHRPLXPDXQE5KV
	 ei65w2kolZX4g==
Date: Tue, 25 Nov 2025 03:25:48 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define
 multiplexers with flags
Message-ID: <aSUhvEOIFclRP3Wg@pie>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-6-ziyao@disroot.org>
 <aSTYt3mlJCC0f5TG@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSTYt3mlJCC0f5TG@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_023103_934478_7F9638E9 
X-CRM114-Status: GOOD (  19.92  )
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

On Mon, Nov 24, 2025 at 02:14:15PM -0800, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:14PM +0000, Yao Zi wrote:
> > The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
> > parameters to specify clock flags and multiplexer flags.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > index bf8e80c39a9e..79f001a047b2 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -101,17 +101,22 @@ struct ccu_pll {
> >  		.flags	= _flags,					\
> >  	}
> >  
> > -#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
> > +#define TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, _flags,	\
> > +			 _mux_flags)					\
> >  	{								\
> >  		.mask		= GENMASK(_width - 1, 0),		\
> 
> checkpatch warns [1] about this line:
> 
> CHECK: Macro argument '_width' may be better as '(_width)' to avoid precedence issues
> 
> I noticed it in the patchwork CI results [2] but I think we can ignore
> that as this patch is not actually changing that line.

Agree. This is only a "CHECK"-level warning, and for these clock
definition macros, I don't think there's a chance that precedence
problem would happen since only literals are feed into _width.

Enclosing the parameter in parentheses also makes the code a little
messy. so I'd prefer to keep it as-is, too.

> Thanks,
> Drew

Regards,
Yao Zi

> [1] https://gist.github.com/linux-riscv-bot/a335020c99ef628bb38e0a4ea85e0c45
> [2] https://patchwork.kernel.org/project/linux-riscv/patch/20251120131416.26236-6-ziyao@disroot.org/
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
