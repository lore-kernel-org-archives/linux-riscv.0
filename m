Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BDFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srqf5V/en2GsedhNJVtTe2tU31sc66JBkpjD2mLwL78=; b=Ljb4L4NwOF2xbh
	cJvd4u3nz3nHogt0rhMDsTcs8tmtbq8LxQyRGuc5RNKJ5zQ1RrPu3kkBiPEBLSMJgyL/jfUVg0zB+
	NV/hCBSvcgf9aVyWnvxC/AlwO2ZOGorvRWXLzTpZgSsEAXdFaqJxT+e3OYUFxHsU+OJpS9Xldr1b0
	seRJOV89T5jvprGrT4Zq8hvwbxTQRkrT4XUFdRnKLB547UfMYorSM+4YRZ4B/YiVpETwbbEJpVccB
	/7SMZjPFoaLmlFoyiXJurGbK0bncf0ZnKUQjuOI5xiIuKhwt6ZVo86V1U9iHN9O5CmdNA4MB6Bat3
	Jui9/Q6jK+OT2xfmx5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kh4-0044kR-Up; Mon, 13 Jun 2022 14:05:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kh0-0044iC-48
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 14:05:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o0kgr-0000p1-1u; Mon, 13 Jun 2022 16:05:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, palmer@rivosinc.com, linux-riscv@lists.infradead.org
Cc: Conor.Dooley@microchip.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, linux-mmc@vger.kernel.org, paul.walmsley@sifive.com, atulkhare@rivosinc.com, support.opensource@diasemi.com, andrew@lunn.ch, krzysztof.kozlowski@linaro.org, stwiss.opensource@diasemi.com, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org, Conor.Dooley@microchip.com
Subject: Re: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Date: Mon, 13 Jun 2022 16:05:12 +0200
Message-ID: <2247394.ElGaqSPkdT@diego>
In-Reply-To: <ee29eefa-9206-b84a-e27c-4e4388865db0@microchip.com>
References: <20220606201343.514391-1-mail@conchuod.ie> <20220606201343.514391-5-mail@conchuod.ie> <ee29eefa-9206-b84a-e27c-4e4388865db0@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_070522_218246_00DF5C68 
X-CRM114-Status: GOOD (  18.93  )
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

Am Montag, 13. Juni 2022, 15:33:49 CEST schrieb Conor.Dooley@microchip.com:
> 
> On 06/06/2022 21:13, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > After converting the pmic watchdog binding to yaml, dtbs_check complains
> > that the node name doesn't match the binding. "Fix" it.
> 
> Hey Palmer,
> The three dt-binding changes were accepted - do I need to poke SiFive to
> ack the dts change or are you fine just taking it?

I don't think a node-name has relevance to vendor decisions ;-) .

Looking at bindings/watchdog/watchdog.yaml we clearly see that
the node name is always watchdog or watchdog@foo, so this change
is clearly correct.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> Thanks,
> Conor.
> 
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > index c4ed9efdff03..1f386b07a832 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > @@ -90,7 +90,7 @@ rtc {
> >   			compatible = "dlg,da9063-rtc";
> >   		};
> >   
> > -		wdt {
> > +		watchdog {
> >   			compatible = "dlg,da9063-watchdog";
> >   		};
> >   
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
