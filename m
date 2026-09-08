Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB5C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOSdiUuyBoutILqm/amoEr3jOk9NhyvKf6CrWjmyvC8=; b=BmodZ8KaxgeS3Aq+EccPWLouc+
	ursgzPnKqEPYsl9xQAZ9XUhNRQBYOshoT8Q712Tmc7B+rRCbqpF7mps12lIzhUDh8y1v2OruVbHS5
	bas+x/hM8ELs7MWEsF2VnRy0lrD65tpNwiee8dkk7AoxXm75NqLyyN5xlL8sdM1Qr+VOW44xzZRqR
	yhEsDJoPP+gam89xRWVTjaVAp5MNJ2GcDYFLkkeFJsWbPAqQxT3oU8Mvm5nXmrzL9CEqP0TVbD/EP
	3E/2DchhAtXClP1WC392v9koiMEAUlpr+WC/58mw8OHHMqre4ZRjifXgWwAgxL9jmAVl9SbLqaUEL
	Xddhq+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zm3-00000009quV-3ZfK;
	Tue, 08 Sep 2026 17:38:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zm2-00000009qtt-32LN
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 17:38:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A162433C9;
	Tue,  8 Sep 2026 17:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846811F00A3A;
	Tue,  8 Sep 2026 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889102;
	bh=bRgy5T5W0KgX9F3ZoSCoTIxqZG0nVr7jNUHrMLEYcTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0D5TMVJUI/WmvzLp2e5LwnkMtTWgZOz8iM5MPle+B4Up1HqvZP7HNUsxhhWcKwTp
	 Tfycp7+59W81EZjVQzGR2mm1kd3yaHVSfx4Ag8qr1Rxwy+a8JwVYLvspdE0hmke1Pp
	 Z0xCoYhlquwl9/iKu9a/GzyGaeYRUjkb0LklS51FcwNj8LFg/mx/wSSa6QGk8cIIgx
	 ww1D9t5P/lsrlUSIMpndJOikA6Lvs6E5iLUaCcGtkKDGfn/Qi2CcP+EXz4mkHmo9Vv
	 QEKfcYKOIccEF3+7zaAGEx6QS+f8XgwJvJjzbo5yla7P6kSnsO9JrOhAIQGz2qz3yQ
	 fLsuPJsVxeIvg==
Date: Tue, 8 Sep 2026 18:38:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
Message-ID: <20260908-lecturer-cornfield-7f701982730e@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-3-7931e5bc86ad@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260909-k3-aclint-v2-3-7931e5bc86ad@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============1179736123464984534=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1179736123464984534==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oQWXLwoO16ML7jtG"
Content-Disposition: inline

--oQWXLwoO16ML7jtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--oQWXLwoO16ML7jtG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBICAAKCRB4tDGHoIJi
0kpXAQC8OSH/32amtCuarJmBKD0X8OJRlr68eC9OrTz06njAQQEAlLoifckm/Qo1
oLzjk0p89N1TMPLXBX4B9xUQMRXRpAM=
=Zs39
-----END PGP SIGNATURE-----

--oQWXLwoO16ML7jtG--


--===============1179736123464984534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1179736123464984534==--

