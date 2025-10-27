Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC63CCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poMcKtDIHzlH/s8MladDX+cWztZVH5l/w2mxgDsvn1U=; b=ptMK45xu7CRDKkybX2pcUPD3nU
	Hey9Qkfh9DySa5OZ66z2a9kyoEXx8rRldw/scmOq0rcKsKke5uNEH3BBraaYV8AKUX+ZbI6yopb8M
	uiXoLevKJqpX2gTDLN2Ui7ZfAHUDRAHylE748Tg1rjuNijyF/rbklTbxcsPSsGFnkeGoKk10f5B8N
	qoqPsDnf8SfIAIOxBy+YZDZ/Tq+lyjCjmKGMdgUOh7MNGgucKWrgoqDwlaA6qg2ptObcZktQV6XdT
	iz1oQGBqd32ZdQY5S4yWKUoci07yk131nyrC9f3q1ZYc7eKLOvhCQZ6929Jl3FazsiUXGiDOMC3gk
	E2PAib+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM1l-0000000Dr0E-1m7e;
	Mon, 27 Oct 2025 12:08:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDM1i-0000000Dqz1-2jG2
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 12:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC88E458C6;
	Mon, 27 Oct 2025 12:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34A2C4CEFF;
	Mon, 27 Oct 2025 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761566921;
	bh=WuGfIQ+tG2jneTygaVEiQJvQSrmd5e58lVq0BP7dw44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDzZsf2Pb9QWorLgRaQo0kRdbyrY6T9ANXI6cMpDVAL06ACAgFDrqDn5qBUxee2yH
	 zYIUMBLAi/Ik6jgr+lN08HXD9WjCcAFqcDdl9HrrCXvbuzT+lTfjU8OX7NkbNO5wjx
	 r7lzjsbx6S7LEX7U/WooITDDFKvVnnm5uGrBe3ZAGJSvvQ+cnkmlS2eBhlXqruUXKf
	 e/s9Hbul7Xzuei3n8QaO+BHhJGfEuQJa7L2+0nmAF9WR8Q8IbvFYrmXWst6ud4xhnM
	 6AKJ1psai8xuL27Ph6iw5huiDkxIIZYOOSMSQe6tmIaSqEsFNqwTihIdzsseoe4Nv6
	 6dHHsh/VgXmTA==
Date: Mon, 27 Oct 2025 12:08:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Message-ID: <9964721d-eeca-491e-9700-13f7ab66c4d9@sirena.org.uk>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com>
X-Cookie: How do I get HOME?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_050842_709320_E8C90F42 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: multipart/mixed; boundary="===============5731291170621231517=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5731291170621231517==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qgx8naedt5U4Gp/s"
Content-Disposition: inline


--Qgx8naedt5U4Gp/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 01:48:08PM +0800, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.

Acked-by: Mark Brown <broonie@kernel.org>

--Qgx8naedt5U4Gp/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/YMEACgkQJNaLcl1U
h9Ay0gf+IgmWmQeq60zu9vsu+n6e8+NNPmt9Sn7rEiF2HnhwwYuV9H0gcXPhlyus
mgyiWSCDo2vH+edAY2zHFb7KgWtGrG31Bf5jTpaF5QtG2x5ZcpNgRhnodKTBEFff
ovMpQXPMzHeu/1fGbE081rV4bc6iQ3Vn+Rbl7giqaqZ98a/ibQZUcset34yl/UTu
9bQWFHzI//e0sl8UnMsyk0E0VmKKdqCjHlneRqmYhmB+1/GNEiTeRK2P2O4XwOuw
D0nhTEaXmm2OIlIBRMezE6gsnAptWdpFrBal92/CBNesEZ4PTu3NdqWQkOOfekG+
eRMz8He3JKvL5pb2PFELkRxo5hBr8g==
=Vfcb
-----END PGP SIGNATURE-----

--Qgx8naedt5U4Gp/s--


--===============5731291170621231517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5731291170621231517==--

