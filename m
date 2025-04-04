Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E491C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0Gklm69UFQ8rh2YaWg19rdc7dXbwXuA6eel+OmcT88=; b=yUNhQ1QitGDU/+
	bOsMkj0U37RjvofJeLL+tV2a7YsLY3iQnJ13bObMGS4LF0bPTc3MGRv5AIzfJozu3YMRB+0qC336C
	PZ1hppqebuaj1ycCTTF2518mYC24b6bb8fKy+jrmIyb2DXk/KlhB7uFJe2c0oWNwKsoVeHPqAyT/b
	aVjuBOGDYVJVW3Lf4YMITwE93jukngPiJl6Tof2kuLcOBiLkgC6/RTy/gHxPKi0mBrrzS/01qQV6W
	Z5G8tY2i0iM1jPXsGB7FAE/IfmnS6GCoDuoCYm8ONIuc/lt+N9YLY0odOgVU7TbHykuFywd7xlAUL
	Jp70a4duSlxA3z82DT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0qGr-0000000D3pK-2cwD;
	Fri, 04 Apr 2025 23:16:21 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0qGp-0000000D3on-2a7i
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 23:16:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-303a66af07eso1957824a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743808578; x=1744413378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi0GUgnEAFI8Tq5WlnIINEkOrw3m9T6yA0HO5ypDLqM=;
        b=HzBXR9xpJvGO5TEenR00F/QxQXS/9/ao3c6Zl/sZpZdOzm/SPNrcAfkcb1VHL73qa8
         SqY+3ORkFRPWmspcZw3OQ6rnSTLGBQnlTcTaA+zxSVT4VdN2X/xMRI260PR0ouQeJQft
         6hrXgkA8qKW1A83ELF6Erk7hTFtg6+TcrbLjrRZ9WUL5AiMb3itL33QmJUcpUFE9OgNS
         bJ8DcPEANpt4JKC0Br8xKHfEGLOu5xQoI601BqWOb2IZ1/bIZZOIvZ0zPxYCjjuE2X3s
         4bLcWwq8eTISsq1h6EA//f5xrs0mStcHl8gQP4uMabYzP+M3MzCMAmbFXYXj5aPMcyB4
         gHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743808578; x=1744413378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi0GUgnEAFI8Tq5WlnIINEkOrw3m9T6yA0HO5ypDLqM=;
        b=BYQPeDH5lbJG6dYLfQUuFY/9mySvppOCCZQv9GZ9ofSGg9iVKe0jrP3jLzcvfEF7Td
         FpD0rZnjO7P//y2b3a+xOq/REA3N2uJBlUlvPRsn8A7ZOD3a7nZn+k31Y6vlBicTMhgA
         8bEplQg0G858cSBoN0ofgpxuToMcDfVpmT9K+akaGxSoob8pXPteFR9EjS4JQM8lgHqy
         skXxuOZ6USUHrQmI3GgRKQLnMmDFij87eZaGZ1RbBBzrMrFDfXGii/mPLaL2OYUihRt5
         QgR4evuaQ36daWyuS0EPHg9OB+uyEBbKBnVC5h+JATsegUyOB5H0XcyIQAKyFfOsxNhS
         zG3g==
X-Forwarded-Encrypted: i=1; AJvYcCXSB5KrjYTsx29Dxfk8M1zYt4zZIlkfp72t8vQVwRFbqNBbO+nJ4aeyNTSTF03HUs18Dkefle9S98/Q+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoB43v+lLzWkLMKOnUFmPxolm8dpqJ1DjsOSClJNdxuUPdHC04
	vlh8VFJGBzkwf59TAkj7F6XK6S/7bp0C+W5b+m2dlIlmdK2NXeurbGto/O4Ts2I=
X-Gm-Gg: ASbGncvsecZWUWKNhSqlE8lhyBJYXyp2+TkHZxwP4vNq5uwT6alTfRmdhltayxxXFKY
	lv2U8epmO7YEB6mZBqxMbG9wcSFx5GjW5cVzQLr4U1Y+v5ySKPw6DAkckhdf8g3nDsm6oIgfXOM
	JK7MgvZSN8yjZL5QrvVMAaozgthMK62jfuz8I/NzYXYuK5uMuwotJhIHIPmu1qKHF44/vqMbgsp
	LcsINtZmF6MMP8X5OBGenArMFKlEzau/cxPPSQga3484Y35OdQ3OVlBX8bXFxEf4EgMThwnSrvc
	IDjVFBDZ53pJ5JnLLbB2bB5L
X-Google-Smtp-Source: AGHT+IHC31M9P+ufU9NLoFJjA+hcOFrxMJv1oldOlZ6NzGrsyiNFFvfRRMA/XiiS+ri4Zo313E4eog==
X-Received: by 2002:a17:90a:d006:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-306af71ce82mr1669762a91.12.1743808578500;
        Fri, 04 Apr 2025 16:16:18 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305841a8ae7sm4115878a91.12.2025.04.04.16.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 16:16:18 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:16:16 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <Z/BoQIXKEhL3/q50@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403094425.876981-4-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_161619_917840_1B686D1C 
X-CRM114-Status: GOOD (  18.11  )
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

On Thu, Apr 03, 2025 at 11:44:25AM +0200, Michal Wilczynski wrote:
> VO clocks reside in a different address space from the AP clocks on the
> T-HEAD SoC. Add the device tree node of a clock-controller to handle
> VO address space as well.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 527336417765..d4cba0713cab 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		clk_vo: clock-controller@ffef528050 {
> +			compatible = "thead,th1520-clk-vo";
> +			reg = <0xff 0xef528050 0x0 0xfb0>;

Thanks for your patch. It is great to have more of the clocks supported
upstream.

The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?

I see on page 213 that the first register for VO_SUBSYS starts with
VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
CCU_GATE macros use offset of 0x0 instead 0x50.

I kind of think the reg property using the actual base address
(0xFF_EF52_8000) makes more sense as that's a closer match to the tables
in the manual. But I don't have a strong preference if you think think
using 0xef528050 makes the CCU_GATE macros easier to read.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
