Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC0AEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjwhKhH5V7d2xRaTCXJqxjQddhm8YYLs0Sf/vHYCV9M=; b=jzpRKL0e1z10k7
	+KIKFUdRphepbjat+WXhdRUNJfNGH+UWag9UrZ8XZ6QvxpODwB1JoxbprW4JL8cslH/ozmljYC2PV
	PS/ctifem2Ma4HlBapcmq0U7aDQc3ZmcvK2J1AhUqX/KhAKboPSUgXzXUp3QtzkG2eu8abDZaAFSY
	qhw1pNNZZKS2UefQ4LXCnwZ8rzxYkH21NG8jo9WLWwdN76u3FnDA98UBNHzyV9kXZCOI3Wut3W9vG
	8gFRWbsnNHSzPF7dCUVde76Vlfnd4rRmGYM8CLXbjScALei/Zzr2XUbqh6ALncFXEWj/VG5qXAqcK
	stSV50gOCOSygD6vHF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCMoX-001Bfm-0S;
	Thu, 22 Jun 2023 16:05:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCMoT-001Beu-36
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 16:05:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4085D617B0;
	Thu, 22 Jun 2023 16:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1C2C433C0;
	Thu, 22 Jun 2023 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687449936;
	bh=bGJb9KPE/IV5Zd0tYxLR111YS0I3sKW4PtkFyur9DhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NK+6eHe6L0L78Be5H7fn6sxPDPJxrKDLa5hhBBnztQveeFbY85pf9ba7T8MC6vnz0
	 ofnDVwhZsDmiZSaqSxWcFEvD+hAPRTfZSuBzoWSBqy7nZxJwHEMI5+ohtZ8XrFLGrw
	 6kpn3szDoaZMcx1AjZbT6mz920Q58FM6WxqcBa1pCx0JjAQ7gd0kd7lc5sedFM83Pp
	 /Yk4N7Afi++erylzhEfhNzLV3hjXtIcmvE1Kh1qibrLdoE9xjIFhaSyNcklvzBX8Sy
	 O6Np9qWFlvc1eNDVvuUkVk3GmoRy5rHzOj2pf+6ulgpbCTrLv7zm3r1/m/6de+QbrV
	 nn0cnWO6ibKAw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
Date: Thu, 22 Jun 2023 17:05:18 +0100
Message-Id: <20230622-silk-evolve-368ad6a8dc17@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621-panorama-stuffing-f24b26546972@spud>
References: <20230621-panorama-stuffing-f24b26546972@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=603; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5ZUX8qXS96tw03nhohzbJCyJS9nal0fl1eIDx0o01AY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClTCq37Ftyc0mL6trLB98kcDvXLG+LaLoerTK+c97z87 52H2qqFHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiImg4jw3xZM5aHOaGW7o0v Duw33CrUHLxTpWyBcb7l5Z45Ccc0VRgZViX7zOBoYyrQNGkMXdT9+GlF+J9Ok69Syr+t+AqO3mJ hAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_090538_066569_D01DB9D5 
X-CRM114-Status: UNSURE (   6.95  )
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

On Wed, 21 Jun 2023 20:00:31 +0100, Conor Dooley wrote:
> Randy reported build errors in linux-next where XIP_KERNEL was enabled.
> ARCH_THEAD requires alternatives to support the non-standard ISA
> extensions used by the THEAD cores, which are mutually exclusive with
> XIP kernels. Clone the dependency list from the Allwinner entry, since
> Allwinner's D1 uses T-Head cores with the same non-standard extensions.
> 
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
      https://git.kernel.org/conor/c/273235194e4d

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
