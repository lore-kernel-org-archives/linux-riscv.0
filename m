Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39100EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zDGraefeKH947ji4zA0421jrLz+gtcPfo/1DStr8sA4=; b=j7OIgYqad8awJ4DZI6OfiwoMhX
	tCmgIATTmMTBO54I/UabNmyJj8ewHdHbZkJMpyHplBHE5bBFUYT/JyazNLmVhEHEKLEdFA10XkKXh
	l3O2KvugA1NkjfOStTAqp4R9Akj8NOZ2frZDPKL7Nl9oPlIgp/6h5BdzdJmK9IqZBcJGrxGjrPxYs
	iHWVLon4w9hHjkpBYWKliDQNWzsCihe8qpa+uriMnXM2DCl15rvl4yOlWR0SiBUuDOOLRVbq9byZO
	3rpq5aMmyJKo5ylhxpGqHAZACSNeC5yb15iLQTG1XBPeOFo0PDkG+wGOvBpiwmH5KRjDOT//BBPHv
	Hb0oJgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVRx-00GwuP-1R;
	Wed, 12 Jul 2023 08:43:53 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVRt-00Gwsq-2V
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 08:43:51 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso107496461fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689151425; x=1691743425;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVexWb2xIiXfUmTRUoCRaVuTZQZYZCzaepAYfAfny6A=;
        b=S8H1DZo6S6oQzSMdoqsaJsn2wsCdkpAS6Wr+I3Kjxr3lDPbQ85eUpKWcgRsiITqLdQ
         wJzAQW7baTZr9RBhSDA+HatQjx591NVZ0LVv2rZ3d+oVGHVGJU1ESDjlbDeLUZbMG9PC
         5cIppAmouxuH+LNS/TDrZDNHY7QtcYT3i098pf+E9c6S6108x7oGjCdNgbdCqYOkPpcI
         sq1NLvXLSvzbFoDXtp50/1gCHTZ2qksUvh2apFoqTCB+NzJEJLUvXTPgI541YmkVjDgl
         Kl1X26JqNjAJ276rAWr/sPACtx47sZ0k9EKq8H3qM805xZjIrCbqWDmzJaTgq+X6ct8P
         NlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151425; x=1691743425;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVexWb2xIiXfUmTRUoCRaVuTZQZYZCzaepAYfAfny6A=;
        b=ayAESb1HiqIAAPIiyL2UBiNweksdsA5b/tZzsj0Pz9ELoR4JBZpW4F/Q3TlEZTndZG
         GJHG4Rb8OlYTfSyZsknsMdIR7O+UCsfiLIGLz71ARsUZyQK7IaeEhEP5i0Thw2uUHbh+
         LdFhvgw556hZBZGNjdzvq9aChMlMsv8dHMZ+X+qH9x2qh0wX50n394oV8dvYpwWcLTFj
         ySBN1CQs4gXpcBmMsg5FiohTvG1yxoYP2PUNXfgnpdlTkDDDvujndLAthHi9w5ekhncN
         Wbl9nAA7RqazcBQRPNDo4lYbC5YdVBK7cnHQbvjv3A4LPMxrqRSk6YU6z18r9SBZNNBB
         h1Wg==
X-Gm-Message-State: ABy/qLa9vjcO9G4KbEaNeO77A2EwAnd8d2plmSukNXQjxB0kk4FvzH9l
	4KCT8MKrELjgUiOMz6OOLTw=
X-Google-Smtp-Source: APBJJlHYyuAaAq9x1E+AS9xHlZdQSOvaU3bH2T8KCkjCt4c+/0MdGf1zMrqalHo9Eu8nEvUrqhQTIA==
X-Received: by 2002:a2e:a16e:0:b0:2b6:cf6f:159e with SMTP id u14-20020a2ea16e000000b002b6cf6f159emr15173716ljl.44.1689151425348;
        Wed, 12 Jul 2023 01:43:45 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.82.245])
        by smtp.gmail.com with ESMTPSA id l24-20020a2e8698000000b00295a96a0f6csm826389lji.102.2023.07.12.01.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 01:43:44 -0700 (PDT)
Subject: Re: [PATCH v1] riscv: dts: renesas: clean up dtbs_check W=1 warning
 due to empty phy node
To: Conor Dooley <conor.dooley@microchip.com>, geert+renesas@glider.be
Cc: conor@kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230712-squealer-walmart-9587342ddec1@wendy>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <18871eff-f2be-9eed-ee4c-99eba87686d8@gmail.com>
Date: Wed, 12 Jul 2023 11:43:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230712-squealer-walmart-9587342ddec1@wendy>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_014349_808786_9F8BF8B8 
X-CRM114-Status: GOOD (  15.74  )
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

Hello!

On 7/12/23 11:14 AM, Conor Dooley wrote:

> dtbs_check w/ W=1 complains:
> Warning (unit_address_vs_reg): /soc/ethernet@11c20000/ethernet-phy@7: node has a unit name, but no reg or ranges property
> Warning (avoid_unnecessary_addr_size): /soc/ethernet@11c20000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> The ethernet@11c20000 node is guarded by an `#if (!SW_ET0_EN_N)` in
> rzg2ul-smarc-som.dtsi, where the phy child node is added. In
> rzfive-smarc-som.dtsi, the ethernet node is marked disabled & the
> interrupt properties are deleted from the phy child node. As a result,
> the produced dts looks like:
> 	ethernet@11c20000 {
> 		compatible = "renesas,r9a07g043-gbeth\0renesas,rzg2l-gbeth";
> 		/* snip */
> 		#address-cells = <0x01>;
> 		#size-cells = <0x00>;
> 		status = "disabled";
> 
> 		ethernet-phy@7 {
> 		};
> 	};
> 
> Adding a corresponding `#if (!SW_ET0_EN_N)` around the node in
> rzfive-smarc-som.dtsi avoids the complaint, as the empty child node is
> not added:
> 	ethernet@11c20000 {
> 		compatible = "renesas,r9a07g043-gbeth\0renesas,rzg2l-gbeth";
> 		/* snip */
> 		#address-cells = <0x01>;
> 		#size-cells = <0x00>;
> 		status = "disabled";
> 	};
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
[...]

> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> index d6f18754eb5d..c62debc7ca7e 100644
> --- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> @@ -22,6 +22,7 @@ &dmac {
>  	status = "disabled";
>  };
>  
> +#if (!SW_ET0_EN_N)

   Are the parens really needed here?

>  &eth0 {
>  	status = "disabled";
>  
[...]

MBR, Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
