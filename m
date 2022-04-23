Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F30C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHLH4LyrhBoaHPBXhlB81k/TGVIZ7NFGR5XSmbnwH6s=; b=GXY01CP/00vDXh
	GyJY6QjRLdsDrCLrQkZwBJ0UctI06CWmj3kyfdoeDi5Q/6w9Ud9kh4HzSbgoRyAV7v5RrhLKFoj3J
	WEhBPTW1Qf62agtSkcpejQwWHiYlHpQqQzBVBybIuIOZp6ELsDlNKbL8+vQ6hFvbujh34e+pOMELT
	ZI6bBwC0WjPZOgIABMiaZ1jVqy6f9hJmtvl1BbTzd/hhQ8sQ7VCzRMeHF6Hr3rLcj7suNKYKNtO+Y
	IjBN7JpIHdJDlfF3UzkTTtbgaqqXE84hFNmNDm91aUHASBvmZGRk2oe7gNm2HF0UVQnqMz9spkJIH
	gTIrnUHFwn//hqzy3YMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4mV-003Agh-0w; Sat, 23 Apr 2022 01:41:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4mS-003Adi-7d
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:41:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDC19B83358;
 Sat, 23 Apr 2022 01:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D9CC385A9;
 Sat, 23 Apr 2022 01:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678105;
 bh=HtIN2BVfzna323NNeNCgrDBsHHLe1CJQr55YPNJbJ1E=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fMeJVp3Th6wsfef4vii1FxRP1mSvgTInUIPvoYqBMn9ZL6XoDy9SMAsrKCHhJWXnM
 Z2HnF2WKjerCZxrw1a/ZhxW/hsO7J0BppgNdIHr9cQnH4bidw4lY6x+JWG9SbEEs+g
 m2sC9u1Edy7ojd+r6Vo7xuhStYzsteokkWO1LPfe6yjfaq+QfMk9E5JncmoxYOILFS
 vu3OucaJkRep0juvUJ1T8DhtCRPVrHaGjkioekoNeflO0KOeE1PEzYz7F7obRwn2fa
 0V6YPrijProHku///rpmqiQwcxMfHL+J0TxkZ/xM2LDP+IicbkvpoVYYuYepp8lk9l
 AXzz9T5QaQSAg==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-7-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-7-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: rtc: add refclk to mpfs-rtc
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:41:43 -0700
User-Agent: alot/0.10
Message-Id: <20220423014145.A1D9CC385A9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184148_439940_8FA66C4D 
X-CRM114-Status: UNSURE (   7.07  )
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

Quoting Conor Dooley (2022-04-13 00:58:33)
> The rtc on PolarFire SoC does not use the AHB clock as its reference
> frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
> this second clock to the binding as a required property.
> 
> Fixes: 4cbcc0d7b397 ("dt-bindings: rtc: add bindings for microchip mpfs rtc")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
