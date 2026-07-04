Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2B2C43458
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2026 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=as/uvnKxZ9SC5j4Cn+tG4amxKwEr8mnMzcQh1phbXBs=; b=my7FZOsIzjCSuG
	G0kb823bxS1Zkz9uHSPL7RxOJgKFQMBDkV33BlNSU33Q5xNW7ZgUBzqCktF49Mz+diGlZ2J50iH0x
	l8k2dh3y4ENg0fAvfGhPePsCGxtSFqWAjUEGXolyXWhQ2gn6y4d0unchneKVssqi6UAz9NUF5eu8R
	IO3ADhzKiQzcJ5PBsWgC9F42ZlZ4Cq9ZIbZh54yVsLOXlBNG8EpUTtdpfmAqU4kL5AP8PSJUtnot9
	D/h4DGfFB/tD3wA+dg6c0MpA1R4oPbYiGLAgZOwUh2h354YTwpsuFJ3Qj7xT6fmj48nbCyQrtGXwV
	Sxp0PC6509k5EN4qpVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg0xX-00000008UYw-2ibv;
	Sat, 04 Jul 2026 14:03:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg0xU-00000008UYL-04Cc
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jul 2026 14:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783173782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
	b=Ka60bbXV97vjCrP5SoZqJRsdXtTE3dDAYu6x6l8DwL2FbE/kgWRkfn/Rd5ASwlaDjF/rVE
	pUX4LfRcYfO2ALXskBQt0GaVGBCv3fWyuD8qqJSSckqUJlNgThvTZTOhN2fTU01SAdwAL/
	59DbV562WVJd+ZOx+ALfEHs79fs08H8=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-RzQP90slOL-xL2f_e0UqVg-1; Sat, 04 Jul 2026 10:01:24 -0400
X-MC-Unique: RzQP90slOL-xL2f_e0UqVg-1
X-Mimecast-MFC-AGG-ID: RzQP90slOL-xL2f_e0UqVg_1783173683
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-664a090b4dcso4689162d50.3
        for <linux-riscv@lists.infradead.org>; Sat, 04 Jul 2026 07:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783173683; x=1783778483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG/qppTW5QiC+uZfEkeQXRtZMh5udm6vGfwyGZ5WcNg=;
        b=qKFuvFe/GX3AqRc686fSrPw+mRu6DVs4Xq+/YTxQSxL2sMxXKsjTKwYMgb1qCssrdL
         dTh/RBdV9NrqgZTjL4bybmePd8yoNWtNs/FOFjiqqhtLzK6SKGOmp2HcCgNOk7mVATgM
         SnUoGTdlt+wzwAkDuYMyxH9GigPWtmYb4JhZrqQSdWY8yNYplYaooMM/sPy0mjWSanoc
         hxrVysuvxnK1vxt1LcLr4Ji1Qlw+KX3t03yh9EDkv4fHaAO+/tEN+wJgPFfKL7u6Ejgb
         J32fwrXaQFD4dTZYOgVklxCYJwAEKuwP8DR+Ko3pG03TAn116imdWwob+tLJxNIwMjXo
         PV+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPUXZJ//slnVqvJAk4dnm6qexXfkhAw1Gtn0/pNZAAKqlFNeUBKINldqdwUsveVNogLNfdVSCiZS7lKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYQud7Qjd7/MHyzgfS9BthQjlxlA1rYEND0i02NVJDIbCvLDGS
	SYz09cP16mgTUH2vz+51yJCFKpFWeZU0InMG3jt3KMy6KH0TiznZ54BKcXx++p+V+2sEI0rhB3E
	A8WnPc+J1IBzMPHrJkShBvX7KPWmxZlkbuqqfWEkv+Xi4kqEgt3FywJkOb/LNxO0725cTMw==
X-Gm-Gg: AfdE7cmmhmRzBK0guw3dE2TjPdotJDd53yBPY9Lg4SD9i4x9xcudVKA3hZHaPKmY70g
	qVmvc8MM6lb0c+/hppnz1zTTKx0VpC8oT4wVhA1b620lP4C/n4BDrElfwv7hQQ0EcBunWuEBFyo
	Kyrr5lIvhW1yg+o618ksJpGdUXIBpG/9ZMZyFhIZJgQLAt3Sbv9XzKiolqKxgT2Ngy29SgVEGSK
	Ra3EHs+zh9Imtv56xBwUKuq7v7g22GwONI+NdpzwE8w5CMXg1YoPcW6HJd1haa4yHoE4PcX6+m8
	IxmN29cRQ60dbtpmB6niUgIu0D9jMLoEYirkuCbipDpUvRmDDLB6aHx9NpGshdM=
X-Received: by 2002:a05:690e:454d:20b0:666:3330:3d8f with SMTP id 956f58d0204a3-66652e9dc1emr2462308d50.51.1783173682777;
        Sat, 04 Jul 2026 07:01:22 -0700 (PDT)
X-Received: by 2002:a05:690e:454d:20b0:666:3330:3d8f with SMTP id 956f58d0204a3-66652e9dc1emr2462196d50.51.1783173681958;
        Sat, 04 Jul 2026 07:01:21 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-666408b2d99sm2171811d50.20.2026.07.04.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 07:01:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 10:01:19 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: Add UFS support
Message-ID: <akkSL1nQ5UieqHNs@rhdev>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oP2YUkLocxaE7VSdbzpWfXEz70QevmHkXiT5CO5Valo_1783173683
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_070304_136266_EBF8F032 
X-CRM114-Status: GOOD (  16.97  )
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

On Thu, Jul 02, 2026 at 02:31:37AM +0000, Yixun Lan wrote:
> Add UFS Host Controller support for SpacemiT K3 SoC, and enable
> it both on both Pico-ITX and CoM260-IFX boards.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   |  4 ++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi           | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 238bb03d0e9e..b37e1c7b03e3 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -19,3 +19,7 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  };
> +
> +&ufshc {
> +	status = "okay";
> +};

I believe k3-com260.dtsi would be a more fitting file for this change.
UFS is soldered on the underside of the compute module and not part of
the carrier board.

Because it is next to the microSD card slot, a picture showing both can
be seen in section 5.12 (TF-Card Interface) of the PDF version of the K3
CoM260 User Guide. That picture is notably not visible in the HTML
version.

https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/eco/k3_com260/com260_user_guide.md

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..f1560a5a9031 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -221,3 +221,7 @@ hub@1 {
>  &usb2_phy {
>  	status = "okay";
>  };
> +
> +&ufshc {
> +	status = "okay";
> +};

Nit: if sorted by label, ufshc would be before usb2_host.

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..6c0b0598d5c8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1186,5 +1186,18 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		ufshc: ufshc@c0e00000 {
> +			compatible = "spacemit,k3-ufshc";
> +			reg = <0x0 0xc0e00000 0x0 0x40000>;
> +			clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
> +				 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
> +			clock-names = "aclk", "ref_clk";
> +			resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
> +			interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
> +			freq-table-hz = <491520000 491520000 19200000 19200000>;
> +			lanes-per-direction = <2>;
> +			status = "disabled";
> +		};
>  	};
>  };
> 
> -- 
> 2.54.0
> 

Best regards,
Jennifer


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
