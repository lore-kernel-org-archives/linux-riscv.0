Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE4C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COqinyFyPukfOb8GcpjFGdU3wn3JmsYuvy1RRCUA064=; b=RHbTG++TrUj+C0LM1MIPArh2pK
	7+B7JL9Sf4i9u4njdYGkQiWNsWSzoHVOItU749tWMw5MNogpk5WiSSTGcT1+IF6w9PNMHQu6xZrO3
	B4Ch7y9HSKt9wQ3F+ntKHrtwKcCmjRynRki6NdKMYbeJgHH//e4q3EJS969PpuUPlVdjSQc79H+n4
	HFfLpKn24m9+HGwEC2JqwIwZiq/n4YsX48Ijk0Xl/H/k41L3v/AYTC9fV5sPkVFthRDpI6OjZELaF
	UF50vwQSMF2JkbvbkSMWjXHJ8vPzrJu5tG32ZLu7WJL/oIj0e+RDEuv+CgR1TezHzF9EqPupNqKEL
	r+hxoeiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs6K-00000000h3D-2Q63;
	Wed, 19 Jun 2024 09:59:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJs6I-00000000h2G-0rHa
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 09:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94E05CE1EEE;
	Wed, 19 Jun 2024 09:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281A5C2BBFC;
	Wed, 19 Jun 2024 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718791170;
	bh=rVkec0lmYTeD+HpXP+XLA09ezAGhgUX+iEtNr7e0C8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmO5PGXNDpdmKwsPGSiskI0naNkfBwnko/Cmwg3mM8rDLVKWfkATunk7ezM4pWM4D
	 orJsnpcjABl3Y335KrMajXI7BNqscmYGKgM0gczpaRIT+MAyX8AwaKWhO4a4GhNjom
	 1p44htm7sl+q3LN5hASpFpvKc7AAfIo5+4iIkjSHBI/n18zdp517sakDtxnDscFh6H
	 g5g7om0vzD/in16jyDsqjA1nHxWvojRqP+aG4SRRouta+64idNQ11uTg0e2cx3+3tf
	 XgcMsn7pXVa4NhCUwN7YQvVAFZlzjwtYue5NTnaYhe3WU21Yb/Ktis3XGt9xSmdao8
	 mFixNtK48uwbg==
Date: Wed, 19 Jun 2024 10:59:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v4 4/4] riscv: dts: add mmc controllers for Sophgo SG2042
 SoC
Message-ID: <20240619-tissue-cornmeal-b8fde286df94@spud>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
 <e2d3b19e06fa29116b8032addc70c8dc1ec3866e.1718697954.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <e2d3b19e06fa29116b8032addc70c8dc1ec3866e.1718697954.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_025934_448334_A498335A 
X-CRM114-Status: UNSURE (   6.35  )
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
Content-Type: multipart/mixed; boundary="===============1743857564677151392=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1743857564677151392==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oARMAadtnvvW9ND+"
Content-Disposition: inline


--oARMAadtnvvW9ND+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


$subject: riscv: dts: add mmc controllers for Sophgo SG2042 SoC

Could you add a sopho: prefix in that please?

--oARMAadtnvvW9ND+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnKr+wAKCRB4tDGHoIJi
0uQYAQCLDnQ8kuVplcSQhCJRGya0nlVeK4NRhWCT2y1i+ALS/QEA3SIUtrg6cbYw
l1eeyKul0LIKuHtMo89emedzhuEbdQ8=
=WwOe
-----END PGP SIGNATURE-----

--oARMAadtnvvW9ND+--


--===============1743857564677151392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1743857564677151392==--

