Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44079ECE57B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UP8ur4bzVhCYy2MMgaXhHhwptjd1KbFNRiB2vPQ+Q4g=; b=FGrn3CSuQaV9wr
	aUQoRYCCtxBEDy2EEl18VDVTPbgqXNNyLHtVImdUgdmPmJkye7dVzUAGJqjpt93fOhZvjPRn93NLO
	h8/tejXpK4FJD1hmcvJudcHKUjSrbl/PTR7fbG8kWTxS8L0tT89JLDuX/s3rcIFwE9ByrHuBdaMGO
	NolYPY3T+SzD7hgfS9FXss3bTjlc8n6DFJIqfbTVqWqfVogTuYp6dWbkCO+Fj3kPi1HbtHTcdtRFd
	/1JHPNXrBGBA72PgaKcUiM5muMWLgGsQW7BGT8UqfRpIF93KrvNBBSDTSw+UveBb36M2xa/IVRY70
	ooEC7pQsTEyGrybipGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhwL-00000002mG3-0BYP;
	Mon, 09 Sep 2024 17:12:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhoj-00000002kcQ-1tby
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 17:04:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ACB99A41A39;
	Mon,  9 Sep 2024 17:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2BAC4CEC5;
	Mon,  9 Sep 2024 17:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725901483;
	bh=OfHok9I0g2Q9pMsZai4NU4WsEMttyfpengP9eJGtiwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqbQoK1VDTk69prxzGdAo7gvxCiuQXmxKp+svunOCTKnsusNVX6sox3PDaIn1GQCB
	 n+N6th6fIP9AOg5OwMjkJfqwVdIbvAcnCwAVX+bIBaqzQeogEQQhkVWkSJJ7Hj7bBD
	 qFpRDbbd5lfowqBDHfZ3rYHYB8fXusr6RaVhSXH0=
Date: Mon, 9 Sep 2024 19:04:41 +0200
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
Subject: Re: [PATCH 6.6 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
Message-ID: <2024090915-footpath-agenda-5a55@gregkh>
References: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_100445_576421_CFF5A036 
X-CRM114-Status: GOOD (  10.18  )
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

On Mon, Sep 09, 2024 at 03:46:27PM +0800, WangYuli wrote:
> From: William Qiu <william.qiu@starfivetech.com>
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

What is the git id of this change in Linus's tree?

Please fix this up and resend all 4 patches with the needed information.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
