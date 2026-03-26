Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9147110AB82A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 22:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJaEvkoJ4UKxaHtL1McrxU4n/wyJhnhDocHTxzMNBJo=; b=Mhar5xWqgw8V4W
	36j+3EIsy8cXIgZ4CvOWgpwNpSTj1hV4tqeep/aO59xwh5kthRJ9e4eBYOd/dB8GBAcuBzXJGLZ0h
	CrY88SsFvPDxbDuaD1xayjbPRwDmZwntHneEx6Reie4JC8+dy+rB8mJxI7rdu+EioJfLACxRiVmlJ
	/kzpG+q9hfhYL+AI5VCPNIV5yEmuCEwWo96ryZ2lR57oGVCHa5oG8BxZtDXGwNkXJ1o0YyQDk+org
	Eu33fwh9jBa3WViH6SvVb0c17MPzzfE+kF657gWAKtqOi9ksZbEfwPhGd9Q2p6iN7E95lUFYBlL8f
	NTFBDXLqyTlA+l72sqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tC0-00000006KP1-3oS9;
	Thu, 26 Mar 2026 22:28:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tBt-00000006KNb-3Sg0
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 22:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4469C419EC;
	Thu, 26 Mar 2026 22:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C19C116C6;
	Thu, 26 Mar 2026 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774564117;
	bh=4gZcZUjzK1nptPDjqxf5FRALWYV3UOJkeX8BT/yrYBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lXhrbzh7YidpgRyjfk3N0Rngay6NJJjRfk4J/ccbQz1Np+vXwJjsFndefuKZYO5vL
	 OhAzvcyNKPKCSboD7lhLYMRTtPwLoOe2GfuDWNjMJ3bW5MVSEV03/DnELLrkHZrQ/f
	 gLKTnrVcx112WgTHOGYxQg2OTJaCXfvKAnEhSpPCWdeTjiNuyho0Og/uacbfFYGGPd
	 RI0hzJpuRmVggdznQnAyzGC5VCHnjUsUOt0WZ8CuxNjahGSTCbwG8h+VNjluqmfkw2
	 dKCyEZt7iPw/Lkt8P9rOong63klmwfBTPwzRMfjkAHntXGokPSlk0Pk3+O0tZ1bP11
	 wyzaniIHiCjUw==
Date: Thu, 26 Mar 2026 23:28:33 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
Message-ID: <acWy_QTLt4U292ub@zenone.zhora.eu>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_152837_879316_868E742D 
X-CRM114-Status: UNSURE (   6.90  )
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

Hi Yixun,

On Wed, Mar 25, 2026 at 09:49:24AM +0000, Yixun Lan wrote:
> Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> which use same I2C IP as K1, so make it fallback to K1 compatible.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>

merged to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
