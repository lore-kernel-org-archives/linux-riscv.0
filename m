Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F4D58E49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 03:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBih81SeFUcza7rcuXaBKcvJwf9Ba1GSxab8BMEu3jw=; b=a5Iz9sxHd75GvY
	XiUGC9pd5Kq+0bFr0IpYpNI0OAmdBk9BvSeQph9UFunSiaM18f2ZSKSLdLk9d6JoY0HAzaT5YcgDh
	XpCRym/tI4lQ83SO2boxp6N/OLuRar9f7GF3T4ujDQv/OVl4Bs6/WWjQpZvTXU2TG0UK8fxU/VVFg
	N3A8VvvFOVeTgAQwlKCZ16aINzdLPVWZOzWuXd1JIWwNS/d4q23wdRlYmGAq6JQ19kohMoNqm6L1z
	pBPNdOlIBV3Qhnxgq097Xv/bVvIJokE9uTRUG5brjBimmW0sX1Re7Chc3I3P46E2OFYGx3dxTXEdK
	OtfYcOQnDpClz03BkI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwtgt-0000000CA8H-3oOV;
	Mon, 02 Mar 2026 03:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwtgs-0000000CA7p-0dx5
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 03:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 445FF41AD7;
	Mon,  2 Mar 2026 03:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45D3C116C6;
	Mon,  2 Mar 2026 03:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772421084;
	bh=VjD7I6E51OlHu+EsXmHswCKFpLlZJ2k8SacV21baGj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLzWJvEp+AsKTb/UTc21L5WWH2u6BnxdVzfPNPB6vCOFfACHY5pn027oR8sUZvJVH
	 72gRdItmVnDO6fW1pZPMTpsvzUYiHZ5V/PFCw7AX1rMRDRBeUziPxRfQsy9rlsFn09
	 5a4WajbsGVllB3hhij+OazilLVOHTA4FoRPJKP67X4iwGIbJU8ULnYbPvlWEHSHUHE
	 Ka/WGeJxAVnntcNl+HOEus6JJKrl0GJ+h8urDbKgf8gs71/KjTy+y0AAxJ4/1k5bRU
	 uSPQGQiCfkTbYRoz5k7UODX2/DvfuYZ8LfaL5uQIZKH6p78l4+r9qjtUWThwOn07Uo
	 S2yS44FiPBDfA==
From: Yixun Lan <dlan@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/3] regulator: spacemit-p1: Support board power tree via DT properties
Date: Mon,  2 Mar 2026 03:11:15 +0000
Message-ID: <177242105514.25569.9323033923721110918.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_191126_209486_EE8DD6BB 
X-CRM114-Status: UNSURE (   8.50  )
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


On Fri, 06 Feb 2026 10:32:01 +0800, Guodong Xu wrote:
> The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
> applied to regulator.git for-next, so is no longer part of this series.
> 
> Patch 1, 2 and 3 (previously 2-4) enable flexible power tree
> configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
> are replaced with explicit devicetree properties. PMIC supply connections
> are board-design decisions. Moving this to DT allows supporting varied
> topologies without driver modifications.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter
      https://github.com/spacemit-com/linux/commit/108c77b34b929e6bdb7ac9613ed65c90da8bcb9f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
