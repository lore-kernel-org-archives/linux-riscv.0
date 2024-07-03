Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080CBC30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmw3CLgKDk90vkN7sA1q5+UmXm7sfOHrK8oJ3UNWgro=; b=IJe15R1vRd76kh
	8+DN3d01Z609OSuqglOoSxp1tMUK+FOaYOOnrdd1oxvk5S0AowzA2nQo20W/I70HPOP0iehQffrOn
	WZGB+gKMTdnIpscylnzskmvlpo9A/QHbljwfthBrWf237Ldt14B06XowoeDkSnI2wKKuJRyL73PtA
	qMMLA6d1rGruigoORmMPOOGmof8KKox9r9yXwhllVnPlCYq72d46dAoHIR+a6prlHzPB4f+xNzL2K
	dVAgLXhOy33wE2izK3lMriQSofYTpfZNDqKhQnTp6uQ9znW2hbd8OgthokdhJFVD2+OCqsYeWuOkW
	oAZn7gedYdnivIDIRBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1cI-0000000Aci5-1dcX;
	Wed, 03 Jul 2024 15:09:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1cE-0000000Acfk-33z1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 15:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720019388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OwJT/oF0rqnt+S31sg05vpTbadEupYIHlD2ocZCHgDI=;
	b=e52F586NIB84ITfcy2V8nSvLTtElmJHPUfmPuuDiZd9zwPiNVk1909O1xNXgGTzV8Le+fH
	NfFAbc7XZZDP6ym/1mQt81SWERqw/d1OeHPN3skISyh8yjK4EOlfgPJwLOywaShql0/OFx
	kkwLXl5vT8l40vYZifvcvwpdCCsqzEM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-6Po5ZbZtNjeQaihzZwYgRg-1; Wed, 03 Jul 2024 11:09:47 -0400
X-MC-Unique: 6Po5ZbZtNjeQaihzZwYgRg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-446102c711bso65942541cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 08:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720019382; x=1720624182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwJT/oF0rqnt+S31sg05vpTbadEupYIHlD2ocZCHgDI=;
        b=unx3bOyDsjr3OLrlX/h7NsznBIsabgRrjsu+eeXQLXrDpTb+QDGFFNLNDjQUStYAwA
         K5cNU6h2jOIZTN7xhs3/8YhbO/mAhiNowS6nGsqZDufWgPeHTGRi6QnynyOJCM2gZiRu
         Q17LYVzXVybAYfTiXsx5dvbLPyh8uQvcQxK+voG6K5aFaUkjgr6OvsdMt3ody+DqQY5I
         lyeEDyNEjpAikAi3r+jafHGmsVkE9+LA3zfB2ourp0TyKsuUb4pmJEp5JJIGi26jcsmA
         dsGXzudpL2BvF2+bqcOo7Kdmz6B44JRicjOrMydzSHRU3e2zM9FZOUio/RvJhs0fFKKE
         t12w==
X-Forwarded-Encrypted: i=1; AJvYcCWeato7rY7kXwOFUKpou1Dxx3y1QTNlx0mIumJUaK/jZ9N4ojQ/ny59BeNyNCP7mT63qAAbF5hBcyUc3EiYlVX1LOMdKvrfAgHIAQfWZRtO
X-Gm-Message-State: AOJu0Yy34DE+I0PVxrYKwfdHmPvKJx9AuRQz3lDPCB9MWRyVNluct0xM
	HXpECfyKFCs3155iaHedasDfE5sh02dd3/8O2ehe85DhGEYf/x4/rZRcXuK5Kr6n3edByJmTjZ8
	BM5fNplrIZcnRQS3QdRZS70/6cEh+Sg0g60HJ8o0sMVRcAaQov5Ppk1LIbKe9yPlHEg==
X-Received: by 2002:ac8:7d84:0:b0:444:b495:e94d with SMTP id d75a77b69052e-44662c99f4bmr119753211cf.3.1720019381988;
        Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8jWmpy5/3+Y1qV1pkAlEofbtK+RF6spB2E3wXQKII8gdILaaxSAxoLFic14g5Q4iTwcc7CA==
X-Received: by 2002:ac8:7d84:0:b0:444:b495:e94d with SMTP id d75a77b69052e-44662c99f4bmr119751991cf.3.1720019381501;
        Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465c4bf7ecsm43222571cf.80.2024.07.03.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:09:41 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:09:36 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, jassisinghbrar@gmail.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, manivannan.sadhasivam@linaro.org, will@kernel.org, 
	joro@8bytes.org, conor@kernel.org, tglx@linutronix.de, amitk@kernel.org, 
	thara.gopinath@gmail.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, rafael@kernel.org, viresh.kumar@linaro.org, vkoul@kernel.org, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	robimarko@gmail.com, quic_gurus@quicinc.com, bartosz.golaszewski@linaro.org, 
	kishon@kernel.org, quic_wcheng@quicinc.com, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, agross@kernel.org, 
	gregkh@linuxfoundation.org, quic_tdas@quicinc.com, robin.murphy@arm.com, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	quic_rjendra@quicinc.com, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, luca@z3ntu.xyz, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, bhupesh.sharma@linaro.org, 
	alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com, 
	netdev@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	krzysztof.kozlowski@linaro.org, u.kleine-koenig@pengutronix.de, dmitry.baryshkov@linaro.org, 
	quic_cang@quicinc.com, danila@jiaxyga.com, quic_nitirawa@quicinc.com, 
	mantas@8devices.com, athierry@redhat.com, quic_kbajaj@quicinc.com, 
	quic_bjorande@quicinc.com, quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, 
	quic_tsoni@quicinc.com, quic_rgottimu@quicinc.com, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, 
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com
Subject: Re: [PATCH 29/47] dt-bindings: net: qcom,ethqos: add description for
 qcs9100
Message-ID: <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240703025850.2172008-30-quic_tengfan@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_080950_890039_8EA76694 
X-CRM114-Status: GOOD (  15.87  )
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

On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
> Add the compatible for the MAC controller on qcs9100 platforms. This MAC
> works with a single interrupt so add minItems to the interrupts property.
> The fourth clock's name is different here so change it. Enable relevant
> PHY properties. Add the relevant compatibles to the binding document for
> snps,dwmac as well.

This description doesn't match what was done in this patch, its what
Bart did when he made changes to add the sa8775 changes. Please consider
using a blurb indicating that this is the same SoC as sa8775p, just with
different firmware strategies or something along those lines?

> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 6672327358bc..8ab11e00668c 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,qcs404-ethqos
> +      - qcom,qcs9100-ethqos
>        - qcom,sa8775p-ethqos
>        - qcom,sc8280xp-ethqos
>        - qcom,sm8150-ethqos
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3bab4e1f3fbf..269c21779396 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -67,6 +67,7 @@ properties:
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
>          - qcom,qcs404-ethqos
> +        - qcom,qcs9100-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
>          - qcom,sm8150-ethqos
> @@ -582,6 +583,7 @@ allOf:
>                - ingenic,x1600-mac
>                - ingenic,x1830-mac
>                - ingenic,x2000-mac
> +              - qcom,qcs9100-ethqos
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> @@ -639,6 +641,7 @@ allOf:
>                - ingenic,x1830-mac
>                - ingenic,x2000-mac
>                - qcom,qcs404-ethqos
> +              - qcom,qcs9100-ethqos
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - qcom,sm8150-ethqos
> -- 
> 2.25.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
