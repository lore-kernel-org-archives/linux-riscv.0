Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE72C56208
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5L2TxtXYE9WE6r27j8KI0rOScTR3It9SldfruBHdnI=; b=EEmI2qRTo4k1aAwxStDz/gPy8P
	31LOUP1mUHINJ5Ftoaa/WTTHDUKmh2G8srE7Tfvy6IDINdl/SbJ2hdEsEL7Dmlk4S/kBTKD/l7/Od
	QNqW3XYSfGgFyf/4PCDSRzNxhaaouywezEl4iapTndLhPQky9szp1q9lV25ApbSasZ+ifqaTBa9En
	g23vnXuAMVc5SHnAJiHmQz5/fLvl01DTbv/uOGdXoISoi2PDPseQhBgupUWHGkbSIHLeQM9DbXS92
	GjQcfQzp4gaN1Uq1Uj/FkW+SL6ZFLTeppVdDw2YwD4zfpKgbpb/9i9nI7ZIgzfJTG5gEc3iKFqcpf
	JWMbtbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1I1-00000006Flv-1Ze2;
	Thu, 06 Aug 2026 16:49:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1I0-00000006Flj-0w6p
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 16:49:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CB0660AB0;
	Thu,  6 Aug 2026 16:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C741F000E9;
	Thu,  6 Aug 2026 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786034991;
	bh=HS0j9CSHJtdR8jylToYQH7EbtA4wpAyzLO3Ch8uZ+II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nQb3UqCXwIojFYjCbZMD43DQGEPe9EY97jfB6qvZIqkXeK5dl7dHGb7TBnlS2wsii
	 CmrGVXMHyum+wdfRi18sfiHWN8MQNRjrXXU4lKZkXLL3pAdptkZMJnLM+ENyQLsE+D
	 IWQH6KrnBtLdXeL+gK8M/8FnNVUZmIXPRaQ/g0GPQKhd5I+2fpCsoKULKMO98dy0v6
	 Jv+pQiSDw7YNmK9Fn9UIdk+c2dWZzNehlMB5bE1OnoIt4/0XookQbPnJpWlJVQSgld
	 4dfIv9dHFY3vnuMS0NnUC2MwhMLYyQUusUqYGw7o28kJky2DVQ11Z0wn6qHuUt6dOd
	 Y/49AHFzYNUig==
Date: Thu, 6 Aug 2026 17:49:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260806-staining-delay-2e2de73acf04@spud>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-6-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260806122553.182449-6-changhuang.liang@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Joel Stanley <jms@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>, Junhui Liu <junhui.liu@pigmoral.tech>, Daniel Lezcano <daniel.lezcano@kernel.org>, Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============1482760016637792203=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1482760016637792203==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pGHOTuhWQn7xb29Z"
Content-Disposition: inline

--pGHOTuhWQn7xb29Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 05:25:53AM -0700, Changhuang Liang wrote:
> +
> +	clk_uart: clock-uart {
> +		compatible = "fixed-clock"; /* Initial clock handler for UART */
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};

I can pick this series up on a provisional basis for you to work on top
of, but I won't be sending a PR for anything that contains temporary
fixed clocks.

Cheers,
Conor.

--pGHOTuhWQn7xb29Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanS7KAAKCRB4tDGHoIJi
0iagAQDltB0ubxtR+ENC3xsC5IF+brT2jfIXMGw9MNI8fr/kdwEAnhEVjBsJUsO6
ShNhkVqdAqs1XpPWOc7XmlLKcWDd/w4=
=SOGA
-----END PGP SIGNATURE-----

--pGHOTuhWQn7xb29Z--


--===============1482760016637792203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1482760016637792203==--

