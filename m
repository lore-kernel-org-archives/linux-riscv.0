Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1FFC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 23:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVTZ4yp1R/0kscskLPpxPM1og6YH0dmQjRgTtcPMVzg=; b=EVwHL3RptGmepg
	k0+PKrFigLwIf8mhe89ivRKUX/ykqEA2bwqQtMWO5ktopwTe/QtEVTjdyriTp374IJlzZUxDqtKux
	EAxalk+InXK+ogHcGp82Gt6WVY9K6G7aPIRRYvW0uK5C3GkUtJrQMwSYkOrK14OBTrXtsrmDtwT1T
	ZMjMBuSoiM+qBi/3TROh+Fl1DOD1Qjj6D9yEQw9DpQEnJyvNIAJ3PvgvD4F6haXXcFpAkbGKmpWFi
	mEHi2TyISVDZ474TMyagDtUK9gtlc3cMpeksD82JvYGWWjnHzYd3mGtvoB1k9FLFVFi8Zu7ObmmNy
	8LEDcH/FB4H5loE4yZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o34Vc-00FTbe-TU; Sun, 19 Jun 2022 23:39:12 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o34VZ-00FTbG-I8
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 23:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655681949; x=1687217949;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVPeVoKPk1w=;
  b=EBEsLiadFZM+6AdWawLjq+fasp6JAvZzqjNkgncyDXN0uSFgkkcGEx4h
   s7bbFEPRQoIzrfXZV5xryeyakrImXTnQGIhaeRXIstJ5auCvYDl86pkHt
   wvfodQElSzQfGcFEwdVL52MRnMybIRHdBzn+LEj7Z1W75Q4msZnajxhhU
   ovGX5KnkFolo3ri/TIdeRe5rUrEukn5QGnmEZu/0byez4m0cIX2jQurpd
   iI5F+ceYeeUMBHMXml/r5L2r+MyjmCtT5w2H+v63Kx85cNY/wr+6UNdOO
   5t+Vm5kaXLi6UgXDM8T+aVssRh/4qOhbmxTuIEdao8o9uGUoZwxOZZ6F/
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; 
   d="scan'208";a="202276610"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 07:38:59 +0800
IronPort-SDR: CNB5F+/rABvQsSUT6SRLnqbLP3rXpB+vvdUA5AxhpjELj4dHFm+oDHjZQJ2G/pISgb8PFpg0KO
 vTcYAyDj4mgbqugXSMxCZM7IQOzpZaw7SXF6klFlCCsQPb23GW9uARtHZCI7x4f44Wjx2csmsz
 5Vfg9M+7Y1XApwXP2hRrGnp5Q6EdFhG6ryrBjpwYlIIL11lhq18pC/+nVbM+vYqmNVzNEWnTZB
 RrYOOoLxYDSApm5gHau0NQ1tNxq9fCijzgnLpm/hnmHTRdbG/sqejaKKWlIiGBX8XkDI/DTAf1
 cJRBJN4mX8+F9tzX0VdnSK8O
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2022 16:01:31 -0700
IronPort-SDR: tUAthCdFI+3mvN57s0McwS6dad2KVrA1qOu0hsspSkXBwej0CqxJK8Mr/c2UsuOE5wwx1nwxpX
 FfwjFb+z7QmON8g+gkRA5I8b1nIKdQon/q03EWDdd9l+wq16nYJVmMmlS5WNaC+/5EN14MUneO
 LMU7jjVOI8xAPd3jFOBh6Uog8+qUuIlyq8NQ559JvuxL19UeR039YoJcML5rFh2vDFXdFoZsaJ
 y395lK2vz2HtS742Ea40AcOFJ4BYHh4CPBIXNiRkbnRgG3lzEBrLERxAtlwAP6sp1N4P+YCg+Q
 l2A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2022 16:39:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR8PH2PtFz1SVp1
	for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 16:38:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1655681938; x=1658273939; bh=+r2le/0cYQHWtPMNeCxIXB43Y8pcNDHfGVP
	eVoKPk1w=; b=N/n66b6ClqCR6Od52OpL/EjMQwa7gGRAGjE1Ujgk9H7xtwRIW25
	EZRWVGhphTf0s9eYUdMH0D7THn1PazXSs6q2M/FS5hiPVHp3V1G2l/aQ2rfqc//u
	wKPEmQvqQwcU4CICmUM9WSF730D03I82SE1u/8QwSsguDWkjwYt4EdQR7MJGR8He
	kYe7+a259CQJSHTSSRoNNZdV7b7cnCdwVJe19lwMoFXtlVUFjge0fMpLIXsn2unv
	iBw8XBXi7i+yunFeX7USJpxA8MUtNICuwAOR6EbBSo5onKDz/7XlWDr5D+0QNafI
	XAaH0chJm4oPHzPOs9sKI97+WCZ54PG+37Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id aII-pKUsXZXs for <linux-riscv@lists.infradead.org>;
	Sun, 19 Jun 2022 16:38:58 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR8P82TBvz1Rvlc;
	Sun, 19 Jun 2022 16:38:52 -0700 (PDT)
Message-ID: <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
Date: Mon, 20 Jun 2022 08:38:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Cassel <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>,
 Heng Sia <jee.heng.sia@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220618123035.563070-8-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_163909_715874_890A8278 
X-CRM114-Status: GOOD (  19.71  )
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

On 6/18/22 21:30, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 memory node has a compatible string that does not match with
> any driver or dt-binding & has several non standard properties.
> Replace the reg names with a comment and delete the rest.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 44d338514761..287ea6eebe47 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>  
>  	sram: memory@80000000 {
>  		device_type = "memory";
> -		compatible = "canaan,k210-sram";
>  		reg = <0x80000000 0x400000>,
>  		      <0x80400000 0x200000>,
>  		      <0x80600000 0x200000>;
> -		reg-names = "sram0", "sram1", "aisram";
> -		clocks = <&sysclk K210_CLK_SRAM0>,
> -			 <&sysclk K210_CLK_SRAM1>,
> -			 <&sysclk K210_CLK_AI>;
> -		clock-names = "sram0", "sram1", "aisram";
>  	};

These are used by u-boot to setup the memory clocks and initialize the
aisram. Sure the kernel actually does not use this, but to be in sync with
u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
kernel work fine with both u-boot internal DT and the kernel DT.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
