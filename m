Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F62606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vgn3sFYU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=fUzilic0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s/+i3TPOKShmM+oy5fBlW6PWIcnlh+9JoCYnl6anEHo=; b=Vgn3sFYUGO73xx95AJOKCJX8d8
	IE4YuoR8i0ru0EeyByZKWu9Q2ulIydAeRor2HPg5AG6ON+J8smUvFEh4ov5SvB0XXtibCIuGoXe6C
	sNPACZv6MvSC7xVd6tvZw2BUT7osekV/8rLyAisXPRANAIrbHuXidhAqE2/mMdbRVzE02MUA8b//t
	WuK9ysRsydP4gowdpEQ1Yp5f//qZIlEenILHWa8WcB06gZONB/bG5rPrVJGL9/ozCqPPfFs+HzRuV
	HPzOyvDDS+rixd+FMX91zGoHMd3jtVvhcEqfQk+G+zl0Tu/C+xXwLbHd0IXRsQYfG6mKuXA/vZ2VZ
	MBB0HYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoVN-0000000Exb7-1byY;
	Fri, 27 Nov 2026 05:28:17 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWoVK-0000000Exa3-209N
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 05:28:16 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-679aeeddc6bso7337298d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795757293; x=1796362093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
        b=fUzilic0Uq6sNzF5y7BMJ88QUo9IP0CRswYUpUkW/7vnlTUbpPg9X2MLBVcpGB+skP
         X9C3cZgpA0eu1h8t5Uj523AjtyMavmsUr4JDLTS8DQ3uxVsRJHeT5i3DrbClBVBo1W/v
         rTm1bduHEjVo7IrLnaahOPAguENGXjzcykCRfU5F7m+zDLsAvMRE+X3EuHLVtBxt8vDj
         TeEUZkpsq/PF5Bt0dKQ5ErZqVGKsQNW7+j+IkO8dE0lcxTfXBa3ZA3q4XpcsMMxIOPB8
         Dz+uFaneovsNRSmQIjO+cjy2ephwmZ4b7Q3FStKIE2LpjkRRwozbzk3P9gobuYQRhY5g
         CC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757293; x=1796362093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jH/OKgM1gQSDKQc5kAy7iczSgneLDrLRkuuGZg3T08=;
        b=P5j2UgNspUbn/RmwZ6oHEx29iLljPJm+EaGZurIeGoH468HTprWORFGc3ol4/v5Cjv
         CzBgy4jtskwoNHhT6qU7N4nDb47HzQt6NU5mPCEnwwmOXVmLXrqMGBYrJOs6v5aFOj4W
         VItmYmR5JkXP6gKOiB+hE15vAy4ZBmT3dtfUgmqWOhOBjv+P6VQ3xGqMG1j2O1AeRkwh
         CiD0bgriUprsIoB3ryzr0VQG5LpKaJiRFFyNtx7FPAJ4EkmbjUBmOiceNOFnhhURp8DX
         SZc4glmWVAPYjfaEB5jMTOjMiQJfzKfoyPPiO3jEbYO8hyRHcIsi+tY3aE81iTk0JCMv
         yNeg==
X-Forwarded-Encrypted: i=1; AL+hErGV344BGvlXVQclTlzwvV8MNIjlQWHrQ3raf22Szyce9UBuvqV1ml51REwTjYoG8ieTgGZvdy9n0zTyPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9qZSIVFBWx6HzM/jLjUor/cCaID0sP4ef8fvrJ5IaK8IOjOECK
	/fWsinZyODvmCxFb/jZYsi7iKMDOxv7A8J8vdRdj17XeGkInYUMSY6E58ukLvgwI7Uw=
X-Gm-Gg: AZFdTZew+uHvUeYBUq7B9h39bTxFzjmZzTL94WqlY71+T+mx3VTQBnRzo2EBqVPAZdG
	h0SQT8vGizYEcAKBpK5qW7Q6GQB7e7hX4Irp9bzEERBtZBCKQmfeTesUf9iyVleBf13eOlyCzAQ
	UXKcEA+2Et5wo2wRxna/y7geTpoGGUKKYzn4TajgsRUDSnly2KCxTSbnAlsZwBhA/IVajXQGE6H
	H1/fXI73ItS66jPN1k4ZwCiq1cDmOevCgH9GmYaURVV3YQaF5vckZC/5qhfrvvxHfLm5zehsEC5
	1V41qAoLj7J06uh3JKsEyi7Se57vyGwE99ho5PZftqWC0i1Vc6JnkjOIDjNkE4s0ZOIOhkw8Rix
	EPXrS+Bzvhcryzpvs7ddh0K2aKkV1FfiWtT3CS9ypqJSEa7w3C5mN4C5Oer0umAyvVl3sS+InQe
	y9hcvJZz/BUtxdrPrfWQ0ImDgEwcUVHOOgpTKeK1BcKmqfrhtLMA0EVV+fstLwQrhMi4sdN3R+v
	qgtizv2OODa50JEmOxvq+HulynBoAUon7rFVD0K9UiKjoRQ+JA5yToCK8VSFe3ZiApeDyIiSDeM
	2qFDaxXk9VWxcObxZG8pETSgcFLOJSS3JLLu21Fb+jgBUrpQx62Hmw5pxOD+5CyaMau0AQLkp09
	spmaxAQvO8LGzjYEbFlTI
X-Received: by 2002:a05:690e:4594:20b0:67c:6ce7:c513 with SMTP id 956f58d0204a3-67df44da548mr5273707d50.82.1795757292881;
        Thu, 26 Nov 2026 21:28:12 -0800 (PST)
Received: from toolbox ([2600:1700:220:59e0:e3a5:f585:4070:c566])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm11238363d50.22.2026.11.26.21.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:28:12 -0800 (PST)
Date: Thu, 26 Nov 2026 23:27:47 -0600
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
Message-ID: <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_212814_656207_CE257084 
X-CRM114-Status: GOOD (  20.98  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junhui,

On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
> register space in the non-secure window as a legacy CLINT.
> 
> The ACLINT register space is mapped at two base addresses: a secure
> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> secure window exposes all three components, while the non-secure
> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> there. Moreover, depending on the eFuse configuration, the non-secure
> window may be entirely inaccessible, whereas the secure window is
> always available.
> 
> Replace the CLINT node with the three ACLINT devices, all using
> secure-window addresses: MSWI and MTIMER for machine-level firmware
> such as OpenSBI, and SSWI for supervisor software interrupts.
> 
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..74831974435e 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
>  			riscv,num-sources = <512>;
>  		};
>  
> -		clint: timer@e081c000 {
> -			compatible = "spacemit,k3-clint", "sifive,clint0";
> -			reg = <0x0 0xe081c000 0x0 0x4000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> -					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> -					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> -					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> -					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> -					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> -					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> -					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> -		};
> -
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
>  		mimsic: interrupt-controller@f1000000 {
> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		aclint_mswi: interrupt-controller@f1810000 {
> +			compatible = "spacemit,k3-aclint-mswi";
> +			reg = <0x0 0xf1810000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
> +		};
> +
> +		aclint_mtimer: timer@f1814000 {
> +			compatible = "spacemit,k3-aclint-mtimer";

I think you'll need to also include the "riscv,aclint-mtimer" compatible
here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
include the spacemit specific compatible. OpenSBI boot prints this
currently.

Platform Timer Device       : --- @ 0Hz

> +			reg = <0x0 0xf1814000 0x0 0x8000>;
> +			reg-names = "mtimecmp";
> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
> +		};


Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
