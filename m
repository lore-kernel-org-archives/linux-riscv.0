Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF0FB3D18
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OOmNcaus7r2wUGcOcIsTSmQdeW2pN3OA+chk0FehyA=; b=W7/u7XKRmxGmya
	Z/FxIV3uUDosnHHjeg41eJ3gpHbhj0FZRNDifNdc0oI+L4TFw+XlKykbHBrIuGkDk9hvPUloc77hs
	9rR56kYRAJOpwbGAnFcGor+okFMrmq11q8ifA9RHDxhxuqABwiYFeY77cokEHZIIYW+ED0krZZdjJ
	iUgOgAJDCVuFLWzEQZqnBo8sTHe9gdwEd3jt2/UAAoyHcHCuQT4zMEz4PdXDVVQPpp9HlGIb5tMQH
	z/RDRYRXKl7TyRDOMjNWRHIWN/aEy3iVO5bFT9sC+hU0lRnt6bPrzHWfZeddD7mzf2O5xpjyCVJlQ
	eBg4hHAINQ+oOQsMTHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7A2s-0000000B5Jz-4592;
	Mon, 30 Mar 2026 10:40:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7A2q-0000000B5Je-0TuT
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD0D042DEA;
	Mon, 30 Mar 2026 10:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10133C2BCB2;
	Mon, 30 Mar 2026 10:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774867231;
	bh=WI4ukfgrdJ8n+H+kW01DlgPU2gCxoy2XvlEt4tloRJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRFokuwRfN3G/akBM9G6Qm4KOBYQp+oriDOqFDZZcjdjKdkkXBAmQUSC/7VqVO/jh
	 6rocVehmkfTyKqpjzsAqPml4PPbCVFC1LrfP1vNzApCMfxU26qyevggNmL2jiJypQI
	 2pGWPNYob4qGdUrF1yclTua/kTvBLYSFggVLt3WJGlnCPb3eEDeEljt1J+nNUcL29L
	 hRbJhCBjqhWgrfqI6S0rtuuAooJzgsbjVZkTOS7765cJu1ZHqgj727oPMHVFjetDJz
	 zRBEMf3N1SMMjSGnJDPI3ULCG42hIeb7jlmcxtRN+By3mqsZFZKVLVd4Fa/XRn91sJ
	 8sUVG9wHCpelA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Date: Mon, 30 Mar 2026 10:40:26 +0000
Message-ID: <177486715861.1896649.7165378709637841817.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-02-k3-i2c-v2-1-9c6b374470c6@kernel.org>
References: <20260327-02-k3-i2c-v2-1-9c6b374470c6@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_034032_193797_A1FCE78A 
X-CRM114-Status: UNSURE (   5.33  )
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


On Fri, 27 Mar 2026 11:51:18 +0000, Yixun Lan wrote:
> Add the P1 PMIC's regulator topology tree for pico-itx board.
> 
> 

Applied, thanks!

[1/1] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
      https://github.com/spacemit-com/linux/commit/af62a095eb0c3359d477b55ef72d2afd94c83c8f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
