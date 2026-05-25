Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A85FCD5BD0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnFYaGfBFJ+DPbXQ3ZMIBEssZ2gyy9t0D7EJoAwpYA4=; b=PThM7DAwbuhZ4o
	DxX8nozhWQTpy5slkulxAXpIeeQ6afIvm3+F96TyQDkiRS99lSUnYZ05hHVdn7FAn/xQeU1Q5Vhoe
	72seaCpIu0Rm1nzBfv3CwEcjVFSnW9mzkXw16bIJBjh7XHIyg2uc0KCVpBkcm2P+igv+UZgon0v1J
	cDzs0nUSeAmEgkn8E166mlpWEGf0rltijhz6xNZWr6h8w2VXdWKDLB5kmrS4dZw1e6iIH5loEoAso
	hI+cWqVaHUdug5mLkeD6/uahS2wXX8H8B96ggfBUELs7bUE9Q67KiE/voajcwksWt05FdxZfMgCbZ
	kZzcNcIuZDdd6hxCIvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUUQ-0000000HCSM-3JE9;
	Mon, 25 May 2026 12:33:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUUN-0000000HCRj-3SxV
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 12:33:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7196441B0;
	Mon, 25 May 2026 12:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F7B1F000E9;
	Mon, 25 May 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779712378;
	bh=pcXHjhTpKtr1K6sv89ixblt4tmYGJwk9oE+oZa0GpaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jdICNlEULNzIr3Rk/p/u+/4YhqCEH/LuU26Nyaho9Acr7ozu2uMrx8ZNlfAgckhtF
	 vYBZZb4nEBxaihsphGkX4UPGeqk6gpvHYn4kn/fSdeaDZUudGdY3rU3N+8CDYU0nY5
	 +7SBY9rorJS8Nfdl/Sw4DFP/jsUQVufREJRwz+kRkxx5wasebV+zHH7Qsqw/RqMCzj
	 x7Pz2iJVGrbVDFNXB0XkWc92wzKbOxfS+yqDMoN3W7uRTTog3y5uJaVyTTyakzNWa9
	 jLlWRjAIwloYBm1Frkraku4hXOxHmjiJh8+qQPxMc0swG5gKjfSR8FXSKWo57y2eHI
	 gb94xowLTdHVw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com
In-Reply-To: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
References: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
Subject: Re: [PATCH v4 0/3] ASoC: add shared BCLK rate constraint for
 cross-DAI coordination
Message-Id: <177970577309.18223.13869981116408028929.b4-ty@b4>
Date: Mon, 25 May 2026 11:42:53 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y62EjQrTI/wSasqd24Qm7vHOI5mLk5aLoaHjk20gWhs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqFEF4pfhTzer6xrAFujII+cjOcHF5tb35E97n0
 85zunBrPBCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahRBeAAKCRAk1otyXVSH
 0O8RB/9u7miaMTfVs5fjqarX6UWjqaL4JDrbNfzhpUFwSXpRq4DkeHyuk/PqW82XZJ55hsSO5g6
 U+jQWfVrlwZ4eLuJL7F9EJxN/LfxVjgMlgJNd6Cm0Zoq5R0OnITTehRHXkCe/aj3hCtmbDexYQn
 IxRutkM7yocacbO8W3yYy7BbFkBDcM2YDgHszoivDsLMVBo+WYSW74vC/O7BzgTPy8jj27lNXsK
 MuSzf7PSK5cH5x5MLbClOgT9UyXOx6EPObnupIuf5oaYpK7Iu644wuSyFYCTz0MPTD+pbdw84+L
 q4SpwcGaRjM4UfwKnaGyev2g68X/avE5/Ls/6maiLWXcW1i3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_053259_904811_C1FA8F38 
X-CRM114-Status: GOOD (  11.63  )
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

On Fri, 22 May 2026 21:33:56 +0800, Troy Mitchell wrote:
> ASoC: add shared BCLK rate constraint for cross-DAI coordination
> 
> On some SoCs (e.g. SpacemiT K3), multiple I2S controllers share the
> same physical BCLK. When one controller is already streaming, the
> others must use hw_params that result in the same BCLK rate, otherwise
> the shared clock would be reconfigured and corrupt the active stream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
      https://git.kernel.org/broonie/sound/c/94bdfad3a665
[2/3] ASoC: soc-pcm: add DEFINE_GUARD for snd_soc_card_mutex
      https://git.kernel.org/broonie/sound/c/2555c62275a1
[3/3] ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK
      https://git.kernel.org/broonie/sound/c/c8c2ffd722a6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
