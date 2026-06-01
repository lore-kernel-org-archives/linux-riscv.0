Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3124CD6E5E
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS2ycOeOj+ZLAzhBYLlrV1bYV2aXDNFoQi1INj3W05Y=; b=X3JR6UrHAkNvqw
	z7+3TaZ9WKWv8HdQg9p+YUHdxdS4KTjzrl6Gh7UlTvmf9j0hJ/mMv2UeCtmQx58L18NEEdHiIWGZ6
	zetvYUni+vt1eNZzO3kk7X7ya4HvJ5XggK1z2hn9QohWEu3xAvd4S1QJwBrXc+ZoCbZ/8Nh9ROKqO
	UuXaNPlpt2ecgRtIVx66wb0xDy/8T9dP3ZwOneCBIxhucmhoCsGVzrF8aCRUbLSRG1171IM4VIazJ
	YCZeZLQLbFohSM9vI6ALNEIyTib4j8sqvP7Znsh6xTK4hQ8syodLKLp5JdFhYhU96cUthm30/P9/v
	I5VMrz2SzVlJX1pQs5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwBg-0000000ADBq-30ec;
	Mon, 01 Jun 2026 06:31:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwBe-0000000ADBH-1afW
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:31:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B909D43FD3;
	Mon,  1 Jun 2026 06:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAE81F00893;
	Mon,  1 Jun 2026 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780295504;
	bh=nut7/auHhQh+rbp2DQMRfJ5Ro+4NzjUEZWNJ0Mo54Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OTgy5EWuQvrJ0X/m9axOBlTuBclDwZ8YwGy5P9JGUx+7KRirsSrkIdqVDgsE2RihO
	 gASkUVFu10t3YX0+LGdAgVU0lw1y/9CdBTyhjqypmALTNtoVkwnn9A/QC+bIEfjz+z
	 Lsc3TTjQw4m0s2xoxcOgrb6ZkUnDnFHM4EsoGrq6tsJM6gxKGkUzwIbD12fX7C4jEn
	 Li/MoUvU7GlyJotUiwqZqZLspg6U3Yq+8vAUqMLWgaqUvFjbwYO5ljpZ8bUj/heRn9
	 UemXa5JzmAvts7TVHnfn2RP2xheifxsOfpaFtWsYNR9lj6tnp+4ySdaYavW37uhKWh
	 h9K8PCt8jvd+w==
Date: Mon, 1 Jun 2026 06:31:41 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
Message-ID: <20260601063141-GKA3815935@kernel.org>
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
 <20260530021021.1167953-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530021021.1167953-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_233146_444511_5A0B687E 
X-CRM114-Status: UNSURE (   7.89  )
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

Hi Chukun,

On 10:10 Sat 30 May     , Chukun Pan wrote:
> Hi,
> 
> > Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
> > its associated regulators to support voltage regulation on the board.
> 
> friendly ping

Ok, will take it, so

Reviewed-by: Yixun Lan <dlan@kernel.org>
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
