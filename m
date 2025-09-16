Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC67CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Zw3AYM4cA9hPmNfNL9WQAmuPUdg0IMfwTQ57t0dGec=; b=CANW3zNJNdlv6v
	tV+ieK+evp0flc6M9hePJ9vaouPRDFlieZ8yQJepba0IrSNJ0JCgbmUtpHxJTu057SZpesI6hNv2o
	eygdPfzkrfOnIdh814K53uRI10Vpf7m14Zk1FVB+s5R+A8Fkli/iAMOtHBwpc23PuaMBUFfKnEEq8
	n8jHbpYzkJkQn417UzoKNiB2iCTByKXdS8aHTJTOyc/1uV7QUsC9OTRgbz4yf+GSW0Ygt/mWashCu
	UlLm0aCMI6VAKi0tRrcmy/XWg4arCVkYiimI6xVHN8uW4Eh1tvulHxvpqo0reyRjbAM9kUoOcnq0z
	5KwD0jp7ezufKUZkf1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVs4-00000007xbu-2VWm;
	Tue, 16 Sep 2025 13:37:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVs2-00000007xb5-1Tsq
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAF8344B0F;
	Tue, 16 Sep 2025 13:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62430C4CEEB;
	Tue, 16 Sep 2025 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758029841;
	bh=YEW3a09Zeo99Z0N5BK6GqtsYttsWt77Qxdg0YjLXzmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjisEOPF6AFv8vzhh/+nSyHm2BXKBl1eVs+ZiBzbUv98tukbER3ltymiT/yHUG+Rk
	 HYIS3ZO7sX/Vxa75tff3Jwy3URniNAvzY6uTNmd2brkyCEDgkykNCbLBly0RRQZ5SG
	 yoy1V1c0wg6C5B6xq3SKaytBQHWrxXhOKPvZdK1Rt5aQU4zorAN0OjCplY0iyKX6Ua
	 aR/ShmjtscE9rpD79VXihm53c+x7Mjq4CVvp9iQEIJrXK8nAH4lEJWH21CTCjZOUho
	 MgBrcdDvpUrkDPdSGiAHU6uc0Q2RiUaNVhSzz036g0eX6yaNNphnwOseFsJiQib5ug
	 HsFSrJItUkG7w==
Date: Tue, 16 Sep 2025 08:37:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <jms@tenstorrent.com>, Andy Gross <agross@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: Add SiFive X280 compatible
Message-ID: <175802983980.3653941.6041553285815630800.robh@kernel.org>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-3-ddb0d6860fe5@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250913-tt-bh-dts-v1-3-ddb0d6860fe5@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_063722_410123_972A6F8B 
X-CRM114-Status: UNSURE (   8.33  )
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


On Sat, 13 Sep 2025 14:31:02 -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
> 
> Document compatible for the SiFive X280 RISC-V core.
> 
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
