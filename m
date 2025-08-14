Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B024FCA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZnIuK7lfCKPYbzr/5JGNMThnQLTst++B9GYPq+vwpCE=; b=eAlnI0N3H7mFtPLPF0iUxeAFID
	2nLjpHxRHlz8Z0qJ7GG5r6Y8gObXguUsrAu1oi11NppN4NDXI4103jE8HjdCk+NU/N6vDnC4BAj7j
	omdjjJciKxomofRv8v6dlENarQFDHcb/sXjIvCJFvTvUP2FsOWblQKKBZG9pw4qFUr4v3zwRqLLUo
	CcErXnp93B3hMiHDTE+An8bBtWFoZFbEiDMJ4mnmMt2neEzhmwKN9VAhg+4+7aQKlHxMQbTb14N4h
	jh6OZ0Sww+fiR13fzm9Kk1jfpfjag4T/1A+qROw6GmshTguSP8SqJT3noAtrur0e8O2XBRA1IopQu
	N4pEmqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdVm-00000000QCV-03Nn;
	Thu, 14 Aug 2025 19:21:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdVk-00000000QC5-1pri
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 19:21:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7E96A57733;
	Thu, 14 Aug 2025 19:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DD5C4CEEF;
	Thu, 14 Aug 2025 19:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755199274;
	bh=ifOHHx6V2KJdZ0pCXCcV9hrJ66lyUldfnEN6tn1F6FQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=E/CQr1WU3wmFr4yYBtcvOxhjmvG+UqTkSdbQbsWGXyfo07dtdFD7dcJucf2eXNHEH
	 tKcsfJ/7ilDp/xWqD2XoQbHZQMSYFmeTOfB4W9B9oPwaUxgJPjQnQqIZ9QM7eUW7fi
	 unqvWfZwbOd+/0vjYMGYbWECyEkt5LuUecjt2x0wHTxRFYCPeAVZTjcRrqVMfQB4rX
	 Pkcv8T5NblgShm3aKtWbIcJ6Ipe8iTxuAHYdMGon2vQzhw/GrzeQ1lTC0kyUQcJ8ux
	 KYLyhveBccC7PXYUsQm4fGLDs2yQ51SRvWZqHQdPvWQfx07Xw06L2GvPiY+0CjKvkA
	 XPmblu6HQWC2Q==
Date: Thu, 14 Aug 2025 14:21:13 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Han Gao <rabenda.cn@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Fu Wei <wefu@redhat.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Guo Ren <guoren@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Heiko Stuebner <heiko@sntech.de>, 
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Yao Zi <ziyao@disroot.org>
To: Icenowy Zheng <uwu@icenowy.me>
In-Reply-To: <20250814164048.2336043-5-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-5-uwu@icenowy.me>
Message-Id: <175519927254.3738647.1422282944471640003.robh@kernel.org>
Subject: Re: [RFC PATCH 4/8] dt-bindings: display/bridge: add binding for
 TH1520 HDMI controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_122116_539199_ADA7A4F0 
X-CRM114-Status: GOOD (  11.84  )
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


On Fri, 15 Aug 2025 00:40:44 +0800, Icenowy Zheng wrote:
> T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller paired
> with DesignWare HDMI PHY, with an extra clock gate for HDMI pixel clock
> and two reset controls.
> 
> Add a device tree binding to it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250814164048.2336043-5-uwu@icenowy.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
