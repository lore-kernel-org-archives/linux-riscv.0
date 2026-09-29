Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B8CCA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hikCMQNvCBxmmuG4cEpKMsraz7h0csmeyYTx3p3QB1I=; b=shGTCr+cbaJzmF
	7HkHNA8+UFQ/QS+mf2cDk+h44c4XtFwWRlxM6NjWyzANEEM/cQXHE3ija2HbrhTzGAka1LvAeXc9L
	R2bxLzbCb9d6zJxoJiWOj4wmu18G5ReZI1dvUXf3+ZWeCSeyNMY2ycrt/UfRpXFVok4HqgDtdizSv
	t6VaSdKjttREFkq3OveypeuuJA9kY7qYG02ZZMF2wgxEeUiFjWxzdEuQCURjirwfoG3hYOIM5E5dp
	lsPw9QnBXIUPBOgDkh9fKoCk5vuMpyoRldFuX03ewWZi7ru9HHbx1VqFIKlCPwLHpor5nViCbdf5P
	FD2bF5XcUIhKinb37m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfBO-00000004a5X-1Mqo;
	Tue, 29 Sep 2026 21:16:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfBN-00000004a5O-0Kei
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 21:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 084BE44000;
	Tue, 29 Sep 2026 21:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEC81F000FF;
	Tue, 29 Sep 2026 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790716571;
	bh=xpw024FPprsgBJNE+ZftfnLgbwyIdP1EDp11HcHw3IU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LHt2E58QCAUzIRlzpO6t7v+9zqFQJx+Jwc46d3dgQ5lIjV8BcZ2JPYxER+oq+CsYl
	 od7zS9SWrctFtLl+s9Uks5G9FH2b6B5esIaprOPo5il3JGGHFWWQOd/swDCLowTCq0
	 G92spy4chD19G1XJwxbrPHXhazJce0yxPyaAny9c1mRn343MWrfSkOW3WjKP6YiAym
	 /l7Ey8BAIfg7io4+BQk+H+H7oca5+I9+WvPFzpWjrMCSTPNI5pay/i22+AEX6AqFyw
	 NJRu1AN6MplN/+0d3kq+qIYV0TeAN28F3DVUUPezv7nkLajI+6M1AVr/EkqvuNwduq
	 SUukdTAnGKU3Q==
Date: Tue, 29 Sep 2026 23:16:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, g@zenone.zhora.eu
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Min Lin <linmin@eswincomputing.com>, Yulin Lu <luyulin@eswincomputing.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v4 5/7] dt-bindings: i2c: dw: add ESWIN EIC7700 SoC I2C
 controller
Message-ID: <arwqgeAvwVFyLBHE@zenone.zhora.eu>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-6-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814070007.1662455-6-pinkesh.vaghela@einfochips.com>
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

Hi Pinkesh,

On Fri, Aug 14, 2026 at 12:30:05PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add compatible string for the DesignWare-based I2C controllers present
> in ESWIN EIC7700 SoC.
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
