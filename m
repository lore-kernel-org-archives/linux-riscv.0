Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DADC44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 18:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGsMdXjbpwEekQ4E9c/XOxJuONb2I99SGsckdxycfSE=; b=CGGZCjmWWb+XaY
	IiJQkBezsAhv/CGrGVQK0U0j1lghTG9t6ieB834aOfCZefdINgn1NQDL8d1kPnkxtixCKvfok+CQD
	kg7GfgiQ3g0aHnnZJGq+qPXDFa0c7jhUrcCCezYtDX2nYOvGND7qz1Pu1Lm37MIF4OcLeN6DaSaqk
	8ndM//KFa+9HmNeEBjVgG+FfxwFFCw/51JIXbmEcmVg6cM30pB6rpA0JyjlllWKh2oQRK4PjPL7Hq
	xoRWZ5D4O05SxNwuOdU6ABMHH7yL+tA9sMLUil61zHB9zaJN3UsF5TyFB/oqDp6Ol5kiZ7umo5KpL
	J9DSogsZS50NfOhAaV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsgz-00000007dxr-2Sw6;
	Mon, 20 Jul 2026 18:26:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsgy-00000007dxD-0Ee0
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 18:26:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B83F437FB;
	Mon, 20 Jul 2026 18:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BF81F000E9;
	Mon, 20 Jul 2026 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784571975;
	bh=wnqo/4rTXG2SoMC8bAmoJtVc4sH9QZg8Z163J5T51G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gyYenkxs0YMaX1o6awP6T4n/gjgxYY0zczRem7hSppBYXnSuQmhw66i/e0WVf0Jf8
	 y67WEWN+a/yGirl36uWVUxu11nRSs3ob6iMtdbnrA9VgQPbAWbM2bbGDi26y9Biwjb
	 YcaXJUuXro+uU1dwzjZ6XD6TLVAoo1PLdnhAgfvuZqbmF74o4oxSQgGg4eWhQS3Lb3
	 YR69Sj1wui4NQfavVuf7iws7yl63dXsOLLXUYF+eTFbqaLJiejfQYfDtpbtYufdCth
	 ywlbAZPbRdem9fr4AnLut/dPIMPrf8dFfFNhcUn1/glNUufdOnM2ISsSltdMTIKp6r
	 ogiBrtt333D+g==
Date: Mon, 20 Jul 2026 11:26:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 2/5] riscv: dts: thead: Add TH1520 I2C nodes
Message-ID: <al5oRSbVEzj3M0gm@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-3-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-3-zhengxingda@iscas.ac.cn>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, MoeLeak <i@leak.moe>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 03:45:12PM +0800, Icenowy Zheng wrote:
> From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> Add nodes for the remaining five I2C controllers on the T-Head TH1520
> RISCV SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
> [Icenowy: rebase and reword commit message to exclude I2C1]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 50 +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
