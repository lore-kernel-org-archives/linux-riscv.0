Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79C5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=F6Y9YJU2NueT5h1018V2DAe6Rzd3xJybys0UT5vMYok=; b=zT/6ZoDoj0SijA
	xKwAf9JmoEV+qP/StfnZe8tIgQmRNlpKrAFrkeDRGMkjnyFpoDDz7caoNDkflaF2pKKXXP3NmxyN8
	ARuwv80haysB45w3oYLrq12cv8h7MVqKH5ArTiR6OuSJKhmzm8js8f1s/3J1Ybglfl+RdEGlV6aMo
	dvuPhuy7L7WJo+MFcS82jaOVW2ysBbOctCRMuS1cs7eDH2MeknLqwgtcpOuLu3TMDlnS4DZyvx7zS
	LLlmlvWHt7eod/HHBBtBySPn6SgKgASgobBV1Bh7U6Kd4o1T+NNfH3w/9koeb4fx/tOyl0fCCogqs
	qF2UNBnsufSbkrxx2uYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mstqJ-00DWPa-2N; Thu, 02 Dec 2021 21:42:15 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mstqF-00DWOo-V9
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 21:42:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id 8so873939pfo.4
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 13:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=z0U7sXMXxzMUq0YKyxwQpm+mPxbKf8cT9s5Pmci6eQY=;
 b=ZuspXtWGVJDGGe9JWYuxvvDTFWIFkBZiIM39a98ZoP3vxlhoP6X2BpPBaImkSLc67j
 1Hfaerxw3P4CtaQ+crg4U75T8v8t6D5tIsq0LN1JS/bxcd1yBud5o8j718phmq3ramjy
 qYp7YDWyH7m09TrMZC9HgXwfXAevv6rUZSEYViHT9mgjmEXbLAM0ErNVsDO45fixVyu9
 uVpubcc3YDbQuzgTY0Ajg8oCQmLWcU93AVUknSK1v/QUzPAJ/1iNuBqi6fGP9MSl6vky
 2/k0whPWWFSJZ92b4YUwv7kp0mvd2/INHhLTjRq8wLsIC98om92Y1eW95VF57Vg8cCsK
 VP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=z0U7sXMXxzMUq0YKyxwQpm+mPxbKf8cT9s5Pmci6eQY=;
 b=E7ySdcdI9phxDWtk+XaQDNFllJvNB7sDYNdruhnpr6KsnEMx+2aNmP3LfVC2Dc7fcC
 5vA4uNw1nkUaECAUSZOHD6tR2g7QrgNweEPZIkqyZvpUsBrqiJ5xfMWdc6UkDHzHJxkR
 D1JROtVHFbtyNXRQ3gJ+LLnDP3NCvy5QfoKNgkTxjzXR4xUyijJwaftvzXjGupHpyQTY
 KU8gFdrybMzArotq3F4NT3fgSOWO9MZ5pv6dBu9EuDzhI9vKpjUyYAZW2XKcKmuzISto
 Y5sHygkIG7dMSvJg+NBlplIybwaGzbvAXOAuinlsM5QxoJDLLQ2/ayLIi/Om1EzQVR7e
 mSDg==
X-Gm-Message-State: AOAM533EBqUpuaskG1/Fky/WCiRSatp51hQksU2XnP849DQldCoTMuQy
 m4lRw7MTdc6ild6UpA+h3XX1fQ==
X-Google-Smtp-Source: ABdhPJxUWsu0qmz5BcX8JlOveaV/OQsmmKH4peFVYNTsS8Dby17MNH0bj2HinBjsziaJi1FXGhVfjQ==
X-Received: by 2002:a62:798e:0:b0:4a7:89cf:8526 with SMTP id
 u136-20020a62798e000000b004a789cf8526mr15288855pfc.10.1638481329518; 
 Thu, 02 Dec 2021 13:42:09 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g22sm758662pfj.29.2021.12.02.13.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 13:42:09 -0800 (PST)
Date: Thu, 02 Dec 2021 13:42:09 -0800 (PST)
X-Google-Original-Date: Thu, 02 Dec 2021 13:41:58 PST (-0800)
Subject: Re: [PATCH v3 5/6] riscv: dts: sifive unmatched: Fix regulator for
 board rev3
In-Reply-To: <537742e7af4a21baf79429469ba7c30947ddca7a.1637362542.git.plr.vincent@gmail.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 qiuwenbo@kylinos.com.cn, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, david.abdurachmanov@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: plr.vincent@gmail.com
Message-ID: <mhng-25baa8a5-d7c1-4a37-8489-123fd12499f0@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_134212_031089_62744130 
X-CRM114-Status: GOOD (  19.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 Nov 2021 14:55:41 PST (-0800), plr.vincent@gmail.com wrote:
> The existing values are rejected by the da9063 regulator driver, as they
> are unachievable with the declared chip setup (non-merged vcore and bmem
> are unable to provide the declared curent).
>
> Fix voltages to match rev3 schematics, which also matches their boot-up

There's a few references to rev 3 here.  I'm not sure if that means we 
should have multiple device trees -- this one seems pretty benign, but 
some of the regulator stuff worries me there, where anything rev 3 
specific might not be safe on other revisions.

Did any previous revisions make it out of the lab?

> configuration within the chip's available precision.
> Declare bcore1/bcore2 and bmem/bio as merged.
> Set ldo09 and ldo10 as always-on as their consumers are not declared but
> exist.
> Drop ldo current limits as there is no current limit feature for these
> regulators in the DA9063. Fixes warnings like:
>   DA9063_LDO3: Operation of current configuration missing
>
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
>
> ---
> Changes since v2:
> - Fix end-of-commit-message separator so change lists do not end up in them.
> Changes since v1:
> - Remove trailing "." on subject line.
> ---
>  .../boot/dts/sifive/hifive-unmatched-a00.dts  | 84 ++++++-------------
>  1 file changed, 24 insertions(+), 60 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 6e7775fdae32..1abad0eec02e 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -93,47 +93,31 @@ wdt {
>  		};
>
>  		regulators {
> -			vdd_bcore1: bcore1 {
> -				regulator-min-microvolt = <900000>;
> -				regulator-max-microvolt = <900000>;
> -				regulator-min-microamp = <5000000>;
> -				regulator-max-microamp = <5000000>;
> -				regulator-always-on;
> -			};
> -
> -			vdd_bcore2: bcore2 {
> -				regulator-min-microvolt = <900000>;
> -				regulator-max-microvolt = <900000>;
> -				regulator-min-microamp = <5000000>;
> -				regulator-max-microamp = <5000000>;
> +			vdd_bcore: bcores-merged {
> +				regulator-min-microvolt = <1050000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-min-microamp = <4800000>;
> +				regulator-max-microamp = <4800000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_bpro: bpro {
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <2500000>;
> -				regulator-max-microamp = <2500000>;
> +				regulator-min-microamp = <2400000>;
> +				regulator-max-microamp = <2400000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_bperi: bperi {
> -				regulator-min-microvolt = <1050000>;
> -				regulator-max-microvolt = <1050000>;
> +				regulator-min-microvolt = <1060000>;
> +				regulator-max-microvolt = <1060000>;
>  				regulator-min-microamp = <1500000>;
>  				regulator-max-microamp = <1500000>;
>  				regulator-always-on;
>  			};
>
> -			vdd_bmem: bmem {
> -				regulator-min-microvolt = <1200000>;
> -				regulator-max-microvolt = <1200000>;
> -				regulator-min-microamp = <3000000>;
> -				regulator-max-microamp = <3000000>;
> -				regulator-always-on;
> -			};
> -
> -			vdd_bio: bio {
> +			vdd_bmem_bio: bmem-bio-merged {
>  				regulator-min-microvolt = <1200000>;
>  				regulator-max-microvolt = <1200000>;
>  				regulator-min-microamp = <3000000>;
> @@ -144,86 +128,66 @@ vdd_bio: bio {
>  			vdd_ldo1: ldo1 {
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <100000>;
> -				regulator-max-microamp = <100000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo2: ldo2 {
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo3: ldo3 {
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo4: ldo4 {
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <2500000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo5: ldo5 {
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <100000>;
> -				regulator-max-microamp = <100000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo6: ldo6 {
> -				regulator-min-microvolt = <3300000>;
> -				regulator-max-microvolt = <3300000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo7: ldo7 {
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ldo8: ldo8 {
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>  				regulator-always-on;
>  			};
>
>  			vdd_ld09: ldo9 {
>  				regulator-min-microvolt = <1050000>;
>  				regulator-max-microvolt = <1050000>;
> -				regulator-min-microamp = <200000>;
> -				regulator-max-microamp = <200000>;
> +				regulator-always-on;
>  			};
>
>  			vdd_ldo10: ldo10 {
>  				regulator-min-microvolt = <1000000>;
>  				regulator-max-microvolt = <1000000>;
> -				regulator-min-microamp = <300000>;
> -				regulator-max-microamp = <300000>;
> +				regulator-always-on;
>  			};
>
>  			vdd_ldo11: ldo11 {
>  				regulator-min-microvolt = <2500000>;
>  				regulator-max-microvolt = <2500000>;
> -				regulator-min-microamp = <300000>;
> -				regulator-max-microamp = <300000>;
>  				regulator-always-on;
>  			};
>  		};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
