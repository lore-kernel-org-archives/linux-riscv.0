Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8E7C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJuTnS4M2/4ioWlXeYx8KThvU5dvPMJjaa5hpnFXyuA=; b=wg5q9HislCBzGVWaX+TLoovoPJ
	rGHF5nuQeBpXT6T+W4Z0Halfati2SUFI//SKrXF4vSF+DDYMQZpOXJb+V1GLpC4z25J901ueceA0c
	34clqFMnyDpcqCE0v5R3lRpRXzuPOZMg8gy3TLmS2R82W/rk9LQUglXmfpEPizVrhuhvGDm6nZtv2
	p4xw8KJKVzl2DzL5UI/QUP9qrTalpdIO/87GJ2ChCYMtFp1jvWnwMbEaHLK78udRd63D04sz8l59j
	TZEWcGI37ps430H0tVipcYBdhDABiTdG2XB1G052FYuyV3RDdgpj77SXfLCodjRTbIoYsMDbv2T7r
	zFriCcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYsS-00000001EoH-1k7k;
	Thu, 13 Aug 2026 17:06:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYsQ-00000001Emm-3yzJ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 17:05:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44E2940471;
	Thu, 13 Aug 2026 17:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EDC1F000E9;
	Thu, 13 Aug 2026 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786640758;
	bh=/h6Iq0inS+AwrrSVQR2zj2wicIPfSR0HLOnCyN70iOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPdVXuUL7CNicaO9tDK29n2+Vok9ETu+USBFzNcIZqj/OX6McK81+T7NymCeAitmN
	 XNwvqfD/Mg94mhu0OgX+0AmW3jF5JsTWXg5fWadRN7slHvuH8ERMElC2Cic21kNFtA
	 uDudOQMoF/aRi/znng4bCc+IXKvSiA/E1Jz45iXiaUCR6sG24KBI5ZG44skVEFf3FJ
	 D9wGUORoA7rzLAyg/P8+1YuAX+2k8tXTpYgBfn/3He9APxjUaHJMP/SLphWPGpLmon
	 F8GE6nbFrvOLYNXamEJ1YIC9aAMygA4ciOKGpYA5vjqT59I2jXuHxFDB9RoIBoR1HA
	 SmJCES7UOfM9Q==
Date: Thu, 13 Aug 2026 18:05:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Message-ID: <20260813-mold-fresh-29e1760a301a@spud>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============2720757998135758448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2720757998135758448==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NXgwmi4Kg0m2Fg8J"
Content-Disposition: inline

--NXgwmi4Kg0m2Fg8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NXgwmi4Kg0m2Fg8J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan35cAAKCRB4tDGHoIJi
0nK4AP9ZcJeR028IZ2nwcQdJmTyUhrGn5cq8v2TxJ9nGfTUnYAD+I2lnjEePX8Jr
0aIDUkcEgjysaF6bMW02XACuofwD3QU=
=FXzw
-----END PGP SIGNATURE-----

--NXgwmi4Kg0m2Fg8J--


--===============2720757998135758448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2720757998135758448==--

