Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C1B109C045
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUC0UBncffDyRyPtzaQewgPU3q6PBlQv8kp/95fntH4=; b=LmKARvpD54Qscj
	TbwN0KkwDaHfr68QtIPpA8zj7dFT4QuOF5xmnJZFV7wwAObzL3pEBuWF9vfunKn1HUi+BF8K+z9+X
	fKIHlpWqVU8nl4fiWiTOQOOtW6KT4fGUNd+lQHHvIFMpjKdH+Gxg8A3pTjdyZ0VWerByR1AniNiK/
	sBAgz7gHogfaK1NL0UhytflGOeJoU2KN0VshKC7MkG1CSPl64YK+Chgtl014m7JNa0/9fuu3e1OzQ
	VYhaVGN+BH3b1KnzlHioz3Tl2R8u3q9TPwluqUaxNrdMQYdLlJgiV5GU/3KavoXAn31Pf2x/GfhvJ
	gtiuhCFYr0KlFb7rDERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RUL-00000003wfF-1YhL;
	Wed, 25 Mar 2026 16:53:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RUJ-00000003wes-0Guj
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 732A643F94;
	Wed, 25 Mar 2026 16:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C55C4CEF7;
	Wed, 25 Mar 2026 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457626;
	bh=Rhut/ar+8LaHaNGeWmxZZmVDhYD/d7ubiNtGKbvpytY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpjKqgz5qntIKvsseFKxl2gqAayouChOWd/8ObMRHI5H8CYFBouHc7uOOLkQC56cZ
	 PGCE5ibBKj2N34w1sB2CQe/f9X0VC5VU7LvnMGS555dL1KcummlCcDeKF9JFhCajUF
	 bc3DpA8wGmYOqH7gesyI1/HSmdMVDTet9dnYzoPu76UbNZCGUHRaTOMCicnnn0Sh0K
	 KX/mGpgud1bR+Z3MfrCSRhUoiKl+P8jOnikiUTjUoI+wruMCVr4gh7hXAeoEJlQdzd
	 c/wO8vBRCK+tCLCuedeXoQaW29UjQlwHfyUNQxHaDU7756n3KaJgc2lTc9INR3LggV
	 5Mlvk836ezuhg==
Date: Wed, 25 Mar 2026 09:53:44 -0700
From: Drew Fustini <fustini@kernel.org>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: thead: beaglev-ahead: enable HDMI output
Message-ID: <acQTGPHvoMDvLtDf@x1>
References: <20260325-hdmi-beaglev-ahead-v1-1-e71b41b98dca@imgtec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325-hdmi-beaglev-ahead-v1-1-e71b41b98dca@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_095347_119439_30F775CC 
X-CRM114-Status: GOOD (  14.95  )
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

On Wed, Mar 25, 2026 at 09:18:59AM +0100, Robert Mazur wrote:
> The BeagleV Ahead board includes a micro HDMI connector (Type-D)
> wired to the TH1520 SoC's HDMI transmitter.
> 
> Enable the display pipeline by adding the HDMI connector node,
> connecting it to the HDMI controller, and activating the DPU
> and HDMI nodes.
> 
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> ---
> This patch enables HDMI output on the BeagleV-Ahead board by wiring up
> the DPU and HDMI nodes added in the following series:
> 
> Depends-on: https://lore.kernel.org/r/20260129023922.1527729-7-zhengxingda@iscas.ac.cn/
> 
> The patch has been tested on BeagleV-Ahead hardware with the above
> series applied. HDMI output is functional.
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks for getting this working for the BeagleV Ahead and sending the
patch.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
