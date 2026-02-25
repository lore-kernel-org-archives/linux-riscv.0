Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7A4FCEE86
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yuwEMW+MuMHctLIZxm4XPqFY11BWXk6dyoH1NTcH7I=; b=a72JsR61umtPGu
	sbHy3vaZueXL5S03RbqHDfqMpuzcTvgrZeN9g1QCN4ids+bBdzr+b/JrEbdAz9TxgQKsXdZdr4XjI
	w0/3J8oupb8TQZtx5EUtdtWWwl7OAkjBK35M2SzRdJwkog3tDlRysA9OOXqEZ+qnkWyf2DQsyuF+e
	RJB/mctQz0LAVG6X5PZzlp+McJFuRYSWI4ITUkYHnJEupf6I25T0Pgl8YkBUQ0G1qe4gVMY5Pk/yT
	NkdAhPOKPj03XoTDWVv2AWlFXC38HYGptduv2jHN8QiZHYryIHTw1xsrbqVpwVZgQpggAaP04oLVj
	pER8fag/ugzwRu6+nDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvD09-00000003uDr-4BH5;
	Wed, 25 Feb 2026 11:24:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvD07-00000003uDR-4Bbr
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 11:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 481F344056;
	Wed, 25 Feb 2026 11:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E602C19423;
	Wed, 25 Feb 2026 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018659;
	bh=mWAOa2Ep2Ez6ZEQGoQgZ/mO6Dbm5GWbW6wlc1/rnqYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pkiNzdh4i3pYqn3YgxJfAcdpYDiClD2dq1EsaazuRHFNg6Rx1tnWrw+H3mVLpjGyf
	 YipqqWM0jRWxnqfgRCrgKgp+R3bHzPDJm+F3dVJlolGnyM4ysI9unZ1rmk3fa8CpT/
	 1BUnhe8XNVmvPBYBUBRYeu0Z0Pyqn46Yj3D7mltxHCUiJfA3DWYmPP6m1ckdicBsSh
	 cqJAl9H2avs9CgSvfDF9MR4MCHMFWz6guPK0TZK5pnFlTF1chukcF0V5t1wzLypmAm
	 zX3GjZwpWRrQPQn2Xk56AtOiXeg6c2a6XJ2kOIbRMN4Br7E5d71f3PEHuCLqCE74xz
	 Y0/5Jkzu0Dqfw==
From: Vinod Koul <vkoul@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>
In-Reply-To: <20260120013706.436742-1-inochiama@gmail.com>
References: <20260120013706.436742-1-inochiama@gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] riscv: sophgo: allow DMA multiplexer
 set channel number for DMA controller
Message-Id: <177201865381.93331.6104381063514168222.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 16:54:13 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_032420_083722_0FF541AD 
X-CRM114-Status: UNSURE (   7.75  )
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


On Tue, 20 Jan 2026 09:37:02 +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
      commit: 5eda5f42d2fee87127b568206a9fcc07a2f6eab6
[2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
      commit: 02a380ea7ed2d737a42693d7957ec8c33a92d9fd

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
