Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A123E71072
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ck20Go7LGmahWVkTG31ojbypHAxDY77Cypo61QnbyXY=; b=4gnMv8t/19askcIbSUi/+aRl+g
	K3tDXv5WS3YZm25zVrA3NCm0Rqa5d/bsGUmcmbyc3EE4ODkesNA3QcutTLmxt3Co1bMEjhqSy7l1n
	yyuyFoZkr8vgoOVTh07xe8LSftDgdQ7y51/YkAsRER4uUKMHNEQCL8zcNKou9HNUm5f3fWwUuI6MU
	XCHU89kWpkv5I3edhCxbad2nMxrVxWsbxaF81Op1XLoeO2v/hAIKY8myfPbZmyG3we3e3Mn7B8HA5
	/Z2JgckyfuzljVWE6AkmL/uqwbbldQJ2Z6LNXElCzcIw2eDryd7XnjQnBjQsMBV7BwdDRTLK0pvk1
	OgEhTCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKER-006CSu-22;
	Thu, 21 Sep 2023 14:00:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKEP-006CSN-07
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 14:00:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3AA661E64;
	Thu, 21 Sep 2023 14:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E527C4E74E;
	Thu, 21 Sep 2023 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695304834;
	bh=HbA5iULXyLPFf2bFXoU3dpV8WI5kxu+YFc1N4jF1L2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vw+SRjXWQEWTEo/iafrfQz8VkQqZ0QyOu2X1ObLsbb+33KbxHPtYkVAgNvlOdiyzA
	 eBYjlMX+xp8eCOGuK6QUBHjlzhTyGcDh9FYMvRJiALBxwTN8NmTj64MAYaetVFn44B
	 9fnzT97R/GeaRHgZ42Z8dFYu9xAoKkRrS5bBXA1D+TH+C44Ew3oZ+fVD5j+qRC6R7k
	 VFwmV73p9uNrsucNeb16quOQ7gL4OmKlGUVp7abKhNZ+ZjF1vmcyo6xxVUDQ0C4gjn
	 HdDs7o27OFH4YMjP4J7QmBiNH0RY7I85P+XSOmwNn/CdQV5oG0aLqQWZeCiuyFM7dI
	 fxhvAj7FncohQ==
Date: Thu, 21 Sep 2023 15:00:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com, guoren@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
Message-ID: <20230921-slot-goal-c03ac4f0db90@spud>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-arrival-bonanza-e335686420f4@wendy>
 <CAHAQgRDh72FLQPOFzn2rhsWmOOaLUO0sKyJwJQBG0Z7qZN_YLw@mail.gmail.com>
 <20230921-1ae70cfdbf983e011d5b6754@fedora>
 <CAHAQgRBFje4mdhE3dZZH=HxED0bUauXBD4yNfQzEnpPSWG5HiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHAQgRBFje4mdhE3dZZH=HxED0bUauXBD4yNfQzEnpPSWG5HiA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_070037_151747_7029CF10 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Type: multipart/mixed; boundary="===============1286687685249609683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1286687685249609683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="muk+u1lqGbjyw/DQ"
Content-Disposition: inline


--muk+u1lqGbjyw/DQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 09:51:58PM +0800, Chen Wang wrote:

> Conor, do you want me to add you to the MAINTAINERS entry too?

Nope, no need. My existing maintainers entries should cover it.

Thanks,
Conor.

--muk+u1lqGbjyw/DQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQxMfQAKCRB4tDGHoIJi
0syUAP4h+gobTYujuawwrF9fvZg3Qn3BF9VaVT5NH2iBnApl5wD+POJWMSSetJWO
NynHZ9xJ51y2szVWwB1MvQmuoRah3gk=
=1ks/
-----END PGP SIGNATURE-----

--muk+u1lqGbjyw/DQ--


--===============1286687685249609683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1286687685249609683==--

