Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F628C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZSzJG/XDOojnINmkkbYUUolnQF+q0Kr4lRlXnUzJn3Q=; b=PoXcvHiDKiR9qP
	xmIJURZa6TW7aW7PhuengdWlxHBdDxHe+kdJ1a3Z1buINgv54iPdOMsWbMWBCC+cd67wkNyu7det9
	urxE0yQlZPVRvi0ghjmoXs3SrTQxwCKj6mTSwGfE764algRRKFiDAIRPjTNZOn2FrGg1HLJmUIRNU
	RMb5Ikk3e5k1j2so1UaQ4CuMNKijwyym+P1ckj/4ljJ8mqLDvnnw+hmWVqpcdorS++OqF9J9cvKAf
	W3RjzisrtCpCglhg1waxNjMsvjrWLRmmnRYzEB83FuyiaVvYTknnHrzVbbLz0zN9K5F/Pp+1PDoh8
	670l1qMuNptysKxMD62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8w3B-005au5-4s; Wed, 06 Jul 2022 03:50:05 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8w37-005asB-5f
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 03:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1657079400; x=1688615400;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nWXv72h/88bA9KDqkdclJQLLn1UNVvDpSy3/LQXeW3c=;
  b=MMC2LGI9D0ckvN07rKArnjjU2kOHfjgqZnU5kj/Iyd7QK3U15ToDyeFf
   2+qvIcaPeEcwba9qA+y2aLAuIhUyTjN6ZPB6qZ/4CI5YBvq0JR/zTWnVU
   BBoxuaKFD6tZASINexv+0dR6+RA1noo05hM0ezN7TG7JgKQ27/QJoxlSc
   sYlmnFK7WoA+T2d0msxaDIsitWm6elHeo2mHtISRgt8w9zemdKNKxu7fq
   HZi1FOyB533BuXtzEhO7D8BuwgAaL0oOpG4WC4VtmHbfkPNxB781MfArz
   jmRAzGZxcvcZ2KWr5TXU7TEwDgBNYlR+ymgKF8Nqw6+zUUpmmuXVSkGVn
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,248,1650902400"; 
   d="scan'208";a="205653589"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jul 2022 11:49:58 +0800
IronPort-SDR: xLiPYGE3jJMZVDq75crhQEs1ACvH4ut8lVcKtdYCNKUDXkeZOPr07HHF0/l6Bj5SAVkX27N/xc
 /Q+vF/7vQjhPqZPjUnA/I7CDXqUfcMhY2PCpaVpzTtLGJ9Ggcflh7Wo+IjSraOR2rzcmQFgMhD
 ATQy2QYcOXnYUPLIWXZU08wMJ9PmPcaj4UyYjOx2TNJKhfwfDJ856XOZlp4lvSKZ1N8w/h7EuR
 LKdlyyBwkrT3FwnDB/gN3+Khut+2o1VacHh3tGYAJxa5TWqLpAT6rczVw42u7aBGOYlUeVRYRs
 oq9Df/SjMscYmmTKhOQyuJ3d
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jul 2022 20:07:16 -0700
IronPort-SDR: ndYS1doJWrc/K3F65hVhrEGv19NxXUarY16AJ20kfFWJFtHV74PgLuSjOpK1whyDFf51Knmlhk
 KMaXGHmNUepCQgjvg0JqijDGeYTH3wH/Qh6XKweYlr37DG9ISOCc4QE2YpK5d+okEYoavpWLmG
 LAaxCAhbwYRLSg6hKTiZt6JWTLwN4ODR9fQeZ+Ho3StGrB4DAVJF6DaqRGsKPM0QSkrB7CWKW6
 zwg7I8oQn28cEFKTWqiM9wJIgszqcJA1RkfppCTudI4DxZExCkrVLIu4jMKYFVB7x26hOYiMye
 Bjw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jul 2022 20:49:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Ld5CN3j78z1Rws4
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 20:49:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1657079391; x=1659671392; bh=nWXv72h/88bA9KDqkdclJQLLn1UNVvDpSy3
	/LQXeW3c=; b=nsPEh3kxlE7MqhvN3ZaDyASIGDCsqRg1j2EfcgKLG7Vy/56o+nO
	gTH2/zWFVqqi/8O91Lt2+Ne0RNdzEdBhpu6VbUqoWACPLWwx1OIniYii0AB2/Uyu
	H/uPpkOILPvsZYZCrZVkDTP5Cvyh/J+5y2e9azvx6X/wZkUamLwakVCSueTTqpfh
	4yNO76Ic1bibrnnbqYS52T/TPW4kT6e22aepwGJsEeVZx8fAKyH6AS8Evx7mYCVj
	PHhpDMgw8x3qXycgDjWY9Ai+Yx6fJHxL+122RCb+ALDPD8jM1NqrSBH9PKxtoxgH
	p2797YK5vNvqIsrIz56kcxEjGygqerYWYwA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bdrmPIoAa1wx for <linux-riscv@lists.infradead.org>;
	Tue,  5 Jul 2022 20:49:51 -0700 (PDT)
Received: from [10.225.163.110] (unknown [10.225.163.110])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Ld5CJ61Zxz1RtVk;
	Tue,  5 Jul 2022 20:49:48 -0700 (PDT)
Message-ID: <53aa543b-a109-046d-beda-91a15ef5a487@opensource.wdc.com>
Date: Wed, 6 Jul 2022 12:49:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/5] riscv: dts: canaan: Add k210 topology information
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Niklas Cassel <niklas.cassel@wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Jonas Hahnfeld <hahnjo@hahnjo.de>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Brice Goglin <Brice.Goglin@inria.fr>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705190435.1790466-6-mail@conchuod.ie>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220705190435.1790466-6-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_205001_335714_034F8E4F 
X-CRM114-Status: GOOD (  18.65  )
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

On 7/6/22 04:04, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 has no cpu-map node, so tools like hwloc cannot correctly
> parse the topology. Add the node using the existing node labels.
> 
> Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
> Link: https://github.com/open-mpi/hwloc/issues/536
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index 44d338514761..ec944d1537dc 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -65,6 +65,18 @@ cpu1_intc: interrupt-controller {
>  				compatible = "riscv,cpu-intc";
>  			};
>  		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +			};
> +		};
>  	};
>  
>  	sram: memory@80000000 {


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
