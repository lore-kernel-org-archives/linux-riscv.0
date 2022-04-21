Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE52C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5I17ta8fcRbQoGcnSNZrB0EYYMV7bm+KQBmlKm1Y80=; b=ZrCx3z59YSJoCy
	LilTEAOBZVuP7Sq0xJFFWZqKvkTlc+f+O9/Ry+SZZ2fS85UZrGNu8TMQMaF9ZjGNZIMsDX7c6EKdl
	xwIPjfMraGTN9hVS5nMG7m1Kh2Ij0DD4rMgNbgKq44Dj0qc3PRdGgqihmNPNG4X++mElShIxZzpht
	LPizeBRgCw4dJUelnnZhpeI72eS2KAkDXDkX+Gvulq7RTX8sfzfKqCDPIcGimKjApzp3kFHfAqzg9
	xtGbc2Nj8rh82jtVoutT98uZXQv+jg08QUznwG7ophBBJH0z9VJ+0UVDwJuF4dZrvM3wKbZwF3emL
	zeCGFaAwOnLvj2V73d/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRYS-00CBAB-Nq; Thu, 21 Apr 2022 07:48:44 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRW7-00C9gf-S2
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 07:46:21 +0000
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2f18982c255so43324027b3.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4gF7v+u5qfekoFHMTILqb5HQnMHDt0hFlVj2XdsKKGE=;
 b=p1/u3kRmGTnPOnkOOYHSHuQuprla3aEGkJM1K20hYwFiIcBqtKc8VZ5l2RYVJX8A19
 xDqvxne87HNMxNiF/dFgkyNtZWuGxIAzJPoYazLlAhwfunLUwzSGyXwe9h3le23C1XKz
 9Rm0gOpg1RJAm3H+I9rU67mXH+7RdBIXEjYuZZZrFG7eDf1NcsdALI8gggv1co40om14
 sBnzLmEEjUav4hVb6RZY9DZb/Zaijxj3m95TY3JVFci1wpPjxlqCix8EPglReA6rgVw5
 Np+axScD6ngbpMakuKFgSdoJmpPGGuVL8M4GuUteGZJIdlgE2T9V3haFR9OfLJx03l/h
 9OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gF7v+u5qfekoFHMTILqb5HQnMHDt0hFlVj2XdsKKGE=;
 b=kPOSvbOQxJ0WNW2IQF0D2R/7BLJrFzmX8y+5JzULoA8iXXxN1QYpOWvR3qaizkjpu9
 3YrbLq2FTEMhnI0WJuFjiFBovTLNM5IaI3J3DDS8AEMZ6ALBErc8FWwVKvxBCwd/4AIB
 BpKfVv15cafuenmKrzoIvfhdtu10Dvnp6DsdvKnnOrWFJQQcFYRzSapuN00Wsrrx/5wM
 BCFIJ4XV8ZZInF7AbEKd9nmQ/WmBK8LVitpuR+jkYaY+OqjaOyujp/10iawVN+oLIXwr
 ykkC860xCdiXR/33wd3c1I37lwCg1MORqOa1h7Uqno+z7jsvmneCORTaGFTVkrkSvN/6
 hPjg==
X-Gm-Message-State: AOAM532Z5+XUIxNI+HT+ozxSkcu4rE60VcPf3qK9myH39g/agfLrHt7E
 f/HtAS0owj3pVBz41X9pnjrs6Scw9QSNcqgKa3I=
X-Google-Smtp-Source: ABdhPJzQrF1xp8NXrzFDvpdgsCnONl8jgJLemRqlmq6FO4deZtH3gAF9dhs8jOdAoU/wyLB1x/pba4wdzIvSpXBh1Fc=
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr24596938ywb.132.1650527178014; Thu, 21
 Apr 2022 00:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220421065401.9303-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220421065401.9303-1-krzysztof.kozlowski@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 15:46:06 +0800
Message-ID: <CAEUhbmVBM1PG_6amTU2OCCNJDiTd6oKEJCGGv=2DOr8hOw16xw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: fu540-c000: fix duplicated dma compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_004619_938667_134EE5FB 
X-CRM114-Status: UNSURE (   9.97  )
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

On Thu, Apr 21, 2022 at 2:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Remove duplicated compatible to fix error:
>
>   u540-c000.dtsi:171.4-42: ERROR (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property name
>
> Fixes: 7eba954a8de8 ("riscv: dts: Add dma-channels property and modify compatible")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
