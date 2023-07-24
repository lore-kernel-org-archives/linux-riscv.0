Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591B4C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 00:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV85vdyYCrgSSMLQYkHbgjUe5cex5ZpItO4Y6x3DbZk=; b=rlc0jkXlPRuKJk
	pHlTtR31OAg+D7h3jnnjzZFoFweHDYGUoQDpqVIJj0FKdS4eP+tkYINq+ft+uRFINmIGY5xfiJ16g
	Fr8XucjwfFRUiDpIoMY2D3ryyQqSKMuIzMQMjTVCX1/DmV4vLMEQxvkV50ZytlGFEcE2IICvAUMwx
	MnHiMRLzdpDxWMx9BkZxep129/yDyJ3X1Vqg6mdNesvQUaS8YFANSUmcq1tCoezKTQYou6yWhuUWL
	mK1j5ZwRmsdKVeAexTp1MQxZ28zggiWHIYxQR+Pi2IgX3adw+tUxq/AmrQFqOJ6kgsvyG1QczuW+o
	Bm9TRzhf+liwX6jJvOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNjXT-002GxD-0D;
	Mon, 24 Jul 2023 00:35:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNjXQ-002GwL-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 00:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64AF060EB3;
	Mon, 24 Jul 2023 00:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE299C433C7;
	Mon, 24 Jul 2023 00:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690158898;
	bh=gNbXnPpBgxiMLCQuNJ6rOoa/K4zGpmwvusnAIl/7MSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZYKx2OImxZFo4lkaeunx7/EG7kTr784+++JA/r9PeQx7HWhGJf8M/vPLIemqBjWZX
	 v8K9Q53GL4Id2bgkEv0xC6cOsr8iQd1eiCVXrTNgHqUbBNver/56/pJ1OkTVnU9rZr
	 RB/8y+NTv3qNxfl08rYb4G9E0s4I/fsFBo1rEJcUwJiIMCelfajiqtPR6fVX04p5xk
	 HGZ+DT7X37dessczfkDfgep2OlYR3zgM8EEYww8HF6VZ0IHAwCSVyeStmbydPaAGSs
	 TJIah1vVTZsIcol27zQniXRfkOfnuSRsxuhpSazcRjE73lvtrpNc+QRpaUwdv4qZMw
	 QBf36FXl7Krrg==
Date: Mon, 24 Jul 2023 08:23:22 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
Message-ID: <ZL3Eenj4lGZDhZTM@xhacker>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
 <20230723-savor-trolling-e35ed4a7a751@spud>
 <ZL1jlacHj7sgNg8M@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZL1jlacHj7sgNg8M@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_173500_275472_1F451D9D 
X-CRM114-Status: GOOD (  16.40  )
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

On Sun, Jul 23, 2023 at 10:29:57AM -0700, Drew Fustini wrote:
> On Sun, Jul 23, 2023 at 11:32:17AM +0100, Conor Dooley wrote:
> > On Sat, Jul 22, 2023 at 02:55:39PM -0700, Drew Fustini wrote:
> > 
> > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > @@ -0,0 +1,61 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > 
> > Hmm, should this not be dual licensed?
> > I notice the other th1520 stuff isn't either..
> 
> Good point, I'll resubmit with a dual license.
> 
> Jisheng: are you okay with the other arch/riscv/boot/dts/thead files
> changing to a dual license?

When cooking the initial patch, I wrote the lpi4a dts files from
scratch based on sipeed opened sch file, and currently only I made
contributions to them, so it's easy to make the lpi4a dts files
dual license.

However, when constructing the th1520.dtsi, I refered the T-HEAD's
opensourced yocto repo(in fact, that's the only sourcecode/doc I have
at that time), and the license there is GPL-2.0. That's
also the reason why copyright of Alibaba Group Holding Limited is
added to th1520.dtsi. I'm not sure how to make th1520.dtsi dual
license. At least, this needs help from Guo Ren. Any suggestion is
appreciated.

> 
> > 
> > 
> > > +	memory@0 {
> > > +		device_type = "memory";
> > > +		reg = <0x0  0x00000000  0x1 0x00000000>;
> > 
> > There's some extra spaces in here for some reason.
> 
> Thanks for spotting that. I'll fix when I resubmit with dual licnese.
> 
> Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
