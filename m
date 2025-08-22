Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09182CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhVvx45zSuCpR3Y7gA79Dr7GcR+QsppqJPJzkMHx8Vo=; b=5EmojOCRdaVql1
	nms/eswXL/VHpUSQHFUj8pqZtOL4RW33jDFlGYq/5UexwPu4HZbsps0ic/HUAGYZCnFLesL0wv3pS
	1pVc3//7vuacGnP/+EpzeDbr8yo3cOJvUtRxgDfiqHyK8qH2xWmyQqUPniNAD2fYi91oMgjheZy8G
	0ddF+9Oc0v6rzQoxWueiZipwSgEiYzhw1XF8indlC50taB6Z62rQCcOsDsWDMlD1gFDKawLuTJVhb
	PawdxsAee85CuyEqaj3Q/BenEXzSmXyglL2aP4F03OeFCJ2fFvv5f0tjyoGKuEcAvERgFynJNhfaB
	sAroWQwbaQkLeAUcuiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfo-00000004VOA-1Sqs;
	Sat, 23 Aug 2025 09:36:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upYc9-00000003S1q-08J8
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 20:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7DAEA58AD0;
	Fri, 22 Aug 2025 20:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1F9C4CEED;
	Fri, 22 Aug 2025 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755895435;
	bh=TEdHF9pUX27RDqqMATVQj7+pnf8Vs/Rf6VDbI1qD1Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myyMEVM+bG7+YSaMj6mY2qSH8azZg5DrqUVeNO5J30SqcakUL1hcNdIoGKP1xJCLX
	 AP3TMdbKHat3PbYVL99dJnb4p3+vvlet5ome8KfpPnNtrQyb5zwncNFGbDAbd0SjdG
	 ydTEvhFHNa5jRrjCjmc7QH8T5SvIPWHy9DYPx7Ik92gJ2Gr5XFcqHHpeV9dnHUDjQ1
	 fFiiNmill6JZ8rsVEWWXVc+5sr9J2iAVRUO4FNc8IF/TpHRxlPfV44lfcxeCQ0Dyif
	 KU7Co8VS4oHGDY8b0ADiAzrRgKiFwNYJueNi8ud5pvOi+fVBRpzfjRB2Fzgwx7nZlS
	 fQ0aLSJ9nKI6Q==
Date: Fri, 22 Aug 2025 13:43:53 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aKjWiU4fQw3k77GR@x1>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222023eucas1p1805feda41e485de76c2981beb8b9102d@eucas1p1.samsung.com>
 <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250822-apr_14_for_sending-v13-3-af656f7cc6c3@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_134357_135965_FAC5EF0C 
X-CRM114-Status: GOOD (  13.61  )
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

On Fri, Aug 22, 2025 at 12:20:17AM +0200, Michal Wilczynski wrote:
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> the GPU using the drm/imagination driver.
> 
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
> 
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> controlled programatically.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

I've applied this to thead-dt-for-next [1]:

0f78e44fb857 ("riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node")

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
