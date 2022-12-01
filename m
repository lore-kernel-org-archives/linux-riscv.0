Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64476C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVchRg2SkEJ6zCOtRmJQiol6BgYiS2szWCBcSHftsRA=; b=KAGbMU6qiDYGn2
	Gl9YXUq3wOOgKol+/8537mFn/5LQ2Gd64muk1vTyDzXhYKW+s4jjOV6PNS98DpbMvY2NIt+tR30YJ
	UNX1xMa/ZO5XrJrYmoflx5K/aOJnxdCkcqcxYMgvwKlherqCY0dfFE5wM+zzaJeexR+PSkRgEaHV+
	fYmGv0svtf4hv6MDIbpzBheoCkaaRlD6GB+KOoaL8zyVhDUq52sPatMlHqSqdlmV99u9DvZm27f70
	aGQnDE864w6igRkpny3+1UPT0jIGr6r4IOu3JPyHWePIzBQNvAORmlQZTJbzKTVi4lyxDUo1pH2Ek
	PZmCdmOF7J2XIMCwA0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tJk-00BrLe-Ok; Thu, 01 Dec 2022 23:50:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0t6S-00Bk31-Kf
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 23:36:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 35F6BB8205B;
	Thu,  1 Dec 2022 23:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511E5C433D6;
	Thu,  1 Dec 2022 23:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669937785;
	bh=VqnsrWM0Vo9n3c7N8+McUIw2HirTpnKJAftxv+kRgs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLy9Z3Y4Km1xs94oZ2ESTUJXcVCpjQk8O3w1yvHQQsuFACf30OnlEH9hGh6HWlhkx
	 UVkv7qlRYsO77M1GGSe3YCmG2q6euMuUqYKGAq6UtOP4m5Hx1dSiv1uB8TQdZ18XqR
	 09SlcnDMTWH7DRJWZH70c5Zu5jtGOkOY6FNl27qskx1smSN4fM+8901gVceMiXXg+w
	 Gqrv72aSDc+M23KE7kZIuCbED6gNxafnowUJW+9atlo2frZ/9gXywYPeEKgXXZiT7/
	 +vfvvIWS2ThLlzK0iKVHceIUnMYdk8Mrvkona/TsJu23WXI9kMaZEmdNkMTSbidpVq
	 CokV6334wg6Hw==
Date: Thu, 1 Dec 2022 23:36:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, palmer@dabbelt.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
Message-ID: <Y4k6ct+iA4j0NZgR@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_153628_860319_E354996D 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi Prabhakar,

I'm going to mark this series as "Changes Requested" in patchwork since
there's been quite a lot of commentary and it looks like Samuel & Heiko
have both suggested some changes.
Scream if you think that's not appropriate :)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
