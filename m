Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5172BC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKAoe0sXbPpSKS9IOmjIaQNC4i2pNixRRPjEdaiIg3s=; b=Lc1b4XBAsKbLoP
	JjB9srJg42aWjwV4rMQ5Kynm/BRZe3zFn+PG4L+uTEy7QJ7cMk9p9dNeGDroQ0tuSJ+Lc/rjEAoqz
	0j8QiqAHbnmiu7b5xoN6g6oYukRirwKg8mS1WBiWur547OFzGSKbYj5nGzi6CPKUuC3RdEfR4eYRe
	sG4AiB/lvyZgiSLPMEsbDTTdiRMNBH1rfiZxk3khC7G8m2mAMsMXZyZBqaHRzes0E0y0LF/HXW9Ng
	/i9QghpgMKnRWlgHt+0zNUE9yd4uZ+gZri3ru04n9eWvXnY6mXyzPqnatyJvSWXeX/V/eIq4TeBsQ
	XJaS1sk71IUYz8pfkypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AdU-0000000BEIM-2SQK;
	Thu, 17 Sep 2026 11:50:40 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AdR-0000000BEHO-3uQh
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 11:50:39 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5C37192009D; Thu, 17 Sep 2026 13:50:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 59D6692009C;
	Thu, 17 Sep 2026 12:50:32 +0100 (BST)
Date: Thu, 17 Sep 2026 12:50:32 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Conor Dooley <conor@kernel.org>
cc: aleksa.paunovic@htecgroup.com, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
    Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
In-Reply-To: <20260915-engulf-backpedal-fef3a5fc2607@spud>
Message-ID: <alpine.DEB.2.21.2609171247190.15569@angie.orcam.me.uk>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com> <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com> <20260915-engulf-backpedal-fef3a5fc2607@spud>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_045038_136763_90D1BF5C 
X-CRM114-Status: UNSURE (   8.50  )
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

On Tue, 15 Sep 2026, Conor Dooley wrote:

> > @@ -1104,7 +1106,7 @@ patternProperties:
> >    "^minix,.*":
> >      description: MINIX Technology Ltd.
> >    "^mips,.*":
> > -    description: MIPS Technology (deprecated, use 'mti' or 'img')
> > +    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')
> 
> This is starting to look a bit hilarious.

 This should read "MIPS Technologies Inc." FWIW, as that's what the 
company used to be called (note the plural vs singular).

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
