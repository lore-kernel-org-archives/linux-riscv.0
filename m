Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAECEF5852
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 20:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tvto+W7w6VQvoCrd5/A8Qn6fEMgMxlDJgh4cOvIaVqU=; b=V6cPdxdgn55gen
	6yrtHxhZKoztNbbp7PplWowJig2FuSam+tF20i7wDRzoY3+umiIm97CosVT64ulfxmqOvx8p6OSrk
	OFl/zF/eqr92dNdxheEy9MlVdKOnpta4WCDpwjm2Lm8brTb0kQTMl6HaA3wzD5A4OVVBhJ5+S80/H
	/cuzQi+ZIAHgYzvWrHf2OR4m9DxvLeCWSD7vH/9LPbzUkLTcY1C5cjEZRvxYV9aK/oc6yxzL7vJ+Y
	MHqp4s0FaWh6yJwCgWJbsBCsXK/+s4yoegiAjDivP/badmpiLrhiDPfIAxZR4wmRs5uXAlKzEP5Kr
	1SCXA6O+GgMZ9B2Oh0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMNp-00000004uXV-3MPy;
	Sat, 14 Feb 2026 20:36:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMNo-00000004uXM-2UTx
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 20:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A24B3600BB;
	Sat, 14 Feb 2026 20:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E81C16AAE;
	Sat, 14 Feb 2026 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771101411;
	bh=QDdd2+1ycl3mmYqGRk4XVRj+dso5vvrnBiAxu6oBwO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVqCYLeMHW6BQIMgVL0MXYWVe9087z9fJjE7H8JcjAvmD8k+ixowoiHvND+mgBYwM
	 0nGTEhU+zpgTRqlZVutlHgnJEfCv5P4C7uZ+k3xUV7RVovLEi+N7ALdcTFkvAZdPpP
	 bdOuyus1xvB8eXC9Q3it2RbZ3FBm0qeMw0LCuxncUSdoVnhvXL/9F1ec9Ehbre8xF2
	 vadK1qNWtKtoDQzyWFpaTAiEbHq5s/1PIqS5Nm0RMRNO8SLYznbyMCOrXc19JpQnjJ
	 8WJ3HsR4bSZ6Gz4/165ShQQ0RBNyry3uSj83z7czNQ/B3l3fz5mq+jXOcr+40sOujb
	 BhRoQSP3m1j1w==
Date: Sat, 14 Feb 2026 21:36:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>, 
	jiayu.riscv@isrc.iscas.ac.cn
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <20260214-lyrical-rabbit-from-camelot-2e1195@quoll>
References: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
 <20260214-b4-k230-clk-v11-1-6de365489b89@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214-b4-k230-clk-v11-1-6de365489b89@zohomail.com>
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

On Sat, Feb 14, 2026 at 08:54:37PM +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the clocks and the required
> properties to configure them correctly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This review and the patchset has one year already... so I am afraid it
will be resend and resend, thus please also implement below:

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
