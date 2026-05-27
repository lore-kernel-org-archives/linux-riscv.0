Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB3ECD5BD5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QY1NNCocyjuVrdxuPd/Kkof2bDDb8bP+7H3JxtefMk=; b=lftPSab3thDwb8
	Z8brLp/J0NaQJM4HrEYVtIGr67NPLQ9zOZ3R71RTmNj6wex6rfAHO+0QGLnIuiT5T2YwGfKFigczT
	tgdyjMPqBKC3Pq9gr9B23OJjP0kD1Vo/RAMeLoZBG6FSm2PESGV7XwBiReS3bNcTc5js0+GalUvyJ
	bhFZmnRJBBLaRw2ysAzeKsIUCc8eUUCFSkmDu/+4OfqpK8UJVqcFoROoTRvKR2lwrImFT8CWs3GAu
	Xz9FU1tFe/HkiWOmkcnly6FmWqUKeGCpstg/Zr0oU5Uo7qXC9k6KlGdIM2zQGAEBwXFwYkhNdw05S
	FaM+705LrBkFiHaFq8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE6F-00000004AOQ-44DI;
	Wed, 27 May 2026 13:15:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE6E-00000004AOJ-1r2p
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 13:15:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC032600BB;
	Wed, 27 May 2026 13:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875181F000E9;
	Wed, 27 May 2026 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887705;
	bh=ilW4NWLTwkUELBbTK2kfF09GCPp5/Brn3weim2DuPZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=goD/32DDMLghM/2baYE6XajjH5LAb18XTJ6xMemcOXPknUvrB5Y+4tDAQ7gsK7X/e
	 rnujQ2byma5BXpKqqCOLjcFNFwbl0ZCWwY8LcErl4j+81XxuGgRg+JfcNrf/H72oMN
	 sX6ggpY2+tBzDqc3Sk21Ll1YinKhIAnA70ntc1Y/73Ng7ggScB9SzLPdIPDJHkdUPU
	 7kam0f6GqdWcG2ljv4TGMzkkj+ScYnjgjcmnXuHBL8PynjZI1NI1eAuUgox68U+4MU
	 FJvQdvKGsfI3vs9Fv2vGZgD08YcKagzASMVkvxSStMQrRsHczU9hLkXDSqIgrql3qr
	 DncfdHKk0VCJA==
Date: Wed, 27 May 2026 15:14:58 +0200
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
Subject: Re: [PATCH v2 1/2] riscv: dts: thead: Add TH1520 I2C1 controller
Message-ID: <ahbuUnil35K9uSEa@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
 <20260508-lichee-pi-4a-wifi-v2-1-7acf63559e62@leak.moe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-1-7acf63559e62@leak.moe>
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

On Fri, May 08, 2026 at 07:44:13PM +0800, MoeLeak wrote:
> Describe the TH1520 I2C1 controller so boards can enable devices attached
> to that bus.
> 
> The controller is disabled by default because pinmuxing and connected
> peripherals are board-specific.
> 
> Signed-off-by: MoeLeak <i@leak.moe>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
