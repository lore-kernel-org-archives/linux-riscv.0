Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256BFCD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo6MlX9XhVavJzZEfXaAab1K8w5bgco9PjSl8S9V/I8=; b=xiHIfk9XtLZ8/V8tjwTnzjb+tQ
	cuIQ4sMmSpdflsSHaF/WpxJhuRddShfE2RJwU84aB0Vs8L7TN6LJNQexgfb+CznTQcB4ErDOKpBzG
	auffy9w8pkUvTA5W5s0qQlfDNhHWhVworMjNivmd50vuK9uZsorLV/SLz4kXiuq+XRw5td03vMp6y
	PJ4LJWuvj4kXqqOx7M+KLECFlVRDkPt10l54MLIZtbYHkozcG/IZdU8TWr8rSsl03feKp1MGJjgi0
	Ui4p3TawUephIZGv3VAqQu+iPkHFA51KW5GjFVQmD73jzg/L2vVhVqms6/SFArXSm9eYozeanNyVr
	1l1v23nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoOp-00000007oIW-1IWi;
	Fri, 15 May 2026 09:00:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoOm-00000007oHg-3flD
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 09:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE0CB41709;
	Fri, 15 May 2026 08:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40770C2BCB0;
	Fri, 15 May 2026 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778835599;
	bh=b6e0q5E/Z3lguAgVGLZBgj8nkX7SNZuRIxj/ZXgF52A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2+U6Cbb0T2fH/KE8jemF3oQapwHqnAMjJH/w/wJM2wuz+W0eYQBqGA+b/TA1KkEG
	 gVnIqrqMFFrfQh/PCgWCuUn6uCX96qTEi2WlEcmS34WVrrRhTGwT+EAUy8vVAw/8dp
	 lLuZfdQbl3AhdkxtFppY0xAmUZrXhi/1pIsElDO6qB2SjPgpKLvyHEIWRogk5Eyftt
	 Jev9+HypDtQ/sYDVc083yEQP3wPuLmkhKqfmbZdXOO6cSW71Vq5rS20Wb/+otdnmZf
	 ngpMdF2XEkVOzUscjwLRCgLm5B+lQ6KlRopS8kmFs7ipfrQFob+qcJ6DUHNzrooWVa
	 Kry11b78B3m0Q==
Date: Fri, 15 May 2026 10:59:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/2] pwm: spacemit: Add Support for K3 SoC
Message-ID: <agbgG00YENm388dd@monoceros>
References: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
 <20260514233448-GKA3663945@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260514233448-GKA3663945@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020000_934753_5FF58918 
X-CRM114-Status: UNSURE (   9.11  )
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
Content-Type: multipart/mixed; boundary="===============7211763187656280690=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7211763187656280690==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6hgagzjjsephwbw"
Content-Disposition: inline


--w6hgagzjjsephwbw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] pwm: spacemit: Add Support for K3 SoC
MIME-Version: 1.0

On Thu, May 14, 2026 at 11:34:48PM +0000, Yixun Lan wrote:
> Hi Uwe Kleine-K=F6nig,
>   Can you queue this one for v7.2? I'm sending the DTS part patch
> and got a complaint for "clock definitions violation"

I applied it to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

now.

Best regards
Uwe

--w6hgagzjjsephwbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoG4IoACgkQj4D7WH0S
/k7IaQf/RwVZrA1y/tuywL9sMmr3+vfppD8jAunAr0bdirOJvxIVq6Xwbbt1UqL3
x/9+O0qbc+5XUMvwuEc5Sr8XbBiXdY4igJAgS1m/1Up4NIh10qKTiavgCJPGzxor
yUAhKOazg3JUc8TnAY9gYM3A9y4/r2+S/DIKIiYWFDlhjMwYjpQe7IgxtVK+LSjQ
fR81u9XDcqbbnUFd73KU4nVg5bazaK/lTGeTTqoCcdLotfBsASVT5FIMHnoRcNSK
hauzn7Q/YsmrNeyZf/4cd29Ff7EMcOqZnryTnHzoWU4dwCdRP1dUPIdlpHf1P0al
RIDvOVzN1JV9I5J5sULdZZt+H1RatA==
=SHGP
-----END PGP SIGNATURE-----

--w6hgagzjjsephwbw--


--===============7211763187656280690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7211763187656280690==--

