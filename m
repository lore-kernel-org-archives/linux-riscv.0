Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B0BCD37BD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzHfE6/6SlqrAxSa7oYUD/FPrQuUx70H744uBjys22c=; b=su4AcWoHxDA6Sc
	XpVnA+eaCx6tTk2Qyev4fKkA6D5qb3RliidINfQ04H2uhlGU4kTEWDg6NQJjFZembZyRUBAoePIyw
	EFoCuHxhqZ/s/I7gd5s/P82/43Q0VDY/xLw4Kc7TRakYMlYMuHYwFtU6JNn3CpkDsOCaznB1j/4tt
	59gtz9Lopaxk4R4wG6fbHwvLrwivAPD4sSjWsU08Y8gytxD2e7j4RiUJiLpWIHHCNfX22KxHQsrOW
	NY5qU5i3JWWP2WDiiY+Nw+h2ABLvmVQctpdpUHWUyikFdijZJaXpOWHHQJ/mmJE1wCALnk+ANqLNL
	aYacsJ7G7d4bogsqeIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGzc-00000009Rgz-40ZA;
	Wed, 12 Nov 2025 19:59:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJGza-00000009Rga-2mcB
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 19:58:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0667E4199C;
	Wed, 12 Nov 2025 19:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB04C16AAE;
	Wed, 12 Nov 2025 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977537;
	bh=qA1gBPYG6fLY52w2WE61R8d+PHhiZ2IulpfhWnd2Gf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gNOTztXpD8TlJBptngb5cvc6BySZ6qLPZOxc1lzu1Dth13hmIH7bWKzn4JmY1AlEW
	 fJ9sACZ433nJWjoe8jxWD6jZqGvbsO4FtWPfIGz9H+wSRPFPZLPE0FT92IXcLyhIjy
	 kqWhsXE8KCmdJAdvLHrNWzfNSXAJVam5L2nh94ZwRgr/RTalLJyuxNKq2W3F2PB1vW
	 ZhiG4WdaYEvkouO0xqViWLrQ5Ln56vhI/ufauwtD84mB2UbdmTQ+sdBnYR5DV7EnWj
	 pNnfH5mJ1uKNovijuc13g7EwJf1SAd3xPpZ0xHriLzCVWyXM5ZPRtxL7+UXzBMTAJe
	 g7WHukfv9FbIQ==
Date: Wed, 12 Nov 2025 13:58:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
Message-ID: <176297731621.2151636.2516355929483523874.robh@kernel.org>
References: <20251023160415.705294-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023160415.705294-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_115858_745825_EE199E9F 
X-CRM114-Status: GOOD (  13.73  )
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

On Thu, 23 Oct 2025 09:04:14 -0700, Guenter Roeck wrote:
> Starting with commit 69a8b62a7aa1 ("riscv: acpi: avoid errors caused by
> probing DT devices when ACPI is used"), riscv images no longer populate
> devicetree if ACPI is enabled. This causes unit tests to fail which require
> the root node to be set.
> 
>   # Subtest: of_dtb
>   # module: of_test
>   1..2
>   # of_dtb_root_node_found_by_path: EXPECTATION FAILED at drivers/of/of_test.c:21
>   Expected np is not null, but is
>   # of_dtb_root_node_found_by_path: pass:0 fail:1 skip:0 total:1
>   not ok 1 of_dtb_root_node_found_by_path
>   # of_dtb_root_node_populates_of_root: EXPECTATION FAILED at drivers/of/of_test.c:31
>   Expected of_root is not null, but is
>   # of_dtb_root_node_populates_of_root: pass:0 fail:1 skip:0 total:1
>   not ok 2 of_dtb_root_node_populates_of_root
> 
> Skip those tests for RISCV if the root node is not populated.
> 
> Fixes: 69a8b62a7aa1 ("riscv: acpi: avoid errors caused by probing DT devices when ACPI is used")
> Cc: Han Gao <rabenda.cn@gmail.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/of/of_kunit_helpers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

I guess the riscv folks don't care about supporting the relevant 
features either, so I've applied it. Can kicked down the road again.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
