Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4F5FA374A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGAAEaRYQ5xLgov22MAV/Zo9rdcE1lRLgf9uE43Qh/4=; b=5GI9Uw8cYapnNv
	iHtXT3/8f+ef3vSExVXxvxyjQe1y1BqiDNcUnHcsDxpc9I1CsH+t+t8JXM8osRYJdG+fdgN+hXQkK
	Bvgig9qoWvM91YyUx2EAsUV5dqoL86I/vmCUnUCkV8lbIeGivSvvSko7oWwmTrXfWFbu5488PdOqn
	Ozy2uMGiR20wKi9TOE64A6dANLp5AvU6dulW5bRjdn5AYLfjV6BiFLNtvR8z1iqi8rowGYc7czhZz
	w/ELt/CU6AlqAAWZWaOIlxgqQfAnu1lEXJ/GJpERjvlutUvlISqTy21+vYOmpVQT9rKTyzawKDgYs
	QamXQoaNEI56/oXFhFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5cu-0000000FwLz-1hLO;
	Fri, 13 Sep 2024 12:42:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5cr-0000000FwLh-482U
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 12:42:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3BBA5C055E;
	Fri, 13 Sep 2024 12:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903E7C4CEC0;
	Fri, 13 Sep 2024 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726231333;
	bh=Z458e25P5sMZPiUvcMK90HVD/MY6/klAorNSKi5ld6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2+N+/osF+w+n9MBkQvfOimEr9WFWLtVerEqIJhlgpssLVWlplAJf0TOGfCZcbUZb
	 D35Tffti/f+NY4akk0mTKqJQTzMD6IL7FmSjfdQEI4UuLXQjwCYEF20f8lyeq7Gu19
	 e4h/+fFpgBHweao1PWY5GckFncMwGoyYlSHxhFa4=
Date: Fri, 13 Sep 2024 14:42:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: stable@vger.kernel.org, sashal@kernel.org, william.qiu@starfivetech.com,
	emil.renner.berthing@canonical.com, conor.dooley@microchip.com,
	xingyu.wu@starfivetech.com, walker.chen@starfivetech.com,
	robh@kernel.org, hal.feng@starfivetech.com, kernel@esmil.dk,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	richardcochran@gmail.com, netdev@vger.kernel.org
Subject: Re: [PATCH 6.6 v2 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
Message-ID: <2024091350-lapdog-tarot-0130@gregkh>
References: <3A31C289BC240955+20240912025539.1928223-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A31C289BC240955+20240912025539.1928223-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_054214_084456_0E09923B 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu, Sep 12, 2024 at 10:55:05AM +0800, WangYuli wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> [ Upstream commit af571133f7ae028ec9b5fdab78f483af13bf28d3 ]
> 
> In JH7110 SoC, we need to go by-pass mode, so we need add the
> assigned-clock* properties to limit clock frquency.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Please rework this series and send only what is needed here.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
