Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC52CC6B1D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8SUEXAqN15Jff9VnEmPdbARRIm1Tv0t/Juru2B3oZM=; b=JOUl/82F/H9rVw
	3fnqoR0irV75v641Ddr7aJs8rY1sVoUc0slaD1tyMUXfZ5WDTzwWfQ4s0m9k85wDCKqh9t8U07qjf
	CoU6dTj5hH7nm3zSUYsarmTBElD+0oit/8Qb7M4inLgsBEvvj6BOIOCl7uEqRwUKFylzkMswLdcbG
	mFk2W+q7+710HTcaeHBgiCuy9NpbZq7Rp3EIh8BEkdGtC1pGjP5A1jpTzgxlKX3zO8yd1bKt48GnF
	BrKNXxpN1Cmg5geaq7owj9cG+4QTNDmAUs0cW27er7FHQByel1ChypL45o+0sDc7loF+lw77YUpSv
	H3RmyLURoCKAIC8vUYwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxOo-0000000FN7N-0r6O;
	Wed, 14 Oct 2026 11:43:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxOl-0000000FN6h-3rBV
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 11:43:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D3FC601F9;
	Wed, 14 Oct 2026 11:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571DB1F000FF;
	Wed, 14 Oct 2026 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791978234;
	bh=itoEIUzc+0gwQE1IVkzj+EpxNx5ikxz/5opU+c1Eqd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIHQfiFS6qYBspuylV7hnQ/Bq12saMGU+GQrG0/F0i8PTAzskbD7hytTlJWHk5/XA
	 FVd3SitReLOCivkFGMnmCNOI4QosuXbnwvm1RfRUGQmwymiUyUTTYI5BuqkjFY5atg
	 vzeWrR1H+/0LnSuNlVcKkymHP4KxEOwaNQ7Kij8JHBXNt80wwVnpbBCunFbaoIXuDz
	 uebSJu5q9B5lOmSBkpx6Sn2CYbm1QW/0mdjD5TABjUeN1dorFDWkd6na4o/zZZU8u3
	 u2a9vlWQ0j2tfsJbL61Uamq727I23RjZ0jq0CJ859VQTMrFwv1E+Y+aGRmAIolz6xv
	 hUj+unDk5zBDQ==
Date: Wed, 14 Oct 2026 13:43:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Message-ID: <20261014-romantic-pretty-petrel-36c7ec@quoll>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-4-inochiama@gmail.com>
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

On Wed, Oct 14, 2026 at 03:45:15PM +0800, Inochi Amaoto wrote:
> Add eFUSE controller node for SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
>  drivers/nvmem/sophgo-efuse.c                         |  1 +

Review code before sending.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
