Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE2AC54F51
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lNU/AmixC/wvW3rZ87TNOvLfcRQ3GnMsyUmMeG7ozM=; b=eg/45nK/hG3+Oe
	9wLam/wjD5/igCqIgT+EN3cmODV9cW0dO1HcL9FSlZxcszyyaBwrrRUgwvXw40PYhKQmCKJK6Mog+
	YHXV3FOGDmmKfj1fwKAYy855SywahlVG62/OeeVFQDEGmInNVXvQC0kz8Geyhpvlp1kzhZaiqoIWu
	3LDzobR4+f05xHpMw306TEz5/McYOnV+7y6hRoGHeUwLoMGWcj0cjTRtCaqh+YwWUj1tgbJuv6uGW
	J1GhQ2mXg69Ech+r3PlPZzHr3NG1DL4pItrl8qKc2Jr0QjBbBV4DFV8RSRl1xTGCQAt7GCDJjyeJO
	wFkYcJkCX2Qk6xryV9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woq5d-00000006P5d-1Bda;
	Tue, 28 Jul 2026 22:15:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woq5a-00000006P5B-3lWG
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 22:15:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8423f236418so258018b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276954; x=1785881754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rje7HhQ48HT1sXup0TRphJEI0h4NvdmNL/JFa+vFWNM=;
        b=MsIH6ak4lyHcK3Y7CYzXPKMpk55Y1pHxcxu4y9qU3u3BJKOH5W+Q/2qnK/Nwi2A/EP
         tqwi5jt6aTfTe3M4YN9/S0Tp6f4FNJbutmzMuM5EmoqMEeVQznVi8FefhVGOPcmcJ7rP
         cymzi1/Xq29zKxodDQc6Dw9JmXJo+9Qf1DINjoSSnLZNqqM+DL8DKn7jQ4nrUQ0nQA1w
         UuC+EG2EaSCitj3xHbsf5K2KW7pRlp0ShPy7Bfn/uiAZI5WbLti2lMqX7g4kZTf7lNEl
         onSDt9UBx3hDAnNY9Y7M7kPWAiq7Ul4kL5UW90j6x0zyl5eSBxvDPFeaqe5WOadbLGF0
         DDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276954; x=1785881754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rje7HhQ48HT1sXup0TRphJEI0h4NvdmNL/JFa+vFWNM=;
        b=TKie8ZoYqRotUVltnjHfN1udEMzKulJ6PgXjiogIhSCLl3tK2FGKagJexdsHjwle+I
         IxMUg/9SLQcLq32jfcyyrnWJtAireU0j70Er9iEB3lrpgxIIQyjSOSmMi5jjXXJySj3G
         XFzltAazU5N/ZeS+iPuiAG29uhf5jnO9VebEQxbwooAey/FSdRppbQPkMUELP+qJWSo2
         EcSht8hhrhL4ZKdiyuafXtYvnfMxSqtAkB5MVUXX0QvUwtM3bTeEkpGQAcU9L2V/LZ9G
         +PWjhNFymdk1a5grcoZPuRkQ2dtwt7ffDtNBxzpxiXO258hrnbilXVYJhXhRjS6gcSyK
         6IRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2qjWtF7jMem/aDyUcZ5Yq8e9Okcb/NSwdjxqWWkwIZ4Cv954oEI9RvD8GN/UBIq9Nv11atj7Yd/De0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/LGGzoHARexXXCJlTi/Q+YLJ/CemmEcc0KdeHwKXwuSNQzJ+d
	4/XbA7QzLaRhBYMBhlzOeuAwFfqKaiw2AxQ6bs2QKEtc/tngKBDUKscd
X-Gm-Gg: AR+sD11CYBOdddKtMt0vxak8coUarT9HvmbPTAA9X8MhgDCIkOqp8q2fmTkZje3VqH4
	vi/5EXMywZoBQpzqfjDRgdymZcTg8ImI9NGCFdCo4r9MLtTDfR4QpBW1ElwrdFPd5+X5QnVT7hW
	4Ldr7ODf6sSMRCNJLbLBnthXqiGHGLp9Z/D+Z5s2UNvdhtFj26CcYj/3Oemtv8NCvJdOPWePncy
	1wkEb2QTtg5xONQlSiRcE6FlJOB6EDWXGU0p6yCXf2EPKP1jeH83qTTqL03zrYeno5VlKDO2dGI
	Jv4KYybL4qvxKaw4RwYFyKHNc4JPPj+0MwRRuG5xemBxrsLT6lpAeEJhPAJV72HykG0KABg4PP4
	Es4Xl2YfN21CFOb9WerM9byaKs+3HN1ZL9UDjRtzz+ULOgZRy6e3KeonGGDwjWUPqBS8bj/dU5Y
	+wjpL5NRgOyw7GellooI5vTFcFPyHwdnKMLm1QrK+5dV/tSiBtEkZtcI2j9qg=
X-Received: by 2002:a05:6a00:3992:b0:848:7f8a:8d0e with SMTP id d2e1a72fcca58-84e932c5f3emr4027335b3a.55.1785276953823;
        Tue, 28 Jul 2026 15:15:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea005287csm484155b3a.16.2026.07.28.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:15:53 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:15:43 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH RFC 7/7] riscv: dts: spacemit: k3: Add ACLINT MSWI and
 MTIMER nodes
Message-ID: <amkp9dLCVKTilhO-@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_151554_937909_E7E6509B 
X-CRM114-Status: GOOD (  16.28  )
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

On Wed, Jul 29, 2026 at 12:36:33AM +0800, Junhui Liu wrote:
> The SpacemiT K3 SoC provides ACLINT MSWI and MTIMER controllers. Add
> these nodes to complete the ACLINT description in the Device Tree for
> M-mode firmware such as OpenSBI.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 5fb719f79467..ecb5f4fcd8fd 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1303,5 +1303,24 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		aclint_mswi: interrupt-controller@f1810000 {
> +			compatible = "spacemit,k3-aclint-mswi", "riscv,aclint-mswi";
> +			reg = <0x0 0xf1810000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
> +		};
> +
> +		aclint_mtimer: timer@f1814000 {
> +			compatible = "spacemit,k3-aclint-mtimer", "riscv,aclint-mtimer";
> +			reg = <0x0 0xf1814000 0x0 0x8000>;
> +			reg-names = "mtimecmp";
> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
> +		};
>  	};
>  };
> 
> -- 
> 2.55.0
> 

Squash this patch into the previous one, it is the same device.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
