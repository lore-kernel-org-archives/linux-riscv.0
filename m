Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2E5109E521
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 21:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4BL5c8DDWAbm7ikZ6PBwRjEMgi1DvUgpxK/I8w26ms=; b=PSFAb9LsG+4/kW
	AMj1MccZv6czyOs3zyrKQy8H2gKRrsrohkmoq7AZP/c4zLi5+DJu7Cw1kyXaB1m5yHiDoLsXLORGk
	eJyE30ZJgVPgQdoZkScgujIk+XzAK3SP41LZKrtXpGoZtrxp+JZE+QtR3XU0V8fQyeBCeH3C4QNOS
	ZHT3SUi7SL6A0mDtQ07sDfvcl32hMJIu1SecgZRH20dXXmkC8kyhEgMnPNDUF42gwG98h6bNXfGIp
	FUfZaDZQnQUDiyzhqyZuzq84zP9mmA4vs2ySuaS4dL3NdQ39ua9Uc1keQmdA/1qjZemFX+8QrNaBI
	ooXYw08sPGYlrrcYk1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WEA-00000004J0C-19eT;
	Wed, 25 Mar 2026 21:57:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WE9-00000004J01-17th
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 21:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C96F60053;
	Wed, 25 Mar 2026 21:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F8EC4CEF7;
	Wed, 25 Mar 2026 21:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475843;
	bh=4ookYp8NfrvQO5CddLtBdIKFZGpiutFEIETmwjM++Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwVOGOrM+YLpZrjU3ok11DrNV1A6E9ho+SqCC54G1If/RdQzgOzs0lQVJe521dgCc
	 hqiGgviM1JuZZcUtX/O6r1ePXXt7Y4W0+ZlHZMpL0K4RbBx7HsLSw7C01YLOHPObKQ
	 aiypy9aHfpurRjIMOSdk/z11VWnkRBr6YrUaVcsuWmoXvVP6aNNshuYc/mFk1bckYd
	 Sh2Lr1wjqZnwNVOFzG5m4srSAJYIP0BEDhthneOS2Mq0pa2hniyQFHYZsGYNzjpwS8
	 pVBHBwnrlKzJL2R8yyCAcrLreWnDzaEqsjupy/HdtAJ+iS1EriU5FGj0vRScqfr22l
	 LNwkTx2A4l8Yg==
Date: Wed, 25 Mar 2026 14:57:22 -0700
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
Message-ID: <acRaQgAIp6W0pWol@x1>
References: <20260325-hdmi-beaglev-ahead-v1-1-e71b41b98dca@imgtec.com>
 <acQTGPHvoMDvLtDf@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acQTGPHvoMDvLtDf@x1>
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

On Wed, Mar 25, 2026 at 09:53:44AM -0700, Drew Fustini wrote:
> On Wed, Mar 25, 2026 at 09:18:59AM +0100, Robert Mazur wrote:
> > The BeagleV Ahead board includes a micro HDMI connector (Type-D)
> > wired to the TH1520 SoC's HDMI transmitter.
> > 
> > Enable the display pipeline by adding the HDMI connector node,
> > connecting it to the HDMI controller, and activating the DPU
> > and HDMI nodes.
> > 
> > Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> > ---
> > This patch enables HDMI output on the BeagleV-Ahead board by wiring up
> > the DPU and HDMI nodes added in the following series:
> > 
> > Depends-on: https://lore.kernel.org/r/20260129023922.1527729-7-zhengxingda@iscas.ac.cn/
> > 
> > The patch has been tested on BeagleV-Ahead hardware with the above
> > series applied. HDMI output is functional.
> > ---
> >  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 25 ++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> Thanks for getting this working for the BeagleV Ahead and sending the
> patch.

I have applied this to thead-dt-for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

There may still be time for me to send a second v7.1 pull request for
thead dt so I'd like to have this patch in next for a few days.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
