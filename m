Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC695109B462
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dJ1KEdrAGrZv9tjNtv3bel2xrP+PObrFdo9JQFzQrY=; b=XyWBUtj7Ts9Ox7
	Hzv7f7+OL+xuVslBn1dfpJtFb+nAalu/gwj5f/ZDVhO8yhIJQr/nfp6XcNkjzQxfpeftd6+B/qMfk
	6QhuAu8Lxa4U2K+xE2UYRY/JrAD9JTadvLyNOAku7vUm5y6JCUik3e9+j9XKxmjxR7g4OIjvCnmaj
	DgYdCm9jNAWSpeaRBPJw5o8UaF9SiuQCDmosGeibqCh1i0DM2MzIpWnK+tTFbLCicq3Sj1sL1U9OR
	NzH60dkZyNBoVjF45C2iMTxPuidiitlPN0pYvhNVZinfIhPd+KE0H1pH/wu7yks0bBFSdNuK5GDtE
	Kt6bWn+2lc8RHe1PK89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YwP-0000000CzLo-12d4;
	Tue, 31 Mar 2026 13:15:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YwM-0000000CzLU-0lLf
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 13:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 734DC40955;
	Tue, 31 Mar 2026 13:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF33C19423;
	Tue, 31 Mar 2026 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774962929;
	bh=N9U9Gngl2zsYLg9hbnhmxsUnpHqzZ9ArTNxcIheBEMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d0/Mp2KD1+SHhoVMmrPN7U0nPS3F0FXhLKOS51MQIBpNEs56cUwq+TeQEtmlygyQ+
	 DJ3zr2CpPvwUmg0UCIqwuG+HfsTk4+GzxclYkcPVpZMJc5bexA/1AU2MzFoayWqrD3
	 qCzf8WTfD7Ruzgwp6x3AZcfTOkMI5Y116/bZK6KmdDK5rcLz4vDACGjymqnw8yIhlP
	 feN1Qot7CeMRe0BcM+wTI6QPuBQ1XYjvEvNnuQO/ZAC/t3sGoiwXCYJn7URmQR8OUK
	 71OMK1JEAzkD+pACUks2m+NvWKTsL0xiL3NzTSqBrkH9uajFshQKTIFLvymSDsBrvU
	 lN3vEKEBLDHog==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Tue, 31 Mar 2026 14:14:45 +0100
Message-ID: <20260331-dominion-conjoined-c87ec5bc7db2@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=La/xA4DusqX4r/5LF/aVUUmPtgQGBCIF7OcFbPPMG+Q=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmnTxw5+OC3SizjVmlzhoLCtucfPfkFH//arGZYeIo31 mbLsUCvjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk+hmG/8m2+VuqLtxNOVF3 UFnw4EzGrYZGZpktV6frTLty/eLaqTcY/gedUD/iOK21dPvmzM962q0Cb4O0wqbtlen4GJW8oen hHkYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_061530_249668_D2FCF5A1 
X-CRM114-Status: UNSURE (   7.38  )
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

On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v3 with an extra patch updating the gpio binding from fished
> out from my old branch, fixing the examples and setting the permitted
> values of gpios for the controllers on polarfire soc and the existing
> binding patch's example fixed.
> 
> [...]

Gonna interpret the ack and lack of response to me asking if the gpio
change was mine to take as it being the case.
Applied to riscv-soc-for-next, thanks!

[2/5] gpio: mpfs: Add interrupt support
      https://git.kernel.org/conor/c/e57b53f0f36a
[3/5] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
      https://git.kernel.org/conor/c/5f3575cc73dc
[4/5] soc: microchip: add mpfs gpio interrupt mux driver
      https://git.kernel.org/conor/c/bd34cdd6d214

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
