Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE58CDE03A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 21:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKeABZIRfCW0W7OjFeXNr1j1QNfpxivdjgw6IyQHUjQ=; b=X70fhexds5eTQF
	nzLzvaF3gW06zFk51D2MPHIOH0TWIuL0xLwCpH+bH7VgG6jZu/TQwVWRjBMlwhkkXK3MZ22PagJeP
	Ri6ew9TJrZ1YhBRPwxYGilBghH/D0Cj/aDypTchPMgqZHS0hT18Zxr7f73MyHDCbZhAVMKxrQdJNf
	kg+oOoRORzbX7xwFfW4+94uE8ltLCQYCQk9e0geM0XwHOCnEeF5+XDtlF3J2K4REQFObGOANHLH7M
	dsHUsf97KEVjMwv7WPiUmD88vjAM3SJOURGZOGoYw+UpOuMJFDP2lQw8mSsDWzVWyfUcmIwThPgEc
	TE2PAxsUm+fyEZkcYAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stvqv-00000009Mtn-2ajM;
	Thu, 26 Sep 2024 21:16:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stvqM-00000009Mpj-3iOV
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 21:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC8BEA446EB;
	Thu, 26 Sep 2024 21:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8E4C4CEC5;
	Thu, 26 Sep 2024 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727385369;
	bh=UtnSPoa/rfPJxu9yzCby9GUs+YkJKRJDod5/XoTt8n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1M1gRS4zEXgjIuvwtzqhdq1GCzP7673b3s0fJ+MYE9D68Nmi063/buFoGEmDDNmH
	 iw0OtLtiTIkjkqAQgxGoDe6Z/BNH9beEPa9352lVbZycYi6lQi7J5r++ynwESJ9AeG
	 gvwJXbXGZU3haGYXK8dTI2PmoGfgHVCE31h9K3dvgQ4/kDvJM8BqG8jL9o1ybhb21L
	 Co0qclaaQgmb46V0pdeD0e5m9Te5Xs9RaFlM+lWGtWBrPNCAWrnXnkx15eS9sWFlfg
	 SyGiIjk34GyQPDFKPtr0ABtlQZaazSsrVoA4ccLi1+150lDV6nWXHysXpiZkZWxxbt
	 H7/Kp6dYHbQVA==
Date: Thu, 26 Sep 2024 16:16:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ze Huang <18771902331@163.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for canaan,k230
 SoC
Message-ID: <172738536551.3022684.2015400552929682489.robh@kernel.org>
References: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
 <20240926-k230-pinctrl-v2-1-a9a36fba4b34@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926-k230-pinctrl-v2-1-a9a36fba4b34@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_141611_008744_9290C87B 
X-CRM114-Status: UNSURE (   7.96  )
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


On Thu, 26 Sep 2024 23:57:43 +0800, Ze Huang wrote:
> Add device tree binding details for Canaan K230 pinctrl device.
> 
> Signed-off-by: Ze Huang <18771902331@163.com>
> ---
>  .../bindings/pinctrl/canaan,k230-pinctrl.yaml      | 127 +++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
