Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B4BC64E7B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 13:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A78C42224F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 13:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A78C42224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U8rbZSsjmcvyoNJJegwWG9+MFxz4lkCfOv5HZ2Q8v8U=; b=vUEYSMtIXOFDonO+HFb6f2y4y
	l3qJWlfi0rseg+zCm9u7X+m5EHf9aeu6L+a9BCn07NdFx8JrNDAdCcAnYcPI3dHca+VzrRjzzoVRK
	YxGcs7l8Qkz1qL2ypP8YkPUUyvTHgau3RuFYbpEwb25DkE967pSDsysgqD8vUg9ian0H51WzCjWgs
	+VMHNT5EwSb26yjLEc9FmOX4oIvXQoN5ECi5k6yJdWdWN0IhKiVwPagCkpYmwZDNs5zuIfg78g9Qo
	PMB014I1VhtQ8yMrHnIdyI+emOdiL47T07k7INCOabFmQvg8g/rHtrfux7NHJFStTfUfSb587DpIj
	FfYm6JxGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkRp5-0003c1-R0; Wed, 02 Dec 2020 13:05:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkRp0-0003am-Ti
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 13:05:27 +0000
Date: Wed, 2 Dec 2020 13:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606914323;
 bh=H/0q95DkccdCRUrw4XH+vTeIYaOMliOk5cchInyn50s=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=XN4iwfS0e15JIk6QbbRWo06n83/17cHOf1EB50auZeul+QGtc/13lfbgtv6+wW0Is
 Szfq7wPy1Fs1ozKlq6gWjB6qyzr37tkyRdpgHjzw5V8eWgDd+QwMnWfbFhnKKNczc1
 6gbGvGbLNXfummISxh5gdd4ayEeG7bU34nc4LRp4=
From: Mark Brown <broonie@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201202130452.GC5560@sirena.org.uk>
References: <1606896236-62780-1-git-send-email-yash.shah@sifive.com>
 <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
In-Reply-To: <1606896236-62780-2-git-send-email-yash.shah@sifive.com>
X-Cookie: Sauron is alive in Argentina!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_080527_079365_5A101FEA 
X-CRM114-Status: GOOD (  10.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 sachin.ghadi@sifive.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, bgolaszewski@baylibre.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 thierry.reding@gmail.com, andrew@lunn.ch, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Content-Type: multipart/mixed; boundary="===============7913293500865066942=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7913293500865066942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2020 at 01:33:53PM +0530, Yash Shah wrote:

> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     |  4 +++-
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt        |  6 ++++--
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       |  9 ++++++---
>  Documentation/devicetree/bindings/riscv/cpus.yaml           |  6 ++++++
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml |  4 +++-
>  Documentation/devicetree/bindings/spi/spi-sifive.yaml       | 10 ++++++----
>  6 files changed, 28 insertions(+), 11 deletions(-)

The driver bindings for the various subsystems would normally be sent as
independent patches to those subsystems.  Driver changes mostly get
reviewed by subsystem maintainers rather than architecture maintainers.

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/HkPQACgkQJNaLcl1U
h9D+bAf/RB0pMK5XXva0fPJseHnvrYMw0AwuOBd006M10fxLWLou777VnMt6gMI3
oDXTEO2BXZU5QZ/QoKhAKqi2lsLUNrHZ94cii76pAe/eU18sRIDl146RkxGX0FtZ
zcqLnhbpbS55c8dEDr06w5AEMGvEEQ9cir6/sOHCYnEc3Rd5UR1XunrviLyyxqhG
MofmAaxxj+zqvd5e9JJxqfhpaw8dd20uKpcDoqdQnxeTqZ22yKbf0/NmysqI6kig
WuO5Pr3X1S/NWKTAdz6m12kTRf2XhvI5pPJ6FM+yXb+qV7sp9OlyXknL1OKC1DUG
fb8cYgkuBUdiyfcB+lBrsqrqDT3FAg==
=b00E
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--


--===============7913293500865066942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7913293500865066942==--

