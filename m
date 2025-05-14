Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28888C3ABDE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epZSl8lCOKjX97jLSijvGgoSskWFuMXxySGw8bRakes=; b=Va6FgmEedm1GlU
	nrdOFAFdMJODTrKZsDnD5+yLa8bPEeqdfGaICfliMy9bY7hd2MhJ+2UTIhQCtJrW8woT+nUwXmQLm
	pLg97DIrtlX03S7LsQiCMvFcug05NvPUUnriPh+f6HoYOzaQMfZ38++RGUkS2vedecQKzfCc7DETK
	qXFPW2tAlzRYw4Cv6uOpD05XLMIwooAgSDqvqIem5S7tOMPsIO4FhV0a49pszQtZkTiEHL4uemncv
	dJjb7XmO5q9SiLbJh50szlPNxYbzT+5FI6Ue+CtmxlaptTarmq23MyA3xPnVbpJcs8dNJZIfFlYEi
	gBmEmZ5WeJLDAVd4VY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDqS-0000000FYOi-4B5d;
	Wed, 14 May 2025 15:16:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDbW-0000000FUnt-2PmS
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD59D5C5F5A;
	Wed, 14 May 2025 14:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3DAC4CEE3;
	Wed, 14 May 2025 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234864;
	bh=hMW/9Y28Z+06nftGC1bUDaDU9DIvJvhegAW2nq4TGEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nns+7qTeY5x1nrD1T9+9IMc2mtan3fVsg82mGiiYg0BgDoRIncUTy1JgzhNR5xrTv
	 S5vBoK3/O2gwZiX4/gf1ak8uGTO6Wkc5CUM/8rs1v1psUWuCm+P7iUX5T13oXToozx
	 nMyPwPo/f8E0OUp33jPceNulQo5PkeN429WLMdTLFLMnjTt5hdHMYh0b6HhV23j0sa
	 Sf6HwQngpk1ljrutHG5zCEa0+Ln4JEt4Ry97CxtoOUwEfQzOVa+6pKNErco+7G8hDr
	 5D09WQhhyeLSLdrrbU8eyhiFZHr9yphKbsNFAx22Nqr1xuuysHrM27Qv2UhATHAKPX
	 6jMNLua9mcMxQ==
Date: Wed, 14 May 2025 10:01:02 -0500
From: Rob Herring <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <20250514150102.GA2180131-robh@kernel.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-5-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514095350.3765716-5-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080106_657546_323F744C 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 14, 2025 at 05:53:45PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine-level software
> interrupt controller.
> 
> In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> second time with all interrupt sources tied to zero as the software
> interrupt controller (PLICSW). PLICSW can generate machine-level software
> interrupts through programming its registers.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../andestech,plicsw.yaml                     | 54 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +

This won't apply for me due to MAINTAINERS conflict with this series. So 
apply the bindings patches with the dts files.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
