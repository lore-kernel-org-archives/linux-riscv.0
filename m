Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3B0C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqX1LmMEpja4VYn7CjMcUXRHrm9WoIrz/ZcVCKkAM+g=; b=o1pY7Or9N79/gdrsu0uyTAczI+
	2lLCkmuBQNAdg7czMuvTieGPWJQTKtrJa7pNRevUxVDYF/vxnznnyRs5ukuLS7wz0ReG7y3TmXyp1
	GirIGD/MUsinD6Ohu3/sZ14I3Z8C0P+4o8SgyuPa7BtvW3wlTFJHAQR0NqxojWaQ0h/NtBciRMnUv
	BPwoYMPXyJ6ScINTQJWXigMftL7vKpQN3jyi+rbuoIUtTyW2RBkBLdzJOH6WQI6g5xkaHQk6KOvG0
	5vDqU7eQGjuFOVPi8TUWcGT69PulnXei7Rszb0c/JayI9UQHhAZhoeC23At7fSdhUo/nboIsHVgVU
	fbTeNfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY95-0000000H7du-2M8z;
	Mon, 24 Aug 2026 17:07:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY94-0000000H7do-3emd
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:07:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EE676011F;
	Mon, 24 Aug 2026 17:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D241F00A3A;
	Mon, 24 Aug 2026 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787591257;
	bh=5zzBlRRW+p4N0hvKvXFBc4noB+H2gMROn6oFNdVBBWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kDjGCzTxIgb8KwapjiPT47fITOVRTacMOC7NJ9ad4fq4DXT7zGRZ6APX89uJwhIjO
	 BBBs6RYmqZlCpHKUncVKfO2Swe92V+mHp7r01TZYB7y5HnDsZSXLSPPr++kenQkYi1
	 uaRH8vzf4y8DtyCfIFdRbsCbkf4+q8m04oSs0NOvsgpUkDsSnUMeOl80OVQ3EY1Pq5
	 HOtphptYpSwbHgItmgncT4ER/oHKNzXeNqU+T5WYOPrJo0PVRjtvqRAr8nqrJ5fO/E
	 XB2xwRznJfsKC7YPzMwQ8DfwXWLjiByb7UYJDqfjqzUcRRWg3O6thsuieywkOwgO9C
	 L3upEpQL2DZXw==
Date: Mon, 24 Aug 2026 18:07:29 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 07/12] dt-bindings: i2c: dw: Add compatible for UltraRISC
 DP1000 SoC
Message-ID: <20260824-oppressed-jogging-5b055ca274b1@spud>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-7-61ab7aebe9e5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260824-ultrarisc-dts-v1-7-61ab7aebe9e5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============1277526738245699456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1277526738245699456==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ypjxoWnZgSDokRmL"
Content-Disposition: inline

--ypjxoWnZgSDokRmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 01:54:20PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
>=20
> Add the SoC-specific compatible string and use the generic one as fallback
> for the UltraRISC DP1000 I2C controller.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ypjxoWnZgSDokRmL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaox6UQAKCRB4tDGHoIJi
0tDgAP4maHyBh0jMjn9z5RCMaYOe0lnbfrGgHf1xQlVCs8SjgwD+KLe1U3wfT4tr
HDrk17RO7KEIAysOIRzo2oG2VbfibwI=
=nYgQ
-----END PGP SIGNATURE-----

--ypjxoWnZgSDokRmL--


--===============1277526738245699456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1277526738245699456==--

