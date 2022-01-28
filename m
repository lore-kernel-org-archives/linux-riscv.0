Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551EAC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr6jtVkUBbrTYVcy66e2HEgPT6tgWcFfE+jN4ECJT3s=; b=uk76PUKWU3G8MR
	Hfoviqk6wB26sqfnByxRfOTLXoiwjkzZKoLF2DeRw3LXpm/BZa6OldsRn1Al27OEHkbsplBcIDa3Q
	A4y0xH0GsaDM03ktN17RC3dq8qJZ5nOwEkXYeOuQ9/E9U+mIUDTT6yUE015oAxHRDkeTZhM5tjnBL
	aA2hj16FmQeH8VNxCvKLyVHvtfqDAUvcGiwrRetCR6CCsBbhMYKMdlBbHVQ1oAVTY7cTlmYRRI9JX
	PB1zY/VK+KP4L9GBVuANCJHnJsWNCvuY3fcZYZzBam7jaDqxWRXRCrJj3aQ5A+ygLHTFVElyHulSS
	5tNpRxEyCIrYpiDO3fSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDND9-0018jK-U5; Fri, 28 Jan 2022 09:06:27 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDND6-0018hF-FD
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 09:06:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id e2so9608074wra.2
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xKmKkemO7LZgNH3z0FyPV0a1F2pctQzcwkbzVf+pn9M=;
 b=dMjEiUSnrp58PvxtH8/oq3uk2znAwoXs16+ia+Di+iOLZWWrdxj1szC1T8NAzX/gps
 Pt8T8++gA+3eGQxk785oSrLqWGJdXzyYzgYvqx7BtIPIusrsdYU/OUmX4buHQzaVOsyd
 I2GdFE2nwLxRGW3VhTokvS5WpQ5E7/19VRiuzYkUSMWAj+P7z9tzgIyx5K9z4GxiB7Ip
 BeUR2/u3SCO/rN+Cbs01UtQjK2gDMsPOzWti1O1KnyY3AcKYkaNIKWSI46p0Nia80PVX
 UDoBkKTzZuI/qK/EkT3CGKvbsreqwuhwv6Qqf7zeVI2HFmxZTIvexSh1B1aC5vXlGOTu
 5C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKmKkemO7LZgNH3z0FyPV0a1F2pctQzcwkbzVf+pn9M=;
 b=qWpS+eVnqPgX9t5Ifa8XHmPe0HRbGs3hXJw4BXhSKUAsYhUB/YM39/0sDgGVGqF5SG
 dCD8Ac+bCWjg9KweclQS1HLwdBcTkcs1LdXKViT19dt6VsVBDAvbkrTSPqNBgwFce5N9
 J/oa/cvRWJH4Gn2C439u9O1bsGTr891sQNb9V5q0ZFZT/S3B9yQivq7lUY/w1uWh+25s
 FgDcCdFHN7hdzy6EQ2WtpQBQS0qEpM5gMnxW0Zyy4OCl6eXXsGmr1Kt6qNtHoynkaDVA
 27elgPl7HuwXbwq3xJWt9O5JdfDqt9dvndqnaUlX8GoueofkuGzoXvtw11m8fJJrjSt2
 e+RQ==
X-Gm-Message-State: AOAM533t+AjNq1CbFOXn/r1HTNXgVKPEl5sE4uyvP+qmPm1lhAwtvAwa
 X6y2rJgzn5C8v/noJYWdYX6r8kI3m5wGq7xwUEyUVw==
X-Google-Smtp-Source: ABdhPJyi2j2no5AvzLexpxvXn1W3Bl71f/NV5cWi8/uC4z/VF2s2n5jyqjBFmXLiJFR1/nEBiZPeQCSoIZM2KrosgAc=
X-Received: by 2002:a5d:6b48:: with SMTP id x8mr6411882wrw.86.1643360781694;
 Fri, 28 Jan 2022 01:06:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643360419.git.geert@linux-m68k.org>
 <f73a0aead89e1426b146c4c64f797aa035868bf0.1643360419.git.geert@linux-m68k.org>
In-Reply-To: <f73a0aead89e1426b146c4c64f797aa035868bf0.1643360419.git.geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jan 2022 14:36:10 +0530
Message-ID: <CAAhSdy2r-F8cJR8feV9c5-RHATe3Wv7ioYU2RwgNbwUMBJhHJA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: sifive, plic:
 Fix number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_010624_593412_4939261B 
X-CRM114-Status: GOOD (  19.38  )
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

On Fri, Jan 28, 2022 at 2:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
>
> Fix this by adding the missing "maxItems", using the architectural
> maximum of 15872 interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v4:
>   - Use architectural maximum instead of practical maximum of 9,
>
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
> index 28b6b17fe4b26778..57c06126c99502fa 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -62,6 +62,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 15872
>      description:
>        Specifies which contexts are connected to the PLIC, with "-1" specifying
>        that a context is not present. Each node pointed to should be a
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
