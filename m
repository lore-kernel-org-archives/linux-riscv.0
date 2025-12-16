Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD70D609BB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inTC3D57WLgNwUoN0doLyFCpuKl2S+WQ1VGEy7p34XM=; b=j0bx68NqkFdxkcqkP44ArE3qCz
	wT6LnPY8T+ee1iJ2TsfdJ9SsVjZYUT55oBaO+ejEkUCT/tNAnkB13oN2QLmAaECbkQLDbelGCEWy/
	QddFvRzACXHfxp9xeb9XplWY/0nkP5HG1Ok9bxUIlhB84ftHFGwbOJoWxT6i3mQ3wNr/sbcIrFQe7
	soxscLrT7j7AxT6pJeja3pN7sniaGtzX1rD4QKaOajchYCIUG9uUYhkJ48pg2wzW1e4rliCr13L0U
	Hhzykijqn+wSPFDZu58KmydAhBo0LHolwo/ADQ6aBp1Gm1uhe3USSZdXfqUH/fBPFCX2NKoMdDMgr
	eIEHKWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY7A-00000005Xzq-48oF;
	Tue, 16 Dec 2025 16:41:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY79-00000005Xyj-0KUZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 16:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C606843F6B;
	Tue, 16 Dec 2025 16:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11611C4CEF1;
	Tue, 16 Dec 2025 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903290;
	bh=Se/DK8m93a4S91149Yg8i4Gry3opMMWQfbXS3uw4q1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9dBlgt7+8r02618IAf+x+IefVeRB44+xlz3X0Pj9ZBBeZm6ENDYcfzDEIobH5YE2
	 6kYh7UstB7R24S/U+uuNB4uYpKe2FjIbCt+4qpK4mkiir3yQDDc3lfc8FxmT0RX+Mx
	 0guEUdH0Fp2eriqmAezfH+iS+Gn0SkR9oNVXyoJimVZjrRJzla3TljFoMdMHIDh8pB
	 pVGZcsASXRkl9DilDaNItuQpKQ5zFSJth9ZkNqW3YMSV6RXmtAcbKIqHnW3IjjqMqE
	 ayeKXb0LfAwqYvbjIlXZR7fBIEPGGmc9aAxY6sbHuvugKk4G5PULWHHilGAAeAHqD5
	 dCzrJrV6NudkA==
Date: Tue, 16 Dec 2025 16:41:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: serial: 8250: add SpacemiT K3 UART
 compatible
Message-ID: <20251216-reforest-list-ceb775dc9dbd@spud>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-5-a0d256c9dc92@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251216-k3-basic-dt-v1-5-a0d256c9dc92@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_084131_131297_C77D2192 
X-CRM114-Status: UNSURE (   5.95  )
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
Content-Type: multipart/mixed; boundary="===============1703420738236597678=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1703420738236597678==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DPFQEofot18lifdU"
Content-Disposition: inline


--DPFQEofot18lifdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DPFQEofot18lifdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGLswAKCRB4tDGHoIJi
0g1NAQDL9fx7G+lJVeeNHoBHTDkYugqV7bhsvIgVM3pX/jBY+QEA+emY/EGgQGnT
Y0ExzgcquFyQ1T6l5rM0hgNUaLylNgc=
=y5Wj
-----END PGP SIGNATURE-----

--DPFQEofot18lifdU--


--===============1703420738236597678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1703420738236597678==--

