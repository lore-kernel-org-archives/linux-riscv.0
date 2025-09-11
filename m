Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E29CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuyXWm5ZWRDG6kB+LaFOpGuC7kZIKxEwz8auePgF9oQ=; b=ZoCuTbeTgzFNlX
	suyrIkX3MKISRUC58dspHcUJaiMXf6wADHur90ovQxllS/38IJdm9ZSz0oS8AeAwZuiZt7B8CVrJV
	r4eUadCPx/2qYZyQL2RipZthW5auLd21+6LCrJQUXpTUD9tvQoFGzOYT0wd/nJarukG7cxpC3ODDn
	YxHzIJZ2Znhz5vxVwU+IQfwP9yNqbNqtEIyMoR0Lh9U0nFRAD6Ub93uG+8Xkcok7i00jvmCSQ4B01
	1fWcbPIMmKrc6qlc2JbWDRPdsH4eppxKiC6G7Og2ZEzNBkiqyDTP88Y86oKuJV2nWMys0HHlFgrPC
	Xr2QJt6VTOpbSeg7/Pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbh8-00000001TCu-1pPa;
	Thu, 11 Sep 2025 07:26:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbh6-00000001TCJ-2bhD
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 07:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51EF240281;
	Thu, 11 Sep 2025 07:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA56C4CEF1;
	Thu, 11 Sep 2025 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757575572;
	bh=CmezHyB1HkJJeJ1CoSh2IlnsvQ1nyPiZtOoD1baW30A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ga4iNlc3m/a0A/uuqP82l5CqNf3d1laV3smTHtuMkZq+qHJA0/Mbnjr3EfNLZS2Uc
	 9RAyaaXO6SJXyM5ai+DFUFNKcTJbUTEzXo0jHun5vnr5C21B7giTi5o/kr0FMG9qIu
	 hh9Rp9YVkksg+RW+Khk1IirfwdYi/CY8jhFLexNamb2qwuxwDj7oaTDXTq2q9i/kYA
	 s7teDS2/NIdkIciIcbmyWuO2P+M1D/ZNA41lbt/vDZpUPum1KXfiocTGL3OjyKjfRN
	 R8nxrEGRoR8UrER5JIZcHuhj89z90x4DZ9UCpby3HmFFjrcSIR3J2+8vyyLsFByXuG
	 KPMhJmpD7rxVQ==
Date: Thu, 11 Sep 2025 09:26:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
Message-ID: <20250911-thundering-wildebeest-of-awe-eddf22@kuoka>
References: <20250911-k1-i2s-v3-0-57f173732f9c@linux.spacemit.com>
 <20250911-k1-i2s-v3-1-57f173732f9c@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250911-k1-i2s-v3-1-57f173732f9c@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_002612_682356_646E0E76 
X-CRM114-Status: UNSURE (   8.28  )
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

On Thu, Sep 11, 2025 at 01:47:10PM +0800, Troy Mitchell wrote:
> Add dt-binding for the i2s driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
