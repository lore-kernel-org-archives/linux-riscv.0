Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F7FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82nYwq3g2CebckG93EvcLV9bg6QXewNnf7mQ5IIHCeE=; b=tlDYXleMo1SvLq
	fE+a6fBcGojIMKF+3UdKhBHlI3+5dTO8PEIXfXdi4QaUoFHmN35J3renosRyXpNOEmZWvdqWs9tm4
	m39uiDXD3thDtrX/CnlnvO5sfZo24Z8zpyGG8sh47ZKMAcyWJ2mUvJsZooXjuWjSfi+rhXP2o8K0P
	aTiQbGRlK9QdvL2taiWRje8Sid7fpllMlApT0OWdaZwfc8q97HdiQNtHHFe1k1jueAitXkGTGiJPJ
	bl2wC/bajbpW2azzQnzEQMOLGd2s+V7qpePPng5BP5ry0H0N94iZqAZGK+9FgEYLKsA9UXXa4H7wD
	ZWBbcJMcPxtzQbojwZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCeA-00ADfO-1k; Fri, 17 Dec 2021 12:47:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCe7-00ADee-Kn
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:47:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id s1so3869553wrg.1
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 04:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7LZ1nA4lOfecYVsrLmuy8ux7dkjFcWb7gPP3Ts+l07A=;
 b=PuF6u5NZOxCYr++SNE2eIMZuuw+/7PM+J1oBlyRcJJb/NXnB6qUPH16jOlEG28jDo+
 +0Cp3yo6dL3124MDrSS0JktdEwGIFYryfTgZhwnD5NLvouYUddqVGCIiN5eHnTr36bpx
 h95GTmrA9VaU9Vj3KcWXFk9RiyVVvKa10XAlkzn7SFxluPnmH8YsfO1QcyY75ipgp+3r
 ECNUmESCyaD1HkzuW7X7gK3s+ZAESrVqKFBMfsiIM6K0x8Q8xroOGwsO+N0xD0Aqq7GP
 s44LbOWpPAGoHuirahK6lsMmwhN5THiPMN13DNUzHgqkCk2RZIHoEGjAQetPJGS4GsYG
 U8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LZ1nA4lOfecYVsrLmuy8ux7dkjFcWb7gPP3Ts+l07A=;
 b=BYQrmG87PXZ3G/XJuQrSSsV66DosmUatfiR75abCjmXAaDcbVi5U978OOEtN7vemRY
 FJyVmSBiGIcd28HxAN2lMxhlTQJTLrvrL7jtpaUTXPZQJRScmCOOR+w0oQb7Df49zMx5
 8sGeVgYhBapAdaB4s4E88klxT5mNcOZygf59gexcSilaP3mvcA/VjcUnlZy2CXechYXR
 iFJzvBv3brKwcZSzRHAxJaH/4J4gaeVS/2wkAiHfR4uzWvAwZmjrZRY/xPYKPJEVByo8
 fozoJjllbD/IMrMwGsUeBhTVqyxoR2U5ilEabAzkeHiHI2jp3rCXZHS+u/ltxi5zkOrD
 CHVQ==
X-Gm-Message-State: AOAM531zJj1SlxkrU31L2aeu3RRd3PuPNjH3/Qddq3O5x4GfNvfPnxoG
 kNVTdmRnEhvc1NG7W6lA9PUu5k8sAPzDlu0w7RlcZQ==
X-Google-Smtp-Source: ABdhPJzjYjt70Q7N1FbMgpg3l8n8x5MHMcym81T3FbJlsD8EVPhmffm2PND5L2lTJE72NXW2s1+mO7ue8lgFNEkcaSk=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr2448344wrn.690.1639745253808; 
 Fri, 17 Dec 2021 04:47:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639744106.git.geert@linux-m68k.org>
 <3af15b09a5f05d49e2d99386f189cdb13245d40a.1639744106.git.geert@linux-m68k.org>
In-Reply-To: <3af15b09a5f05d49e2d99386f189cdb13245d40a.1639744106.git.geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Dec 2021 18:17:22 +0530
Message-ID: <CAAhSdy2xTW0FkwvS2dExOb7q1dVruFfTP_Vh_jWju+yi7thCeA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Fix number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_044735_717259_893A8534 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, Dec 17, 2021 at 6:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
>
> Fix this by adding the missing "maxItems".  As the architectural maximum
> is 15872 interrupts, using that as the limit would be unpractical.
> Hence limit it to 9 interrupts (one interrupt for a system management
> core, and two interrupts per core for other cores).  This should be
> sufficient for now, and the limit can always be increased when the need
> arises.

I disagree with having "maxItems" as 9.

We are in the process of increasing max CPUs supported by
QEMU virt machine to 512. There are already high CPU count
systems already announced (example SiFive P650 which will
have 16 cores). The "maxItems = 9" set by this patch will soon
be out-of-date.

The "maxItems" should represent PLIC spec constraints so
please don't add any synthetic value here.

Regards,
Anup

>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>   - Add Acked-by,
>
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 28b6b17fe4b26778..0c6687511457413e 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -62,6 +62,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 9
>      description:
>        Specifies which contexts are connected to the PLIC, with "-1" specifying
>        that a context is not present. Each node pointed to should be a
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
