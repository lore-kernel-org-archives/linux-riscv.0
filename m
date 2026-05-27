Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EADCD5BD5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDLGs6wLl924/gJmIkS/0VJOFoX5vyk1z0gT5WLty0w=; b=2JBXqNugdkdp7v
	fGDw6O5TivzldbElkEIGabadDiv/wlykxIY/Go/fy/vlBE0F2ppwh6NrJZU6dow+AUo1vDvACWKUE
	1oZkfk8yJPb3QdsBvrg/f8f9mrWVNRjT4KHgMGE/AWIqU0i84bp2zDUOjuwaQCXrdyYle1/pf/3kQ
	vtFZaYpI7VFb8b+pWS5Uw5rdFvzvt4/Rccfv0DrWvqgrxwF7iRHD8+R60+m9OoYm2Xlv5YA/+6dq9
	2qGb5U/3CbZSnZAZIJNcJGwiZaHK/epk6ciMEluMbKtDUdjExTkiO+RQDZKNt8i5pOH2WhNa8nzdG
	Gv1HwA6Ox4Se9GsseQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEAW-00000004Axe-1GbM;
	Wed, 27 May 2026 13:19:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEAU-00000004AxT-2hFe
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 13:19:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE25060132;
	Wed, 27 May 2026 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D7B1F000E9;
	Wed, 27 May 2026 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887969;
	bh=Q7gBymELBCrfCbrF5Z/sbLkfLJFwnO6lYJgd+STHmlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbTboMG3MVEg45WS42Zwiio8fOKqRvbmN8/hhkoiAevca2Z5ZuEMVMnBb8JgeqDW9
	 5VB08ry9tOpLXCYgAkXExBW/EqxCwmFh66V+BrN0Eh7iqP+Kzf5eThyknd+RsKwH2H
	 fIkhQ9VkIcQq9K0SVKzWOXvol56O8WMri7v9Ai331s3xrSpnIDdpdixntonu8G8xVk
	 vGN4DSGz3zfJvQh3rioXDqnxUVwghbUlbAGl4Hp+xHfZt0TAXCtpCKhh2VkLLNZOOz
	 37kQmYlVVDmCcipJHj2qHshZkNPvFnyHs5EINCSd3g1UBmZ8/TdukqC6vI0ZJYqSRb
	 eM1N2PSdCipaw==
Date: Wed, 27 May 2026 15:19:23 +0200
From: Drew Fustini <fustini@kernel.org>
To: MoeLeak <i@leak.moe>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable WiFi on Lichee Pi 4A
Message-ID: <ahbvWzodp1SsBb5a@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
 <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
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

On Fri, May 08, 2026 at 07:44:14PM +0800, MoeLeak wrote:
> The Lichee Pi 4A has an RTL8723DS WiFi module connected to the TH1520
> SDIO1 controller. The module reset line is driven through a PCA9557 GPIO
> expander on the I2C1 bus.
> 
> Enable I2C1 for the GPIO expander and configure SDIO1 as a non-removable
> 4-bit SDIO bus using an mmc-pwrseq-simple reset sequence so the WiFi
> device can be powered and enumerated.
> 
> Signed-off-by: MoeLeak <i@leak.moe>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
>  1 file changed, 47 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks for fixing up previous revision.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
