Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD43F54AAA
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVItpMC7iHb0ELqaEbt7ax4bx2CSV5/bmPPyx4ACBX8=; b=DAitZKqQPdYY/y
	+xKR9DoMEHkRQrz/emMo+GnCdrduQOj5ui6kWx6b8+OdpufmHslA7Q8ekcKfK95vyc2+4FsFQJ0Hb
	QmWkdlX4fAmjiQAdenvJoV/RhGlZM18kb8xZiMtf7oZszOA6SjoyafvzqG9cGjgamLdYaqPV8ujqP
	sH2iFhgtywtQRW1yjveC8tq9Ebex4dD4KlWPzol9OIXr+Q8LTeLtMiDQQkl8gOFxn5zTH6BAS5CNU
	C4xc1xnDjou1yCnjbrN4/haQm1pQLifOc5J/ySd1ub0V4U81gEaZnZ3Xsh6BnYs6M7GjxvN7falb3
	7dXiPF3Jyu47NfxT73cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51QA-00000001UA1-0VSa;
	Tue, 24 Mar 2026 13:03:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Q6-00000001U8q-05JK;
	Tue, 24 Mar 2026 13:03:44 +0000
Received: from duge-virtual-machine (unknown [183.192.222.244])
	by APP-03 (Coremail) with SMTP id rQCowAAnSeCTi8JpkXyqCw--.7469S2;
	Tue, 24 Mar 2026 21:03:16 +0800 (CST)
Date: Tue, 24 Mar 2026 21:03:15 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: robh@kernel.org
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC
Message-ID: <acKLk3fbIj7hdsWr@duge-virtual-machine>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260121145526.14672-3-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121145526.14672-3-jiayu.riscv@isrc.iscas.ac.cn>
X-CM-TRANSID: rQCowAAnSeCTi8JpkXyqCw--.7469S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1Dur1DtF1DGF47Xr18Zrb_yoWkCwc_Z3
	ZrCw4rCa9xJF9Yqw4qyFs2yw1Yyw42gas7uF1qqFn8Gw40krs8Wayktw1ayry5CF4Uurn3
	WFn3Xrn2gFsFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [183.192.222.244]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_060342_429150_782DE1CC 
X-CRM114-Status: GOOD (  13.02  )
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

On Wed, Jan 21, 2026 at 10:55:23PM +0800, Jiayu Du wrote:
> Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
> for the DWC2 IP which is used by Canaan K230.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>

Hi Rob,

Will this patch2 be applied for next?

Best regards,
Jiayu Du

> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 6c3a10991b8b..352487c6392a 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -17,6 +17,9 @@ properties:
>    compatible:
>      oneOf:
>        - const: brcm,bcm2835-usb
> +      - items:
> +          - const: canaan,k230-usb
> +          - const: snps,dwc2
>        - const: hisilicon,hi6220-usb
>        - const: ingenic,jz4775-otg
>        - const: ingenic,jz4780-otg
> -- 
> 2.52.0
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
