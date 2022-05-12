Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B826AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 04:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdMgeX/FDZ9bNDgnmZyslfi4S1f8EZCXXlmN4APm0Mw=; b=QbAmIbHSHg5Buk
	s82DKsUIGcpSAMB11+t+0VsbfQ7r1sjThLbqjQ2i05DnAq56GmLMKa85lJwTd37zVws+O9Jat6hpH
	dRakeluei21Czmx38gyZu6rN6FenfzXjHA921xJzkZ7lFaCOkHXV9mRMiawrpf9vHKbiDGon5uRZw
	+remzHY8sglhpKC/t7u2k8o1rC/hJX0hwnXZGGS/upC7Tk2qSf57CJ9O9L6W1535nc4W7Uak7QZ1R
	hvDZe9SzAZKZp1/I9m6neMv5ru1Hn+1+pgAiunatPKwYv5bGzPnTBwXJ9Xg3pR9FJhUs9yJlkTt6z
	edXusJqkBksb1v8mBeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np0Hs-009tcU-OQ; Thu, 12 May 2022 04:18:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np0Hq-009tag-QI
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 04:18:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so4380146wmj.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 21:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ivj2ToufcJh9XX+t7cYN4gR1xGP2Eqnye3FyrAKzUwo=;
 b=pevEQX99aUfHaf9ZrDK/7APbi+nhoR3NrOT9Lf9fouaWT/hRCJI8j764xXLTQCQKIs
 hrE87yqMJxXMhHUsEBbWQdb9wVWRFmAtz2ZIYqANBFvdDzirkqpQqsokZB+g8vdz497y
 E84xI/XyHyL8ZLSEAz2aTc81oXxATbhvV27mFRZICp+yWFgainNwcE4XciaZnlc29Wtp
 Sy2eHNT2wIPzwylVTgUser+RHGp7IW8Vg4RZGn/Ah2HALPzMkE76MdwOrpKW4S2AwaLY
 9pj4oUrJWWHj4cHD8Jmo2BJVXA85ivlGSLmzl9yOrZ3D72qsJ8V5hfiJh4hWtkNtgZcB
 4nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ivj2ToufcJh9XX+t7cYN4gR1xGP2Eqnye3FyrAKzUwo=;
 b=JKeuuAvwi6za6n9c93mQQbgvvCxtDq4sSzHm+S1Dw3iO/UtIwImxwuHsuNlmVfFunA
 52SoB6qC8xo+OCO8mLTPdae0rWWupCCydlBzMkNy2VOtVtVj/3nNk2Dyq7qcghIcxgWc
 0rjgyWPx2LoSfKq0UBtNTHDoDjFTyAsN7clK7XhYn+XYfITdDri0whNJ3Hrt/4SM1ZbU
 yoJx8ym81vNS2Tn0Kaz9W3n9vxgIMcCXxsEGvvhzE31BZ7A+cUczlWUjmu+1cUpKlU/2
 eEZ2ed+bj5wlIGeZyEBcjh3bhAPAmXaxcdfkngq/gl6ygeQu4nMFnKhQMaEhE50Pep+Q
 XUPg==
X-Gm-Message-State: AOAM531Wc5wrlXsI3/xZyfncK/V4PN0islJ49y8nUUi1Ec8rotU58ATj
 Q9LW/ERbMrPXSozoavGoI7bmcyBLfzXL3PZAJuk9ng==
X-Google-Smtp-Source: ABdhPJyqM/Y9gRPJ8ZkauV1Q+8wE6TNSjv45pTRi0KPrGuz2I1L7fH4zvTKxMF9kTPnLMIU1L03Ox9L8FlGJIIupGD8=
X-Received: by 2002:a05:600c:4fd5:b0:394:55ae:32c7 with SMTP id
 o21-20020a05600c4fd500b0039455ae32c7mr7934316wmq.73.1652329129005; Wed, 11
 May 2022 21:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-2-heiko@sntech.de>
In-Reply-To: <20220511214132.2281431-2-heiko@sntech.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 09:48:37 +0530
Message-ID: <CAAhSdy2PN8knGzyLadq-aoXVZqN3YASVVu7HxiO3YEb6XyqRxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_211850_892081_CB4FBBEC 
X-CRM114-Status: GOOD (  16.14  )
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

On Thu, May 12, 2022 at 3:11 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The Zicbom operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.
>
> So add the necessary property for the system to know the core's
> block-size.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d632ac76532e..b179bfd155a3 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -63,6 +63,13 @@ properties:
>        - riscv,sv48
>        - riscv,none
>
> +  riscv,cbom-block-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Blocksize in bytes for the Zicbom cache operations. The block
> +      size is a property of the core itself and does not necessarily
> +      match other software defined cache sizes.
> +
>    riscv,isa:
>      description:
>        Identifies the specific RISC-V instruction set architecture
> --
> 2.35.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
