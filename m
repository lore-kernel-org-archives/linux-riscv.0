Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C99FCCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTtBQ/8+J6+rMRAmkG/g2cPYMbX7HVngJwzpkUHAxFU=; b=4JPZxDhwBCXNSi
	YZh6CLgYBtTMXTdmJGIzvVhZoZzeLw+tj18rjystujP3jkcoEagyGrgZSqPpBDiwriYeLU/c0wMV+
	1J41uDmqM9InGUxle4XxRHkIFls42oPxTYDZY4rFWpa7eQPtQCCG8jZmmwPKlTK7iR8V6QohKtw99
	eQCZoewTjfDeYlqUguHJn8kWkIBkvDO2f9KaOQQvxNGdE02P1iX1+9Iowei1shO/2cfuABmvgoua5
	g+1XcpI9ubfPlK0ZPExiJWaIrwwRi66xsRTJs3i4PqGYx6XhKK1kuAe2X0vD0nzZTzqnD1IJB199d
	FC/Se/XoevKTtMUNgT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByUG-00000006wYZ-177H;
	Thu, 23 Oct 2025 16:48:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByUE-00000006wY8-1oE3
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 16:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7B4B61151;
	Thu, 23 Oct 2025 16:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298A4C4CEFD;
	Thu, 23 Oct 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761238105;
	bh=HFbHH8CV1hWkCQZ8V2BcUz8qzfhboPkZ3UfAxQ+TdBE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qxT2n21uWhB6zc9W0TrTRu4xWn6UEN/EJ2Fv/TaCCl1iPubRAi/luzyHF3RInEnPG
	 6CcsRFaQCVlkuRowmJnxZ5Lmc10uLvoV90lhwPfzHv02svbXksuGCSWetzKsUI4M9A
	 nss0EF1Bt50Hmr3/gw/OPUIgymUDbGotRH7ehI865/GtCFmQkhaJfEtaUQ3ymaaFZ6
	 WJHeUG8aALbGMLpPuh7epL6n6QepG5FI6DPmh0PuqIbwXo9OcLEZQoUF+wfTCsbUB/
	 F36MxIdt185pW3t8NKD2gdtrIRaeI16DGULg9PhGhmcBDxDvUWFrBCfPYsWG3QDuuR
	 5sUf0NelvZ6ng==
Date: Thu, 23 Oct 2025 10:48:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, 
    Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
In-Reply-To: <20251023160415.705294-1-linux@roeck-us.net>
Message-ID: <2bef32d0-2c35-c93d-08a8-71966c1212f2@kernel.org>
References: <20251023160415.705294-1-linux@roeck-us.net>
MIME-Version: 1.0
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

On Thu, 23 Oct 2025, Guenter Roeck wrote:

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

Reviewed-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv

thanks Guenter,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
