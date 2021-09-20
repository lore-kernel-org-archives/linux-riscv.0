Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E191C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 22:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59DC7603E5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 22:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59DC7603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mj75qyGB1i6qz5tPw6QQuA6gbv+quuXr9aYRMxNhIso=; b=nnTkkF2MsqacvD
	2lrkdo3pQJ4DVe6k9RJTBqgGGElp7pYD/3wzIlHXQruhDG3mIw85LIh/fqhug48GydYzX/fE94B2e
	Eh45dQw1WLOwNL5Z+ig7+oxsoEprXFf1cUWc6lqi3JFRt9Ohxw7F1RI6EbeVVjryLwg2vEn+U5KJi
	uJR9DVoFcHaGH7z2+J0WBomIOmLaeRYlgGDY8rlNMN8ciGDlDLeCgXL8LlrDpSj68WXZqZb+xsDl8
	qyst5uaVPfvSIYgwyL8Yaowh7s5VTDJSzmXsiMPO3ib3LDLA4DIsSxslk5vmGZP+KeBbN95HR9+DD
	A6cEISYjGseUcy+pCyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSRLO-003Dl7-C4; Mon, 20 Sep 2021 22:00:58 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSRLC-003Djq-EE
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 22:00:47 +0000
Received: by mail-oi1-f182.google.com with SMTP id v10so9628783oic.12
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 15:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85k2h7hTnCn74TyVn6/B2+2QyfK04Tc6eq2dn9dH2gg=;
 b=PX1gLbUgKcDgnDUL2wfKW9GDfuGyfFfyKLmCKwQqj8ARBDtRmX0LIRvWRn71bDGPln
 fhIy4Eb5dS9SJpzrkK2obpCUIV5P3GtfXtV6xobQix57RElFIv/Hud3Dey5tk516nhkL
 zVUSsre0GZN3qi1g+l9YSCB+GYGDc+YlVYz0i2UTeN7yKcdROGLr5a2SjOYHTsdKomoB
 peWbGYF+Jkhfpk6QawQuddha70v6eTxoS2EXgoqXxs62e1jhedQyrL5tKu8uSKpJk5hm
 E8LqGfTTEPmf6YN5JlqRGSQ0xH/pwlLch/QL/rJOYdjaZSi2CzMrjYDNw61LDWGY4OvG
 9kZw==
X-Gm-Message-State: AOAM532aEv81htOMmgaiKtkxYuKpsL0ocbcHy5Gy8uniAQgczTit7D7+
 KGNHgJiGMAXtWXqNYV11Bg==
X-Google-Smtp-Source: ABdhPJxot0dlqDRaMgzpZNc5Q01aOjO7eJzgFh12vVttfBsXxGXI67HiP+rpBqxR94tEcHUvm/dPyA==
X-Received: by 2002:a54:4e1d:: with SMTP id a29mr1003635oiy.7.1632175240929;
 Mon, 20 Sep 2021 15:00:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w8sm2666505ots.25.2021.09.20.15.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 15:00:39 -0700 (PDT)
Received: (nullmailer pid 863268 invoked by uid 1000);
 Mon, 20 Sep 2021 22:00:38 -0000
Date: Mon, 20 Sep 2021 17:00:38 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND PATCH] dt-bindings: riscv: correct e51 and u54-mc CPU
 bindings
Message-ID: <YUkEhi+SeLN4539M@robh.at.kernel.org>
References: <20210920132559.151678-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920132559.151678-1-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_150046_534785_F382F3EB 
X-CRM114-Status: GOOD (  14.49  )
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

On Mon, 20 Sep 2021 15:25:59 +0200, Krzysztof Kozlowski wrote:
> All existing boards with sifive,e51 and sifive,u54-mc use it on top of
> sifive,rocket0 compatible:
> 
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: cpu@0: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['sifive,e51', 'sifive,rocket0', 'riscv'] is too long
>     Additional items are not allowed ('riscv' was unexpected)
>     Additional items are not allowed ('sifive,rocket0', 'riscv' were unexpected)
>     'riscv' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Hi Rob,
> 
> You previously acked this patch but I think it will be easier if you
> take it directly.
> 
> Best regards,
> Krzysztof
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
