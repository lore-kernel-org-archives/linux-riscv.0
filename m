Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C672C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6e0GoOMuxJT/m4ofkoI0LXfG9dUXREmxQw2aVMyZbk=; b=pbjFU2Hf0eBQ+PwtRIyX/pugnT
	dYAcUtXRxjN/o1JK8b/xLav0u/CiyKMuYAdAlpObywJMR+fBV/+q+ZdfA/yvlBR+VKngXGYUCOJ6z
	bk1q0G/Dsh2UgCQgkAms1sogtEVx4ygNw8hCPbFKXSFsmISBzeJUup7yTVIuoxdq/twwkV2rQ8rDC
	YotNL9yVQrbyxbk1HWbD2j0O0UA6QLoYsnxj9YGjKOkZ9vWsOuW2wKCzBUJpYTc5XHX/xaJtGVM8N
	HMJSPCPKVDUSy4PAgU5vkZ/XPQwPmLwBDCp0vEdyuBGN+BT66QpegFyl9xLFQAlAfk5o28s2kVveV
	WpsmhYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZRd-002yvd-1m;
	Fri, 26 May 2023 15:33:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ZRb-002yun-04
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 15:33:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5399B60C61;
	Fri, 26 May 2023 15:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8A9C433EF;
	Fri, 26 May 2023 15:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685115209;
	bh=gzNuCzAzZ7+zw9WNsmNLqxt3L1OmoTULjYdQ2OYFP4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgDwLxaxdw8ndTrnq7cYzvnxplKmWQVBcBR2fEo5qY669ReLqN9h/QxVv1F1Edhhr
	 e8nT/q3GhUm6zRi0PO00vF/JRsIBDfRj+OtZ020Q9jHNdDJZZcAfJ1Uyiofjn8wrf6
	 2NcrUHBKS9H1DM1FsS2ODrMCGg3FEAl3VkGGU5NoMw5NIULZgvm+b5Yp5BpUlfu4Yg
	 tEusSlcLCVahaLcwsNc5MuJLQhLX6fPC9uCaCQN4ongcQdKSzOwi83ksG/x6hpHnLC
	 XaYVsyl/6dMGLN5xhJZxz6SYe8O3b0Cy1wJCgND+4fKC4uusrgrvQUqAZQfvPg174s
	 tZeEQTZZQOqcg==
Date: Fri, 26 May 2023 16:33:23 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Message-ID: <87e9ed95-ea57-44c8-85f8-34264b5c6dde@sirena.org.uk>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230526062529.46747-2-william.qiu@starfivetech.com>
X-Cookie: A Smith & Wesson beats four aces.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_083331_106413_3297AA65 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: multipart/mixed; boundary="===============2400745546688292653=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2400745546688292653==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1KNVGTJrGqHtc0k"
Content-Disposition: inline


--k1KNVGTJrGqHtc0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 26, 2023 at 02:25:27PM +0800, William Qiu wrote:

>      then:
>        properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          items:
> +            - const: qspi-ref
> +            - const: qspi-ahb
> +            - const: qspi-apb
> +

Are these really the names that the clocks have in the IP?  It seems
weird that they'd include the IP name in there and not just be ref, ahb
and apb.

--k1KNVGTJrGqHtc0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRw0UMACgkQJNaLcl1U
h9DBagf9HzZRKBRscmFdDMGNaPloiDN0Kfiy13vOIf3Uk5whgF17nUJKVr81u2Sx
Dyn6MkuiP14JXAI4RtuTWPeIPdTJqbdenQ74rr1p5Taf4cn3XirLkJ6YBjWccsjC
zPwO+qLmb8swT/JzWonBFqiVmeHzJ179GhKWBxPkME1iO89LaFbFAa+mI4LqzYZ9
XbZ4VT4kpdnru//sZG1kq06xxwVzYvJy/FHZKpKxa0ZX5/SAaluYKb/z+Qt4Dtas
4ReA/isOd8wUcjLDIG+yV98pOteXAmQy9BsCUdMLzDnDZYl1WXsZuIaJX4yudBlo
Ih9Vt+8NxZvlVeO0zrn6/jwnIiaJbQ==
=GwnE
-----END PGP SIGNATURE-----

--k1KNVGTJrGqHtc0k--


--===============2400745546688292653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2400745546688292653==--

