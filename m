Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8786DC4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=MTgl10zQCIuaKg
	iCk+3E01L4WLXAgRemtMrSqgaehW+xCPUce9WbfJ2y7osNT0nI/uJ02YM2oAonbA80E+cEymgde1H
	uXNWUQgNgWHD/eQJ8DaCBEdntqRhMuqS+AY3YtBECSb8/VIzbOhxxb2rvF6QyrSudvtG5+XS7AbEr
	p/FKQT+xNpHxxEg3QfEhNtAHzfA5g/P4M2Pw05FMQNaBwkDBraolEDtrOPJ8ugr6p+nk4cJpY/rhh
	uD2GU/q8V5k5cDkC+VxkiCdOkhg1Fe1EC00vj+0IGhIsA4f6Ctzn2D7n0i2Wx7YfEs2izQhsA+ycK
	WNTK5SQO0cU+ppCSqAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxuY-0079RY-DA; Sat, 26 Nov 2022 16:20:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxuO-0079OM-18; Sat, 26 Nov 2022 16:20:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A057D601B6;
	Sat, 26 Nov 2022 16:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94918C433C1;
	Sat, 26 Nov 2022 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669479602;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4rmnDeoBOWHs9hWyzS0FSHqTBa3TsMxY8h7MukCYnlphmOgmMQovDRNlPvjO24EQ
	 GeVDLyZMWr+mdU0kfzt99/1uEIQB2Hae0wnNQsb1tXb0EyXbQbFKDkS5Nm2N6zqlE4
	 7iaaL3oqSKVOO7lkUuxVcQJZzgYMQ87O/kkSDOl4OXf5ZNz9XPsWYTUxeVXbsDlA7N
	 +CcLtmXyWQK2rN2C94BCkDXMoQIFlAo4TA9xo0T+sYZUm7t+xevmDyl7BUauTtaiBT
	 FAdM8YRZoLHZiKUxUArKxnLfo5AWPpo8pV2XYKAGJkLpQbU8vTK5B/EyL0pEH+WIzq
	 ESYOzFjD1WrYA==
Date: Sat, 26 Nov 2022 16:19:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 06/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Message-ID: <Y4I8q2dMxnnPdCbl@spud>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-7-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125234656.47306-7-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_082004_134132_CD5DC58B 
X-CRM114-Status: UNSURE (   7.20  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
