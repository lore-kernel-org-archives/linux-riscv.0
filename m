Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE8AC531F7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK8HQulxjt2m5bPkcJW7TTgBzptuoVXxnaXKWBEFZQk=; b=mYEB1MBpuTipCH
	BMjZmwFzajZE9aCDLlJGORoOpkRH3u5J6MkB6RAFLD4FE+GS+6bNRy7dd4mTje2OvQqdOIh4/8LJV
	CvfvOwEMpGsapoHHo6x6FP9ZiMI/csbfCYjZsDBRXssrLNU+5lsc0HpAYGIUwSsGhPb5A3ia6AhYw
	QLwaB8+2dMgksyKN/wiIuklTGtzIsZioR2d5EsWMJ3AodEYwc+Q1arLnS7sCRtjoWsvZyJkXwc8qP
	alHbk38PI2uBuygTHVQQlni5+igD3GLiLdgLnoS96kHf4pcZ9BLS8izcx+tBOVEEj3TtHRwWBbOmx
	1/SqpQGdiClTeUYGOOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwaw-0000000EkKD-16Lw;
	Thu, 23 Jul 2026 16:48:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwau-0000000EkK2-1EmP
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 16:48:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A654640E26;
	Thu, 23 Jul 2026 16:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0531F000E9;
	Thu, 23 Jul 2026 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825303;
	bh=3P9xI+pucfFbCBzQvp5irY3d0mKfClOOD5/mrlfuM/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nsgCI0Ab13Z/Of9oByHdIIRnbyP5zi/C7dSPzQXUokVFUGzdcIlrlKm45s1Q14isF
	 aVu7PO08VMNDnnC6tWBGqhsJoa/wQRT4DZhzhtB7bAIE5u55zMotEmOF9fTdSjxY7Q
	 cwRr6ca9jHke2Ir8TlsVC9k0a7IGsYsaj3YQ+119IlgZwGdc8SiN26TRY32gFxxa7U
	 ugTtZBm9qOojhSp7PXkAlyfTxi/mdOXoV+a6+By50iAxHZTu8uDZIhS2Qv2d4W+WGM
	 PWtwkEojYJ566qOYU9qvqaLBbdwgwM9jD0B06TfQtThFV3J6qC+7jO9yvNfykyizyc
	 VvJehO+bNUTbw==
Date: Thu, 23 Jul 2026 09:48:22 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 0/5] Add remaining IO expansions on Lichee Pi 4A
Message-ID: <amJF1g8sPu5RrrIQ@x1>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, MoeLeak <i@leak.moe>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 03:45:10PM +0800, Icenowy Zheng wrote:
> This patchset is split off the "Add TH1520 USB support" patchset,
> dedicating to enable the IO expansion chips, because the situation
> becomes complex when one of them (but not all) was added for Wi-Fi
> support.
> 
> I fixed a small issue of the existing I2C1 device node, and then all
> original patches are aligned with the existing I2C1 node for
> consistency.
> 
> Emil Renner Berthing (2):
>   riscv: dts: thead: Add IO labels for the IO expansion on I2C1
>   riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions
> 
> Icenowy Zheng (2):
>   riscv: dts: thead: th1520: remove pclk for I2C1
>   riscv: dts: thead: lpi4a: sort nodes
> 
> Thomas Bonnefille (1):
>   riscv: dts: thead: Add TH1520 I2C nodes
> 
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 141 +++++++++++++-----
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  53 ++++++-
>  2 files changed, 157 insertions(+), 37 deletions(-)
> 
> -- 
> 2.52.0
> 

I have applied all 5 patches to thead-dt-for-next and they are now in
linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/arch/riscv/boot/dts/thead

If no problems arise, then I will send thead-dt PR for 7.3 in a few days.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
