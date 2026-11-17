Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E8A606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Opk1RXgh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=u5qDXirI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BMWCFih9Y99az5xVAwpu/pCWJw/X+hHvWOmFcsv/NN4=; b=Opk1RXghMvOXRsYlb7X2Qx9Ybw
	Ulcza3kzOpDn0vgqovC4aPq7XpPEIF7EZTPfhYRZXuoLp0i03C8Lp/B3y8mZmeVZjIyzWp4F2psBZ
	6hMt+lU3+8GZAtvLdx1ZdTTuAWSkQBuGOmv4c3Xm2HMyi35uksAh3XxOsDdyA1ss4np3P13Xgjh0e
	CHtYIg+rZlfMbOc1CoKJrwjH0D9sBHOwpGQbTxz+3S910JSiDRWigGzF9A19/6phtj4dDY4iAXQFe
	5YMXRwZk1wKa+5lqPQq6Czvw4wAi74TG/eJLYHznOAX4/A6ZGHmfSkwVhEFXvHjxpynMeJNYC017E
	3mcRzebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQRR-000000075JB-21w1;
	Tue, 17 Nov 2026 21:10:13 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQRN-000000075HV-1wMB
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=HICfFCG+80CknwwzIfTqwAoMgSOt31xC2GzuBsrcSvI=; b=u5qDXirI+ef4oJPlGYOxMTgkg6
	jJr1x8m0UrWOZS6hIGBEWwoQMfNbN1iUU7+1EJV7f7pWVE/JO+mIbvzz5bpAQC/JlqADt6/J1zKf3
	ht7sDLpyCV+P9lFEWgbBM2Ark3wCpJbCFTef7Hbtt+9B6VXnxgrGZoA7lhn3kbEWBHEgtYviVqxjp
	Xur/6/nhrHVpEBDSWZ9vspga5Pyd1PEbaCBObraLtVmqdZluqyREsSkagyyOHjcT1EvvZYnQ9G9XM
	1fLFwcIgUlBUTb3vKFbKn0wIplndFtfBq/TrR3miJrlrWGCv2wqB/QwfI9gKDkpzHwM8voKfOnjFa
	W97kXp/w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTQRJ-0000000GYH2-31Kp;
	Tue, 17 Nov 2026 22:10:05 +0100
Date: Tue, 17 Nov 2026 22:10:05 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, me@ziyao.cc, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Add K3 eFuse and
 temperature trim cells
Message-ID: <avzCrWttYdMEtB-e@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-4-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116075423.1519438-4-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_131010_417231_E7CD2B8E 
X-CRM114-Status: GOOD (  15.40  )
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

Hi,

On 2026-11-16 15:54, Jiayu Du wrote:
> Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> fixed-layout cells for the temperature calibration parameters stored in
> bank 0 and bank 7, using controller-relative offsets.
> 
> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..b548f5029d59 100644
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
> +				soc_rtemp_trim1: temperature-trim@120 {
> +					reg = <0x120 0x1>;
> +					bits = <0 8>;
> +				};
> +
> +				soc_rtemp_trim: temperature-trim@19a {
> +					reg = <0x19a 0x2>;
> +					bits = <4 8>;
> +				};
> +			};
> +		};
> +
>  		mimsic: interrupt-controller@f1000000 {
>  			compatible = "spacemit,k3-imsics", "riscv,imsics";
>  			reg = <0x0 0xf1000000 0x0 0x10000>;

Thanks for this new version which is now enabled directly at the K3 
level instead of the board level. This looks good to me, except the 
offsets values, given my remark on the other patch.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
