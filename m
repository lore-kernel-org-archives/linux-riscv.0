Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D8FC64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nS8wIyIwmYuUhVZe197WL1hRTq7pEPrh4XokVNUiUBU=; b=0FTJWXPJUFLX4kKexOwk73nfzq
	KBp+W6UhSsQJPIAncvd4VvQ3rM2mwdF8qagraddlG6LHK1HhANIOjBuCeY2JGqNKEjSlCrvaztb73
	9E+3Yl5VF9yx0MasbvuOqSAmKRN2Kkx+2Gl4RDGq13qXzg7J9DgTZ0mwvEhgCCgpe8ogPFmihLo8M
	FeIPPt3EJLAZguXa2UDqO3bA6YDKmitMpmdNfenUrFC+XBaoygmaYnQvKnJuHBOKaB8NTQLd0pg9c
	3y4SwKB4SzJ7D0Uew4TRhFd3rQ2Es30/CXNlNz41Ki5KDlMVEYk8XUKh36sbzbY4XwsWaPXnKjr1T
	obDxyfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paLYV-00BcsO-4Z; Thu, 09 Mar 2023 19:03:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paLYS-00Bcr1-GF
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 19:03:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1D51B82065;
	Thu,  9 Mar 2023 19:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E3CC4339B;
	Thu,  9 Mar 2023 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678388633;
	bh=ev9ApdQFK9HxvCMF1QnE29vmlVWk2V34cqvfeT2lmfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cviH78OvgsBynRidrNp7ft2hOZArdY02vmEf8L7DPyz8fFudbcjraleqFqpsdguV5
	 DLEkDrB74UfKEbwB38xqDoHOAFnCSIvpr2mC/kT7akdykxLwGpoIWLh1FGmR5kS3hg
	 88VKplnlLSESwFFRVP9GF4BEuzIaeaMo4zUhPBYU6EMSLEARHcFvSQSHbdvinY5Os5
	 cwGshD+rnD27ruM2KnHGl/hJQpRiixhydVz5KSZK9UVki1MbzMALenqqD3HbmkDbrn
	 D7pma45JR7Vmvmh8oIiHzw3EEgAFQCKwo6VIcctDskFlGvUEhJx5JkZF8JI2ycmnMW
	 8S4xbxD1EaCaw==
Date: Thu, 9 Mar 2023 19:03:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
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
Subject: Re: [PATCH v4 00/19] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <23111c4b-2bee-4f04-b0e6-bddea553d260@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <3a605bc8-104e-0935-4fd8-2da16ab9053b@starfivetech.com>
 <ZAb7JVghuiwZF1Q5@wendy>
 <2f03dfb2-5cf8-e954-913c-f0c27db6bcf5@starfivetech.com>
 <ZAh/UeSlUeGoKxki@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <4c071642-e3c8-4716-a580-5b42e25efb1c@spud>
 <ZAoOLIERMYI8UVlA@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <09630acb-f1ae-4dbd-9c9c-9adb1743bfe4@spud>
 <ZAosTc6VNco1okyR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
MIME-Version: 1.0
In-Reply-To: <ZAosTc6VNco1okyR@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_110356_709371_0A9E5573 
X-CRM114-Status: GOOD (  11.27  )
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
Content-Type: multipart/mixed; boundary="===============0022664441430954002=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0022664441430954002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7VG2qaNb2wp6qtrg"
Content-Disposition: inline


--7VG2qaNb2wp6qtrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 09, 2023 at 07:58:21PM +0100, Tommaso Merciai wrote:

> I'm able to boot the board using nfs ;)
> (without issue)

Sweet, glad you got it working. If you'd like to provide a Tested-by:
for the series that'd be wonderful too :) No pressure haha



--7VG2qaNb2wp6qtrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAotkgAKCRB4tDGHoIJi
0qrYAQCoESXCeNmtpXU+5dNKYxyNusF7HGsBVqTMKuOe9O5fpgEA1LPxd5+mlff6
egqx99j+fyCuoUTh9ATU0tJ3o9ZIDQo=
=qK0s
-----END PGP SIGNATURE-----

--7VG2qaNb2wp6qtrg--


--===============0022664441430954002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0022664441430954002==--

