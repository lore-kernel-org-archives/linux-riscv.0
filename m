Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADB2F532D4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpomb7P2kETuicbslEXaxnMOQWgVX+sDaj9taD7JSCY=; b=yzYu2B+imwM2Vt
	4yVXCFrT+RTS24ztrRPsf3FamakWNRHcZ5gvWA2gbfFK0Gqncc5Oe+TuQUULz4b7KlXCm+FbZ4Maf
	RzNN4zLFtBnOtLIMscSNG6HQpVkORmzO5fNYenpPskdvuTGOYRW3hbbOxvn+Rj5DnQcZxND8WGHpK
	mf0tREKUG/1hrVkslG+FhigKf90p1wuxUPkayGfnxWlUFOo9CtmYy77MtuXoArcxw9U+Emqifx7J/
	rVGNkYNIJ4dLdqx8g4h16CPbc4f44uV0jtRsUFKpZJIGu/ClieTjn/XKHxgiGGPD5+vSHCsy+ETct
	iJxpJPSG3fRn83tBV/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vQ3-00000000lqK-1frg;
	Tue, 24 Mar 2026 06:39:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vQ1-00000000lq0-3PSU
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC3A8600AC;
	Tue, 24 Mar 2026 06:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE645C19424;
	Tue, 24 Mar 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774334352;
	bh=iGOx98UP1vpKG7YZd8YE9BQwS0A7jTMzxUvXgeGAHSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MIYAFh2g2nIzaNuvfWL9VyTrtDpxmGBSHkZhSvtgc+x75Fglabmstk1493Y4Z663v
	 LQtXlwI4E7l98/786lVYUJJzg7G5dO0Zq2oFBEVBTfQ9JNM83h0gWzw1JRbXp3ML6V
	 iazVL0QdPBYBlwL2M9Hr4VwFpnyZvJvb7hMN38yDruQvIK63NuTSwUIpj+v8owHEtk
	 Lb22TfPqBTuAm0NfBgP6xARy/CUduJRtlJm94WbwUXw6P31GKjuGU6Vib+vY5OdGjQ
	 oluiuJOpxlgcitfDyO1rjuzS8lIrO3xKC4FzMIMvj6W4fM57Sgs4Hz6ENFRxnkof3n
	 YDu7B7fqbcsBg==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: reorder phy nodes for K1
Date: Tue, 24 Mar 2026 06:39:02 +0000
Message-ID: <177433411962.241042.5017156711988723087.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
References: <20260318100000.3934516-1-amadeus@jmu.edu.cn>
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


On Wed, 18 Mar 2026 18:00:00 +0800, Chukun Pan wrote:
> Reorder the PHY nodes of USB and PCIe to the correct positions based on
> the register address. This improves the readability and maintainability
> of the DT. No functional change is introduced by this reordering.
> 
> 

Applied, thanks!

[1/1] riscv: dts: spacemit: reorder phy nodes for K1
      https://github.com/spacemit-com/linux/commit/eac600d5cc42b04e799fb65169b8f4060773381b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
