Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA55C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZMp/2ljDYogfe6dzXYgiBDKaHM/vaddghLaIDqKeV4=; b=qABE9uiPwwo9Hm
	7h3jaXB+gc+LC3KfoLkuyWCOYkBWhZTUBvZNVLJd70tVyfEd6WmVAjRHjFfqMdryRThDMfry8bnHT
	fVGOw5s1o1j8FHZBSdnZ4+KflE7Qck5pvxIOzTQg/XydYGjjMx1ikhbMwfOGmGF+m41ZttmNtyZMo
	58NMOyP/s4Vx6TYvVDISdSJm8/japnz2VIKZTk4/obIuik9k1cK0zyxSOZvsYjXbpcm7CgeklMSCF
	ysKZBI7vZJN8q8sfqkyDhvDkyEyGN7SiDqVI/IgMm1liPHY/NQvgDPstUfEk1XPiHcYzL7YkjVp6W
	+2rVIS4jqrAx6wFELODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5llU-001eib-20;
	Wed, 22 Nov 2023 11:51:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5llR-001efX-1j
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 260F9B8269C;
	Wed, 22 Nov 2023 11:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1869C433C7;
	Wed, 22 Nov 2023 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700653887;
	bh=m43drHXqcgBGQSr49HbXEUB8692aCABtdbfAIv8Lw4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bkMC/TAcG2mo6eTLcfuIGqWZXXSVTHu60Rxxif/4VrS7AEZPoUpOkgR0atrtvgS79
	 ThJN+YRqHKbADLTeLtDgINkTJvo/923ExOwLYm6lbNFPS4qOBHYonRJkyREsDvfGOZ
	 ebHGpaqk9V8/oydGW5u/nbp55SMw0PVb9G0+TleTaANnbRhE4sRRBqmUJ+28to5bg0
	 kxafyHaHCeoBVv99qYiFDjRqSOBcdFeCNDNXr+KXvpYMljRAS6F6D44iZN5rYFrf77
	 ZXY7yPkLkbmqF/ACdWIcazCjACWlDPAd4bBTFeihsi5N3wNHDsEWUB4xVREGP7L7qA
	 Z4FEA4FABXAWQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: sifive: shunt ccache driver to drivers/cache
Date: Wed, 22 Nov 2023 11:50:48 +0000
Message-Id: <20231122-crucial-umbilical-1e7f08c9c4f9@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012-mooing-refined-ad1ab421c0d3@spud>
References: <20231012-mooing-refined-ad1ab421c0d3@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=391; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CVsonUKAfn2TbOpnWsQF3eZnPZymVybzFLXKZlGamhE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmxr0VtWD9VbatoXHlep67t5AK7km+b/jMd+WJc++Xeu 6jL5fLrO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRE8kM/4sE7GOE5y4sZtnf sVo85vrM3epTfEKmxZ/5n73fS/3XdgVGhk1Ly7a1mhzU3v9+utvt2F8rb/NN2CQiu1VHkTH94eZ 5L/kB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_035129_720663_C7E424F3 
X-CRM114-Status: UNSURE (   6.53  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 12 Oct 2023 10:22:09 +0100, Conor Dooley wrote:
> Move the ccache driver over to drivers/cache, out of the drivers/soc
> dumping ground, to this new collection point for cache controller
> drivers.
> 
> 

[1/1] soc: sifive: shunt ccache driver to drivers/cache
      https://git.kernel.org/conor/c/971f128bb2d9

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
