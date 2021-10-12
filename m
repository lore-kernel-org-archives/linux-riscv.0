Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A810C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE91D60E53
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE91D60E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eD4/AiopmVecjAwjtlvvVGw2y9avSX1xBmqwE2rCezI=; b=5EMwKvNcH9SUpO
	gtX6GS5jhV3ndQS7h39W0Pq4Z1opdbZ/hUM44t7r6pFlG1iJzX1PR9LHDAP0EBjLDYnLLqRHyQM9k
	GKnGWJJcQZjPWFYbpkAUIqRJd2ddXG0ivwicxxBVwudvU4j3dCgwNwNgkhqjbyTF++JEklBT981jk
	B16U45geLmg+J2uCUVd9yqk/UuW+MtKcWR/WrgnHpXcK0s6MQEUduErtfEKrf8D0NDa6xIvw+1l8g
	wxwDKMW15L5Q0LJLKvgOBT7jJkOKh+9JihxtfA/UkDSQt9YUO2jx5Q4KN5un0elRdyUFDl1OlCWQH
	XpTjoD71DWUk/SEtlxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma9bw-00BSoe-Ay; Tue, 12 Oct 2021 04:41:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma9Wp-00BQRf-8B
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 04:36:41 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 029DF3FFFC
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 04:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634013398;
 bh=cFDVYMnrfSERHChsUSOafRsFEi1MyUR6LNHqzOlq5OI=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=mGWC7i+nYnKJ26isJGMXP4rXSRW2pbFAfkAFCqJ9GBQ0O0itnbo3Ix5dYljYEQ5gC
 ZFMUA1qOtNv6s10jcZRTfKTxem0MdgxJwNj44r/9mTu5eof5NJ3OUJX5gNyXQF487J
 GGTcDki+Bj1nCX4ZKDSOW7/401fX4kPzKk+PfQQ+020gaO0sjzrH0yevrOtaIZaWuw
 RB/nH7/gvcRc/rdNr3J/ww7KXZyoRTzB5WIQXF7+7EgHHXVO7awPf0c49gQq5Erfnk
 HwIErTAQb8BxrLN8Hf+A9JSb1NymNg9RqLT8iOd8XfxSyPl/PE5rZFiVZp8paUyesl
 VCBvMFwi/s31g==
Received: by mail-ed1-f70.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so15725541edy.14
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 21:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cFDVYMnrfSERHChsUSOafRsFEi1MyUR6LNHqzOlq5OI=;
 b=pd1LU+0T1zHR9lGkJz3Xv1EHk7jGoxJIcwpKUB5m4+XQznvpk9yjwZAaeYHg5eibVy
 WKkuqnSacLk0A4RKDsb8S60Mbu9BUAwxZR1c4l4qSHfRy+xvwmhjMEMp4/NqhcJ6XhyS
 gYPJAl9vH69y4J1I+IY2PBaybfaiECVEz0h7y9CpsOM1YIUTiABQQj3xmTGnQYj7m19T
 9FdMjMMDpBhOajM75fdN9OiZI6DBVP7f27Wjfcr2nNRxG/O4OpfulyBU6tkgvRB+jgY+
 +fHyuH0w705ApQCxswbgixwotoJ+qAWtzutbbh5SRY34NQQlowBxkbIBLSrte4iMomL1
 54uA==
X-Gm-Message-State: AOAM532xO4qawOmgvy7Wi9g7M0wWr+2dctAivsXJlK5Kee2RtuNKDo30
 4CJ+/IcPvb0lvxjhG01o3qx6TK93tFDRiogaD48f/uZWMiuK7JYG1tVEPbrAxuMWKjZ/2yc9QkJ
 ycIlYSUaSCOiCxHh90P3D105uoIptDCapl/loR7grjti07KzZXnxwH4xtU4t1IQ==
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr8901009edz.20.1634013397730; 
 Mon, 11 Oct 2021 21:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDAwwNTxVTuAVNY2n7n4y7mjZ5+Vt7PQuywm97RBU9A4oXQFDeAQroJkl9fWjqHzLrLVVabbYnoGObk9MrsVI=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr8900996edz.20.1634013397600; 
 Mon, 11 Oct 2021 21:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
 <20210920130248.145058-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920130248.145058-2-krzysztof.kozlowski@canonical.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 12 Oct 2021 06:36:25 +0200
Message-ID: <CA+zEjCtE6OQEcgV3GG3OxdKL0JB+dBWCij35MMd-XVZnTcbsrA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/5] riscv: dts: sifive: fix Unleashed board
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_213639_466538_2280B0AC 
X-CRM114-Status: GOOD (  17.99  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "bombadil.infradead.org", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 20,
 2021 at 3:05 PM Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 wrote: > > Add missing sifive,fu540 compatible to fix dtbs_check warnings:
 > > arch/riscv/boot/dts/sifive/hifive [...] 
 Content analysis details:   (-2.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [185.125.188.122 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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

On Mon, Sep 20, 2021 at 3:05 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Add missing sifive,fu540 compatible to fix dtbs_check warnings:
>
>   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
>   ['sifive,hifive-unleashed-a00', 'sifive,fu540-c000'] is too short
>   'sifive,hifive-unleashed-a00' is not one of ['sifive,hifive-unmatched-a00']
>   'sifive,fu740-c000' was expected
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v1:
> 1. None
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 633b31b6e25c..2b4af7b4cc2f 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -11,7 +11,8 @@ / {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         model = "SiFive HiFive Unleashed A00";
> -       compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
> +       compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
> +                    "sifive,fu540";
>
>         chosen {
>                 stdout-path = "serial0";
> --
> 2.30.2
>
>

This looks good to me, you can add:

Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
