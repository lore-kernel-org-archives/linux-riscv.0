Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC431099B2C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlJQ53h3dXLrGGMMjHyeDvSlLBgxerRW6WaEi1uxFNI=; b=qTChzQGmH4o+gv
	zcIWstNlMjBN6w/mAhqAdF3MyQfUSlEdaSFsGIJnEBtGw1pMyhre34bKOPkIelHGROOK6hJj5Lu8S
	ZsZmVbKfvytrTVWEKoIbYIUWAB+pKxUKekXpypTUVmZT5p0wbz3GIRdvp0YDabMbbmiLeUM+J92OB
	90Xo63oe+BiJ5Nf2l9bfOgrYE0rQB2VXKsMs1MGTORdJy2A3JpwYimyGhGJaDSFZXqOr8ypviMNrS
	WVS1sXoqitm+85XD6TZqLmM2CR7mRsjw8aZGFK6PoEoq/LXvvAnOLxIEWFIRgWbotO5GqU/OaE9QW
	Zu4ez07kYHt3PoKvGvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dcR-0000000DF9w-1s4U;
	Fri, 20 Mar 2026 17:26:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dcI-0000000DF6x-3GSk
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 17:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D21E060130;
	Fri, 20 Mar 2026 17:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D6CC2BC87;
	Fri, 20 Mar 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027593;
	bh=TCBFXsphVvwb9Dg/wEdcC11+4vRR3UYnV1stt+8g40o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlSkPjNNOb/+Jo9X0CCO//QoRS1cc+hL4KH2yaDLPRTWGB1cx14CbMbnZE4WJc0rn
	 mTBRE8McDmrW9Ldpd10K9KaO8gmUsdTW5R4s8lhQoMiVmoY9t1us2FSttu4bqjcb90
	 L6FHcWByw1pgtb5/IObFe0qIOqWQZ0G2+SjQh+VU6xY8pmqGi5uqSRBFF3/yzRzVfn
	 FoWVPewN07UHsXCEs5JlxG/Lq/bn8xoZbiDRmqFYanmyMqxAytr2EX2+tpkhxBBbYH
	 OcJqNLKh59G0kOAImjNqTBmqla5wPtAtlPZkfA3UVXgCOy/22sOf+1K9l8oGP9K36W
	 +XtOpp5lg9m7w==
Date: Fri, 20 Mar 2026 10:26:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 2/2] riscv: dts: thead: th1520: add coefficients to
 the PVT node
Message-ID: <ab2DR5v6DoqsFmbj@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-3-zhengxingda@iscas.ac.cn>
 <abWTh/HkVAiIjInt@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abWTh/HkVAiIjInt@x1>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 14, 2026 at 09:57:43AM -0700, Drew Fustini wrote:
> On Tue, Mar 10, 2026 at 12:24:57AM +0800, Icenowy Zheng wrote:
> > The manual of TH1520 contains a set of coefficients a little different
> > to the driver default ones.
> > 
> > Add them to the device tree node of PVT.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > ---
> > Changes in v3:
> > - Added Drew's R-b.
> > No changes in v2.
> > 
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index bd5d33840884e..2160c8b6c2261 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -753,6 +753,10 @@ pvt: pvt@fffff4e000 {
> >  			reg-names = "common", "ts", "pd", "vm";
> >  			clocks = <&aonsys_clk>;
> >  			#thermal-sensor-cells = <1>;
> > +			moortec,ts-coeff-g = <42740>;
> > +			moortec,ts-coeff-h = <220500>;
> > +			moortec,ts-coeff-j = <(-160)>;
> > +			moortec,ts-coeff-cal5 = <4094>;
> >  		};
> >  
> >  		gpio@fffff52000 {
> > -- 
> > 2.52.0
> >
> 
> I have applied this to thead-dt-for-next:

I had removed this due to missing binding in next. However, it is now
again applied to thead-dt-for-next as the binding change is now in
linux-next via the hwmon tree.

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=a7aa874b69460896349985833059a764e688f1d0

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
