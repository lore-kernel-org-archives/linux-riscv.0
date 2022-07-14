Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56947C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 22:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=euoM0AQzlt0MJ2jUQZuQ36GL2rpB8lW5qkGqIxH9azQ=; b=v23jS/UYlOW3NxH+aQoPgDYFmi
	nxUhSguTpkJsMoEqCN2RrZkfM/oUqDgxBckdD3y47RpQrIywoqn3l+LIR2A3h3EIEXlSC40hNC7rG
	/zry9NoWo9jeF99yHA95O5fjRXoVSIpCnek2ZgRedpgGlzljEbC7lFn1raopvzNOZsM151xQjLWC/
	jutWjWj2/YC5JcKzXahiIpiIZDZXWIzlEFYuwJZyI/D8D444z7G/GvJyJ6RmaV9TKkAbbp2JUP/3U
	dSeKnIRJy2OQvZ7H9ei8J8ec6e0w54QmtHqgOv8i7YkKeqMPIRks/fNICOvldjX9k/E69h++2BsUg
	ZSzwVbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6wL-001s46-53; Thu, 14 Jul 2022 22:04:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6wI-001s2i-2f
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 22:04:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id o12so3059745pfp.5
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=zbpcO2BwVk2FwQNWYD1VkAJqWqJYo+FkQx1b7LzYFnY=;
        b=qaIrgfzjhYCN6aVkiE5TQIWlp667OBZ4/SuftHPD66q62YbBKL8IwkW3a4A0yek+DX
         pIB+7WmuTFElSs2d276fzz8w/Co/RCmHEm32OgKbOV+8MnzZ0ZECDEaOXzi0doWk/m3M
         4VdwLaLGyfjuP7PzzYrL2U+U68sp7T2WgFl1zWeObOpJ1gtrbflo+GrLIdr7x8La3/8q
         6jaTnVb10BSXIkyUZK2fxdhOKiXuZ9MxD0DeOZYAmBPRM2V09P/KuLv7hr2WvNo3znJg
         J+JTEVJx9IiNjnnkyFNEBd3uyAXrj4HW0uZZKL9xDOA+R2xIQ5Gas51hfU8Miv6eBCBE
         F3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=zbpcO2BwVk2FwQNWYD1VkAJqWqJYo+FkQx1b7LzYFnY=;
        b=J0gn7vni792LuPbtYJSMV8jMqqJb0JLWelgCfvcKOjZ+WAsGsBW56UMtmzmMY/OBPf
         ZW6qicI8a/rUX0KHLdy+GNh4TidFQV21RaN0OaM+Ufi9DDcpU0ZAQdITCHTjlR1IX1+8
         u5QI2nOSxpoVKwGdGBVF6ZJmTpPo0n78EYeHVXMUG9UYvS2/UsVOwCf8L3LvHCkb2VmS
         qgUhOEIteHW9FrUlF6lgTvjNU3RQI9J1qLW64SpdsmfBTzf7MY2c/ZfwyxEvLwPv6Juh
         CJst70h5qRdGswBXz4dCQuWs/wYRXM8uLwiKSYF7ibptflhvt2Q966RQUQVQfVGyopvB
         M7dA==
X-Gm-Message-State: AJIora/r0Xv/eiAsmsgeEPX+r0uASIKG2D/2G07Y5AkwoMEwgMpEZgfq
	7hZCTCQLufBZRWO+MpQPdnmBLQ==
X-Google-Smtp-Source: AGRyM1vDwYSpcUsPfCp39Em/jD5TQH+yYaUQiO4APhWHiDXcGHDA6HIwJ4y8m+MCdWZjMAAMBGv3QA==
X-Received: by 2002:a63:e64f:0:b0:40d:e79f:8b73 with SMTP id p15-20020a63e64f000000b0040de79f8b73mr9177810pgj.243.1657836244616;
        Thu, 14 Jul 2022 15:04:04 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id i137-20020a62878f000000b0052542cbff9dsm2224040pfe.99.2022.07.14.15.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 15:04:03 -0700 (PDT)
Date: Thu, 14 Jul 2022 15:04:03 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Jul 2022 14:42:41 PDT (-0700)
Subject: Re: [PATCH 4/5] riscv: dts: microchip: Add mpfs' topology information
In-Reply-To: <20220705190435.1790466-5-mail@conchuod.ie>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, daire.mcnamara@microchip.com,
  conor.dooley@microchip.com, niklas.cassel@wdc.com, damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
  zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Brice.Goglin@inria.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mail@conchuod.ie
Message-ID: <mhng-efe2b7ce-e803-4a61-91b7-ca9c302a33bc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_150406_136602_9644FB7B 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 05 Jul 2022 12:04:35 PDT (-0700), mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The mpfs has no cpu-map node, so tools like hwloc cannot correctly
> parse the topology. Add the node using the existing node labels.
>
> Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
> Link: https://github.com/open-mpi/hwloc/issues/536
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 45efd35d50c5..0a17d30bb3f2 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -138,6 +138,30 @@ cpu4_intc: interrupt-controller {
>  				interrupt-controller;
>  			};
>  		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};
> +			};
> +		};
>  	};
>
>  	refclk: mssrefclk {

In case anyone is following along: this patch got split out from the 
rest of the series and ended up in the Microchip DT PR for 5.20.  
I've taken the other four into for-next.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
