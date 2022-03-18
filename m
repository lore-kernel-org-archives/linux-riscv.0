Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fM//+lxbRH2OM76jxtWjBBHRDRTRNTX1aiulL84YCk=; b=2EqMD5ZCGozlj3
	KxRkkth8/cwlLrMkME1W5dvnTk6gJDtNJM6Yezz1JjIbsshnMX39l3q0KpkeU8QlXy22wpJZAu60/
	vTFcK4i6sICupHSgBzHT78u3B82f7YFTAU0wSfd/75jX5dofpzAwj40wtWC/arlxid/ZT9zEWHTJK
	ArBZVmXld/h0mLz586m51zFCH3zLKI1BKI4G6/KMWFOpz9lpmtCXbDaeyhuuhmehMOvqhxHjPAOid
	IaY1aXO/YX7VcQdz2OUGRI0DOMNIFcpGEBC/qKnhRUEPQW9qvP/1f7lPW8+wE9ZBxa+cx1bEy4rzO
	xQW6dZedgouekF3Z+PTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV7Po-000hbK-RL; Fri, 18 Mar 2022 07:52:52 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV7Pc-000hY7-6b; Fri, 18 Mar 2022 07:52:41 +0000
Received: by mail-ej1-x634.google.com with SMTP id bi12so15448293ejb.3;
 Fri, 18 Mar 2022 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A3PDqBaBritnZnP7hEtDx3b+3Mek9k1rJJXE3rj2Zy4=;
 b=ZhK7KU7qoYASv+l399eftSrF3wUXJ5oaN/qiNPQfLwsgtl9bq6qAPmuIwnb6gPn0ZB
 Qka724KGz5X2BfT0CpVuVLiUFF6ErQL4S44sSA2EAHDb58EiOtR+X0JhcrDOIOXDr7gZ
 24X0jJU6Yly36s/6hxxD/++HUaP3eTkFSPpOuS6E98ndLpNpbRxSjVUp4DiS19ZWMUMu
 GEZLON/wlJbHOJMBnDmO0miYuxztYiWcHQnwY9dXE4YRoHuXNZcfcHE6q90S0W4vd2s/
 E5402c4bkMQiR9GoAj6vmeD+s0x6iiyOSxfREREz7Q0DFX+fA5A5h/8+7LQmFhYyPip0
 XHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A3PDqBaBritnZnP7hEtDx3b+3Mek9k1rJJXE3rj2Zy4=;
 b=FQ1l6eL21+yu386RGRyEmnYmm0DZaHwd4is5Yu/mSAdWEL8oaYFWK8+XG1ps7yhQ1W
 RFGrkYdTjHfU2DeID1oNfao9iWFxdociwkhsARbCufh0MWpQBOyR6bNbCMqPdRbcBAus
 CEAWYQl+/YlBifbcwrGIm5scy96JWiLQiTp4+A7LdC+CpRWvdIxHlGuY1MIZTrmY1fm+
 nJCISV5c1Zmyc6Fa+nXwQc/K29yyicUrun9sw7CIs/6o2XR6+ZFDO0dXBqc6K8+dSaLo
 38D2pYblEvPocf426REzmWP4rp29wPNH4FN5ejtzGTrdKCQKx3vzqe4nJt1PzHiuBlqu
 ctqA==
X-Gm-Message-State: AOAM531oa6oAxXiBYqFFUk+VKscBzzkGBzjoAuTDsVhxBdN9SvSZ0SZy
 KYSzdlBgQi03kAH9QdBITc0=
X-Google-Smtp-Source: ABdhPJxVj9syTlN4gCx31UjIIGZaW675Iq81FFnD2LS0OTRzGHNcwcEKjUsDvxcdNAmVAaJyTmZAmA==
X-Received: by 2002:a17:906:4fd2:b0:6db:21ba:e434 with SMTP id
 i18-20020a1709064fd200b006db21bae434mr8090239ejw.714.1647589957791; 
 Fri, 18 Mar 2022 00:52:37 -0700 (PDT)
Received: from ubuntu2004 ([188.24.153.122]) by smtp.gmail.com with ESMTPSA id
 qw7-20020a1709066a0700b006dfa04dc2a4sm1534847ejc.56.2022.03.18.00.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 00:52:36 -0700 (PDT)
Date: Fri, 18 Mar 2022 09:52:30 +0200
From: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, Michael Walle <michael@walle.cc>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>,
 Bert Vermeulen <bert@biot.com>, John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: Re: [PATCH 04/18] dt-bindings: irqchip: actions,owl-sirq: include
 generic schema
Message-ID: <20220318075230.GA15068@ubuntu2004>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317115705.450427-3-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_005240_277565_A254716E 
X-CRM114-Status: GOOD (  16.33  )
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

On Thu, Mar 17, 2022 at 12:56:51PM +0100, Krzysztof Kozlowski wrote:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Thanks.

> ---
>  .../bindings/interrupt-controller/actions,owl-sirq.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> index 5da333c644c9..c058810cf475 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
> @@ -14,6 +14,9 @@ description: |
>    This interrupt controller is found in the Actions Semi Owl SoCs (S500, S700
>    and S900) and provides support for handling up to 3 external interrupt lines.
>  
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -46,7 +49,7 @@ required:
>    - '#interrupt-cells'
>    - 'interrupts'
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.32.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
