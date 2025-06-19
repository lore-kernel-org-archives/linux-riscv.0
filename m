Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4F2C7115E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bxt4XcrEAnT247lWQLyKkdqF09LUJeT0gJT3WpCQ9hU=; b=ONkE6M6T1JGMz1
	MLys16CqfF1EI4YM5DBws0nQ+fZvKIrFs3vfK/NbE38Un/HOvJ7j4yAjGuP3MLmv+f4wYXCLJw/gr
	KUa3/iDWoqhCOAHz6kGe8Q42mm/f1OwW8er4hlxAt5jDsMCB9MX6zOzuqtFC/QXI1YlQuM+ezzcHR
	MKPDLQkl8Kk71T3I5Lgv2cVmwGYalCYi945VOp5k4eUxIjY7weqC037twu35k4LQJ75aFw/Oq3Nyo
	w7jHxQvTsBtFM/JDxifOfcUE7RV66PTnM5lEyIaDe3Rx7DZD9dICfeO4lxVZoehTLTnZOd3qW4DSO
	4EMCCQZpCQ9wn9kQn6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAS8-0000000CPTn-1018;
	Thu, 19 Jun 2025 08:16:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9wE-0000000CKR6-0HrM
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 07:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 980B64A71D;
	Thu, 19 Jun 2025 07:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FC6C4CEED;
	Thu, 19 Jun 2025 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750319035;
	bh=ioLmWy88Cgo8y1/dppgCwzSeNdVJKikPv5yV4IyE2h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBhfQ6gAtLHVKJMVYXVbZqBCLyzlIiIbXyNdojS9bu8yozEEuA2HkWEwnJZgaEiZG
	 k43Jv/ZSQ8GhGowyEcmfaU5dyui2PHnCVbzmJ3TJaFGLNb9bcbjNlFFktLyZm1lhbr
	 j/LAwiquW0glJplpqvxy+33ZHeyPjv/uiHHoektSAo9rkiHjNKHMCcmqpHVGiZhGVO
	 kJetFsf9+/uE9il1Jo/oA2P+tszjmjtIQrP/TDCxNS9hlJFwsOmXGSmH1flWCuKhsQ
	 EQDON2KhZJ0Y5Y4e1So//1qkHqU8Ip3seD13AmbxKv4aP0esLnUWP1rO4+KNbLq1kM
	 3BdXpAU4LT8WA==
Date: Thu, 19 Jun 2025 09:43:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
Message-ID: <20250619-efficient-peccary-of-infinity-e9367f@kuoka>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102227eucas1p26e8968805092c3ce0ecbe84e9724a6e2@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_004358_127469_9EC28F65 
X-CRM114-Status: GOOD (  10.55  )
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

On Wed, Jun 18, 2025 at 12:22:08PM GMT, Michal Wilczynski wrote:
> Extend the TH1520 AON to describe the GPU clkgen reset line, required
> for proper GPU clock and reset sequencing.
> 
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU core reset and GPU clkgen reset).
> Only the clkgen reset is exposed at the AON level, to support SoC
> specific initialization handled through a dedicated auxiliary power
> sequencing driver. The GPU core reset remains described in the GPU
> device node, as from the GPU driver's perspective, there is only a
> single reset line [1].
> 
> This follows upstream maintainers' recommendations [2] to abstract SoC
> specific details into the PM domain layer rather than exposing them to
> drivers directly.
> 
> Link: https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/ - [1]
> Link: https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/ - [2]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
