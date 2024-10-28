Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C8D13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 07:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cg5q/owzjMYnkCZtim4UW78bLcVK6j+jNOhZ8XCLg8g=; b=gclxnBNzVxzGsM
	CJIvPRHB0N7fnnGdVae+l0oOBxbMZ+gbgOayvD/qa+bBeCvwm24cjYoU3Gty5B/FhPu/uEkHKckJM
	s6PP4GedX2/quO6/9e+3g3Cv816RhGiyc5A9Xk33W8YFmegxIxU7S56e+NiOpof5VEo+tgM5HBK8H
	CTCQAFcqh+X/cNOke4P+o8LAEMIgUsGt8fgUS98rIzXLD1OkpfHjY3BH2MZcGQWpGT6D4SLBRfWEH
	BDgNHfj3+nIoQ8ZTW6tsbcdAyYHWRVWipDhSJj5c2xOuIE40OXY/c0uMqDsVKGT5gNzsgcK1FQ3o1
	IixxX/wrbrvbtyjDmseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KM3-00000009udN-2bea;
	Mon, 28 Oct 2024 07:39:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KL1-00000009uJR-3eFS
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 07:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E34DEA41926;
	Mon, 28 Oct 2024 07:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DCFC4CEC3;
	Mon, 28 Oct 2024 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730101134;
	bh=JuicChqAxrZATICnsbGhsPkuOFQw8eOyMB5wZTaLbds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f10JEsucxU7RFGwNbz89W7LzTXTOmDvvby2TiNbe0GJMt8T/lMlrtP9Fm3RMJx+un
	 MndPr8oIb4/tpYIOELIzySjZMq3s0VBT/cPRX3UcgzvL4/QlVrGMlFDYVaCVY2FMwC
	 gb6l7yfMJEkJ4FFLDrHd2dkyzzBLwLoWkDV0DUPdUWgoAzHFuj67gzt+Qhd6xFBThx
	 MPuT7YNxnQGhz+E18N5OufyOAU1T7YhY+Vf4d3ZLG6/i6aym1Fv23QRPPOI3qMhvst
	 gs5ICkgKRecsyp2NbyrgU2/0kyIiLWaZOzNiYjkhgXTelDFfo41bYJSoQV3giIT9iq
	 jCjV5WLLHN4uQ==
Date: Mon, 28 Oct 2024 08:38:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-2-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_003856_005723_48C0802A 
X-CRM114-Status: UNSURE (   7.36  )
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

On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---

Where is the changelog? Nothing here, nothing in cover letter.

I asked for several changes, so now I don't know if you implemented
them.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
