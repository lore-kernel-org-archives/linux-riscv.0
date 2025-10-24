Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B72CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 02:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AFHPt9dk0Os5p547yvr+e6YoHIrMDZ41xjvN+Q+XYI=; b=YNKxAqvoFDC5ScdBpuf06uE3a2
	teTbTTg3IDgsI8wMTaxhTLD57+JWOF2klYEBcTUJG4TUSCXwKwmMLpcM8HGqBphA4SzbOISMQu9KY
	QzxU9CQsF3irbuSUuoSS+qRn+nLmIkFt9gP4fc6WkdeoOD3akK0jorag8AqYaurWv1Ve68duFv6f3
	dahRz7+rRhKSePlwn4mn0OdtNWzw3+ZE6S6kpyvrnyVvaG2txD1ns7UhbvSw8vL4RX1GaKtiz3e2i
	XfSaOzi9fVQ9k141B9H9UTsFVVk1L+NiZMPfirhreJ5kKnnl0Hy+bQqtuPmi8O4vfEowxIbLKQcLz
	YjvsYYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7wn-000000085Na-3noo;
	Fri, 24 Oct 2025 02:54:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7wl-000000085N7-204D
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 02:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E7D243E86;
	Fri, 24 Oct 2025 02:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8D8C4CEE7;
	Fri, 24 Oct 2025 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761274470;
	bh=l7Kt54esXuy6cW4NMDoL5L7OAAPO8XqbVG+dMVCBp+E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pus6z7Hnt6+Il3SwthVqHOZDDC3GtvdSOcNTbT6k3s6naQxBmZJOubRVwEsVI7CyK
	 WwHiawimzzXy3DVXjWEmkdcXxxXFqrn999N7ZI7H7HyjKq02A/GMxhgXOCnCZJmk6z
	 n0KQA75orlACk89OVqeKuc9lAqR/aV5z7KDU7VlujFKQrYvsCQ0yNNsW0ubE+/dkF3
	 Q95Z1EikX6S25ZDXSZcCR+A3vCCid8FV15jt8fgkkJkDGG2/esvjgOVP2IRhT85kQT
	 xLf8nCNxFa7R1KdtwJeYAsF/Ch82aRUhnb3IW53Sv3a/CSExnMp6NddZCW55ctlM7h
	 AW4w3QXaTcjfQ==
Date: Thu, 23 Oct 2025 20:54:13 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rob Herring <robh@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
In-Reply-To: <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com>
Message-ID: <1260cd8c-2904-1a21-d7ad-ba9b82f67797@kernel.org>
References: <20251023160415.705294-1-linux@roeck-us.net> <2bef32d0-2c35-c93d-08a8-71966c1212f2@kernel.org> <CAL_JsqJjiB3h+hzstXSbnyFy+U39GgtT=rcb4r+QDv=uL54H8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-935726058-1761274469=:3901516"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195431_537642_A3285695 
X-CRM114-Status: GOOD (  16.23  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-935726058-1761274469=:3901516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 23 Oct 2025, Rob Herring wrote:

> On Thu, Oct 23, 2025 at 11:48 AM Paul Walmsley <pjw@kernel.org> wrote:
> >
> > On Thu, 23 Oct 2025, Guenter Roeck wrote:
> >
> > > Starting with commit 69a8b62a7aa1 ("riscv: acpi: avoid errors caused by
> > > probing DT devices when ACPI is used"), riscv images no longer populate
> > > devicetree if ACPI is enabled. This causes unit tests to fail which require
> > > the root node to be set.
> > >
> > >   # Subtest: of_dtb
> > >   # module: of_test
> > >   1..2
> > >   # of_dtb_root_node_found_by_path: EXPECTATION FAILED at drivers/of/of_test.c:21
> > >   Expected np is not null, but is
> > >   # of_dtb_root_node_found_by_path: pass:0 fail:1 skip:0 total:1
> > >   not ok 1 of_dtb_root_node_found_by_path
> > >   # of_dtb_root_node_populates_of_root: EXPECTATION FAILED at drivers/of/of_test.c:31
> > >   Expected of_root is not null, but is
> > >   # of_dtb_root_node_populates_of_root: pass:0 fail:1 skip:0 total:1
> > >   not ok 2 of_dtb_root_node_populates_of_root
> > >
> > > Skip those tests for RISCV if the root node is not populated.
> > >
> > > Fixes: 69a8b62a7aa1 ("riscv: acpi: avoid errors caused by probing DT devices when ACPI is used")
> > > Cc: Han Gao <rabenda.cn@gmail.com>
> > > Cc: Paul Walmsley <pjw@kernel.org>
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Reviewed-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv
> 
> FWIW, the fixed commit will also prevent enabling features like this
> series[1] enables. Arm64 is still disabled ATM because of disagreement
> with the arm64 maintainers, so that can was kicked down the road. It
> would be better to not disable this and address the issues as they
> happen rather than breaking people down the road.

Thanks for the context, Rob.  Can you share a pointer to the ARM64 
disagreement thread(s) (either publicly or privately)?  


- Paul
--8323329-935726058-1761274469=:3901516
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-935726058-1761274469=:3901516--

