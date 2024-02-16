Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF6C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gE4t1hWrl6il3yqvD90VOlp85sv3ZpV7dVfOiTC+MLw=; b=xhmTOx8fcSI2AzfyvhxnjYEqFM
	BFvOf0s0z0lzgzZf0GtlIxuEGiLayBiyYL0q9sR5dCljvbYXpo0JYRTZuO5l7xvt6f68LTXWdbDTH
	8qazH7le61LPPS5F3BlyCN7nQmIQ+40IV2RI8yVw3TYVSwzCDFZdMbq8vh0POP4QHLTpLu3fPCf63
	p4dxXS6Ktv+5SaijY6ONypbI7brLy8xYEl/bTd/yf2EGrkcdn/7injLTL7RqUwhjmEOpH7yP7dcZv
	suXvCbVvXg3cwzDQWMS/j0AAfwi6cCE/7cGHACplV8CQ1k6fmwJe7evW3c8mgpNBP/eGp5TmRAlcO
	U3BW5q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rav6O-00000001tYb-3Qvy;
	Fri, 16 Feb 2024 10:05:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rav6L-00000001tXr-3Bdq;
	Fri, 16 Feb 2024 10:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708077949; x=1739613949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kM4McQdbrlvkFUd7J3O0TjnOptxLjbqVBjBJWZd7Yq8=;
  b=Jh03E6CFV72yOH9Y2ZrT8r7272xmVlsKGP85zMXvpm5fz+Lllg78/hyZ
   04FLGu330DXyDssaTUVEvZHOSKjKU7ohY0E+zJvfJhQ6Qu29xgiRdYR9z
   O1otr1tqFaFhmQMeh0j8XhVxyY549uacoKvYHgOYPi9z8NCMvM5/5yBpe
   WFE7+s+VHKX76EDMdRk/w7/jLUCArj4cOAK+nxFucJ5OpNQoqP1KGHpZQ
   gLTxkDRI8xcVccWhFVFUQOwfLhgNau/Jk6Vhu1JLB2uup/oMnes8qh9vf
   /FXrqK+4/FVxFG6qfe4a6QklNHKuL47c2dVhtF3jrTlSe8WMOJk+AhXl+
   Q==;
X-CSE-ConnectionGUID: 4OBfS/6USgiZdJ2AElfqog==
X-CSE-MsgGUID: u/igiJMkT4m9uWdPHwf08Q==
X-IronPort-AV: E=Sophos;i="6.06,164,1705388400"; 
   d="asc'?scan'208";a="16347695"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Feb 2024 03:05:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 03:05:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 16 Feb 2024 03:05:45 -0700
Date: Fri, 16 Feb 2024 10:05:04 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric
 Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 0/6] SiFive cache controller PMU drivers
Message-ID: <20240216-shopping-unnoticed-e73e72a0e849@wendy>
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240216000837.1868917-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_020549_880339_551E6103 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: multipart/mixed; boundary="===============7636023079608475846=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7636023079608475846==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uE8Yv6S3YSeUaEK4"
Content-Disposition: inline

--uE8Yv6S3YSeUaEK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 15, 2024 at 04:08:12PM -0800, Samuel Holland wrote:

> All three of these cache controllers (with PMUs) have been integrated in
> SoCs by our customers. However, as none of those SoCs have been publicly
> announced yet, I cannot include SoC-specific compatible strings in this
> version of the devicetree bindings.

And I don't want to apply any of those dt-binding patches until then.
Stuff like "sifive,perfmon-counters" seems like a property that would
go away with a device-specific compatible, at least for the ccache.

--uE8Yv6S3YSeUaEK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc8zUAAKCRB4tDGHoIJi
0q3fAQDoiboO+13TI8qHCe6RQzx4F5yeGe9pfv/8vU4dD4QJVgEA9/R2MW2YuAtB
CvoAEqHzUltrzcqLqW/UHxTpa+QHbwI=
=MiCh
-----END PGP SIGNATURE-----

--uE8Yv6S3YSeUaEK4--


--===============7636023079608475846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7636023079608475846==--

