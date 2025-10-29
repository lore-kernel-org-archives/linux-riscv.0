Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418FCCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HesgJn6hr1gH4eq/qhFZJ3wGWKMR4iPGvWhA94RG+94=; b=lnAC+tWT6zSHkn
	fvLscirs3v/g5jvkCFrBiuuaXizMBmYjcjyTHwyEAMWIJt1AWJyh2+qqLoDmaU392MvexVaFjmgIg
	a6GXk6MBsLtBO20y9QukhHXUkh+nQ9IbdBAkxmmSMVQmqZQcD8boquTyQOB8mtFsYJmohq6Z/Jl/G
	QDI6B53KLbnqFI2TQPirvq2eInB4BA1XnJfsMSTG+30M3px0kKqdsDUXywGDFrOgpu+LP6E2lM3jF
	P72/VR8Ff1th1EOaHrSM1f8ukKS1vbGDhFMDa7LwJJ5fk0nhH56Bo25HZ+ONs/AfnSi9NeTu6JZQI
	BmdG/m/q6I2SbbW2QnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5Rz-00000001BnR-403Y;
	Wed, 29 Oct 2025 12:38:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5Rx-00000001Bmk-3F39
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 12:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60B5D401D0;
	Wed, 29 Oct 2025 12:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D19C4CEFD;
	Wed, 29 Oct 2025 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761741529;
	bh=io5APAxwYyBvLX7wqG3QvSQDvLAa+a6gJ1zgJnjDudE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7sIOY5CsIcoyyM2ffuDKsYUlQpy6tooFOGdX28GnNxxV6GQChmLwj9X9YYkmvxTQ
	 CaG1WOoW/nO4ZpkZcLcCevc7YC+Q/YoqKIPwctV1IpS6cCv1sjI9TiUi4I906QUrrp
	 xIeox15QVm6qQwroyPv3pnOnXPJQbx1TSyI88ui5lAvHu2oYSD8tXYBPAyhnqYERIn
	 iseQdI8NaqPcQuXFsZ1eaWWY8wL8QvWSOXM+QrSaBTgvMX/E+3DKjJSSYp+/NC9rGu
	 KzpPwtaEHol9f6B5qW6jcvyKE/8VIQaD+L/I778Js06NMXp5qbBhlbBxiYOo0mZvF3
	 1pofL5WpJKa2A==
Date: Wed, 29 Oct 2025 12:38:42 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <aQIK0lSzQCbjatET@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_053849_828430_99490EAC 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:29PM +0000, Yao Zi wrote:
> TH1520 SoC is divided into several subsystems, most of them have
> distinct reset controllers. Let's document reset controllers other than
> the one for VO subsystem and IDs for their reset signals.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    |   8 +-
>  .../dt-bindings/reset/thead,th1520-reset.h    | 216 ++++++++++++++++++
>  2 files changed, 223 insertions(+), 1 deletion(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
