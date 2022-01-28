Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A674AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FU5qZ5f0WmxVKtFjSRUHPn0veWf7lDlrhScMTRetHA=; b=nvoxdPyXG3rX19
	2XpsejGIu1/orgCuJKSP9YaWn76Co6UeXsfOBhOhTPNn2rQSRQpvz86FssJCNA9CdC+cdnMTkpmeg
	2+gtQbcVuA/4ffXRgkUnCSdaoYbxCTS9y6b6dtvQ2kmhMfQs3fRuWwyE/Q1AL9CoEwRM9SyRB9rdC
	NFhyhiLtoUX/yVvDqnc3aOYX0bE1kiAaymTEFi0ZhBlu57Q1j/FHDZsc4e9Z8yhaOD0j1gee4lFQr
	hT5o+0WLbZ+mVYeIXTf4WFrE3eJM1096m2+SXi0PyJUDOq4HaRDBhuvUxVCPNsWNEugbaqIS3SaBx
	V0JK1EzC4wifRRIiNfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDRRM-002N0I-4X; Fri, 28 Jan 2022 13:37:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDR7E-002EuF-7m
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 13:16:37 +0000
Received: by mail-wr1-x430.google.com with SMTP id a13so10818836wrh.9
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 05:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BHcagqEkqEykMyyD1xqLGjKIFp6BT1eCL4LXbv7aRtk=;
 b=z1z4u2VR4nMLNcfMJQxbE378w1Bkvo+bQ12eM82xrKedNFu09LNRo7PtbYC1YT/sKn
 BMKP/Se1i9xSMY3zMzepRXR0gXeNa/6MbH1tu+aJ+TBwTVxyp75vMC7XPnyfwKglLeIS
 eXMvLY2mQvN/3j6RtTuOnVRdBsRMJFbzLDgl5xu5U4X2tQEaYKd3zQzGUlGOUC5pHrCp
 tpp5Z79F3+lSJ3VVbaJw5YGBStBUYTmVM85JmZbmf9nu7mj+gQmVkEttd78esru7agde
 ej3MhA+QzWmuSD6ZHxv2SrfivSYAXHflcMXgQTiHjAhNUTxfA1VHL3HPqHAog/Q2k+nO
 NgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BHcagqEkqEykMyyD1xqLGjKIFp6BT1eCL4LXbv7aRtk=;
 b=xKSbp3J204jipMWb7GGvrGBopnTtXdiIggu2Yfg7pZqb5vJ2tc4BACH43iEjZHRsl6
 tep5YsQW6BVIih9X9IJqX7pLRTfA5h0H3xuP8fTbEH0t8bq+3o6/VYvyHTR4sRByNxKb
 /FG+FLV0aF8zV79qtYRsh971PDc/dLLSxpGThb69pWsmnwhNV1apN1Dfu+k5jX+Y6JDX
 cErQGQTEy3DupzgwUk8lauaYT+26Y8LMyKOR1Sk5nktmTn51bq433R0sNc+WYsshopBJ
 hV1DrZYXnpwh6AsBEaaDMqdhcWWia2U59u/kqw2b1/XPaZC2+ARrANQ5eEcN5SeCo+dq
 gnSw==
X-Gm-Message-State: AOAM532ukajAYUJU/oY3wZ98RXv4KFIVW3/Di8HCC69dAT50GIGmQ3/q
 /JJV5C5Ct2im31CyHBzuysDgJSuJ004NngB4WILY0Q==
X-Google-Smtp-Source: ABdhPJzA3jkPCbW0m1A2rMkTINirAStcdud8umRS8/GKCdo23UjL6ZBvlx5/0/v4gLHlo2udk8QVh6ji0A7krqXzCYs=
X-Received: by 2002:a05:6000:387:: with SMTP id
 u7mr7204296wrf.214.1643375794752; 
 Fri, 28 Jan 2022 05:16:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643360652.git.geert@linux-m68k.org>
 <e6a4c5b20d2acb52125d7d6e6c7e3694d7cb182c.1643360652.git.geert@linux-m68k.org>
In-Reply-To: <e6a4c5b20d2acb52125d7d6e6c7e3694d7cb182c.1643360652.git.geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jan 2022 18:46:23 +0530
Message-ID: <CAAhSdy1+aWmNZJxxDS+tVHeOjGdLH6ALXLp4X6+tgZu+HS1d9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_051636_386855_3D89AB38 
X-CRM114-Status: GOOD (  18.17  )
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

On Fri, Jan 28, 2022 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
>
> Fix this by adding the missing "maxItems", using the architectural
> maximum of 4095 interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v4:
>   - Use architectural maximum instead of practical maximum of 10,
>
> v3:
>   - Add Acked-by,
>
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 8d5f4687add9e81e..fe4b73c3f269fc0f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -44,6 +44,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 4095
>
>  additionalProperties: false
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
