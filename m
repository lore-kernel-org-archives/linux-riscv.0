Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741ADC44529
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kr7IQ1AMlK9nu44aSS+Ssl2kreeGz5mgrE8V1qOB+1Q=; b=o0D1XIrhb/2Q+i
	FPHJBa2nNk+mUyyx/f2BzH/tT1zxb49YLYDRrG1SgENLZFhxOqGcQyBC5YApZUS3HbRuE9x+xPQXg
	LIO4oYsoBgNwP/uuy07RMDhAZSaGWub0CjFnTBDPz9xZs6W3wrRccrwTaqSURzzdvMKq1GjrCpWqf
	CNzvz9f6RrF1BBrdvRjV/F6wPmviQ5uzatg2yztpuDr4rEtCNJPX2l8jxhTpZ/ZCUKFBWfkBTHhUZ
	3MLnHTl0TQcKrrIL+0iNbhvsK/6BoC3vVjejeHPZLp6WMXhR0MDlynuYmcfxluSuAByokEUjGd1Tz
	GYZ7zr1Y9Twfwqv/KdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlshV-00000007e6d-2y2d;
	Mon, 20 Jul 2026 18:26:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlshU-00000007e62-3tTd
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 18:26:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 619A160051;
	Mon, 20 Jul 2026 18:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A6F1F000E9;
	Mon, 20 Jul 2026 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572008;
	bh=JvAqs91DJEvwXagvgEPqW9rmpcc1PnkHB87HW8o7xcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8cxsSFSB+YQ65O6MJocPWxlZSyJYm7wZ9mfrkj2FX4Mi4fDMhpDpDSyqBj25q7X7
	 RVmmonCyroL4fnhJd0B4rJtQlre+xew4qEYlQzQInm5k5bpQQFH2kY11iaIOmwrAPe
	 dhJnfsqMDbldB6x8LyTXVg6YW+hKXew1dVOV+liAhbzor53I/OQUT6CDZG7ZZNnv4O
	 /qX5v6hchGKUHk4ChZ69NYUY/3vvuAMhcZiAgLR/V/9GEgyMJ4feJCP+56YDXf8cgJ
	 xgSUWi7fWLTxwyk7x0w6Ydt90NLKF4YeZc+BnGZi/dtWPk4A2Y3w4hwZ/Swc/OOEyL
	 lGP+AeKq4Oq3g==
Date: Mon, 20 Jul 2026 11:26:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 3/5] riscv: dts: thead: lpi4a: sort nodes
Message-ID: <al5oZsY2X3MdG6vY@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-4-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-4-zhengxingda@iscas.ac.cn>
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

On Tue, Jul 14, 2026 at 03:45:13PM +0800, Icenowy Zheng wrote:
> Although "D", "H" and "I" are earlier in the alphabet than "P", the DPU,
> HDMI and I2C1 nodes were added after PADCTRL nodes in the Lichee Pi 4A
> device tree; in addition the PADCTRL1 node is placed before the
> PADCTRL0 one.
> 
> Sort the nodes in this device tree.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 72 +++++++++----------
>  1 file changed, 36 insertions(+), 36 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>    

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
