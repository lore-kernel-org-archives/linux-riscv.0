Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D43E9904B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 07:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNJjOvW0TRUR+wMIqI1drDqNPEswHb77VJhU01oj5mg=; b=kn/Qhfu7h+cc+M
	NbLB2utu/6yog0hQ6C3d8eNzmMxu5srt74stsjGOwQrCkKJzGzEj0lc4wrX3d9lcBJ7YkmQYMxsJ7
	G8RKQklz3RmThEOfAO+p0+2jQHwD81/OcNTYofozFPc0nrMJAdD+zCI3udwJVNVnijrN6CdQW/FOB
	5TOjVaaCuH2GHHADK+HYeFRFu2vOdHxs+mMyajkSLO+3SJL+6UnSyLbLqF0+FH+MGdUWy+kGfwLzA
	x0k92ibsrV8HFMGXyZcaP+kWYIArR96Nk+yg9nI8DbS9G1wgCwC4t2KfLtGgc7bD3GmIDDFKBilne
	Sye+q0Nai9F76QD4fQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6CX-0000000BjAS-3N8U;
	Fri, 10 Apr 2026 07:22:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6CW-0000000BjAM-2GZW
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 07:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6758260125;
	Fri, 10 Apr 2026 07:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD2AC19421;
	Fri, 10 Apr 2026 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775805767;
	bh=D+3VE7auXUwKDyDmy36ChnTT8wqPeJaS84T9tpD3xtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fmw478A6sxCwLi7h4DK2b6E/Lm/QXcLWUs34/gowxloEBgb2ac9+KGxSebf2L9R+H
	 7AecROkDpmm7hdxsNSmAXpSNRztcl9LkWxdQOtMwfelluRbEiHqY8slDpQqkV0RgMZ
	 hU2b71NGSvdoaM4a8Ue7JkzSAytVBfkJ3IZDTjY8tklusfmnLTrQWPfyAyql1U0jLi
	 oBZkj5bom6iH2DUhrrheaD1bnQGoQcpY8evaMfJuYrOc77S/a/Q/agUOoMUTnEgwUv
	 gSnlGqij8smQMRD1/68ut3rO4D6kRHudxx7ycK2ikT2vh7aFZytHXc2kadciNjv1Do
	 yPIxoW4v3anyQ==
Date: Fri, 10 Apr 2026 09:22:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Vincent Legoll <legoll@online.fr>, 
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: Add SpacemiT K1 thermal
 sensor
Message-ID: <20260410-inescapable-glossy-cobra-da4bf4@quoll>
References: <20260410-k1-thermal-v1-0-12c87dd063c3@mailbox.org>
 <20260410-k1-thermal-v1-1-12c87dd063c3@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410-k1-thermal-v1-1-12c87dd063c3@mailbox.org>
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

On Fri, Apr 10, 2026 at 11:31:36AM +0800, Shuwei Wu wrote:
> Document the SpacemiT K1 Thermal Sensor, which supports
> monitoring temperatures for five zones: soc, package, gpu, cluster0,
> and cluster1.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
> Tested-by: Gong Shuai <gsh517025@gmail.com>

No, not possible. Otherwise explain me how your device tested a YAML
file.

Drop all of such tags.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
