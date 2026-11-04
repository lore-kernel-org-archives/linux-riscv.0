Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4F606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KMLHCLIv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=murena.io header.i=@murena.io header.a=rsa-sha256 header.s=mail3 header.b=fvGqEt75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U1tv7i5uY95th7ClFrOg0B/CcUcWD3IB7c5X9qltO7I=; b=KMLHCLIvcahkQfURs0K9KYYKVy
	fPls4igYDKwh7zJTBRU74jWLkCYfXcaBbQbE39RiWLJjZF2mLLQ94BvbI4cLsBwu/8nMJL5wYWxhT
	8vN9P7Vj9jjO9fD/XMcG16go2uaPo3p3Qi34PJa7XAJ3w3JNQfLH3L7TIw1xBIEz9GAhZbxJ+EnPK
	85P0K7SpMx1o+HQlPcfnbg8zyZZk7WsI4cknjX1/ahSyZ67wFNUhoyJSBKpxdqkp1eqpLwEUnH0xY
	x1jnyiJ+dA2VckvaRZ4/VTKbepoFlg8jtyxIiKG6RkdrhlD/6fFsZIFn07cgXRTTAupDz0lldsf+q
	1xz2lViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcxK-00000005nMc-1MUU;
	Wed, 04 Nov 2026 15:31:18 +0000
Received: from mail3.ecloud.global ([135.181.139.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcxG-00000005nLC-39jJ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 15:31:16 +0000
Received: from authenticated-user (mail3.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.ecloud.global (Postfix) with ESMTPSA id 9C79A892219;
	Wed, 04 Nov 2026 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail3;
	t=1793806267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=fvGqEt75s9iWkGdzW8PyLgckj9pdrMGkjGvFyZyahqRWPs9QHhig4DERi86GdJV1NnX5pN
	1bIxfn/i6EW0gwi6gU8zIFSI2giGzm7nR4pymGBrVjCMSU+xd6peZmpSehIcs1cUSgKb79
	lPnEOCSFnhHd1crPgsSQsiU2ACzrft8=
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail3; cv=none; t=1793806267;
	b=vAJtK0uq7OD5cpcDMEr6T2zAIOODrXUui0Fba9wRf1JUKx81ri5QsE2SwcfvwRoZ+9S2aP
	T52/xJyP3aPAqP64AwRoNdwAGBivpgD4FFc49zKk9DRdfzr9n1Nf4tsm9/+FHZCzvADXBA
	2G57Kel3WG/PwQdzJKxbMLl9edo3df8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail3; t=1793806267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=BaLGS0dkI31diK5IGJGwMlfhbAoOq9EWfkPdIwLqh368idE9xeuc9QM4cpddJUSjURyl/f
	EZsxZfy7LPL/PgtehfcUMW/79cWCUUZ/3yD4Z2RHDYspbKvMKMPA9YnRrCXQegkWPDjuE3
	ZTb+f/Cw1JqFuKPrn0F0DzKV1aPzUYg=
ARC-Authentication-Results: i=1;
	mail3.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
Message-ID: <5f595068-671e-4823-95af-da1702354a16@murena.io>
Date: Wed, 4 Nov 2026 16:31:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: sandie.cao@deepcomputing.io
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
 spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
Subject: Re: [PATCH v3 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_073114_985824_803A1026 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sandie,

> Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index b5d5112de358..804abc85602a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -22,6 +22,161 @@ memory@100000000 {
>  		device_type = "memory";
>  		reg = <0x1 0x00000000 0x4 0x00000000>;
>  	};
> +
> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AUX_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_aux_vcc5v: regulator-aux-vcc5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AUX_VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	p1@41 {

I believe this should be pmic@41
If it needs a label it could be p1: pmic@41 but the node name should be 
more descriptive.

Kind regards,
Maud

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
