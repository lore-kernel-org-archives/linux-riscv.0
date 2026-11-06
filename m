Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B48606A33A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ftc1taw2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=rTlRXdcm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4I2OK4cYvVxSil7oOGxgvQeECXURDJmvnRh8WnffYH0=; b=ftc1taw2lF0GvFdRjPH+kqbhTx
	Z02Nie8Cs7Bxxkfx8YqAyZvsxsJAcrtXQvfMHNslUyR+sUYnH3Bm89CvtA2a0YyWVyMwHh9kAF8PA
	j24H1y3xvTCU3GI/M+WE/LG+SJeDxX2CxlcX2Pu1ZhOL0tEklPWB96YnsaKXBDtSivqi95Xdu2eId
	Ft4ymKgcyk4OEUiZpxA/zeSe/lnAktgc1N0QC4D3zGDUl6Pfe3UyBG60XcPxs5GWDdhMJL468wHNa
	hVXt+l7OHimkJHskc0ucVK2AJwMpm+arFZ0X1vulufI2POEXb6Eh897KLQKDNdz10k/BrOm/RQjkh
	FlfoeRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSBe-0000000DlpI-1Kyl;
	Fri, 06 Nov 2026 22:13:30 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSBb-0000000Dlok-3Lvz
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 22:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=JYRO1i26D9FG5gpovbYIFwDb5aLIXhRJ9ZsiS5nT6io=; b=rTlRXdcmanV7C+Ntq1kn1DFl2o
	2UJcvMtKcxlngJzYb8h0G3MdYh3Fk/JxVefw+/Qw5OUX8YN9mqwO6ZSNoD9kqEE+9ZXT7D2gQgP/H
	GMyYi8Hn4q9c/SrPAFTu8HCS/8qRc9j87J953wFtn0WK21QKSPVvkOxx1VcJWyQ9jdgDlu1+2pf2h
	Cr4kNrj/alh/Q4yD7hz/Bu1ihUTVB8XlkaD7CwrRlE1M4IsSHYftfZu7LtYKtL7XF+nfVs6kIlgmp
	vRy2/dbtrRUFzDgSa0GvM0NFuiHHo/nSiKhaQz9d8i1o28CHfDmbr1XxqWQ03aerGBUQai0U4zRdn
	kNaguWuQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xPSBL-00000000qEZ-05Ws;
	Fri, 06 Nov 2026 23:13:11 +0100
Date: Fri, 6 Nov 2026 23:13:10 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <au5Q9lYTUegeEglv@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106060525.346873-4-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_141327_841198_067588C4 
X-CRM114-Status: GOOD (  17.04  )
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

On 2026-11-06 14:05, Jiayu Du wrote:
> Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> fixed-layout cells for the temperature calibration parameters stored in
> bank 0 and bank 7, using controller-relative offsets.
> 
> Leave the controller disabled for board-level enablement.

What is the reason for enabling it at the board-level? AFAIU, this is 
part of the SoC and does not require any board level hardware. Therefore 
I believe it should just be enabled by default.

> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..51861fdc6a21 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1439,6 +1439,31 @@ saplic: interrupt-controller@e0804000 {
>  
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
> +		efuse: efuse@f0702800 {
> +			compatible = "spacemit,k3-efuse";
> +			reg = <0x0 0xf0702800 0x0 0x400>;
> +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> +
> +			status = "disabled";
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

I have tried this patchset, and while I can see non-zero data in the 
/sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
appear as 0. Is that expected?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
