Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB50D4A5EE
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 03:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hFupcL8laGC5Np2Zp/go+OXXUJz8ySBkB9UQSpSgH88=; b=e4IEzohnPHIhWpWjNV9hnvt5Nf
	cu+F0pGxe4vs6ob3M6X4vLyIPOV2TBQv1nFh9PW34wV90XTOSepin8KTG8bpbA+5Nns3jjEAwWdOJ
	ncHURcg721a7mGVwC457QvwQs9tuoIpaYj7bdqasM6ZeH918QfFc2pp3IbF0DJUVN/oUxfAY0eal9
	rvo5b1cnqw/oX+pAcLGpU34g7iIRbSqJyOZf+SQfZ/Vn060B5DVoFG5E6becyaqSxgkXj2LFfPxWH
	IIeMl3EjCagY20TOntdY4JhCgnUnLqJj8vywCCPNEYaIEaM5LUKjrGJ00UsrkkupXUyor2XJf+aEj
	mfRcjpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaM8-0000000DWZ8-1rdx;
	Fri, 16 Jan 2026 03:18:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaM5-0000000DWYl-2NOM
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 03:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 893FD44280;
	Fri, 16 Jan 2026 03:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4582EC116D0;
	Fri, 16 Jan 2026 03:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768533511;
	bh=Xm+2ll6ivXVZctHPRIrQeLW8sIpBDbueJK+DuxLa5rk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k3O824Y60vtT5R9anTKnp9bw+151BBSUSj3Sxc819MJHmZ6s52txAlPa//g/3pLMr
	 iYAiwhBafq3AvKJ/rtlljLfzqt2vpzyHLfv9ehGYfcf8EQ3kIsao+Zpo8axxH8uSNt
	 kzYbNm873D8NiGj+ZdwFpC69AWjB75NkrfgOuIHcPmqSonxvcrEl4ordp3BpQihohm
	 SQpiiM26WcrTZYpho6fzFoSfR9qqdMpKyvZ7NbiO12xOgRTrW12IvJ4kwwhmCozAMk
	 BaPuOg1nZW74wWc0bgW0UsBIry2ROQKvpPK6QZ4KJM/eUMa7f402nFNNX4Pu3k4vHv
	 8ThnmyeDkwrjg==
Date: Thu, 15 Jan 2026 21:18:30 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, mpe@oss.tenstorrent.com, 
 linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 mpe@kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, linux-kernel@vger.kernel.org, 
 agross@kernel.org, npiggin@oss.tenstorrent.com, agross@oss.tenstorrent.com, 
 joel@jms.id.au, fustini@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <jms@oss.tenstorrent.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com>
Message-Id: <176853351040.1182938.10653081903273010930.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_191833_624751_71E84096 
X-CRM114-Status: GOOD (  10.07  )
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


On Thu, 15 Jan 2026 17:42:00 -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis syscon that manages clocks
> and resets. This syscon block is instantiated 4 times in the SoC.
> This commit documents the clocks from the RCPU syscon block.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 +++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  .../clock/tenstorrent,atlantis-syscon.h            | 67 ++++++++++++++++++++++
>  3 files changed, 127 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.example.dtb: /example-0/system-controller@a8000000: failed to match any schema with compatible: ['tenstorrent,atlantis-sycon-rcpu']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com

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
