Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E83CD5BD5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0YOY+HlcnBlMQjudKxgieukeGvLI4LwxcIsGT6+KY4=; b=yaE9CSX8AHO5MF
	uUgb5MPK4N8Z5FDUPm0bkgUL3mli00mlMc9wCKnOkQp9gswWEZfMTBXRcz5/ZwvnoXjtvcq49v1pr
	2limCJeD43sYPeasHpK0QlcjZaCIx606RzUBBbSKQCF/QuiwWFjWYKWzTMuYCTRhjYrrHsN7LoPP/
	kYrN8Sfo9Xst8NuLQnddB0uYWFeKJShL3STaq5VgatFSAFh7qeh2d8tsqFgJhaxfcGI96RglaDWGv
	wMi/iaumLrYykRvE+MQzJUVjS970pQga38lyTMdmuV6fH5iljV0vS5xlJV9xuwKjMPeLGPgu4igco
	u17EN9HYb5N0RKzI8tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSENC-00000004COf-3KZJ;
	Wed, 27 May 2026 13:32:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSENB-00000004COQ-3KG7
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 13:32:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4195B6024D;
	Wed, 27 May 2026 13:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B691F000E9;
	Wed, 27 May 2026 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888757;
	bh=8rZ1ozjs6tAtUL0I36KxtDshNbmfKww+pEeWkBYDVnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUrRYEBPOf0yBo4VZ8rRK6vJRHA3m5ARnYl+MVTRY0gPvpKKJ2vFREK1U5V7hfJBO
	 EUj9c/HZkN8HIHH78Ibra0e4zhjDGRMr3UxK4wzZSMx2vr/GlFmEP/QUOg9PrE1+37
	 rcwLxORsPaarPXW8/XTWcCpP6WsgOXQMHXCf7hp6eDbN8SZ3+27Eks+q1ioi4z0oFk
	 4c5agNiU2u/jwjKkbhMT2RT4BxWLpvSPK7+vaVOmzGkLFKeDBWQkUeDT/m4znu0D/Q
	 wY6EGIuwmBaI0U3/DxaVlh28XoyNsY+mKbv8bnzE1zqw15k19oiLfC7JiDHevXjUR7
	 /Ynyc2kzhDfgQ==
Date: Wed, 27 May 2026 15:32:30 +0200
From: Drew Fustini <fustini@kernel.org>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: thead: Enable wifi on the BeagleV-Ahead
Message-ID: <ahbybiNqYq0lFZ5w@gen8>
References: <20260514183510.234063-1-thomas.gerner@muenchen-mail.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260514183510.234063-1-thomas.gerner@muenchen-mail.de>
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

On Thu, May 14, 2026 at 08:32:01PM +0200, Thomas Gerner wrote:
> The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
> Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
> driver.
> 
> The AP6203BM is a dual-band 2.4GHz/5GHz Wi-Fi 4 (802.11a/b/g/n) and
> Bluetooth 5.4 module. Bluetooth is not enabled by this patch.
> 
> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
> ---
> Change in v4:
> - follow DTS coding style
> - use generic name for pwrseq node
> 
> Change in v3:
> - consider further issues found by sashiko AI review
> 
> Change in v2:
> - consider issues found by sashiko AI review
> 
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

I have applied this to thead-dt-for-next [1].

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=3a5791956edbfa84d7256224167941931cbc46e7

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
