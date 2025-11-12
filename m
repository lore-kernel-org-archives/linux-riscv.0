Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3540ECCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDZyeOZCrabHBcu4zPz0JadrSJfJDLbkc5CPMw1/MkU=; b=xq+ibGIHjOhF5u
	M32Z2vEremYOEwCMSC7o7zVznb+LPDRMmBSZ5GLHAWvAMBmRDRIXU0jfoU8Y2waa9sYBLrGtVSmeg
	IwT8dieAe3scd6sWLgwQJ0358xqDmAwSgbEiKiUHAMLE7ta2C85surSC4FRFRH4g8WJT34qf/FrUP
	5liBbNAeIZbi7CvQ59ZB9iqun99bq1DnQfK24ob4tyZHXTOaCGuhQx1lCeM8byQvEVBlxaUV8LrcF
	E6pco68ygsKtyx+19YgJGpabZtLrepm5VnDCMp8ciy2yBwmezvaN2pXioI+eX6xpVQsW3PcIjgFub
	XerCAnKGEJ2AK3ZeWsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7ol-00000008X6M-0k6m;
	Wed, 12 Nov 2025 10:11:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7oj-00000008X62-12VW
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 10:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A13754191C;
	Wed, 12 Nov 2025 10:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24445C16AAE;
	Wed, 12 Nov 2025 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942268;
	bh=67K+zUYP/aX07sPx28wY3sUmjVIxiApKZNs5WbP/U/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsFw02eZhsIPw+FfG11keYy8dCIECtSNGvyD+WPxdkQesFL6xRcwuaZ4wghA5HKT6
	 LaSlvWi4cRWWWLMmgzqwOlqzVRzO7lZLLwofPFRej3C2JevpIiRqg3kPmc8UoX8vOJ
	 XOJBPp4Bf42kezFpeQDGQYrGWjFnhAt/P9wReRuWGotHHidZASLq2m6ymwwAU2NaAW
	 A8gzJ1aS5FNm+yMpaS1C95OCNLJkfrIdAetAvdGsv4rDTleZiOuZ4i2973aRiXPNTu
	 WB0xggNCqMw+R6Y0P4VGJnUOwowBLdSGzCFJhUjQhr0npfC5qFTTR+8Aumke1zSV+s
	 wZK3WwYSM2d9A==
Date: Wed, 12 Nov 2025 11:11:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251112-devious-devout-urchin-86634a@kuoka>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
 <20251112044426.2351999-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251112044426.2351999-2-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_021109_310750_B78169AD 
X-CRM114-Status: UNSURE (   7.54  )
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

On Wed, Nov 12, 2025 at 04:44:40AM +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Document the compatible string for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is in fact identical in die
> and package to the SpacemiT K1 SoC [2].
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
