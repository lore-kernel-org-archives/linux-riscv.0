Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5FCD6E49
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxnxJwGz/DPZOclz1yPgLKmH5/AD2yt+wHmtFjOszWE=; b=TcfwlOTwCHlgakeKnDTTRQOF6u
	Xkcrylw/zbjMdXU5sHuj8ImLzuA8X2CyzzMun95iXZmsCqlIQEVHcWiHbxL8rc7XIfO3u9hixkr1+
	UZBzuVS17qlcdWCWuVDBtp8Jx5n8WqbPfXl4DD0Wlwi68tonT39rPOhx3aTDasxhMUsvDZAAHZuBM
	4HZYVNNBj/AAvsjw2hiXiLiqeOmNGan/R1J0AciNQp0bDfNLMwjBiQIMZ8IFJzfJ66PJqS/OB+GnE
	PXvwJsk6Cwjj6v754EcO6PMUMsfxQ1D6Q84BMJ1VUtZ0O8+fiyFDAKODPLYlW5CUphoqRlvOEkeDx
	UmfUi9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2Gw-000000088zR-2TuJ;
	Fri, 29 May 2026 18:49:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2Gs-000000088yT-2CMN
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 18:49:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1083533f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 May 2026 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780080565; x=1780685365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=LKeRhmpWJg5fBJs0nMUtr/1TyIoGP0Bm8ld6ymjwkiJgiHYHgiXGpI0cZcHPdkdPCl
         Bu7ow82e+I121pbSAmltw8NH/5Ce1jbmH7w1/z9TzZ4RcGX9mKGvlm1M6/DUt9mZUIrz
         FJhYapd0c+9EHW64G4xiJUQVV9fI8QaDde8/2q6cbgZ1Haeh9cOFM6B3hqpzpv2bfMSi
         gCP3gsQgGJNTBupwlHlgYIr9aL4pHI/HFS02zEaGfEtXktyOtAbZLOJ8LH4o7174b2Px
         JBXDsgScbxu6QPbzYScBfNlGV4+nqia5YWTFb3xXDweCRC8xqofiag3iufBdPTW2SJAD
         45jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080565; x=1780685365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=MsYecjL9frTCrWBTBiT0vV9xW80TChuDOuwJ6qNCbZnY5VaWHq4QAwhgNwmehHaJlo
         jqv/eZrukoLl58Op1IccQqZSB/roAGmQh1nWgp44X86vPsqYGP9uXbFSDq8x0oOpJudS
         FnURTMQmADRcyxSZv9AcZH9AaFxAnkZrwIg0LuWYhmes5qGVdBjYNthZpguFhPPw+r0W
         oIQvtLygodyFltvXB1KxMZpHN1ZyDTiLEBvCeLZTKXH671bEuT4h60bcyWTF59YJszgA
         k47ZQk4X2cyNatNjoUYTuIkeYcQY/XlYdIiHaJZkjpiQJtCmJwhcjNFhBHyddGsgeao5
         d4xg==
X-Forwarded-Encrypted: i=1; AFNElJ/XMiQHQ5NoZHUSxgWbIm9XDc4rnnRVdtwd3ecA/Y9/IlG4gM7kyzh6qeh3BLLt3dj4W4oakMIMmhmimA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnQBKgKXhGMaUXEP11bBHzLSgWuC+KQ6h6JtinT+N4NtB+9U1V
	BmiKNysx9g/Kyw1O3TaEB7TYGQOpSTXmjjeMwp2An628qD2ShHY3UAvEGDl6h8kY17g=
X-Gm-Gg: Acq92OEjzp32msEIWjIksA0x1M2paHB1rBsuLHKXgO/pNaI2oylBjrval/I3h+B5XKW
	6Mr1HFzn11cQ/Gf/ORdvxMf4HTeqrkzklG43G9Wbp/HdX42J+6NWD0HykKzjqMtgqdnDvcLRIp2
	3+3TvQGyMN3logCeGDtb97WUCJclB+zQ/qBXd8Z3G5hA7/TC5ydH30xeFjWvsJTg1lseoj5TMxz
	wgGcgywhGaice/YxurN1i0DkMpEGuxydBhO3x44JUIobZpMB8mSFlDyiecYrzijsNsjSaUV3XYR
	wyxF7wKcqIzvGIlnT5EjHu72JWb04Siw551FIYQPCox1feCZLPZ6E4kDZqfcoPNPCF+l2CUHBp4
	BGyGPBSrX6xB6hZb1nL+1uJdU+KFZkwKnHYddhzTVLgWlJUWhhAcLETVfCl/G3iVNGu9r0FlPIf
	2AyFiKuP/4IcliXzC1inSdZF3r8J1xF4bTpEC81ts=
X-Received: by 2002:adf:e609:0:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-45ef6b92502mr1248001f8f.30.1780080564532;
        Fri, 29 May 2026 11:49:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34b47eesm6096276f8f.9.2026.05.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:49:23 -0700 (PDT)
Date: Fri, 29 May 2026 20:49:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Amit Sunil Dhamne <amitsd@google.com>, Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Message-ID: <ahnev6lMK5tiUybP@monoceros>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
 <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
MIME-Version: 1.0
In-Reply-To: <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_114926_891973_3A5F0912 
X-CRM114-Status: GOOD (  11.81  )
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
Content-Type: multipart/mixed; boundary="===============0867644028624238926=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0867644028624238926==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzwfvojoqum2whq2"
Content-Disposition: inline


--pzwfvojoqum2whq2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Joshua,

On Fri, May 29, 2026 at 07:29:08AM -0400, Joshua Peisach wrote:
> For macsmc-power,
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

Thanks!

> (I'm not sure if one can "Review-by" a specific section of a singular
> patch, but also the other changes in the patch look fine to me, so
> consider it reviewed as well.)

I think what you did is quite usual. The restriction doesn't make it
into git history this way though. Another usual idiom that can be found
often in git-log is:

Reviewed-by_ Joshua Peisach <jpeisach@ubuntu.com> # macsmc-power

(intentionally added did s/:/_/ to not make tools pick up this line).

Best regards
Uwe


--pzwfvojoqum2whq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoZ368ACgkQj4D7WH0S
/k7D9wf+K/Kbjth006e5cY3RbjoS8K9jW3NQ01G+VBxY+lHExj1dG+49FF1HI8kt
qfulP3y/YdWSh2JA4Iu/NK5mHfXtx3IWR9T8IuNyDfXpEJECZipp2WG77R9slfko
t4zpckQ+iaOMoUDYB7CB93ltVHaeYHp3Y079Vm1cylL5z2/tessr8YqNr+o5lP/l
c/36Uyh8+f0J9Vm+OEsK5r4lyPA9YxyotfCCx4qbxxAjgGbQUW+rj6MZgm5AGfmK
rcXLESM1abNV6atU3liVQQQhtTPw4t6YXGDZVfGZbyMLtuZTrVZKCQF24odWnbJ6
juiDjaO5lCkS75qD+EK1IeT4tTF/hw==
=+SnX
-----END PGP SIGNATURE-----

--pzwfvojoqum2whq2--


--===============0867644028624238926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0867644028624238926==--

