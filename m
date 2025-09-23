Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD5CAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GcrD8XqBOrCcvHcQ6uS9/yYfN66dffIwkWqoUtWDb0=; b=HPeTxjDk92etxf
	nxSFNS6voZ2klpK6XgQwOk6U+wMuX1zx98pJyGF5ojSg0G6Z3dvla6oFZYxcMM0TxJvCJrx8O+/AL
	EdwprHojWWU6aRc9m7Xl7IqdWwk4RKohOBkrcRmeFkmKK0jd7YDeWpNt0JggYEdyhwdfR/izfSmus
	hDpLrftd7oB31+5r379k15CL5qG1dRZRvaj1jCFqR0tkDsU5wocuG6dqyfjoh5cIleWxshuDac7fc
	F0Q22/qxyoL89QxdiGsdjfcu5Dj2O9+recFDGhe3hUxBdbcvqdSwhBUDif4wiHHjodQFlTM+VM/zo
	iYvfFHPTohohe2tTh3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v195J-0000000EiLh-3561;
	Tue, 23 Sep 2025 19:53:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v195G-0000000EiLK-3zS2
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bL/H
	Qu99e0loUqX4/EAdPey3KBU4E0QmfqrUkhK6tZA=; b=HZe8WrQsacmJfb75TrUq
	9RzTsUMPFrYqllnHCrRudUXiw47TScoCmWpbbC2sHzbHK4r6yzE95dEyryT/970j
	B0YclNHdrVfQYK8GD1x7MqpOECIXS5X8xRYrVLvqTTFLHHD1tAsD6Or8LgPslhQG
	UmBlq20NUU/7QbcAG/Gkoyt+ca76wo+G/9Sa8aM66oDim9XPUEISvVZF490nUdcq
	kqpEAIDNkbN7I/ii6DRIkjL7N1YkdUUuSPAgPFTN0UM35a1oWhlrQsZgETYT7Rt6
	QpCqfx4zLu8LyAX2NrMrHiXJD+ixyQaB3pQzpW63lvBYviqJ4ywAWDVhrTx9JZxb
	RQ==
Received: (qmail 1226268 invoked from network); 23 Sep 2025 21:53:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 21:53:50 +0200
X-UD-Smtp-Session: l3s3148p1@RUU4S30/ju0ujnsp
Date: Tue, 23 Sep 2025 21:53:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace
 cleanup in example
Message-ID: <aNL6yd5QLQzW8b0h@shikoro>
References: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_125355_267327_B28835E7 
X-CRM114-Status: UNSURE (   6.69  )
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

On Thu, Aug 21, 2025 at 10:32:06AM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to for-next, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
