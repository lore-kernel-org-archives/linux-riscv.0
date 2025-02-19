Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2447FC021B3
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eV7wQtgUj14m1rf0hdjIzJRVy9OgMAMHkyPSy4yAgb8=; b=qayQAdwugH1sGI
	toAr9JhDQReremRkbJZzMyhBRImG0uEhtoTsOTUzfDgCC5/NnB6wqfJ/JyUfx9WoY2g43L8WY2Ekq
	5f8WfiZNxa6U02LMoOKBlDTd306B54dg4KpFIiF1v7rjsjnvj1P9mY68SYcHOvn9Ii582TpQ4v8OJ
	cUT96DLsmT9mWuqPiAFN5NCvhxXMlcPpWknIjN90l+Y6iXlnK/cFUhhJ9v/U9R+Rj3cbqSBN90hJK
	K2fPB6JtrmD0gXlDqxUqEaftXlqEng41ozsRbc2pDV1GUotNtMjKF3/yOdxQA+X0wPzcEUnMIFKaD
	iRgM6hTrQY0psjPGhJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrbd-0000000FBo9-1m4G;
	Wed, 19 Feb 2025 21:27:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrWB-0000000FAQR-0nUY
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 21:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EF235C5C7E;
	Wed, 19 Feb 2025 21:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0681C4CED1;
	Wed, 19 Feb 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740000126;
	bh=5vfdv1IWZ57ad6RST56MifY1lxkn1jnqlk1jC8vaDbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqsPhmw/qK0EANe/CvcEJA+8Z7bk/OxllNIVXqaqjXdKJa9fPaJ5OVNUTm11/oFnA
	 GbgQw0Y8scZzq9p/96ioYDwCEMaPUPxOoglzl1CHxEP8QGyEY/WZBfrZgoQY6NLFaa
	 +qxeTdGSE9i/bKK8QQIFqJf+COujvnJAewLTHnWIGeftIVwzmX62fuOYyQip1YQuvn
	 ITkVywFW5CwyA2+mF6tjJA7Ut0FfHfUrbfJ8tSL7ySfoeVzGPmjvyhaZV4zIssUOC/
	 9ea8OB0wJcEkk6Ifgn1aBTC6ncW/P51mCYd7Oj3Za/s++P62Gmxz4OVAsjKyMTZcIy
	 L9kkJ6SaKnw7g==
Date: Wed, 19 Feb 2025 15:22:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: pinctrl: Add pinctrl for Sophgo
 SG2042 series SoC
Message-ID: <174000012333.2976359.11039865592765348897.robh@kernel.org>
References: <20250211051801.470800-1-inochiama@gmail.com>
 <20250211051801.470800-6-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250211051801.470800-6-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_132207_286518_58588FF7 
X-CRM114-Status: GOOD (  11.07  )
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


On Tue, 11 Feb 2025 13:17:53 +0800, Inochi Amaoto wrote:
> SG2042 introduces a simple pinctrl device for all configurable pins.
> For the SG2042 pinctl register file, each register (32 bits) is
> responsible for two pins, each occupying the upper 16 bits and lower
> 16 bits of the register. It supports setting pull up/down, drive
> strength and input schmitt trigger.
> 
> Add support for SG2042 pinctrl device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../pinctrl/sophgo,sg2042-pinctrl.yaml        | 129 ++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-sg2044.h  | 221 ++++++++++++++++++
>  3 files changed, 546 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
