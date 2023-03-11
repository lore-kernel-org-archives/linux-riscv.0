Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA074C6FD1C
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MruY5fyTB05uBUU0F9JrEDRdLO9h7Gn7SGnYw2chp/0=; b=rbIOJ/wt0WLnKtwkJr/qtVOqTV
	MXMnH+WmlebjL8CU40djc8j6bJPOfXXDVowhdwD/Q/6DdmrZMTaIz0hp6MRWT+8EhaGzbIyExqV0o
	GOw2ht9aY0971UfPmXA16YEUu5VtCgJZQr+wOEzjWLB7DI2nnj3jqcOSiHuq4JEVfhVyWksJPhKnw
	AKKK2k6nakbZnHYE9gG5Fzd5R5fRXWnxHgF1Drhjz7ibV9RjzoRKK01aYmm+WqbhoWHXVJjlleTmx
	SjiRMcbJbpXkv7/MlTHePoHq36JEz/kaNlAcDFfRFdZF88UJJYZWl8kIEe1/CdVzLErFgOrxeADBK
	f+2skpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paymH-000XiM-51; Sat, 11 Mar 2023 12:56:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paymE-000XgQ-3Z
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 12:56:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4015460BB1;
	Sat, 11 Mar 2023 12:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2387CC433D2;
	Sat, 11 Mar 2023 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678539404;
	bh=SVKT2tlVgR4kmjgwkwYg/YZjMp5Rbrtwa0inqkDaNRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVva0TiSi9gsfM702I1FOxZOyrelUaECsuxtKA3rd1puDDILnnv5BmF6x10QdXcmO
	 K0BczMuYtw0j8Qw998PxF4sT8g9+BfC46iG0QqQnheQc1z+6kD4rfnAQJPT8S7/mAh
	 1jE0rBRZI9BIhlAVdCCmkngQEwt+uk0tcVPWEdWW964u6nwLy7YlBnroIjMq4liU8K
	 sZc7cBw6ScDPj07X5RAs1Xqo+9UWr8p8RDRy1b2mMxcu1rQ/Wzdva+O0g7Gq4XNOLF
	 W5FhuLqINdqci6GSt5J3MbROMa1cejEhW0zQID+SIlgCCjRXbQmpu+N8n6sNQ0lzBB
	 gLghqDNUWpU8g==
Date: Sat, 11 Mar 2023 12:56:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/21] reset: starfive: Replace SOC_STARFIVE with
 ARCH_STARFIVE
Message-ID: <d04e0c9c-9d78-4af6-b6c2-77129f6a9c44@spud>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-6-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230311090733.56918-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_045646_197673_553D9025 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5386651440235947835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5386651440235947835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HmUvBcXkJbp6emfl"
Content-Disposition: inline


--HmUvBcXkJbp6emfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--HmUvBcXkJbp6emfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAx6hgAKCRB4tDGHoIJi
0oFOAPsHigDLYTOnkkGO1ybXlSMETKL/8Nw5hyNbCiX9/zkSygEAoKYeQK/IfApW
XAbUiL3tMFSmJvxIwpXM3OlVX22EYAQ=
=5l1P
-----END PGP SIGNATURE-----

--HmUvBcXkJbp6emfl--


--===============5386651440235947835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5386651440235947835==--

