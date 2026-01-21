Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB42D262AD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XitMNKJEzCcxY2e/O/xsdMG7KmK1cc5OeeJzCbHwf/8=; b=djCzKJ1JIVGESV
	3TMECERVjKOu8O7mr4+y5cKBGRPIHsz13qXtN9KI11Dxfd4VfySDD4TsYKk9v75o3wtPPRqYvqGeK
	6SOtklZWqgzv9wz8gHs9d5PwcDQlrZBCPrxi8pEBahWh5CIO3xsPKkkI2iswSsO5TpxuTyOl7ecPu
	D7W7Zda+r2jkIUoItpMCCKXfSnaaBvuMkfNrDdmPqPcITEewmy++RYj1q07nA8GGbw8WXlz7IQ0Uo
	VMhLpgmyP69qWp5HC1ABDDLdvN+uZt2zYbAY0nhcnjGvLMqmJ5sRMuy+TeINfa4RpNBL7+ezyG5X0
	MNScIE8UewdD6kQn+log==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNzA-00000004nFM-2qsi;
	Wed, 21 Jan 2026 02:30:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNz8-00000004nEt-0Mrw
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 02:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B569C441B5;
	Wed, 21 Jan 2026 02:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD35C16AAE;
	Wed, 21 Jan 2026 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962617;
	bh=qGrGq+WjO+0/AMaXMyyeImAUN8v9eq1Kl4YybbLFXzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoItEJWm0LVFPE7anJieBvxWmwVdoDk558iLW23WzQAstABvo9/zQOVi3jsMtCgf/
	 LYtsmpG0gywjuHq5Rq0fxpUgBlzXovRd7O4jBMXMQRoA9elWM3sATYZIDlE/6W0QiX
	 SSNx4dWROuFb+mwg9jc460Dv9W52IYBWmgOtfO5yLoPvErbsBnpET3+OsWLHoXkNb/
	 Y0QLjO/JkpKPDDG8WtlusYBHvzuh5A4yzZM4jOd+IsvDgu8xCxLHY9vG3XB+csdibZ
	 4tlHUe16S0cma/Dhken9DepdXsLgTgrIFLNKPzHXa/YN98KD7QK0vBqIBfOY3JN+G0
	 NIXcnGRpnqV2A==
Date: Tue, 20 Jan 2026 20:30:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Takashi Iwai <tiwai@suse.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC
 codec
Message-ID: <176896261596.1836014.8166453734393092086.robh@kernel.org>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_183018_169466_079CB7F3 
X-CRM114-Status: UNSURE (   8.17  )
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


On Tue, 20 Jan 2026 23:06:05 +0400, Anton D. Stavinskii wrote:
> Document the internal ADC and DAC audio codecs integrated
> in the Sophgo CV1800B SoC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-codecs.yaml      | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
