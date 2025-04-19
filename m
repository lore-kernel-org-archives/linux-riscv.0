Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502ABC369D1
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn8xAGHlNhoa7aTCpsPwOvhUbQRO/F1Z0asEnkmYCTU=; b=yYUdSB0i8kpoSo
	h9viX69vtLurfYCtlFIxBDFBDHdSBUvLj/0D8uWzirg31ZPsl9PtU/WnilLJ0i49UHfmJ84mXobqJ
	m7+KB5C6R73sMoWtI6fwxqQLxU6FHs2McYGRuXgLnNj3Sl60YZd7Ppo/prrCBmNt137kj+z/X1DSd
	XAy/fC6c1lj4DPweb2Wsqp29BKRfeOJZvUVZduHj6jxzBRwww7COGDkK1N0DMcGLgc1t4KvQA1jJ8
	1aGPt/TXPJWkIywM/wO1D6/gHOMGhVNgd/sVvIPKPtP68dzBJL9KfH/vg0+MlxGGiOkpX+YB9hvhj
	I4vuJ+Ja+Ijj8G3xNo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6DZj-00000001i6F-3q7S;
	Sat, 19 Apr 2025 19:10:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6DZh-00000001i5Y-2EOo
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 19:10:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7394945d37eso2292966b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 19 Apr 2025 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1745089800; x=1745694600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Deyh+kw6etAKus8FLe7WroHoH3C1oetm0Mie3XbPmnk=;
        b=3Yg8RZ10eB9zdPlTu0Bpl+W0kMnCg4roApfV8pRtkj9db59wvygVXn8HwfH4JMwIRG
         nQACzZ9sQvKuJGmNt0voJHVqrdxezizWhsKWMUYMuUPFIlMU0nCv9AhFqVYaWviB84hn
         0qEk95HS9royrZLovKKAT8nBz+1+VQibVvrr1jPSRWmeVT6D4ic/nRC/Kctkd3SQAg7U
         bQSphAsls1lZ2pmLS4KJwqaXSBYDAagUUTc0e+AhkEa6WVUJo+iJ6xe2JWe5Ey4plREH
         dL7AImZvkeIRKNYQ8k7Q8InSOzidFQkeTws3Lc4MGNu/w5VOjUohzHFkKsdk+E0pI7xo
         iYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745089800; x=1745694600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deyh+kw6etAKus8FLe7WroHoH3C1oetm0Mie3XbPmnk=;
        b=bhhdGF52WExSN/nKFaLlwBDzvzfI0gg4KKbobDA4RIAxucixPhdO0R5UAxGKNZ6HN8
         HAdIWOKei+Uil+v1G/5to8gdoSB++vSjFTN4gzsLobql7gRgs2eWWT84jp3BPy+vhjf0
         fY1Aa1tSKn2x7BG5KVd/nWoIA41PCViKIYJHyxk69XPNQSd4gZW+UOOdeVuEYgYcRPuy
         CvFEpvIMFFttt6YZ/3oHYKNnvMFXIZ+aALTFz3SrUFwpQiGM75m845b1LSU5i/iBEEZU
         g06IthdPeRGV/5kx9Cs47Jv0bRVAFNLEA5nDLKUTyJQ6kgt18gONuWFirE2Z4Pb9Jau+
         x61A==
X-Forwarded-Encrypted: i=1; AJvYcCUu1hNegIJ7ec3yt/xowM2xt4A6OSMmf4/lTQ9SL09T6pVuupetQ9L8TENjPBsOco6prcgvlGxziZ/dSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGP+FX2M6hsJyp1TBNWq6TqWRAdExVOXtB7fwUxERd39J1IBnv
	atZmQ0ceDxwq4axbcDbMNFZ1tABuFyl2ZrLuh2Gja7ebOuio1te107NexaKkceI=
X-Gm-Gg: ASbGncutoXA7XFkpfXBUlGMmDEG1z4KceKUxElKlz6XmccgctL/GVkJHtDqW5SYNKCG
	U3zd8fXuqiTaBdzh3t/GzQnJM6wsj9lCuJQeSv/CKndxGHhnbWcPwXmctHMOfRSkYbFxEMwwm+L
	sYXU+T06VANSKGiK2QfrH3OLbojVC8D55H8IxoyxVQoSRlDPALmXULQw4JYj0+x8mKr5CSInnBv
	0UsLS4vNyROLAR98wKNfqjULzJ3luB6AjoNF2tM4csKFOSpro22cLaCAEV4xaiS8MwLzMaQqtP2
	Nu+sXufnpN2FfeBeXBoyoV+H9oeZzLx+e812xQCTrpMKOdY=
X-Google-Smtp-Source: AGHT+IEulD0uH2vbpuR4f4ZA7Mcq0ByRrFg1az3eKDUNZKezFcapWJg4o30Tvo+Xd7BMD278/s2TCg==
X-Received: by 2002:a05:6a00:9281:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-73dc1442ee6mr9314401b3a.2.1745089799961;
        Sat, 19 Apr 2025 12:09:59 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7easm3611489b3a.84.2025.04.19.12.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 12:09:59 -0700 (PDT)
Date: Sat, 19 Apr 2025 12:09:57 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 20/21] riscv: dts: thead: Introduce reset controller
 node
Message-ID: <aAP1BW3RmMb/Irya@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-21-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_121001_705826_687AB283 
X-CRM114-Status: GOOD (  14.50  )
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

On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
> of the power-up sequence.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 474f31576a1b..6b34aab4b455 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>

Are you okay if I omit this hunk? My thead-dt-for-next branch is based
on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
window.

>  
>  / {
>  	compatible = "thead,th1520";
> @@ -497,6 +498,12 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		rst: reset-controller@ffef528000 {
> +			compatible = "thead,th1520-reset";
> +			reg = <0xff 0xef528000 0x0 0x4f>;
> +			#reset-cells = <1>;
> +		};
> +
>  		clk_vo: clock-controller@ffef528050 {
>  			compatible = "thead,th1520-clk-vo";
>  			reg = <0xff 0xef528050 0x0 0xfb0>;
> -- 
> 2.34.1
> 

With the above caveat:

Reviewed-by: Drew Fustini <drew@pdp7.com>


-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
