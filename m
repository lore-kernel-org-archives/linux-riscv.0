Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7337FC04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOuLi7ktOiHJs38j9Cs5mUcB4jN+wmgAnC9Z4vQPV+4=; b=T+rcpaPOf9EgLz
	jQ2s4CurO9zqG5tugk3B6upLyM66HKZiMvqlk2tzWZPMzGzZmnHIjPxy8bh9eYBsZN9C1AclgnTML
	3I/qACalGLDlL+KDhomtYq+MMSpHJwfxMNvE2kELRnmcFDzAzsTNQvRHQwYvhOXHLyXyQMQdNgMJz
	98dxx66WC1mELG/eSwdpLVvd0+iXPg1wQMoNKaYTN5v2bhO7IjsgucEyw7Yqzlm4vSnxihm8XDbyx
	HUyaXWE705ha9ZmyqoL3YApfmauXO5kaCzWU4h+0Uu7bYylD65Cj/FyyJuySBXrI3uo2wVf7c6rSY
	CaE50D7cEy4CKkWVyaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZFC-0000000DHTY-1m7N;
	Thu, 02 May 2024 16:25:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZF9-0000000DHRc-0FuO
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6332461BAA;
	Thu,  2 May 2024 16:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCB5C113CC;
	Thu,  2 May 2024 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714667110;
	bh=eVUU9My3Jrjs/UHQZgJr3z5gPt43bz69SadF6dklRZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WNXH3ChPi0Vwe6FxeKPmuAqK9AxeuX4anIvy5ODcU4kxdrgHftCjt8XEsxT5lQjkk
	 T4+yj0txY0H3urWx5R5wJNFbVA/fq9Y1LWt8G/l4o0jGNqJzjWsM81qzZguxjfmAab
	 1ZDFHiN1QsuS/4wN0zD2KjnW5GZB8Cz3uJa8Sh9xsY7p8bl3TAtXbb43gcqbwVOG6+
	 7Sd65ReQrl9+vW668LRvM6GOfHVSvqFLtfRIQXge9SQwwW66V1x+LhZ8EEl+gJbMoh
	 MTAeqe5W9yIOTTVzBSH/Q8TsVi1zIsYfxg92qTUc+05kGap3p2HDsQ1gKsikBYH2RC
	 qCzJSXYnMKOJg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: add pac1934 power-monitor to icicle
Date: Thu,  2 May 2024 17:24:55 +0100
Message-ID: <20240502-wafer-landowner-fd8f7dc290f4@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501-spearman-primary-17df3c21c770@spud>
References: <20240501-spearman-primary-17df3c21c770@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=524; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=d0Yhjtp2Siagwln1k5fEq4fncaZ2UG0U07TBV/HvY+0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnG+8KvB2zWNj4TtDW4QPOhgwBHqOAfuWltwQdnrb95o Gqv9YOejlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzknC/D/7jIh9VtmYz7v9jK FLSWLIjUPmf993Fj15eCpZMPfbumwcvw39e8KMdz+8WlcinrNs/Z0W3lEFUv+TZAdWZEwsZ5J30 UOAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_092511_233965_CBAC5569 
X-CRM114-Status: UNSURE (   8.05  )
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

On Wed, 01 May 2024 16:36:31 +0100, Conor Dooley wrote:
> The binding for this landed in v6.9, add the description. In the
> off-chance that there were people carrying local patches for this based
> on the driver shipped on the Microchip website (or vendor kernel) both
> the binding and sysfs filenames changed during upstreaming.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: microchip: add pac1934 power-monitor to icicle
      https://git.kernel.org/conor/c/8fd63d81a760

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
