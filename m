Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB27C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 17:11:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C0623B04
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C0623B04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rGYzJbfP8jrPKbeqUJOJPl1bmPTVbD9VkgoNqIF2DGk=; b=ym9F+CwsLapqYjiAad/cVaUZk
	31ubJUzfTdZjap6KechhZnpTHsU+RjQSHhn4kY665fqZk2f44rbGl9fyoI6+n3oVQaC96gS3StDfW
	/VZt7V+cz/jDKnG6kxEpv2qMHbypu2XTUojvqwnczwXpZM5gByLMMtVsh/qf0eSyxvQdq3QISnZPm
	1mXO406rBsaZX19uSDLcU679HIhvJGtQkDv/+waM1uNWhq0ve0vfZYlIO2GHmw6750ms1Sx6MDnkp
	gvIxk5rMFOI75NW3VNNN3LBpQgvKIPVM+hws1Rta0NZk0rpNNM2y6UgG/3pzsaQn+MipAb9yfrZYw
	G4cuC165w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmgWi-0002iE-0u; Tue, 08 Dec 2020 17:11:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmgWf-0002hT-S2
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 17:11:46 +0000
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yash Shah <yash.shah@sifive.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
Subject: Re: (subset) [PATCH v2 0/9] arch: riscv: add board and SoC DT file
 support
Message-Id: <160744749760.30021.12384107049854621023.b4-ty@kernel.org>
Date: Tue, 08 Dec 2020 17:11:37 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_121145_997842_FAA8B2B3 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, linus.walleij@linaro.org, paul.walmsley@sifive.com,
 robh+dt@kernel.org, bgolaszewski@baylibre.com, thierry.reding@gmail.com,
 palmer@dabbelt.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 8 Dec 2020 10:25:32 +0530, Yash Shah wrote:
> Start board support by adding initial support for the SiFive FU740 SoC
> and the first development board that uses it, the SiFive HiFive
> Unmatched A00.
> 
> Boot-tested on Linux 5.10-rc4 on a HiFive Unmatched A00 board using the
> U-boot and OpenSBI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/9] dt-bindings: spi: Update DT binding docs to support SiFive FU740 SoC
      commit: 76347344c522da78be29403dda81463ffae2bc99

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
