Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA98C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 18:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsagJbrc+Uk1PfI7sAHL+JGstkTNj0LjSXhouQYyOHA=; b=jJQ39yVxTC3upx
	u3bUJ6n+t+4p9pkSHUpT1yQ7FsiPF/BNACzsdRKnygRTsI1Hs7ryFFSWJoyntIMDx9CTJrmpNgRJ8
	OmBVDILxFbrT6PHbJk4CVzVnTDKH1qS13ydtXm6CkIMx2ikedSWqOQu37tC1BpT0ZkkSeiWW2lv1+
	8/jwE+td56uYuOb+ETZREjSY+9uEwwotNpXdXFjfuKbDk9yNrQlGQUlKm5zxfwjKlAdqELLzOiTlX
	E20W3NgizJ+IIhzy1SPmlvZl9MqE5+mbFIWG8PjJOuLJGZIUv/v7cUuac4VEPhuyKa2mn9DPjZRTR
	8a8OwvfrgoHpDz+YLLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1womFi-000000063G2-0VTk;
	Tue, 28 Jul 2026 18:10:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1womFg-000000063Fw-3xG1
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 18:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2A6C43FE3;
	Tue, 28 Jul 2026 18:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF61F000E9;
	Tue, 28 Jul 2026 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262203;
	bh=7D4ga2nTYroe9KumgB/K/vLYF94YdrzCaz7ws4KjaX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RBPBdytzXFnrhilxhA3xuGiJtul7A7YfGACCxzg0FJTzkto9/bhn1AIydHtnpmZLt
	 csGD/jnXEJuFp41xvN8kR4Lg6d7iUuI+VnU/tUsVgDweOlTwXW2MpLScNENyfl3Mjp
	 teBiJaspzjKLbOCfvn/M+/fQqxKRtPwqL9pErapALPzVRgfTCZW54+FOAlzumF4WXT
	 UlIYnp9wX3t+tFzPCpmjUZvREkrU8vsQ0cquCp3D8Xrly1xqPX5OEGmlWp2PQZOa8q
	 FXDnEx11pBohAT9OLpZF6qdXtSeLMLAKsXrPl+Ocn2lCrmB6ulGohuH5KtvywS8ySp
	 KDU9rkyYmLXaA==
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org,
	Ilya Sorochan <k0tran@altlinux.org>
Cc: conor@kernel.org,
	Conor Dooley <mail@conchuod.ie>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org,
	e@freeshell.de,
	heinrich.schuchardt@canonical.com
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
Date: Tue, 28 Jul 2026 19:02:45 +0100
Message-ID: <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306171939.84568-1-k0tran@altlinux.org>
References: <20260306171939.84568-1-k0tran@altlinux.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=638; i=mail@conchuod.ie; h=from:subject:message-id; bh=wpfuwMxtLYazjXBoDLqpVWtb0tRDw4Q6cCQhVsKkTlo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFkZ7471haoXZneF96k8OJRoUbjk8ILLs+TORUy/5lw/l znDn0+ko5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMxzGT4pzt9rXTYs471Aspz 6lZ7PflxzuX3dO3o2Z+VS5XE/JZ9u8Twz6ruHcMC9/OOK3f/vmh7wCjg3/Q7Sb1z/XdfqLMLcfe t4QAA
X-Developer-Key: i=mail@conchuod.ie; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <mail@conchuod.ie>

On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
> Add bootph-pre-ram to mmc1_pins clk-pins.
> 
> U-Boot pruned their overrides recently in favor of Linux which broke booting
> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
> 
> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
> 
> [...]

Right, I am going to try this again. I don't think there's actually a
valid technical argument against it, since it just affects the stage at
which configuration is applied rather than configuration itself.
If the configuration is wrong, and more devices don't use this configuration
than do, people need to move the node to where they think should be. That
shall be done separately.

I don't want to hear about the politics about whether or not Starfive want
to support it or reverse engineering of binaries etc. All that I care about
is discussion of the hardware itself and which boards need this and which do
not.

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
      https://git.kernel.org/conor/c/42c57c049054

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
