Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01678606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 21:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Hj9OorQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=QgUCELLF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8HDmoJSK8wQ2rPMcbcDuRtQNzVBedZpFR+kURXLwfoE=; b=0Hj9OorQ3CUy2PH9b+o3sRqeNT
	mMm8unTam60CjKowzATY2/8RvJiOlJTWrVOfSeTojXISaUcPEBpfpqFg4vfL4c+7T9pFode2UqS0H
	YJDVBYxn2CD3GIXKQoRu2+SDaPErHWDlBLFS2y11lhfG4VPI7xME8Spr/R1vQ+tWqyHy+hc3Fmcid
	b1hQBGVzUgxBIh8sKPmv3vC12xpu1LspW5YepzSWtMXiRQdJzLA5r8zGGWlo1v437KL/ja5ljjroD
	O6igGBmoxkY2FwJvNfXwc0PbQBRnSYR3LlV/wyo1i7lQWJ3l1chARyaXdr6Th1Ql3eY+BOQFvVVbv
	Lgo1/9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyVK-00000007wom-31qH;
	Tue, 24 Nov 2026 21:56:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyVI-00000007woE-1L5W
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 21:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9X06TH/eKKW7Q/OT28lgH1tdTkDqNa2x4QON52BKzhU=; b=QgUCELLF9S0Pdj6zZVDyGQPsbG
	9HslDjK3iUkWJhSQFryuJSjvGbl/jNexc5qsiqF74HwfVuKvX0FAXdAxe2ICmGN2zCcs1E7GFrco/
	UwSBPU4a9IvNcp1T49T8BE7AetVOeTyoFcT9iAGfmoPmGLMr52/nj+W4JusSI4+PLw1NDzyD4N4WW
	B35UzJzzj50V6rhjONOmWtW1KiNWhCjlKVUA50KGuw1WsJ8r7jvFl8D4iDoM3fp9+uUiA7wXNuag4
	yxs/uyGcRBODd+oL42kkPdnEVFXt+SwjAuxFPgH0g+yK97byxyYa3J3U9yAefifwT9Z/09td+tYvN
	3p89apag==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVyVD-00000008zX1-2qFO;
	Tue, 24 Nov 2026 22:56:39 +0100
Date: Tue, 24 Nov 2026 22:56:39 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <awYIF2ynf95-g5-W@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-4-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261122173810.2409146-4-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135644_516350_CA903D17 
X-CRM114-Status: GOOD (  15.85  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jiayu,

On 2026-11-23 01:38, Jiayu Du wrote:
> Add the K3 eFuse controller and NVMEM cells for the temperature
> calibration data in bank 0 and bank 7.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..af1a758788ff 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
>  
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
> +		efuse: efuse@f0702800 {
> +			compatible = "spacemit,k3-efuse";
> +			reg = <0x0 0xf0702800 0x0 0x400>;
> +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				soc_rtemp_trim1: temperature-trim@1c {
> +					reg = <0x1c 0x1>;
> +					bits = <0 8>;
> +				};
> +
> +				soc_rtemp_trim: temperature-trim@ea {
> +					reg = <0xea 0x2>;
> +					bits = <4 8>;
> +				};
> +			};
> +		};
> +
>  		mimsic: interrupt-controller@f1000000 {
>  			compatible = "spacemit,k3-imsics", "riscv,imsics";
>  			reg = <0x0 0xf1000000 0x0 0x10000>;

This looks all good to me. The offset and bits matches what is in the 
vendor driver (after mapping each bank to the correct address).

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Small nitpick, no need to fix it, but the vendor device tree also define 
offsets for soc_die_id, soc_ver_id, soc_pack_id, soc_chip_id and 
soc_svt_dro data. It might be useful to export (some of) them.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
