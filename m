Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0C3C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moTHoMy5dQyahgy5JuuPL2HekHBsJAd8RTP0ZJblRxE=; b=GHkhOVFylmebgN8mxr7G+pTv3W
	wK7CoZn1+KVQzbxLLD8YkYNICMqbohiCY9waeNoHrQW8rpYyJ2849U7VGEpBb4qN7mHXT3Lnq6Y5i
	cqptuRHTNSeeQ2eCF0ecfsql/ZeWz7nKeM6nEMEdLssaUqoxlRfJEj1sk8PWSRtEHTFAiF0xOFO+q
	Bg4iU3fFnSA0mEmmUp+9lbIh9WBXQ2yMJxR3dV2cwgxzK+WbKZ2WWbWQ3olWV3JtZmKC3UKTm8Qf5
	cdqR5Q0WX29NqN0h180lhVze7znCNRIdqztpTUyd+ElRNHGOERg2qAqFoeUW/zsAFPTc7g/UG27kL
	aJtks6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFIu9-0084gE-NA; Tue, 10 Jan 2023 17:59:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFIu6-0084eu-J6
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 17:59:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3DE2BB818FD;
	Tue, 10 Jan 2023 17:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F4DC433EF;
	Tue, 10 Jan 2023 17:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673373555;
	bh=fV4tgwEHUZrqCe8pSCxTpwxja8PdnJ49yErnHxLMzZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ux0gIXcb32eZQ+VJkQV5YzTdErZ+iLCv6Ztzdv6boC99j5YoS/U7ue1guyDP/o77m
	 6/aspDHnxPBtHxFXAx3V+Se1yvRFnheRvYP8mCOpSlEbc6vDTLk6kampkQX0MiN9tc
	 7PTGr/C3EM4r3SV6PbeCTchppQ0oU9nhxn09WwWP+KgADS5Pvbo8O6QdtxtYSPxfKV
	 n//4QriXlHuBVyzcmFALTvMjiZoGz/5IUW1bOORbe8zLyUCG4+CEwR90xM53wXRIbO
	 t7PyqOCkujfmzDWWO9avNYQeP5Rv2P7ijpHcN1qylVteFwouLLYwMk2S6KTQUOb2ev
	 k24XLRuH8Vzlg==
Date: Tue, 10 Jan 2023 17:59:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y72nbfJxYdO2AojI@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220011247.35560-8-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_095918_803956_720B4999 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Type: multipart/mixed; boundary="===============4691302594110514416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4691302594110514416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lvt1uqxBssUo8Paq"
Content-Disposition: inline


--Lvt1uqxBssUo8Paq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2022 at 09:12:47AM +0800, Hal Feng wrote:

> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};

So I think this is wrong, and the stdout-path should be uart3 instead.
Per the QSG [0], GPIO5/6 are the suggested UART Tx/Rx to use.
This appears to map to uart3 rather than uart0.
FWIW, uart3 is also the stdout-path for the v1, see:
arch/riscv/boot/dts/starfive/jh7100-common.dtsi

At least, that change is what I needed to do in order to use the
JH7110_VisionFive2_upstream branch, AFAICT matches what you've got in
this series.

Thanks,
Conor.

0 - https://doc-en.rvspace.org/VisionFive2/PDF/VisionFive2_QSG.pdf

--Lvt1uqxBssUo8Paq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY72nbQAKCRB4tDGHoIJi
0qOpAP0XaPuoCjnjBd2DOhVJt9puz02Zx9VxaQSIpQ27IoXGygEAmbwyT809PgL7
chpp1xSSsvRQMEhF7XLXxr6OXPz3LwQ=
=ILQb
-----END PGP SIGNATURE-----

--Lvt1uqxBssUo8Paq--


--===============4691302594110514416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4691302594110514416==--

