Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4599DC7618D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRnNMn3L5PyahVGiIXHhNROYjLxLIo6tnpYvpKptT5E=; b=Mw27syCDDWfdmKvkxkP0Rf+1Ja
	gUFjmpD8TsO7B36fbFTSVSHmJ7wrV9VaC5X2Wet+dLb/65oA8cB2NQGrwPXTQUS+vK7x5XOr7C8I4
	5HXYhcljS434dy2N8RIt4wWRMBn8mscmkQANeCrgaIduRZau/AELa2x9E1ZkC07eB0b16Wi9PU2/G
	wg8HdG6GimX0zi+i+P3YgYnkIXxnqpXE8cNfS1rYrUJj40q0BVi/7T4/NAFJpX04p2HnJI4T04mjj
	yCf+5ulOvqxnu211IaRyXMn3OycLOVWhu/0zchR7E7rSHex/CWGMBAcrdZJRvOKUswXWfrwJddYkh
	5YsjXGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peINi-009lwI-0P;
	Mon, 20 Mar 2023 16:29:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peINe-009luR-2W;
	Mon, 20 Mar 2023 16:29:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2074B80EF8;
	Mon, 20 Mar 2023 16:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758DDC433A0;
	Mon, 20 Mar 2023 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679329744;
	bh=kjNE+xZqCrD8iMoVdwZ7yuZZfBEJymUt10XwIxYh2IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vv4sNgoQPQYZIt80kDvbscTGV8EyAOBLnvQJNKOVjOIWof8MSUsP1pcxCF0mz9ilD
	 QdNVhF/zy/ob6sZsf7Np9llMREtIsDd3VQEp4F26Of52jZ44R5ryPsOTBtdIMQ1AE3
	 8dugyBf2AOcS1qqBnqPzyb8hdBKvxChJ65hR7ns4FF8TnD9anxfVvrRrE8LbXM1ve5
	 QeLODxSRqLl/EnwXRwUB96JZfcfb4trlUcc8RSaE5/6lvDa6NAaYzoT08VoT55/Onn
	 37iXDFAs1+YyXU9uqijre8jtsuOUDS2/Zhf52EXBvYN8x3ECX6pphoxUdsqZ4YacrU
	 +51lo3tKKklTA==
Date: Mon, 20 Mar 2023 16:28:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <3f544569-553c-40c5-9d9a-31dfc48d06a4@sirena.org.uk>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <167904851367.26.16449705310108549543@mailman-core.alsa-project.org>
 <20230320155812.GA1755078-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230320155812.GA1755078-robh@kernel.org>
X-Cookie: Keep away from fire or flame.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_092907_127644_6DB99135 
X-CRM114-Status: GOOD (  14.35  )
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
Content-Type: multipart/mixed; boundary="===============0253815852161570003=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0253815852161570003==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SSpxkFyPmL3iEqN+"
Content-Disposition: inline


--SSpxkFyPmL3iEqN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 10:58:12AM -0500, Rob Herring wrote:
> On Fri, Mar 17, 2023 at 12:21:41PM +0200, Cristian Ciocaltea via Alsa-dev=
el wrote:

> >  dma-names order constraint
> > Message-ID: <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
> > User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
> >  Thunderbird/102.7.2

> There is something strange going on with your mails as there are 2=20
> copies in the archives with the 2nd one getting the header twice. It's=20
> coming from the alsa-devel list.

This is probably caused by alsa-devel, it'll be mailman rewriting bits
of the message.  There's stuff coming up with other people's mails too.

--SSpxkFyPmL3iEqN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYiccACgkQJNaLcl1U
h9AWWgf+NrPa0MYP5i63yT+84rj5CMEVq9erNCfVLLi4aX7Rk2t3p7OHm6nPT5iH
nEuh1CIOa+avBw3wouVQt6nokWi+mq6QbmYustWX7hPq0Gz2FRTJyXl78DNWj8Ys
fZ4osjdXbr7f0Sa5lZVvImuVpGh7z03Fg9XbLkMXt7FDacubv1DY6RwJdphesoG7
C99xjwHv55veTyp/QbwCuyctpKWo1Dn4HvkL8XU//892rRaHt6enBBju6DWo8GTF
tr89XuM3flXYbOGumon2KSlsbzAXV7QKwnK9RCPsLaXuvO36PRBMippV/VmwnJCh
dYBmTNrePnumx6r2BbCzk0Gx8LMfdw==
=+3s7
-----END PGP SIGNATURE-----

--SSpxkFyPmL3iEqN+--


--===============0253815852161570003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0253815852161570003==--

