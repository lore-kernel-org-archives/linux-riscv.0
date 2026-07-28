Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418A9C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 22:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GZbmZiNeOIU7v+IlTAHtgNXauiFfpCop4fLQuZCzkY=; b=avKpp212SuFled
	Csi03lc4n31UV4/TEYDBu5LxqY7/fcOZ0b0NN+JjI8ErU5QFhXzRHkDV6bPUaU9PCqDG7krGRIuyI
	Lbvh3SF5Fdqq1mtV8WGyhM/o5498rE8G8nctp/gY/WkXUicAnikVUKsxzvQA34LLwv/4OnuHeTBri
	SMnPLmeui3Eksf8IUqZyopWmMGpQjhCVTl2WfVo4hXqYq9b/TdARPpCo6hYwfShlIdj8ILg54aHT8
	8hhpaDRUxFu2F/5SMTM0gf1eaeKt/UhjhjPzIvwBguzCInroSbYEXhgx1OhEEP0HHjTPRQaXJ7ZAg
	vaPOg6ljZHj5MAJ/OXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woq3g-00000006Oh6-3laO;
	Tue, 28 Jul 2026 22:13:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woq3e-00000006OgQ-01GZ
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 22:13:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2caf228a910so2918905ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276833; x=1785881633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCl15eSRo62XRO+xaCq2uVtZDF7Ezk7Z7ce7c0TVl9Q=;
        b=V1/itywthnWZ3jp5wYryJVYN8GRE8iYl+2kskGGkV3kIDwhL08q+EiXWnDqpv46YQn
         /bfcK7Z03SmI+NrAiV7wf3dqyp7Oh4860zIxBroOMn91FBFTlvBTQl9yveKECEGEzqW5
         VWNXnTmbZhGHaBDNCJQuBrOw0XM+8FiEd0VBYF4MMEpV00MDiNy6fenm/8nvaTNeOAYP
         itwod5vaFK+gC+R1II6QsR0e9d01+aZ50753aGRsYxQasLgtDnm32WS7GT3VQBWO2nVE
         MKLcDsT6zDsWZeu/r/mSFKx2Y8DPPvCwVZI2urTxcUiceZE1Jk7x5arrXSuohr443xoK
         NUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276833; x=1785881633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCl15eSRo62XRO+xaCq2uVtZDF7Ezk7Z7ce7c0TVl9Q=;
        b=Nlfswp1ShEkpYDIexMsbdETUwNHnlNd47Ih/fChX5K0jMyN9XRTm+nIgCEx3jZwZKC
         YReWr3wMi+m/5MDgJBrEGzKqkeqa72xnRjP2+omh1qTye+nzpvwHVorPB5skZDQEp8Fw
         flquSPYMWbfNtHzYPGZCthFjGRcFPAvdLthdbtnMyvOT3Dvxp6mDl1buJY8yLmhMYTbB
         bzFCDEAUa1FjtCPhYwQag/GSFjIMgfaf+enM3ICnPcaUm3gCmcRiGliIi/JnmHchl1qC
         rfKiFLVJis6wLiYich/3oo8UEpybMVg0ilFCtl8l1XDYekL++iuo6gcp4kNiuWKDfgzY
         Ki5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoT2qXMvE781ACwVxOA7vm40v2fEYqswfesob5VsAKgIeOVsK9J1enrJf2QDLPbIINBcU50DIxoKUsSdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi+Tou8lJPU/bBZ5i8Jzjo7IvyOJEM19YJLTcv1kko+GRcvG6Y
	o+0gT2/QXnttBVw2qN9IKhKjjAgFPJHJp8opebdu+UaOL2hFh7drAqZd
X-Gm-Gg: AR+sD10eEQn90dSmaicSivDafMLdR4Beso4KZoZXUD9GVwq4DBRyXhS/AWKoTTenOuv
	f2KHXuK/Ff+IWiNvOA1XGeDOzBl5efP/cn4L6L0BGEW+wICe9J006Wk5ygGKlOf30xeNeesZK0v
	+zr1cFfTGroLe406eqVOPBvv9tKvaC+tU3HUH7v7Z/VoG41S26s1FfiWniQwIS6PRJnV6phFzw+
	SURRK+gJehbZ85HqxA2qudy/8Mzby8ANFVl8ijLr8SNXuA5vI7tZKuNF+E908aht6X5+0+IyEV3
	gIgGtbrGqriGdkL7mid0S86Ll1jKzPtN3S83m/WzURrtm6BT8j/EUUiMPpKc3x7OewQHC8MP/yO
	Wbi3pInrhdDOcIxuWrrwUznsLw2xm3xsQ1vochTlxRAY5wBpDD5tmTqJy0BRg9E9tgz806Ot246
	3dt5Uwe6Ki5uK75p8OTbj83hHedYQJYh6I0Aw6VleHQVLDnz/Px6JqgD6FOO8=
X-Received: by 2002:a17:902:d2c8:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d015c8fbd9mr45936265ad.6.1785276832549;
        Tue, 28 Jul 2026 15:13:52 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm2108355ad.57.2026.07.28.15.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:13:52 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:13:41 +0800
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC 1/7] dt-bindings: timer: thead,c900-aclint-mtimer:
 Add SpacemiT K3
Message-ID: <amkpPAu3sqycI3CZ@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-1-aef88614d3a5@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_151354_046810_1E316F0C 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, Jul 29, 2026 at 12:36:27AM +0800, Junhui Liu wrote:
> Add support for the ACLINT MTIMER found in the SpacemiT K3 SoC. The
> hardware provides a ACLINT TIMER unit. Adding riscv,aclint-mtimer as a
> fallback compatible allows direct reuse of existing OpenSBI driver.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> index cf7c82e980f6..c9429a2fa364 100644
> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
> @@ -21,6 +21,10 @@ properties:
>            - enum:
>                - anlogic,dr1v90-aclint-mtimer
>            - const: nuclei,ux900-aclint-mtimer
> +      - items:
> +          - enum:
> +              - spacemit,k3-aclint-mtimer
> +          - const: riscv,aclint-mtimer
>  

Drop the generic riscv compatible as Linux only accepts ratified spec.
But this ACLINT is already archived and will not be ratified.

The request also applies to patch 2, 3.

>    reg:
>      items:
> 
> -- 
> 2.55.0
> 

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
